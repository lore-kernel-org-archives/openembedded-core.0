Return-Path: <rapphil@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3807251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:50:28 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s11so395015qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 01:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WR85VbN13ceaP39vvReeH95FDFvn6Jna2atNcb8TgRE=;
	b=YcW59sxbDVTo5ykXRhlfnHgPL/TcOshzJ/Og29ONOY1NxbKQBnnQGeTUD3249fboG9
	6jBpE+gm9w6uR8Vl3FGPB5We3gxgjzfmuE7XrzCUCAgJS+1+1WiYHR8il8BcIc3F9XXI
	yIxvyx2VttCsNF4Kw7OLP7OcmqpkVwUL/6LiMQ2zK7HdIs78X7dVW5LbuqHssag4ipFO
	CkhpLwI1wKRCdHu0sOenF2wK+Ue85GzVLoUSTqhosv319rBP7gcO0XPBag4SZonSQgsi
	j+Khz+nNJ88p+Jg8byk2qztXFSPnJsAiHeY3qCsh80t7RmltUXztYYCg/UcoBVm6WtQO
	PlKw==
MIME-Version: 1.0
X-Received: by 10.224.121.79 with SMTP id g15mr869201qar.68.1421920228896;
	Thu, 22 Jan 2015 01:50:28 -0800 (PST)
Received: by 10.140.240.67 with HTTP; Thu, 22 Jan 2015 01:50:28 -0800 (PST)
In-Reply-To: <20150121202005.GK20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
Date: Thu, 22 Jan 2015 07:50:28 -0200
Message-ID: <CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 22 Jan 2015 09:50:34 -0000
Content-Type: text/plain; charset=UTF-8

Hey Denys, I tested u-boot-fw-utils-cross_2014.07.bb in Ubuntu 12.04
and got the same error .

Can you confirm that this recipe works for you?

On Wed, Jan 21, 2015 at 6:20 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Jan 21, 2015 at 06:11:23PM -0200, Otavio Salvador wrote:
>> On Wed, Jan 21, 2015 at 5:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Wed, Jan 21, 2015 at 11:17:19AM -0200, Otavio Salvador wrote:
>> >> On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> >> > From: Denys Dmytriyenko <denys@ti.com>
>> >> >
>> >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >> ...
>> >> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
>> >> > @@ -0,0 +1,36 @@
>> >> > +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
>> >> > +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> >> > +Date: Wed, 3 Dec 2014 10:22:50 +0900
>> >> > +Subject: [PATCH] tools: env: fix build error
>> >> > +
>> >> > +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
>> >> > +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
>> >> > +is defined.
>> >> > +(I do not think this is the right way to fix the problem, but
>> >> > +for now I do not have enough time to take a close look.)
>> >> > +
>> >> > +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
>> >> > +
>> >> > +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
>> >> > +Reported-by: Denys Dmytriyenko <denys@ti.com>
>> >>
>> >> Is it necessary? In meta-fsl-arm we don't have this patch and get the
>> >> tools built.
>> >
>> > Really? The patch above is rather self-explanatory. The issue was confirmed by
>> > U-boot maintainers and the workaround provided by one of the core developers.
>> > I'm not familiar with meta-fsl-arm, but I guess you can grep your platform's
>> > defconfig to see if CONFIG_ENV_VARS_UBOOT_CONFIG and others are defined and
>> > whether your platforms are affected or not. It does affect our platforms
>> > (among many others), including beaglebone.
>>
>> I think this is for the cross tool only.
>
> Versus what?
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

