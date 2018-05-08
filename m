Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0052.outbound.protection.outlook.com [104.47.34.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5936174B83
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aupr9lEWJ9FYYAC1v166oB/H9NVQabfalfQfWgfJEjY=;
	b=OL4xmliRyvhQ/1l2uYiKSA2X6WJlR/gVINyrpfjzgmuRU7qKQ8mJScQbitdOS+i/l8KQvOKaTtiN5+o+Ul0z/hAav9VyocXGTDwmpmEse7FJaaTwE4mXji1ik7btobx8KOE1OB9JLgtX8Yxhf1JQrcZuhuCK/RCZYzq0Vadtekg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3422.prod.exchangelabs.com (2603:10b6:805:3::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 18:49:17 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2018 11:49:02 -0700
Message-Id: <20180508184903.13506-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180508184903.13506-1-mkelly@xevo.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR20CA0010.namprd20.prod.outlook.com
	(2603:10b6:3:93::20) To SN6PR0102MB3422.prod.exchangelabs.com
	(2603:10b6:805:3::11)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3422; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	3:Ax8IyH0tTi8g4zEWbjQKKyDVH3GVxM6W1w4cglyfDJ2eYMBtDBjZparZBf/rbWuHaKDymVnmy59WBzHTWlYusIOwXnCekuU5e60XVrmE8ZSf9Cptt/05lZAcMlu/wvw9KR7qxEE8u+5MdIHq6gcsal9OKCxSbtOa1upmej+coRwr/TmPVXdYyhoeHz1JW1w25AY3gPLhpOIOWOrouH1Sctu4BDW3KbEVcwTH7vaJVXBamQbXhnv5S1r855sja7hG;
	25:jIEOM02TeJb76KIKdmEdXb1cliIAFVrdiaprLVTvowaYnhCP13vfaUvXsx+NXA2sf2H7Hqw2Fw4OyULcz2gaF3lCZyQ0hmbCMSEiGXX5POV3+SHkhKtHAtHetwYLH36znwhVKk/WenYTeA0IH672MGWLU9WPagvHB8YlPg3aW1d8rT/AIiimztCNWv9y2FLdq70f0/4reTq4kEM1m6Zv1XfyXnszwcxLlZ47Zgf4E05puOeC7diHYGRuHDbwZJ3zmKtJdOTxsi9ccDKIp5R+on/CfBhY7PeBf+7+f+ZGgfGvGYihUCFLr/+t6rLtdIirPMZCOXN7HaK5PjD3h5Twsg==;
	31:eMivICfw2TPULu2HZXd7N1JekhoUn4nz8o6gOdtB3LJHgbEI6b4mb1OcX/DXvqWoXEKl97VY34YCz3qMTQANtIr8sMmwNhbLfOeDeKlmacI1NOKJ3s18w7ZKQVFtKc7JB/pMW6HT+jrlR+bFfYJuLF0B7lzIm0NsLzCyh+HSfYTMWxqB+pAXkpih6Du1qNakJrbZKSUCiVMYgYuJYEJDYBf9Vk1pvNUNYunDBrzYbok=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3422:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	20:cCKbm1c2yjk4YY5g7tpCTDrYiWaZDcLA9+qQlOEkECbIWXQJBBg9gKWPlqBcIwZrZX0I8vM6uoRgcmcqwy6nhtnfUemF6waPVi9Yi/rrA/MGRu5IXKk7nzfzNLRZQ10y5zVAXWGIkUc1Vs5KMAWOU53OKP5TgMLROa3OcuG07/oQTtFCsoMqcLVX5X7xJ3C0OaHWlVPzX0ZEn17YzfY1aoOyWRIXGjcmBhC/lRzDGhuppsD+F++sdN2x78N7vZ0qcEFATL/8wD7BSbwwY3kpOfl0mUZr5kH/l5/sxZ7NgF1Ljt/VVrFA8JOLkzpWGLnLlUSUm1tWsFAU83DcGXH8/tUjrL9wk6Wu8fejZHSyLObdMLZOxkndWH4tiJxVjho5HP0kdqoWrtbX8eDzXzEhOn8w3OcgMjwQi3JHtL7dZBzZXfhOZoufCDCq4lai+X3bS31oVrjdcIWEywBSvhYThX6IrwJQD+BsdCXpuNSOrta6beWZB35S/iHpNyPWXbOd;
	4:78HMnW15cXbZZUWuLJiKxRCl8PS/KMsZTr3kNmfXDtaVilwWFSsbdcoMUbyfT+oxmOW5B4+bN+IGEKpbSy5HEbtoXuDqQfoE7TBOesj7I30K9haw5BTOUchhskKyjMEJ2ujNzY0SV5/G8jKaa0MtpYOUkAa6LpACmxCZ1A68xe0eg24Ea8q3CkG+OACKjoGyARlFOGsYsmc2lhjzEuZtLzzbD4FQzQBvxYo9/gdGnufa1994qpl/0jo5qlyDXvZNG401t8twI8ai4ZCtPBtv2Q==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB3422C80241A796F6DC4352F0AB9A0@SN6PR0102MB3422.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3422; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3422; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(39840400004)(366004)(396003)(376002)(189003)(199004)(8676002)(54906003)(97736004)(3846002)(81166006)(16586007)(39060400002)(486006)(4326008)(53936002)(316002)(5660300001)(81156014)(6116002)(2351001)(2361001)(8936002)(1076002)(50226002)(16526019)(26005)(107886003)(2906002)(7736002)(305945005)(956004)(386003)(76176011)(52116002)(86362001)(7696005)(50466002)(51416003)(25786009)(47776003)(105586002)(186003)(66066001)(106356001)(6486002)(1857600001)(6916009)(478600001)(575784001)(68736007)(6666003)(446003)(48376002)(11346002)(2616005)(6306002)(36756003)(476003)(59450400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3422;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3422;
	23:5hy8tdw8+NfdvXDUbo5aLjnVJ0z28DDASihiknd?=
	=?us-ascii?Q?Ry/TiQsb9vVfXTl+xEzORDFcK1Qf3QbddilO/7jNbpFISlFbgovo2TL7A7Yn?=
	=?us-ascii?Q?lv9XBtK+WcLMo1bmc/P9+5z/HqlXZwjZsXbdlAnfWQGOqP0HhNfnzcDwiLyg?=
	=?us-ascii?Q?Uhq7rIIbcd2yBKEmNTIqWctpcm+/CROaCyVcNzpjZGrkjcapx6D7JU9xH7ho?=
	=?us-ascii?Q?K+nHJHtfs8S5wXwIuorxR12PdgNqXhFVGDwJuijUekxatCrfHZdPLQFnzCao?=
	=?us-ascii?Q?KMv4JHxcFOOizpTAHK/rN4acb6FZcTnoliKJmrZpMuYDq9jCKRY9bz6FPpIq?=
	=?us-ascii?Q?dzGgB3i+9OMnYoOU+Kc/aXa/LiwtG2YIMHZ2+X9DRQiMHzwbrw/Pi0RB6JIO?=
	=?us-ascii?Q?Zh+iGyjOWmwqQoX5k1NRf8Chmex1dnekKJc6QxRPnqFMfvFF5mVj1r8ruj3r?=
	=?us-ascii?Q?80U8/wDGmfRWDkOTTBRxvFTq9sW9Njl4EQEV1lMy0KsFWPwV9lMlgHa4m7/Z?=
	=?us-ascii?Q?xENVVdNMEuL6fjvKr0hJRGQLNy5CxqbkMDyeDQeYwZthCpExLMnYoEU8NfKM?=
	=?us-ascii?Q?1Diu5z9SqnugQVEvlwvXEZGO3KFd4dzKK1u0f6AHbl6Zkb1/OL2G3D/Xe5QA?=
	=?us-ascii?Q?HbbLa2+y6UVi6qt9/69U5iToK6EfGHmtU7Nd2F6SWTn85nv54fMjIuxPgmUU?=
	=?us-ascii?Q?zFCYJC8Uc0h0DZrcaCoYAuUUXoP7rMgq3s9+Ixm6iBLGk34qL2F7sP9f58ni?=
	=?us-ascii?Q?dc37M3bpPXdBx1UZ4gcGxo9Stc3vB8xSEWVmrqXMkc7aLdOpWcs/BUrPAIhj?=
	=?us-ascii?Q?VGRjBDPNizqG/EMKlR/bAymRAnaZwBi799caKJok3HuHT5cQpwEcUC+hhUEr?=
	=?us-ascii?Q?ZQqKBuvpRSxvOei1eOznokIl/w5miEKynODwtwanineAFA7UyE5iPrqMb5Kt?=
	=?us-ascii?Q?uCMM5vi+dTj7gKzY6R7Wf1Mcy5f/A7MsHZUkDDrvc0sOcn721Gyizhbx6hnj?=
	=?us-ascii?Q?4rh3h5rq4vjroRr93cRBb6RT+/ZLmgFlf4xmNAdaHRUYzYBlMhRpVsVKak52?=
	=?us-ascii?Q?gWc9mSJIfh8qn8LNCneTQOZZsawNx6/4bpCFiaEj2Q2Rjz9wrfTzbzfmU1XI?=
	=?us-ascii?Q?8j8dhquCPDLSOQjpGdrJLyItRyx2rfGnPiEY1jxlEpn4GrN+GzU8hON+8hm1?=
	=?us-ascii?Q?I1u2/saKLfgkZ9vcl2Ynkt1e9wPXyRuItsICWJxuu1x3ggl+zHrQiJer2WJw?=
	=?us-ascii?Q?Mu6lBR4aQtGqFW0915T6nQF9QqTx/K9Dn20AcfrDiqFDY/b1IApmKNJiTPTe?=
	=?us-ascii?Q?9HVcWXONrOX+euPDlOQBEXvjyuvUprO/FYS6Udo9kJpXb8VTcQqwkN6VoYW9?=
	=?us-ascii?Q?mqW2jaFrlL2Jc63hSDx6/IkwbeN0=3D?=
X-Microsoft-Antispam-Message-Info: JF9LuHyD3VSID4bnA0d8iNfIDIbXunSd7wagafaXv8qpr/NhMsGSP99xprJHVYmjIqoSOK/cZGFOUvDqo5pdEVVMDmPFYzDGJgTjAtu+n4WgcvcrlGWy0ApxfycwEqTX32tUifZTF0wsAqK+4hs7h7d5lX7AAQOZURUWMuDjzhNYUnuMcfnkKZqB7WVVoZFP
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	6:R2P/1Vm+Ul4K/o5wsubhTpBhs/nfo+7iUEGC6FfuA+Y8VNLO6tDMOSVf64xOMUZsrzRA21wZzQHzImoD/9yfroDysY1oTttb03aqaoIAIDL+eYZeF87yQwssERcSPRDhCvYabppHZrhr4MUXN8sLy2WRp4jKMFroSn4Zvtzj4w9q84pgMt7pJ215Nu74GlME7Q+k1DnWe+axU5fbNzyiMG66jGXhucWL9KJWj8++wDFBq4xf0cSpVTBpVdHhfPIk62wEcEwQ55GF2lp3XwomOASQwqr3ACMrnqKLmZ8irl0gm/x0v7R9EX3vj8m7tNOgpL+XVTI/MwGjE8aEyYBT7QAyESUM12OM0PGt6Y7u4UiE9DeUi1T2bSTwdhmEJe6M1vtGbGPixD0yMVYS3E8INtq63yek2fMOFYUtGnl7QYxwWaCcaoFYoY5IS15XjhxjWADTmCh1EiZSDponffENpg==;
	5:sD8A43MUd4m62V3Q2EdFMYtPhtw6axmNIsem7EPs94e5wMB7Qe53Pxk/Ha8qS8OZO0X+EDjuCXEG2zy9llvJ7cGY7NS1WBfvURN3txipzZbAj+DHGCqqWdEiqZ3rXso5tNzNmYrpL4AKz+QNsPNd5PX2SuPshIOpvm3e9JQsdZc=;
	24:JWXDDwoGNYFwKDYPJkrAW/iFqkkxrbh7+3t1RfMuDfILXUpH3WsKNyUfrIvLZy9AssFODkkmkqgrJBnUWLbvzIjkqXPyqWuCIt7L+No07lg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	7:Kh2J+nxU7L+NiJjvdYaJGRl59Bbcrwd3nl+iIN63hhimaa/Xd0hzottLv3bCTbB0gj2EwAPL6bW5VSP7hu9QoyRhG2DtbrzJ8iTF8nz3XoO8Pkpr61KxfFlNcAhiqiu4puZzrG0l+8btGQMD5let9aQxTf3lS264hycbt2G6aCp8Z/zwYEO8PKOCSorgDRBlO0Y4rctQeggP8FSIVkYK2JVBJRsa7wKn15FCHaGmyG6EhPq+9kcqi9QA0N+OpaNl
X-MS-Office365-Filtering-Correlation-Id: 16e78b4b-f8ea-4637-62bc-08d5b5146761
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 18:49:17.7452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e78b4b-f8ea-4637-62bc-08d5b5146761
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3422
Subject: [meta-oe][PATCH 2/3] modemmanager: upgrade to 1.7.991
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
X-List-Received-Date: Tue, 08 May 2018 19:21:33 -0000
Content-Type: text/plain

This version has a ublox plugin for expanded modem support. The underlying issue
that enum-conversion.patch fixes appears to already have been fixed upstream, so
we can drop the patch.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../modemmanager/modemmanager/enum-conversion.patch | 21 ---------------------
 ...odemmanager_1.6.4.bb => modemmanager_1.7.991.bb} |  9 ++++-----
 2 files changed, 4 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.4.bb => modemmanager_1.7.991.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
deleted file mode 100644
index a3fb0f3eb..000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes errors found bt Clang
-
-| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error: implicit conversion from enumeration type 'MMBearerStatus' to different enumeration type 'MMBearerConnectionStatus' [-Werror,-Wenum-conversion]
-|         MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-|                                  ~~~~~~~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-
-Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
-===================================================================
---- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
-+++ ModemManager-1.6.4/src/mm-bearer-qmi.c
-@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
-             &connection_status,
-             NULL,
-             NULL)) {
--        MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-+        MMBearerConnectionStatus bearer_status = (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER (self));
- 
-         if (connection_status == QMI_WDS_CONNECTION_STATUS_DISCONNECTED &&
-             bearer_status != MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index e60cd4b74..4f9400169 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           file://enum-conversion.patch \
-"
-SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
-SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668"
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
+SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.11.0


