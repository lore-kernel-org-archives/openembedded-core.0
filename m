Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkjOg-0001Ys-DY
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:10:38 +0200
Received: by eekd49 with SMTP id d49so1530736eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SX2x86mjm0zUBz7H9ucnD6+A4JJeok47Vyqvnbunsrc=;
	b=LImqURffbyiTIEJcH0HkN4OTKkwjxHc2+wah+Bc3rPJGijIXGnFZsEEHsY1zIrdU51
	5Q6IWMmynA48qt5/Sj2ZigXntleTa2ug5E6B2S7DmoDtfA8OtD1Br7LX59BateWKnSO/
	NU1IXdJJakX75RP6G+jdv26rbTOwWO4tCtRPcGzkyHyySs/mDoSL4BvDPY5KKKDaDlxx
	QZI4AWYJ9sLqgw/ufFnsNLut5HnqIZq1xAU4mnZwiLiagzWO15wbDIPBzOR5Quut9Nn3
	NjWZWOf1OVxagmwVlnFZRiJkhJSOdVkFJGD8zpkILIx/TITOGEnBmYjmF4P/uXwDEAtn
	h1FQ==
MIME-Version: 1.0
Received: by 10.14.37.76 with SMTP id x52mr1072006eea.102.1341007182055; Fri,
	29 Jun 2012 14:59:42 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 14:59:42 -0700 (PDT)
In-Reply-To: <53ce203eec118e3d5b0faac4c8e71f69c9857146.1340998763.git.dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
	<53ce203eec118e3d5b0faac4c8e71f69c9857146.1340998763.git.dvhart@linux.intel.com>
Date: Fri, 29 Jun 2012 14:59:42 -0700
Message-ID: <CAMKF1sqrg5O7A1Tt=XjTzc0PfV5ZKcETe1tJfHOP460NNmpojw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 4/5] tasl-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
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
X-List-Received-Date: Fri, 29 Jun 2012 22:10:38 -0000
Content-Type: multipart/alternative; boundary=90e6ba6153daba478804c3a3901b

--90e6ba6153daba478804c3a3901b
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Darren Hart <dvhart@linux.intel.com> wrote:
> Add kernel-dev to task-core-sdk so it will be included with
> core-image-sato-sdk and similar image recipes. This enables
> building Linux kernel modules on the target.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Jessica Zhang <jessica.zhang@intel.com>
> ---
>  meta/recipes-core/tasks/task-core-sdk.bb |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/tasks/task-core-sdk.bbb/meta/recipes-core/tasks/
task-core-sdk.bb
> index ec6cdcc..d65a53a 100644
> --- a/meta/recipes-core/tasks/task-core-sdk.bb
> +++ b/meta/recipes-core/tasks/task-core-sdk.bb
> @@ -7,7 +7,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  DEPENDS = "task-core-console"
> -PR = "r7"
> +PR = "r8"
>
>  ALLOW_EMPTY = "1"
>  #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
> @@ -46,7 +46,8 @@ RDEPENDS_task-core-sdk = "\
>     distcc \
>     ldd \
>     file \
> -    tcl"
> +    tcl \
> +    kernel-dev"

Doesn't this.make sdk to be machine specific now
>
>  #python generate_sdk_pkgs () {
>  #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
> --
> 1.7.10.2
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>

--90e6ba6153daba478804c3a3901b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Darren Hart &lt;<a href=3D"mailto:dvhart@=
linux.intel.com">dvhart@linux.intel.com</a>&gt; wrote:<br>&gt; Add kernel-d=
ev to task-core-sdk so it will be included with<br>&gt; core-image-sato-sdk=
 and similar image recipes. This enables<br>
&gt; building Linux kernel modules on the target.<br>&gt;<br>&gt; Signed-of=
f-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linu=
x.intel.com</a>&gt;<br>&gt; CC: Jessica Zhang &lt;<a href=3D"mailto:jessica=
.zhang@intel.com">jessica.zhang@intel.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/recipes-core/tasks/<a href=3D"http://task-core-=
sdk.bb">task-core-sdk.bb</a> | =C2=A0 =C2=A05 +++--<br>&gt; =C2=A01 file ch=
anged, 3 insertions(+), 2 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/re=
cipes-core/tasks/<a href=3D"http://task-core-sdk.bb">task-core-sdk.bb</a> b=
/meta/recipes-core/tasks/<a href=3D"http://task-core-sdk.bb">task-core-sdk.=
bb</a><br>
&gt; index ec6cdcc..d65a53a 100644<br>&gt; --- a/meta/recipes-core/tasks/<a=
 href=3D"http://task-core-sdk.bb">task-core-sdk.bb</a><br>&gt; +++ b/meta/r=
ecipes-core/tasks/<a href=3D"http://task-core-sdk.bb">task-core-sdk.bb</a><=
br>
&gt; @@ -7,7 +7,7 @@ LICENSE =3D &quot;MIT&quot;<br>&gt; =C2=A0LIC_FILES_CH=
KSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fde=
b3b58 \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a038436=
1b4de20420&quot;<br>
&gt; =C2=A0DEPENDS =3D &quot;task-core-console&quot;<br>&gt; -PR =3D &quot;=
r7&quot;<br>&gt; +PR =3D &quot;r8&quot;<br>&gt;<br>&gt; =C2=A0ALLOW_EMPTY =
=3D &quot;1&quot;<br>&gt; =C2=A0#PACKAGEFUNCS =3D+ &#39;generate_sdk_pkgs&#=
39;<br>&gt; @@ -46,7 +46,8 @@ RDEPENDS_task-core-sdk =3D &quot;\<br>
&gt; =C2=A0 =C2=A0 distcc \<br>&gt; =C2=A0 =C2=A0 ldd \<br>&gt; =C2=A0 =C2=
=A0 file \<br>&gt; - =C2=A0 =C2=A0tcl&quot;<br>&gt; + =C2=A0 =C2=A0tcl \<br=
>&gt; + =C2=A0 =C2=A0kernel-dev&quot;<br><br>Doesn&#39;t this.make sdk to b=
e machine specific now <br>&gt;<br>&gt; =C2=A0#python generate_sdk_pkgs () =
{<br>
&gt; =C2=A0# =C2=A0 =C2=A0poky_pkgs =3D read_pkgdata(&#39;task-core&#39;, d=
)[&#39;PACKAGES&#39;]<br>&gt; --<br>&gt; 1.7.10.2<br>&gt;<br>&gt; _________=
______________________________________<br>&gt; poky mailing list<br>&gt; <a=
 href=3D"mailto:poky@yoctoproject.org">poky@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/poky">https://lists=
.yoctoproject.org/listinfo/poky</a><br>&gt;

--90e6ba6153daba478804c3a3901b--
