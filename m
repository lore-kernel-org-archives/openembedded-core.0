Return-Path: <tom.hochstein@nxp.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30055.outbound.protection.outlook.com [40.107.3.55])
	by mail.openembedded.org (Postfix) with ESMTP id B926D7F895
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NIJs4uIPU/u47+5Js4sZxGHBZhYIAa0pxZkRFoqeoXaCkngGNxbzF0U29wGgCkoHWURy1QB6ZOqWy/J0tQPptPUiSjNM7JA+/lEKifLScb1ZMINZkLfmdyoT2uMrW5x/8EVEvDmww+vJHdDHNtSL3hAFOruFEpIS5KewagobQEKArZxuxDp72C2TpKcHT2eOC7Ga+plySlCOZcYpMSmFJYDs+JF+AajWXih4u6wOvqwom49gX7t9az3iIqgXf8FV+SMvG5s+r/8MO08K02tNbMa04mPPPlnJAq/Yau2sv26xXBP2IywQzxuuz4HiiUtAsxA5K//9f8HVEa2CgcSkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Y0wooz9REjPeIaCuzT31OtA9MjOMMcmHMD8GetX7+AY=;
	b=e6Ii1AM6xq3SGjdsCTPzf0oiDq2o7gEaDZYnATqFEYmuyj2hTf09d3WyN8PYmLXEhFwFJaE3OxXKv21+kZA8myLC4a8IQXdB/OJ17JPr7JsBcYL7fCb1utUfm7twxSQBbkNbrawygN3FYpD+SWzcUxvf0HIsb16tXOtQ3maKkLcuut1yd6x3nRfxRvFS0ZlGpU5oj5wY93P6DPZuaoNGxIg5yVdD75TLWpjwBqkAPyuJjUpH/3ArVhgw3NtIqaq+ZgUfSeaeJaBb50ZJtCsouAdABSliMHDFVUnvO0OBn2DwdBg+nHzcucSyIusf/6Gh1c+sYKd+Z4Lwka/Pm5pGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Y0wooz9REjPeIaCuzT31OtA9MjOMMcmHMD8GetX7+AY=;
	b=FGfiNZImVGjPzsTPjNlAOOx/e6J+NHSXLh5uyCFtTkHumLwWfDDP/VvckLaEV89kmC6xxVggzXt0O5vajMqlu3Gq7hLdzhGYKBtSQTiBPZQWRrwplqHsEX4cIVhfRU7Lz7zsEWouz4PCU2+W4CotkBgYeqUShEaNh1gC2CrfcLQ=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6350.eurprd04.prod.outlook.com (20.179.234.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.30; Wed, 20 Nov 2019 19:25:51 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::45c6:6829:40a0:107]) by VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::45c6:6829:40a0:107%7]) with mapi id 15.20.2474.015;
	Wed, 20 Nov 2019 19:25:51 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] u-boot.inc: Fix devtool build u-boot for u-boot
	without menuconfig
Thread-Index: AQHVn9hRUoLT+q/ncUecBGyqFA4hGg==
Date: Wed, 20 Nov 2019 19:25:51 +0000
Message-ID: <20191120192419.7352-2-tom.hochstein@nxp.com>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
In-Reply-To: <20191120192419.7352-1-tom.hochstein@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR10CA0018.namprd10.prod.outlook.com
	(2603:10b6:5:60::31) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c9e98e4-0eb2-4fb5-824d-08d76def7431
x-ms-traffictypediagnostic: VE1PR04MB6350:|VE1PR04MB6350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6350BDD883F7A78024B1C469E24F0@VE1PR04MB6350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(189003)(199004)(99286004)(66476007)(66066001)(76176011)(52116002)(6506007)(386003)(81166006)(8936002)(81156014)(25786009)(256004)(478600001)(50226002)(71200400001)(8676002)(71190400001)(26005)(186003)(2616005)(102836004)(316002)(305945005)(11346002)(86362001)(1076003)(476003)(2501003)(7736002)(446003)(486006)(3846002)(2906002)(6116002)(66556008)(64756008)(5660300002)(44832011)(36756003)(66946007)(14454004)(6916009)(4326008)(6486002)(2351001)(4744005)(6512007)(6436002)(66446008)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6350;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUPiNWpndeGu264SnZeAn0lbUv1YUdIlV3oKG06xIcERd/NvSGOIkxHebSun96cBJCaqWsCIgLBzYOAJ4vyd0UFHDMKcjsxD5K113gZ4DdDzDAV1DBTr6R0/mZoGF9QSnGHf5HmQ5WM4dMZY7wLNEUYescF8aGZU151ZR/W7XfkCMSkURm6ufEI9fUzXyFsoLYlSr92siF74yWNRgtFq+/IJd/AZVp0p2M0uFPIQ871oYlXJgE9iMD0yyEEL7skg5+sJg94DGJl4qQIVjUhRqTEUiI0N+dxxkYMIysDc4TPwIqP7tH4H7nqz8mcN2/2owD9idG8db4pnt8MkNaL6elISVyZUNqHCx4kHhxhSvjTA030M34SPgrzCcK6aInxIsf4IiTNerMW0gKKifClkl9NhjG3TKMar6peMvsluNOK2LC1aNu5mgioYg5KOsOp0
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9e98e4-0eb2-4fb5-824d-08d76def7431
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 19:25:51.3545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54xng5+NW0Ae7dlTrtpT2jHr6lR5iS42sVMI3SeUvlvDGD88z/rmlXlBZTAEfApAY5RQs2Bc/6lQPN62kfAYZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6350
Subject: [PATCH 2/2] u-boot.inc: Fix devtool build u-boot for u-boot without menuconfig
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
X-List-Received-Date: Wed, 20 Nov 2019 19:25:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For u-boot recipes without menuconfig support, running devtool results
in a do_configure error:

cp: cannot stat '/home/r60874/upstream/fsl-xwayland/tmp/work/imx8mmevk-fsl-=
linux/u-boot-imx/2018.03-r0/u-boot-imx-2018.03//.config': No such file or d=
irectory

The problem arises because u-boot.inc supports recipes with and without
menuconfig.

Fix the problem by properly setting DEVTOOL_DISABLE_MENUCONFIG so that devt=
ool
can control logic that applies only for menuconfig support.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 9a754fd09b..d241347bf7 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -87,6 +87,8 @@ do_configure () {
         fi
         merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
         cml1_do_configure
+    else
+        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
     fi
 }
=20
--=20
2.17.1


