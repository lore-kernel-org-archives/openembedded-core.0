Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0079.outbound.protection.outlook.com [104.47.2.79])
	by mail.openembedded.org (Postfix) with ESMTP id E1B3674638
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 23:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=WQ4CbBkD7wAhkp3xZjsRR1wnEmZuqOF4A/+zUn4NM4Y=;
	b=myfo+E8RN9+CfQqwJvn1EWGDrT1aGtBPQ4heE1CxE2qEwBog5h2sLaAvV+7bvZ6lGm4kX7W7PfI9KYAfTVJ5F/zC9FSG01ntzdNe/k1xdwLR4PW1pHwuNrrhAl3hXKc3hSlIWoInpJmRS+I+HBUdrgmqmMhZCwFnbyVF2r/Iodg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=vaisala.com;
Received: from ThinkStation.vaisala.com (193.143.230.131) by
	VI1PR0601MB2544.eurprd06.prod.outlook.com (2603:10a6:800:81::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.13;
	Fri, 20 Apr 2018 14:10:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 17:09:30 +0300
Message-Id: <20180420140930.8149-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180420140930.8149-1-niko.mauno@vaisala.com>
References: <20180420140930.8149-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: HE1PR06CA0141.eurprd06.prod.outlook.com
	(2603:10a6:7:16::28) To VI1PR0601MB2544.eurprd06.prod.outlook.com
	(2603:10a6:800:81::18)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0601MB2544; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	3:U1oC5MFFwB5VTI1ol1JA0Rkvl2Y+qmsoiSymmVyNRPjgROcUUw6n/J77phiOKOCoGHt0A5s0fmDUcVzwZTtc+N0U5FeWBSFMdyM1lvm1mBO0JQMITEQcCO5ANgl5so9W4HgmCaRjj5ZKsMKusLS9mA7sBPyYvU5oLfqe5vHethQleOzhx4wWhpTknL8IIWkmgS2Y3cfVZSqhuAMQl0wwo7m0ABfLVnvSU/2mYrKgllvop6TO87NAWxT0F9NER0ke;
	25:nYomZzDSnS1LoouxWXDfHeNNWMlUC3POa2yvg84kvX4mcW1h1v9wlKb6/4s875eqmNDGQTUeBsmVU88yOWN4j1+ULh1ubeJCMvz4DaeyWfVolBuOjmA/ylX/yWbwUuGPhYORvdXcxWUIWHLpPsCGFoTpUpW5MEcMK3T/p5NOLtqJSUnEwthSytBCHVAwP7/PiiiA72oKpHijQKvDt8JgxhWamqJFpqpL0HbxON6odYBqX3r+Eoo1pfLMFOo8AUTOJ38VTlYYBxXwcs1MQPKsYgSmZXwqyLxu3JQCqp0oMaUkuTk3s4vSqvbapukaMHlBf6jlwe+kgATPx7giZiW0wg==;
	31:bWHXoyXa9MUZc7GkeluuwvBpIIMGlNJMvMe24TZxxMkjY9aHsHlhr6/44RPcNp3dulP5FHQmfcQE/4ohTp8902Sc16wk9p8lL+PcwZiw4nrzm6k8J2Yxijy3+s7kSjtcXJuxSlCsiQcr/W+gQuZYsJ9hTALTOlF9wVdzkyL20O6m+4tERF85fXeDZdhAEVLQtRKN6dpcySQQ3JTLg9yYRhMH564a0P0UAH9399krJjg=
X-MS-TrafficTypeDiagnostic: VI1PR0601MB2544:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	20:ldPmif7EqRmzZdabaMlgivpMLjaUObUK6DZYw0IbeYLLiRmzm36snwd16/ShohOgMpjjEPtr3MfZGlrTS4DrcdIznLKN22YDJMm2Xw60NizdyrJy7hdL3iF2ypl6028V3eLWJCtaxmxAD/aoIFJBmwYzRs5/RycPGfMOlz/sSDk=;
	4:J8aOUY/HcU54Vjy3yDfwmZip9c6UCHTxeWF8wLupHqOEpGyeSs7SdZy87/wHtwcOSpPmQbSjh4OlBeXPLbpov+oJfUzvRo0KOtCoO8/mcAFKAIHbTi87ejkZduzLPdDx3XFya9smUbfjhSU4r3VzhcUn8iz+guRpo38gn2ELf8KTJT1O56uiB9LU5Fzu3DSQJ7XOgdRwjZAQPjkine6zaDQeKFYJvh7FQcmgndtb+BZBEzmoWInfMzRim7FFUOZmN+2AKQVASwbySlGzAqB/2g==
X-Microsoft-Antispam-PRVS: <VI1PR0601MB25444B8FF8F19F235C8279BE81B40@VI1PR0601MB2544.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231232)(944501395)(52105095)(93006095)(93001095)(10201501046)(3002001)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:VI1PR0601MB2544; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2544; 
X-Forefront-PRVS: 0648FCFFA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(376002)(39380400002)(346002)(396003)(366004)(8676002)(50466002)(81166006)(76176011)(86362001)(50226002)(52116002)(25786009)(386003)(48376002)(36756003)(7696005)(6666003)(6916009)(107886003)(6486002)(575784001)(59450400001)(478600001)(476003)(2351001)(956004)(16586007)(1076002)(446003)(6116002)(44832011)(53416004)(2361001)(305945005)(11346002)(2616005)(4326008)(2906002)(316002)(186003)(66066001)(8936002)(5660300001)(3846002)(53936002)(7736002)(15650500001)(26005)(16526019)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0601MB2544;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; LANG:en; MLV:sfv; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0601MB2544;
	23:lZvBoONbAJRMKLpUg+Kls0Hpp4LSUvspbMPGLcy?=
	=?us-ascii?Q?HogvQuDMzYcsLM9ezAX43RebYMjKURkIsUYYlFtVkFszN6H8s9BavPKQQUZX?=
	=?us-ascii?Q?9o6im2FixoB8rsy0dgULuuor8MEx+rTLdnHQNg0R0b4iv27sPeXhS0QY3Bho?=
	=?us-ascii?Q?jQybBv0/rYlIwmkT7SJJ103kxTw++YAf4wZGi6MBc+Hh/ObNavRQzboGLJ5w?=
	=?us-ascii?Q?0dSTKBHTg9u6hgJpboB0MJQl5Nm+hh2LW+Mw1kpX/eODnIaD3OMfUpNpdPOm?=
	=?us-ascii?Q?3LhF2lAIMJ1fTO4jnEIBKPT79HEijK3nKGZwuzJb7JzkND5DrKYrmhE79HSj?=
	=?us-ascii?Q?yfLQDBDUa2Am18l0jADTENvT1qdXldtgOK9C0o/TNEZSDBmaBInaoGYEbspe?=
	=?us-ascii?Q?2Kje5YX0ZaRrmb8kA8MwBQy65mZeveJF+i1rAzM4ZgWWAx/Y3vG3HPEqOzb+?=
	=?us-ascii?Q?/B9xLvYwUuA0N/hzVWJoKISS094EfzyfTP86407yaIxXnhScz3Azpo6Lpzsh?=
	=?us-ascii?Q?sxaRXPPiHOXOfthwZUuYNIKmhr5drtHiPQl3gBPPHDYYD0TfkvaTXkZgWXh6?=
	=?us-ascii?Q?Gg7h5w9kK9R6zSEJgoy4zbR3VELe6zjzmxAZTW60++Hhml91nNdqRtY0yWn8?=
	=?us-ascii?Q?NSapBw7PdhrSynJ0ArSM0N4q+njUxTtzzewc/g3KUpck7C0yOW4pNqDT6JK5?=
	=?us-ascii?Q?66D6vrpKw0hEiWbtHr0EacLuVXb7rf8LUxNerFDmD7lgxiT4fKYcrV3s+KlS?=
	=?us-ascii?Q?ZIjHG73UM6kJZbQdLRgu+GNIoYgDCvBNe70H7AJXz7d1+ddhrQg/ypqPD1fU?=
	=?us-ascii?Q?DtVTkBg91f8e1TMSBLVCcEqj2hfVh8FEeN49y4MraphgFZRzBMc/0O7HImuH?=
	=?us-ascii?Q?b0CqaUr7ZenpqWQLsz+mrn7EUc4QGXN9K71nafKNFJJuhZ1iFdFxwZwQ4PWI?=
	=?us-ascii?Q?eN5PvaAlly7dbeOWvnCQVzFxGCVBOgPuu7fDwDGyAKptlK7K8svs1AD4BFPt?=
	=?us-ascii?Q?2uyWgqu2KsD3HxpfPsplNO/t6yZmy2IMk7fMwZ5Ca+SQRWLnHyVo98aG5lGq?=
	=?us-ascii?Q?0NwtUM6AcLM8ASt4REhi6xLYPWA4gpxZS8jymTa7eR0IwE7LKdbs1g06PLu3?=
	=?us-ascii?Q?Llha5y/aYYUuWesh3REZisb8KyyikWsNKH12P4cJ1JrbKsTKGA8BFfPNIohx?=
	=?us-ascii?Q?qMQHTg6kkMe0UbX8=3D?=
