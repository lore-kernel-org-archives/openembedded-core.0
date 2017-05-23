Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0060.outbound.protection.outlook.com [104.47.32.60])
	by mail.openembedded.org (Postfix) with ESMTP id 89D9B77E89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:36:03 +0000 (UTC)
Received: from MWHPR03CA0021.namprd03.prod.outlook.com (10.175.133.159) by
	BY1PR0301MB0904.namprd03.prod.outlook.com (10.160.195.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14;
	Tue, 23 May 2017 07:36:05 +0000
Received: from BL2FFO11FD046.protection.gbl (2a01:111:f400:7c09::102) by
	MWHPR03CA0021.outlook.office365.com (2603:10b6:300:117::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 07:36:04 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD046.mail.protection.outlook.com (10.173.161.208) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 07:36:03 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6g015402; Tue, 23 May 2017 00:36:01 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:21 +0800
Message-ID: <1495524863-28699-5-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985640413789;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39450400003)(39840400002)(39380400002)(39400400002)(39410400002)(39850400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(6666003)(36756003)(97736004)(356003)(53936002)(8656002)(110136004)(38730400002)(2906002)(189998001)(5660300001)(76176999)(54906002)(305945005)(498600001)(6306002)(6916009)(50986999)(2950100002)(5003940100001)(50466002)(575784001)(104016004)(85426001)(4326008)(77096006)(50226002)(8676002)(8936002)(81166006)(86362001)(2351001)(105606002)(106466001)(33646002)(47776003)(230783001)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0301MB0904;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD046;
	1:p/9Un1RgkFRVrZh2iobbvGV/O5q8j8/5jgSQk/jyCLLhM52XpVqe0yBu68bNko/8reL15dGyBC50ZtVxWq2/dNnkkP3xYn0gUK1ldZ2Uy9Rkmcz9lMUOqe+weplsExwbJKSbPHhr/yUpMoH+wfpHKWwQE1laV+gvTgP025DcfZ702c4vslwINTUF1xwpZySucYTDMFufI5eygaeOXXYqwjy85Mgm3+WZjDdS/W5lzSz/gk8Na+crbdnTWyIp9Ys6tRbad55iuQ2M+XLQKYG+h60cJzBcX5lqfcYw12nNBKfLSALPct/BdI3ZwmhoiYCcMS4O35+ELAW3jQ6f+J9kXrWpNduxbzY8F9115eEsrjOqIHQcvQtORHRjIVOeFSTfCly711KffeVxwwq6TqMTL0JTy+yA4wuxzaF37/0RCdYe6FpkqY72maco1Q9a2psGneHpK8j1DENTtC5papYk6+zqELN1EuSN0lxjmPZzFARL5SsLWVcQYSlmVt99mpvknOx01dLuzCf4Wt7N+JkzeEQE9tSTlj+T/7ddwdgi8LL7/RhoIsc3DTj1kWmC7h/tuM6fg1+j8HbqzlRykYxf/LzmFJOHpemN5p+XY0rOok/f/Fg2o6BWr75NJrm2vHmUQnVrVq37rIJTmu+qoIXaCgNFCzme0KcUYvwy2YoPoyOmJGqgbYBj2ewMnmEtZKeTMs+ZKmd4cXl05wvEJxnHm42vRJMs4dCCqkccrNrQTlWI7Cmf2WiP7+2yARfQO/Jtptm7tiXKJdrIkXekdHwC2Q==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR0301MB0904:
X-MS-Office365-Filtering-Correlation-Id: 8705713d-fc30-4532-9a5d-08d4a1ae5e0d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BY1PR0301MB0904; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0904;
	3:1r0hrbb9tAT97uY6PMTQo5EjQ+n3oeAxPEyrD0uP5OOpA9xDktzFmToVchheekQ41rikqBe3BzS04onngN2qNJ1oOzxAv3rlgJUKr5bE7ks0HBkDalrYTsoFJYkaruBiLGAJduvbUm78XdWShrHiC+PhrvnJA4Rzc3W7S589rYgB6CUEDEoYsUKRJjfQ3RFaEPPfgkxIAnJcDtTGHxft6oS49MWcOPjvHta91Mva0k+/JfGOSUN85GyiRLfKm2tg/xW0SVgp2lqAdz+MCHF/MUjCjoXPSRiJ8Z7MxHlDETwXGcY/gha+Xg33fIKBKjxO06yiw9Z5vR/t/J9gfbhTWQ/2kSogVGcTZVc97LRiYbFJ1R3HZWUy0VgiefrqPwbo1awvVZORpt0rOOxp4oiakHlqF2avOaTac39nds6QdV9CCB4Y1oyhJFlXrJlAEyUr;
	25:O/C/mr24YEGXTXFbcS8w3EjvzbanR9ZeP0xe/DzD2DbZjmsTKGbeMVzmIu3spvmsbyyZH1dJ4CnP4quZQc9Bynxj7E8PpO4GTUYko8EE2luJdY7Nd3rdshN+hZ20Dde1RN7CkL79+nyQ37/bg7qw1X5tl0GyX6k6ubVcGnK/brACyvmvxaB9WbeB+ayHC/7Y6Fn3ItaFo8trCK9M7DD8ILwBu+g3XAho1u0YaDhDdKkq33zXi2DlnEGXyttiSJajmSla0FD32ExBBBabq70Uuqhg3hl34SRWsEI3pTt1LzOjTAzsUyscqt4hIPxhocqqGqyreL3e7rk8RStIYXhE9bsfYMTKKg5L2DKSrJhCMmUykwVoVQBASKFp9V7k0E4v18MAOv+HRLYzoYx9lc/FvasEVGnkJxDBCxv0lHUHIN42B4NV3O5UUcK69aXsErq5SD804IUD2QChozZRH4y8iAvfPMiXWpXrleqQ7lnQ00A=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0904;
	31:TfDI4JdLSC1vgdGL7GbwlKoki2shxz5VoGkHIZpDbcVGvQvI9bA4MqUEYQB108Kht3TlGn6hYJNz1wDmd3gRncb9J7DC3lBhcH5J9nCxz8zzNxymlEdxrpNSAwD2TKflGycVMyR+L3QuoEHg+RYmidIKyEf2eTuN1HXM8xUDVp9J6s90PHr5Pe0O/N2E1UTa0CtdbVc4d6sCkfUW1efsJpyVfFALAM2GAYcE8OJ+nSiue3TMmaid80z/ftUPGCte
X-Microsoft-Antispam-PRVS: <BY1PR0301MB0904DBC875B7238EF6972FB2E9F90@BY1PR0301MB0904.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13017025)(13023025)(8121501046)(13018025)(5005006)(13015025)(13024025)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123559100)(20161123563025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123561025)(20161123556025)(20161123565025);
	SRVR:BY1PR0301MB0904; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY1PR0301MB0904; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB0904;
	4:pdh19nNY+IsdMGaRVgV5SRV1Vmos3BNf5kmarIBF?=
	=?us-ascii?Q?E1q5Ah2JSYy/NP8Eym6N5AtzaWExr1Q65UbnJx0cdxvf61dPK7i9FljQUIXF?=
	=?us-ascii?Q?Wtakf7zm1Omj9rhHihArtW1bO/r+ufKjmWQqHsKSX3c916apQ/xSFDcCz7ya?=
	=?us-ascii?Q?rmmkbR0zL/rn74ptluTG0EOdaVfzmUNrEcOMdbKFNoOUsMqt84oaqbDdEiQF?=
	=?us-ascii?Q?QOvePnKCLO9/DmvZsi8LTulHujg3npMwyyveDeB1s5DhTeToi7bFn3cAHanF?=
	=?us-ascii?Q?Je64MuZR92FrYGl0Y/2OKCedbGfwOncnNrQARQYVFxyihUL4dl+YqdcUGAnI?=
	=?us-ascii?Q?d8ebhpZW50C37VVGjb5e/HNMupTNsZdQXUaAYavE1fCwuZ7E6fgLxpNdpTs9?=
	=?us-ascii?Q?0FhEVTmyVS13EMxuVxtYzh46JfIDQuRNI620/D8G/FqmVCyc92ugZy16goBz?=
	=?us-ascii?Q?HXkq5UMlT3DiWlS2gbsuUrCI9b+iVm/BG8wHZDr4HmrOhS+RKrnhu2dYurQK?=
	=?us-ascii?Q?aFY3w745GzUWXH/xvQscaoJDj0m4Pfk1KpFBgWC3ZbbOAZfM6A7CbKEY9PUC?=
	=?us-ascii?Q?ORRx+ZwOLPACFNRTnbP3d1wZFHWr0RFEVbR8sdFYqcLloKscAxA4F3JsoV1d?=
	=?us-ascii?Q?n/mPRsHWxhVTMTBz9basYQGlXevk1a6LPGxkI5p6fqPhd+/ahGfYIcCu5Y26?=
	=?us-ascii?Q?m/O7nMR5zeMDgcOpdqG5UgZiRwtWNVAO9hjYMDJSGSowotnt+Keb96xPntEQ?=
	=?us-ascii?Q?e63uP0MInvMmiyVYdwwVuFNwRbVOQqrus/3m2a2qlY/LgPRpq/TWTY0Ve7Z0?=
	=?us-ascii?Q?rsuCON1yBOQies3Cr6vMrspzffxcjaNPONe5C3XRnFfrBy6KKreeCOw24TLe?=
	=?us-ascii?Q?axmXP+moLqIOizNQf+QoKLWKP1CRIxfn+TzTKyGnlEzpIfenq+xPRAF3NyKj?=
	=?us-ascii?Q?6/RogisHHtdxrkM/1qe+CQeTKjQud/6ehApt+fD4/Q=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB0904;
	23:4EqgLxm7o3NuKNos6qx0pPf2/r4Hm+nr2/ZQDxY?=
	=?us-ascii?Q?i4WO9EvL7ezwmP4skQyKJqdNhyuJz6LC3gA5cmeNuYAjqBfRdTVB/Y+R6HFW?=
	=?us-ascii?Q?y5D64z0KYAq2eRAB4PuR984YEbC7tfehbvIsoh20/GkaX90JOYQQdn/UgQkT?=
	=?us-ascii?Q?WH79naCRLzFR77/SVlwRf1Gv+NQ1QcCqhkzZo+7YNs6wRUlwqwAC/wd7FI1o?=
	=?us-ascii?Q?KaAEUmo4fUxArB950F4HDXOfjTJkxkBW64tDDTir8gu3aqjfoTpJgFs8Dz8G?=
	=?us-ascii?Q?WdbkP04FCADNUV+6U8aRhbmPn6APiYJRAPsKG1493o9uIUjk214EY2fIxU9K?=
	=?us-ascii?Q?RUsX8mooNP15ZSzOd7Kk2ui2Mh1FG6OJo8mmYRVWam41SMHo8qArjdPNbI7f?=
	=?us-ascii?Q?XpxIbdP6I17Wfjm4iTeklGXidvMFhoWS9d1PqeFWFjVKhSozTOGHIFYSc0we?=
	=?us-ascii?Q?lwg5IY+HucEML7YA2+gY1yViNJ9LN699KjBx7QLUN0TaEvtrP6chORg1kB99?=
	=?us-ascii?Q?6Msij83IO+lQgfaQyNKqzspE3QxLo08F5FoUu9p2HuSTTj/gychUm8iqbZzp?=
	=?us-ascii?Q?SUktO98QCXa6Ka33H75/osw8K7yVdcUFPtZR/8czm+CrGQXSE/uQLqfXraqX?=
	=?us-ascii?Q?UOY9DojyKg1HjDIctdyanu4E1sibDt0dhHxTAQWepfQ5YXr8NGYNvNGjfq93?=
	=?us-ascii?Q?nUldhEIeVQkJ4As9ml0zQdSwNiL3oLTd+A/swv/Z2octf3vkD5rrt9OPpm26?=
	=?us-ascii?Q?B9oXu8slkrmFuttzhz/EXt/cxzBnvToN+eeyEl7/Wt472BufuOGMQeZdHsU7?=
	=?us-ascii?Q?N808LLUoK0/GfuDODzhpTEQ4bcqe1SHZv1ECkq28slYkUin5Ca2y0sta4+aQ?=
	=?us-ascii?Q?mxJild0fiKkpmzzPQwpws55MfzQf/F5YJW6qFS3xFy/8YNrq73Z96/QunKQt?=
	=?us-ascii?Q?ZNj+XMVlTuy3cjh3vR8f84vExTId5FProU8ueo1ZNx2JpW9kaJbGk4ME2Zjn?=
	=?us-ascii?Q?xJqutu+AjHsVB5yqc9OwFWLTG4LLzr+a0+mSB93kzXTx3i8pUdGTP26U2Dv3?=
	=?us-ascii?Q?sHobwgZuptcpeJPhMxQ/rZmTmdyFmcjVW35dUaBg7uuvgYsEnABocW/CwOYu?=
	=?us-ascii?Q?UMLvEyQcdRn22mYqefwIY9lTkie1OnsKruhtTyOERSCBsJ+ukFh+7L1z9tb8?=
	=?us-ascii?Q?Bz/je9aR2vLHp7m2QnwuoI2+zm8FykCB0hbSdoKBuB3ZOaFYo6Qj9ihKATo4?=
	=?us-ascii?Q?cZne0mTvoF0uDLPBxCv225/Vt2Mvjph2HNlmUaiwrHyOmXq08pUdGJSx6c4T?=
	=?us-ascii?Q?SVyfExvAJq2xzQdO6pyZ7HuMVdeVsLdUjYlt6MTaez11h?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0904;
	6:yzT5wpnpePk5j+5raF7AT3USLnM3VQoAV7ZqTAUY82qrXdVGPUIYEBG1EhAQGitoBWb+Y/TSi0xVu2qxv5YfLSbWVo3l9mOmWO0CgOt2NF2LHZPiTrslmpS7Eh/2n/Lsqy2+NpVqFv+M2zGDIaAeeY306u5/KqZdyX/+lRMhcEJWu1ustqSeiWNBBnvpcnHtURTSoDMg83A5wW+5rBxv01b+qhV7C9iVOYJBJ0LcpOr5Hq52ygmfXOZ588Cjm76eIm9TQ7hhlnsV1bp7WPzhDR3hsdJhpLoI1iyfHhz4W1SUZ0wkpzokJvmXbJ9GM3ts/4qzxy2bxjrwvlodfeNqFTKzcZvB/q4LmV1oayWESECgAYDKSswBDTlEia/UHLm7kcITaatjo82r6CamooTWMvQLBR4gWTyJXIPX5iQeQlO37GVKheXTlYQpe1/Yy/wpHN4rRibc6S2FaL3skyPH1Ka4A1vDRSIm+TFbjsSGDiY3N8680cU87TRvP3aB07ZHWqMt0CWEo6ag2dwOpOVN8A==;
	5:hpV1sZlYQ3UwDL6E67LllDazIzbQrCpi1jMOwYLk65aqIupZN/uL6N53wqcvyJ/1DA5tOr8Q6vfdjWKymJMMh0ingsqLGPvk0bsZKY4cSUuJBkDuQypSJ24xZ1WrkO0oL7jYSCQ82ExpgyYaD2F76up1a6JscKKY6C5JHX3rnm1YyOWfQ3EkChqF5nPobwfh;
	24:Kl5A6Qevq4nik//HOVPwEL+DPWIWuaDNa4OUfWuzNkg82wcYbuzpgzZlK9eHlU/PuqXdrnJ1hcLmKUBhWQ7DlEk+3mzb7qCrZyClv8MIOd0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0904;
	7:AmupA3Dg+LHKOgAxNziLmeWOzY3DUqHoA7tUAe1qYjsYTaHeIUbZRQ9xwF22bbgxCYdDFZQXts95jmO/McuMWUDQjMcExObaSid8sQ3MT8V0w3Sl2zAVGzNvgVQWGI0vaov8F7K6OkJTRGV2FaVjTy9x55K/k5Q9EIR1qHsgA4FXtLV/lC0YVIAqaZtQ/vjS9jIGShgS/KOzW5Zix09YSnZSP/8hdum2SLULViCOxZKExGS/TfY+zc4aQNTJcrdvw78L6+zBtKTM3MEPZV09BK+ghaE+xuWKQjD3euIge2hvWKXpX7pZbc0vlOlfwomhOASkaxmRD74XvOqu3hNjmw==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:36:03.8697 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB0904
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 4/6] gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
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
X-List-Received-Date: Tue, 23 May 2017 07:36:04 -0000
Content-Type: text/plain

