Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869DCC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:56:06 +0000 (UTC)
Received: from a11-173.smtp-out.amazonses.com (a11-173.smtp-out.amazonses.com [54.240.11.173])
 by mx.groups.io with SMTP id smtpd.web11.39761.1676976959686301915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=axc4Uxdi;
 spf=pass (domain: amazonses.com, ip: 54.240.11.173, mailfrom: 01000186739dacb3-c675e3d0-9695-46c9-a0fb-e12e1cc17dae-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676976958;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=OPyifO5X9G6VzZhV9+gmW9ptBeztt+spVcOb3T/PZ8o=;
	b=axc4Uxdiar8kA8PcSElsEjnDEGNglFXeuFymzord7z+pNVS7SLOorxC0TXML/9eX
	euIuuF4X5GniKrXUxclT7Ga/9hVk4ZTu2ZOUPXwSvQjBPi7xnES1RK8kyTDhCam8Zjt
	vNKiP7fN1fJMTHFmzwo6JojZ9h2B3qtGumiqcePY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676976958;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=OPyifO5X9G6VzZhV9+gmW9ptBeztt+spVcOb3T/PZ8o=;
	b=URtj1Jp4fFwVU6S1AeT352/aUs7yJYtGOMztLQq+S1fDGuKhUcL1RCRSsFvggPjW
	Em/Vjo+4v2ppVQkKvqbEGDYDFFemGUzMxKTzf1tJc76xuW0Sv7l/nWFBe8J3c7BlLPz
	auJ8cku/X35xJIjXV+axdOX6D/tTPMJuhBZyvQvQ=
Subject: Re: [OE-core] [PATCH] docbook-xml: Switch from debian packages to
 upstream docbook sources
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Alexander_Kanavin?= <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2023 10:55:58 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CANNYZj9RvpmMR=GK-H806n7RK2KPRK0Accwc-b7LNBGxfJ_UZg@mail.gmail.com>
References: <20230221102927.3454570-1-rich@richelberger.com> 
 <0100018673857e8b-00b0aec2-b383-481a-bf90-e830b0590bc8-000000@email.amazonses.com> 
 <CANNYZj9RvpmMR=GK-H806n7RK2KPRK0Accwc-b7LNBGxfJ_UZg@mail.gmail.com> 
 <20af9fff-ac6c-28e1-7420-d288e4fef888@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRd9i92JcIljXS5q94rdId299OgAAKbgsAADsEZg=
Thread-Topic: [OE-core] [PATCH] docbook-xml: Switch from debian packages to
 upstream docbook sources
X-Wm-Sent-Timestamp: 1676976955
Message-ID: <01000186739dacb3-c675e3d0-9695-46c9-a0fb-e12e1cc17dae-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.21-54.240.11.173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177493

The process in the last few days has very helpful because it forces me=20=
=0D=0Ato organize practices better on my end. Thank you.=0D=0A=0D=0AOn 2/=
21/23 05:33, Alexander Kanavin wrote:=0D=0A> Thanks, I do not have any fu=
rther comments. The next step is taking=0D=0A> this through the automated=
 test matrix.=0D=0A>=0D=0A> Alex=0D=0A>=0D=0A> On Tue, 21 Feb 2023 at 11:=
29, Richard Elberger <rich@richelberger.com> wrote:=0D=0A>> This patch ch=
anges the docbook-xml distribution package source from=0D=0A>> debian to =
docbook which aligns the recipe with the source=0D=0A>> originator. Other=
 changes made to the recipe include:=0D=0A>>=0D=0A>> This patch resolves =
[YOCTO #13270].=0D=0A>>=0D=0A>> - removal of version 4.0 given docbook no=
 longer distributes version=0D=0A>>    4.0=0D=0A>> - simplification of th=
e header description.=0D=0A>> - inline comments to communicate the ration=
ale behind gathering=0D=0A>>    multiple versions and LICENSE file handli=
ng.=0D=0A>> - minor ordering changes to align with styling conventions an=
d better=0D=0A>>    context to better communicate use - i.e. the inherit =
statements and=0D=0A>>    related operations.=0D=0A>>=0D=0A>> Signed-off-=
by: Richard Elberger <rich@richelberger.com>=0D=0A>> ---=0D=0A>>   .../do=
cbook-xml/docbook-xml-dtd4_4.5.bb       | 60 ++++++++++++-------=0D=0A>> =
  1 file changed, 39 insertions(+), 21 deletions(-)=0D=0A>>=0D=0A>> diff =
--git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/=
recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>> index 2bec14=
42af..dd6159b2f3 100644=0D=0A>> --- a/meta/recipes-devtools/docbook-xml/d=
ocbook-xml-dtd4_4.5.bb=0D=0A>> +++ b/meta/recipes-devtools/docbook-xml/do=
cbook-xml-dtd4_4.5.bb=0D=0A>> @@ -1,28 +1,46 @@=0D=0A>>   SUMMARY =3D "Do=
cument type definitions for verification of XML data files"=0D=0A>>   DES=
CRIPTION =3D "Document type definitions for verification of XML data \=0D=
=0A>> -files against the DocBook rule set, it ships with the latest DocBo=
ok 4.5 \=0D=0A>> -XML DTD, as well as a selected set of legacy DTDs for u=
se with older \=0D=0A>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.=
4"=0D=0A>> -HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A>> +files aga=
inst the DocBook rule set."=0D=0A>> +HOMEPAGE =3D "https://docbook.org"=0D=
=0A>> +=0D=0A>> +# The upstream sources are not distributed with a licens=
e file.=0D=0A>> +# LICENSE-OASIS is included as a "patch" to workaround t=
his. When=0D=0A>> +# upgrading this recipe, please verify whether this is=
 still needed.=0D=0A>>=0D=0A>>   LICENSE =3D "OASIS"=0D=0A>>   LIC_FILES_=
CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e76=
39a0b1d2e"=0D=0A>>=0D=0A>> -# Note: the upstream sources are not distribu=
ted with a license file.=0D=0A>> -# LICENSE-OASIS is included as a "patch=
" to workaround this. When=0D=0A>> -# upgrading this recipe, please verif=
y whether this is still needed.=0D=0A>> -SRC_URI =3D "http://snapshot.deb=
ian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-x=
ml_${PV}.orig.tar.gz \=0D=0A>> -           file://LICENSE-OASIS \=0D=0A>>=
 -           file://docbook-xml-update-catalog.xml.patch \=0D=0A>> -"=0D=0A=
>> +# To support apps with xml schema backward compatibility, we must=0D=0A=
>> +# install a set of schemas. Install the latest based on PV and then=0D=
=0A>> +# name any specific versions as required. TODO: Figure out a mecha=
nism=0D=0A>> +# to filter exactly which versions are necessary, if that's=
 even=0D=0A>> +# possible.=0D=0A>> +#=0D=0A>> +# DocBook.org lists availa=
ble release packages at https://docbook.org/xml/.=0D=0A>> +#=0D=0A>> +# T=
he release packages relate docbook source at=0D=0A>> +# https://github.co=
m/docbook/docbook but building them requires the=0D=0A>> +# Gradle build =
system. In future, it might be safer to use the source=0D=0A>> +# tree wh=
ich would also enable proper SBOM generation through the=0D=0A>> +# bitba=
ke build system.=0D=0A>> +#=0D=0A>>=0D=0A>> -SRC_URI[md5sum] =3D "487b4d4=
4e15cffb1f4048af23f98208e"=0D=0A>> -SRC_URI[sha256sum] =3D "b0f8edcf697f5=
318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A>> +SRC_URI =3D=
 "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3D=
docbook-xml-4.1.2 \=0D=0A>> +           https://docbook.org/xml/4.2/docbo=
ok-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2 \=0D=0A>> +     =
      https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;su=
bdir=3Ddocbook-xml-4.3 \=0D=0A>> +           https://docbook.org/xml/4.4/=
docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4 \=0D=0A>> +=
           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3Dpay=
loadPV;subdir=3Ddocbook-xml-${PV} \=0D=0A>> +           file://LICENSE-OA=
SIS"=0D=0A>>=0D=0A>> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/doc=
book-xml/"=0D=0A>> +SRC_URI[payload412.sha256sum] =3D "30f0644064e0ea7175=
1438251940b1431f46acada814a062870f486c772e7772"=0D=0A>> +SRC_URI[payload4=
2.sha256sum] =3D "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca40e=
eebe60fa2"=0D=0A>> +SRC_URI[payload43.sha256sum] =3D "23068a94ea6fd484b00=
4c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"=0D=0A>> +SRC_URI[payload44=
=2Esha256sum] =3D "02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1c=
e6f5273090"=0D=0A>> +SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c=
94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"=0D=0A>>=0D=0A>> -S =3D "$=
{WORKDIR}/docbook-xml-4.5.c31424"=0D=0A>> +UPSTREAM_CHECK_REGEX =3D "docb=
ook-xml-(=3FP<pver>4(\.\d+)).zip"=0D=0A>>=0D=0A>> +S =3D "${WORKDIR}"=0D=0A=
>>   inherit allarch=0D=0A>>   BBCLASSEXTEND =3D "native"=0D=0A>>=0D=0A>>=
 @@ -34,19 +52,19 @@ do_compile (){=0D=0A>>       :=0D=0A>>   }=0D=0A>>=0D=
