Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 556DD74882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 23:06:17 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id a2-v6so13483854uak.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xgnb3/ys1xVUq15x4J2w1znsZ0tTN3ukqrXCbdBx/GE=;
	b=et19g5VUT3LIekqG73XPJYVfAmhF+bhzdJbWiznzLAIJAut+7jUM0Ala13A43E6xRI
	0+tJ8FaqIfpSQBNKvMPgSh2SQFg+xC6t9L63ed2Vkjg88QjIjyddrjQHRPeQ7Uz9yroY
	En/YeAOxJk1HxS5nmK1Vahr3QgaBgSKf5b1cFa2ce3M1a4kOU5vXYNwtlr1Fy2OyVfw8
	HxOzPkLVrC0qNw51Ig+Fy+iN6+eDAXWj0eu0TZgNFgxn2v64u1MkPUhmoYkroDnuJRn1
	IJgAbRSQKE8x29uw+INfDomwdc+BJqRYDCWmlIlt4wvpjh3VuokqcNFmzaQrA35zoc/+
	yW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xgnb3/ys1xVUq15x4J2w1znsZ0tTN3ukqrXCbdBx/GE=;
	b=UOLMQPlohxMcmKUFrO3g2YjsJDplnGrA1P+jC/h/GI4wLHo8k0XavFqZWpyzFlRsK5
	lQbGU952MrTKCm399zi0C60VKWPR06stqPUrL7yivdyeZUNyCPddgVo9nLpIyBOTcFLJ
	mgsLjgZoEfUWdN1c6FTBjSDbpGxZLZ59whHxdrc9U0URM8KYzU+GAqplKfqvcdkfyARN
	Sqj9SGivMismjpbkKJsaYdKnbvOM2Nvz0Zy0YuMvJzw9QeFGikcAHyxCiW9obOhzKKAG
	gxSH6MXanMhz/LlTwU29fehLqf308GR0FkBHezwZ0M2q5iDNsXWz3xvXv4ad6873Ofm8
	VODw==
X-Gm-Message-State: ALKqPwdDOMGBPSqBdzHmxKU/CC4DIZdDNipNCg10AIPnbSI14XEoXbaN
	Gs72GnTJ2t1lk2criFywepmB8DdHFsauJqRpl1o=
X-Google-Smtp-Source: AB8JxZqpRPEj/Bw/eaFX0Gh6LNUQV5CAeNC7bxHmRqqieRxdbUmaZsncKKxtnKqx+hsnWGLFsxbCpFLNjJR5OUQp8ro=
X-Received: by 2002:ab0:2054:: with SMTP id
	g20-v6mr357909ual.150.1527030378888; 
	Tue, 22 May 2018 16:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:1349:0:0:0:0:0 with HTTP; Tue, 22 May 2018 16:06:18
	-0700 (PDT)
In-Reply-To: <CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
	<CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
	<759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
	<CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 May 2018 16:06:18 -0700
Message-ID: <CAJ86T=WVzwj5j+W3GFTtW9akh3M=SEH5HTLVrBt_mkdFV0XCmA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Tue, 22 May 2018 23:06:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 12:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, May 21, 2018 at 12:13 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 05/21/2018 11:18 AM, Andre McCurdy wrote:
>>> On Sun, May 20, 2018 at 7:49 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>>> From: Armin Kuster <akuster808@gmail.com>
>>>>
>>>> [v2]
>>>> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>>>>
>>>> [v1]
>>>> removed patches included in update:
>>>> busybox/CVE-2011-5325.patch
>>>> busybox/CVE-2017-15873.patch
>>>> busybox/busybox-CVE-2017-16544.patch
>>>>
>>>> refactored busybox-udhcpc-no_deconfig.patch for this update
>>> Did you check the defconfig?
>>  That patch does not touch the defconfigs? It changes the dhcpd.c it self.
>
> Right, removing that patch has nothing to do with the busybox
> defconfig. I wasn't commenting that particular line in the patch.
>
>>> Often it needs a refresh, otherwise any new config options added
>>> between busybox 1.27.2 and 1.28.3 will take busybox's defaults (which
>>> may enable new applets or features which we haven't historically
>>> enabled when configuring busybox for OE).
>> am I missing some context here?
>
> Refreshing (or at least checking) the busybox defconfig is something
> that should ideally be done whenever the busybox version is updated
> and it wasn't clear from your patch that it's been done, so I just
> wanted to double check.

Building before and after Armin's patch and then diffing .config files
in each build directory gives:

Old 1.27.2 specific config options removed:

-CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y

New 1.28.3 specific options added:

+CONFIG_BB_ARCH=y
+CONFIG_FEATURE_CATN=y
+CONFIG_FEATURE_SH_READ_FRAC=y
+CONFIG_FEATURE_SWAPONOFF_LABEL=y
+CONFIG_FEATURE_VOLUMEID_MINIX=y
+CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
+CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y
+CONFIG_HEXEDIT=y
+CONFIG_NUKE=y
+CONFIG_RESUME=y
+CONFIG_RUN_INIT=y
+CONFIG_SETFATTR=y

So new applets hexedit, nuke, etc, are going to sneak in to our builds
unless we refresh our defconfig to disable them.

