Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id A0A977D5BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:42:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D1Tnm032197 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=iDOERJ7CtVTByucJeaogQKaTMXt+Y53ayHjywhchRpM=;
	b=uHtQq1vNzgB3N0/UGlNuySDhrfnRslvvYWhKObmu69a6j1EuXKkSkCrO6tMKQUfbSZri
	h9v9TcFD2JHHR4ertWiNkAc76Ulwo0cf6VQ/z+qc3fZO4XZRdMcfVyc8SZFccwsCnHTs
	0257I7aQJWKykjdXn2vaFuDhSlXXS+DC/W11Ix3x1gkXsydPySiNR8QcixwLBxXpX2mn
	47D45BHFjVS9He0aFs6hTv+xSpe08NbbR73AehvJS3XoWGA6e/MRpd1g1HtyDb/lDmGC
	648pDPcdz95TlD/LhR2m9teaeCKrFDAnUPHCaMk8qQAegw0MInNbIvrWvC8XPoR4NS9b
	dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vegn0jgvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACA15100034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A85052C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:39 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:39 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 09/23] libarchive: update license
Thread-Index: AQHVfRBV+M8oHMS46kCUvVcR8+Uo0w==
Date: Mon, 7 Oct 2019 13:08:39 +0000
Message-ID: <c526eaab76e3ca64967c3ee1fa415f52d24af01a.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 09/23] libarchive: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:42:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of libarchive is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/libarchive/libarchive_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.4.0.bb
index c789cd44d21..9c0d5e26ec3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Support for reading various archive formats"
 DESCRIPTION =3D "C library and command-line tools for reading and writing =
tar, cpio, zip, ISO, and other archive formats"
 HOMEPAGE =3D "http://www.libarchive.org/"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe01f5e02b1f0cc934d593a7b0ddceb=
6"
=20
 DEPENDS =3D "e2fsprogs-native"
--=20
2.17.1

