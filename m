Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id A621A72F2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:56:59 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id j9so38764163ywj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IKqjBqAQlJTkwxdtF3nhY1MaQOI1E54O0PCVWZc0yo4=;
	b=jSUtMEFB6h+wRhLEfHDQ1paeI2vzglRgviK/643kjZT0hdrNaR+RtX++8rbfG7OA2t
	DP+w2gekmpevxpkq3AGFFqhKcOptcbDFN8CY1sJvqGQh0WHDmts4z3EkEvr2nKiNuPhz
	0yoQr5B/CzaJQxq25iMdnskBOSljq0iCH9hWB8IpzihZiS8+eKhG/eyaWz5r59a5wzId
	FWtB5TK1f4S1Z9C/mn6afYihdNaBFZ9/U1fOU59kN0Z9GeaqzxxhU6jLc3RQGRSwSAUp
	iwMYkB3zF4Y0SuQm5R1iSSFc7MHjFlE005SLzwXOkLN9HM5GLz6B31i2YcevMhJldGtj
	FFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IKqjBqAQlJTkwxdtF3nhY1MaQOI1E54O0PCVWZc0yo4=;
	b=ati13/byzFtcX4DUBWRPJz9XnWtcqSf2emjWdK2DzaVLfV4NABWsi3QpNtUblythxG
	pzc8XogTKi2akOMW7ZIOMH9wIC+naxtJ4vFXmGXrqClWvCz0RAQKJfo3+RLUaobE7dcA
	Yr0BDboRWJxfPqYn4SaJk+hnMtzZk/DBr1wCKphVmiUjS5eOVol+6M65EZB6xKPOVWU9
	SU2NSN+H3xk9kU4pfZaSpKqtG7DzbZIbcBuevKvf39Lo8JpbQBS2LWo963lLTt87/7mQ
	zo7soT01L/n26z126/5MgjlDj73cmiAl9W72cfvndhIUWYx8mYDrxRFBBg/gVoVQ+PYH
	BoPw==
X-Gm-Message-State: AN3rC/6ZIOeqUxTuK5GKFvESQUDLcKfh6tM2zqyR4/wF9Y1SCEwMn63A
	po9mVRYMLFAqROUZMT0QQ6ZIVpiTLfIG
X-Received: by 10.129.138.66 with SMTP id a63mr6037679ywg.260.1492696621156;
	Thu, 20 Apr 2017 06:57:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Thu, 20 Apr 2017 06:56:30 -0700 (PDT)
In-Reply-To: <1492695139-21316-1-git-send-email-jussi.kukkonen@intel.com>
References: <1492695139-21316-1-git-send-email-jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 20 Apr 2017 16:56:30 +0300
Message-ID: <CAHiDW_HPFdLdUpUaSgETwQOGDHoGnZxu5famudB61fa2J4LLSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Bump SONAME to match the ABI
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
X-List-Received-Date: Thu, 20 Apr 2017 13:57:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c0826f8dcbe11054d9983c7

--94eb2c0826f8dcbe11054d9983c7
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 16:32, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Commit 7933fbbc637 "Security fix Drown via 1.0.2g update" included
> a version-script change from Debian that was an ABI change. It did
> not include the soname change that Debian did so we have been calling
> our ABI 1.0.0 but it really matches what others call 1.0.2.
>

Just so it's clear: the new ABI was in krogoth and morty already with 1.0.0
soname. Not sure which option is least bad here.

  Jussi


