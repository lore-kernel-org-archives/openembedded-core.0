Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85AD97D41F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:23:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6gHh005450 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=TFgDR6JPq7SFC4NtZruCzUGDY3Vvk7g2N5ORZFkXd58=;
	b=K0HyRnAWLmJRnUe+qMzkZny+lZC8pskW5yJKc0uDxfDrVsuOKnSxLtBNJeGAjD+Pmw6P
	gn8ZJ6YQW9mFEBCr1/RBBfuoxZOosxqFAUr8t45DUhxj3ZjU1gq95ZFyDjSjOrAm8GS5
	ms1I4t6tbiDxnNy1puUkCwIiB17TEEmvyL9BgliLIEwpZmMfpWhY7GoXrVT+EZoCzLvf
	arrujeagETz7SmKrDKjMLQ8oTSwrTnzKpdTynyh4ewPoPc0E37jR9LBrp5MVni8s5mJp
	N8kE9QK/D6uzTTfSYgtq10c8UMe0rEYpJWvl+DH4gc/CUS+fBocbIYfCFP0DcggKxp7d
	4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vegagtujb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E03FD100039
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB14F2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:40 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 7 Oct 2019 15:08:40 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:40 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 12/23] pbzip2: update license
Thread-Index: AQHVfRBWKEK+cN903kSWx0KjpEWSlQ==
Date: Mon, 7 Oct 2019 13:08:40 +0000
Message-ID: <ac9fc84595cd9a0a6733bf357425896f07b9a4bd.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 12/23] pbzip2: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:23:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of pbzip2 is BSD-4-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-e=
xtended/pbzip2/pbzip2_1.1.13.bb
index 7b1b0a117e5..1275cc00972 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible wi=
th bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)=
."
 HOMEPAGE =3D "http://compression.ca/pbzip2/"
 SECTION =3D "console/utils"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D398b8832c6f840cfebd20ab2be6a374=
3"
=20
 DEPENDS =3D "bzip2"
--=20
2.17.1

