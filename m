Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232EEC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 22:34:00 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.157.1645569238915061069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 14:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nxcJg0py;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id q17so40700456edd.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 14:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vupOY6GZjfYJcF1tbM/hxXuAIeK3o6y92q0gTCxMTvA=;
        b=nxcJg0pytitxE3SapTsIRtbAfIItCy6s1iYRQ0+XnvUzBNmsqCd4aSmTUXExm5P/8U
         gHjHFHX0PbyiBEKC/T+BctzWubmyTB7jIDuC2aJsJ+aIgksHkXdSQ3InGUyjx+kRimyi
         8H72Sr+M8ZCx60mcq4Nv2hnbKWsyB2t/IkVaYZjFYxUxDekYCkvDHYkoJ+Xe3FlMW4g6
         QvDpLtx3H0gzefsQLbQsWpdhEBL9tP67bTWNTHZAd5Skq8xavxksSRZV7bGi2Iwrn+7c
         nt0nSHKLKv0nN1o3Fdd6EfYszUJXa6Lhli3FdWLimGd75UD6XRKG9nZ6kPKXffSmkntF
         38/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vupOY6GZjfYJcF1tbM/hxXuAIeK3o6y92q0gTCxMTvA=;
        b=PGqUJFCxXd9jWw+9qKCsjXs+CzFJqNl2YPI2H/w5OUjfHDX5ia3VGRm8X53G9TTwEW
         NtKXKeq7HL+94cRnwCCZnf+cdfwJZ1MjXBf7f7JIxCZCyZaScwUe6UkjjH83QNcYCg50
         /KTfdppbgx9vWHlwODzNkZ4GWbs3Y+n8F9C9sjGCywHIR4uUQhuRc5wkQw55rQjnbvSr
         LHnnd8VNDsESplPnNuHNs8vH+vTWRuSiEMMjYSpI7/TQ6cwdSRBfp/t7KMRItGCix/M2
         aj1gvk4vIkKKlJSWr/+BVrg6A5YyjUGW6WF4dTuUJnWePnmxV7x5YV94JtThSNnwAZ6u
         VSOA==
X-Gm-Message-State: AOAM533blQre3w7dLPF+YnMMtQdpoz8SBCeBOPIld/wgevimrS/o9VaH
	mBIeEesao4sPOuc36tzNhtiqHVQjkrL1Me9t3eI=
X-Google-Smtp-Source: 
 ABdhPJzHKpql66wBhK1H8zbSRFAZdI6y7RAXyDYJ9E5R986/XWzqQtHopUwASGR7pVjCezsPq8l2HHyOlg/GeXmm2rc=
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr10032270edw.113.1645569237102; Tue, 22
 Feb 2022 14:33:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <3071336da7ba931774c91ba3a937f277c7b7c7d7.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1soENmAx+JC4A7Jvdg2nrRaA0YmEsFWyg4Z+9Aj8V4SuSg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soENmAx+JC4A7Jvdg2nrRaA0YmEsFWyg4Z+9Aj8V4SuSg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Feb 2022 14:33:45 -0800
Message-ID: 
 <CANx9H-Bq+s-PfsDJvTgpznL4uFaQf_z1jR5NPH+X4MR0Mj3zZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 32/32] python3-nose: drop recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d4b31805d8a2f155"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 22:34:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162229

--000000000000d4b31805d8a2f155
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 2:24 PM Khem Raj <raj.khem@gmail.com> wrote:

> there are packages in meta-python which still need it
>
>   meta-networking/recipes-connectivity/netplan/netplan_0.103.bb:
> RDEPENDS:${PN}
> = "python3 python3-core python3-pyyaml python3-netifaces python3-nos
> e python3-coverage python3-pycodestyle python3-pyflakes
> util-linux-libuuid libnetplan"
>   meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb:
> ${PYTHON_PN}-nose \
>   meta-python/recipes-devtools/python/python3-blinker_1.4.bb:
> ${PYTHON_PN}-nose \
>   meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb:
> PACKAGECONFIG[test]
> = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_P
> N}-nose ${PYTHON_PN}-pyjwt"
>
> I wonder if these recipes can either be also removed or made free of
> nose module.
>
>
I am thinking the same thing. While we could probably run 2to3 on the nose
plugins
that are the legacy python2 code, I would rather do the right thing.

In some cases, pytest can be a drop in replacement for nosetests, but not
always.

If anyone has any other ideas, please chime in. I am all ears.