- Add overlay video renderer "video-sink" property, so that can be set

- In create_video_sink, it returns video sink instead of always NULL

- Add new renderer_new_with_sink() API to set video sink

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
new file mode 100755
index 0000000..ba5dd27
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
@@ -0,0 +1,138 @@
+From 2437386711abdd866ec46d10a8bf48072ffbaaad Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 27 Dec 2016 17:13:58 +0800
+Subject: [PATCH 4/5] player: Add overlayvideorenderer video sink
+
+- Add overlay video renderer "video-sink" property, so that can be set
+- In  create_video_sink,it return video sink instead of always NULL
+- Add new renderer_new_with_sink() API to set video sink
+
+Upstream-Status: Backport [1.11.2]
+https://bugzilla.gnome.org/show_bug.cgi?id=776490
+
+Signed-off-by: Lyon Wang <lyon.wang@nxp.com>
+---
+ .../gstplayer-video-overlay-video-renderer.c       | 38 +++++++++++++++++++++-
+ .../gstplayer-video-overlay-video-renderer.h       |  1 +
+ 2 files changed, 38 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+index 7764d43..411dd3a 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+@@ -40,6 +40,8 @@ struct _GstPlayerVideoOverlayVideoRenderer
+   GstVideoOverlay *video_overlay;
+   gpointer window_handle;
+   gint x, y, width, height;
++
++  GstElement *video_sink;       /* configured video sink, or NULL      */
+ };
+ 
+ struct _GstPlayerVideoOverlayVideoRendererClass
+@@ -55,6 +57,7 @@ enum
+ {
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_0,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE,
++  VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST
+ };
+ 
+@@ -81,6 +84,9 @@ gst_player_video_overlay_video_renderer_set_property (GObject * object,
+         gst_video_overlay_set_window_handle (self->video_overlay,
+             (guintptr) self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      self->video_sink = gst_object_ref_sink (g_value_get_object (value));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -98,6 +104,9 @@ gst_player_video_overlay_video_renderer_get_property (GObject * object,
+     case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE:
+       g_value_set_pointer (value, self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      g_value_take_object (value, gst_object_ref (self->video_sink));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -113,6 +122,9 @@ gst_player_video_overlay_video_renderer_finalize (GObject * object)
+   if (self->video_overlay)
+     gst_object_unref (self->video_overlay);
+ 
++  if (self->video_sink)
++    gst_object_unref (self->video_sink);
++
+   G_OBJECT_CLASS
+       (gst_player_video_overlay_video_renderer_parent_class)->finalize (object);
+ }
+@@ -135,6 +147,12 @@ static void
+       "Window handle to embed the video into",
+       G_PARAM_READWRITE | G_PARAM_CONSTRUCT | G_PARAM_STATIC_STRINGS);
+ 
++  video_overlay_video_renderer_param_specs
++      [VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK] =
++      g_param_spec_object ("video-sink", "Video Sink",
++      "the video output element to use (NULL = default sink)",
++      GST_TYPE_ELEMENT, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
++
+   g_object_class_install_properties (gobject_class,
+       VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST,
+       video_overlay_video_renderer_param_specs);
+@@ -145,6 +163,7 @@ static void
+     (GstPlayerVideoOverlayVideoRenderer * self)
+ {
+   self->x = self->y = self->width = self->height = -1;
++  self->video_sink = NULL;
+ }
+ 
+ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+@@ -168,7 +187,7 @@ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+     gst_video_overlay_set_render_rectangle (self->video_overlay, self->x,
+         self->y, self->width, self->height);
+ 
+-  return NULL;
++  return self->video_sink;
+ }
+ 
+ static void
+@@ -193,6 +212,23 @@ gst_player_video_overlay_video_renderer_new (gpointer window_handle)
+ }
+ 
+ /**
++ * gst_player_video_overlay_video_renderer_new_with_sink:
++ * @window_handle: (allow-none): Window handle to use or %NULL
++ * @video_sink:  the custom video_sink to be set for the video renderer
++ *
++ * Returns: (transfer full):
++ *
++ * Since 1.12
++ */
++GstPlayerVideoRenderer *
++gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle,
++    GstElement * video_sink)
++{
++  return g_object_new (GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,
++      "window-handle", window_handle, "video-sink", video_sink, NULL);
++}
++
++/**
+  * gst_player_video_overlay_video_renderer_set_window_handle:
+  * @self: #GstPlayerVideoRenderer instance
+  * @window_handle: handle referencing to the platform specific window
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+index be09113..8a96e84 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+@@ -41,6 +41,7 @@ typedef struct _GstPlayerVideoOverlayVideoRendererClass
+ 
+ GType gst_player_video_overlay_video_renderer_get_type (void);
+ GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new (gpointer window_handle);
++GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle, GstElement * video_sink);
+ void gst_player_video_overlay_video_renderer_set_window_handle (GstPlayerVideoOverlayVideoRenderer * self, gpointer window_handle);
+ gpointer gst_player_video_overlay_video_renderer_get_window_handle (GstPlayerVideoOverlayVideoRenderer * self);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 732fc2d..82cd91c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
+    file://0005-player-Add-overlayvideorenderer-video-sink.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


