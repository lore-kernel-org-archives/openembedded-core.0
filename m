Return-Path: <rasmus.villemoes@prevas.dk>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60103.outbound.protection.outlook.com [40.107.6.103])
	by mail.openembedded.org (Postfix) with ESMTP id 446DB7F7CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DQwnzfdoWqhz5aTdPae1fV4LJ4JW2EKWpxgw9jYzHnw20w5TVhuHpfDaWBOoqv2c5yztYGP77bFHeiKstVeZ3SOWS4yQsgzX0uSIOKIb/eLiM4FZrznKdoPyRqYmOkQ0kAiI1OG50Q2i6iwvVKEsO9vEd+62PYtbl1hXHQm/iAS8j5wsbwJrY/CWa/vz/D7B5nQsjU0U+jbI6/6+UcPfKZzhV6bIgh0AuZi54kEFUW3Ul4viKTieB1gm3s4Xz1MPNqItw9viBOZ1wPzYIzagN7QgA6ICL8bYYP/tIzz0uegFXGCmJIU++5BC93iMA49Y5n4rhn+kdHFDSaAoZMQGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=v+z4+wu/GHnzzLqyZdJxNPLxBsycZ/tC9Sh0SKPAXc8=;
	b=kmtXvjTJMZugxetBeINJzwpjl02U3SQ/q9hCq6qAAUM68HmTAXHPNTk0WBQeWOpCnnOHhgc8YPkfpIFrGzLmxdWfkBDVDonM8ikzXYzkJxAgsl3aUBEBLwAQYOxcsjhZ7/CADt0p3HKl1e44Tx8fTww2lFumIvBJQzMhRDCnpoCXs5NVH7NagVCftIYuH2Twc3E+ynjaOmIL4x1qAdUcZjlCYC0qv2fHtCg8+J0QGsl62L8CgGfxGiR0vVKaJlmELCCBXHPzeVHr7hd/TXrcre3nq423pCSCo9hSdlGkhppDqdaZshpmTqn+0YkfQUYE32p7PC8PcuN/XQ4Mlt6uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=v+z4+wu/GHnzzLqyZdJxNPLxBsycZ/tC9Sh0SKPAXc8=;
	b=mmLo9usblws4EL1JIgJCETzpjybHOK6eT+qvorhfRAut6rlLJrlXrQSSRdwDmWOLbKdZIjGQyONxo3e6GQWs9qaTC3dAW6Nvi+nOoYc5DGZbB6uIW0Sm86J7Bh/kM6KHLWybe5N4v3QxtQK3utKx2YzJbIVCLnLnuaKxX8uTAfs=
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (20.178.126.85) by
	VI1PR10MB2176.EURPRD10.PROD.OUTLOOK.COM (20.177.58.155) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.24; Mon, 20 Jan 2020 09:23:07 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d]) by
	VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d%6]) with mapi id 15.20.2644.026;
	Mon, 20 Jan 2020 09:23:07 +0000
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	HE1P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18
	via Frontend Transport; Mon, 20 Jan 2020 09:23:06 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] glibc: don't ignore global LDFLAGS settings
Thread-Index: AQHVz3M5G9BLSb/lB0upqgzk1nY10A==
Date: Mon, 20 Jan 2020 09:23:06 +0000
Message-ID: <20200120092258.32254-1-rasmus.villemoes@prevas.dk>
References: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::24)
	To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e1::21)
x-mailer: git-send-email 2.23.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be0f40a1-66d2-4288-5991-08d79d8a5bcd
x-ms-traffictypediagnostic: VI1PR10MB2176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR10MB21765AD4EEA907AD784AE29A93320@VI1PR10MB2176.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39850400004)(189003)(199004)(66476007)(66556008)(64756008)(52116002)(66446008)(66946007)(6486002)(6506007)(26005)(6916009)(16526019)(186003)(6512007)(54906003)(86362001)(4326008)(316002)(478600001)(8976002)(8936002)(44832011)(956004)(107886003)(2616005)(5660300002)(36756003)(81166006)(2906002)(1076003)(8676002)(81156014)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2176;
	H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LJwn3V4ZWeP6alIKKFSZzJa1B4nq5g2Y/CNtPrn2agI7PpOoUrJ/Geb6RqKU6wX122LLuAJAyJAP7POQbiHzvjsLOZDLOAuPorE4ZcYCquHxBfzysdC3KK3aNSAHnI7+FCWJEHYY674FSznaxy5Tf0LkX2TrY1xa9uw9fPwpuAGpFwTuZa1i16MVU3hYFevEK1J/0pVJ3pUVKf8wm9oajyUaeJvY1BRsMl1+3ifAD1ehJN1g1HuVVP2nFD0jvXfaP2M1wKgndqMxNUkLpVL2Qztw31uwVsiJgvRxCgITfHwurfmjxK2eMNN0tBbr5acMwdIcveebY0gCr+MQzC6xialUTTloXoEIaO87KvyePbQ3fpITg1t+t7u60utnTRJOzqBW6LDVr7UP9AjsfUkMn4+aS1hfth0To2MY+6pwTf6XQvCa2ag0cSlzX0Cs40s2
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: be0f40a1-66d2-4288-5991-08d79d8a5bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 09:23:07.0514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axWloXOwHR6fjs8aXyYwUuxomfPM0Vn36cnkD7rsfJEBqtypy/QmunK8NGC5FtnzEhJ0jy7rJTl70Noag26nwKyEYBgESRTwgNAxGoMuQ/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2176
Subject: [PATCH v2] glibc: don't ignore global LDFLAGS settings
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
X-List-Received-Date: Mon, 20 Jan 2020 09:23:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Two things: The -Wl,-rpath-link comment is stale (due to per-recipe
staging), so we no longer need to set our own LDFLAGS to avoid
-Wl,-rpath-link being in there. Second, overriding LDFLAGS should be
done at the recipe level so "bitbake -e" can show what is going on.
Otherwise debugging why one's global LDFLAGS tweaks are being ignored
is needlessly painful.

So pull out the LDFLAGS setting from do_compile, and change it to an
append instead of assignment.

For the benefit of future git blame: the -fuse-ld=3Dbfd setting was
added by ac64c3b96b (glibc: always use bfd linker).

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: Rebase to real upstream master. Note to self: "git pull" before rebasin=
g to master.

 meta/recipes-core/glibc/glibc_2.31.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glib=
c/glibc_2.31.bb
index b8c570db52..cfba4de49b 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -93,9 +93,8 @@ do_configure () {
         CPPFLAGS=3D"" oe_runconf
 }
=20
+LDFLAGS +=3D "-fuse-ld=3Dbfd"
 do_compile () {
-	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another =
glibc is in staging
-	LDFLAGS=3D"-fuse-ld=3Dbfd"
 	base_do_compile
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
--=20
2.23.0


