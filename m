Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0051.outbound.protection.outlook.com [104.47.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id 23C20784CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 23:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4E2iDkhS/JJKhiu4q1ZFFQ+Kd+/D49+AKf1qZA4fRy4=;
	b=cqrw4fbxyquzj2r3JUZ3XxGFyZFnU5nnnRk7mSBWY8Zv978ljwBAuX84se6tbnhTnmL4b0x8jwtYCnH5aB4XAIQXsH8LcGeVxtklbQq4kqbVQwrDDMpvoEOLaaHp6V+QKqQfdxF5tS4gfygWN7XYGQsBl8yA3L7Xk/NNd7O+zZk=
Received: from SN4PR0201CA0029.namprd02.prod.outlook.com
	(2603:10b6:803:2e::15) by DM2PR02MB1306.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Mon, 5 Mar 2018 23:58:18 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by SN4PR0201CA0029.outlook.office365.com
	(2603:10b6:803:2e::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Mon, 5 Mar 2018 23:58:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Mon, 5 Mar 2018 23:58:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eszzk-000657-1Z for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2018 15:58:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eszze-0007Ue-TW for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2018 15:58:10 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w25Nw27P004018; Mon, 5 Mar 2018 15:58:03 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eszzW-0007TZ-TH; Mon, 05 Mar 2018 15:58:02 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2018 15:58:02 -0800
Message-ID: <1520294282-10749-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39380400002)(396003)(346002)(39860400002)(2980300002)(438002)(377424004)(199004)(189003)(316002)(356003)(51416003)(5660300001)(8746002)(1857600001)(8936002)(186003)(77096007)(106002)(26005)(59450400001)(50226002)(107886003)(2906002)(47776003)(9786002)(63266004)(81156014)(81166006)(8676002)(6306002)(5890100001)(305945005)(7696005)(36386004)(336012)(6916009)(50466002)(106466001)(48376002)(478600001)(2351001)(36756003)(72206003)(4326008)(966005)(107986001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1306; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT050;
	1:BLenIPifOget1NB/L2VkvgvKCkgpx/3ORiGVy6SeuFuRI+H9XGnFF1NiQ14uUsF9XONc9HAyjRxmlBS6CfuDjkVDF1adurBN1m7CKCQr2hRaf0d/LIj/XqVMCG5camEJ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c58894a-2490-4677-0b6a-08d582f4f730
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603328)(7153060);
	SRVR:DM2PR02MB1306; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1306;
	3:GnQR2ZUhYp6i+ue/82ySoAx+MOBV4g4w0AiWLxsj5n4nMj4k8QGnc217uUKubvCv5TKL9v2UY9obrXW+UHENVwyHWnRuJl4XnsvzZ9cJZ+/VP63cgKrGR0dKyxGx95oTOjuwQUM9evlF1kpq+I3zWX7LY0AsD1NcYqtp3SnZ7A8UtuZom5PBs9Iu1NRTBVHhUhyMs3QsFuoTRZmykKynZKjfD4w+MKtk88CXbaDcQ+iJZrbetatvKP3vCA5fGb/Zu9pdPk37s8kulhBodUtMzj5meRmw7+Vq0RhwcOeJWCJncor2vN7V78y09CYJouAkx4d6pUVgNDyh6hNXA33uvTFdG6xVXZPEwiuz7dboX84=;
	25:pzd64AVj0wFH0eo16u9JIj+hGAH9cG9KEilgPkwfxTNyCRneDEoeCtZdUgLU/hE5RlHbMw1qf2+rgJC6vp4V5ogLm3BUvDg4s6r14jdYgODI59gsZZrffUblqPr2hl9bLw7kC4q8nq9RafJOdQ6EgTqOVi5CrtX6Teg5LX4E9RRp9AGQhcP9Hy2nK23QhrHX+WSxjFUoiUjaiHY18LG5rYQPBBvQUvWs7Om6BOKzugJWAEGkpXWG9YdjYXOtRbeR9NT7cNTcFJlcj/BqLPRtrsTeCO+nDHJrF3GVsNPn1XWYIQLM7NqswS+RMQE+6nz9KvSOuOzadqxSzOK2LBW1MQ==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1306:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1306;
	31:7yUObi/Y4L4nOc+1PovYhD8GgcOvoyYLdQJ65kr6c/Sm0UiN5FqPBE/5Np1FmWYGkPMon+a2iD4oJXMGWrfIqTsyYIGVKFP0G+OnK8SpxwVCsc5hdSyq4A9kouB8Bdm4KZWDeqQO+UMn4sAKEJlvOWi6zMwL2jEnh24lcG5ugzcyyUfNLWiFvbqeyf4ugLx8TM7pUoVs4Du3OA36qqc/VCyzmhgkLVRAGCRR1ZtPYy0=;
	20:RkPCllbgHLs2KQ0ZkL8xHMk011YX4Q8ksh6Wzm0gruU3tW6uBTN8eZCIB4Ntd3qzkfCnok43Jux1wPMXyUdGMRdwxnN2QffbbZN1r8fZjtCb6muZj2lzJkdaqHin7tz7Y8M13masWYdeWqcveOf+a31wJs1H9UHOHqGs4IYqFOnR9v52PzULdH3QJyHtPAeQy6LnqnaUOeFOLcQ+eo/hHajA7HLTHh43y7Wq3YP8QLamHytHNbWCvJzoIscNmcWlDqXGhJwi78OMqGD7kCGA1jThWsuxCq5Fhb4TJv6U/g5jgmNctvWEdZWe7D/E4CJMJSIvZ4lyYw0RYIO8xDUct691XdyxOAEaPHvKUANDdMulbtLQ54B7oSu4uusqK2UT2Obp+PnIpDLVaZjnJ6Tohqs+3KsmlYq7rdRYAF/gRDoK0tNUBpGHeQ2d8yYJMSC+rMslBJ95bpAQh7ohXpHlvF6Kcm1RLExdphEfKMSrkEK3AZrHiha6GVhCEe5PqcNy
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB1306719443EC4FC281250108B9DA0@DM2PR02MB1306.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(83566789882024);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(3002001)(3231220)(944501244)(52105095)(10201501046)(93006095)(93004095)(6055026)(6041288)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:DM2PR02MB1306; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1306; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1306;
	4:wboipbrRfIRtyqxJp0U2je0NbN7va5GFuqhkLbhwtGWoQF6/SqLOWCRBnxbLEq1+oQOcKeNk307HIa/YAMg4bd5xZNHG0IkzRsVEMYNDC5TPbPNsfyOAaomQHr41ItkWenYvAEf0LX8+iq/EgpFuyd8uIVULVZssE7Ltqj4re9y8gKfa1rgf/28Saktd9MgBNqluSHYrc3dw1x2m7zmj7y+5eAWDIl3NJice0yW8/jmULJGM8KJi63l5KrI1bUhn+x79lb2PrUg+w6bmkEUa4Y8nszvx8QjFUz6pToWUhlG97VXfQo69DmsPd6OuXq5uD+ee/VhWgTJRurFwJyMhJDfU0L/Y1HCouhDx/f5SRO4=
X-Forefront-PRVS: 06022AA85F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1306;
	23:ReSBzquKogIDF9WvFR9SJbl1veBfYHEvhE52s/D+i?=
	=?us-ascii?Q?Gj3YOwUz3U3G6obQbnIUVgRnmUgVoyJq/Muj5wJ8qI3uOPZri8hR0uj2zFfi?=
	=?us-ascii?Q?fuklShrh/1MzMh4daeKXmRply3jhYYhJFYZj71g1a2u8W90HjF37l+sUeCMJ?=
	=?us-ascii?Q?gVH30PFWKNaNNfaRnNVWNSr93WdcvAa2mzbrbmV4q5S6E8+FNLLWYag3iudH?=
	=?us-ascii?Q?jJQptPYaEQ7tsHFYMUzPT25TduIK9/q00qrGdEYQfiAttSLnuzqdw/SFuUlJ?=
	=?us-ascii?Q?lnGVlNvb+NzWJ+h5NaDRw4fRNk6x0Rs14ge8NJmf5ysWxTx3u5aFPzf3W7aL?=
	=?us-ascii?Q?yluMVJBhZZATtqbGh99u94Kg0uZ6ZWAEny8hOTH3XLYoNWRKq3K7R/uKeeWj?=
	=?us-ascii?Q?7Qyu08Pag2PyHBEpeUfaekGA9Yx02Ww4ZVN7hQEaR5FsgKi2PrWUcJ/PZV11?=
	=?us-ascii?Q?iACNLF5XCcvxEWaZj/nwiN2MsmLpgBiajDPpOYSTSV9UDTEqn/OkBFk8/IlO?=
	=?us-ascii?Q?H/9rcI1reMGJLpmgG3TqSTD/19wMsNZoONJKBypup8ZHYJ/IaCKqs63WJ1Cd?=
	=?us-ascii?Q?op0E3ror7xEFcda/It6oyuaYv3Yy7wBIdrQn0UXMmUxWEYSkhxYoKLmZp6Jp?=
	=?us-ascii?Q?G+4dq7PdY/eL0JkefN52l64f04B6iga7mqrun0G4N92U9Q5cUB0F9MgjgwDy?=
	=?us-ascii?Q?sh8P0CFzib2SRKgO9hC5kX5ZWxLaCffMW0kL0vlh7HzN7pTBZIOESKZUNT+D?=
	=?us-ascii?Q?UTCpcC0zf1VscjDpmdBLeZqCExRwmnOENWu1wWlaDZwIJvU/0P1YP0aRVyic?=
	=?us-ascii?Q?k8mlLTBpKjLH5Bds9Xm60mmaown0JgHxOnHdD1QqNeFNKSFXeTsX/Z1SbTm/?=
	=?us-ascii?Q?dG6C6DwgPS9f+plyjwpCYGgmtumcdmowp/XW1hFrnNUfNjwUvFoWqfkei89F?=
	=?us-ascii?Q?RVrVBLKpoUT19qGyhgz94Lgp1n18NLTc20dDIY2WOyELfgTUl9Xd5P/RZT+i?=
	=?us-ascii?Q?eoMYha/NSDRHz3maUdEtmL6X+ty+EpEalWt+3h+aIyUba0xLpPZcpyYJ5IjB?=
	=?us-ascii?Q?mxyoKIsxnO1kJaW2dQeCzHEkVz7UI4HWKlqFluNuo3xB/KAdEkb+7qXhUpQx?=
	=?us-ascii?Q?awQtp4lea3rDE20j5bHwZXWusrv5BnX?=
X-Microsoft-Antispam-Message-Info: 65ozPL3S0cJXA7mt1odtJaDF7kIfdYrgqjqykUQU5MQ1t9StIh6b5DyE76TycyNC1OFP0Dv/M3WfH4qwwkKDY8zpS0wbuERFosk6OQmQ6y5tN+ZwRzNE/nXm4a/ivwT2CzLWfFGmYrx+88NeoCivKTtsMAjWgSepRkHCyT51p/7e+Pl+6v54O+6tiMv+CFAs
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1306;
	6:O/DJ8c4DMCOFEeg4cGmZtpyarxZX/Ls5oiGVXjPeoPPWdMcgxMatCr+Ye8yJ87K5MtzcMVIMDaPo8VoK3FV+y5l6gVY/L5R148X5LiSBM/jay/UrzH/j6aMmSa3YL4Yx4KV8G4RScWy0VO8J5j9Xj6Gxam0ZpBrjwD9DwMRXyrZecjo1v1XEb5rf620h+WVA7n8Ua6oIYgLab3KIhnbaotKOhVjcWPcCBgok6ZU+jxWSEsQFwvvV+i+2CfB3NfN0JPfpKAr159PVPwSq2vXMQgd+q8HZHRrMYngeoHR9hW0TIU4BCcYyROKyG8RuVmG7XJ9Cd3v6ekhH1ORgrryeHL/tmOQkI2b0phK8rqL5V/M=;
	5:3v41tzscrdeW18ijvNAU5TNGQZAVS2UZ09UKdFfWMKKVhEqrL/0ZLCcqGFLhb9UxwP0dg1K7fF0Tfxzly0nRQfBKm0WtO4vG8ZAJ8CoW9J1JSp639bu+gdj5nRJwTVYzHIdHBn4HEte/Qf0YkRP6UO0k4zsRsvoKPMuRkePthco=;
	24:z1uS+WgHrSy8PdpMmZsOQpkwIvhoryFzWw7Qr9FhYhFgKtSB4WcatOIihXI4ByhOdO+DO2WGHljPpCBwquCVynFpu/5mRrmpYpE6eovjO54=;
	7:5pThtWs8GAPs0HmIlfAzdZxUbrqPYEk7APUzKbxTr1bCRht38LFN9kAUOlvJ5Df3OWhKYSVEov9Fp0pYX0kFz32pAXNHjYJZB6vYwabzQgEbh/rEaXu20HgkOPFd3qRdkjMDVALyGuwGXRYdcHo09XuEMbB5Hv40/nnb37RWOWdoy2O9DpBptlokVRL3GEkbEEuo7sUK6TyfN48ZwH9N6rud2ksnMO5hYc/ctrIsRXUGwVpK+Sn7YjXFNxIbYyIU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2018 23:58:16.7919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c58894a-2490-4677-0b6a-08d582f4f730
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1306
Subject: [PATCH] valgrind_3.13.0.bb: Mask CPUID support in HWCAP on aarch64
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
X-List-Received-Date: Mon, 05 Mar 2018 23:58:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

valgrind currently does not know anything about the CPUID flag added to
the HWCAP auxv entry in kernel 4.11+

At runtime it will fails like this:

ARM64 front end: branch_etc
disInstr(arm64): unhandled instruction 0xD5380001
disInstr(arm64): 1101'0101 0011'1000 0000'0000 0000'0001 =3D=3D2082=3D=3D
valgrind: Unrecognised instruction at address 0x4014e64.

This patch is a workaround by masking all HWCAP. This patch is dervied
from https://bugzilla.redhat.com/show_bug.cgi?id=3D1464211

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 .../mask-CPUID-support-in-HWCAP-on-aarch64.patch   | 36 ++++++++++++++++++=
++++
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/mask-CPUID-supp=
ort-in-HWCAP-on-aarch64.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-=
HWCAP-on-aarch64.patch b/meta/recipes-devtools/valgrind/valgrind/mask-CPUID=
-support-in-HWCAP-on-aarch64.patch
new file mode 100644
index 0000000..e7b12eb
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-HWCAP-o=
n-aarch64.patch
@@ -0,0 +1,36 @@
+Fix runtime Valgrind failure
+
+This patch is derived from
+https://bugzilla.redhat.com/show_bug.cgi?id=3D1464211
+
+At runtime it will fails like this:
+
+ARM64 front end: branch_etc
+disInstr(arm64): unhandled instruction 0xD5380001
+disInstr(arm64): 1101'0101 0011'1000 0000'0000 0000'0001 =3D=3D2082=3D=3D
+valgrind: Unrecognised instruction at address 0x4014e64.
+
+This patch is a workaround by masking all HWCAP
+
+Upstream-Status: Pending
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+
+Index: valgrind-3.13.0/coregrind/m_initimg/initimg-linux.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+--- valgrind-3.13.0.orig/coregrind/m_initimg/initimg-linux.c   2018-03-04 =
22:22:17.698572675 -0800
++++ valgrind-3.13.0/coregrind/m_initimg/initimg-linux.c        2018-03-04 =
22:23:25.727815624 -0800
+@@ -703,6 +703,12 @@
+                   (and anything above) are not supported by Valgrind. */
+                auxv->u.a_val &=3D VKI_HWCAP_S390_TE - 1;
+             }
++#           elif defined(VGP_arm64_linux)
++            {
++               /* Linux 4.11 started populating this for arm64, but we
++                  currently don't support any. */
++               auxv->u.a_val =3D 0;
++            }
+ #           endif
+             break;
+ #        if defined(VGP_ppc64be_linux) || defined(VGP_ppc64le_linux)
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.13.0.bb
index 25b4126..5bd315a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "ftp://sourceware.org/pub/valgrind/valgrind-$=
{PV}.tar.bz2 \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscal=
l.patch \
            file://link-gz-tests.patch \
            file://ppc-headers.patch \
+           file://mask-CPUID-support-in-HWCAP-on-aarch64.patch \
            "
 SRC_URI[md5sum] =3D "817dd08f1e8a66336b9ff206400a5369"
 SRC_URI[sha256sum] =3D "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef=
2be74790190c3b"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

