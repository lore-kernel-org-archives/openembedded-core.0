Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 2610 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Aug 2019 10:05:13 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA8E7E63A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:05:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7S9CCnN024946 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:21:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : content-type : content-transfer-encoding :
	mime-version; s=STMicroelectronics;
	bh=M7mZLHJ7fjYcoTEqYJssggkpJAC65lE9+FBOvUS7sK4=;
	b=QgPdJGYwsnQugpkM5da4WHlPNm5B7zyN5jJXsrJ7X10i5dubJTrIcW8mCt9BSFB9hl7B
	wufo3FcrU0S8G40YrdZ+q2X28XYlcvnuxzeE/i3E+BeLoTq9rfmU5CQDTPdK9+s5c4WN
	TxdwsTfB8+7uct753HavMnrQ/tulS/Ob1rselL9flGVdprWL6hqlFSyC65wdK1gaguWr
	uoxZ4h0wHvsj0rc0qTMepgUDeUeMpF1V9+BtVLe16ZGNQ/e2n0qWNJpfhM/AAN5nfKQe
	c3XrhtAJGVkWspM1gofmodwLSmwypogfNVQeV3FqElzwCfh7zLWzsoJUZkDG5UzHwoBI
	eg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx08-00178001.pphosted.com with ESMTP id 2ujtcbq3ub-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:21:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E069551
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 09:21:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74F672B9AB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:21:40 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 28 Aug 2019 11:21:40 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Wed, 28 Aug 2019 11:21:39 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] common-licenses: update BSD-2-CLAUSE license text
Thread-Index: AQHVXYH/kCUZaqletU6uDphnNHn/Kg==
Date: Wed, 28 Aug 2019 09:21:39 +0000
Message-ID: <20190828092115.12773-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-28_03:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [PATCH] common-licenses: update BSD-2-CLAUSE license text
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
X-List-Received-Date: Wed, 28 Aug 2019 10:05:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Using the generic BSD-2-CLAUSE license as specified on
https://opensource.org/licenses/BSD-2-Clause

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/files/common-licenses/BSD-2-Clause | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/files/common-licenses/BSD-2-Clause b/meta/files/common-li=
censes/BSD-2-Clause
index ade0f34d59..f1917d6b73 100644
--- a/meta/files/common-licenses/BSD-2-Clause
+++ b/meta/files/common-licenses/BSD-2-Clause
@@ -1,13 +1,10 @@
=20
-The FreeBSD Copyright
-
-Copyright 1992-2010 The FreeBSD Project. All rights reserved.
+Copyright <YEAR> <COPYRIGHT HOLDER>
=20
 Redistribution and use in source and binary forms, with or without modific=
ation, are permitted provided that the following conditions are met:
=20
-Redistributions of source code must retain the above copyright notice, thi=
s list of conditions and the following disclaimer.
-Redistributions in binary form must reproduce the above copyright notice, =
this list of conditions and the following disclaimer in the documentation a=
nd/or other materials provided with the distribution.
-THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS`` AND ANY EXPRESS=
 OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTI=
ES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. =
IN NO EVENT SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIR=
ECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (IN=
CLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; L=
OSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND =
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT =
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF TH=
IS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+1. Redistributions of source code must retain the above copyright notice, =
this list of conditions and the following disclaimer.
=20
-The views and conclusions contained in the software and documentation are =
those of the authors and should not be interpreted as representing official=
 policies, either expressed or implied, of the FreeBSD Project.
+2. Redistributions in binary form must reproduce the above copyright notic=
e, this list of conditions and the following disclaimer in the documentatio=
n and/or other materials provided with the distribution.
=20
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS=
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE=
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE=
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE =
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQU=
ENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GO=
ODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) H=
OWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT L=
IABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OU=
T OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH D=
AMAGE.
--=20
2.17.1

