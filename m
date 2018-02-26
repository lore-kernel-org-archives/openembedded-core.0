Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE6978287
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:54:37 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o9so11064703itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T0J/MoZtURIrfH54H6S0B+yi97yrlVam8lVo4YKj+hA=;
	b=pqRI3YqSnU3bFNgWdjTdlCWXECmIJ4ueyUmfaG8Wi1UzBPHuyJOFzCkhAXFG35VQll
	wUtoyEA1FmY6StOwFaUB8fh03jd1CRfcdiMpuhmiEiTC4IZEUJFv78ajlzH8elM5KvNj
	0RXW63/WWDkREJweIXCEsomU0Zg43Jv+YvoAg8fHU+3f1x1XkL3xmqfpTbn9vN6PoLvQ
	5TYmt+CIJbvJdgS9BoSY9iBum8VsDj3MdolGgl0ucuIFrxjT8Zl1UrDnNrXVOTBIHGxg
	86x8XzrnzIORgVaX88QU/kyn9YuuZ8e+axibkY7SZ1hOAhH99f3kIUlglTOdx84vKY0y
	o9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T0J/MoZtURIrfH54H6S0B+yi97yrlVam8lVo4YKj+hA=;
	b=q6VJXdOb/ja5dcBskWBKXwxHhM5kqE1ns1miDU/zQvAM9QqMv6zjUoci3uTX1iIC7G
	iPC8gPCNhu27aDMVWqmhD8R5y4N3m9SA1QaVV/hYlUoYzOCUzVnvjIBlAH61/HShb0AT
	FXAjGnIcTgHnp27dSam3OBCP7+oSRLsWJ+IKsylAECBMsYcgh60z5DrYmqEK9q8dv+lj
	EFtkQ89t4hjcAE0a8xllegEBQ7zlygdJPvr6j8MVJRv20ElLthK/VsZlnSgbvAf3K9P5
	I0asjHR6Yd6VemAKQ2014YrkUPRNeeyRuGZ4qxz/J+5TiOyu0Qu1VlnHBTugSyXsgSEu
	NGWg==
X-Gm-Message-State: APf1xPDK4+dVVPgnHBBn/QQr/cj9LNCmsceJeNae99quBqILoJTxGBRR
	KIHjgu/JaQoVmqba6mONBXfyJhpYnHaz0V2j5VwOHA==
X-Google-Smtp-Source: AG47ELstuFW9bApW1JONqtNVCw2ceZRDDM8Sgjk2TXX/LdtNISt8bpZrqGrwIoiGGGtRgnGsl6Rsm5lOI1mW+GCiULA=
X-Received: by 10.36.36.144 with SMTP id f138mr1687931ita.131.1519656879314;
	Mon, 26 Feb 2018 06:54:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 26 Feb 2018 06:54:18 -0800 (PST)
In-Reply-To: <20180226143813.21159-1-raj.khem@gmail.com>
References: <20180226143813.21159-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Feb 2018 14:54:18 +0000
Message-ID: <CAJTo0LZbhTc_UWPueQ8hvQbsN3jppG=UnCXVtfF4Z9_phnub9Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Mon, 26 Feb 2018 14:54:38 -0000
Content-Type: multipart/alternative; boundary="001a1147cd3078f4fc05661eb0e8"

--001a1147cd3078f4fc05661eb0e8
Content-Type: text/plain; charset="UTF-8"

I know you didn't test this:  :)

On 26 February 2018 at 14:38, Khem Raj <raj.khem@gmail.com> wrote:

> @@ -40,8 +40,13 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc
> \
>             file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
> \
>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
> +<<<<<<< HEAD:meta/recipes-core/glibc/glibc_2.26.bb
>             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch
> \
>             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> +=======
> +           file://0026-reset-dl_load_write_lock-after-forking.patch \
> +           file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
> \
> +>>>>>>> 2ce2695790... glibc: Upgrade to 2.27 release:meta/recipes-core/
> glibc/glibc_2.27.bb
>  "
>

Locally I've got the previous 2.27 upgrade squashed into a revert of the
2.26 bump, presumably there are no other changes required?

--001a1147cd3078f4fc05661eb0e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I know you didn&#39;t test this: =C2=A0:)<br><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 26 February 2018 at 14:38, =
Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">@@ -40,8 +40,13 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=
=3D${<wbr>SRCBRANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Define-DUMMY_<wbr>LOC=
ALE_T-if-not-defined.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-elf-dl-deps.c-<wbr>Ma=
ke-_dl_build_local_scope-<wbr>breadth-fir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-locale-fix-hard-<wbr>=
coded-reference-to-gcc-E.patch \<br>
+&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD:meta/recipes-core/glibc/<a href=3D"http:=
//glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blank">g<wbr>libc_2.26.bb</a=
><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-glibc-reset-dl-<wbr>l=
oad-write-lock-after-forking.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0028-Bug-4578-add-ld.<wbr>=
so-lock-while-fork.patch \<br>
+=3D=3D=3D=3D=3D=3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-reset-dl_load_<wbr>wr=
ite_lock-after-forking.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-Acquire-ld.so-<wbr>lo=
ck-before-switching-to-<wbr>malloc_atfork.patch \<br>
+&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2ce2695790... glibc: Upgrade to 2.27 release:=
meta/recipes-core/<wbr>glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"norefe=
rrer" target=3D"_blank">glibc_2.27.bb</a><br>
=C2=A0&quot;<br></blockquote><div><br></div><div>Locally I&#39;ve got the p=
revious 2.27 upgrade squashed into a revert of the 2.26 bump, presumably th=
ere are no other changes required?</div></div></div></div>

--001a1147cd3078f4fc05661eb0e8--
