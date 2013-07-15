Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6630D6A464
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 03:02:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6F32SJQ028345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Jul 2013 20:02:28 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 14 Jul 2013 20:02:28 -0700
Message-ID: <51E36642.4060208@windriver.com>
Date: Mon, 15 Jul 2013 11:02:26 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1373607104.git.jackie.huang@windriver.com>
	<3393c80c31d82ac23afcddd39b1b24a9b5c1e696.1373607104.git.jackie.huang@windriver.com>
	<1373618076.21102.48.camel@pb-ThinkPad-R50e>
In-Reply-To: <1373618076.21102.48.camel@pb-ThinkPad-R50e>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1 v2] kbd: Limit the kbdrate application to x86, mips and sparc
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
X-List-Received-Date: Mon, 15 Jul 2013 03:02:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/12/2013 4:34 PM, Phil Blundell wrote:
> On Fri, 2013-07-12 at 13:42 +0800, jackie.huang@windriver.com wrote:
>> The code relies on hardware specific memory locations to access
>> and modify the keyboard repeat rate.  It also requires read/write
>> access to /dev/port which doesn't exist on every architecture's
>> root fs. The defect was raised for Qemu PowerPC but it also fails on
>> ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop
>> Bus) device and not compatible with an Intel driver.  There's also no
>> indication in the documentation that the code should work on anything
>> other than Intel architecture but it also works on MIPS.
>
> This reasoning seems slightly spurious.  There do exist ARM and PPC
> machines where kbdrate works, it's just that the hardware emulated by
> qemuarm and qemuppc doesn't happen to fall into that category.  Equally,
> there are certainly mips machines (and might conceivably be some
> x86/sparc ones) where it doesn't work.  So I don't think you can make
> any sensible determination about the supportedness or not of kbdrate
> based on TARGET_ARCH alone.
>
> Of course, the right answer really is for rate setting to go through the
> kernel driver (which knows what sort of hardware it is using) rather
> than for kbdrate to go poking at random I/O ports.

Thanks Phil, I will re-work and do more anaysis on it.

Thanks,
Jackie

>
> p.
>
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

