Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8E75A6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 07:46:39 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id v76so59834867ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t5HPodWu788ciVwnppmb8CJcGpk+7UpKWMe9WKJDijQ=;
	b=dgKHCvvwE++ViUIiDHUhFOUL+VNBNV/maFz1/L99K+LK1anz2kqqQTfyXjQpW+RuoD
	GQhP7tqRqSgKZkkmLuIlpm+Lklyvtp2nxNh+kZV/S7JgbH8i2xYQ1etaJVYjBcKNcLv1
	tngRlV1ePovkujiav5nmhLWM5MWdMbrsHvA3U1EhA7NST0G17zYAcoUBlJ0XqpnzrjcA
	wY4rwljia92X0OYnogBBncfmQQWOesG9bBiGr6qpe97CaUIgy+QiFh74oMBjzPlWWVgw
	S6IN8EInnnkV4GpO42iHEhrZVm6Za1LTnXrhNogupoXr7eORGvjr0McOoVBF8Iu03tjx
	01aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t5HPodWu788ciVwnppmb8CJcGpk+7UpKWMe9WKJDijQ=;
	b=WXmiI96IuGWzyR1jKhMbIKYHqmdmm3TkiuSFie90amPaPavY7cOmlrjORmpn7ELymt
	71L7Ln0KdeC/eYOobM1Bk9HFe1TnixoJPDS4X6RP4evnMHEaQt58lvjdDA0aEOJhHXH6
	8GzkIX4Uy5zGLl4ZZSL8LBeYVT5o11XtLd384DjBfSrqKw9nM3rm/BiJlgZF/D52BqTb
	GB+8+vHM9OB3AAQyTeCNA6SSU5wyyO38MJjR4BXMk1Oycpp4BbBuhYspUJSfndl18FXC
	QkPYP4bJvrkqU/unhhG93TFW+hPwN82hoHNJmPz5IbgPgMBKBUe87jt/fT1MEN3vpT88
	yXSQ==
X-Gm-Message-State: AFeK/H2XTeqD8UadjZEGFj+vKkSt/pgMHq86TGYd5VUw1tTgupzarNmvmF72x4WC/3yv58AhgRuo/I5MCFLu3I1f
X-Received: by 10.129.197.74 with SMTP id o10mr11448591ywj.183.1491205600295; 
	Mon, 03 Apr 2017 00:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 3 Apr 2017 00:46:09 -0700 (PDT)
In-Reply-To: <1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 3 Apr 2017 10:46:09 +0300
Message-ID: <CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
To: yin.thong.choong@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 07:46:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a54fa17d27b054c3e5c42

--94eb2c1a54fa17d27b054c3e5c42
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 05:51, <yin.thong.choong@intel.com> wrote:
>
> From: Choong YinThong <yin.thong.choong@intel.com>
>
> fedorahosted.org was retired on March 1st, 2017. This is to
> update the SRC_URI to point to yoctoproject.org/mirror.

Hi,

Is there a reason not to use https://github.com/logrotate/logrotate ?

Same question applies to the selftest patch as well.

Thanks,
  Jussi

