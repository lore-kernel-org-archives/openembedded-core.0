Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web08.20218.1628498329903125183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 01:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SmkVMh9t;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id v3so6668723uau.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AG7AWd1K5yTkx//MNbRyEMa8iA2kTujr+YBibHs18jw=;
        b=SmkVMh9tjXTpDJ+xGZjHHi0ySin7Mxe+hQkDhEVUHC+4zmNB+PWxM4Jkm66DQyrk+5
         EAG4xJUvtJu2wA3TYuMTydbc0bN0xpWVbWo+miqQyevS3pTsX7s98qmw6N2iS5YEejn5
         gtpghrNON3tgwntD9z5qsVpI6Zs1cvtyXCb39FaXh4PdiKxeFz7rcGRxr62Q6MaT9Wy5
         myhlyln6Wkvxr9Fy/nZGIAshhZHOwgddfTKmrPD35P8a1ew7utnAHcAqJjvdAfdyw7ej
         vn+5udcFIye05MRPBxxSf/9a4pO2ThbbUHKJvWqBxkJ/de2+wJbW7BFvbWRxMzQ2TqvD
         3rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AG7AWd1K5yTkx//MNbRyEMa8iA2kTujr+YBibHs18jw=;
        b=FyC3IXchywsF6nEiAK5r3z1IZ6fOCifvmtLBp0v2PyyMelrxGnpNzMaY0UnSfvVGot
         E9/wNvsmNiFAHOaTkaNaZ/hYEHqG5EfxT8Wxk6ng22Nmbx2/wEjvG1nEVjh7sEpICxAP
         EBLoBBwxzxm1vd+YpBHpAntur2aHm+Xk7nrY+GDD/3KMykeNetb8HfrtzsRsOkz0XWmD
         Ml7MMyX5FafglWqR9Bev5e9nqOPKPINt++Mvhd/qD3EmCZ+ovnjlrAVP5WOT6RdLcAs2
         VJgrEEpUYD/t1nRPuATxNnzay7KA/nr5oa40b4J7Vn4jgC7tvDi2HlL0brK5A12DGndu
         l9PQ==
X-Gm-Message-State: AOAM53078SpDI92Jzt0h/wUngJDjVmDCePcWr+nwddfdXJuvXhHu1WT1
	nMw41g6kAfQZOioNb5SO0+cdjLg8F6E/QgX1kGo0vLvhKBI=
X-Google-Smtp-Source: ABdhPJw8x4q1aqPfcygebmnvD3U+XrLQ6JBy3BrHOt6S0EINoU3PU68wffsjusIrRbc+xWjQrcMSDtCAawhkcXFI+0o=
X-Received: by 2002:ab0:60c9:: with SMTP id g9mr14859537uam.100.1628498329025;
 Mon, 09 Aug 2021 01:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <169759E55CFA4CD7.25031@lists.openembedded.org> <494f8563-fcfd-aa3b-319e-d35b5db44c60@windriver.com>
In-Reply-To: <494f8563-fcfd-aa3b-319e-d35b5db44c60@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 9 Aug 2021 10:38:44 +0200
Message-ID: <CANNYZj9hr143i7m6AS=moW+AV+q0JaNKdQNd4ZZ6sCqX6yx5+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libconvert-asn1-perl: 0.27 -> 0.31
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b40c305c91c50e2"

--0000000000006b40c305c91c50e2
Content-Type: text/plain; charset="UTF-8"

Can you please explain the SRC_URI change in the commit message? Does
upstream version check work and report the latest version properly?

Alex

On Mon, 9 Aug 2021 at 08:01, Changqing Li <changqing.li@windriver.com>
wrote:

> ping
> On 8/2/21 9:41 AM, Changqing Li wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.com>
> ---
>  ...ert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} (71%)
>
> diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> similarity index 71%
> rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> index 409a8f3896..2548878a2e 100644
> --- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> +++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
>  SECTION = "libs"
> -HOMEPAGE = "https://metacpan.org/source/GBARR/Convert-ASN1-0.27" <https://metacpan.org/source/GBARR/Convert-ASN1-0.27>
> +HOMEPAGE = "http://search.cpan.org/dist/Convert-ASN1/" <http://search.cpan.org/dist/Convert-ASN1/>
>  DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
>  LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
>
> -SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz" <http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-$%7BPV%7D.tar.gz>
> +SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz" <https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-$%7BPV%7D.tar.gz>
>
> -SRC_URI[md5sum] = "68723e96be0b258a9e20480276e8a62c"
> -SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a"
> +SRC_URI[md5sum] = "1e12b263a5042804bb1c59ddce899876"
> +SRC_URI[sha256sum] = "6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb"
>
>  S = "${WORKDIR}/Convert-ASN1-${PV}"
>
>
>
>
> 
>
>

