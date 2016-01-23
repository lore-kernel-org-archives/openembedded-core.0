Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6EE7706D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 04:53:05 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h5so4234363igh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nSS7kx0NsV5IZd/g9Z1QZLS1KwfY25YLDJ3k8Y3QbV4=;
	b=fXlNM2tFQhlIxXDM83e/ZSCrqI2Rtgu/H4hZj4U9vQQ2xbHeAwr+XtQZJnog2MNGem
	l3NypyERFm9jEAsRb25pfxpY6g9KmWjpG3yYGeZCtR1urROY+uIb5Jsuj6wo52sLC6B1
	x2bXpDB2DWmrFG65pUjLyKxL7GlmfB8i7we5Srbjic2rdZyG5w/O8+DczOA8ATxIjfLB
	2VRNeiVhcECEfWn8Q0Hbc9p4Irp7AFjnoHs8pz/leWIcq3nglAzynrBQtco1yw8OzH47
	vQh2OZ6W6/4aQfdQwCsPSk9t4FNndLVZ/jckYbCAgQsi3RTY/KOSskcuoywqOJhtgNQO
	TLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nSS7kx0NsV5IZd/g9Z1QZLS1KwfY25YLDJ3k8Y3QbV4=;
	b=ZDRxE75ZI0LKqVOSuCyELOuTZo/f5NLXmlqOPzSJ/QgrRIx90zOkxZT5mJIySWIAxJ
	4Sv7U38QwiR+X1+7c1UtGwO+OqTiNIoDydiVqCQgcy4g9ev/giih6kViyirYfwFHkp+C
	7+YArifIWgloqoe4RVusKxis8OHmYbBJt9hekXIyU0e5eGYwvw45SQmB6LBSuShf/aGk
	fpmbetusiFu/aaYuB0aFkZxZqlE9PNSLb5RWsO6C+rXP9+zpKrK8hHGYwbu0w2oowAVE
	n2s4lSccoehHy9zm4EaXAk3IbBJaoQ+2tH3i2B+87SrcA+xJ9QDG5N1oFQIZjqOaU/xg
	PKKQ==
X-Gm-Message-State: AG10YOR4g8NdX0drZngCXU5DZyTzZ55UwRygo5Sc1zTphtW21Te9FH2LdduGxCWSa45zXaI9lZdq50Ejb2oErg==
X-Received: by 10.50.134.129 with SMTP id pk1mr7210166igb.11.1453524786566;
	Fri, 22 Jan 2016 20:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 20:52:37 -0800 (PST)
In-Reply-To: <2123a9457649d41670e9c35ad4b77a80064c95ed.1453427632.git.Qi.Chen@windriver.com>
References: <cover.1453427632.git.Qi.Chen@windriver.com>
	<2123a9457649d41670e9c35ad4b77a80064c95ed.1453427632.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 20:52:37 -0800
Message-ID: <CAMKF1sobhDsXQ1ag9ZfrdHQyka7Y88C-thvzvMADa_V5C=9rqg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: work around the boot problem on qemuarm64
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
X-List-Received-Date: Sat, 23 Jan 2016 04:53:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 6:02 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> This is a workaround to make qemuarm64 boot for systemd systems.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_228.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
> index aa2e846..3bc5927 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -133,6 +133,7 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname --disable-sysusers"
>
>  # per the systemd README, define VALGRIND=1 to run under valgrind
>  CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
> +CFLAGS_append_qemuarm64 = " -O1"

This is general aarch64 problem, so make this across all aarch64
this is the original problem

https://github.com/systemd/systemd/pull/1190#issuecomment-166294683

>
>  # disable problematic GCC 5.2 optimizations [YOCTO #8291]
>  FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