X-Microsoft-Antispam-Message-Info: P+bTHxsCPzkSC9jfFXIoNIsT8r/qQcv6NCkCsiZJMqhylQuLIDw7ZBotMO8M10RMjlmYEbyIozLuk3AUR5a+Rhw67Pi8N0juxof8Ejur4HlpRObm8PMsMFJ5/5fPYGv9eEZ6wI/99B+zxzoiKDV+IN0+yDxM3xqrHSw6scbtVuneWweGcoS4JNYr/mBjZ9e8
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	6:8+YHDKRBScF3iVQISmgyII1s2xZEODVGqV57yWCTRrGOGnw2AvMAC2y9chF2cLxG9a4otPm9gzlub0ygC4uJWsaIiZOZJ2HBEu73u5i/w3zbgZ2Tvu47bsLVaLrneF/kWzYRJIdrumq0Ez9TjTCH0tjDZPfjK8GJkxpQgCFLnfXEHINStPeQo+6yN07znZDkBokCFI/tFbVliNIE9W7NxeSmGsjikp2MPea4HA8uP4O+B+qE1KGrU0bJVQYYRIjVcuvXrNQQeXlkMZM3UqTR+1c+UoM5Coh3SesTawB4LlLGr28EhfxvrmdypiEJRLHY8oXiO0ZdHDs6GxgJaZ6I4+TONgZ4UAaawaR0kV1XmNjNLUIaGEMeimULDwyIazk6fYEF9B1/YhTILdLiJneESncvlOzhbAD2fFBIrAaG4Qz9boDwRwBR6Pk/HpuRkfCJXoA9Px9g+Tqr+DplRTTe9A==;
	5:sAQYJXIxu/m+br5QIcGcjZKWC7VLdf2Z3RXnTr4nQnc6Tn9x5rOK7JYRAeLqT9DDu29KXvJlTFpQaBCkzSq0Z8eBEi/TmfQU9njFuI/L+ciWyMPOs+zalzsKd4EQr3pce9F7uJwo8FPHcx4brqJih0W1KLFfiUlqCJBqpw41ZLI=;
	24:MFWr0N1qTDtKZ0zwPLYXQQZCkj8/VhK93iS9KdssOYInyTEVRrUlHSYbKIqXM002X75JBPZl3HRtyHjDYwsJZ/zmb/SeqnS2OwluPytpD90=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	7:ETiycggXVLBobsDT3oyG6vZ2VVjLwl3CMui+UDiRA3IFNAADJJoDLZTE/M5ou9X1i/KtjkFq/2bOAxGnnOW8wo8g2atZlpt/86UB+a7DnTqsDDXXwoGhIaal2STHbCz3GJkIgk3YYXJ2NM6QFcbak0i3BOqsRgG+3q1jTyaTaIBnMBm9+xnlas9X39S9TdTIQLPmVfjU3JaXqXbpfxXuE6Kg3f4L2wIbPSQmEuXaAjisi9QoayAetEp8k4m6PULj
