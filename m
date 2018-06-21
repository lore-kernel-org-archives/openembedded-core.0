Return-Path: <prvs=703660e7d=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id E01717713C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529616425; x=1561152425;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=FSIPg8QfTNn6aTj50CJwFjq5a8sD03A+THDOGfQQgLg=;
	b=G3hg2QSe8Iv0ucJE+uDGlOuWu8Q/gVn0E9jSrMbGC2mJ39wPaVTPucJn
	pxLrYpEjej5F8xeywnyFkO/skHPImcpy5qj0xrQqioSdfSKFpr0tRdFHa
	tmu7nOmpHaQcYkd2NaSL+LeGqXNDwS8sc9cguAsJMI2G3n0k7YJatlnQc
	rDxNaGur7v4va7iQSWCMTx5wFcpJrNWj39XGfOc0f6jGwCxQGW2CTAClP
	i2UEOzanhx6mOwUJhMxXFjwQcUvmLBOw6rrWBuNqtKg37uXrLhH6bqaLQ
	ieURZy1odEu/9GLIQMBf36Ao2e7qymLJ06SLXlYwfwjRlhtiaIFsxYWaq g==;
X-IronPort-AV: E=Sophos;i="5.51,253,1526313600"; d="scan'208";a="81723088"
Received: from mail-by2nam01lp0184.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.184])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2018 05:27:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D09Rc3eQL1qDsPpW7Vj7BLZbyO5gJDSIYMUBepqkFyU=;
	b=UtESXqsWStsC/2i/3Now/n6yoZpFIpO9PaMiD63K2Qb77y25AHJhkMPhQ/VB7WXPG3dP0TwsRV0PrVEmXSFoJgsOvml0Pttw5LBjkaMNgZNx8IcfB+5Ncp4+BTcOgnM6jJWVP3mh8AIsd45D/CG5S+aG2e5wjDQDow9bhglJKKw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.19; Thu, 21 Jun 2018 21:27:03 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 14:26:47 -0700
Message-Id: <20180621212648.1556-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR04CA0152.namprd04.prod.outlook.com (2603:10b6:104::30)
	To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e33b2af-f8c1-4e7b-4bd5-08d5d7bdbb83
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:T9pAgJWmUYF29cIq02pp5JWluImZPQAjttEHPHEQvPPnT5qDnX7hiuZp6AFp1jcYT2PD2p7rHPTwvEW3p9WKcBUXOWD/1AioA6ooHMlR8KXuYdpQjlWG0ePaOw937N81RlbjvTj+yNkTrVhu0ZrQZY+Q7dSelaYx8WpgaAs+gUOLoeg76CLico7mL9MNTqR/uCbtMCXI3xMZklb+3pvQ9TUwf/w8nwqZ4QEK/uB0dp906M5ohNvEolNrnEphJbni;
	25:ZuUgKqw78NAw37mk1c4Z+MpE92YBkEXIGkQQHOD1Y5kmr7uvSsY3xXiQ+AqizqaYhjBTr4OIGns15K29FowUzzMJvceVCCBwFs2OECr1v6cL5Z3MatulpyeL3/3wvL13np9pJ4kbLnh2H81jtRUBdttGeA1PJ7TD9aRR9BC59jDAGE6cR255/DJgOh3YTYkd3e483Y3CUq+Zyk0gFRJ+HMAf4LEPj/IWnZvMBTx7qW7BayXxEVg6kJRN0ikZ1Hya3472Cb04CSTRVr44UC6s+e1dmmJFkHtztVonE9IezoS6QHzPLPHx1T00mwQXPeUCQt51vgW2CIES1EgXPY3dfg==;
	31:aA5TuzOYWWVxiVPxZkxRVuSdLfyt1BlL4ITUHLQC+mW8q3WPDAmnfS4p4AaL+vt8oss6ZfeyP2IReOEz77RFgr/P9m7s6KpSKZ2lwBAXrjccxiKr3NnppwAj0Ttx94VAXOGCj2dhcCi5CTLp8eiiVhFk1wgYocygRGPRKCpt6XN2mt6YPtqbR9AqNBXEJ9SGW/tbfBhOtlBpOOmrRlvoTGfZocJzOrwOiYTeC7xLyIM=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:QFYdlN6PjlNCo+DghqSxxlg0iXm7iKQwPsvBVdU8DvOL2sul8t3jeTY945HaI6iTlwtJ/jiJR58HE0T21dXmLsSkTM6UccWIrbu65Jk9fGBAgaaH4fwsovx4opQeXgIoNut9BnRW5a5/N+S0XxxVCE+WFi3UpHgC6xq7lL97bUAhe8PX6VoU3/vPnQrW8vk06F90tAIk/BpwZWf/yexxQZJ8xXoQPi7sFJ/ZwF0FB0fjU/pjvjb5e4PhkV1lz8ZlIp5bc3T4u7vUy+3qYMcbGYAmqPNDgu36K7oN975B5VMFayGO3WJ1qPu1R0UEpUcPcQHBP+3zoe8l1IiBHlPa5Z2QDk/nFYREiCmToEgsPJJlySYVKzada+Zxm3txTUUBk45OGufRP1PvFOqLz7rw8DN7i+2ezyh9kAoaSC4DTWKv7zCwEarjBgS6V/C5D1njxRS/TWF58V/3ARS5R0Lz3YwPSFLfhfKlcHju9hKJ4vM0N4603n50GL6Qvtq7/Acj;
	4:W6YiTrNEOE7kOiad71qZ7CTewV/HdLBRtmuhu/S0STqTj2PrhHOcfVknQ6bjwr3Xs50pvu5gilU6G0RQ7nXAohRhz2FCXh1xQqIEBLxWE2QB2Ir3FxhuRp1j0xmlx8bxZyTNGodemyJ0gl6r0l/Ey9wDde0hwLDOfoxb+fQyQmDYfCiPYlLnSfQFMJTbmi3G1utcjC+sa0K9DI2AcP+d3I1VZTPaDZrEWssLH3DsUVXpWaupbJO/78sYPCtkdXo4VLu93wJM+CvuT0zFixUqGQ==
