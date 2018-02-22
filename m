Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id DBE446093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:59:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 06:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="202972426"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.249.67.7])
	([10.249.67.7])
	by orsmga005.jf.intel.com with ESMTP; 22 Feb 2018 06:59:52 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
	<1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
	<CAJTo0LYWYmk5Ch9q19Bzf6taggCsHvaZqJHdF2FPy3tbYVJBsg@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <35726aa0-9847-9517-2094-6d11e85f33cd@intel.com>
Date: Thu, 22 Feb 2018 22:59:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYWYmk5Ch9q19Bzf6taggCsHvaZqJHdF2FPy3tbYVJBsg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gstreamer-rtsp-server: remove unnecessary dependencies
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
X-List-Received-Date: Thu, 22 Feb 2018 14:59:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/22/2018 08:26 PM, Burton, Ross wrote:
> On 22 February 2018 at 05:45, Anuj Mittal <anuj.mittal@intel.com
> <mailto:anuj.mittal@intel.com>> wrote:
> 
>     Disable building of examples and remove dep on libcgroup which
>     was needed, if present, to build only one specific example.
> 
> 
> Are the examples installed?  Might be worth making this a packageconfig.

No, they are not installed. Same like gstreamer.

>  
> 
>     Make building of tests optional.
> 
> 
> Are the tests installed?  If not then we can just disable them globally
> until someone turns them into a ptests.

These are also not installed. Even when it's enabled, it's built when
make check is invoked ...

I will disable them in v2 and evaluate later if these can be used as
part of a bug that asks for more testing of gstreamer.

Thanks,

Anuj

> 
> Ross


