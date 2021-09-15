Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.1761.1631669545983806986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 18:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cT0p+Wbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id s24so895210wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 18:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQyQLrfQ8dWTYsvAu46xdQF6TJWA1j6uODHbx9mXK38=;
        b=cT0p+WblaKfKhZCilvCm+C93jqGQuVI9oQ6Jj0si+HyzrKU1pTM4dcEblabSc5ql2G
         FfWEJOHAPo6Mxe5RyNYh+Im4OmdUn+npCB6uA75LJ37l3xwDyyZyJASAPaA8FuC2a7Oe
         dmsF4gL7PwwkISwxkxxAY8rU5R+zBPOZth7ADtLVtYDVsYTktCV3r1vUDkTgxqqpoX7M
         8XTJdcsLRwleKo55m7FZ2VjAxIteIAs9iEO0aZJkWpxPI23q8N+urYiAqHRDmtcKrXcq
         0kcLVl06nHCJSdDbm6oNu+ZfaghtZjh4Nlz5NxB04+vzsQyKmVTmSu1vWNd0Mc6y3vDs
         fvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQyQLrfQ8dWTYsvAu46xdQF6TJWA1j6uODHbx9mXK38=;
        b=TIm8wb+ghPEbNlR/xbor/ddHYtpw4twFsgInkDITBi3mF2iwA/by/Dls4WwDclRR02
         iF7dnd1ZT22xpWTnfd/piK7EHWJGHQq8auJxU1YslrZUumzgSxauXfM2KBUwBqdfQZ24
         /Ujohw2z0AtoOE1RerUGg6cxsF3VZwi26G/S95OUU5682DwKIxoShWDBOs4S7s2icRep
         Ig3rY7MNJOh7G7K1fr1IcCen9BNtMiuUux7/f9nOhSRgW30Ji2/yjL/gwgdWzg8V4mK2
         P0AHhtsn2bAZPzAma5V/mrUER2xyNMlk1J4mzzVrcdRfB20Gslg+6R7heA0TLZxihodf
         2VHA==
X-Gm-Message-State: AOAM533xUYSauEKevsITP9ipxeEwhsHUgirmsVV8fJoRH3AIcwFE+p+K
	8HXwypQ6ic8BO6GsQSlDthXmlbVWi5lkeu/ZFyC0jA==
X-Google-Smtp-Source: ABdhPJy48WVPt4XICA1yuvfMS6k7Lsn8L4kKiXRzhrljpQJynZsKSrSmQbAF5WNI+hly4M57LLLJD56R1qdGfsiC0s8=
X-Received: by 2002:a05:600c:19d4:: with SMTP id u20mr1818400wmq.28.1631669544440;
 Tue, 14 Sep 2021 18:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210914180345.163507-1-steve@sakoman.com> <af688aaba4eb2333f7c5bd3861151914220fe840.camel@intel.com>
In-Reply-To: <af688aaba4eb2333f7c5bd3861151914220fe840.camel@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 14 Sep 2021 15:32:11 -1000
Message-ID: <CAOSpxdYZLiV0vLpMXpH0TnG0nO3erc9GoG5Soc-PKKWh8s42Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009669c605cbfeab1d"

--0000000000009669c605cbfeab1d
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021, 3:15 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Tue, 2021-09-14 at 08:03 -1000, Steve Sakoman wrote:
> > The CVE database correctly reports CVEs for oracle_berkley_db and
> > berkley_db.  We use the oracle_berkley_db source tree and therefore
> > should only check for oracle_berkely_db CVEs. Otherwise the scanner
> > falsely reports CVEs that are fixed in oracle_berkley_db
>
> Aren't both the same thing? I think this revert is incorrect and the
> CVEs being flagged are correct.
>
> https://nvd.nist.gov/vuln/detail/CVE-2015-2583
>
> The CPE data shows oracle as the vendor and berkeley_db as product.
>

Yes, I agree.  See my reply from earlier today where I withdrew this patch!

Steve





>
>
>
> Thanks,
>
> Anuj
>
> >
> > This reverts commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661.
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-support/db/db_5.3.28.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-
> > support/db/db_5.3.28.bb
> > index d5b788a3d7..5e9305ab06 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -15,7 +15,7 @@ HOMEPAGE =
> > "https://www.oracle.com/database/technologies/related/berkeleydb.html
> >  LICENSE = "Sleepycat"
> >  RCONFLICTS:${PN} = "db3"
> >
> > -CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
> > +CVE_PRODUCT = "oracle_berkeley_db"
> >  CVE_VERSION = "11.2.${PV}"
> >
> >  PR = "r1"
> >
> > 
> >
>
>

--0000000000009669c605cbfeab1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Sep 14, 2021, 3:15 PM Mittal, Anuj &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank" rel=3D"noreferrer">anuj=
.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Tue, 2021-09-14 at 08:03 -1000, Steve Sakoman wrote:<br>
&gt; The CVE database correctly reports CVEs for oracle_berkley_db and<br>
&gt; berkley_db.=C2=A0 We use the oracle_berkley_db source tree and therefo=
re<br>
&gt; should only check for oracle_berkely_db CVEs. Otherwise the scanner<br=
>
&gt; falsely reports CVEs that are fixed in oracle_berkley_db<br>
<br>
Aren&#39;t both the same thing?=C2=A0I think this revert is incorrect and t=
he<br>
CVEs being flagged are correct.<br>
<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2015-2583" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail=
/CVE-2015-2583</a><br>
<br>
The CPE data shows oracle as the vendor and berkeley_db as product.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I a=
gree.=C2=A0 See my reply from earlier today where I withdrew this patch!</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br><br><br><br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; This reverts commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661.<br>
&gt; <br>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
rel=3D"noreferrer noreferrer" target=3D"_blank">steve@sakoman.com</a>&gt;<b=
r>
&gt; ---<br>
&gt; =C2=A0meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">db_5.3.28.bb</a> | 2 +-<=
br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">db_5.3.28.bb</a> =
b/meta/recipes-<br>
&gt; support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"noreferrer noreferre=
r noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt; index d5b788a3d7..5e9305ab06 100644<br>
&gt; --- a/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt; +++ b/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt; @@ -15,7 +15,7 @@ HOMEPAGE =3D<br>
&gt; &quot;<a href=3D"https://www.oracle.com/database/technologies/related/=
berkeleydb.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>https://www.oracle.com/database/technologies/related/berkeleydb.html</a><b=
r>
&gt; =C2=A0LICENSE =3D &quot;Sleepycat&quot;<br>
&gt; =C2=A0RCONFLICTS:${PN} =3D &quot;db3&quot;<br>
&gt; =C2=A0<br>
&gt; -CVE_PRODUCT =3D &quot;oracle_berkeley_db berkeley_db&quot;<br>
&gt; +CVE_PRODUCT =3D &quot;oracle_berkeley_db&quot;<br>
&gt; =C2=A0CVE_VERSION =3D &quot;11.2.${PV}&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0PR =3D &quot;r1&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000009669c605cbfeab1d--
