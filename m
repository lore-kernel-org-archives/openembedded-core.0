Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB4E9795E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 23:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3D019182C5;
	Fri,  7 Sep 2018 01:43:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0SMz9tFnZNRg; Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C53631806E;
	Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B11491A08B;
	Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A51471A084;
	Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 98E361850;
	Fri,  7 Sep 2018 01:43:21 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 7 Sep 2018 01:43:21 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 7 Sep 2018 01:43:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Khem Raj (raj.khem@gmail.com)" <raj.khem@gmail.com>
Thread-Topic: glibc-locale fails when PACKAGE_NO_GCONV = 1
Thread-Index: AdRGOv8uUYmU6mSuSM+FNk92Nq5kKw==
Date: Thu, 6 Sep 2018 23:43:21 +0000
Message-ID: <5164dac8b24a403693edd057b06a6341@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: glibc-locale fails when PACKAGE_NO_GCONV = 1
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
X-List-Received-Date: Thu, 06 Sep 2018 23:43:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just thought I should mention this as I happened to stumble upon it=20
when I accidentally set DISTRO_FEATURES to nothing:

If one builds with PACKAGE_NO_GCONV set to 1, or without all of=20
libc-charsets, libc-locales and libc-locale-code being set in=20
DISTRO_FEATURES (which results in PACKAGE_NO_GCONV being set to 1),=20
then the build will fail for glibc-locale due to a lot of files in=20
/usr/lib/gconv and /usr/share/i18n not being packaged.

//Peter