=0A>> +inherit xmlcatalog=0D=0A>> +=0D=0A>>   do_install () {=0D=0A>>    =
   install -d ${D}${sysconfdir}/xml/=0D=0A>>       xmlcatalog --create --=
noout ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>=0D=0A>> -    for DTDV=
ERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>> +    for DTDVERSION in 4.=
1.2 4.2 4.3 4.4 4.5; do=0D=0A>>           DEST=3D${datadir}/xml/docbook/s=
chema/dtd/$DTDVERSION=0D=0A>>           install -d -m 755 ${D}$DEST=0D=0A=
>> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST=0D=0A>> -        xml=
catalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.x=
ml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>> +        cp -v -R docboo=
k-xml-$DTDVERSION/* ${D}$DEST=0D=0A>> +        xmlcatalog --verbose --noo=
ut --add nextCatalog unused \=0D=0A>> +          file://$DEST/catalog.xml=
 ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>       done=0D=0A>>   }=0D=0A=
>>=0D=0A>> -XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"=0D=0A>> -=
inherit xmlcatalog=0D=0A>> -=0D=0A>>   FILES:${PN} =3D "${datadir}/* ${sy=
sconfdir}/xml/docbook-xml.xml"=0D=0A>> --=0D=0A>> 2.34.1=0D=0A>>=0D=0A>>=0D=
=0A>>=0D=0A>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0D=0A>> Links=
: You receive all messages sent to this group.=0D=0A>> View/Reply Online =
(#177490): https://lists.openembedded.org/g/openembedded-core/message/177=
490=0D=0A>> Mute This Topic: https://lists.openembedded.org/mt/97106035/1=
686489=0D=0A>> Group Owner: openembedded-core+owner@lists.openembedded.or=
g=0D=0A>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core=
/unsub [alex.kanavin@gmail.com]=0D=0A>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=0D=0A>>=0D=0A

