Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 325777D717
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:38:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6Ta1020854 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=EVCpFkSS2INOUBigPf7UQ4tRrJLyftHBLLP1Si+ImFY=;
	b=iDfydQ1IlwF7LWyVZPRBe+lPFio4h3QSrno4WDvHzLWQQ92l/nT+//LKN1El2dj5aJ8l
	U/0CPNM/RJui/vfQqYmC4i1Z9N9OP45uhHp7r96zNNX1ki51rnh0Qo9K6fHUNj/RO7G1
	e4zUWVX5fO4G1bVPy0DrMIvw2W2iSNPCl9KqGcq7wjcc/7kqfaXkkzCR8zF+a8aBa6Um
	Wv2OSICXyjstWXGnfeWW9AFC7Bw8+W1ZnRL/IwNm5CBwFeOh+2Q72o2xDJvWnIApW1tj
	Agr06pUsch6Mpu1DZw86udnCcGYFjyTMO8LL9yZVJFskg2s14V+ytNkxTcD+v/4v5/aP
	3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vej2p2fdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBF05100039
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E69802C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:44 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 22/23] libpcre: update license
Thread-Index: AQHVfRBZNLPEREQe9UCV0AHhamrfvw==
Date: Mon, 7 Oct 2019 13:08:44 +0000
Message-ID: <3137361f9974aade5895b2dc6cfa8f43a8c51bfa.1570452710.git.christophe.priouzeau@st.com>
References: <cover.1570452710.git.christophe.priouzeau@st.com>
In-Reply-To: <cover.1570452710.git.christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [PATCH 22/23] libpcre: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:38:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of the two libraries are BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-support/libpcre/libpcre2_10.33.bb | 2 +-
 meta/recipes-support/libpcre/libpcre_8.43.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.33.bb b/meta/recipes-=
support/libpcre/libpcre2_10.33.bb
index 50b26753b4f..87da3137696 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.33.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -7,7 +7,7 @@ not the original PCRE 8.x series."
 SUMMARY =3D "Perl Compatible Regular Expressions version 2"
 HOMEPAGE =3D "http://www.pcre.org"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db1588d3bb4cb0e1f5a597d908f8c5b3=
7"
=20
 SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-su=
pport/libpcre/libpcre_8.43.bb
index b97af08b250..f9a22fee9df 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -5,7 +5,7 @@ to the POSIX regular expression API."
 SUMMARY =3D "Perl Compatible Regular Expressions"
 HOMEPAGE =3D "http://www.pcre.org"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D91bee59d1b327eb1599b4c673e2fb3d=
1"
 SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://fix-pcre-name-collision.patch \
--=20
2.17.1

