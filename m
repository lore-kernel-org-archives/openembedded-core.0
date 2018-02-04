Return-Path: <mvader@victronenergy.com>
X-Greylist: delayed 28873 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Feb 2018 06:56:22 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0115.outbound.protection.outlook.com [104.47.2.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1850E607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 06:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CS3iVP8g5NhJECvUVzqfHCbrXJtXhKIhb5E/B3Mtn0M=;
	b=bs340N0z92Dwg2V9doNn5umZrl1yIzDrahGfWoCq6fEc/WE7iPm7yTGfvkHW2VQAYQRdFUMihWo4J9rz/yCJ2lgwKPwRRckcDAeufKDrDj9df/EM/i5bRTE54BmMIQLnHgRY5cvBK/YBJoGMN/GHTFls9d6WRq4SgcIeWCcKgpU=
Received: from VI1PR0701CA0028.eurprd07.prod.outlook.com
	(2603:10a6:800:90::14) by DB6PR07MB3173.eurprd07.prod.outlook.com
	(2603:10a6:6:20::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.485.3;
	Sun, 4 Feb 2018 22:23:25 +0000
Received: from DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::205) by VI1PR0701CA0028.outlook.office365.com
	(2603:10a6:800:90::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.485.3 via
	Frontend Transport; Sun, 4 Feb 2018 22:23:24 +0000
Received-SPF: Pass (protection.outlook.com: domain of victronenergy.com
	designates 89.20.169.246 as permitted sender)
	receiver=protection.outlook.com; client-ip=89.20.169.246;
	helo=mail.victronenergy.com;
Received: from mail.victronenergy.com (89.20.169.246) by
	DB5EUR01FT060.mail.protection.outlook.com (10.152.5.232) with Microsoft
	SMTP Server id 15.20.464.8 via Frontend Transport;
	Sun, 4 Feb 2018 22:23:24 +0000
Received: from localhost.localdomain ([10.220.13.30]) by
	mail.victronenergy.com with Microsoft SMTPSVC(8.5.9600.16384); 
	Sun, 4 Feb 2018 23:23:24 +0100
From: mpvader <mvader@victronenergy.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 23:23:17 +0100
Message-ID: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
X-Mailer: git-send-email 2.7.4
X-OriginalArrivalTime: 04 Feb 2018 22:23:24.0418 (UTC)
	FILETIME=[C57D1E20:01D39E06]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:89.20.169.246; IPV:CAL; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(39840400004)(39380400002)(2980300002)(438002)(199004)(189003)(107886003)(305945005)(106002)(69596002)(77096007)(2351001)(186003)(336011)(86152003)(1857600001)(106466001)(50226002)(36756003)(4326008)(8676002)(6306002)(81156014)(50466002)(8936002)(26005)(81166006)(6346003)(478600001)(59450400001)(86362001)(6666003)(356003)(966005)(316002)(49486002)(51416003)(26826003)(2906002)(16586007)(48376002)(5660300001)(6916009)(104016004)(47776003)(43062003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR07MB3173;
	H:mail.victronenergy.com; FPR:; SPF:Pass;
	PTR:89.20.169.246.static.ef-service.nl; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB5EUR01FT060;
	1:OF6Gkgs+HCGZXZuE22uUqfrwa/ywgzPTi3f6SsJRA6ATZJHHv5v58EitAd1vdkPTjT+G9yfwd7VwllgD5DI0Vf/51e1WoUHw6gggbLp0xtRnhbEbgwjZviQuwMfeej/P
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f3af63c-826d-4028-effc-08d56c1de7fc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DB6PR07MB3173; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR07MB3173;
	3:ExBh6PQr/TTM5VLWYzcF+KU8+VFeKIvE0ydVOvbEAeb8a5F3tGtafhTGos+AnJ9hcBDg4dolU58sySJVxwuml2DjgUk5NUVudTCgB1uEvqU1S06d89aL7UomDfbWCPzZXsfRsOemzhO63LaKsapjqQhe0FmUYyDzmv1JPTYyI50fs72E4XglgGsu8tyECzZdolXf7x4B2kHHw4UWMKiGYT9RylLfSoct89rECVasuA0GsqwQ3Go39+OHVdDcJStyNB9VTfZLhl9FtXSl7nWylguHJ01/LbowDcjZ5JuneGIo1Uv800CakeP4ecG7B2DQ2k5acmNVNM2vuTQoChyJCMW6UyzcD8JaJhoPDwdbiNk=;
	25:QWlRqyL9DmygLoFfNNmZ/R7WTMnIevo4irGOF9RZR32kTNrjHkyvEj+ajArZlOHmMkZI27/Z9VBnDCp65FiDUAoXVyGLpuHAafGuKPk2s4V3uq2E9xQnxmXMwlMiVvnlJjdaDXH6EAJjKrmqMVfuohylDqZx+lFJM60TPD6Sj4UwfU4B3QwYfYdU6NLNsgBfVTnjFB6l+RjdtgSRNXV3sAwS2tVKo+Rhkdf06kQ+kFeyUpVhSEYXtXspCkcUV1NaW41Taa2BcGwygMwQLdIK1lGbDm8yx+tXZNLJ9yC9FeBoLJromSErRzUmyQfiaSmVmWhZNWag1UG+9Z3jwxL1mg==
X-MS-TrafficTypeDiagnostic: DB6PR07MB3173:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR07MB3173;
	31:zK3B7gEggErZuCeBjDaYnzI7/nzeeeNjhPjuXiBmTY9kIww0CLMje0Tc/UkRJJBJbviwJNA6a3xFJDdViXfxYvGLxet3HMrndmyQ9UAUcnu1ke5oPZZig1UfzsqjRY4YJlZMaFkS7c1HbfFiywIyg+RMmg6A4156PqwrsRnBeTbhENV7Vv6YteSO5V9o8t5BnrZgeiFWO2i+eyLvreMfsqdKWEmAs5q4aEiLF4GGDbI=;
	20:W2i7VrM7xyYVnLXvhcHxfqhs/DcfYwrwyTKSxImJ77YDaGyAg0yHc7W7WMDjI8X3wLX4aBEtMDsbH7gYpYRqVHoTEWw5cYfY03FqxV7zu0zjsiPnV62jNmio0kmdEP4f+nLiIngGSCR4FQnRWpfbr54duhRIwkLlXqG/ecnhYbu+NndpcTZ/a3PG96J9G0FLCiq3INl7i4Gq0/j2zMD6gP4UOCjNpvCJ4sGhEm2Tdk0OeFIs2KGd2JW0g49MvZZzYCjU2ENB7YlqMhH09jqKtcEcYptPPn1VtkrWHw87Orllu493HpPUd+oQ2Ml8U60LS/PoUOPREjBEuW+yHC61M67dvdtxssSTcOFiyl/NcNE=
X-Microsoft-Antispam-PRVS: <DB6PR07MB31739D1DE27EC669A7AA9E5FC5FF0@DB6PR07MB3173.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231101)(2400082)(944501161)(3002001)(10201501046)(93006095)(93004095)(6041288)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:DB6PR07MB3173; BCL:0; PCL:0; RULEID:; SRVR:DB6PR07MB3173; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR07MB3173;
	4:Xl1CfFiD47JWDvPJXhYok6nGwPPT3OgsK9l38CsJFs9nDRHwCyp5jAJ4oewiiqhdXkFpdwS8ULa8u0G7mV5DhpyuCvk4vTA0qoMAoGlx9tVfZze8LFhIAshNNzZhkqeFKJ/U7wMQRRKQL9tsTNAyaagBS+OkICL/pM+zg0HukdWNhHA1ZM0FmoimXX78tC+fRj1Fqr1WD5AKVaaz7Yq39hUxzcnDpzbs/sRvtk7IL6fdT0t9OKzFqTABgEJETRK7L6+c30338gkbcy+tLRHOsbceoNThwXGZUBI90VMQB7/fQK74QMlutcuCiN9Ve3djhvyVXjdAucBGLHYUFgRNnQ==
X-Forefront-PRVS: 05739BA1B5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR07MB3173;
	23:UB4bO5uO4YiIzt8JX63oWsCz0kIghi5LcLkZQxJOp?=
	=?us-ascii?Q?OCafFz6wQA/YAAH9Tl3G1qbEDM47dNOSJCwrh8/4mizzgwUNyWUi6vghETBL?=
	=?us-ascii?Q?heBFiSsfz83tbJzDGMT+aEVus9R3DL5BahBMk8gcUtgSqBA+MuKI/0MI2aAV?=
	=?us-ascii?Q?qYkAtuNTzR2aAbpL16G9cuszWBVICOnJoPQyaOG5JruwOSR2qd0Ba8H5qOcH?=
	=?us-ascii?Q?3YL9+DfMdiB9X7I5i8pd0v+DG+dgL6e3aNaTbRlv4LPl6GAJtwEqQkTC8QCM?=
	=?us-ascii?Q?0h4fBqnBOYKs2CBwhmTnAzaoMv+Wga0bU5Zp10Jj96z+tigv/yuAw6388D5E?=
	=?us-ascii?Q?86x2+iVVrYwbHkYDHPXJa/0Sj1GjQemwk/ZSEB7dV4N1Y1/8tf0tOgQDggcC?=
	=?us-ascii?Q?JIhnCo5EerrtxfyWJYFf7DK529IVMheITFrNVlr8XKj4G8/iX5Tie6ct28pi?=
	=?us-ascii?Q?9YmQ3bjWnuUgyFxTR38nZDzHhcszfDmT4dPmEOWaeSirbOO/fXD4ZMSy4Aye?=
	=?us-ascii?Q?c4wbcpBVAY5F58dDpIW7GEBHXGnRJ97vGyibTBldANS8vqZZYPZh92k/5+2G?=
	=?us-ascii?Q?e52dBY0GW9JP1D68C22SEX1yiPnf1ZCcZE8a6a0xUsKNfeDTSYxO4DtIQPgU?=
	=?us-ascii?Q?MV5H07GYzHi6NmmX5LkpAZN0bXTJ3H6yXezBVxvhrmdg2AXakW4kBwm/AUSG?=
	=?us-ascii?Q?iIWLNMi2rcYmSO4AqWUUX83k85n/BXH4BQlICpXy7afbq1jLcEGUjJnh+ZYg?=
	=?us-ascii?Q?5x/4NDdD7Ji1UOvpHcMqDCpXDX6+hH4GTYFAbtAxp71+Opy8Wc7wMWhIYFwc?=
	=?us-ascii?Q?5DBOmZzXIsmOL/PmXdFFnUKfQ7fPMkNkA0jedJeCDFNNsMjG5AjvYmVIdSuI?=
	=?us-ascii?Q?QJgiddoMl5AXs8ajOpaFCQ/0jSDmdYtgCER0c/lXqeEVgJldTmdi8leqsq3t?=
	=?us-ascii?Q?18FiMLFMZ8pPWtBdFXFFIljLMNR9ozbV+Kj4DP79RNGt23GcvHlv46DTv9ub?=
	=?us-ascii?Q?aDBEMOIeDEt/rdze7J23GZD4vAIl6pz4bQhErOHKhQRsi+48sndbl1v8bgl/?=
	=?us-ascii?Q?ywI4yTzZQ3TP0NF4gId3S+QqAEq8bhzKt+vTeDBvb7C5xI5X0ew3OM2x4GtQ?=
	=?us-ascii?Q?vvZnK3lse0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR07MB3173;
	6:Drz6PctfOj0uhsqr+gqA4EJdGIFdBrl7/Eod3zWtEHlU3/n4a9Kl3Hg5Gf5lFVOTCyfg6hzCtb965et+I1HB+q7ylNU5WdHV2lMklmlZFSOPAwQ5CD/QVAP7sYuJ4a4tUNXKeiRpuIJxl9wclalETyOCZH3JpNE+qo+VQID/CvrALg9ffOesAaSqwKT4l7wh8DRthPfn9ki6tjzy5cTE9+DVapVYFwuW4cYSzszFlcOnn7mFN8nV1Uh8AR77ntuUQiE6iJxTKkCFBxQ2NgX6mrzFOBRXvdlZs9GPP8b7LlraXwo5lqXJbQuS0/jdPscACoCGCIzGtcneog8EEp8QPDbKaQM4DLnF5I+fLGxTQWQ=;
	5:PKm9WwNFPBpGhX71fbc/P622oWxP2UGFrPye+p1Z92Qbirg6WLlsPFrI/1nHaJgXq5Z4wRfKDo4WYlNi8YY/9uNYs1/bF7FVP8CCJ5KdNMd1n8n37vJvMDJVawv+NzvMzosEnj/1q8BFXZHNoW/4mIvjfswn8U5T9dATZQl8J2E=;
	24:sxVBTlaXp+IaX5uchqKZf6ej8Ovv8HErp9eOpm3moUfs3+K9rjdyMbjsSXTr1ALUvApG7/+O1adBuytDBbK6W0lxEoNLYETTiW7ryg1vfT4=;
	7:HWDSuOktRAywe+Q4dYXTpVz7SyqZXARjCqSGLEnzMCMIIYFcO0n0vDlx3ePuM9yXgq/tjJQGc4riw7luurgVZeffTI4PNbzx2FuswMmYlU9LJn6Gw6ZKcCcuZ5i/glLhjm37igMRC4xL5FFtk+vC4Cn1HMnEChEXvPg3V4lr9HFvuMJQdrPjG9fEGCOCicp3weQXOvxjNLmQ1o44S8c2lQB6Sx2v8Dp4U6vUW5IIuHtbMq21GKQie5f/3Y3jJrvb
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2018 22:23:24.4289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3af63c-826d-4028-effc-08d56c1de7fc
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=60b95f08-3558-4e94-b0f8-d690c498e225;
	Ip=[89.20.169.246]; Helo=[mail.victronenergy.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB3173
Subject: [PATCH] classes/npm: replace cache clear with cache clean --force
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
X-List-Received-Date: Mon, 05 Feb 2018 06:56:24 -0000
Content-Type: text/plain

npm now requires --force to clean the cache, see [1]. Also, use
clean instead of clear since the latter is an alias.

[1] https://github.com/npm/npm/commit/34f24c8381235790945208d25ac193bc97a21b79

Signed-off-by: mpvader <mvader@victronenergy.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedb..43aed36 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -31,7 +31,7 @@ npm_do_compile() {
 	fi
 	npm set cache ${WORKDIR}/npm_cache
 	# clear cache before every build
-	npm cache clear
+	npm cache clean --force
 	# Install pkg into ${S} without going to the registry
 	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
 		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --no-registry install
-- 
2.7.4


