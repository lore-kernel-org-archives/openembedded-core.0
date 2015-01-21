Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id E54FB71144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:11:23 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so4191860ykq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4moRmk6s4SJGBYHsxHmDw/ezdU4YOOfRjK5aZPQ7qsg=;
	b=NhaBUktba5GrEi1+y6xwLGITeDfPCqAuTXl67wkNpjX8W+6O19KLPPuf352Pfdf2EW
	vwAZ87/Q5mcvwsLe18MeWCh3bO/CMhYFi1CaAIylLa7v2JkdkNzIOA56AkwhohuUqH5+
	nn1aDGp2NMwwOBzPZPkVdrTM8zcO8dm/DTJDQodP7OSuDGR0VfmaTzAgg8vB1FOLnw7E
	Gdd4tHhuZJWTmi9ZbtglIQknV2JISdp12DirWOKUE7/z8NS3HrVN4tBVDuWEmVYZbb8J
	W5Ga8ZX6CejNhf53G6sv3xJjX2ote5x6bgkCX2zqP//mWVdY6cCMEnp2uayKx9EDNEDo
	dG1w==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr27708038ykm.50.1421871083510; 
	Wed, 21 Jan 2015 12:11:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Wed, 21 Jan 2015 12:11:23 -0800 (PST)
In-Reply-To: <20150121191123.GH20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
Date: Wed, 21 Jan 2015 18:11:23 -0200
X-Google-Sender-Auth: qIaNuf6umrW-EocupoGH7F5vUQY
Message-ID: <CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Wed, 21 Jan 2015 20:11:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
>> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ...
>> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
>> > @@ -0,0 +1,36 @@
>> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
>> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
>> > +Subject: [PATCH] tools: env: fix build error
>> > +
>> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
>> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
>> > +is defined.
>> > +(I do not think this is the right way to fix the problem, but
>> > +for now I do not have enough time to take a close look.)
>> > +
>> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
>> > +
>> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
>>
>> Is it necessary? In meta-fsl-arm we don't have this patch and get the
>> tools built.
>
> Really? The patch above is rather self-explanatory. The issue was confirmed by
> U-boot maintainers and the workaround provided by one of the core developers.
> I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
> defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
> whether your platforms are affected or not. It does affect our platforms
> (among many others), including beaglebone.

I think this is for the cross tool only.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

