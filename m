Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DD5C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 16:31:49 +0000 (UTC)
Received: from a11-78.smtp-out.amazonses.com (a11-78.smtp-out.amazonses.com [54.240.11.78])
 by mx.groups.io with SMTP id smtpd.web10.108.1676824304460992793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 08:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=D35RsAsv;
 spf=pass (domain: amazonses.com, ip: 54.240.11.78, mailfrom: 010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676824303;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=wmxZKs8E45nSHK9Wlgb+5zB8D+RkT864GhbdwN48usI=;
	b=D35RsAsvHqXMcoLG3Ez4m4kUQq6JWX+IOYR6ysciy2rZYILRWSxx8V7/uCWTdpuM
	iygFeLoj4kt7Oj8dkPp5bVoaV0ZZOLGiRbtW+c3ez9bRaUXs/VxxeT+ZckmA+wF8TLK
	D0U1N7p1BwVApNtSXPv4LgXxFj3Y2T2jYNFaCSEE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676824303;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=wmxZKs8E45nSHK9Wlgb+5zB8D+RkT864GhbdwN48usI=;
	b=eaZOMovJ7hiu2ysY8vdNaItO0UkB4gEyVamIsTlX4tWsqNAkkD/aaTjtG2p23PKx
	W0GIPu2QPKWSfzXa+c5T5b33QhxgTLRJslSX+M29jG8AJruUA0EpITRAZMVhRTXN4A9
	/kLyEApoDvneXfifDGzdTNNT4GI8pdJXGlkTzero=
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Alexander_Kanavin?= <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2023 16:31:43 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com>
References: <20230219112522.3391653-2-rich@richelberger.com> 
 <20230219112522.3391653-1-rich@richelberger.com> 
 <01000186696bfbd6-6ba3a526-b53d-4775-94cf-0b29b19f44dc-000000@email.amazonses.com> 
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com> 
 <747cdeab-f37e-6bd2-ea9d-3038d94372a1@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRFTceYTVX42QQdWyqJeuPsKmTgAAAJI5AAlad9wACrJoPw==
Thread-Topic: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
X-Wm-Sent-Timestamp: 1676824302
Message-ID: <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177336

For multiple assignment: the reason is maintainability. The supported=20=0D=
=0Aversions will change over time.=0D=0A=0D=0APlease confirm if there are=
 any other appreciations I must cover - I was=20=0D=0Aunaware of this one=
 and would like to batch them. If the appreciations=20=0D=0Aare listed on=
 a wiki please school me about that.=0D=0A=0D=0AOn 2/19/23 10:52, Alexand=
er Kanavin wrote:=0D=0A> Can you please set SRC_URI with a single assignm=
ent; there is no=0D=0A> reason to +=3D it multiple times.=0D=0A>=0D=0A> V=
erifying that 'devtool latest-version works' would be also appreciated.=0D=
=0A>=0D=0A> Alex=0D=0A>=0D=0A> On Sun, 19 Feb 2023 at 12:25, Richard Elbe=
rger <rich@richelberger.com> wrote:=0D=0A>> ---=0D=0A>>   .../docbook-xml=
/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++-------=0D=0A>>   1 file =
changed, 49 insertions(+), 25 deletions(-)=0D=0A>>=0D=0A>> diff --git a/m=
eta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-d=
evtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>> index 2bec1442af..71a=
a8c14ec 100644=0D=0A>> --- a/meta/recipes-devtools/docbook-xml/docbook-xm=
l-dtd4_4.5.bb=0D=0A>> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml=
-dtd4_4.5.bb=0D=0A>> @@ -1,30 +1,54 @@=0D=0A>>   SUMMARY =3D "Document ty=
pe definitions for verification of XML data files"=0D=0A>>   DESCRIPTION =
=3D "Document type definitions for verification of XML data \=0D=0A>> -fi=
les against the DocBook rule set, it ships with the latest DocBook 4.5 \=0D=
=0A>> -XML DTD, as well as a selected set of legacy DTDs for use with old=
er \=0D=0A>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"=0D=0A>> =
-HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A>> +files against the Do=
cBook rule set."=0D=0A>> +HOMEPAGE =3D "https://docbook.org"=0D=0A>>=0D=0A=
>> -LICENSE =3D "OASIS"=0D=0A>> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/=
LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=0D=0A>> +inherit al=
larch=0D=0A>> +BBCLASSEXTEND =3D "native"=0D=0A>>=0D=0A>> -# Note: the up=
stream sources are not distributed with a license file.=0D=0A>> -# LICENS=
E-OASIS is included as a "patch" to workaround this. When=0D=0A>> -# upgr=
ading this recipe, please verify whether this is still needed.=0D=0A>> -S=
RC_URI =3D "http://snapshot.debian.org/archive/debian/20160728T043443Z/po=
ol/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \=0D=0A>> -          =
 file://LICENSE-OASIS \=0D=0A>> -           file://docbook-xml-update-cat=
alog.xml.patch \=0D=0A>> -"=0D=0A>> +# To support apps with xml schema ba=
ckward compatibility, we must=0D=0A>> +# install a set of schemas. Instal=
l the latest based on PV and then=0D=0A>> +# name any specific versions a=
s required. TODO: Figure out a mechanism=0D=0A>> +# to filter exactly whi=
ch versions are necessary, if that's even=0D=0A>> +# possible.=0D=0A>> +#=
=0D=0A>> +# DocBook.org lists available packages at https://docbook.org/x=
ml/=0D=0A>> +#=0D=0A>> +# These packages are available as source but it r=
equires the ability=0D=0A>> +# to use the Gradle build system to do so. I=
t might be safer to use=0D=0A>> +# the source tree which would also enabl=
e proper SBOM generation=0D=0A>> +# through the bitbake build system. htt=
ps://github.com/docbook/docbook=0D=0A>> +#=0D=0A>>=0D=0A>> -SRC_URI[md5su=
m] =3D "487b4d44e15cffb1f4048af23f98208e"=0D=0A>> -SRC_URI[sha256sum] =3D=
 "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A=
