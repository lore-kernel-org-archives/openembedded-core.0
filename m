Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 47DA879247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 08:29:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2018 01:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,250,1531810800"; d="scan'208";a="82525120"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.195])
	([10.221.21.195])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2018 01:29:37 -0700
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180817042938.59347-1-zhixiong.chi@windriver.com>
	<20180817042938.59347-2-zhixiong.chi@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <0710103a-91d4-1e3b-aad4-6286d45703f2@intel.com>
Date: Fri, 17 Aug 2018 16:29:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180817042938.59347-2-zhixiong.chi@windriver.com>
Subject: Re: [PATCH 2/2] sdk: don't install glibc locales for mingw32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 08:29:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2018 12:29 PM, Zhixiong Chi wrote:
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>> ---
>  meta/lib/oe/sdk.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 153b07d76b..5d7e4ed2ac 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -88,6 +88,10 @@ class Sdk(object, metaclass=ABCMeta):
>          if self.d.getVar("TCLIBC") != "glibc":
>              return
>  
> +        # Don't install locales for mingw32 SDK_OS
> +	    if self.d.getVar("SDK_OS") == "mingw32":
> +            return

The alignment seems off here ...

  File "../meta/lib/oe/sdk.py", line 138
    if self.d.getVar("SDK_OS") == "mingw32":
                                           ^
TabError: inconsistent use of tabs and spaces in indentation

