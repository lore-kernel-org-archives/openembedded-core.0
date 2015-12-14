Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 87CEA73182
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:25:40 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so82135248igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 04:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pn6cuv8Cr2tFvgMd1bWGH7Zo0fDxYPD//nZ42ZoHW1M=;
	b=w8ZoB+OpaxEneVYdBNhNy17Hg5ei4Hy/ksNrLheg4EAxd34ppba3xTxdaJD+g2hcTC
	t54dTPsbNBZljXAt/2ijrpkPSy944h8CY3/lSg5Crq2RvOuTNhY3FozIozhbDUHf8SvR
	HjCLSXkpQvY2bjZ1H+wPehNUpfc5cZErNTUoEZ8IvUt7gaydQdo1ge5VYfSpUGsfVn1B
	s4gTm+X88TdEfrtl3n24lzx8MoGxopkvIRi5BobvUeOvObeX6zy2B+zKnT0MjNE42dy9
	iIIYG/4zkLq5mwro9wYWZa9P0w76eLdFnDtUnBA/G8DvSOeN/IeO1Aa6OKgPFR9rioHF
	u77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pn6cuv8Cr2tFvgMd1bWGH7Zo0fDxYPD//nZ42ZoHW1M=;
	b=RYCj4FrVvbSj6f99YXYSpkHPQaZFNy8Ja8Q6WMeIPCVr8GtcZzyZAPGA83toUHErlq
	d7RRYlcbS7Jy20/5nWP+RVlajue3gPG/Vr5q4elUf7MEX4dSPIsyRq0hP48ofaqXuN+e
	Iodg254t9SIxTbRmqDJTLs394C2Wo/hKaVyRneZWiwihn2WjjrEzaAh8bdLtoZmExUj1
	bgfwVa6HceckkEyNIugJ0zDD7tZnRilHPHvD8iErJIhmOjv4oS6epjXqzDq4KHmqXooy
	vFUZw4K+X4AY6ty2gsSNvtw6I9y9vTxRsgLF79+ekESEOPStDneajBUbwpYWhBqV/md0
	AyPA==
X-Gm-Message-State: ALoCoQn+WvGpWvqfoHfEekIZUdszIR96fh9BSVsGAKk1DlrnDVytm8A+b9KLT35cTKxG2jBv+/2TjHWgAVawqOXLuU85Jutu9M5ZDGWjvRWA3XZaAB6S96Q=
X-Received: by 10.50.126.8 with SMTP id mu8mr16505997igb.52.1450095941368;
	Mon, 14 Dec 2015 04:25:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 04:25:21 -0800 (PST)
In-Reply-To: <2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 12:25:21 +0000
Message-ID: <CAJTo0LbqBEGMkfS+9AFHimvDvg5evE55R5yoxkWqQRPwx3QtTg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 12:25:40 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf79ceee0526dac5b0

--047d7b1635bf79ceee0526dac5b0
Content-Type: text/plain; charset=UTF-8

On 14 December 2015 at 06:23, Khem Raj <raj.khem@gmail.com> wrote:

> --- /dev/null
> +++
> b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
> @@ -0,0 +1,26 @@
> +From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 13 Dec 2015 17:25:11 +0000
> +Subject: [PATCH] Revert "glibc compat: bump glibc minor version"
> +
> +This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.
>

No explanation, no signed-off-by, no upstream-status.


> diff --git
> a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
> b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
> new file mode 100644
> index 0000000..8b36cfc
> --- /dev/null
> +++
> b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
> @@ -0,0 +1,36 @@
> +diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c
> +index 06e710a..da09d58 100644
> +--- a/libc/stdlib/canonicalize.c
> ++++ b/libc/stdlib/canonicalize.c
>

No comment, no upstream-status, no signed-off-by.

Ross

--047d7b1635bf79ceee0526dac5b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 December 2015 at 06:23, Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span> wrote:<div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
--- /dev/null<br>
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-gli=
bc-minor-version.patch<br>
@@ -0,0 +1,26 @@<br>
+From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Sun, 13 Dec 2015 17:25:11 +0000<br>
+Subject: [PATCH] Revert &quot;glibc compat: bump glibc minor version&quot;=
<br>
+<br>
+This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.<br></blockqu=
ote><div><br></div><div>No explanation, no signed-off-by, no upstream-statu=
s.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_f=
ile_name-memory-leak.patch b/meta/recipes-core/uclibc/uclibc-git/libc-stdli=
b-canonicalize_file_name-memory-leak.patch<br>
new file mode 100644<br>
index 0000000..8b36cfc<br>
--- /dev/null<br>
+++ b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_nam=
e-memory-leak.patch<br>
@@ -0,0 +1,36 @@<br>
+diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c<br>
+index 06e710a..da09d58 100644<br>
+--- a/libc/stdlib/canonicalize.c<br>
++++ b/libc/stdlib/canonicalize.c<br></blockquote><div><br></div><div>No co=
mment, no upstream-status, no signed-off-by.</div><div><br></div><div>Ross<=
/div></div></div></div>

--047d7b1635bf79ceee0526dac5b0--
