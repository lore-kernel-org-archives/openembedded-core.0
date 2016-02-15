Return-Path: <urs.fassler@bbv.ch>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0090.outbound.protection.outlook.com [157.56.112.90])
	by mail.openembedded.org (Postfix) with ESMTP id 9D11073173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+2WG9w0m5PLvC1QeZv65Acjb70+/lXxeHrsjsFdqk0w=;
	b=qMos2deAkJ/7fCsfvB02tM28HP+SziQGCszQ+Gh7sMOPa4f1z2pz2YomFrHJTE4ywCGqTPIMP0HBR0KluB6oC/3UwkREc6opUYsIbSXrrViTdZcoq5G0GJ/5hOLy++xhJZIcbF6H8JK13w7MM2qBWkrONVai/Fwd/rpMeZBTweU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=bbv.ch;
Received: from talon.bbv.intern (46.140.25.6) by
	AM4PR03MB1828.eurprd03.prod.outlook.com (10.167.88.152) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Mon, 15 Feb 2016 08:31:13 +0000
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Feb 2016 09:30:50 +0100
Message-ID: <1455525050-5945-1-git-send-email-urs.fassler@bbv.ch>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [46.140.25.6]
X-ClientProxiedBy: VI1PR06CA0057.eurprd06.prod.outlook.com (25.163.160.25) To
	AM4PR03MB1828.eurprd03.prod.outlook.com (25.167.88.152)
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1828;
	2:P3u7bLl/OQwbTADAG0oc374/7Td7YiuKlCSeffb68sXIx8P9SqlwJhZRIobJOeryxbN/oJb5kLKgAEtfuEen0e9Bxne0dbYWZJiaEaF31QxAzCmMIMrUacMzFt1jOeKIvv5X3tq83t71QqSywn9FNQ==;
	3:D8/PmhhzieJ3CmZNnCaYyYEqF0cq+0BCItJGNfWYYfSLc2//I1HFDMIgXL8a10NIlVxMYUjB//CIb9co6XdPR9z0ZTplzgCP+2TLZxroGgSWowGCAVzcyioHzqTfYrsw;
	25:ohTCwtway2c7+NWcNlMfaEPY5OAUU+uMfI6oqhVC4v095rdLUc+kUkU3dwTyerY27RSiD35AuIR+ByNIhinBCiAGEV7ZHpPX2iCD7F9D8qawdDjSsm9zcazZqR/mzlaHmnW+ZauMCja6mDYwTvP0+2pyn/GOJSRS7k1x36bPQcemBNFrnSigw+eVJFeaouAdN3YKW9v5BwYC01W82rd82LGHhimj8esYsSmHKFZcaQke5/a+2tsAJonISMkrbcECwsiY7dmEavLn7v5xqjjchqtrb14b/h9PUxeG1HmTi0ZuNSazLrD5sqNdbfE+6KYo
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR03MB1828;
X-MS-Office365-Filtering-Correlation-Id: 32d1b99a-f36f-404b-e0c2-08d335e25d7c
X-Microsoft-Antispam-PRVS: <AM4PR03MB1828E9D1FB2C97842A6A4F288FAC0@AM4PR03MB1828.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:AM4PR03MB1828; BCL:0; PCL:0; RULEID:; SRVR:AM4PR03MB1828; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1828;
	4:dbD7WkP4sOZLmWshi4+CL3jOqX56mSo+iro+MeFPnZrnCCsESrW1oCfmTjZihGSBinmb8gK5t0ss/wdR+H/TTF4MN5d9MMYyEVjeG1h0i88R0LV/osnXf7nZJa68pkzWyl3Edca4eqTd3AWj2rukM7MIf4GkE3gYaua4HXwywlh9ezdbzR+l/7NU+Gm4A3TD+tPjIZV635IXRbtIEkHQmIXLwfd2ZsrMpIJ+XaKPechmeAgjcmm1yiOyQO/cvFcecdXq/sBHMVazNA+/OlSPLBtcx+aDiGtaybVY/3wuPZJf6Rz3scokOXKdaw/BOng8/9UWw5Rfly41u5zkRXdmbyUjS46lfOLSDRCgIQCq/WCXp1rP4nV/VHNNfb9D3Dj6
