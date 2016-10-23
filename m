Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD9E71A47
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 16:16:51 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id 83so153831385vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gaCqJm+M6K3/ymGEU7E5bsscqx2R+5BiemYAGYgTcMU=;
	b=ffmbEH/UC3afoKJW6TUrY26tpWVSCdyGYXWdc4T7oinehW+grzxkXvnto0/eA96H/u
	dMYO+DqVq7fu1FDPRwIQd46SIY3DZ3mMvzN+F06pPY4tqYvj2LBKWssbfzhi0oJxS4mo
	d028HebnH68MVKo1u99/2NyDTopNY5jVzXx8Pf3QFGlD+lo6dX2laOaYi73qFaswdlz8
	Ml3caintTzByjbkpLzwYR1M3xCppLogZ0kO1ooURSOFdSfkF8FBOG/+/aYOkxJ21qhO6
	tvmAmNMusDlW6op/4CX2SnkhmpZh2d9dBes0vzBdYRU/3RqBDkRKSd1JDnJGqv3LwZg6
	TvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gaCqJm+M6K3/ymGEU7E5bsscqx2R+5BiemYAGYgTcMU=;
	b=KpAJnItltKY2HkUcSTg5uKXZuPH93tDrsBWqXoWQxYYmKZgaH4wwBhU/e1+BWrjUoN
	xCjbFah5g+0NFeHpI7qbi84owktecOscm58w1kYvk/JtZFg8hqaVqlsG15wsCFRHQk9+
	QqjUiTnM6jw02cRWyFh4V9ZYVGVU1za2ggb0Frio39zsP612kqvgXqKhOIVd+idQlyIk
	JdBcbWbrvXFM+a/ZriMixESQ4w8u3/8se8OND8cJL/ODdAhTS+tbvIEbBcXlT00sbvmo
	NgNxZEzL48ny2NubGyfpfZFIufPF78er5tdE5FMLDS10dJW6gXNbFjz3k2GKJ30So6hX
	/z4Q==
X-Gm-Message-State: ABUngvfXMVoOkW749FqqPIqn4Mk8uhRGeNJb54A6hzfrTrBrZAEX2SzWBgNdHbt0W2lv5qnufxn52zFQ1SrwBg==
X-Received: by 10.31.15.65 with SMTP id 62mr5429500vkp.93.1477239412894; Sun,
	23 Oct 2016 09:16:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 23 Oct 2016 09:16:22 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610231006540.1835@localhost.localdomain>
References: <alpine.LFD.2.20.1610231006540.1835@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Oct 2016 09:16:22 -0700
Message-ID: <CAMKF1srL8oRb-65pGXZ8Ss-9H_-N2B-Q9JmChTNs3fxnU406qQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying issues building two SDKs, based on different target images
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
X-List-Received-Date: Sun, 23 Oct 2016 16:16:54 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 23, 2016 at 7:15 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   if you can tolerate it, a few more questions about building SDKs
> before i sit down and start burning through machine cycles configuring
> and building for the rest of the day.
>
>   first, given that:
>
> "SDK_RDEPENDS=${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>
> do those two variables map *precisely* to the target.manifest and
> host.manifest files generated when building an SDK? they *appear* to,
> i just wanted to ensure there wasn't some subtle mismatch that might
> confuse me later.

thats correct.

>
>   next, i assume that if, in the same build directory, i choose to
> build two standard SDKs differing in only the target image:
>
> $ bitbake -c populate_sdk core-image-minimal
> $ bitbake -c populate_sdk core-image-sato
>
> all common files between the two SDKs will be reused in the final
> construction. so if i build an SDK based on core-image-sato, turning
> around and building one based on core-image-minimal should take very
> little time indeed, correct?

Correct

>
>   finally (and the one i'm most unsure about), if i build those two
> SDKs, i'm *assuming* that the x86 nativesdk content will be the same;
> it's the target PPC sysroots that will be different (obviously, the
> sysroot for sato will be noticeably larger than the one for minimal).
>

nativesdk packages are meant for the host on which SDK would install eventually
so it should be independent of target and thusly common for all of target arches

>   what happens if i try to install those two SDKs in the same
> directory (/opt/poky.2.2/)? would that even work?

The superset will remain I guess.

>
>   and now, off to read more manual ...
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

