Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrBDw-00038V-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:06:12 +0200
Received: by eaal1 with SMTP id l1so227113eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=M+/OSm8RT1JAKhgZXtDD2ioZjdTi5ZVmfVd8AWp3t9U=;
	b=GeKJoQex1Q62EWHXneuKtduENlOKDXurlv7vOi/jYMFXkL5IFen6xph3NODD2v7vWg
	KqWDld2L8yJ0MGuNx4x8sXdsgOBBq/D37H+rZIxLJIG+FzPy/Df32Kcm1c5MelhaN5S0
	mzzHlwCPzgz5s7oKF7Mo6cBp8ZGCh1JbD7PNJZuq4GKK6k4GlxDWbNBqzOcFRl88vBzv
	SbhEv9oAZGtSYFGqx2xPeGNSLrIBqoKNJfK5OCH7n7u2dxQOTicp6QoVqTMqmCqGddat
	+YMk4hD1P5krohwIitlCzAwfQQwhpZ8N38TzJjVP/ZEPXc2EkIF8HIqMsMhnbHMKMVNR
	mndA==
MIME-Version: 1.0
Received: by 10.14.225.198 with SMTP id z46mr3983475eep.25.1342544092714; Tue,
	17 Jul 2012 09:54:52 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Tue, 17 Jul 2012 09:54:52 -0700 (PDT)
In-Reply-To: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
Date: Tue, 17 Jul 2012 09:54:52 -0700
Message-ID: <CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 17:06:12 -0000
Content-Type: multipart/alternative; boundary=047d7b66fc23bdd76a04c5096734

--047d7b66fc23bdd76a04c5096734
Content-Type: text/plain; charset=UTF-8

Why is recipe renamed

On Wednesday, July 11, 2012, Bogdan Marinescu <bogdan.a.marinescu@intel.com>
wrote:
> Tested by building core-image-sato-sdk.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.3.bb
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.bb
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
> index f11e687..0a068be 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.22"
>  EGLIBCVERSION ?= "2.15"
>  UCLIBCVERSION ?= "0.9.33"
> -LINUXLIBCVERSION ?= "3.4"
> +LINUXLIBCVERSION ?= "3.4.3"
>
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
> diff --git a/meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.3.bb
> new file mode 100644
> index 0000000..6f8d9e8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> @@ -0,0 +1,6 @@
> +require linux-libc-headers.inc
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
> +SRC_URI[sha256sum] =
"17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
> diff --git a/meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_3.4.bb
> deleted file mode 100644
> index 9e8c88f..0000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require linux-libc-headers.inc
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
> -SRC_URI[sha256sum] =
"a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b66fc23bdd76a04c5096734
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why is recipe renamed<br><br>On Wednesday, July 11, 2012, Bogdan Marinescu =
&lt;<a href=3D"mailto:bogdan.a.marinescu@intel.com">bogdan.a.marinescu@inte=
l.com</a>&gt; wrote:<br>&gt; Tested by building core-image-sato-sdk.<br>&gt=
;<br>
&gt; Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marines=
cu@intel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=
=A0meta/conf/distro/include/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-<br>&gt; =C2=A0.../linux-libc-headers/<a href=3D"http://l=
inux-libc-headers_3.4.3.bb">linux-libc-headers_3.4.3.bb</a> | =C2=A0 =C2=A0=
6 ++++++<br>
&gt; =C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_3.4.=
bb">linux-libc-headers_3.4.bb</a> =C2=A0 | =C2=A0 =C2=A06 ------<br>&gt; =
=C2=A03 files changed, 7 insertions(+), 7 deletions(-)<br>&gt; =C2=A0create=
 mode 100644 meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux=
-libc-headers_3.4.3.bb">linux-libc-headers_3.4.3.bb</a><br>
&gt; =C2=A0delete mode 100644 meta/recipes-kernel/linux-libc-headers/<a hre=
f=3D"http://linux-libc-headers_3.4.bb">linux-libc-headers_3.4.bb</a><br>&gt=
;<br>&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/c=
onf/distro/include/tcmode-default.inc<br>
&gt; index f11e687..0a068be 100644<br>&gt; --- a/meta/conf/distro/include/t=
cmode-default.inc<br>&gt; +++ b/meta/conf/distro/include/tcmode-default.inc=
<br>&gt; @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
&gt; =C2=A0BINUVERSION ?=3D &quot;2.22&quot;<br>&gt; =C2=A0EGLIBCVERSION ?=
=3D &quot;2.15&quot;<br>&gt; =C2=A0UCLIBCVERSION ?=3D &quot;0.9.33&quot;<br=
>&gt; -LINUXLIBCVERSION ?=3D &quot;3.4&quot;<br>&gt; +LINUXLIBCVERSION ?=3D=
 &quot;3.4.3&quot;<br>
&gt;<br>&gt; =C2=A0PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>=
&gt; =C2=A0PREFERRED_VERSION_gcc-cross ?=3D &quot;${GCCVERSION}&quot;<br>&g=
t; diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://li=
nux-libc-headers_3.4.3.bb">linux-libc-headers_3.4.3.bb</a> b/meta/recipes-k=
ernel/linux-libc-headers/<a href=3D"http://linux-libc-headers_3.4.3.bb">lin=
ux-libc-headers_3.4.3.bb</a><br>
&gt; new file mode 100644<br>&gt; index 0000000..6f8d9e8<br>&gt; --- /dev/n=
ull<br>&gt; +++ b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_3.4.3.bb">linux-libc-headers_3.4.3.bb</a><br>&gt; @@ -0,=
0 +1,6 @@<br>
&gt; +require linux-libc-headers.inc<br>&gt; +<br>&gt; +PR =3D &quot;r0&quo=
t;<br>&gt; +<br>&gt; +SRC_URI[md5sum] =3D &quot;3aefa02db55715d627ed23a0166=
7057d&quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;17f1256daa289dde1a0a587c9=
753556d37a52770f7c4efcf2666fd4796a6eacc&quot;<br>
&gt; diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_3.4.bb">linux-libc-headers_3.4.bb</a> b/meta/recipes-ker=
nel/linux-libc-headers/<a href=3D"http://linux-libc-headers_3.4.bb">linux-l=
ibc-headers_3.4.bb</a><br>
&gt; deleted file mode 100644<br>&gt; index 9e8c88f..0000000<br>&gt; --- a/=
meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-headers=
_3.4.bb">linux-libc-headers_3.4.bb</a><br>&gt; +++ /dev/null<br>&gt; @@ -1,=
6 +0,0 @@<br>
&gt; -require linux-libc-headers.inc<br>&gt; -<br>&gt; -PR =3D &quot;r0&quo=
t;<br>&gt; -<br>&gt; -SRC_URI[md5sum] =3D &quot;146af0160fc7a60cf9acf44aec1=
3482b&quot;<br>&gt; -SRC_URI[sha256sum] =3D &quot;a797a15d0b6228381507c14ec=
f4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d&quot;<br>
&gt; --<br>&gt; 1.7.9.5<br>&gt;<br>&gt;<br>&gt; ___________________________=
____________________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--047d7b66fc23bdd76a04c5096734--
