Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id F15F67D1AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:35:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q1so17513910wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jq0uCINnSyrB3SkWlQMnk+t1zqKSXQwBC2wR2GBEb7A=;
	b=ppSFY+4FC2zCFHipT3tnaP9oCskmL2WtbjVubPOUTGiKak/VOQAmKgywmix/WRddQ3
	J2BiUw7w7u9e1qnT+bD7fZ7hmhWrBdKJyWwWy2FNBVVsPvLiH1+2fG7redCpGbG3Bi0R
	OGgi5QLlwoCpR1ClFWzbC4C6gJoK34pfRhQZHFsTYPmoiIvtjDRy5lGmYXmANqsaTf/k
	5s2GXMn0/PITlmvyQgNEEewNNjQkpq7cefS5MPs47dwuilQWGd2JtFvT+7VO8dRjYJvr
	QuFszOmH7LsvJwl+rZ755tjmycZKpzrSzq5TRBY/Obc0VT1BElVxGi4zWKcYSvzpyX1E
	jwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jq0uCINnSyrB3SkWlQMnk+t1zqKSXQwBC2wR2GBEb7A=;
	b=RNj8ihxNjE4YLocGWsj60ol+mJLBhtwgGt6Hs+2E2Ry+Fr9XmZjrFwWiLDSgdhCPId
	4xZDTNVb0D29AtQUGHXGPx3tpJU5I/vLXbbVyQwg3w0P6xnRKEjFeCfjlVSLvMpVySgB
	ZfXq8T+It8VYbkXhazKIYqEZbqageZRQO7TdMa4RxAtLlaeJuYsQ7YXrJNYMs5V8zYsq
	GpYaWO3J+DTWYxcrE8JEYWBwNbC/IxbQqRcrYHlFoLzjpmFmAPYyZLl3s0LZyoRXPz2+
	eHF/x57hu963rykStY2MC0lfJdtJWrgG1+iKyCfDNFX6vDAFXtcF6qAMtWGfg9i1eqBj
	IxUA==
X-Gm-Message-State: APjAAAXKY+X40v51fapmXLxq1Jm950L4fdPiTnXyVwS8W2m2ySJZPpOs
	kFcKoQd9VOgIXSYQUOUhUSYXrc8z6SggkOXG0Cw=
X-Google-Smtp-Source: APXvYqwxsqqECLo8odwgBQ3GW6FAQwGTR3rmHFqru0URCfqIXzsUSSkPbl936cXGhwPfQZU7opJ5JDyAvTAygWSW0lY=
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr8455910wrp.129.1554222906562; 
	Tue, 02 Apr 2019 09:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190402141538.25146-1-paul@betafive.co.uk>
	<20190402141538.25146-2-paul@betafive.co.uk>
	<a0ef532b-b5b1-105a-78e0-54a4ea0194f4@windriver.com>
In-Reply-To: <a0ef532b-b5b1-105a-78e0-54a4ea0194f4@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 Apr 2019 18:34:54 +0200
Message-ID: <CA+chaQegyQ0oT9XOvf7P2Wzvbh5ZJYE_DnWeLLS4BkAVjk+nFw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tzdata: Install everything by default
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
X-List-Received-Date: Tue, 02 Apr 2019 16:35:06 -0000
Content-Type: multipart/alternative; boundary="0000000000003f5c3e05858eb81e"

--0000000000003f5c3e05858eb81e
Content-Type: text/plain; charset="UTF-8"

RPROVIDES/RREPLACES/RCONFLICTS is the right combo (you need all 3 for opkg
to remove the old package IIRC).

On Tue, Apr 2, 2019 at 6:29 PM Mark Hatle <mark.hatle@windriver.com> wrote:

> On 4/2/19 9:15 AM, Paul Barker wrote:
> > tzdata is converted to an empty meta package which pulls in all
> > subpackages. The subpackages are defined in a TZ_PACKAGES variable so
> > that we don't have to repeat ourselves.
> >
> > The timezones and conffiles which were in the tzdata package are moved
> > to a new 'tzdata-core' package.
>
> Is there any type of 'RREPLACES' or anything that should be added so
> previous
> users of tzdata-all get tzdata in a package upgrade?
>
> (or is it ROBSOLETES, or..  I can never remember..)
>
> --Mark
>
> > Signed-off-by: Paul Barker <paul@betafive.co.uk>
> > ---
> >  meta/recipes-extended/timezone/tzdata.bb | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-extended/timezone/tzdata.bb
> b/meta/recipes-extended/timezone/tzdata.bb
> > index 7542ce52d2..82fe369baa 100644
> > --- a/meta/recipes-extended/timezone/tzdata.bb
> > +++ b/meta/recipes-extended/timezone/tzdata.bb
> > @@ -80,9 +80,11 @@ pkg_postinst_${PN} () {
> >  # Packages primarily organized by directory with a major city
> >  # in most time zones in the base package
> >
> > -PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
> > +TZ_PACKAGES = " \
> > +    tzdata-core tzdata-misc tzdata-posix tzdata-right tzdata-africa \
> >      tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> >      tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
> > +PACKAGES = "${TZ_PACKAGES} ${PN}"
> >
> >  FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
> >  RPROVIDES_tzdata-africa = "tzdata-africa"
> > @@ -124,7 +126,6 @@ RPROVIDES_tzdata-posix = "tzdata-posix"
> >  FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
> >  RPROVIDES_tzdata-right = "tzdata-right"
> >
> > -
> >  FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
> >                  ${datadir}/zoneinfo/Egypt                \
> >                  ${datadir}/zoneinfo/Eire                 \
> > @@ -145,8 +146,8 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba
>      \
> >                  ${datadir}/zoneinfo/Turkey"
> >  RPROVIDES_tzdata-misc = "tzdata-misc"
> >
> > -
> > -FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
> > +FILES_tzdata-core += " \
> > +                ${datadir}/zoneinfo/Pacific/Honolulu     \
> >                  ${datadir}/zoneinfo/America/Anchorage    \
> >                  ${datadir}/zoneinfo/America/Los_Angeles  \
> >                  ${datadir}/zoneinfo/America/Denver       \
> > @@ -201,5 +202,8 @@ FILES_${PN} +=
> "${datadir}/zoneinfo/Pacific/Honolulu     \
> >                  ${datadir}/zoneinfo/iso3166.tab          \
> >                  ${datadir}/zoneinfo/Etc/*"
> >
> > -CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if
> bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
> > -CONFFILES_${PN} += "${sysconfdir}/localtime"
> > +CONFFILES_tzdata-core += "${@ "${sysconfdir}/timezone" if
> bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
> > +CONFFILES_tzdata-core += "${sysconfdir}/localtime"
> > +
> > +ALLOW_EMPTY_${PN} = "1"
> > +RDEPENDS_${PN} = "${TZ_PACKAGES}"
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003f5c3e05858eb81e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">RPROVIDES/RREPLACES/RCONFLICTS is the right combo (you nee=
d all 3 for opkg to remove the old package IIRC).</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 2, 2019 at 6:2=
9 PM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@=
windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 4/2/19 9:15 AM, Paul Barker wrote:<br>
&gt; tzdata is converted to an empty meta package which pulls in all<br>
&gt; subpackages. The subpackages are defined in a TZ_PACKAGES variable so<=
br>
&gt; that we don&#39;t have to repeat ourselves.<br>
&gt; <br>
&gt; The timezones and conffiles which were in the tzdata package are moved=
<br>
&gt; to a new &#39;tzdata-core&#39; package.<br>
<br>
Is there any type of &#39;RREPLACES&#39; or anything that should be added s=
o previous<br>
users of tzdata-all get tzdata in a package upgrade?<br>
<br>
(or is it ROBSOLETES, or..=C2=A0 I can never remember..)<br>
<br>
--Mark<br>
<br>
&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@betafive.co.uk" =
target=3D"_blank">paul@betafive.co.uk</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/timezone/<a href=3D"http://tzdata.bb" rel=
=3D"noreferrer" target=3D"_blank">tzdata.bb</a> | 16 ++++++++++------<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/timezone/<a href=3D"http://tzdata.b=
b" rel=3D"noreferrer" target=3D"_blank">tzdata.bb</a> b/meta/recipes-extend=
ed/timezone/<a href=3D"http://tzdata.bb" rel=3D"noreferrer" target=3D"_blan=
k">tzdata.bb</a><br>
&gt; index 7542ce52d2..82fe369baa 100644<br>
&gt; --- a/meta/recipes-extended/timezone/<a href=3D"http://tzdata.bb" rel=
=3D"noreferrer" target=3D"_blank">tzdata.bb</a><br>
&gt; +++ b/meta/recipes-extended/timezone/<a href=3D"http://tzdata.bb" rel=
=3D"noreferrer" target=3D"_blank">tzdata.bb</a><br>
&gt; @@ -80,9 +80,11 @@ pkg_postinst_${PN} () {<br>
&gt;=C2=A0 # Packages primarily organized by directory with a major city<br=
>
&gt;=C2=A0 # in most time zones in the base package<br>
&gt;=C2=A0 <br>
&gt; -PACKAGES =3D &quot;tzdata tzdata-misc tzdata-posix tzdata-right tzdat=
a-africa \<br>
&gt; +TZ_PACKAGES =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 tzdata-core tzdata-misc tzdata-posix tzdata-right tzdat=
a-africa \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tzdata-americas tzdata-antarctica tzdata-arctic tz=
data-asia \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tzdata-atlantic tzdata-australia tzdata-europe tzd=
ata-pacific&quot;<br>
&gt; +PACKAGES =3D &quot;${TZ_PACKAGES} ${PN}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES_tzdata-africa +=3D &quot;${datadir}/zoneinfo/Africa/*&quot=
;<br>
&gt;=C2=A0 RPROVIDES_tzdata-africa =3D &quot;tzdata-africa&quot;<br>
&gt; @@ -124,7 +126,6 @@ RPROVIDES_tzdata-posix =3D &quot;tzdata-posix&quot=
;<br>
&gt;=C2=A0 FILES_tzdata-right +=3D &quot;${datadir}/zoneinfo/right/*&quot;<=
br>
&gt;=C2=A0 RPROVIDES_tzdata-right =3D &quot;tzdata-right&quot;<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 FILES_tzdata-misc +=3D &quot;${datadir}/zoneinfo/Cuba=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/Egypt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/Eire=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; @@ -145,8 +146,8 @@ FILES_tzdata-misc +=3D &quot;${datadir}/zoneinfo/C=
uba=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/Turkey&quot;<br>
&gt;=C2=A0 RPROVIDES_tzdata-misc =3D &quot;tzdata-misc&quot;<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt; -FILES_${PN} +=3D &quot;${datadir}/zoneinfo/Pacific/Honolulu=C2=A0 =C2=
=A0 =C2=A0\<br>
&gt; +FILES_tzdata-core +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/zo=
neinfo/Pacific/Honolulu=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/America/Anchorage=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/America/Los_Angeles=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/America/Denver=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; @@ -201,5 +202,8 @@ FILES_${PN} +=3D &quot;${datadir}/zoneinfo/Pacific=
/Honolulu=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/iso3166.tab=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/zoneinfo/Etc/*&quot;<br>
&gt;=C2=A0 <br>
&gt; -CONFFILES_${PN} +=3D &quot;${@ &quot;${sysconfdir}/timezone&quot; if =
bb.utils.to_boolean(d.getVar(&#39;INSTALL_TIMEZONE_FILE&#39;)) else &quot;&=
quot; }&quot;<br>
&gt; -CONFFILES_${PN} +=3D &quot;${sysconfdir}/localtime&quot;<br>
&gt; +CONFFILES_tzdata-core +=3D &quot;${@ &quot;${sysconfdir}/timezone&quo=
t; if bb.utils.to_boolean(d.getVar(&#39;INSTALL_TIMEZONE_FILE&#39;)) else &=
quot;&quot; }&quot;<br>
&gt; +CONFFILES_tzdata-core +=3D &quot;${sysconfdir}/localtime&quot;<br>
&gt; +<br>
&gt; +ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;${TZ_PACKAGES}&quot;<br>
&gt; <br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003f5c3e05858eb81e--