X-MS-Office365-Filtering-Correlation-Id: 6ffd8451-f0fc-412e-1c41-08d5a6c8731e
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2018 14:10:19.4691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd8451-f0fc-412e-1c41-08d5a6c8731e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2544
Subject: [PATCH 3/3] mtd-utils: Complement update-alternatives scope
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
X-List-Received-Date: Fri, 20 Apr 2018 23:42:48 -0000
Content-Type: text/plain

Avoid collision of mtd-utils and mtd-utils-ubifs provided binaries
with identically named BusyBox provided applets in case packages
are installed to same rootfs, by adding relevant binaries to
update-alternatives scope

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d09d633022..f50a42cf0e 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -28,10 +28,27 @@ CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
-ALTERNATIVE_${PN} = "flash_eraseall"
+# Use higher priority than corresponding BusyBox-provided applets
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
+ALTERNATIVE_${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
+
+ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
+ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
+ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
+ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
+ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
+ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
+ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
+ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
+ALTERNATIVE_LINK_NAME[ubirmvol] = "${sbindir}/ubirmvol"
+ALTERNATIVE_LINK_NAME[ubirsvol] = "${sbindir}/ubirsvol"
+ALTERNATIVE_LINK_NAME[ubiupdatevol] = "${sbindir}/ubiupdatevol"
 ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
-# Use higher priority than busybox's flash_eraseall (created when built with CONFIG_FLASH_ERASEALL)
-ALTERNATIVE_PRIORITY[flash_eraseall] = "100"
+ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
+ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
+ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
2.11.0


