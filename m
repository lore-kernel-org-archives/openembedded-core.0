Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVTbE-00020y-Ic
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:44:16 +0100
Received: by bkbzs2 with SMTP id zs2so9800182bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 11:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=HdtsbO/an1G2/VoWL1OB692DvQ+TNsVZAARoasdyNv8=;
	b=gSvnCZoqYNJzO6ZgWyCSVocp5HZilUyz2xGjqjH1lv+97Xg7/OlxyJoFO7A9NVD3cy
	nqSqnCZXmVPd8JT6E6cs0r9jEigthLvb2iy7CusxPU7ccyLQ56zPCuj8edGC/ZvxxhsR
	QN9741ttWBHlFPjpO/VVO77QPB9Phn7LqNTx0=
MIME-Version: 1.0
Received: by 10.205.126.13 with SMTP id gu13mr51829792bkc.114.1322595456987;
	Tue, 29 Nov 2011 11:37:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 11:37:36 -0800 (PST)
In-Reply-To: <48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
Date: Tue, 29 Nov 2011 17:37:36 -0200
X-Google-Sender-Auth: 47Q_m9vfgnkqGdQhpWen3P8GHWY
Message-ID: <CAP9ODKqsBn9ayDm__2SGuc7Fk9Fv5TiDNF3QhvNDrMyosQK__w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 19:44:16 -0000
Content-Type: multipart/alternative; boundary=00151747b74465328904b2e4c068

--00151747b74465328904b2e4c068
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Nov 29, 2011 at 17:30, <nitin.a.kamble@intel.com> wrote:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> configure runs few checks to make sure c++ compiler and runtime are working
> as expected with the --enable-cxx=detect option. And it enables building
> of libgmpxx library.
>
> Same as earlier the libgmp.so.10.x file is packaged in the libgmp10
> package,
> and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-support/gmp/gmp.inc      |    5 +++++
>  meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
>  2 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/gmp/gmp.inc
> b/meta/recipes-support/gmp/gmp.inc
> index 66349e6..5ba118d 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -14,3 +14,8 @@ ARM_INSTRUCTION_SET = "arm"
>  acpaths = ""
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OECONF += " --enable-cxx=detect"
> +
> +PACKAGES =+ "libgmpxx"
> +FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
> diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bbb/meta/recipes-support/gmp/
> gmp_5.0.2.bb
> index 16bdcbc..873fc3e 100644
> --- a/meta/recipes-support/gmp/gmp_5.0.2.bb
> +++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
> @@ -2,7 +2,7 @@ require gmp.inc
>  LICENSE="LGPLv3&GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>
>  file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
> -PR = "r1"
> +PR = "r2"
>
>  SRC_URI_append += "file://sh4-asmfix.patch \
>                    file://use-includedir.patch "
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151747b74465328904b2e4c068
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">ot=
avio@ossystems.com.br</a>&gt;<br><br><div class=3D"gmail_quote">On Tue, Nov=
 29, 2011 at 17:30,  <span dir=3D"ltr">&lt;<a href=3D"mailto:nitin.a.kamble=
@intel.com">nitin.a.kamble@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;"><div class=3D"im">From: Nitin A Kamble &lt;=
<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt=
;<br>

<br>
configure runs few checks to make sure c++ compiler and runtime are working=
<br>
as expected with the --enable-cxx=3Ddetect option. And it enables building<=
br>
of libgmpxx library.<br>
<br>
Same as earlier the libgmp.so.10.x file is packaged in the libgmp10 package=
,<br>
and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.<br>
<br>
Signed-off-by: Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.co=
m">nitin.a.kamble@intel.com</a>&gt;<br>
</div>Signed-off-by: Phil Blundell &lt;<a href=3D"mailto:philb@gnu.org">phi=
lb@gnu.org</a>&gt;<br>
---<br>
=A0meta/recipes-support/gmp/gmp.inc =A0 =A0 =A0| =A0 =A05 +++++<br>
<div class=3D"im">=A0meta/recipes-support/gmp/<a href=3D"http://gmp_5.0.2.b=
b" target=3D"_blank">gmp_5.0.2.bb</a> | =A0 =A02 +-<br>
=A02 files changed, 6 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gm=
p.inc<br>
</div>index 66349e6..5ba118d 100644<br>
--- a/meta/recipes-support/gmp/gmp.inc<br>
+++ b/meta/recipes-support/gmp/gmp.inc<br>
@@ -14,3 +14,8 @@ ARM_INSTRUCTION_SET =3D &quot;arm&quot;<br>
<div class=3D"im">=A0acpaths =3D &quot;&quot;<br>
<br>
=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot; --enable-cxx=3Ddetect&quot;<br>
+<br>
</div>+PACKAGES =3D+ &quot;libgmpxx&quot;<br>
+FILES_libgmpxx =3D &quot;${libdir}/libgmpxx${SOLIBS}&quot;<br>
<div class=3D"im HOEnZb">diff --git a/meta/recipes-support/gmp/<a href=3D"h=
ttp://gmp_5.0.2.bb" target=3D"_blank">gmp_5.0.2.bb</a> b/meta/recipes-suppo=
rt/gmp/<a href=3D"http://gmp_5.0.2.bb" target=3D"_blank">gmp_5.0.2.bb</a><b=
r>
index 16bdcbc..873fc3e 100644<br>
--- a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.0.2.bb" target=3D"_b=
lank">gmp_5.0.2.bb</a><br>
+++ b/meta/recipes-support/gmp/<a href=3D"http://gmp_5.0.2.bb" target=3D"_b=
lank">gmp_5.0.2.bb</a><br>
@@ -2,7 +2,7 @@ require gmp.inc<br>
=A0LICENSE=3D&quot;LGPLv3&amp;GPLv3&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504 \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://version.c;endline=3D18;md5=
=3Dd8c56b52b9092346b9f93b4da65ef790&quot;<br>
-PR =3D &quot;r1&quot;<br>
+PR =3D &quot;r2&quot;<br>
<br>
=A0SRC_URI_append +=3D &quot;file://sh4-asmfix.patch \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://use-includedir.patch &quot;<=
br>
--<br>
1.7.6.4<br>
<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">_____________________________=
__________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151747b74465328904b2e4c068--
