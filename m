Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A5CC8744F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 06:42:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jul 2018 23:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,396,1526367600"; d="scan'208";a="58954925"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.182])
	([10.221.20.182])
	by orsmga007.jf.intel.com with ESMTP; 23 Jul 2018 23:42:26 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180723190928.27368-1-raj.khem@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <d73b4b20-e8e4-658c-bef9-769142560e19@intel.com>
Date: Tue, 24 Jul 2018 14:42:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180723190928.27368-1-raj.khem@gmail.com>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 24 Jul 2018 06:42:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/24/2018 03:09 AM, Khem Raj wrote:
> This has been an opt-in for so long, some distributions e.g.
> poky-lsb uses it by default however, since most of linux
> distros have started to default to these settings for security
> enhancements, time has come for OE to make it default too

Should be removed from poky-lsb in that case otherwise gives duplicate
inclusion warnings.

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/defaultsetup.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> index ca2f9178d2..352e279596 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -1,6 +1,7 @@
>  include conf/distro/include/default-providers.inc
>  include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
> +require conf/distro/include/security_flags.inc
>  include conf/distro/include/world-broken.inc
>  
>  TCMODE ?= "default"
> 