> Bump SONAME to match the ABI. In practice this changes both libcrypto
> and libssl sonames from 1.0.0 to 1.0.2.
>
> For background: Upstream does not do sonames so these are set by
> distros. In this case the ABI changes based on a build time
> configuration! Debian took the ABI changing configuration and bumped
> soname but e.g. Ubuntu kept the deprecated API and just made it not
> work, keeping soname. So both have same version of openssl but support
> different ABI (and expose different SONAME).
>
> Fixes [YOCTO #11396].
>
> Thanks to Alexander Larsson et al for detective work.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../openssl/openssl/debian1.0.2/soname.patch                | 13
> +++++++++++++
>  meta/recipes-connectivity/openssl/openssl_1.0.2k.bb         |  1 +
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.0.2/
> soname.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
> b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
> new file mode 100644
> index 0000000..f9cdfec
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
> @@ -0,0 +1,13 @@
> +Index: openssl-1.0.2d/crypto/opensslv.h
> +===================================================================
> +--- openssl-1.0.2d.orig/crypto/opensslv.h
> ++++ openssl-1.0.2d/crypto/opensslv.h
> +@@ -88,7 +88,7 @@ extern "C" {
> +  * should only keep the versions that are binary compatible with the
> current.
> +  */
> + # define SHLIB_VERSION_HISTORY ""
> +-# define SHLIB_VERSION_NUMBER "1.0.0"
> ++# define SHLIB_VERSION_NUMBER "1.0.2"
> +
> +
> + #ifdef  __cplusplus
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> index 1c104142..83d1a50 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> @@ -30,6 +30,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://debian/no-symbolic.patch \
>              file://debian/pic.patch \
>              file://debian1.0.2/version-script.patch \
> +            file://debian1.0.2/soname.patch \
>              file://openssl_fix_for_x32.patch \
>              file://fix-cipher-des-ede3-cfb1.patch \
>              file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> \
> --
> 2.1.4
>
>

--94eb2c0826f8dcbe11054d9983c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
0 April 2017 at 16:32, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Commit 7933fbbc637 &qu=
ot;Security fix Drown via 1.0.2g update&quot; included<br>
a version-script change from Debian that was an ABI change. It did<br>
not include the soname change that Debian did so we have been calling<br>
our ABI 1.0.0 but it really matches what others call 1.0.2.<br></blockquote=
><div><br></div><div>Just so it&#39;s clear: the new ABI was in krogoth and=
 morty already with 1.0.0 soname. Not sure which option is least bad here.<=
/div><div><br></div><div>=C2=A0 Jussi</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Bump SONAME to match the ABI. In practice this changes both libcrypto<br>
and libssl sonames from 1.0.0 to 1.0.2.<br>
<br>
For background: Upstream does not do sonames so these are set by<br>
distros. In this case the ABI changes based on a build time<br>
configuration! Debian took the ABI changing configuration and bumped<br>
soname but e.g. Ubuntu kept the deprecated API and just made it not<br>
work, keeping soname. So both have same version of openssl but support<br>
different ABI (and expose different SONAME).<br>
<br>
Fixes [YOCTO #11396].<br>
<br>
Thanks to Alexander Larsson et al for detective work.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/debian1.0.<wbr>2/soname.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++++++<br>
=C2=A0meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 14 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/deb=
ian1.0.2/<wbr>soname.patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl/debian1.0.2/<wb=
r>soname.patch b/meta/recipes-connectivity/<wbr>openssl/openssl/debian1.0.2=
/<wbr>soname.patch<br>
new file mode 100644<br>
index 0000000..f9cdfec<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>openssl/openssl/debian1.0.2/<wbr>sonam=
e.patch<br>
@@ -0,0 +1,13 @@<br>
+Index: openssl-1.0.2d/crypto/<wbr>opensslv.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- openssl-1.0.2d.orig/crypto/<wbr>opensslv.h<br>
++++ openssl-1.0.2d/crypto/<wbr>opensslv.h<br>
+@@ -88,7 +88,7 @@ extern &quot;C&quot; {<br>
+=C2=A0 * should only keep the versions that are binary compatible with the=
 current.<br>
+=C2=A0 */<br>
+ # define SHLIB_VERSION_HISTORY &quot;&quot;<br>
+-# define SHLIB_VERSION_NUMBER &quot;1.0.0&quot;<br>
++# define SHLIB_VERSION_NUMBER &quot;1.0.2&quot;<br>
+<br>
+<br>
+ #ifdef=C2=A0 __cplusplus<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://opens=
sl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> b/=
meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.2k.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
index 1c104142..83d1a50 100644<br>
--- a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
@@ -30,6 +30,7 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/<wbr>util/ \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/no-symbolic.<=
wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian/pic.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian1.0.2/version-=
<wbr>script.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://debian1.0.2/soname.<wbr>p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl_fix_for_x32.=
<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-cipher-des-ede3-=
<wbr>cfb1.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-avoid-NULL-<=
wbr>pointer-dereference-in-EVP_<wbr>DigestInit_ex.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--94eb2c0826f8dcbe11054d9983c7--