>
>
> [YOCTO #11226]
>
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
> ---
>  meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> index 9c2dfe0..386c01b 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Rotates, compresses, removes and mails system log files"
>  SECTION = "console/utils"
> -HOMEPAGE = "https://fedorahosted.org/logrotate/"
> +HOMEPAGE = "http://downloads.yoctoproject.org"
>  LICENSE = "GPLv2"
>
>  # TODO: logrotate 3.8.8 adds autotools/automake support, update recipe
to use it.
> @@ -10,7 +10,7 @@ DEPENDS="coreutils popt"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>
> -SRC_URI = "
https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
> +SRC_URI = "
http://downloads.yoctoproject.org/mirror/sources/logrotate-${PV}.tar.gz \
>             file://act-as-mv-when-rotate.patch \
>             file://update-the-manual.patch \
>             file://disable-check-different-filesystems.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c1a54fa17d27b054c3e5c42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 3 April 2017 at 05:51, &lt;<a href=3D"mailto:yi=
n.thong.choong@intel.com">yin.thong.choong@intel.com</a>&gt; wrote:<br>&gt;=
<br>&gt; From: Choong YinThong &lt;<a href=3D"mailto:yin.thong.choong@intel=
.com">yin.thong.choong@intel.com</a>&gt;<br>&gt;<br>&gt; <a href=3D"http://=
fedorahosted.org">fedorahosted.org</a> was retired on March 1st, 2017. This=
 is to<br>&gt; update the SRC_URI to point to <a href=3D"http://yoctoprojec=
t.org/mirror">yoctoproject.org/mirror</a>.<br><br>Hi,<br><br>Is there a rea=
son not to use <a href=3D"https://github.com/logrotate/logrotate">https://g=
ithub.com/logrotate/logrotate</a> ?<div><br></div><div>Same question applie=
s to the selftest patch as well.</div><div><br></div><div>Thanks,</div><div=
>=C2=A0 Jussi<br>=C2=A0<br>&gt;<br>&gt;<br>&gt; [YOCTO #11226]<br>&gt;<br>&=
gt; Signed-off-by: Choong YinThong &lt;<a href=3D"mailto:yin.thong.choong@i=
ntel.com">yin.thong.choong@intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta=
/recipes-extended/logrotate/<a href=3D"http://logrotate_3.9.1.bb">logrotate=
_3.9.1.bb</a> | 4 ++--<br>&gt; =C2=A01 file changed, 2 insertions(+), 2 del=
etions(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-extended/logrotate/<a h=
ref=3D"http://logrotate_3.9.1.bb">logrotate_3.9.1.bb</a> b/meta/recipes-ext=
ended/logrotate/<a href=3D"http://logrotate_3.9.1.bb">logrotate_3.9.1.bb</a=
><br>&gt; index 9c2dfe0..386c01b 100644<br>&gt; --- a/meta/recipes-extended=
/logrotate/<a href=3D"http://logrotate_3.9.1.bb">logrotate_3.9.1.bb</a><br>=
&gt; +++ b/meta/recipes-extended/logrotate/<a href=3D"http://logrotate_3.9.=
1.bb">logrotate_3.9.1.bb</a><br>&gt; @@ -1,6 +1,6 @@<br>&gt; =C2=A0SUMMARY =
=3D &quot;Rotates, compresses, removes and mails system log files&quot;<br>=
&gt; =C2=A0SECTION =3D &quot;console/utils&quot;<br>&gt; -HOMEPAGE =3D &quo=
t;<a href=3D"https://fedorahosted.org/logrotate/">https://fedorahosted.org/=
logrotate/</a>&quot;<br>&gt; +HOMEPAGE =3D &quot;<a href=3D"http://download=
s.yoctoproject.org">http://downloads.yoctoproject.org</a>&quot;<br>&gt; =C2=
=A0LICENSE =3D &quot;GPLv2&quot;<br>&gt;<br>&gt; =C2=A0# TODO: logrotate 3.=
8.8 adds autotools/automake support, update recipe to use it.<br>&gt; @@ -1=
0,7 +10,7 @@ DEPENDS=3D&quot;coreutils popt&quot;<br>&gt;<br>&gt; =C2=A0LIC=
_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D18810669f13b87348459e611d31ab7=
60&quot;<br>&gt;<br>&gt; -SRC_URI =3D &quot;<a href=3D"https://fedorahosted=
.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz">https://fedorahosted.or=
g/releases/l/o/logrotate/logrotate-${PV}.tar.gz</a> \<br>&gt; +SRC_URI =3D =
&quot;<a href=3D"http://downloads.yoctoproject.org/mirror/sources/logrotate=
-${PV}.tar.gz">http://downloads.yoctoproject.org/mirror/sources/logrotate-$=
{PV}.tar.gz</a> \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
act-as-mv-when-rotate.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://update-the-manual.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 file://disable-check-different-filesystems.patch \<br>&gt; -=
-<br>&gt; 2.7.4<br>&gt;<br>&gt; --<br>&gt; ________________________________=
_______________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"m=
ailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.ope=
nembedded.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/=
openembedded-core</a></div></div>

--94eb2c1a54fa17d27b054c3e5c42--
