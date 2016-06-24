Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 00F446FF5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 13:52:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r136so2161169qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xM/3AkRjz1NE47kJZiCuoBjlLegx/NthJhrCGOzYNSc=;
	b=olk7s7aU21nlJC40OIKsbryChdVqiT/kPF5uufGiCuWU79fpVO78lZIVVG7T32loD6
	0cpCqd5wTEXqEpLieUlFFP8sPW6xp0WuXrleXGfSn73OqthdCnnCCS2FVpYxGjmSPTKg
	9S0y3T3pBHHrGJM+vocH/Azkxj4DqdFB4SchIQ/CNWUBcdHzI3xhBAaFVvkC+ARA5M8+
	BbxmGGoFcigAueCAW8shG9AcT79cRd/mk27kVJVXm91Xr+V6EWd6Ac1Ad44w+ZSZPZV2
	00rxBMwCuclpIExq6Dl4zilYLEVaYju4pF/rOJEGH/OXOdpRzsLbwg4+87qZyL5bOT3O
	Ozdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xM/3AkRjz1NE47kJZiCuoBjlLegx/NthJhrCGOzYNSc=;
	b=QBrdSxvdJUYzF025RvKHV6PoE9YSLouv161VPCjuMQdQfBxACzsc22AT9tYe+PeTU8
	Jc5kteg2SX/T4uI19qTyJS6UopqA6lnAoASvVNBoxViIibX6DW1DCUcLMZ7m3TpVftfr
	m1Yr4NEbIOeIgtRl7CS68VaBqFONabxSAvYmb3tIYfK6cG07qmtYamfT5EY/mAoHwPK5
	yS7/VcZE3P3uTRRmtiwILFXr2nDOmVon/59RmwKCoufZ9AaMvoDECtLh8vm5OqiIJy9p
	wS0g5joBJcycB/m6LMEmylG0K6eYFnlSN+wXiM0uC2IOJGomvQ+88RPhhJvyjtzm16oT
	rF8w==
X-Gm-Message-State: ALyK8tLdN0rf2OvhxJExD16/ZU4ifBjpLGduyk/mzqTo+PEn5QBuIRHaT5lEWjsVa0Qiud1krMH6H7j9wRY1nw==
X-Received: by 10.55.97.5 with SMTP id v5mr5183784qkb.41.1466776368121; Fri,
	24 Jun 2016 06:52:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 06:52:18 -0700 (PDT)
In-Reply-To: <1466765671-22371-3-git-send-email-git@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-3-git-send-email-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 06:52:18 -0700
Message-ID: <CAMKF1srjbnbVaeKRYVTiKHsdBJN3QhcpULFG2AMLpbmcstUD3g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] uclibc: backport patch to fix gdb 7.11 compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 13:52:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

similar patch was proposed by someone in past.

http://patchwork.openembedded.org/patch/125181/

this one is better since its a proper backport. May be add the
relevant bug ID to commit msg and drop the other one


On Fri, Jun 24, 2016 at 3:54 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
>  .../0001-Provide-an-alias-to-_obstack_free.patch   | 44 ++++++++++++++++=
++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-a=
lias-to-_obstack_free.patch
>
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/=
uclibc/uclibc-git.inc
> index a56fa7c..718bee9 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -6,6 +6,7 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/uclibc-git:"
>
>  SRC_URI =3D "git://uclibc-ng.org/git/uclibc-ng \
>          file://0001-Disable-lrount_tes-function.patch \
> +        file://0001-Provide-an-alias-to-_obstack_free.patch \
>          file://uClibc.machine \
>          file://uClibc.distro \
>          file://obstack.cfg \
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to=
-_obstack_free.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-=
alias-to-_obstack_free.patch
> new file mode 100644
> index 0000000..30b443f
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obsta=
ck_free.patch
> @@ -0,0 +1,44 @@
> +From 06e4fe64bbd01f16ee84da161b8e1a61e73b4cdb Mon Sep 17 00:00:00 2001
> +From: Alexey Neyman <aneyman@lynx.com>
> +Date: Thu, 31 Mar 2016 13:02:47 -0700
> +Subject: [PATCH] Provide an alias to _obstack_free
> +
> +GDB 7.11 does not build if compiled against uclibc-ng (1.0.12 was used,
> +but the problematic code exists in 1.0.13 as well). The reason is that
> +GDB release includes its own obstack implementation, but elides the code
> +if <gnu-versions.h> declares a compatible obstack implementation in
> +libc. uclibc-ng does claim compatible obstack interface (GDB expects
> +version 2, but accepts version 1 if sizeof(int) =3D=3D sizeof(size_t)),
> +however, uclibc-ng does not provide the _obstack_free symbol that is a
> +part of the interface (glibc does provide this symbol). This later
> +causes a link failure.
> +
> +The attached patch makes uclibc-ng enables an alias _obstack_free ->
> +obstack_free.
> +
> +Signed-off-by: Alexey Neyman <stilor@att.net>
> +---
> +Upstream-Status: Backport
> +
> + libc/misc/gnu/obstack.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
> +index 38cfd83..6acc567 100644
> +--- a/libc/misc/gnu/obstack.c
> ++++ b/libc/misc/gnu/obstack.c
> +@@ -385,11 +385,9 @@ obstack_free (struct obstack *h, void *obj)
> +     abort ();
> + }
> +
> +-# if 0
> + /* Older versions of libc used a function _obstack_free intended to be
> +    called by non-GCC compilers.  */
> + strong_alias (obstack_free, _obstack_free)
> +-# endif
> +
> + int
> + _obstack_memory_used (struct obstack *h)
> +--
> +2.8.1
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

