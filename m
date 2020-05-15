Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5860.1589507577614840794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 18:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04F1qmm5023912
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 14 May 2020 18:52:48 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 14 May 2020
 18:52:47 -0700
Subject: Re: [OE-core] [PATCH] gcr: depends on gnupg-native
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20200511092342.29197-1-kai.kang@windriver.com>
 <f00e9d2b-8ada-a259-337d-9c1fa37862ab@windriver.com>
 <9c5dcfc03d2670a447cc08565cb74e407211906a.camel@linuxfoundation.org>
 <CANNYZj-mE1Dw7yFom3oZ6U8-odD7UXsBhZjhbofy-1O2UYrZDQ@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <7b812b26-39fd-71ab-e84b-fb733659b485@windriver.com>
Date: Fri, 15 May 2020 09:51:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-mE1Dw7yFom3oZ6U8-odD7UXsBhZjhbofy-1O2UYrZDQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------CD311F2F45ED17E05EE15B50"
Content-Language: en-US

--------------CD311F2F45ED17E05EE15B50
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 04F1qmm5023912

On 2020/5/15 =E4=B8=8A=E5=8D=881:29, Alexander Kanavin wrote:
> Looking gcr's autotools and meson build files, gpg executable is=20
> required in both. Gcr is needed only by epiphany, so I don't think=20
> build performance will suffer much.

It seems gcr requires command gpg long long time ago(about 8 years). But=
=20
I don't know why just exposed recently.

https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e=
1d5e81fa14

Regards,
Kai

>
> Alex
>
> On Thu, 14 May 2020 at 15:26, Richard Purdie=20
> <richard.purdie@linuxfoundation.org=20
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Thu, 2020-05-14 at 09:59 +0800, kai wrote:
>     > On 2020/5/11 =E4=B8=8B=E5=8D=885:23, kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com> wrote:
>     > > From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     > >
>     > > It fails to build gcr if no commmand gpg on build host:
>     > >
>     > > > meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found =
or
>     > > > not executable
>     > >
>     > > Add dependency gnupg-native to fix the error.
>     > >
>     > > Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     > > ---
>     > >=C2=A0 =C2=A0meta/recipes-gnome/gcr/gcr_3.36.0.bb <http://gcr_3.3=
6.0.bb>
>     | 2 +-
>     > >=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>     > >
>     > > diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
>     <http://gcr_3.36.0.bb> b/meta/recipes-
>     > > gnome/gcr/gcr_3.36.0.bb <http://gcr_3.36.0.bb>
>     > > index 4fe3b2fff3..458dc8e6c4 100644
>     > > --- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb <http://gcr_3.36.0.bb=
>
>     > > +++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb <http://gcr_3.36.0.bb=
>
>     > > @@ -8,7 +8,7 @@ BUGTRACKER =3D "
>     > > https://gitlab.gnome.org/GNOME/gcr/issues"
>     > >=C2=A0 =C2=A0LICENSE =3D "GPLv2"
>     > >=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D
>     > > "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605"
>     > >
>     > > -DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt \
>     > > +DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.cont=
ains('GI_DATA_ENABLED', 'True',
>     > > 'libxslt-native', '', d)}"
>     > >
>     > >=C2=A0 =C2=A0GNOMEBASEBUILDCLASS =3D "meson"
>     >
>     > Any comment, please?
>
>     Why did this happen? Was this as a result of the move to meson? Is i=
t
>     really needed and can we avoid it? native dependencies like this are=
 a
>     pain from a build performance perspective...
>
>     Cheers,
>
>     Richard
>
>    =20
>

--=20
Kai Kang
Wind River Linux


--------------CD311F2F45ED17E05EE15B50
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 04F1qmm5023912

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020/5/15 =E4=B8=8A=E5=8D=881:29, Al=
exander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj-mE1Dw7yFom3oZ6U8-odD7UXsBhZjhbofy-1O2UYrZDQ@mail.gmail=
.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"ltr">
        <div>Looking gcr's autotools and meson build files, gpg
          executable is required in both. Gcr is needed only by
          epiphany, so I don't think build performance will suffer much.</=
div>
      </div>
    </blockquote>
    <p>It seems gcr requires command gpg long long time ago(about 8
      years). But I don't know why just exposed recently.</p>
    <p><a
