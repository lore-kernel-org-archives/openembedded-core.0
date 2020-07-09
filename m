Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.10470.1594310653243994375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 09:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nYJIOOgg;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id dg28so2271948edb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dQVZLLLZ/khJoRbqQWNN6DT7RQyXvapXw4G5gbxtdJs=;
        b=nYJIOOggpMwMa9v3CyyB8fQWV2OA0gbjcnla8QCP8twbuZNYosbx+zjDSybs0kvuJ9
         VqsFVyOi608PC5ucieIGjVmyfbveHbReg0MaA6wm3p2nLP6QO/D5h/gdMKLGP4P5mtSQ
         ULdtWkk6lp4746jl5za27A3c5tO/rFQMtcnTWsicmggvQZZocEasuEr83bPD00PEpgaB
         Qmo5q96VyBAK/WaPfCz/AG92pXC0M+672zmHc85CpVZCL84AJpZS6qjGdtL3ZHjJmJYs
         bpFewaoRzckDPmu5Pb4SdN1GFasi1eYW35LemC8WMpKDulrlHu5KyQ94/4joMQoiNhsa
         DosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQVZLLLZ/khJoRbqQWNN6DT7RQyXvapXw4G5gbxtdJs=;
        b=SrYC/TXD9x9hhnzaWudfvNoQGMkAYUxSlszQUwcxOyG+lsdM5plZTtlVGN7hKqZmy0
         GbGpyYYpPqDgziSddPmtuOADrcanjKSGL2/hNb3LLh+L8OIDwnqWkyLbYrWkLzneXlfi
         sWrM/78ocpHtf/CufMMGdtEGTVfqjoiVNNFmHHDIYwWS8Z/z3R222/VimQlxw72hN93d
         qjWtCVQbjSL0mJ0/lJWbxjyc5cATtfOx7eSufHjAWnKruBpXdr+oxdgtu+6ejbyqCkJy
         EVqNLbK75lwr63soPDi7evlSvYZDdql8+qcNpIDRr2Lgi/JaWWSpCVzHKuyZHO1bxPJg
         Xwbw==
X-Gm-Message-State: AOAM532xOS9fNfcC3QLkv3nl7Ua3leAFcR+EEIeR/Jaz0NRGdvcSoF6p
	Zq88E2hQGJC0ntCHh+Xpn10XqGvcC/OemfTkKUI=
X-Google-Smtp-Source: ABdhPJxOkj3V+AAVr+NaMtr0kjHM7nvMjPL9a5azVcYVrYgdWfmB4NZl401hAQ9LWLdxetYs0/3G1aj+9azzEJPBSMQ=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr25209450edr.219.1594310651635;
 Thu, 09 Jul 2020 09:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <2349716.bIJK7JYWuR@n95hx1g2>
In-Reply-To: <2349716.bIJK7JYWuR@n95hx1g2>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 9 Jul 2020 09:04:00 -0700
Message-ID: <CABcZANmiNUMz1W8UKpsFKmjJ9DvCCepH2u3XjSeKaZUaaXHkcw@mail.gmail.com>
Subject: Re: [OE-core] How to install individual -lic packages
To: Christian Eggers <ceggers@arri.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000d6de605aa046099"

--0000000000000d6de605aa046099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

COMPLEMENTARY_GLOB[lic-pkgs] =3D '*-lic'
IMAGE_FEATURES +=3D "lic-pkgs"

This is how the dbg-pkgs, dev-pkgs, doc-pkgs, src-pkgs, ptest-pkgs,
staticdev-pkgs are done.

On Thu, Jul 9, 2020 at 3:58 AM Christian Eggers <ceggers@arri.de> wrote:

> I have set LICENSE_CREATE_PACKAGE to "1" in order to create additional -=
lic
> packages per recipe. As NO_RECOMMENDATIONS is set to "1" in my image
> recipe,
> the -lic packages are not installed automatically.
>
> How can I install specific -lic packages "manually". My idea was to crea=
te
> a
> new recipe which rdepends on all -lic packages which I would like to
> install.
>
> # myrecipe.bb:
> RDEPENDS_${PN} +=3D "curl-lic"
>
> After that I get the following error message:
> ERROR: Nothing RPROVIDES 'curl-lic' (but ... RDEPENDS on or otherwise
> requires
> it)
>
> The same happened when I tried to add the -lic packages to IMAGE_INSTALL
> in my
> image recipe.
>
> I also tried adding one line in image.bbclass, but this changed nothing:
>
> def add_package_and_files(d):
> ...
>         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
>         d.setVar('FILES_' + pn_lic, files)
> +       d.setVar('RPROVIDES_' + pn_lic, pn_lic)
>
>
> How can I install -lic packages in my rootfs without setting
> NO_RECOMMENDATIONS to 0?
>
> regards
> Christian
>
>
>
>
> ________________________________
>  [
> http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V=
1.jpg]
> <https://microsites.arri.com/stellar/>
>
> Get all the latest information from www.arri.com<https://www.arri.com/>,
> Facebook<https://www.facebook.com/TeamARRI>, Twitter<
> https://twitter.com/ARRIChannel>, Instagram<https://instagram.com/arri>
> and YouTube<https://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen -
> Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik =
GmbH
> Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen -
> Handelsregisternummer: HRB 54477
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; W=
alter Trauninger;
> Markus Zeiler
>=20
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000000d6de605aa046099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">COMPLEMENTARY_GLOB[lic-pkgs] =3D &#39;*-lic&#39;<br><div>I=
MAGE_FEATURES=C2=A0+=3D &quot;lic-pkgs&quot;</div><div><br></div><div>This =
is how the dbg-pkgs, dev-pkgs, doc-pkgs, src-pkgs, ptest-pkgs, staticdev-pk=
gs are done.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jul 9, 2020 at 3:58 AM Christian Eggers &lt;<a hr=
ef=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I have set LICENSE_CREATE_PACK=
AGE to &quot;1&quot; in order to create additional -lic<br>
packages per recipe. As NO_RECOMMENDATIONS is set to &quot;1&quot; in my i=
mage recipe,<br>
the -lic packages are not installed automatically.<br>
<br>
How can I install specific -lic packages &quot;manually&quot;. My idea was=
 to create a<br>
new recipe which rdepends on all -lic packages which I would like to insta=
ll.<br>
<br>
# <a href=3D"http://myrecipe.bb" rel=3D"noreferrer" target=3D"_blank">myre=
cipe.bb</a>:<br>
RDEPENDS_${PN} +=3D &quot;curl-lic&quot;<br>
<br>
After that I get the following error message:<br>
ERROR: Nothing RPROVIDES &#39;curl-lic&#39; (but ... RDEPENDS on or otherw=
ise requires<br>
it)<br>
<br>
The same happened when I tried to add the -lic packages to IMAGE_INSTALL i=
n my<br>
image recipe.<br>
<br>
I also tried adding one line in image.bbclass, but this changed nothing:<b=
r>
<br>
def add_package_and_files(d):<br>
...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PACKAGES&#39;, &quot;%s %s&quot;=
 % (pn_lic, packages))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + pn_lic, files)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;RPROVIDES_&#39; + pn_lic, pn_lic=
)<br>
<br>
<br>
How can I install -lic packages in my rootfs without setting<br>
NO_RECOMMENDATIONS to 0?<br>
<br>
regards<br>
Christian<br>
<br>
<br>
<br>
<br>
________________________________<br>
=C2=A0[<a href=3D"http://assets.arri.com/media/sign/2020-04-03-E-mail-sign=
ature-Stellar2_V1.jpg" rel=3D"noreferrer" target=3D"_blank">http://assets.a=
rri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1.jpg</a>] &lt;<a =
href=3D"https://microsites.arri.com/stellar/" rel=3D"noreferrer" target=3D"=
_blank">https://microsites.arri.com/stellar/</a>&gt;<br>
<br>
Get all the latest information from <a href=3D"http://www.arri.com" rel=3D=
"noreferrer" target=3D"_blank">www.arri.com</a>&lt;<a href=3D"https://www.a=
rri.com/" rel=3D"noreferrer" target=3D"_blank">https://www.arri.com/</a>&gt=
;, Facebook&lt;<a href=3D"https://www.facebook.com/TeamARRI" rel=3D"norefer=
rer" target=3D"_blank">https://www.facebook.com/TeamARRI</a>&gt;, Twitter&l=
t;<a href=3D"https://twitter.com/ARRIChannel" rel=3D"noreferrer" target=3D"=
_blank">https://twitter.com/ARRIChannel</a>&gt;, Instagram&lt;<a href=3D"ht=
tps://instagram.com/arri" rel=3D"noreferrer" target=3D"_blank">https://inst=
agram.com/arri</a>&gt; and YouTube&lt;<a href=3D"https://www.youtube.com/us=
er/ARRIChannel" rel=3D"noreferrer" target=3D"_blank">https://www.youtube.co=
m/user/ARRIChannel</a>&gt;.<br>
<br>
Arnold &amp; Richter Cine Technik GmbH &amp; Co. Betriebs KG<br>
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsre=
gisternummer: HRA 57918<br>
Pers=C3=B6nlich haftender Gesellschafter: Arnold &amp; Richter Cine Techni=
k GmbH<br>
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsre=
gisternummer: HRB 54477<br>
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Wal=
ter Trauninger; Markus Zeiler<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--0000000000000d6de605aa046099--