>> +S =3D "${WORKDIR}"=0D=0A>>=0D=0A>> -UPSTREAM_CHECK_URI =3D "${DEBIAN_=
MIRROR}/main/d/docbook-xml/"=0D=0A>> +SRC_URI +=3D "https://docbook.org/x=
ml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"=0D=0A=
>> +SRC_URI[payload412.md5sum] =3D "900d7609fb7e6d78901b357e4acfbc17"=0D=0A=
>> +SRC_URI[payload412.sha256sum] =3D "30f0644064e0ea71751438251940b1431f=
46acada814a062870f486c772e7772"=0D=0A>>=0D=0A>> -S =3D "${WORKDIR}/docboo=
k-xml-4.5.c31424"=0D=0A>> +SRC_URI +=3D "https://docbook.org/xml/4.2/docb=
ook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2"=0D=0A>> +SRC_U=
RI[payload42.md5sum] =3D "73fe50dfe74ca631c1602f558ed8961f"=0D=0A>> +SRC_=
URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7e64b368d9248b07c7abf26=
b34a02cca40eeebe60fa2"=0D=0A>>=0D=0A>> -inherit allarch=0D=0A>> -BBCLASSE=
XTEND =3D "native"=0D=0A>> +SRC_URI +=3D "https://docbook.org/xml/4.3/doc=
book-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-xml-4.3"=0D=0A>> +SRC_=
URI[payload43.md5sum] =3D "ab200202b9e136a144db1e0864c45074"=0D=0A>> +SRC=
_URI[payload43.sha256sum] =3D "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d=
6b62cc1695931f5c143464"=0D=0A>> +=0D=0A>> +SRC_URI +=3D "https://docbook.=
org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4=
"=0D=0A>> +SRC_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22c163=
4"=0D=0A>> +SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c1=
44b1863b216d909b5ff45743a1ce6f5273090"=0D=0A>> +=0D=0A>> +SRC_URI +=3D "h=
ttps://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdi=
r=3Ddocbook-xml-${PV}"=0D=0A>> +SRC_URI[payloadPV.md5sum] =3D "03083e288e=
87a7e829e437358da7ef9e"=0D=0A>> +SRC_URI[payloadPV.sha256sum] =3D "4e4e03=
7a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"=0D=0A>> +=0D=0A=
>> +# The upstream sources are not distributed with a license file.=0D=0A=
>> +# LICENSE-OASIS is included as a "patch" to workaround this. When=0D=0A=
>> +# upgrading this recipe, please verify whether this is still needed.=0D=
=0A>> +=0D=0A>> +LICENSE =3D "OASIS"=0D=0A>> +LIC_FILES_CHKSUM =3D "file:=
//${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=0D=0A>=
> +SRC_URI +=3D "file://LICENSE-OASIS"=0D=0A>>=0D=0A>>   do_configure (){=
=0D=0A>>       :=0D=0A>> @@ -34,19 +58,19 @@ do_compile (){=0D=0A>>      =
 :=0D=0A>>   }=0D=0A>>=0D=0A>> +inherit xmlcatalog=0D=0A>> +=0D=0A>>   do=
_install () {=0D=0A>>       install -d ${D}${sysconfdir}/xml/=0D=0A>>    =
   xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A=
>>=0D=0A>> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>> +=
    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>>           DEST=3D=
${datadir}/xml/docbook/schema/dtd/$DTDVERSION=0D=0A>>           install -=
d -m 755 ${D}$DEST=0D=0A>> -        cp -v -R docbook-$DTDVERSION/* ${D}$D=
EST=0D=0A>> -        xmlcatalog --verbose --noout --add nextCatalog unuse=
d file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>> =
+        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST=0D=0A>> +        xm=
lcatalog --verbose --noout --add nextCatalog unused \=0D=0A>> +          =
file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>   =
    done=0D=0A>>   }=0D=0A>>=0D=0A>> -XMLCATALOGS =3D "${sysconfdir}/xml/=
docbook-xml.xml"=0D=0A>> -inherit xmlcatalog=0D=0A>> -=0D=0A>>   FILES:${=
PN} =3D "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"=0D=0A>> --=0D=0A=
>> 2.34.1=0D=0A>>=0D=0A>>=0D=0A>>=0D=0A>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=0D=0A>> Links: You receive all messages sent to this group.=
=0D=0A>> View/Reply Online (#177325): https://lists.openembedded.org/g/op=
enembedded-core/message/177325=0D=0A>> Mute This Topic: https://lists.ope=
nembedded.org/mt/97064586/1686489=0D=0A>> Group Owner: openembedded-core+=
owner@lists.openembedded.org=0D=0A>> Unsubscribe: https://lists.openembed=
ded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]=0D=0A>> -=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0D=0A>>=0D=0A