--0000000000006b40c305c91c50e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please explain the SRC_URI change in the comm=
it message? Does upstream version check work and report the latest version =
properly?<br></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 9 Aug 2021 a=
t 08:01, Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">cha=
ngqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">

 =20
  <div>
    <p>ping<br>
    </p>
    <div>On 8/2/21 9:41 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 ...<a href=3D"http://ert-asn1-perl_0.27.bb" target=3D"_blank">ert-asn1-per=
l_0.27.bb</a> =3D&gt; <a href=3D"http://libconvert-asn1-perl_0.31.bb" targe=
t=3D"_blank">libconvert-asn1-perl_0.31.bb</a>} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{<a href=3D"http://libconvert-asn1-perl_=
0.27.bb" target=3D"_blank">libconvert-asn1-perl_0.27.bb</a> =3D&gt; <a href=
=3D"http://libconvert-asn1-perl_0.31.bb" target=3D"_blank">libconvert-asn1-=
perl_0.31.bb</a>} (71%)

diff --git a/meta/recipes-extended/perl/<a href=3D"http://libconvert-asn1-p=
erl_0.27.bb" target=3D"_blank">libconvert-asn1-perl_0.27.bb</a> b/meta/reci=
pes-extended/perl/<a href=3D"http://libconvert-asn1-perl_0.31.bb" target=3D=
"_blank">libconvert-asn1-perl_0.31.bb</a>
similarity index 71%
rename from meta/recipes-extended/perl/<a href=3D"http://libconvert-asn1-pe=
rl_0.27.bb" target=3D"_blank">libconvert-asn1-perl_0.27.bb</a>
rename to meta/recipes-extended/perl/<a href=3D"http://libconvert-asn1-perl=
_0.31.bb" target=3D"_blank">libconvert-asn1-perl_0.31.bb</a>
index 409a8f3896..2548878a2e 100644
--- a/meta/recipes-extended/perl/<a href=3D"http://libconvert-asn1-perl_0.2=
7.bb" target=3D"_blank">libconvert-asn1-perl_0.27.bb</a>
+++ b/meta/recipes-extended/perl/<a href=3D"http://libconvert-asn1-perl_0.3=
1.bb" target=3D"_blank">libconvert-asn1-perl_0.31.bb</a>
@@ -1,14 +1,14 @@
 SUMMARY =3D &quot;Convert::ASN1 - Perl ASN.1 Encode/Decode library&quot;
 SECTION =3D &quot;libs&quot;
-HOMEPAGE =3D <a href=3D"https://metacpan.org/source/GBARR/Convert-ASN1-0.2=
7" target=3D"_blank">&quot;https://metacpan.org/source/GBARR/Convert-ASN1-0=
.27&quot;</a>
+HOMEPAGE =3D <a href=3D"http://search.cpan.org/dist/Convert-ASN1/" target=
=3D"_blank">&quot;http://search.cpan.org/dist/Convert-ASN1/&quot;</a>
 DESCRIPTION =3D &quot;Convert::ASN1 is a perl library for encoding/decodin=
g data using ASN.1 definitions.&quot;
 LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;
 LIC_FILES_CHKSUM =3D <a>&quot;file://README.md;beginline=3D91;endline=3D97=
;md5=3Dceff7fd286eb6d8e8e0d3d23e096a63f&quot;</a>
=20
-SRC_URI =3D <a href=3D"http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/C=
onvert-ASN1-$%7BPV%7D.tar.gz" target=3D"_blank">&quot;http://search.cpan.or=
g/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz&quot;</a>
+SRC_URI =3D <a href=3D"https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/=
Convert-ASN1-$%7BPV%7D.tar.gz" target=3D"_blank">&quot;https://cpan.metacpa=
n.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz&quot;</a>
=20
-SRC_URI[md5sum] =3D &quot;68723e96be0b258a9e20480276e8a62c&quot;
-SRC_URI[sha256sum] =3D &quot;74a4a78ae0c5e973100ac0a8f203a110f76fb047b79da=
e4fc1fd7d6814d3d58a&quot;
+SRC_URI[md5sum] =3D &quot;1e12b263a5042804bb1c59ddce899876&quot;
+SRC_URI[sha256sum] =3D &quot;6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf=
2f93633540b439fbbeb&quot;
=20
 S =3D &quot;${WORKDIR}/Convert-ASN1-${PV}&quot;
=20
</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
<br>
<br>
</blockquote></div>

--0000000000006b40c305c91c50e2--
