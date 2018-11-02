Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0438A79DEA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:01:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f8-v6so1174770pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=JgtuTqfBhICUVjVAcMwQsAjCTpAWNl/Ee//Wp+sBS/4=;
	b=Q+K/rCi5K4utJHiesdbPeN+QgMOV/suahSv5W83mdDDMuFVDJ1zeN3k//1Mn6Min8+
	2cu7R9VFrvbIztk/9bKD/ztYU/UBatiDIJlG1wYU29dRXw6ihTgdwve+/4Qjc16eekbw
	VABnzpcz8B8VMy18ZD8J9G9fU+gXr4FVah7Gsa3z8IS5VMcdeoM9riYm7HU9vagrmz/W
	SQPQ5DVgnOvPf9rkhlLhPtBAfSijY85s6KAmdHdC2zm4Kzp4ITpuwMKxft7zobouJV6j
	piWiIZD2JArnWvHmwNqlytoCtHHBhcDzCqVc6z7B4aRrnI4XzE4aqo+E2VKSso2+MF7X
	J9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=JgtuTqfBhICUVjVAcMwQsAjCTpAWNl/Ee//Wp+sBS/4=;
	b=Ws+fDkKOcyg22o5UfycyyRisoEqyAyUHX+rrGChXfGsid9BMX51pdjEUwfjIXlXomw
	WHtjXVp2qUAESSoi3ZQTE9nxnzBti8YqMxOJDueiQxx9baraLDWtB1LVn+pobX2lUims
	DSEQuxsLquyJL0bKwca59eF7JDz9/k0Y4tZ0cVMhZh0+D0MvEKTgypyyK18CmTSdcpHB
	1r4eITC3Qh5mPywbPqmtbDriWq77tbSVJ+xCzFkIpMK7NfXjwt+ANKvDQPGKwpPlMkPo
	riQdirMbsrcoXrjNI1lyF1RzTSMAQJTvaG2PVIz00rRskIbQavJG/ML4xcJ+09Qu6yL7
	fOLQ==
X-Gm-Message-State: AGRZ1gI1GUudg4VN5xTnJiO/zdu9mRZbCnX594yI0VWOsl5BF4qV2Toi
	Irs8/FRSAWHyeNsuA3eaETco9TFv
X-Google-Smtp-Source: AJdET5epL8g+7LkJyNMvGM/ByR0TZY0Y2LVWVBLIFg8Dogb9I0FJ8iPtAsJaHMM58UJBKClC3P/rvQ==
X-Received: by 2002:a63:4a4a:: with SMTP id
	j10-v6mr11701774pgl.0.1541174512887; 
	Fri, 02 Nov 2018 09:01:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d25:2e4:ba80:f9b1?
	([2601:202:4180:c33:8d25:2e4:ba80:f9b1])
	by smtp.gmail.com with ESMTPSA id
	w2-v6sm55764557pfk.140.2018.11.02.09.01.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 09:01:50 -0700 (PDT)
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f08c43f3-4834-45b7-82b7-50e0872e6064@gmail.com>
Date: Fri, 2 Nov 2018 09:01:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] xserver-xorg: fix for CVE-2018-14665
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
X-List-Received-Date: Fri, 02 Nov 2018 16:01:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/1/18 11:09 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

This should be in the update sitting in master-next. its good for Thud
or we update thud to the later version

- armin

> ---
>  .../xorg-xserver/xserver-xorg/CVE-2018-14665.patch | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
> new file mode 100644
> index 0000000..5dd6fe0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2018-14665.patch
> @@ -0,0 +1,56 @@
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/
> +commit/50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e]
> +
> +CVE: CVE-2018-14665
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +From 50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e Mon Sep 17 00:00:00 2001
> +From: Matthieu Herrb <matthieu@herrb.eu>
> +Date: Tue, 23 Oct 2018 21:29:08 +0200
> +Subject: [PATCH] Disable -logfile and -modulepath when running with elevated
> + privileges
> +
> +Could cause privilege elevation and/or arbitrary files overwrite, when
> +the X server is running with elevated privileges (ie when Xorg is
> +installed with the setuid bit set and started by a non-root user).
> +
> +CVE-2018-14665
> +
> +Issue reported by Narendra Shinde and Red Hat.
> +
> +Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +---
> + hw/xfree86/common/xf86Init.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
> +index 6c25eda73..0f57efa86 100644
> +--- a/hw/xfree86/common/xf86Init.c
> ++++ b/hw/xfree86/common/xf86Init.c
> +@@ -935,14 +935,18 @@ ddxProcessArgument(int argc, char **argv, int i)
> +     /* First the options that are not allowed with elevated privileges */
> +     if (!strcmp(argv[i], "-modulepath")) {
> +         CHECK_FOR_REQUIRED_ARGUMENT();
> +-        xf86CheckPrivs(argv[i], argv[i + 1]);
> ++        if (xf86PrivsElevated())
> ++              FatalError("\nInvalid argument -modulepath "
> ++                "with elevated privileges\n");
> +         xf86ModulePath = argv[i + 1];
> +         xf86ModPathFrom = X_CMDLINE;
> +         return 2;
> +     }
> +     if (!strcmp(argv[i], "-logfile")) {
> +         CHECK_FOR_REQUIRED_ARGUMENT();
> +-        xf86CheckPrivs(argv[i], argv[i + 1]);
> ++        if (xf86PrivsElevated())
> ++              FatalError("\nInvalid argument -logfile "
> ++                "with elevated privileges\n");
> +         xf86LogFile = argv[i + 1];
> +         xf86LogFileFrom = X_CMDLINE;
> +         return 2;
> +-- 
> +2.18.1

