Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkjL2-0001Rh-Ps
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:06:52 +0200
Received: by eekd49 with SMTP id d49so1530224eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/fUywCgjRlAlb+VRa60nsTk8nzDQxK0g2rQ3Siyx8KM=;
	b=Xo2yAU34YphuSs3VOYVkiSlLHgMK33VdCfsK809PjuNRotrU4QAMrpMn9c3EygXYK3
	SUAKr0vWL9KfrBKjwbMS9YDPm86ycBEPjE/bWHCDXbUcl2hMo19YRHpdb2bOEuSSPi3j
	iqQLQka1aBvF5comznQ70ZcAFertm4tKAntxBarGbbAJeqg1VGbBHSZASKvs1IvIfzxZ
	nWolZIuqOKgUEbNZARkB5pyH4wZy+3rvcqzz3lUAK6cwwVtn9XnHaZy/g/h0r6/LGqjy
	V7a7aeua8aVuuuA7iFJnNPHzVN9tbQ4kP2fEf+0z0xX23ulvHx1LnDaIIZMkoZMwP9aB
	F5iw==
MIME-Version: 1.0
Received: by 10.14.37.206 with SMTP id y54mr1041502eea.218.1341006953699; Fri,
	29 Jun 2012 14:55:53 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 14:55:53 -0700 (PDT)
In-Reply-To: <1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
Date: Fri, 29 Jun 2012 14:55:53 -0700
Message-ID: <CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHhQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Fri, 29 Jun 2012 22:06:53 -0000
Content-Type: multipart/alternative; boundary=bcaec517a71c1dda8404c3a38318

--bcaec517a71c1dda8404c3a38318
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:
> We don't want to force everyone to be stripping the -Os
> flags from their u-boot builds.  Remove it, since it pertains
> to an old toolchain issue that is no longer relevant, and it
> breaks the powerpc mpc8315.

Its fixed that's right but I am curious how does it break with -O2
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc |    3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
b/meta/recipes-bsp/u-boot/u-boot.inc
> index a13eddc..0ed5fd9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -7,9 +7,6 @@ inherit deploy
>
>  PARALLEL_MAKE=""
>
> -# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
> -EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
> -
>  python () {
>        if not d.getVar("UBOOT_MACHINE", True):
>                PN = d.getVar("PN", True)
> --
> 1.7.9.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec517a71c1dda8404c3a38318
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Paul Gortmaker &lt;<a href=3D"mailto:paul=
.gortmaker@windriver.com">paul.gortmaker@windriver.com</a>&gt; wrote:<br>&g=
t; We don&#39;t want to force everyone to be stripping the -Os<br>&gt; flag=
s from their u-boot builds. =C2=A0Remove it, since it pertains<br>
&gt; to an old toolchain issue that is no longer relevant, and it<br>&gt; b=
reaks the powerpc mpc8315.<br><br>Its fixed that&#39;s right but I am curio=
us how does it break with -O2<br>&gt;<br>&gt; Signed-off-by: Paul Gortmaker=
 &lt;<a href=3D"mailto:paul.gortmaker@windriver.com">paul.gortmaker@windriv=
er.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | =C2=A0 =C2=A03 =
---<br>&gt; =C2=A01 file changed, 3 deletions(-)<br>&gt;<br>&gt; diff --git=
 a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc<=
br>&gt; index a13eddc..0ed5fd9 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>&gt; +++ b/meta/recipes-bs=
p/u-boot/u-boot.inc<br>&gt; @@ -7,9 +7,6 @@ inherit deploy<br>&gt;<br>&gt; =
=C2=A0PARALLEL_MAKE=3D&quot;&quot;<br>&gt;<br>&gt; -# GCC 4.5.1 builds unus=
able binaries using -Os, remove it from OPTFLAGS<br>
&gt; -EXTRA_OEMAKE =3D &quot;CROSS_COMPILE=3D${TARGET_PREFIX} OPTFLAGS=3D&#=
39;-O2&#39;&quot;<br>&gt; -<br>&gt; =C2=A0python () {<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if not d.getVar(&quot;UBOOT_MACHINE&quot;, True):<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PN =3D d.getVar(&quot;P=
N&quot;, True)<br>
&gt; --<br>&gt; 1.7.9.6<br>&gt;<br>&gt;<br>&gt; ___________________________=
____________________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec517a71c1dda8404c3a38318--
