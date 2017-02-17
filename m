Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id F34507732E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:28:34 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w20so45801184qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ExusymKPNNiVpXKyiQHkGuEN8RqMALU/bs8g04ysmA=;
	b=lNvCQegJ79QAsCfzTWYJvfRgkPZtjUAPAIGTFHecRlYVdYamQDBurmhGaM9OpNxYkV
	Vn+ZfDu9LHWCFpbMLTwY+lkhhk0j0zvExyEqU+UgNe8T10kj0SoVVyIdBoif3qRm2+PQ
	BSpR5lwsxYRV3OzkV1j6s/zkBHAVnKGWUZ3ggra0AdfwkutxA6n9SdH5Uf+RpY3FLQgE
	MUO+BYUicd9zWSTKxPPqev6HRKrhdYA0VOsup6Gtei+guUG7kDXwcjGwRquha45/j/TP
	nGNj+84xKouujfd4tM34/toY2PWq6daBESvnWzVOcmPP4zZmFCrXyBcNy7PjKk4ogxuI
	hJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ExusymKPNNiVpXKyiQHkGuEN8RqMALU/bs8g04ysmA=;
	b=eCKZJx/HTjtrZ8RZDkn+amhtlRwFp7bb2xVnOfirbGgiSc36LEkF8fEQYOHWHtgHut
	6CL6hW3Abdpr8WK4c8XZq4m9vpi2x0YJOP27S6olE3cR6EPFP4Oyg+9uwV8Ir8oUxied
	Ylmwy3VZXly+EDY3Zdgp92KJzfVjMKgG+jvRpCH10eMPLfrNFi2Qs33mys3nL7tDex3D
	ymviVCm8sr55yC6sk3lsl2ww0Drugdt6gRFGjHMtcGCDhPXzjYq2+YsNPwMceaKs0v5T
	TOeQKrgzHyUEzyVMF9HZu234jOxOUr7d37RT6+xPZ0wPW4NqRd07fOQA5dgfAT8HoAMM
	MtHQ==
X-Gm-Message-State: AMke39lh5urOgbXT5EEsySxanrlvkKiiAAMovtY8+YES9joOjEzDgt3DNGV+PAWgFNCF0EZ7QHuQ4wzxYNloCl91
X-Received: by 10.200.39.212 with SMTP id x20mr8268546qtx.109.1487352514926;
	Fri, 17 Feb 2017 09:28:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 09:28:14 -0800 (PST)
In-Reply-To: <1487350233-9392-1-git-send-email-athoik@gmail.com>
References: <1487350233-9392-1-git-send-email-athoik@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 17:28:14 +0000
Message-ID: <CAJTo0Lb72FJj0hPU85pt-mGUE1Zv2n0eokV7E9A4bSQjYUssTQ@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] LSB 4.1: lsb_release script incompatible with busybox head and find
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
X-List-Received-Date: Fri, 17 Feb 2017 17:28:35 -0000
Content-Type: multipart/alternative; boundary=001a1135b5424f14170548bd3eb2

--001a1135b5424f14170548bd3eb2
Content-Type: text/plain; charset=UTF-8

On 17 February 2017 at 16:50, Athanasios Oikonomou <athoik@gmail.com> wrote:

> +# Copyright (c) 2013 LG Electronics, Inc.
>

By submitting the patch this becomes MIT licensed, so this copyright
statement is pretty meaningless.


> +# Busybox implementation only supports head -1 option if
> ENABLE_INCLUDE_SUSv2
> +# or ENABLE_FEATURE_FANCY_HEAD configuration options are enabled. Also
> the -and
> +# option for find is only supported if ENABLE_DESKTOP configuration
> option is
> +# enabled. These configuration options are not enabled in build-webos,
> which is
> +# why this patch is needed.
>

Patch comments don't need to be on # lines.  Also this patch needs a
Signed-off-by and Upstream-Status in the header.  I can't see a reason why
the fixes don't go upstream, so please try submitting it there too.

--- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -2,7 +2,7 @@ SUMMARY = "LSB support for OpenEmbedded"
>  SECTION = "console/utils"
>  HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
>  LICENSE = "GPLv2+"
> -PR = "r2"
> +PR = "r3"
>

No need to bump PR, leave it at r2.

Ross

--001a1135b5424f14170548bd3eb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 February 2017 at 16:50, Athanasios Oikonomou <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:athoik@gmail.com" target=3D"_blank">athoik=
@gmail.com</a>&gt;</span> wrote:<div><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">+# Copyright (c) 2013 LG El=
ectronics, Inc.<br></blockquote><div><br></div><div>By submitting the patch=
 this becomes MIT licensed, so this copyright statement is pretty meaningle=
ss.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+# Busybox implementation only supports head -1 option if ENABLE_INCLUDE_SU=
Sv2<br>
+# or ENABLE_FEATURE_FANCY_HEAD configuration options are enabled. Also the=
 -and<br>
+# option for find is only supported if ENABLE_DESKTOP configuration option=
 is<br>
+# enabled. These configuration options are not enabled in build-webos, whi=
ch is<br>
+# why this patch is needed.<br></blockquote><div><br></div><div>Patch comm=
ents don&#39;t need to be on # lines.=C2=A0 Also this patch needs a Signed-=
off-by and Upstream-Status in the header.=C2=A0 I can&#39;t see a reason wh=
y the fixes don&#39;t go upstream, so please try submitting it there too.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">--- a/meta/recipes-extend=
ed/lsb/<a href=3D"http://lsb_4.1.bb" rel=3D"noreferrer" target=3D"_blank">l=
s<wbr>b_4.1.bb</a><br>
+++ b/meta/recipes-extended/lsb/<a href=3D"http://lsb_4.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">ls<wbr>b_4.1.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;LSB support for OpenEmbedded&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://prdownloads.sourceforge.net/lsb"=
 rel=3D"noreferrer" target=3D"_blank">http://prdownloads.<wbr>sourceforge.n=
et/lsb</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
-PR =3D &quot;r2&quot;<br>
+PR =3D &quot;r3&quot;<br></blockquote><div><br></div><div>No need to bump =
PR, leave it at r2.</div><div><br></div><div>Ross=C2=A0</div></div></div></=
div></div>

--001a1135b5424f14170548bd3eb2--