href=3D"https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab=
9bd9914e1d5e81fa14">https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa034=
8ab087e99ab9bd9914e1d5e81fa14</a></p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj-mE1Dw7yFom3oZ6U8-odD7UXsBhZjhbofy-1O2UYrZDQ@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 May 2020 at 15:26=
,
          Richard Purdie &lt;<a
            href=3D"mailto:richard.purdie@linuxfoundation.org"
            moz-do-not-send=3D"true">richard.purdie@linuxfoundation.org</a=
>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n
          Thu, 2020-05-14 at 09:59 +0800, kai wrote:<br>
          &gt; On 2020/5/11 =E4=B8=8B=E5=8D=885:23, <a
            href=3D"mailto:kai.kang@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a> wrote:<br>
          &gt; &gt; From: Kai Kang &lt;<a
            href=3D"mailto:kai.kang@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          &gt; &gt; <br>
          &gt; &gt; It fails to build gcr if no commmand gpg on build
          host:<br>
          &gt; &gt; <br>
          &gt; &gt; &gt; meson.build:44:0: ERROR: Program(s) ['gpg2',
          'gpg'] not found or<br>
          &gt; &gt; &gt; not executable<br>
          &gt; &gt; <br>
          &gt; &gt; Add dependency gnupg-native to fix the error.<br>
          &gt; &gt; <br>
          &gt; &gt; Signed-off-by: Kai Kang &lt;<a
            href=3D"mailto:kai.kang@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          &gt; &gt; ---<br>
          &gt; &gt;=C2=A0 =C2=A0meta/recipes-gnome/gcr/<a
            href=3D"http://gcr_3.36.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank"
            moz-do-not-send=3D"true">gcr_3.36.0.bb</a> | 2 +-<br>
          &gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion=
(-)<br>
          &gt; &gt; <br>
          &gt; &gt; diff --git a/meta/recipes-gnome/gcr/<a
            href=3D"http://gcr_3.36.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank"
            moz-do-not-send=3D"true">gcr_3.36.0.bb</a> b/meta/recipes-<br>
          &gt; &gt; gnome/gcr/<a href=3D"http://gcr_3.36.0.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
gcr_3.36.0.bb</a><br>
          &gt; &gt; index 4fe3b2fff3..458dc8e6c4 100644<br>
          &gt; &gt; --- a/meta/recipes-gnome/gcr/<a
            href=3D"http://gcr_3.36.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank"
            moz-do-not-send=3D"true">gcr_3.36.0.bb</a><br>
          &gt; &gt; +++ b/meta/recipes-gnome/gcr/<a
            href=3D"http://gcr_3.36.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank"
            moz-do-not-send=3D"true">gcr_3.36.0.bb</a><br>
          &gt; &gt; @@ -8,7 +8,7 @@ BUGTRACKER =3D "<br>
          &gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/gcr/issues"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://gitlab.gnome.org/GNOME/gcr/issues</a>"<br>
          &gt; &gt;=C2=A0 =C2=A0LICENSE =3D "GPLv2"<br>
          &gt; &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
          &gt; &gt;
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;md5=3D=
55ca817ccb7d5b5b66355690e9abc605">"file://COPYING;md5=3D55ca817ccb7d5b5b663=
55690e9abc605"</a><br>
          &gt; &gt;=C2=A0 =C2=A0<br>
          &gt; &gt; -DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt \<br>
          &gt; &gt; +DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt
          gnupg-native \<br>
          &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.=
utils.contains('GI_DATA_ENABLED',
          'True',<br>
          &gt; &gt; 'libxslt-native', '', d)}"<br>
          &gt; &gt;=C2=A0 =C2=A0<br>
          &gt; &gt;=C2=A0 =C2=A0GNOMEBASEBUILDCLASS =3D "meson"<br>
          &gt; <br>
          &gt; Any comment, please?<br>
          <br>
          Why did this happen? Was this as a result of the move to
          meson? Is it<br>
          really needed and can we avoid it? native dependencies like
          this are a<br>
          pain from a build performance perspective...<br>
          <br>
          Cheers,<br>
          <br>
          Richard<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------CD311F2F45ED17E05EE15B50--
