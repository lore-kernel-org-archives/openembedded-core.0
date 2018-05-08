Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0075.outbound.protection.outlook.com [104.47.34.75])
	by mail.openembedded.org (Postfix) with ESMTP id 772A174B83
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=C8eaAGh1sHRs1p9jDXahoIABI8X8zFRQsM1uuZO82GE=;
	b=SaoMpRnzGzZwKgjr/LEcdfGnoR8h71Nuj2QUVStBaOs7+7OmJAXVBZk7xT6pkGAFDbyJdPesJkGQ0h09HiWEq3qrXoOoE3r8HoR5AbF6sJKn3HzV51fAUfeIb7QScTFcPmqJvxozJJKxF4ktQMlvvnh++Z3FerrSWqwSEak5E6s=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3422.prod.exchangelabs.com (2603:10b6:805:3::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 18:49:16 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2018 11:49:01 -0700
Message-Id: <20180508184903.13506-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
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
	3:wNEsBF8pFNCilzX3n4ZPQAhe7JQevLSPYm/i8sXE9kUGQib61cZsBVBm7AhOLqV5sysAT29vfHGm1pVYCXqDv9U4S0lxxPT8HqaGLjdvVcZ1j3KY0BpQY5UMyS6PXxbT8XlI+x+8p0OvHEA6Q9w6eRS0PMaZOYOmdNPZlu1NRB9iA/fLDXOanv+1otCgQp50+qEWWCnhMAyjdKmCA1T4rLuN91392MgG2k418unKLhtJIwYBs3Lkks4l/9S+IlCP;
	25:6+Ak8TPC/oozlo7qjZIOtSNRHf7RJpXICXoLSbgxfEGPnaIm/+E0SEf1JWzS1PdzpyTCZ24CE+obLdhseVWXkP9zDrQ4TKm32cvXKQMMf9U7rvd+MicY4sSXe8eLV3ULWLeUh14IJCQLXwwtmdqNR+3mBuJLTffX9D/xighIHNkJpI8GtKrlg3Iaz/zfB9PjfXVl/6wWh8DfIxfCpsLa5Oxtjg897ejlcz1VPUq8YURfUBuMSxboNeEBCDhwFpCNtndZJr81novV9RMb48dPraLR0M+DWziZmKqfC5hx0ZIkW4OpqaCl2RMLL3xPEJCqyViTWtMs1AiPoK41a2CPHg==;
	31:NApFr4MK/sEgOROsCN3dYJmC/KpSxfM9V1JXUxMMeTtuWMhSDxs3NnJufReyRWwiZppxxP9c0AV3RFTGlhub7Tn83nJLOp4QioehAY3OUgwFEfd2/9tgbJ+jiwsVbM87MUo8H11kji8fm86qqwTzIm/DLauXN8b70Rnk3WT7rnl2T2okGDv/irtFm7AT/dG8bFd5CpLPXqfEoXFktT7mtb18wPe2V96BlSq08ZDxp3Q=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3422:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	20:u0pSxK7vKno7wQqm3nUhkD5h5rfXyQT8By+VL3xhGc8wM9WDgZSp+vj51TIY98IhHrAhRy9F8uwvOLyh8+2NemNF+6lz27VcpHERB2t3ZFTtGtNteYFRiHulgJk5MkawMU/h3rFbayr8xR2P5A9S0c+qhv6x9U3koXo07ELOOoF9oQ2cPXtEkmRy1O2CqbFE9Q50VyQoqacvc4Y7kOrMcu6TgVLf93gh8bXpAVmA0EKmxmn2aAd7Sacijs0cosutnJBkyl7OY8Gl7U8BFKZREWK/AAAWLM7MzgMkdHCGgVF3N0hjIVpADcizWPhiX/UJ+O8GdShg4XY5okJaaODr6uOu7F/jei3ZRCvNPdn30ruB0VmHROP3DmPvOajliq54Us3Yzw4CEbP5Cm93+h4E7bww7TbtshuOnhV0vr6GPa+IxIl533xGVDScC3+MDXbS8MqRrnFqc2A6+O3Gi+jYsoSYUo8QO3NtXA0xI187x4nPLFflBfHH/sx9yWIyQOUe;
	4:Ju58Sl9VMOKU6yLgMIloEH3zSuuqY6jQtafoGuoR2Z1hmCAPMu6tV2PVDuFULzqDdVByKyO0+aIHZEEy6lyq8ns9NggkzfBjRqPmYBUDibWcqkj6sO9G6w0kX0Dxuc/qNCFPvrgzqRP9Sh1RySdy8+R0fjhS5g667w7XzzgfqlGf90AiBM4RbCxLk03DDrAhORkkWD8PIcFTAQCKOjzxJVIIuyzlGeyvMtnXXJTljZjyK55kW4oRyRCROxNAjDXY7R4/71BzUL1i4ZF5NqFW7g==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB342210BAD871042DAE8FCD06AB9A0@SN6PR0102MB3422.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3422; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3422; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(979002)(39380400002)(346002)(39840400004)(366004)(396003)(376002)(189003)(199004)(8676002)(54906003)(97736004)(3846002)(81166006)(16586007)(39060400002)(486006)(4326008)(53936002)(316002)(5660300001)(81156014)(6116002)(2351001)(2361001)(8936002)(1076002)(50226002)(16526019)(26005)(107886003)(2906002)(7736002)(305945005)(956004)(386003)(52116002)(86362001)(7696005)(50466002)(51416003)(25786009)(47776003)(105586002)(186003)(66066001)(106356001)(6486002)(1857600001)(6916009)(478600001)(575784001)(68736007)(6666003)(48376002)(2616005)(6306002)(36756003)(476003)(59450400001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3422;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3422;
	23:6oZnGkpoGXa7lKm/JlqZrGdjmQEtsQYz18zXWdA?=
	=?us-ascii?Q?u9IhdXfZY7gsM3TrLJ5NwSlzVfQMOuDwZ28rlXToVZRU4SSr/BdGoZPmqcDs?=
	=?us-ascii?Q?fg9ROXEAoZ4CXF6Ap5o4tsu9z9LOZ9w7I+2GHEEo2eF4Y00t0mX6iLnNn0x6?=
	=?us-ascii?Q?uf3IijO3gRrkT9dPGLqwi2PxdmHw7d3xVhvVLto/VFYAWBOM4xDFN8s/rqFh?=
	=?us-ascii?Q?iTNLoz4r9jUwubYFYjzOxsdM9eW74PsFqoyGuSgN5YEceYcvo6etICpeVewA?=
	=?us-ascii?Q?wXjrWGwvHkSAdeJ31OPqrzaQc5qUi2OrJlC45YUEUDQiMUgVhPPZOGhyQIMs?=
	=?us-ascii?Q?Vp6jUzz9X4gvoNcuOor0QvyFTZ6h2PwYG7oZui082qPchZoe1RCQokjTrAG3?=
	=?us-ascii?Q?pAQAWzTZBDEI7MwrvG9nL3Ii+tmPMkmCgLhDhAOXpLehRtm50a8exe3uuQFa?=
	=?us-ascii?Q?OmFeIyNrmOeTzymapeQRuouQNXVrBaqbvfIBIZPfQmi7ShxhCXB8Rq/VK/Pi?=
	=?us-ascii?Q?IBKVQUbAMPicrc4ObAjTfJIKDEUoPif1TTofBtlHMjyd1NNfyV5a2GFlh2ON?=
	=?us-ascii?Q?Q+xFhsSTQ0ytEsiNGP620FpgD80ucpONXLYp0ss5VBGNw7IjOb4XNQc+UpHT?=
	=?us-ascii?Q?ihxxrbopb00rM2kGm0trTp5yxKakV2UbxfNwe8nGtEh/IqxV6PIdh1i0Ym90?=
	=?us-ascii?Q?kfXiE7Q5o8eGICsqQkSeCU+wSYkNtTh3uTwJ8QwITJtyaJmVwsulKrOmlZrT?=
	=?us-ascii?Q?B+GTqs+Z3YW0usNom0TT4uiBoLayTPVMy1WFRSTLPx5uoNFUdtBjAFYq0I9W?=
	=?us-ascii?Q?hD851mxCwMPyqhgq4JqMqnLawEkB5yIcaPdr9OLuFtraWaSGbOnu1lVFHwz0?=
	=?us-ascii?Q?uQnI6IHaikPwzXg6/rAJm4LPqwAI0RrMWiv0JK42LlJQW4T+FPj6j579o1XY?=
	=?us-ascii?Q?1I2XL/MvU5V/c84vj+s8wacScROSK64bqwCDVJ4FZudcSrQWRBoZ2R5RmAVJ?=
	=?us-ascii?Q?a8Ng6QNE92p8BUVpuPfpkDNllAlLoyFzn0rdGkzBcT9mBnxMC7y1k/1TJA8s?=
	=?us-ascii?Q?6Ivwj2LPL1GUh9KwpDWXWB1F8WfIpUWCqYpioXplkWgaqj4+TMTx+Svgf8Z3?=
	=?us-ascii?Q?Of/sOR1u4NpapuJUpq062t2AeB0HZ0+fnJ0TgnKLb+9535N2RQPbDf3y8JGc?=
	=?us-ascii?Q?D/UAWM+GUpnEttInual+kk/Mcz7iMjPO4O6yh0R+QcWGOcpSHXHm+6vD7tMm?=
	=?us-ascii?Q?NXjSXw+Ctc1EP1Fa5/bCW9bhom+8YOr+x8I15cQ3LkQCMckiAsbLWJtLI2tv?=
	=?us-ascii?Q?jgcA3JYE5NfwmIoGxjDkwuxxIQLW+lgf3tCXx8S8UgJUIn0RCmuI2Qj79HIQ?=
	=?us-ascii?Q?JqyOAZ4YgoQAEJ6JTJFZsmwQb/HlqgfKoFodOjH6q03WKI9SPAWueWiloZMZ?=
	=?us-ascii?Q?PMUu1z7yDVA=3D=3D?=
X-Microsoft-Antispam-Message-Info: gSS+45aAHOLaPqvtx83WDiNGuCLFrRzWGfXHDZ6S9k1eVCse6skBbRJvxtt49ZPYt2LeTLQg2rXN5a7Tm7/bQFgwiR834YxhuFmquGOQlNsMZved0IPZsWpTwDOvoTglfVFQFNKAUirbUHBVWHPjQRsOy8zzwvlLpfj7jhO+xNO7JgRj74zPvQbtuuLFU3Kv
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	6:kHb3pTq2HPA76z2d/Q3VQVwaQhboYkYtervJWj6nTPA0ekhRmfvxDIUCY68IP0dZPvkcEBl0rNMV9vQX+KdcTJ23o15oMUXmtlGPwz/OHznXQAZCU1hIhM5c6ygT3+TE9g7rJs82f8RRX97CRAfIlxqIXDQCFOH9Cb09zG5PqyKYT+eiqFEjUwJWz9DmcU5HyNsfW48lCMLQpRqE8DU4J4XG9bxwTfCUdP58LyfqG11TdBFo/tjckeQ1dFmQdFHLlT1tHgsxQ9mf5JvwtLfv4t3IJ1+cvKqRIt6/9zu867Z2JIsOHdbtm27U/6W/zjQfb5XAeo9wWkSeTSWD5QB2vKUUPmF6/FPPwUXkDEngzED9PRNh7Sg2vS6tBUlQPdGHKvtDAx2RW/5lzfsfyDo/8bIvyo4HtBEHXvAqC6WllvBavpEjp9OAd2dpgyTSLTEFZ0+Q7cRTmBhGcvSddqKXVA==;
	5:u20NHjDxy1yirWVPDr3RT6CsuwbK4kiutWsA1tCXt6gT+qH8LSD2YpHZZ1LnNKkkU/1hakzFcW1v+n7PktVCGQIVU7oJG+hjarsmAHONTBT10WUce2pjpny9pYCBcPMCCIC486oPKhYhdkzxbP3Y025OlVcK1uv+cJclaWYvKAk=;
	24:sIK4jCernTebzUCjzwkDKig8+rm8XpgKtybf24MLvFC/MUCjYYTmyXhXAN6zD4IVgVDxzALKd6hl07CNaEMy15LC1mKuxLw3ci6332UR+SI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	7:q9Lkapq0L5mVnc4MVB99Vzxw9MS1OmC07G270Oul/yvmYktJipZv/saV03bSdK+ThWi5v4j2AEzU8ziu1MXrFOd4+MIwJ6maKQs5MFxTpRumPH0tu33VbBLgzkMls9vBVB5CQx3bCOHY7rx/ZDOPivs6rlHZ8DlRWWz13tdsuEsKv0vJEw4LNklOzbHXqWxZUGxrqNu0b2JZkIZE9VgZmv8TsKq7YyL7p0rSXbZeRIazH6u5ttHRi03UZ9SZYL1R
X-MS-Office365-Filtering-Correlation-Id: e1f6f2d6-a5ff-48c7-0ae6-08d5b5146667
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 18:49:16.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6f2d6-a5ff-48c7-0ae6-08d5b5146667
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3422
Subject: [meta-oe][PATCH 1/3] libmbim: upgrade to 1.16
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
X-List-Received-Date: Tue, 08 May 2018 19:22:44 -0000
Content-Type: text/plain

This is needed for the next version of modemmanager.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
A similar patch was also sent by Khem Raj; that patch is just as good, but I
wanted to send this in the same series because the modemmanager upgrade requires
a libmbim upgrade.

 .../libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
index f89ef9d57..5260c0f14 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
-SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
+SRC_URI[md5sum] = "76ea4d8381989919b1d9b91c818fed80"
+SRC_URI[sha256sum] = "c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2"
-- 
2.11.0