X-Forefront-PRVS: 08534B37A7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(122386002)(450100001)(23676002)(4326007)(66066001)(2906002)(5008740100001)(229853001)(2351001)(50986999)(5001960100002)(92566002)(110136002)(189998001)(47776003)(50466002)(77096005)(2870700001)(1096002)(40100003)(42186005)(19580395003)(5004730100002)(50226001)(87976001)(3846002)(6116002)(586003)(36756003)(5820100001)(33646002)(86362001)(19580405001)(74482002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR03MB1828; H:talon.bbv.intern;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjAzTUIxODI4OzIzOnMwMStQRkd4Y2JNRFRuVHJFN1RHT25JM3NO?=
	=?utf-8?B?WG1vOER6akhBVDZKeEJtakl2ZklFcjB4UiswcWJGeTM3aXkya1RPa3ZuUDF0?=
	=?utf-8?B?RHJuZ1VzT1Bmd1lqV2VYTjdqTXI0MUhpcm4xb2JselpMV3RwR0E0TjZ0Zmxu?=
	=?utf-8?B?cXg4bkVObmZmczEzWjRKVmlhNEI4NzJTRk1UT3kyeDI3SjVJeTAray94b3Nn?=
	=?utf-8?B?QnJ4RXJLbncyeXovVjJCcTJ5c3B5SWU3cjNpRzhlMzdnZ3Qza09Kck5jU0NF?=
	=?utf-8?B?elhGS2wycXVnN0QxbGNuOXhRS2VBTS9TZDJGUXlzNXBubGdKT0pXNkc2dmVz?=
	=?utf-8?B?REVFeTdEcWl2VmdwVmUrN2IrYjRIVXA3aC95ZnZxQzFwVjloR2djZU1MU2Fm?=
	=?utf-8?B?anVzVUVYMCtDRlB3L3B6eEU4RzhPcllRMXg3aGc3WFdUTWNCamVDSzdwYnFH?=
	=?utf-8?B?ZlFmdG5HRUxkUHJJcFpuMG5xREYvU1BmcWduS09rUHIvU0JKeWVkR3lCZFBM?=
	=?utf-8?B?T3ljVW5FaVpNQTRpQnhUM3hGc0tTQlBJeVBlaGFERnh2aGVNd2FaTnJBcUdx?=
	=?utf-8?B?Mm1vR0xMTmhjMlNzMzFhdDdkMmNyN2hKcWtBcTB3ZW1FaDNaV1grV3ZWa2tp?=
	=?utf-8?B?VHdjQlZuRmJMNkJKZUgxVHV2T3JjNVpjWGcxLzQ5SWhmdlZFaWIvZ1ZUVDFW?=
	=?utf-8?B?dkVVVStiUWw3YUdETVFsR2ZiMnRTajRWd3U5amh5b20rYlBrVk40c1gxZE83?=
	=?utf-8?B?L3NrUDZGdW9zSFdrWHhXa2dKTDlSc2dwZXdQYzJCUmJBS2Q1cStWWkMyOG1T?=
	=?utf-8?B?azAxZjNEWFNJbENETzEwZVRJSTNHdUtDV1pVVS8wNGdHTzJSQm43bm5obldp?=
	=?utf-8?B?VEN1ZmgzTnZJM3JPME1VRkVhV0k2M012VkhOU0NSOFViNnZpQXJpbzNzU2ox?=
	=?utf-8?B?TmxvdkwwNmxBUExqL2dNb2JMRUEwVE1vTnQrK1EyVWVLc1RSVWlwZTZGbE1R?=
	=?utf-8?B?OXpFeHNjcjNKVkFuQ3lUeERtZUduU1NLSm1STUVkRElPZm9NOGRvOGIvUnhY?=
	=?utf-8?B?L1QvMnpOS0pEbi9WbzBoZDU5YkYza05OUFo0RzQ5cG04dWJkR1llVGJ0Mmha?=
	=?utf-8?B?ZHBvUE53ZS9PVko4NUpIdGZvZjZMZjFPYzVXdzZvME10a0srNTRWditXREdD?=
	=?utf-8?B?ODlqZW9odXdvbVZTcHBIVkQ0VGhFbnU4U1lTNWw5blZpYmlLUzJrdjBvRXgx?=
	=?utf-8?B?L21EY2UzOHgza2QvSzBvM2NIV01pVjc1UWJ2NFRNeExvSDJoMThTdkFQUzBn?=
	=?utf-8?Q?34zGGqV0vvAmO0Lh1Q0m1qS04h7pOCo8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1828;
	5:XimabKg6aLWEmh04VTEaKIiuoVn5Yw90d6n/k4aFF58Uaw1Y+qVLQYFWvHWmEbU9u3DC5EArlHra2O13uxgfqKlhVfJ6d+Dr9jRM9ZDL3NyK2BIMs0ahUexXDoEOE354g8ml5TykF16jhwop43c+5A==;
	24:hYKX18mm6atWTaxgYbGUAzSK/aPmZNuuz3ufxHLQ6ZA+D+CA7pvJ7fBVY29MVFOQKh5rVar8dDka4LBtDIF9IfQc/rKiM4hjaNoQs8TpfYo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2016 08:31:13.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB1828
Subject: [PATCH] linux-firmware: fix license packaging
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
X-List-Received-Date: Mon, 15 Feb 2016 09:04:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Otherwise Yocto jethro complains about installed versus shipped files in /usr/share/licenses/linux-firmware/.

Signed-off-by: Urs Fässler <urs.fassler@bbv.ch>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 9792686..99d6b59 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -467,6 +467,7 @@ LICENSE_${PN} = "\
     & Firmware-ath9k-htc \
 "
 FILES_${PN}-license += "/lib/firmware/LICEN*"
+FILES_${PN}-license += "/usr/share/licenses/linux-firmware/*"
 FILES_${PN} += "/lib/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
 
-- 
2.1.4


