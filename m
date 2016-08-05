Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA2D738AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 02:47:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u752lsRi009195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Aug 2016 19:47:54 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 4 Aug 2016 19:47:53 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
	<CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A3FE58.8010704@windriver.com>
Date: Fri, 5 Aug 2016 10:47:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Fri, 05 Aug 2016 02:47:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/04/2016 11:17 PM, Burton, Ross wrote:
>
> On 27 July 2016 at 10:34, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     > I still get the same error after your patch applied:
>     >
>     > configure:16513: checking for perl
>     > configure:16531: found /usr/bin/perl
>     > configure:16543: result: /usr/bin/perl
>     > configure:16554: checking for perl >= 5.8.1
>     > configure:16561: result: 5.18.2
>     > configure:16565: checking for XML::Parser
>     > configure:16571: error: XML::Parser perl module is required forintltool
>
>     same here
>
>     http://errors.yoctoproject.org/Errors/Details/73330/
>
>
> I don't understand how as my patch literally removes that block of code from the
> intltool macros.  Can you still replicate this, and if so can you save the build
> tree?

I can reproduce the problem every time on my host Ubuntu 14.04 64bit:

local.conf:
MACHINE = "qemux86-64"
INHERIT += "packagefeed-stability"
PRSERV_HOST = "localhost:0"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

Error log:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rbt/errlog&id=9e34fa2d6eed6332d376c341113d5dd386c5d200

I guess that you can't reproduce the problem is because you have XML::Parser
installed on host ?

// Robert

>
> Ross

