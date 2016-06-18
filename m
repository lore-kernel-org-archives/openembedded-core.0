Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id AFF616080F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 12:56:57 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id d132so153101061oig.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G1Xy6vkck/WciBfUA+co57vBClSwWIT7GlgyYayXOVA=;
	b=0nGbt8pZD4wtavj4NnBJML0M7+AqJ4kxc1uC3NMFS8/hewLnd3MRHX9PLQ7YmSkbJv
	ghTRiopae1uYqD2WhxVIq1X0Goq91rdg+d5UoCW4ZEON0SqccrHILhxbCHbekDQgzODt
	EISAK2F31cfLM3IJVVYafSh5WVrEmotHViNX0kyeeusFBLvjRixyA3eGJKjRFCtHf9PM
	bL2ypi58bh6v1cKIyuLXr5f1TxTqPGj7DqxGwi+0+S3LTK18rmImiS5m7V/zcd0rWDh7
	kwAa87tjc2YBR/d99EH96VZH+OuLE6jnYGPLWPJqX0I7CcfXZyFfM7dns0umnPBD23jc
	Spkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G1Xy6vkck/WciBfUA+co57vBClSwWIT7GlgyYayXOVA=;
	b=eDnRwI/a3NAuQZapART4dpS9Q4/AujNTHsS3c8Hrjda3A8SsSu6w7nUpvhIb41ZT62
	BBjp51hxYF+XerGUUsGeADeexhpiX+g6Fj+RGlaXHuEKPJ+t5K13Sb7MzFHfFinWBUHC
	Vwms1HH3S2coLbw9AFMFJ3Uq3zR0pQt7jF0V4DPuf2Ck8NF9mXs5iNRL7aPWIT9cmcQs
	XZaSvdLccWKxn/Dvvb77wuQbuANiD/iiyDl/OP14pk35vsRr4cAwxdoZFWyZc7bX/N+0
	3/2gYJ/438S96XGgghP73EBOogpIG0tfI5qYfp0odQJUJ5zMlcL+GSOpz3+3iJVMHvYG
	WX7g==
X-Gm-Message-State: ALyK8tKe4Rue7QySPap3N9rKHRH6gNE1gDrztBsTsgFc3Rl0dv7aaX2Teu0f6zZ/+oEwVXrMmJDufCRXfSyxeG0u
X-Received: by 10.202.197.214 with SMTP id v205mr3402364oif.63.1466254617551; 
	Sat, 18 Jun 2016 05:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Sat, 18 Jun 2016 05:56:28 -0700 (PDT)
In-Reply-To: <1466175677-27464-1-git-send-email-jpardeiro@rapyuta-robotics.com>
References: <1466175677-27464-1-git-send-email-jpardeiro@rapyuta-robotics.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sat, 18 Jun 2016 15:56:28 +0300
Message-ID: <CAHiDW_GLHV0Kzk5mYpXqKs0w0LfncThfp1DbhzVndzCMm4Ftdw@mail.gmail.com>
To: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cmake.bbclass: set the modules directory correctly
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
X-List-Received-Date: Sat, 18 Jun 2016 12:56:57 -0000
Content-Type: multipart/alternative; boundary=001a113e388ca13e6805358d012a

