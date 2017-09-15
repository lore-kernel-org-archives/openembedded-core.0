Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 8405 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Sep 2017 19:35:14 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0075.outbound.protection.outlook.com [104.47.38.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7509B786B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8aBJFYmcbwyMSQxLOxtZGNj1uahrbBySu3uVkTjCmrk=;
	b=ffq+iddYZk8+iP5aphcrc0DITlmRckfqqt68zYms7lTNwTO9QkD3vXmJQdJZDJTnssbQkrg/708WxNRpez1g3joF7Iwef9pKf0kU8aFHLo7sH9Ld8Xmqt9rvMwbEWYXJgU/8Vf9LYgk5SAplfvS9jkl5WNa3qk2cpCZcUMhD0Ps=
Received: from BLUPR0201CA0021.namprd02.prod.outlook.com (10.163.116.31) by
	BY2PR0201MB1925.namprd02.prod.outlook.com (10.163.75.155) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Fri, 15 Sep 2017 17:00:30 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by BLUPR0201CA0021.outlook.office365.com
	(2a01:111:e400:52e7::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.56.11 via
	Frontend Transport; Fri, 15 Sep 2017 17:00:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Fri, 15 Sep 2017 17:00:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>) id 1dstye-0002z1-73
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Sep 2017 10:00:28 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>) id 1dstye-0000q5-47
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Sep 2017 10:00:28 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8FH0CsL007972; Fri, 15 Sep 2017 10:00:12 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dstyO-0000SP-EN; Fri, 15 Sep 2017 10:00:12 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Sep 2017 09:56:29 -0700
Message-ID: <20170915165629.10005-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23330.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(9786002)(189998001)(478600001)(2906002)(50226002)(106466001)(16586007)(50466002)(48376002)(63266004)(1076002)(356003)(305945005)(5003940100001)(316002)(2351001)(47776003)(6916009)(50986999)(107886003)(6666003)(8936002)(77096006)(36756003)(110136004)(230783001)(4326008)(33646002)(36386004)(8676002)(5660300001)(81156014)(81166006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1925;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT012;
	1:r02+b12+XKtF4htgFMWgFSnQ9rTpW6Ao3L4OQu/qQS30hEiqP7X3Tb10IQQG9aB26ri0eRERcEa3IKH5n3oT5e3PZ4k5SmyZgy+Ne58QMwVWeo6OFkP/KPm9UGnpuFAS
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b26b729-ac23-4c5e-eb49-08d4fc5b44dc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0201MB1925; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1925;
	3:EgkK3FZimswJkPcRqPoSorg+cYw6R3O1+3ssDczOy92ysRPwsF9nfLIb88CileV3eay9Ekb0zmGLfBITqnwXkKJNmqLYYKGm4totIi3glIavX3HyrXja0RObbT1qrXR5Lnh7CuFmO3gGQTb51CkkjSHfCkUEUfVirRLAYVfG+N5WIPj65PvvMFChIlelgM5HKT6uZQtPGmjB/vokL+M7NmQsiYQHTYxc/3ogcnr6lhxGt5/oy/bjrrZX40yWY2Gn6qy75ZYkLj/x+sfsW0HikzTciHq4sxyHYNI1/zD+jdYnCZS6ePicj6oYRM4z+Lig3wGHlPMnQVRgWDgb0qyaiER/veO+YVmCAC+igAcIvYo=;
	25:cVQZBWsP5Gq2kZKsQgmUV5gbnHU+GaJDCXubI2ACByvkgLH8Yk3/H/03QZ4hDQHcgzAGlgWbJathMnK00Jsw07CvWwzfgTw3I0rXZ1wEAhuXkQVXpEoFgwxYwi/hy406Ms1T1/bExwzFpqiEX8RvDqs+/us5t6nxow6sl+9XMxMTc9StTsfgVUwvpgwMlXcPIEosJ3YLhWTGhLY5ROVSlJA1j84Zp58OvRRnKzzs4+TIRII6flJXdfk6SXMcyaeYv3s5i+tZqFH2N2jaOIO+jDPW49PNLl/C8YZiRA8KowoQrkin585LzPFme1nPjRt6wSuuNKziapoo/v31VKZcQw==
X-MS-TrafficTypeDiagnostic: BY2PR0201MB1925:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1925;
	31:FdveKep7UDiqn2KMsMzN0mQ9WbnneEftHuoE8RTlv4i7ktErcnNwxznAvNV31hQRsvFhI+ffsH51Uaf+5m83FN3qeh63UmurQxLF0R1cs1RR0SlldL6b8oduM1g3XeSRke9h94cCYKhq5ErT+DgA+2WuEcBHYFVA50STTjGS5kMnhPpz8DlghkQrkCQ78hRHC7rrsYhZoUtWdGLHzeqUO2Z0mNw3PRucZLCwTP0OTPA=;
	20:AI9YqXU/qt43MzCCCVj6FmydQIzzraRnqqo1LzGbtvFunOGUx0237EiWRhAwywei1aF02/noOEw2CG02PKhmz8Wu/r5MrfPEsCp1+LNbH/ba1M33Q+gAPadGDbOvZjPSSnpks+sssQdCPrB6aKj4WvlRj/YFPWC+kZecUSMsFYFruq5XiWjWTmo0mvd7APx4Nf0ZcaXuzgUFiaF8yTCb+1HKH/39cpfzIi+MQc1nU531iS2t9ZXr6ZCDzAMIrUXjpFFavwRmjfnXw+7MMmouhFgR+TtlDZqZYrWfQ/qKx2+BjlwPCRppaQHtAIiyYt9bbBqEtyIu+6APmMxzViUuOVzl3xJRyR4YEc0cIhe2Zjgjz24C9x4nXyv7XJrxDecCq74r7ELE7qG+nKaZMdIBv/ywxWpqO5SQlHJPaQ3AhXqRCqqIo0g+HSGFodaYQRxLb26eU9HZHKCD7e5RGadTAyXbQlkcMg1sL2PcT3HkQzxvSejPv1uU59dvOgjRc/yL
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BY2PR0201MB19258E7AD25F4BDE7083FBB7DC6C0@BY2PR0201MB1925.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0201MB1925; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0201MB1925; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1925;
	4:0lMwMvSX+MOCi/RZgVsxs6oyIO5FcDnWw9vWl03uhCLIw6ASLs1eWN21jOglRccGqubBqH4NYTRPClZbRc+prVqrOzC6NKWRbWuD8kPaW7rGbKOJI9uW8PUa+fbSOrew3bhhonSJH95YVf6T7S/EPsOXanOpeAjCUTleKaRdRV2PxeNL8Lg4HCbhXewUezQtAoxr5YhKgycT3+mBvHy2ZE63Er3phtIzdQKCWwn9QhpexDdkLl40vc1gGcPBocLrzRJFF3GXXm2GzFUywMQbsbFkqxtRdnSsR1hM8Rum6/I=
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB1925;
	23:v5Pit+j7DvDpYSUFihAOFLmid0MwcFWNWcYUSTj?=
	=?us-ascii?Q?ebhPa/l4FtMqZEUsNtf4d94EYs2ojto1xLk/HqqpNRWfslOI6QE/y4sRxcHk?=
	=?us-ascii?Q?Wok7N4+a1gqOlmfRvoCzRMaODxVIFo42P1iT90PzL1s9TBOBRKcxo7G6gSo4?=
	=?us-ascii?Q?mLzRDRzHv8ONigpU9iuykWDlzCis+vPVUY8+hQ23JEFN8l+l+Wl7tEme/zA3?=
	=?us-ascii?Q?j0tcgiRHncJrbTeC93HR0YET8f+EOgnGgQDlJujpMQVOFn2pKv6sj1Khn2ic?=
	=?us-ascii?Q?1bYAV9WGI8ioxEqGWIKkjLnKhDA+U7ThuvklI3kFZr4U30bQgdrHehsEb01f?=
	=?us-ascii?Q?YISu2yMe9oyPvlU8l346FOuh3R2BRg1lDG+XP6THu9col6dh/z0NhJ5Y09kT?=
	=?us-ascii?Q?iOXecQN5Hk7YTy4PZyS5lRu3cUd5FY8xdpVuwxEyqay5BQrsFup4PxwKbJIy?=
	=?us-ascii?Q?nDM56+k4Ox1tR+O2junRMmPc6hHjvLOw0M3hRA6CscNfwEmL2Dqo6lsE+dZM?=
	=?us-ascii?Q?diHcdUBdihQfUQ4/umIAyAlL8WxyVxsG4CqbS3mov50Cgu2e5cZynzVlsqbO?=
	=?us-ascii?Q?bJ4FPfgZ2V4kyp760a7/5R4hG59GCloqnP+h8vsLLzLE48pYidfSF1Sy8lHo?=
	=?us-ascii?Q?JfCugcRKj1uhkD8hpWZ1/wa4B8Rj/AukAjxHV645s1jkR0dA9AdbmU9FaXOO?=
	=?us-ascii?Q?Ua4JjfzK3b+x5icupuxzDatZxRxtjTUFLn+L1ZWW7Tidd8cDqE8HTe/Mjavw?=
	=?us-ascii?Q?5rWFKfwtPg00bh4zR3pn9Mg6gOGRPBHFiiR9y5WQ9TxvjfSMwfiru8eLkgNd?=
	=?us-ascii?Q?uTYhsD2yv/Yzr3P3qxJGncIqsavOiTkNrcqpIVcemylNjwhMrPpVYE4i9g35?=
	=?us-ascii?Q?RMIP03pXM+L0KC8x67NtlZFTAA1f79vrxuJptxHWnj3UbAXE6TCOVPYL+PBK?=
	=?us-ascii?Q?+dHRsTXk3CYT4cmaKDG9zhtNa2ja3dNWLhlcufrbmxzrTsxeMAmTDlNeo8pP?=
	=?us-ascii?Q?bWg2taFZIVYihybxfZMoIatdh?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1925;
	6:qJ919Ye5YhJ4zxW36RAqR7kTIUh7D76AnlUn3DjblQPNYQqshW2pbUAMY6ffDqs6Ot0q15f+vZA21tPHn8d288py1GhNCY06r1k/tEfAw/os+1qdcbTRBOhLn5AiDuFkz3RHqFhKAkO9nbS/p4E9ftt19cuNUs5/YkPcoI7X1v06/02kqZf6m+5rVxv+3NWwmaD+WEtoiKl7TWTbPLDnH7zRwmSL08z/xaXriX16LJRMB4JKYKTOrxNSzdJAluRNRXKMtqc80l2n+uesoidH7DN7KULsKzVfC2qPKebYy80CaIzI8zbLbaZSgMG8XfAJj/cCetBblsEGJ+2lplNU0A==;
	5:SYho2M0sJW9oZaeHJjU+u/MgkzA7m2qZn0rtVplABg14LwAGXg2D34seYE/u91/eRyYzKh6Nk0hRjMeP7YJIubBH1OpB3sCo8gI+lTrnt09/V+2W74Sr4tM5NcqDOltkFz72zi+137VKzlOd7wmyhQ==;
	24:em+ljcupY7l/CTbk1ZxqcHcOv8hPlcKlJDaS0HSKGw3GqKL7nITyFkn1NmuzWIkJLmsi+5EZ3ADkQTiBAif318I3uG8hGcM1Sz+QeQXPkT0=;
	7:1j0LaGJ118elS8j4qAd6KSVU/pA+3YlxDOeWp9b4Bde6NhVovXC1w68RCpXlgSuFlSFt7dgh9mKEOGovN5IJnuW8s7ezp9/kF/AR7QUKZtWxckrL4sdXR9yq03lyh+rUOMqmH6dfBSyg2zFGIBjyRb0kagPwnfaL+eCtlHqhZgnZ35krDsBdZZAkPYv95GwDD1VI7bCTvHnyRiWmNa5ymqNkLXvE8847Y8da0c6ADyg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2017 17:00:29.2072 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1925
Subject: [PATCH] devtools: qemu: Remove obsolete '--with-system-pixman' option
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
X-List-Received-Date: Fri, 15 Sep 2017 19:35:15 -0000
Content-Type: text/plain

QEMU version 2.11 will remove the pixman submodule. This means users are
always required to supply pixman from the system if building softmmu
support in QEMU.

Without specifying a pixman configure option QEMU will default to using
the system pixman if it is avaliable. In which case let's remove the
config option as it is no longer supported in recent commits and is not
required in older builds as the configure system defaults are already
using system pixman.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0e1411af64..2a1d14b31b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,7 +26,6 @@ EXTRA_OECONF = " \
     --disable-strip \
     --disable-werror \
     --target-list=${@get_qemu_target_list(d)} \
-    --with-system-pixman \
     --extra-cflags='${CFLAGS}' \
     "
 EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2.7"
-- 
2.11.0


