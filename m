Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAFF783FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 20:54:30 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f20so11288941ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yA4j1Rfke8lORvYdhDxy/isnp6SVF68l8qUkpmLG8IA=;
	b=FSbR5l4PFulQOrKII5mwnskAWBjE+Y2+ykhdMOCvT9sYBOGsPV5bsldu9qBlJ1+UGT
	9Aq6QgLVo7E60EJL7BbDjNbQZmgjOKv+30FrGqi3QU2NnAMum9Bnoy6Qikn7wtNweVNc
	sx8Z0oPEqtK4BIW84bf3WYnbr5wdwXTsvBzKRugIn3+Zk9g8x9kwuS9olaEon9rbAZB5
	ZnN1QYdIdDnnvW/gKk97vPap+mKUEPiaB4ShTQq+tjY3i7z/uuu+6ouv9YsSOxpay+ym
	Hzag/U6bUsijIA++3MLie6CKDzrhPqP+27HepH9zaBreUVJKC08cKim1QU7rO81aq627
	yrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yA4j1Rfke8lORvYdhDxy/isnp6SVF68l8qUkpmLG8IA=;
	b=kbcj7eCC1shVC7T/v2Rcz/s275H+0VTUW+63aZ0K7ogI8Kd8uy1BppRM8OFtPS0diB
	dM6aQ5em/hKd94299Z/H7uWe8G5khgdlug7vfk02qhDJ3WIuL6LNAZoBWbOLxzbqLYJN
	mCFRA+93A42/Umf+oUN8cudVV0NKKXase3US6KsJLJKGdwuyLOzYxgfei03AVbRt5ptb
	2lNir8yrD1WpeWIsD6lqdyIvD+moIZgTm0OUcrX2M8wJiLVNiOKsioTqtkU40AOdKItz
	CVKEWVaiv0zp9PrrnC99gvEpvWfPS7LrI0UxMGVwcSf95Bjn/m2hnvUAVzsIbi/vhRyU
	XwPQ==
X-Gm-Message-State: AJaThX7P1jlvtVlBbK2Id79IpM1Pvnvgsyum4P3S6OFcG2Xjv0XvHVY1
	iYK2rAOS1jJfsEzojDlfO3vuiYcHWPbr163m7MgpMQ==
X-Google-Smtp-Source: ABhQp+T+83e3s7CVx7rb++Vau7Wq9HJmRlLmypGjPfdYRG6DSD2e2R/A0mrFNI8I4/zQFxttQv0zv3iPKzdsM1ijNH8=
X-Received: by 10.107.183.151 with SMTP id h145mr2338629iof.259.1510260871676; 
	Thu, 09 Nov 2017 12:54:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Thu, 9 Nov 2017 12:54:11 -0800 (PST)
In-Reply-To: <6eb7d501a2a8422cf0ee6a36bb99143f39255be3.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<6eb7d501a2a8422cf0ee6a36bb99143f39255be3.1510192517.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Nov 2017 20:54:11 +0000
Message-ID: <CAJTo0LYazanyLCCXD0p5yQZCNa7PM0XNGKt2O5KidsS=aRF9Uw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Thu, 09 Nov 2017 20:54:30 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c07b0c68741055d93023e"

--94eb2c0c07b0c68741055d93023e
Content-Type: text/plain; charset="UTF-8"

How does this help?  A bbappend is parsed after the bb so it can just
assign to SRCREV.

Also is it actually useful to change the git url but apply the same patches?

Ross

On 9 November 2017 at 01:58, Khem Raj <raj.khem@gmail.com> wrote:

> This makes it easy to override them in bbappends
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.29.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc
> b/meta/recipes-devtools/binutils/binutils-2.29.inc
> index 27d46eb088..35f76cba6d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.29.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.29.inc
> @@ -18,9 +18,10 @@ BINUPV = "${@binutils_branch_version(d)}"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
> +SRCREV ?= "37e991bb143ca2106330bcdc625590d53838b7a1"
> +BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=
> binutils-${BINUPV}-branch;protocol=git"
>  SRC_URI = "\
> -     git://sourceware.org/git/binutils-gdb.git;branch=
> binutils-${BINUPV}-branch;protocol=git \
> +     ${BINUTILS_GIT_URI} \
>       file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
>       file://0004-Point-scripts-location-to-libdir.patch \
>       file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> \
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0c07b0c68741055d93023e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How does this help?=C2=A0 A bbappend is parsed after the b=
b so it can just assign to SRCREV.<div><br></div><div>Also is it actually u=
seful to change the git url but apply the same patches?</div><div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 9 November 2017 at 01:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">This makes it easy to overrid=
e them in bbappends<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>binutils/binutils-2.29.inc | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-2.29.inc b/meta/r=
ecipes-devtools/<wbr>binutils/binutils-2.29.inc<br>
index 27d46eb088..35f76cba6d 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils-2.29.inc<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils-2.29.inc<br>
@@ -18,9 +18,10 @@ BINUPV =3D &quot;${@binutils_branch_version(d)<wbr>}&quo=
t;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&gt;\d+_(\d_=
?)*<wbr>)&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>37e991bb143ca2106330bcdc625590<wbr>d53838b7a1&quot;<=
br>
+SRCREV ?=3D &quot;<wbr>37e991bb143ca2106330bcdc625590<wbr>d53838b7a1&quot;=
<br>
+BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/bin=
utils-gdb.git;branch=3Dbinutils-${BINUPV}-branch;protocol=3Dgit" rel=3D"nor=
eferrer" target=3D"_blank">sourceware.org/git/<wbr>binutils-gdb.git;branch=
=3D<wbr>binutils-${BINUPV}-branch;<wbr>protocol=3Dgit</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://sourceware.org/git/binutils-gd=
b.git;branch=3Dbinutils-${BINUPV}-branch;protocol=3Dgit" rel=3D"noreferrer"=
 target=3D"_blank">sourceware.org/git/<wbr>binutils-gdb.git;branch=3D<wbr>b=
inutils-${BINUPV}-branch;<wbr>protocol=3Dgit</a> \<br>
+=C2=A0 =C2=A0 =C2=A0${BINUTILS_GIT_URI} \<br>
=C2=A0 =C2=A0 =C2=A0 file://0003-configure-widen-<wbr>the-regexp-for-SH-<wb=
r>architectures.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0004-Point-scripts-<wbr>location-to-libdir.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 file://0005-Only-generate-an-<wbr>RPATH-entry-if-LD_RU=
N_PATH-is-<wbr>not-e.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0c07b0c68741055d93023e--
