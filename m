Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91EFC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:45:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12993.1753191947296125662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 06:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fTrgkxfz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2A5E43377;
	Tue, 22 Jul 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753191944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNt6N42Ur4LuKqMk/BNsY97HkVBLL5xflDuj0KiCYlA=;
	b=fTrgkxfzx/tG3Ruu0BqGCAscwId/VLjO1MlYHAShg3qSxjL+Ihv0uZmFGybNcx0DIB1f0R
	vYEpLrdIV9kHOcGeaGD1p+A6hUm70FKPy/TI3qWzosZMOShQOhXspPh25TJRcqzzeI1NhZ
	WLdqZHVIcMysgQDkwyGoyA0DViSc9BT8hBsgrqdT7nDXF09VSt/OYfchfOSWFLCMFkiac9
	GXhJ6OflPdf53uxxMX3y7AGkdE6li6m0QmVHfK8WL1DgD7DIqPO+az8SQO8VPp0gAr5g+x
	mMW/i7N0JicQU1y/lSeHaWOloZuLSMTIURnXScu62HI3prQgpH5WueID9e1isg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 15:45:40 +0200
Message-Id: <DBIMOAQO71QQ.13YNCOGP9XB30@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/4] libxml2: upgrade 2.14.3 -> 2.14.5
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
 <20250721082103.2262095-4-hongxu.jia@windriver.com>
 <65edbfaaa12089b5483042867d663fb46e488b82.camel@linuxfoundation.org>
In-Reply-To: <65edbfaaa12089b5483042867d663fb46e488b82.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejhedthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleegveffudejvefgteeuudevvdegjeefieetudffheeutdejfeeuleeuffetgffgnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpfiefrdhorhhgpdhgnhhomhgvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmehfuggrvdemugekfegrmeehtggrvgemjeejudgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmehfuggrvdemugekfegrmeehtggrvgemjeejudgspdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehli
 hhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohephhhonhhggihurdhjihgrsegvnhhgrdifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220747

On Tue Jul 22, 2025 at 3:18 PM CEST, Richard Purdie via lists.openembedded.=
org wrote:
> On Mon, 2025-07-21 at 16:21 +0800, hongxu via lists.openembedded.org wrot=
e:
>> diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-c=
ore/libxml/libxml2_2.14.5.bb
>> similarity index 97%
>> rename from meta/recipes-core/libxml/libxml2_2.14.3.bb
>> rename to meta/recipes-core/libxml/libxml2_2.14.5.bb
>> index 4baab59186e..52b2040122b 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
>> @@ -21,7 +21,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923=
.tar;subdir=3D${BP};name=3Dtestt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:=
//CVE-2025-6021.patch=C2=A0\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0
>> -SRC_URI[archive.sha256sum] =3D "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d=
84ac5d3c7ccbd9344d8cc6833"
>> +SRC_URI[archive.sha256sum] =3D "24175ec30a97cfa86bdf9befb7ccf4613f8f4b2=
713c5103e0dd0bc9c711a2773"
>> =C2=A0SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c=
8d83e69a2be4722379f08702ea7273"
>> =C2=A0
>> =C2=A0# Disputed as a security issue, but fixed in d39f780
>>=20
>
> $ wget https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.5.ta=
r.xz
> $ sha256sum libxml2-2.14.5.tar.xz=20
> 03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b  libxml2=
-2.14.5.tar.xz
>
> which would match the failure on:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2060
>
> Any idea what happened here?
>
> Cheers,
>
> Richard

It looks like the file changed on the remote, my build this morning did
succeed but not the next ones.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


