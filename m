Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id C377276294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:46:56 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id x131so151490810ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WMQJtbwkdXmzhRpnb2nD4cN4bmbKgyCQY+XjToKnDuc=;
	b=uaWc7B6nx3m3JMwQB0AlUli+a9A6agv1aKMAlmxVEfl+sv2m1xuFSTHt/R/BK3Tr+H
	cjmPC6FSKeqhNvVxDAZimyXL8Nqs+KBR1XYcwTdkb8CVXdVqNdsvkk2KAVq03GYiSXDh
	cVgsVhzT7ea0/Uf+klvnxqeXMjU2sT8Uo25X/Nvmrb0eVlorQ6jCd9BtX+5sUkMyYtXA
	uc6sqjIkpokGw3HKE5SHGldFdkQjAPLa6lNT7fkGS3LF/59ffUW7VACxLnNPmxFoEO/R
	KAxZTyniwtcP+Xdvz+atWrZLjsrtGekuIYURpLLHw6d5bG9c8oqej6weBjx8IlS6pQ32
	m7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WMQJtbwkdXmzhRpnb2nD4cN4bmbKgyCQY+XjToKnDuc=;
	b=eePVRmK8WDy7WkClgKU3A9APrmhZY9pq5dNnobyHzc34NfCtoP3rbJ/8BdMnDQLEJ4
	4efl8HdT8xtkie8BKg1jN25hDoUOQusSfGtjCHjDhkm6bUfDvWt9tBRJAmbHUXENgeJZ
	HrzfQF2BmYAb2Vz7UtcU1HJpzeyQnZ4SnY/aTooSMSGGHqTiMS1VyFmoiJm37aH01ira
	F7GVud4FEmg+cX9j8kNcsp8MbDP//lOYBE6ZPrQnVNqw5QDBoonOUV5luoakg3YCVLNs
	NskgOF74NoS9frta/JnX6JyLTMA20VK5Gqa/3xIuTFyVWKgeHIQMf8FZx6q9dAFlQV+T
	t7Kg==
X-Gm-Message-State: AEkooutC1jRb9uOgRQfqPs+Y5XMaSZrJiaY8DkF4bpiaihvCo7f4TvZmr93uVIohCyAxgmftTMXVUNRbKp1OTfbp
X-Received: by 10.107.154.196 with SMTP id c187mr28892009ioe.99.1471963617659; 
	Tue, 23 Aug 2016 07:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 07:46:37 -0700 (PDT)
In-Reply-To: <b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 15:46:37 +0100
Message-ID: <CAJTo0LYBVwQgyCKOuobgZ+Zz25v38gLydPDGspxydb0=MiL5=A@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] [cross] export CC family from BUILD_* for cross compilers
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
X-List-Received-Date: Tue, 23 Aug 2016 14:46:59 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e8dcffa053abe3c15

--001a1140e81e8dcffa053abe3c15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FYI, git am strips anything inside [square brackets] when applying, so your
[cross] etc doesn't make it into the series.  If you submit a v2 please
change [cross] to cross:.

Ross

On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> cross-compilers are native recipes that need to be compiled by the host's
> compiler. However then do not use native.bbclass
>
> As a consequence, the various CC, CXX etc environment variables are not
> correctly set and they will not honor the host compiler name provided
> by the BUILD_* variables.
>
> Signed-off-by: J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr>
> ---
>  meta/classes/cross.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 81d1c9d..8d1e779 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -68,4 +68,16 @@ do_install () {
>
>  USE_NLS =3D "no"
>
> +export CC =3D "${BUILD_CC}"
> +export CXX =3D "${BUILD_CXX}"
> +export FC =3D "${BUILD_FC}"
> +export CPP =3D "${BUILD_CPP}"
> +export LD =3D "${BUILD_LD}"
> +export CCLD =3D "${BUILD_CCLD}"
> +export AR =3D "${BUILD_AR}"
> +export AS =3D "${BUILD_AS}"
> +export RANLIB =3D "${BUILD_RANLIB}"
> +export STRIP =3D "${BUILD_STRIP}"
> +export NM =3D "${BUILD_NM}"
> +
>  inherit nopackages
> --
> git-series 0.8.9
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140e81e8dcffa053abe3c15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI, git am strips anything inside [square brackets] when =
applying, so your [cross] etc doesn&#39;t make it into the series.=C2=A0 If=
 you submit a v2 please change [cross] to cross:.<div><br></div><div>Ross</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 23 A=
ugust 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile.fr</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">cross-compilers are =
native recipes that need to be compiled by the host&#39;s<br>
compiler. However then do not use native.bbclass<br>
<br>
As a consequence, the various CC, CXX etc environment variables are not<br>
correctly set and they will not honor the host compiler name provided<br>
by the BUILD_* variables.<br>
<br>
Signed-off-by: J=C3=A9r=C3=A9my Rosen &lt;<a href=3D"mailto:jeremy.rosen@sm=
ile.fr">jeremy.rosen@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes/cross.bbclass | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+), 0 deletions(-)<br>
<br>
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass<br>
index 81d1c9d..8d1e779 100644<br>
--- a/meta/classes/cross.bbclass<br>
+++ b/meta/classes/cross.bbclass<br>
@@ -68,4 +68,16 @@ do_install () {<br>
<br>
=C2=A0USE_NLS =3D &quot;no&quot;<br>
<br>
+export CC =3D &quot;${BUILD_CC}&quot;<br>
+export CXX =3D &quot;${BUILD_CXX}&quot;<br>
+export FC =3D &quot;${BUILD_FC}&quot;<br>
+export CPP =3D &quot;${BUILD_CPP}&quot;<br>
+export LD =3D &quot;${BUILD_LD}&quot;<br>
+export CCLD =3D &quot;${BUILD_CCLD}&quot;<br>
+export AR =3D &quot;${BUILD_AR}&quot;<br>
+export AS =3D &quot;${BUILD_AS}&quot;<br>
+export RANLIB =3D &quot;${BUILD_RANLIB}&quot;<br>
+export STRIP =3D &quot;${BUILD_STRIP}&quot;<br>
+export NM =3D &quot;${BUILD_NM}&quot;<br>
+<br>
=C2=A0inherit nopackages<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
git-series 0.8.9<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1140e81e8dcffa053abe3c15--
