Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RI4Os-0003BY-Aw
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 22:12:06 +0200
Received: by gyc15 with SMTP id 15so4964121gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4jKIieL2PxnCDwsKwP1iSpfBiER0nC6ZlwShIvMR5GY=;
	b=b6l1ZRdi1ukDFCGm2jZJF/Uhgqq+4I5oBOFRhDmBAiLBwUzvc8uieEs+TupvVYFfbk
	bxBKZVmd0fvFZuF5GoIUmUG2PQXvkPN7jsfYM3WtlFn6WWLI0QhVvDvCikM5yLbL3qpr
	3BJk1CybE0kHYCVxtKs1M+a4w6SO4+J51DIoU=
MIME-Version: 1.0
Received: by 10.68.0.195 with SMTP id 3mr8718033pbg.132.1319400365609; Sun, 23
	Oct 2011 13:06:05 -0700 (PDT)
Received: by 10.68.48.230 with HTTP; Sun, 23 Oct 2011 13:06:05 -0700 (PDT)
In-Reply-To: <9d70a72f5ab24bc0424f11311c8eb6b19f3d2987.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<9d70a72f5ab24bc0424f11311c8eb6b19f3d2987.1319394187.git.sgw@linux.intel.com>
Date: Sun, 23 Oct 2011 13:06:05 -0700
Message-ID: <CAMKF1soJ1Kv77_dNijQTWjzk8W+M5z2+yg2SUPxZtADLgum2CA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 24/27] texi2html: Added recipe from OE
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
X-List-Received-Date: Sun, 23 Oct 2011 20:12:06 -0000
Content-Type: multipart/alternative; boundary=bcaec53149a91bd2f804affcd674

--bcaec53149a91bd2f804affcd674
Content-Type: text/plain; charset=UTF-8

On Sunday, October 23, 2011, Saul Wold <sgw@linux.intel.com> wrote:
> Needed to build oe-core with oe-core

Oe-Core with oe-core did u mean meta-oe in one place ?
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/texi2html/texi2html_1.82.bb |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/texi2html/texi2html_1.82.bb
>
> diff --git a/meta/recipes-extended/texi2html/texi2html_1.82.bbb/meta/recipes-extended/texi2html/
texi2html_1.82.bb
> new file mode 100644
> index 0000000..f19b576
> --- /dev/null
> +++ b/meta/recipes-extended/texi2html/texi2html_1.82.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Perl script that converts Texinfo to HTML"
> +HOMEPAGE    = "http://www.nongnu.org/texi2html/"
> +SECTION     = "console/utils"
> +LICENSE     = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +PR = "r0"
> +
> +SRC_URI     = "
http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2"
> +
> +SRC_URI[md5sum] = "a8a9193c0ac1bec2f3ca7be40a5a82eb"
> +SRC_URI[sha256sum] =
"d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1"
> +
> +inherit autotools
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec53149a91bd2f804affcd674
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, October 23, 2011, Saul Wold &lt;<a href=3D"mailto:sgw@li=
nux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; Needed to build o=
e-core with oe-core<br><br>Oe-Core with oe-core did u mean meta-oe in one p=
lace ?<br>
&gt;<br>&gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel=
.com">sgw@linux.intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/recipes-ex=
tended/texi2html/<a href=3D"http://texi2html_1.82.bb">texi2html_1.82.bb</a>=
 | =C2=A0 14 ++++++++++++++<br>
&gt; =C2=A01 files changed, 14 insertions(+), 0 deletions(-)<br>&gt; =C2=A0=
create mode 100644 meta/recipes-extended/texi2html/<a href=3D"http://texi2h=
tml_1.82.bb">texi2html_1.82.bb</a><br>&gt;<br>&gt; diff --git a/meta/recipe=
s-extended/texi2html/<a href=3D"http://texi2html_1.82.bb">texi2html_1.82.bb=
</a> b/meta/recipes-extended/texi2html/<a href=3D"http://texi2html_1.82.bb"=
>texi2html_1.82.bb</a><br>
&gt; new file mode 100644<br>&gt; index 0000000..f19b576<br>&gt; --- /dev/n=
ull<br>&gt; +++ b/meta/recipes-extended/texi2html/<a href=3D"http://texi2ht=
ml_1.82.bb">texi2html_1.82.bb</a><br>&gt; @@ -0,0 +1,14 @@<br>&gt; +DESCRIP=
TION =3D &quot;Perl script that converts Texinfo to HTML&quot;<br>
&gt; +HOMEPAGE =C2=A0 =C2=A0=3D &quot;<a href=3D"http://www.nongnu.org/texi=
2html/">http://www.nongnu.org/texi2html/</a>&quot;<br>&gt; +SECTION =C2=A0 =
=C2=A0 =3D &quot;console/utils&quot;<br>&gt; +LICENSE =C2=A0 =C2=A0 =3D &qu=
ot;GPLv2&quot;<br>&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D595=
30bdf33659b29e73d4adb9f9f6552&quot;<br>
&gt; +<br>&gt; +PR =3D &quot;r0&quot;<br>&gt; +<br>&gt; +SRC_URI =C2=A0 =C2=
=A0 =3D &quot;<a href=3D"http://download.savannah.gnu.org/releases/texi2htm=
l/${P}.tar.bz2">http://download.savannah.gnu.org/releases/texi2html/${P}.ta=
r.bz2</a>&quot;<br>
&gt; +<br>&gt; +SRC_URI[md5sum] =3D &quot;a8a9193c0ac1bec2f3ca7be40a5a82eb&=
quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;d69c1effc416896409003ea64fdb211=
52cc0a9a7c665d437a0a3bef9b588b4f1&quot;<br>&gt; +<br>&gt; +inherit autotool=
s<br>
&gt; --<br>&gt; 1.7.6.4<br>&gt;<br>&gt;<br>&gt; ___________________________=
____________________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec53149a91bd2f804affcd674--