On Mon, Feb 21, 2022 at 1:25 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > The code has not been touched since 2016 and numerous files still have
> > Python2 syntax code in them. This causes do_compile errors when
> > packaging a wheel (PEP-517 packaging).
> >
> > Nothing in oe-core depends on python3-nose.
> >
> > [YOCTO #14638]
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc       |  1 -
> >  meta/recipes-devtools/python/python-nose.inc   | 18 ------------------
> >  .../python/python3-nose_1.3.7.bb               |  2 --
> >  3 files changed, 21 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
> >  delete mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 7a65612b7c6..333685cd8b8 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -616,7 +616,6 @@ RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr
> Kravchuk <open.source@oleksandr-k
> >  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <
> tim.orling@konsulko.com>"
> > -RECIPE_MAINTAINER:pn-python3-nose = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> >  RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> >  RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <
> tim.orling@konsulko.com>"
> >  RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <
> tim.orling@konsulko.com>"
> > diff --git a/meta/recipes-devtools/python/python-nose.inc
> b/meta/recipes-devtools/python/python-nose.inc
> > deleted file mode 100644
> > index 08c380d637c..00000000000
> > --- a/meta/recipes-devtools/python/python-nose.inc
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -SUMMARY = "Extends Python unittest to make testing easier"
> > -HOMEPAGE = "http://readthedocs.org/docs/nose/"
> > -DESCRIPTION = "nose extends the test loading and running features of
> unittest, \
> > -making it easier to write, find and run tests."
> > -SECTION = "devel/python"
> > -LICENSE = "LGPL-2.1-only"
> > -LIC_FILES_CHKSUM =
> "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
> > -
> > -SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
> > -SRC_URI[sha256sum] =
> "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
> > -
> > -inherit pypi
> > -
> > -RDEPENDS:${PN} = "\
> > -  ${PYTHON_PN}-unittest \
> > -  "
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> > deleted file mode 100644
> > index 13dbf96179a..00000000000
> > --- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> > +++ /dev/null
> > @@ -1,2 +0,0 @@
> > -inherit setuptools3
> > -require python-nose.inc
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162108):
> https://lists.openembedded.org/g/openembedded-core/message/162108
> > Mute This Topic: https://lists.openembedded.org/mt/89304054/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000d4b31805d8a2f155
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022 at 2:24 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">there are p=
ackages in meta-python which still need it<br>
<br>
=C2=A0 meta-networking/recipes-connectivity/netplan/netplan_0.103.bb:RDEPEN=
DS:${PN}<br>
=3D &quot;python3 python3-core python3-pyyaml python3-netifaces python3-nos=
<br>
e python3-coverage python3-pycodestyle python3-pyflakes<br>
util-linux-libuuid libnetplan&quot;<br>
=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-anyjso=
n_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-anyjson_0.3.3.bb</=
a>:<br>
${PYTHON_PN}-nose \<br>
=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-blinke=
r_1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-blinker_1.4.bb</a>:<=
br>
${PYTHON_PN}-nose \<br>
=C2=A0 meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb:PACKAG=
ECONFIG[test]<br>
=3D &quot;,,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_P<br>
N}-nose ${PYTHON_PN}-pyjwt&quot;<br>
<br>
I wonder if these recipes can either be also removed or made free of<br>
nose module.<br>
<br></blockquote><div><br></div><div>I am thinking the same thing. While we=
 could probably run 2to3 on the nose plugins</div><div>that are the legacy =
python2 code, I would rather do the right thing.</div><div><br></div><div>I=
n some cases, pytest can be a drop in replacement for nosetests, but not al=
ways.</div><div><br></div><div>If anyone has any other ideas, please chime =
in. I am all ears.</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
On Mon, Feb 21, 2022 at 1:25 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The code has not been touched since 2016 and numerous files still have=
<br>
&gt; Python2 syntax code in them. This causes do_compile errors when<br>
&gt; packaging a wheel (PEP-517 packaging).<br>
&gt;<br>
&gt; Nothing in oe-core depends on python3-nose.<br>
&gt;<br>
&gt; [YOCTO #14638]<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
&gt;=C2=A0 meta/recipes-devtools/python/python-nose.inc=C2=A0 =C2=A0| 18 --=
----------------<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-nose_1.3.7.bb" rel=3D"noref=
errer" target=3D"_blank">python3-nose_1.3.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
&gt;=C2=A0 3 files changed, 21 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python-nose.inc<=
br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-nose_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_=
1.3.7.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 7a65612b7c6..333685cd8b8 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -616,7 +616,6 @@ RECIPE_MAINTAINER:pn-python3-mako =3D &quot;Oleksa=
ndr Kravchuk &lt;open.source@oleksandr-k<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-markdown =3D &quot;Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-markupsafe =3D &quot;Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-more-itertools =3D &quot;Tim Orling=
 &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orlin=
g@konsulko.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-python3-nose =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-numpy =3D &quot;Oleksandr Kravchuk =
&lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank"=
>open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-packaging =3D &quot;Tim Orling &lt;=
<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@kon=
sulko.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-python3-pathlib2 =3D &quot;Tim Orling &lt;<=
a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@kons=
ulko.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recip=
es-devtools/python/python-nose.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 08c380d637c..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python-nose.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,18 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Extends Python unittest to make testing easier&quot=
;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://readthedocs.org/docs/nose/" rel=
=3D"noreferrer" target=3D"_blank">http://readthedocs.org/docs/nose/</a>&quo=
t;<br>
&gt; -DESCRIPTION =3D &quot;nose extends the test loading and running featu=
res of unittest, \<br>
&gt; -making it easier to write, find and run tests.&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://lgpl.txt;md5=3Da6f89e2100d9b6cdffce=
a4f398e37343&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;4d3ad0ff07b61373d2cefc89c5d0b20b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb=
6a1b1d26c69a8b79e6208a98&quot;<br>
&gt; -<br>
&gt; -inherit pypi<br>
&gt; -<br>
&gt; -RDEPENDS:${PN} =3D &quot;\<br>
&gt; -=C2=A0 ${PYTHON_PN}-unittest \<br>
&gt; -=C2=A0 &quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-no=
se_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a>=
 b/meta/recipes-devtools/python/<a href=3D"http://python3-nose_1.3.7.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 13dbf96179a..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-nose_1.3.=
7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,2 +0,0 @@<br>
&gt; -inherit setuptools3<br>
&gt; -require python-nose.inc<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162108): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162108" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162108</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89304054=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89304054/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000d4b31805d8a2f155--