--001a113e388ca13e6805358d012a
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 18:01, Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
wrote:
>
> The CMake recipes contain a mismatch between the environmental variable
> which defines where the Modules are installed and the location where they
> actually are. This patch fixes the environmental variable to point to the
> proper folder defined according to the cmake version.
>
> Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
> ---
>  meta/classes/cmake.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index e788310..6dbac2b 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -74,7 +74,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
>  set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
>
>  # Use native cmake modules
> -list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
> +list(APPEND CMAKE_MODULE_PATH
"${STAGING_DATADIR}/cmake-\${CMAKE_MAJOR_VERSION}.\${CMAKE_MINOR_VERSION}/Modules/"


This broke "bitbake cmake":

| CMake Error at
/home/jku/src/poky/build/tmp/work/core2-64-poky-linux/cmake/3.5.2-r0/toolchain.cmake:34
(list):
|   Syntax error in cmake code at
|
|
/home/jku/src/poky/build/tmp/work/core2-64-poky-linux/cmake/3.5.2-r0/toolchain.cmake:34
|
|   when parsing string
|
|
/home/jku/src/poky/build/tmp/sysroots/qemux86-64/usr/share/cmake-\3.5.${CMAKE_MINOR_VERSION}/Modules/
|
|   Invalid character escape '\3'.
| Call Stack (most recent call first):
|
/home/jku/src/poky/build/tmp/sysroots/x86_64-linux/usr/share/cmake-3.5/Modules/CMakeDetermineSystem.cmake:98
(include)
|   CMakeLists.txt:19 (project)


>
>
>
>  # add for non /usr/lib libdir, e.g. /usr/lib64
>  set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113e388ca13e6805358d012a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 June 2016 at 18:01, Jose Pardeiro &lt;<a href=3D"mai=
lto:jpardeiro@rapyuta-robotics.com">jpardeiro@rapyuta-robotics.com</a>&gt; =
wrote:<br>&gt;<br>&gt; The CMake recipes contain a mismatch between the env=
ironmental variable<br>&gt; which defines where the Modules are installed a=
nd the location where they<br>&gt; actually are. This patch fixes the envir=
onmental variable to point to the<br>&gt; proper folder defined according t=
o the cmake version.<br>&gt;<br>&gt; Signed-off-by: Jose Pardeiro &lt;<a hr=
ef=3D"mailto:jpardeiro@rapyuta-robotics.com">jpardeiro@rapyuta-robotics.com=
</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/classes/cmake.bbclass | 2 +-<br>&gt=
; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff =
--git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<br>&gt; ind=
ex e788310..6dbac2b 100644<br>&gt; --- a/meta/classes/cmake.bbclass<br>&gt;=
 +++ b/meta/classes/cmake.bbclass<br>&gt; @@ -74,7 +74,7 @@ set( ENV{QT_CON=
F_PATH} ${WORKDIR}/qt.conf )<br>&gt; =C2=A0set( CMAKE_INSTALL_RPATH ${OECMA=
KE_RPATH} )<br>&gt;<br>&gt; =C2=A0# Use native cmake modules<br>&gt; -list(=
APPEND CMAKE_MODULE_PATH &quot;${STAGING_DATADIR}/cmake/Modules/&quot;)<br>=
&gt; +list(APPEND CMAKE_MODULE_PATH &quot;${STAGING_DATADIR}/cmake-\${CMAKE=
_MAJOR_VERSION}.\${CMAKE_MINOR_VERSION}/Modules/&quot;<br><br><br>This brok=
e &quot;bitbake cmake&quot;:<br><br>| CMake Error at /home/jku/src/poky/bui=
ld/tmp/work/core2-64-poky-linux/cmake/3.5.2-r0/toolchain.cmake:34 (list):<b=
r>| =C2=A0 Syntax error in cmake code at<br>| <br>| =C2=A0 =C2=A0 /home/jku=
/src/poky/build/tmp/work/core2-64-poky-linux/cmake/3.5.2-r0/toolchain.cmake=
:34<br>| <br>| =C2=A0 when parsing string<br>| <br>| =C2=A0 =C2=A0 /home/jk=
u/src/poky/build/tmp/sysroots/qemux86-64/usr/share/cmake-\3.5.${CMAKE_MINOR=
_VERSION}/Modules/<br>| <br>| =C2=A0 Invalid character escape &#39;\3&#39;.=
<br>| Call Stack (most recent call first):<br>| =C2=A0 /home/jku/src/poky/b=
uild/tmp/sysroots/x86_64-linux/usr/share/cmake-3.5/Modules/CMakeDetermineSy=
stem.cmake:98 (include)<br>| =C2=A0 CMakeLists.txt:19 (project)<br><br><div=
>=C2=A0<br>&gt;<br>&gt; =C2=A0<br>&gt;<br>&gt; =C2=A0# add for non /usr/lib=
 libdir, e.g. /usr/lib64<br>&gt; =C2=A0set( CMAKE_LIBRARY_PATH ${libdir} ${=
base_libdir})<br>&gt; --<br>&gt; 1.9.1<br>&gt;<br>&gt; --<br>&gt; _________=
______________________________________<br>&gt; Openembedded-core mailing li=
st<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Open=
embedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-core</a></div></div>

--001a113e388ca13e6805358d012a--
