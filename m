Return-Path: <cbugot@sierrawireless.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0084.outbound.protection.outlook.com [104.47.34.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3306C78870
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jaxmnMgByOEwRGzf5dYn0UoqwtqxZ/agYzYPnTbuaVQ=;
	b=u90poIslTMUu17K+rIxrV6in5RNmx2XYJdnpEeorvdJ5yBUyd5Zx9Vyrj8uufOld5Vc4xt57bNdSiupw617YXBGezOeMM5yA0oCn1txPxqx5orYYRr8z26P8wHa4KRLGGihQMEPKj0a7I6MISEXkOMrLC3QJyd0c4+45ncFXUfY=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB1628.namprd02.prod.outlook.com (10.162.160.158) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Fri, 16 Mar 2018 17:31:30 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3]) by
	CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3%13]) with mapi id 15.20.0588.016;
	Fri, 16 Mar 2018 17:31:30 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] uninative: add variables to the whitelist so that it
	does not re-triger recipe parsing
Thread-Index: AdO9TH9RHM3TjEkGRgOC2+RK0UYmKw==
Date: Fri, 16 Mar 2018 17:31:30 +0000
Message-ID: <CY1PR02MB115262F14464BB959F555708A3D70@CY1PR02MB1152.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB1628;
	7:MZ/YlXKhMGN9tnUJ4kyFtakX+B56/foFK1pSD7+2quyjULyBbVAhjexVvoj8bqG9IpmtTIICVUuYHkX84X9AMnq0N+HXpPQ8GNGP+NzS9oyKupu8bAj05iyxNnitqLCecPOmjK3j50SKfDLVJVssV7jxvNIFYAlB4jvaoY2I0S9KALVDjIIC8PqoAibPUx5BPedv4KApv/z3j4Ij6ja2IJhPNKjQgU6sEtDPFvuaYtHpK8zmz9J9RNXqP1XBtDMw
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9c8cb75-f173-473a-e467-08d58b63c156
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB1628; 
x-ms-traffictypediagnostic: CY1PR02MB1628:
x-microsoft-antispam-prvs: <CY1PR02MB1628B6047A38D03A13031605A3D70@CY1PR02MB1628.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231221)(944501244)(52105095)(93006095)(93001095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB1628; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1628; 
x-forefront-prvs: 0613912E23
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(366004)(346002)(39380400002)(396003)(199004)(189003)(81156014)(53936002)(99286004)(5660300001)(105586002)(74316002)(55016002)(9686003)(5640700003)(8936002)(97736004)(316002)(305945005)(7696005)(7736002)(2906002)(6436002)(3660700001)(33656002)(3846002)(6116002)(478600001)(1857600001)(86362001)(26005)(2501003)(186003)(6916009)(5250100002)(14454004)(2900100001)(8676002)(81166006)(3280700002)(106356001)(68736007)(55236004)(25786009)(2351001)(66066001)(6506007)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1628;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: stE9kbt3KbiBB+2YNqaGCyaZYwD1tcdpPMflKB3Q9kyyHgWcmCqwvEIkVwcaeI+3H6NRsbiLKTAjrdz1EG8+JqV1iom0GJ/VZu4IP0GxrflHWT63ZeIDRkEX0uBEkE5VmhGcrLiNBS+reDexjgKh4/pg8uh5uh6CfI/MEHpPrEPMno+6lGpebJKWhHCVfkLdXji0FiC6yNvmckL7ay5V+uO3C/6S9Ddb3qnpqnRkUrd4WqIf4UMTcqhhZc94H/8zBKCbRgTce+6mELrDgruxkrPUyQi87wsmtREBU4y1Fsy9VrPlXUy0Afr6L4xDwdVvxqCwJf8K9eZYkHI4A3w2Kg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c8cb75-f173-473a-e467-08d58b63c156
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2018 17:31:30.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1628
Subject: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Fri, 16 Mar 2018 17:31:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When uninative is activated (poky's default) internal datastore variables a=
re modified (NATIVELSBSTRING and SSTATEPOSTUNPACKFUNCS) to enable uninative
support. This is happening after parsing is done at the beginning of the bu=
ild. On the next bitbake call the recipe would be parsed if the two
variables above were not added to the parsing whitelist BB_HASHCONFIG_WHITE=
LIST.

The fix is to add these two variables to the recipe parsing whitelist BB_HA=
SHCONFIG_WHITELIST, this is done at recipe parsing time, only when
uninative.bbclass is used.

Signed-off-by: Cuero Bugot <cbugot@sierrawireless.com>
---
 meta/classes/uninative.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclas=
s
index 8f34483..d1fdbc8 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -8,6 +8,9 @@ UNINATIVE_TARBALL ?=3D "${BUILD_ARCH}-nativesdk-libc.tar.bz=
2"
 #UNINATIVE_CHECKSUM[x86_64] =3D "dead"
 UNINATIVE_DLDIR ?=3D "${DL_DIR}/uninative/"
=20
+# Enabling uninative will change the following variables so they need to g=
o the parsing white list to prevent multiple recipe parsing
+BB_HASHCONFIG_WHITELIST +=3D "NATIVELSBSTRING SSTATEPOSTUNPACKFUNCS"
+
 addhandler uninative_event_fetchloader
 uninative_event_fetchloader[eventmask] =3D "bb.event.BuildStarted"
=20
--=20
2.7.4

