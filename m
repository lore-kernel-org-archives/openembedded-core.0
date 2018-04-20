Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 28856 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Apr 2018 22:43:31 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0046.outbound.protection.outlook.com [104.47.2.46])
	by mail.openembedded.org (Postfix) with ESMTP id 53AE271BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=T9Lbx8PfDK2U40RKI0PBjZcuGBelDm/aJb6VUtgSKT0=;
	b=fp/JHixgFcwkR8+lOBBaZ20oY/a4ZmnS862VtfxDwnU2opqlfGfB4ReKIwtiolFJcPtxMtarj9AN0B4VAfCza3LSnUZb3fS/Ipe4QrnkMsvnB4EsoEWYHBbE6sj/VjvsX0qbbDTaw9qLn8RHDl7n9n020EJg7oZ8JuiSBlf7jpg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from ThinkStation.vaisala.com (193.143.230.131) by
	VI1PR0601MB2544.eurprd06.prod.outlook.com (2603:10a6:800:81::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.696.13;
	Fri, 20 Apr 2018 14:10:12 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 17:09:28 +0300
Message-Id: <20180420140930.8149-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
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
	3:2l2UexHO08ebKATpm5pG9AFBdllDREFodcBAE2ceeyRy+W+xiwr0ElpGdL7V1mIk30RsVKRWYWgi+ziIZJZLcd7NSGNyb9uiQ/TM9Onggd5IKgINdjIWTDK8rfNMP+6Ktbp9+9tWF1JV8RMl16oHPALs3CqAhePn/4V1kPgbci7zesvVorhioaQ80a4K7UCMqk5TX7flJ7sUVNCbMzBuzV0SsesXMKI942FAI+QgJ2/PXQn0DsunyKsjZJOu6BfC;
	25:CMmYM/I+e38UFG4DyJU5ifvQ8gj38jHKeIXSCRrAGDL2T6j57ii7QVfpGq072KHb7R3iaPss8b/UbAWLDRmBONtIYLVQV7KGkgMuITPnEJqxW8p1FneBxrGMDBSYsGLps9XzUla9mhANKANGAIDI+ybZKZZlxEjkxcJBqhMnEXq2DycBGrhPskkMwTITtWVn1cRVEmkCsYUl2i/W95UKy3WCkHMsakIioGJHEkPQqdv7XxLH81BlQ60Gz/HWf/XOI9lx15cvM018q9OHzcZZfNGse/iE1+6fkiONQ49eL4SyfuePMs990kumDrlJNdTKURMXmoR+cmQgN1f3W0Rp2A==;
	31:YkBpVFHLB4MTPghReD9Qs1EIzzGgE8cg4N607HH3D+YdCKasOgX0KpYMjUey6bNbI9smcl3noPcuRDKhcfSbTFdVvmjjHq0fjxtgcZDTMpqW1zc8KFo+T7IRCh7ypsi3bQm88a+b9i+bddyRLtdMd8UVtqGodHbXQtY0YwTWOFY7DlQTJtJzz10/b5uwduhdp9cSD+zq2OSb0B9NOjZnE9uGXsqPkji50seOaHyp9qw=
X-MS-TrafficTypeDiagnostic: VI1PR0601MB2544:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	20:u+hSyGN4ygD0ecBcm9jjQ6HjPVZex03/n/OKKN9YUJ+Xr+MsESlUD/z57YOsfvYVZC9SzkYl8ZaYhT0psd6n45A15ap3NeIVPfuxaA9H9Ykpouke3Zm+hPm2TGaB18fMxZpnx2SMw4Q6etTvgFNgt6+3GJ2qGUMHmT5o599fyGQ=;
	4:uFJssFYq/HXDGP1pQd94/5NZMmfDSOI9mU93ZxpNoD7jPfJc7KZmAjPcUvQbAub5qZ5x8f1kgtpxqqx8iS68zdOBpK7wvET2YsbM4mnjycJPZWTFv6doPi6nzzFeQ79enRfMrvbCONjpq5QhoN5y5wuHid4nIiJj12kqZf/xAbEYSlMG4f4Z3sDvUO0zuXu3SUpX3SNuN49quO2/Ih/xDKvJtntBVkAcmEa8DagsMX/8DMkGuQvokmcEXPgONP8DgdwRWsvnJzVSCddl/hvHEQ==
X-Microsoft-Antispam-PRVS: <VI1PR0601MB254409784F60F795CEA3AD2B81B40@VI1PR0601MB2544.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231232)(944501395)(52105095)(93006095)(93001095)(10201501046)(3002001)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:VI1PR0601MB2544; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2544; 
X-Forefront-PRVS: 0648FCFFA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(376002)(39380400002)(346002)(396003)(366004)(8676002)(50466002)(81166006)(86362001)(50226002)(52116002)(25786009)(386003)(48376002)(36756003)(7696005)(51416003)(6666003)(6916009)(107886003)(6486002)(59450400001)(478600001)(476003)(2351001)(956004)(16586007)(1076002)(6116002)(44832011)(53416004)(2361001)(305945005)(2616005)(4326008)(2906002)(316002)(186003)(66066001)(8936002)(5660300001)(3846002)(53936002)(7736002)(15650500001)(26005)(16526019)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0601MB2544;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; LANG:en; MLV:nov;
	PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0601MB2544;
	23:d0V87qbLXdrtUHea4dPlRf2SJKikSEQz2vgLfBt?=
	=?us-ascii?Q?OMfdjTHm2Dw6AFz6mk0im2ec/yXrh03zzjaAjBfPseFkplDELVMAiheXJQos?=
	=?us-ascii?Q?+GBBVHiXyZJp1nTjqgChuT5FhtDG1uSvTvlwURwmEb88zY8k7+aQPVqz4sTq?=
	=?us-ascii?Q?vBe9yBbi+HPX2QItcwA4mrocfuZRPT+f7HbbN/s8NjZ6LfdfoUNEb1xIUbEv?=
	=?us-ascii?Q?h4T+bZS3E14fUQQkzv0qAqOpmRpD0ZyeNP9fEAYOVCIFiIvUGEpYOalF76PG?=
	=?us-ascii?Q?IJEQcQjHqs3inMK35d3SbjvKLlphGoRxiJiG4cNnsdWb/S7F57OgYHwpkYYu?=
	=?us-ascii?Q?ZthlXBuvFvVhBFjaDz/4gNAn0Dw8JTpFU/LpbOfwD9Q6qa9WTljlTHehg3lB?=
	=?us-ascii?Q?DanRYrq5lvdmnEOA2pTzgEWuNgdBlOZaVpXH/tbF2Z2hcBtkeO/DRGsVqfqC?=
	=?us-ascii?Q?ZP0//09zHzC53bpMVu0tVTCCV1mdUdcIiEmVQTF22hycZfS4UI5au7OLOD31?=
	=?us-ascii?Q?3BAjVY/VQgC57APBeN5J4FQfpclI2pebShCxm7P4AETl0zZRQBedSc498VuU?=
	=?us-ascii?Q?9GwUEjpCGNvOg9hSPsrpbtsyIZZbWiqnqIsvnPpgjlp1r9qvUFxIhWEOIMpz?=
	=?us-ascii?Q?6Gdec4K1nob8KyyA8MFvbx5smC9czkXcv12JpQSE3tvDsuqZZk3vQClkfq5r?=
	=?us-ascii?Q?j8oYFf04eO4kUeYB/prblxsM/DfqBqQKj4UUyt348UU0Tw4SGj7vDGYzk5UM?=
	=?us-ascii?Q?FpubIZYiOhHHMhfCxcfg+ciJv5p0umUjRQMrUkc61B6Llo1MjYjNMCNTjtzg?=
	=?us-ascii?Q?s7aJf9BcjjUkjxJbjAItoJH7/CrYUSIa2lAV4mZH525GF1svG/tqMmZlrZqF?=
	=?us-ascii?Q?lM8ZKBcdbPuu4veH/NtApbO2thKxymhNym2fnwy9HZz0v13xo2AnoXdPLVSR?=
	=?us-ascii?Q?CBBspmQsWLSByzWhcJzckG9lrYiYs9yCeVhhxvAZJOE90NgUmGGiOKlxefJf?=
	=?us-ascii?Q?YPCm1Z/dgyXyqhuETctBr9IVLs3SJt7lEUR0st3GkqQj6cod0RCiq+UaG+H8?=
	=?us-ascii?Q?ssLUd1S59mQW9lrf4/urZksCthfXj7Q0dCZcOcgXTWMKstywQu68XB66jc6/?=
	=?us-ascii?Q?7c5fg7rLLrVI=3D?=
