Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-eopbgr1380042.outbound.protection.outlook.com [40.107.138.42])
	by mail.openembedded.org (Postfix) with ESMTP id 805867F898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Mlrbryhbb+qmV4LnPZDjs9PrPG2SRNlJajrO7PCK8v1e0M5F5iD7Sj0g2G7jWypfcMDXeZR3aD+SjRdkdpwrSGM/sC1phYLaDvw1CAoC5/gcgUaCsEsJPMV9zySya6z83AxZRvXypW8Zgw89ZodBV1PCinQd67shGfAI58HFYQJfoQsDhxraosypKNNQwoovMemTkyNtwVNworTxrEkCMfQ0nz+2TyK0IvFoZsZEbEccHklKlw6LNIx6OaVrWnJ6yzcn2TFqTVZKCeVvU8BFQnIglgtFSE72dOKHMtr+P66P1Df99F8nnbUQgJC6lo8eibBO2nV+QQO7LErZLIubhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Hgy5uA5XpHJjWJI/TOUFivuzyBY571f1wEuhVtZf9wI=;
	b=H9qQ470XEqnVagJY4fyAonBzhXypc9MmEAxRyZPgoyWtod0Z7ajVYpQ3p4/aN+dDzCUc6TF8EkwwJi9YGU1DCYPyxCCAxL41aKPeZDZUwdmUQ3XLUQJKIJqUi3ninX7M8ohjFOeuWww/noPzHYlc+BDDb/ry4Nq+q1Bx98kY5ykwmKBzeABxxYy0Q2IJGNkznGh0lV4oJEE2Ag9ALyKMEFxgt4T/dlz3I3/C4hiOrGxOZyygXkT+s6OKxqnxJ68tjtKxPMW+83z1ChSbwLyd4OGGGSIqOnq6KaUam23gLI2iQ/2T1JnIFgIo/e7AE1NSaTwWVUH9v03AfBmgu2fPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Hgy5uA5XpHJjWJI/TOUFivuzyBY571f1wEuhVtZf9wI=;
	b=OLCM8TryOxDs2rv+79NXrHbF4nH3YnloY9nsiu4sdvSk0hUSAcqX1FaeJnVqcFe59k8sIcKzdgO8gcaGc5Up1NBIdaRjRs2Iitd7/+4THGAMLQa8/nkqr5JP8ZQEMwbtSnXeu8PShvy74pefQDNlIMOqGdGEqAgmdRlmjZhcDCw=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB4061.INDPRD01.PROD.OUTLOOK.COM (52.134.159.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Fri, 17 Jan 2020 12:57:09 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.018;
	Fri, 17 Jan 2020 12:57:09 +0000
Received: from localhost.localdomain (2409:4042:2481:eee6:415c:2da0:91a7:32a7)
	by PN1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.20
	via Frontend Transport; Fri, 17 Jan 2020 12:57:08 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVzTWg9VMEhIr7yE+456Q6RSUn+w==
Date: Fri, 17 Jan 2020 12:57:09 +0000
Message-ID: <1579265816-11591-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:4042:2481:eee6:415c:2da0:91a7:32a7]
x-clientproxiedby: PN1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::18)
	To MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:4c::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ce28b6d-c637-4c71-0860-08d79b4cc32c
x-ms-traffictypediagnostic: MAXPR01MB4061:|MAXPR01MB4061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB4061B13E0DB020234D2E8CE287310@MAXPR01MB4061.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(346002)(366004)(39850400004)(376002)(396003)(189003)(199004)(16526019)(107886003)(186003)(2616005)(4326008)(52116002)(36756003)(966005)(478600001)(6506007)(5660300002)(316002)(110136005)(54906003)(66574012)(66446008)(66556008)(8676002)(81166006)(81156014)(2906002)(66476007)(66946007)(6512007)(8936002)(64756008)(6486002)(69590400006)(71200400001)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB4061;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TV/6pr/1yXbbVNxS5+/sZPhovu4J92Gh1Tbiwqq3sc7zjpXEo7eB81M5W4pWWNIdB1ZlyayZibSRMTIAf9LqPxIfMOmd0IVBrT1nmE2lOkbIyeNt/fBhSuGAOCiKlmbcCMRqNoxSlfzQbq9gDF3QJiTfrTkz8/plcVV2UeJJevl+zN5ecNrbHs6R1uiOBPBynI5aZlIhwL+Kqj2+dflgORsf5uh0mZrI17065wF4kwueddeQIrziVPgleV15HqP9l1c46yCrNC0oNR2w/alFxNM3Jakf34pN6QiOTZTPQ1nfEGZMc7zkbG1zEWunPNx2xok98TtoriGXb2kwcO8j+0ulu34L/SahP8HCl5jGeo+f2WkhxCHdo04J2gxFXKQ8jVjKlR/q/UR6kjMscb1dN8uc8XWtjS3cQiOQz0ZjqZ9GoIYAp3kAWRkIAtstAVpCo85j2NlkB1IdA0M1HNpHApFHfwsoW9B3bbcSkTGDfJ4X1MSIq8cIokgKtoQzBqQ6CISHBRqA893qWjJFfo18yF+v7eHQEq1CP965s8cznHQt1Bw2AmWquzCXREaxTuXIESC7qS4gMiPyPqThRKwWZA==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce28b6d-c637-4c71-0860-08d79b4cc32c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 12:57:09.3915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: po9Hl9lyCldYpYwm5Z/q/sHewjlotl5QDrPl2LbR0BXZIz34c7DF19XHDdD7HVCsjHYN/JM+o6LRA9cDqZiv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4061
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Fri, 17 Jan 2020 12:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sana Kazi <Sana.Kazi@kpit.com>

Added patch for CVE-2019-12900 as backport from upstream.
Fixes out of bound access discovered while fuzzying karchive.

Tested by: Sana.Kazi@kpit.com

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 35 ++++++++++++++++++=
++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.=
patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b=
/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000..94ddd73
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,35 @@
+From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 28 May 2019 19:35:18 +0200
+Subject: [PATCH] Make sure nSelectors is not out of range
+
+nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
+which is
+UChar    selectorMtf[BZ_MAX_SELECTORS];
+so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memor=
y
+access
+Fixes out of bounds access discovered while fuzzying karchive
+
+Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d5=
1ef9824db71a8ffee5962cdbc.patch
+
+Upstream-Status: Backport
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index ab6a624..f3db91d 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA=
_ERROR);
+       for (i =3D 0; i < nSelectors; i++) {
+          j =3D 0;
+          while (True) {
+--
+2.22.0
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

