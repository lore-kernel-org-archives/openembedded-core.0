Return-Path: <junzhu@nxp.com>
X-Greylist: delayed 74386 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 May 2016 06:20:05 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0092.outbound.protection.outlook.com [65.55.169.92])
	by mail.openembedded.org (Postfix) with ESMTP id AB38C6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 06:20:05 +0000 (UTC)
Received: from BLUPR03CA009.namprd03.prod.outlook.com (10.255.124.26) by
	CY1PR0301MB1226.namprd03.prod.outlook.com (10.161.212.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.485.9; Thu, 5 May 2016 06:20:05 +0000
Received: from BN1AFFO11FD043.protection.gbl (10.255.124.4) by
	BLUPR03CA009.outlook.office365.com (10.255.124.26) with Microsoft SMTP
	Server (TLS) id 15.1.453.26 via Frontend Transport;
	Thu, 5 May 2016 06:20:05 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD043.mail.protection.outlook.com (10.58.52.190) with
	Microsoft SMTP Server (TLS) id 15.1.485.4 via Frontend Transport;
	Thu, 5 May 2016 06:20:05 +0000
Received: from r01007-12.ap.freescale.net (r01007-12.ap.freescale.net
	[10.192.241.124])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u456K2Y7001252;
	Wed, 4 May 2016 23:20:03 -0700
From: Jun Zhu <junzhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 May 2016 14:16:06 +0800
Message-ID: <1462428966-21934-1-git-send-email-junzhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131069028054128316;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(586003)(4326007)(11100500001)(229853001)(87936001)(50226002)(2351001)(104016004)(8936002)(105606002)(47776003)(85426001)(106466001)(19580395003)(6806005)(92566002)(189998001)(86362001)(81166005)(5003940100001)(2906002)(36756003)(110136002)(50466002)(33646002)(5008740100001)(1220700001)(48376002)(50986999)(77096005)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1226;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD043;
	1:ihfMdKsN9QO/FSRyIZN25xZujQi0ivRLCPsjhmRAIW/w89PINoSbPE3p7GL5N8YDUTJn+I3dX4aJZmrTrLLFWmEpu31LX51F8lPjEY7rIl2WU7YMwuL/mf7+xOBJAucGp0pYkEcvdDnna9rYyTApSu0sQpBj8WJRPXxlhNmtBaUq3hV6lwC9BfM5LMGL4R3KkrYQH0+7IwVDyjEDXZB5KyrhFiAL+HWHnx6xy9pOCibJbREGvxN4JIX3xR2b1weRKtK54UKZwCvsNDpMs/y9faiCKaan4BEkvPvHp4jZ125rd4pYE5Przq+QBe0CLCkrlYiemMFgLySZExDtPc6QO0LaxrLpfYXHWtKlnmpMLlHDUaFQB6vzn4tUlZVA7jXRLhkJZm3TmoOUdYuRidoVWBxZi11ViVYFPYDURQeXk4blAMTHOysENEWHM39nNi9lxBLGmXgmZcJQbb77Q9O/ON2oRiSK0rhf8sQWyxjpQ0/huVy/CZB31Dcme/4yAC+hzTC10odeIIZtpGwrrxtAWUvTaGMGkvxQE9nHM8gHIzxKDtXWVOXZe90tyEvxGlgrbsunabtw8PLxhW3XolKI5S3P1LGIaky1ccuZcYvYILztghlDsIsupdm/Q8eEokuDYikvWw/XHTSF4DfBDAV5GwGslHAsOdeH/3rIQPZRDKKA//M7zrFcAApLVrf2iFIwYww1WNb3mbE19O8tD9kWvA==
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 063142c7-c65f-4212-7555-08d374ad4cad
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1226;
	2:rqIyD4IewZvpEPMYqTjhk3PNgdJSkCmuYjUZroE/WvrLfLYHWV/8rLoMD89MXNndS9fVZvIgk89RTjVuBqlSOosu7euEHozQeVzWs7B1ky9TtfOzbbWndMMJSgnG3OLY6FnT18jBUbRtbJMmdm2PjmQ6SP6cWbDYjC5+QaU3XgMqyrMfDKiAzaD6Jrsrt4Aq;
	3:63g/c872zEx2wJhpdKd/fEfxFow05mWVYsfvhb4+gZMvZpWrPjTYLKJqkzMOETVZebANpIqqQ4PFmyCGm1wr2E6Oy/kE6rPyvGysqfTdVNPU3R9yyrsymFrG6RdA9Im4mwOXoP8aDVM2AzXMIOKkD0AoP0RKIEA5gKP6XE34Ag3XusS+jcPWW36s4ErujH/7b/x0vlUa/ZIAsXstpBHrbm3wpZYRjsCTk/tbHB9dLaE=;
	25:S9Q5no24yvifQOWIc5cu1k/DAkkyvk5kr4k0kE6DPMzYNOyFwX3e1OV5Oa/hoMPlCZjlJv3sRuvUb6zGUxmk3jIXCvX4WhZXIcr9k/3x715STu57+YpiUYE32sQJcnyW3PVN72dou42vWfCFFyaRPN7SYtOP1S9QVoKi+97J4iWJKiOhQMjs6tYl27MVinHpeYRbexLuKsdKvGGJktbzU0Rr1rIQ25RWY3PABVDdqzTAX+YP1UuIivHfMwugv0/Ov/5coXzvEEjKNDP39T21l/d1mqNJLFLeS6heShmyKhkB73YKJs+xq6SDi6OyQQK+b2Gt2GMxkAHpPNzrw3+7eh8ITZ0ThvcwdhEG6Kxa01dICSMLd3UvcNhsHtVbpkedyBUgLpVqPKIDwhWLaCzziLT8ziGRF3GOgb81KAXn+MBYKUEtbRaRNolDW2kIxRCc
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1226;
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1226C80863CAA96035BAED01C57C0@CY1PR0301MB1226.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13024025)(13017025)(13023025)(5005006)(13015025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:CY1PR0301MB1226; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB1226; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1226;
	4:A8GfGHPt6983NhUIfTukqWdqLysdVar6Chabe3D27ITxgVztqN7VBGF1SIP2PUnrI3qCCXkuP4EtwHsGe1nyGSQ/nkbceL9n1mlJcgc9QphvKRUXWJ/eXSkVZJVfaksOOMKwBXSBs7R0lyZi/eG5th5ap6BLrLe5xOaEiG+4CaMos2IGokUDFYwG7CYG4WmBwicC3qBxUWpudX0gbap9sslkSz/t9FseMeKXFmf/cd7lDk19iri/8PscTPtvkTe+J6v7/39TKOFaOvDmGIIZ9ZIFspVyyl5F86D1NeSO+K/CXMn2BRG6q+eKyKg7pwrgicpJ4ON9Yg1Hi4adtjvKUZVlzUcvqkiZnd6loFkdij7Rs+Lrqg3NLlIfvfFiOQT4F0hjnnnWdxKfnTCWYrqkV2dQEqm+IuHk3jH09YHUbsyasvOprv/QCC+jaeCXBtFXNHxL4jUV8EZ/V3UCDDvVE2x0s8ftqXv8slbGErSH2jc=
X-Forefront-PRVS: 0933E9FD8D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1226;
	23:v5wIS0mYfIwG37wju/269/3HRH80HBEtU/P5fRG?=
	=?us-ascii?Q?10Hm6SsFVmPmDLTXle/bbbozporcc1HSsZ2mta3n55UIUOUWbdX5oNyYhYzs?=
	=?us-ascii?Q?uBRnNxJEpH73koQWOXrCUNIXPbVGsfGuuez27xNSaaQZM6MYyhDbPb6yKgqJ?=
	=?us-ascii?Q?gQw/Yimwq6zgrrHpJ8CHuIsyPjCG699///vZeANenDk9cG+Thpv6p1fspJNS?=
	=?us-ascii?Q?9oCVKW1dpq2W7rk8Ea/OzGlAQfmcOFv15Hppd7YN2Ml4BMonY9qat1646UT5?=
	=?us-ascii?Q?HNnmEVu52fgGTN1TnuyjXRKf6zB6DvF4p8UZxh4ssZX5LKW4/65cL6uGQQSz?=
	=?us-ascii?Q?GHRn4Mvq+5PXv+tfTzMNrKx3WI8bI3EHD5dYjB9Yz2BQVLMhV0lrUzMmW663?=
	=?us-ascii?Q?wRrSN9UZYmDQ//ZUwVKPXz8Bmo46CWR+6GSBbDjSppf5ZqOZFoCN5m4Ro2Yk?=
	=?us-ascii?Q?IgeF6He5m2GH6yZCVvRkgyqoTEHrP1W9ZVWcdkHp15906vS6EACIfkXgNte4?=
	=?us-ascii?Q?qPTClSMg2rP6PGAT7nEDPFhIZEDyKTtZVGeQo6e1XpfitIZ9QClltA6aTWKV?=
	=?us-ascii?Q?nHjcXl1WaeWa2wdvwvW1kfmZOaxjCnqp7JwfH8IR/9uHwSqB73i3BQJiUl/j?=
	=?us-ascii?Q?GthRLki4XCvxsKGWKT/hdZzYhuPry8uxlxYgSc5WFV4w8gchziW2mq3SCTw+?=
	=?us-ascii?Q?+6GHj1bDm1NafwJkzizK1sByRqRQkP3ZpmcXPMLPdnkxvhi6+q54U5zsab10?=
	=?us-ascii?Q?DstSwcNb//ryGUC6EquJIMTH61VKl6VSj8lxUp72guDm6KxjYlwavZP6lWK5?=
	=?us-ascii?Q?XcHpUIzI8RzQte1FYwiIgihpJNNbhQCgrVtJLu5d1N8QjB5WhrtM3r/R+rDe?=
	=?us-ascii?Q?KcO61kQOvGiXsj21bbjttti5P2d9lql4UtVv+ZWcemiqrqt4b7WLFlSeKE4k?=
	=?us-ascii?Q?oCMb2mkJQvRkwPqDOboebzCWCKi79VVU4z68AwkuPEUB7LKQNWW2VzXX0uDT?=
	=?us-ascii?Q?ZBX8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1226;
	5:zIk8CzSYb4HHOVZktlHGdfDhmluTtNXCuOsU+TezBBaZKZs9Q0IgrNIaOqvIHrM4M+6NEhN4ZW5l9MSncCCfhKpBCfigV0uGkWad7Xe8wlzJ4CJxjs06gLwNQj4LwpzlGYoi8hWcpKO4Mpa2m1n0RwYq6HNUjpA2PJEcyt2E6sM=;
	24:/ZPLmp1exoLF8OBWo1z7DHJiOa0tq33QdKiF+qU2gQbhkAIBH6NHLUJ4l1kqzvTQTOdPnJZZJQqFWMfx/ysbpcw/z43/KHrb2xaVm63ohHQ=;
	7:5C9jsAd02Mu32qmqt1fGw+XTIKXXhGW6No149oTCh6HpeeIQ07qtWa+hXx1uuhBvY96NJs43+0HPVhz2fmChSRTt60b6/UWRSlrPecYHXSxOt6xB+9clg9barA63wl3niETg26rQK0qImd5As4a1VGIqF+0t7hqkhzuwk6yxuiGF8yet0oLM09HaIFcfjTiJ
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2016 06:20:05.1788 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1226
Cc: Jun Zhu <junzhu@nxp.com>
Subject: [meta-oe][PATCH] Revert "xinput-calibrator: fix XDG launch"
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
X-List-Received-Date: Thu, 05 May 2016 06:20:07 -0000
Content-Type: text/plain

This reverts commit 6464bcd67d10ab9967ac83c27c413c1014be707e.

If another GUI xdg/autostart app runs, the xinput-calibrator may be hidden.
And touching the GUI app causes the wrong input data for calibration.
So it is not save to run xinput-calibrator in xdg/autostart.
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index a9de3d7..2812520 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -27,11 +27,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/X11/Xsession.d/
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
-
-    install -d ${D}${sysconfdir}/xdg/autostart
-    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
 }
 
-FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput formfactor"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.9.1


