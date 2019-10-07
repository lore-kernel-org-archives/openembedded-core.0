Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 82EE77D3CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:47:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x97D6gOE005447 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 15:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=sdQJagIXDO66i7IWsG4lv3sYUQ7NkDT5al3gr6snDpM=;
	b=Zp9xsTltXSxixBqfzEi7wb2d/MPlm2oBp8p5ptniyd8c217Ai2YNkfNVHKDLdUbSKPbG
	EZ5kG6K5dNqNMUCUOixr+c7ZypHkMtGONRVxIKl1xzOpaxxhWGWBLU1W1SM4PDC4phOz
	Hs6s6Eq8Nd99jR7J2ylMR9c+LfnqACGXA+cntMs4u/ujyyRxDKCSDsfsatfIl0UI4oQN
	7u1kx9M5pTlSWBIwWFGPL0EpV2PFlSOXQ0TKv36wW6N5+gfYN+NhV0NycTc8ejOKO4tS
	64RF/kZU6wPmscuAeSb12UPXFtXn2szZdPytEApRfS31+7YJjTsNNVgOL8CfgZgc/o0P
	dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vegagtuj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:08:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E10D100034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67ACA2C9DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:08:40 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Mon, 7 Oct 2019 15:08:40 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Mon, 7 Oct 2019 15:08:40 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 11/23] lighttpd: update license
Thread-Index: AQHVfRBWxJcbdJJxF0y8TrBxoVoscg==
Date: Mon, 7 Oct 2019 13:08:40 +0000
Message-ID: <b595beee9d3e1abb5666bffc073db6273fb0361f.1570452710.git.christophe.priouzeau@st.com>
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
Subject: [PATCH 11/23] lighttpd: update license
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
X-List-Received-Date: Mon, 07 Oct 2019 13:47:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The license of lighttpd is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.54.bb
index 2e83c821a67..20ce6987293 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Lightweight high-performance web server"
 HOMEPAGE =3D "http://www.lighttpd.net/"
 BUGTRACKER =3D "http://redmine.lighttpd.net/projects/lighttpd/issues"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a57=
9"
=20
 SECTION =3D "net"
--=20
2.17.1

