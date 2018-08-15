Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 63F5374C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:28:58 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id r21-v6so414135qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2aaGhth1ubNjFdn7upLdUZQff05ue4+ig0Eu91SABBE=;
	b=QdDx5B4M0ywan2FSJtdCfjlcijdNMQAzvS1mFCDtfmhXYx59/Cg5pEBCaa2WBgtrzs
	2t/Ky1IG1LU8BjhQMlZ5fo8uqxlYvvgJpMvB5Pop37k7f4NZF1ch1TiXbWiZkoJtX0ME
	TuuJ+HUr96gBZuH7pdMhlgGbh6ZEOinFtpsLxtLtg2i9yh39wScq5sUUIMko8+VIvayF
	x9g8BW3cLJ1CeW/LRTEjD5qLkb4nZa1UWEiyHSmdRQImI/wUwlNTDF6llzapboiKRAE/
	uuksBSvwlDqlFbG4uN510BWg1r7qOldOfwfkOcduZYQOC510m0SZ+nuLnyi0qGgLu+IW
	eyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2aaGhth1ubNjFdn7upLdUZQff05ue4+ig0Eu91SABBE=;
	b=rk7U6vkHYDpVyrOp816Dgxk7/4QBASx1Amdax4ldtVvxW2pYpkWonwNY+kfx3ts4TC
	j7peSN1OpH4MdjLN2oupyvbQHUglFTQ9HinrySBPoMph6ZHIfYCo3WrZEJLVabWemB4n
	E+cCEgF+SnzEFod4LkaSWY/w9u0tIrTKcnf/5lqBd2nlFVz4qOBSpwX2PpapPSv/oy6H
	2vfpsvqO4tpeKgjuee7kt+f7jfahUqKyMw+oJTf/5Euaa+ii65Z23JYNSKHSJ3/D8Pmi
	HRztrRSJBsWTFy2ygS7csPx7cWTvumKwe1rx7/Yj1DcJopYfyv6SV3WKPj0ROA1eE4mA
	oH1A==
X-Gm-Message-State: AOUpUlGNNRBexp399lO/cTtaAIXbijAy3QBM+IHXO6sHX++sEPMC8fSn
	s0EkendopBJuZppS9RQlvVWK+Lgd1PxLwwkestM=
X-Google-Smtp-Source: AA+uWPyuaw6jUnBn0Lxf9MKGjMyM8l0IiiF6YnIgm7PEkeplEnzrBuf52fEP9J6T3WPHJ0Fgg6kMKY9OW1i4YD8ioug=
X-Received: by 2002:aed:2aa1:: with SMTP id
	t30-v6mr25074954qtd.28.1534321739209; 
	Wed, 15 Aug 2018 01:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNS0Tze1bLt41fNbOSB-Bs2D80XO369ri8AvRpQhBg+rdg@mail.gmail.com>
	<CAMKF1soq9VU_8n-knW-_H1Z2-EAb+Jop_YuJjV_nrEyi1m5k5w@mail.gmail.com>
In-Reply-To: <CAMKF1soq9VU_8n-knW-_H1Z2-EAb+Jop_YuJjV_nrEyi1m5k5w@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Wed, 15 Aug 2018 10:28:47 +0200
Message-ID: <CAGCTLNQ9f+69bhELtT8jdjyR2SKKb0ic4S2xn-CQ99dcc4wJ9g@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-qt5]: required packages to run qt5 qml applications
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
X-List-Received-Date: Wed, 15 Aug 2018 08:28:58 -0000
Content-Type: multipart/alternative; boundary="0000000000003ca2220573751e16"

--0000000000003ca2220573751e16
Content-Type: text/plain; charset="UTF-8"

I added the meta-qt5 layer to bblayers.conf file
and i added some of packages to IMAGE_INSTALL variable
but I think that I don't need all of this packages.
I just need from this list some packages which let me can run qt qml
applications.
so, how can I know which packages can be useful for me ?

Thanks,

On Tue, Aug 14, 2018 at 6:23 PM Khem Raj <raj.khem@gmail.com> wrote:

> you need to add meta-qt5 to your bblayers.conf and then
> something like below might be helpful. You have to check for
> renames or removals though.
>
> IMAGE_INSTALL_append = "\
>    qtbase-fonts \
>    qtbase-plugins \
>    qtbase-tools \
>    qtbase-examples \
>    qtdeclarative \
>    qtdeclarative-plugins \
>    qtdeclarative-tools \
>    qtdeclarative-examples \
>    qtdeclarative-qmlplugins \
>    qtmultimedia \
>    qtmultimedia-plugins \
>    qtmultimedia-examples \
>    qtmultimedia-qmlplugins \
>    qtsvg \
>    qtsvg-plugins \
>    qtsensors \
>    qtimageformats-plugins \
>    qtsystems \
>    qtsystems-tools \
>    qtsystems-examples \
>    qtsystems-qmlplugins \
>    qtscript \
>    qt3d \
>    qt3d-examples \
>    qt3d-qmlplugins \
>    qt3d-tools \
>    qtwebkit \
>    qtwebkit-examples \
>    qtwebkit-qmlplugins \
>    qtgraphicaleffects-qmlplugins \
>    qtconnectivity-qmlplugins \
>    qtlocation-plugins \
>    qtlocation-qmlplugins \
>    cinematicexperience \
> "
> On Tue, Aug 14, 2018 at 7:41 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
> >
> > Hi,
> > I need to know what is the minimum packages which I need to add to
> > IMAGE_INSTALL_append variable in local.conf file
> > to be able to run qt5 qml applications in custom image on Minnowboard
> Turbot that support wayland without x11. ?
> >
> > Thank you,
> >
> >
> > --
> >
> > Mohamed Dawod
> > Computer Engineering Department
> > Faculty of Engineering
> > Cairo University
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000003ca2220573751e16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>I added the meta-qt5 layer to bblayers=
.conf file<br></div>and i added some of packages to IMAGE_INSTALL variable<=
br></div>but I think that I don&#39;t need all of this packages.<br></div>I=
 just need from this list some packages which let me can run qt qml applica=
tions.<br></div><div>so, how can I know which packages can be useful for me=
 ?</div><div><br></div><div>Thanks,<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Tue, Aug 14, 2018 at 6:23 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">you need to add meta-qt5 to your bblayers.co=
nf and then<br>
something like below might be helpful. You have to check for<br>
renames or removals though.<br>
<br>
IMAGE_INSTALL_append =3D &quot;\<br>
=C2=A0 =C2=A0qtbase-fonts \<br>
=C2=A0 =C2=A0qtbase-plugins \<br>
=C2=A0 =C2=A0qtbase-tools \<br>
=C2=A0 =C2=A0qtbase-examples \<br>
=C2=A0 =C2=A0qtdeclarative \<br>
=C2=A0 =C2=A0qtdeclarative-plugins \<br>
=C2=A0 =C2=A0qtdeclarative-tools \<br>
=C2=A0 =C2=A0qtdeclarative-examples \<br>
=C2=A0 =C2=A0qtdeclarative-qmlplugins \<br>
=C2=A0 =C2=A0qtmultimedia \<br>
=C2=A0 =C2=A0qtmultimedia-plugins \<br>
=C2=A0 =C2=A0qtmultimedia-examples \<br>
=C2=A0 =C2=A0qtmultimedia-qmlplugins \<br>
=C2=A0 =C2=A0qtsvg \<br>
=C2=A0 =C2=A0qtsvg-plugins \<br>
=C2=A0 =C2=A0qtsensors \<br>
=C2=A0 =C2=A0qtimageformats-plugins \<br>
=C2=A0 =C2=A0qtsystems \<br>
=C2=A0 =C2=A0qtsystems-tools \<br>
=C2=A0 =C2=A0qtsystems-examples \<br>
=C2=A0 =C2=A0qtsystems-qmlplugins \<br>
=C2=A0 =C2=A0qtscript \<br>
=C2=A0 =C2=A0qt3d \<br>
=C2=A0 =C2=A0qt3d-examples \<br>
=C2=A0 =C2=A0qt3d-qmlplugins \<br>
=C2=A0 =C2=A0qt3d-tools \<br>
=C2=A0 =C2=A0qtwebkit \<br>
=C2=A0 =C2=A0qtwebkit-examples \<br>
=C2=A0 =C2=A0qtwebkit-qmlplugins \<br>
=C2=A0 =C2=A0qtgraphicaleffects-qmlplugins \<br>
=C2=A0 =C2=A0qtconnectivity-qmlplugins \<br>
=C2=A0 =C2=A0qtlocation-plugins \<br>
=C2=A0 =C2=A0qtlocation-qmlplugins \<br>
=C2=A0 =C2=A0cinematicexperience \<br>
&quot;<br>
On Tue, Aug 14, 2018 at 7:41 AM Mohamed Dawod &lt;<a href=3D"mailto:mhm.daw=
od@gmail.com" target=3D"_blank">mhm.dawod@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt; I need to know what is the minimum packages which I need to add to<br>
&gt; IMAGE_INSTALL_append variable in local.conf file<br>
&gt; to be able to run qt5 qml applications in custom image on Minnowboard =
Turbot that support wayland without x11. ?<br>
&gt;<br>
&gt; Thank you,<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Mohamed Dawod<br>
&gt; Computer Engineering Department<br>
&gt; Faculty of Engineering<br>
&gt; Cairo University<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div>

--0000000000003ca2220573751e16--