X-Microsoft-Antispam-Message-Info: wCke1LrCsyY2r1EfSEhhGgVapb+VQc5dA4oNdXpD3AT73/j5QLcMDKo9xV94quiHqfcQcGM7UzfUvIinaaSTFeOhjhPzq5gQQWyx+YeGLzumUg/gP8k2yItxvWduhKgOBVEEa/SCt81ZJfLuTCJUh7bC/btEff0CtCjjO7kCgbADsb4DaNkqfOUVhxI1rnhv
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	6:dTIIwwVne7F+NUu8jcZREJyRUsSQQ9CEGGEgmy7aWTeKyMyeFmiNn1RdoVwmUjPJVZv6meRNL5m+BiQgH+AEWC5cX4B8hq0ruCXdlpokx+FBuOEWddRe/1sUl+KAzVETvxG7y5p/za1a94+n3aZcWsxoZ55zV5wlHHe/lh3fo7LAB6+H3BRaBVUhxa5q98oBDtjMHbYpin9NzXC2pOFHP2+qpE0OqnQCIMlsP1LS6GeAKgQCuwpSIhlTp3Mm4ILw5vGXIvWdHL83pI1FuiTszaqxzYuYUvO39UKSkBJGp+jM2BliemrkfyLQrwdPEirkuA53NroMX83skN6EErLufh5AGiFtgLirtre/gz9uscvPMHnlCXyCF0OnukTvj19UWusqdJvLBc4dfCQSMcaCch+/RjVmE6Wj9YerxeJLk4dmdjtIzRI72n2DA2A4jtkGi7G2BCCUkWEQx13NhXok6Q==;
	5:08U08iBnOOVFDqnVgfQyN+/TI0J7z90IBOG+/wlOkUwkFQzZ9IZHT95kdnYgm+sYNX+kwoiMBnNlON1e+GAOkqUe+apo8ImDnUkQMqzBYf+TfJD+CPTrvqcx5Ud8qoipPxRLF9K60AtYxGfQ8BbU6sOB5uIbatyK2+eUgWcV4FI=;
	24:UQOLXL+NuI0bhVDlrClRwwjDc/Vw46o0vPGPzx4ktyt2RPI1CLMY+cIJqZb5BG76+ouVrclU4oSMpf8yEeZHa4kpLf/+DhqJtGJ0v5Deazc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2544;
	7:GwXQclrckGgzSCwkJHzsFHsOJm2J8DH3TAoEEZcQqAy9ptghXSd/1hKSK2H1Rqg29WF22qkZyPV6IduEh+OYtER3k3wOtC7JexlhkvrVH7dluszpRJs2mKgTtLQK+N02s5gDzi5FtZUPyfcR6sPgCfKQnZc6ngF8atrQ31F/tcvByq/y5hfz2mjeSU9KNZJngznxMHmvRGyB5ivBJ3ui2gVPLhZxlDEoUwRtMr8rN8962tWVhiIMrqD8g0a5SCH6
X-MS-Office365-Filtering-Correlation-Id: 708756d5-60b3-435d-1258-08d5a6c86ec7
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2018 14:10:12.1878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 708756d5-60b3-435d-1258-08d5a6c86ec7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2544
Subject: [PATCH 1/3] procps: Complement update-alternatives scope
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
X-List-Received-Date: Fri, 20 Apr 2018 22:43:31 -0000
Content-Type: text/plain

Avoid collision of propcs provided w binary with BusyBox-provided
applet in case both are installed to same rootfs, by adding w to
update-alternatives scope via bindir_progs variable

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-extended/procps/procps_3.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index 99e43c5349..ecf215fecf 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -42,7 +42,7 @@ do_install_append () {
 
 CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
 
-bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime"
+bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
 
-- 
2.11.0


