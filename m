Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D61070897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 04:19:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s784J2KO008918
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 21:19:03 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 21:19:02 -0700
Message-ID: <53E44FC0.8020408@windriver.com>
Date: Fri, 8 Aug 2014 12:19:12 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>
References: <1407132320-22038-1-git-send-email-rongqing.li@windriver.com>
	<53E1E5D6.5030001@windriver.com>
In-Reply-To: <53E1E5D6.5030001@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gmp: uprev it to 6.0.0
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
X-List-Received-Date: Fri, 08 Aug 2014 04:19:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/06/2014 04:22 PM, ChenQi wrote:
> There's a failure on autobuilder. Could you please check whether it's
> related to this patch.
>
> ERROR: Unable to install packages. Command
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/tmp/sysroots/x86_64-linux/usr/bin/smart
> --data-dir=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/tmp/work/qemux86-poky-linux/core-image-full-cmdline/1.0-r0/rootfs/var/lib/smart
> install -y packagegroup-core-full-cmdline@all psplash@i586
> run-postinsts@all packagegroup-core-ssh-openssh@all
> packagegroup-core-boot@qemux86 locale-base-en-us@i586
> locale-base-en-gb@i586' returned 1:
> Loading cache...
> Updating cache...               ########################################
> [100%]
>
> Computing transaction...error: Can't install
> packagegroup-core-full-cmdline-utils-1.0-r6@all: no package provides
> libgmp3
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/197/steps/BuildImages/logs/stdio
>
>
> //Chen Qi

I can not reproduce it, maybe related old cache.


-Roy

-- 
Best Reagrds,
Roy | RongQing Li

