Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7F171B31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:58:36 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id x20so5155555oix.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 16:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=xFd9mDea5t8fG8iuZVredISzji4sNwFq2DXg/U12qyw=;
	b=wvte96TJye9qSGK+cPhQBn9EmLiWxkM/N6AKzT0k5DHU2/aIZf8QCK28YlXtTIvoCj
	+x6R7miowZZ3uftwvUech8OxKZZj59R4Ba1R5ti6NTF2xKlW4Ndl2FaB6VCMI4Qz9y5r
	is0AeYWBS4VEO+rE1hofCW0DehMKKL1MpqCLSrCx8APib17hetZwAbVezILBH+qCjE/a
	GGvlCNiq8bTTJniGJ3XN3dMR/AMJ6ByXFNKNbJ74obZZjVlYT8Vh1wfXOJ0dC9YfVH0s
	VUit57o3X6rtLlG0K6YU55CtmHBisggpbP4mhCibIscnyvCn+MfVnECbH2CGZuFs7yRs
	/Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=xFd9mDea5t8fG8iuZVredISzji4sNwFq2DXg/U12qyw=;
	b=o3FWR+e9k2WnumYS7Xvn95IrR/wgZ8JI2qXAv41ZNjBGUT3dWBR09FHsAbmAg5ZoAP
	10il5DBx+3qFbpckujoMtKBw0KJZCPd1bqagLRtXEofxKiHIQ3KBiqkQvr5/7Id0cpOI
	pLjWSboW8BjL6EJZWZAGRN4yqpBBBoW+GUCGrTxMqw6sSI3Jc47lwhaCiRriIqFxhg87
	pEkYUkvEOQ29MSYCOR/fZ1MCZgdWG/Z9HEyxA1+lz3jqyrtu+VdF6UhSxHe0i8ciwSPa
	EGxPi5NZfLR73QlqRFosV/saxB+v+tWOUYITtNxobajO2D8lJ/ekJDFW+ti4arg/hwB6
	jAFA==
X-Gm-Message-State: AKGB3mId7FyQVHTA7Ls+GwQNBSPplH+Fx5eu4m8IN7v8ttzEGrjEII4y
	PPu5KYWa5eJro3/LDezCymF9/rxO
X-Google-Smtp-Source: ACJfBotUihLl8krUX4zXdVRI3p6UU/p9vBROuusQxKt2KnREun05iehiU/RD4Gr8sYN4zlZvvvu/PA==
X-Received: by 10.202.57.198 with SMTP id g189mr6088678oia.26.1513299517576;
	Thu, 14 Dec 2017 16:58:37 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com.
	[74.125.82.180]) by smtp.gmail.com with ESMTPSA id
	e25sm2592135oth.35.2017.12.14.16.58.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 16:58:35 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f180.google.com with SMTP id e74so6542277ote.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 16:58:35 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr6068956oth.370.1513299514941;
	Thu, 14 Dec 2017 16:58:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Thu, 14 Dec 2017 16:58:34 -0800 (PST)
In-Reply-To: <20171215002257.GI9221@denix.org>
References: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
	<1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
	<20171215002257.GI9221@denix.org>
Date: Thu, 14 Dec 2017 22:58:34 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqOpuhz-EOTY8bMj-x7s4gr7wY=FY_WhjwXpCgB0c7dnQ@mail.gmail.com>
Message-ID: <CAP9ODKqOpuhz-EOTY8bMj-x7s4gr7wY=FY_WhjwXpCgB0c7dnQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Fri, 15 Dec 2017 00:58:37 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, it should be backport and the header is to be included in the
patch file, not on the commit log

On Thu, Dec 14, 2017 at 10:22 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Isn't it "Upstream-Status: Backport [URL]"?
>
> Also, what were the changes in v2 and v3 of this patch?
>
>
> On Wed, Dec 13, 2017 at 03:52:29PM +0100, Kristian Amlie wrote:
>> See the patch for details. This patch has already been applied
>> upstream, but we need it for v2017.11.
>>
>> Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
>>
>> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
>> ---
>>  .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 41 ++++++++++++++++++++++
>>  meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
>>  2 files changed, 42 insertions(+)
>>  create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
>>
>> diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
>> new file mode 100644
>> index 0000000..6aadae4
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
>> @@ -0,0 +1,41 @@
>> +From 2d3078f3c0bd0656dadf6341888d608c0fe921ea Mon Sep 17 00:00:00 2001
>> +From: Stefan Agner <stefan.agner@toradex.com>
>> +Date: Tue, 14 Nov 2017 15:47:18 +0100
>> +Subject: [PATCH 1/1] envtools: make sure version/timestamp header file are
>> + available
>> +
>> +With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
>> +the fw_env utilities need the version.h header file. Building only
>> +the envtools in a pristine build directory will fail due to missing
>> +header files.
>> +
>> +Make sure the header files are a dependency of the envtools target.
>> +
>> +Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
>> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> +Tested-by: Peter Robinson <pbrobinson@gmail.com>
>> +Reviewed-by: Simon Glass <sjg@chromium.org>
>> +
>> +Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
>> +
>> +Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
>> +---
>> + Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 61fd973..f8c66a2 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
>> +             false; \
>> +     fi
>> +
>> +-envtools: scripts_basic
>> ++envtools: scripts_basic $(version_h) $(timestamp_h)
>> +     $(Q)$(MAKE) $(build)=tools/env
>> +
>> + tools-only: scripts_basic $(version_h) $(timestamp_h)
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>> index bfdf1a0..65f1228 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>> @@ -12,6 +12,7 @@ SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>      file://MPC8315ERDB-enable-DHCP.patch \
>>      file://10m50-update-device-tree.patch \
>> +    file://v2017.11-fw-utils-build-fix.patch \
>>  "
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