X-Microsoft-Antispam-PRVS: <DM5PR04MB0395D3FF683E1D93EBBAF47490760@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Forefront-PRVS: 07106EF9B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(3846002)(316002)(16586007)(25786009)(97736004)(6116002)(6666003)(106356001)(6916009)(105586002)(16526019)(186003)(1076002)(5660300001)(68736007)(86362001)(26005)(7736002)(50226002)(8936002)(81156014)(81166006)(305945005)(8676002)(50466002)(66066001)(956004)(2906002)(476003)(2616005)(47776003)(36756003)(4326008)(486006)(59450400001)(72206003)(478600001)(39060400002)(44832011)(51416003)(52116002)(6486002)(48376002)(2351001)(6512007)(386003)(53936002)(6506007)(2361001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:HbUUIN6PC37rdOUbwrtCLk3XGTurV0pPogFZ5M6qW?=
	=?us-ascii?Q?ngxwrnqxPVpPwOqLALIdfClpdXnybgFPLZPY3ctw/90QnmKXhdahDGPsYKYQ?=
	=?us-ascii?Q?sg3vTO3ams8iv56UW10YNjkXvsrFOw4mLC9ELO8FOtNw26sl+gxSj0YmT4E6?=
	=?us-ascii?Q?86vCYtu7hcLHwgAJ2dwK7Zch/EC7SGHN73CO94pwlCD9OFDwlGLK50VDtcge?=
	=?us-ascii?Q?bPkSSYJUpi8B9aBBrdCdxpBBtAFxwYesOsFbMVvGx4U9TkRgau5iCiVpRQGz?=
	=?us-ascii?Q?koaeKftlKsHuTWvZjw+j+XKH94VtypZu5zjVXik89PLlCdqmHFr0OvdoEMSf?=
	=?us-ascii?Q?dZ0QC+wUwOY/eu0Yv2NzzLcwfTaxhHq9xFDJe8ASLMCwxLOuWQL1pe1midur?=
	=?us-ascii?Q?fjwSVwWgZNwRRddV+bsAFlkYVVBWJj9qN/6nPpa7zzbpt+vbcoEzEw17YSBT?=
	=?us-ascii?Q?mU7W20PDbejBw7XYI/rLKIbOC4wM+S5ho35ObcydUtUQ7QOrv3vO6ilJPKAR?=
	=?us-ascii?Q?cPL6TXnZ+4ykZkxNoVW5OWLsZ+370Ob+oLmqM/uRbvFeYw+OXCHgtqToGBnX?=
	=?us-ascii?Q?y0DRTxYE0yvllBNnUN2ivb33jhWij81szuVye1RYhfmJJSx1dDonSMLEbbK7?=
	=?us-ascii?Q?rkQeZ5BNpQ7t1Tmj0n3TqR7qC1hnb1/QZuaMnfRmT95MX/MwxNWL9kJhjrgR?=
	=?us-ascii?Q?oEA5iLcofh3xn0CoZruVVE6cl3wkw8na5wpCGVAPgzhB/uig/q7g+6ISTykE?=
	=?us-ascii?Q?A/mNi/RNcri8IcPkNLfEC/krKygkutey2DGQaKsXyOFxJG+Qm8rwR6WU4Wxa?=
	=?us-ascii?Q?/f7PH+gA/UiKecqXxoKPGFBvdywNoH8yPdZEC5g7pqjIMOlfN3SPaWxiOyNB?=
	=?us-ascii?Q?Hq69qdvVOUp3KAzAHewIQc1NxXn2ZCO4uKk5yrDpTQlw9QG3RqH3NeJDLsL7?=
	=?us-ascii?Q?UNEJfRWUDko+NObKF4K9zN3qDwB9yFRMRVCGtm63iWpiy7DvDtGFLIcbzQaI?=
	=?us-ascii?Q?cKHQYKMdBfCp1tx9A72zdvyetjHaQ09OIN2mVa/U3wVziX+bBYtRDjCISr9F?=
	=?us-ascii?Q?3L4YGZS7UzCgn567EKwO1JlaSvzmT9MQtHVkOUf8SU/8ucN36rnn8Vn1d55V?=
	=?us-ascii?Q?74r1NFZZKB327VOPqWFN/OcF3qcj5hYHSgyARW37jdx5k5hrFKp3KY1wZzCm?=
	=?us-ascii?Q?lFReY9ouHemDWqvWEyY/P+7791x9fc3OueTJrOg+UBbk8npCkbbu5i539ktj?=
	=?us-ascii?Q?CgKdOgHV+g3klPgk/BZaqVJP0qeb5bE8JrJLqmg?=
X-Microsoft-Antispam-Message-Info: I0Xj1Z75IiclOUIUNdbboy8HzP8tcDVAvfUAdnwBRYyc3yqHzBTvtuukD27OoHly7YUPtuLzPd2uozUFA+39R81y9XwdCoekhNYQ6JlG+k3IKkdkIJqqrcoARYY/m3bMTVLxzIS5pT0MgVytxmqjkmI+rANx8SWtUScpUZzET6Dinfo1ulgD7klfkP46MRFlUvPHKvNn3VwFbJKM3Zotlfs1xSWPZOjVMtH5jea2y2kK1AIyvP1AdfTmr6K7D0B9Z+m+n3xKQ26OY9zH72Gg8fqY/DlAttTpPlccTrQx6R4XpsuQImPfs3yohvVXk5TL
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:h2Iscfk98e5itjhPbBcOGyBvvq3tVjLw9qTHZa3lKf84JaL+0PSTwyzLMB9VS+S6BksbrEnKBtnUMAWCTeMKjpcUZ/wUU59pk4RHvAxywPGGFf6YYFnALTOF7ZAGBEvkLAX/a7XcDndqx2u/zjm6bCrlvTmNv2O7PDwrWfMWx1tVB/a+6bNXsRfrDrIpu2tTD0ohKwnM19HggsUX6nFmnvqCBsUzA/vMeCBkaufEwDExSH027P9FteM/IE4e65HP0MCP3JAgfOGBqWuWsitYwjxQOnE0XJZa/aihN4qAom49jAkkg69arHNMjwFIsaMlUqKUZD0y+s0C52MVB8inqGDY9HZsBSWNteA60Xj2qEjcTJYTfjWFTV4nzkWLBnmzZT0x+0EI80IL1P4nkuIOEVfxrL868N9q8Kr5RUonu4knl8W5K1q14s7dxuDddhgDO1zPkCaChB1x12YlW9WxDA==;
	5:qcGf/65DLNjwNiSS57PeFjooGe8L6pvA3aLd/5xSqe0Uu6Vjqt5tG7r2HXnF6iWCZQMLrXq8Hg+As8gM15mQbsW8GMXzACFeBGvfLHTbbHxvdZ9oC5XTwHjxWFJ+UlURBTkeV/8/cGnE0xZq32RH9nv0nt5kW+Nn6qvB3dutJ0c=;
	24:GTar1lkCqDwDHr29kplV9Q6/RpxDbpm1X7qkS+dkqdKqK3TvHKQzd1Di0nFje3ClCAPt7egx3Z/FcxnKcYSSizElgyFyZZKP2ySvPSuLwws=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	7:9UOCISszJPorAsGoYYYKWG0OaDAx2sFnTZKSQQpS+dc0EvLlL07C2yIY6NAgp0OIE2aBwVsmL752F2igjZmVFBPd2yBuLcAnNDtCLrpu+BXBH5yHXzUKMmGelpJd/ESQSs5tAAR8XeYtLnXZLzApGsaTL+AF72ddzbHOBJofeusZJsiVNa+fuNi96EEWALJdhh8X6NyXWjLGP5nDKWG5FnCCVQsu7UgAC/mnRgik4qexk4F6ryDfLTObOzWqlKDX;
	20:qf2HIv2CHDGv9x7cybfm2Eegev0tipJd87gq35OicRTeK8mvIWXU8s49y6A6NArYNvSK2oJpJ/bFgCDTFfzqMBPqPxG6AgfkuaAgIIDmh7CDgUl6F/gEQSrNjKB4iTPWizXEjTTfbsvn6KV8VVYV91yjVIJNfAz45d2GHGE4IkY=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2018 21:27:03.4465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e33b2af-f8c1-4e7b-4bd5-08d5d7bdbb83
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
Subject: [PATCH v2 1/2] recipes-devtools/qemu: Add RISC-V support
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
X-List-Received-Date: Thu, 21 Jun 2018 21:27:04 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 094a975177..b05c1cee9e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ inherit pkgconfig bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc riscv32 riscv64 sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
-- 
2.17.1


