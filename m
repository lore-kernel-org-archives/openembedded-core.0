Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 932 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 09:09:38 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0074.outbound.protection.outlook.com [104.47.34.74])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0BF71DD9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:09:38 +0000 (UTC)
Received: from DM2PR03CA0001.namprd03.prod.outlook.com (10.141.96.11) by
	CY1PR0301MB0908.namprd03.prod.outlook.com (10.160.165.19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:13 +0000
Received: from BL2FFO11FD014.protection.gbl (2a01:111:f400:7c09::147) by
	DM2PR03CA0001.outlook.office365.com (2a01:111:e400:2428::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Mon, 15 May 2017 08:54:13 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD014.mail.protection.outlook.com (10.173.160.222) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Mon, 15 May 2017 08:54:12 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gv005326; Mon, 15 May 2017 01:54:10 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:37 +0800
Message-ID: <1494838358-28036-6-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120528237782;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39450400003)(39840400002)(39410400002)(39850400002)(39400400002)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(2906002)(6916009)(2950100002)(81166006)(8676002)(50226002)(6666003)(8936002)(5003940100001)(189998001)(47776003)(498600001)(230783001)(36756003)(356003)(86362001)(575784001)(85426001)(105606002)(106466001)(6306002)(305945005)(33646002)(8656002)(4326008)(2351001)(38730400002)(110136004)(104016004)(5660300001)(48376002)(53936002)(50466002)(76176999)(50986999)(77096006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0908;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD014;
	1:wTE2JVn7cL1SDbWSVnDGTF7VAlzfx29+wAg2tzdsoWbBmhsbxJ6Mvq8FiI5lOroxl0p6VnMWkJ2wmtIoUtMeucfI5eK2Cgbpj1mu6DAwUxP7I5xcgFy4EKYB5pf4HxCMB6lx0jCISEfg0XeV1CdoUbZUwRGJqB+oL/1g/b4UYuvBVc/0J1qGla/URcln0KqKaSRmZJs2FAmSSY4GA591ZM7M3lJDdkhKZiVl5kw0bZf9TOhMmKHmyx37k9A11b0hNaowhse6Rsvv1EaUYxta2WG0gL+zXOF4QPM3MqGl/yjrgbOtHx8FiSJszFrns206VwWY9pGbQmO+v7QenxpRoUedvPAKYrIXtp0I4BGS1eHyLvQCwT5P0Vvohwsz0v7DHR+VwexEhw6XmfmplA4BeBUhvTeDl/+v5t2ZZ8zWyJWkwKQhbMb25DsPVVJK5JIoj1Da/I+MW3marDJkvQPdUufMuwLlLQrLYujuZEHrfESJESJK3u5VZDmnkt3o+B3cDEUaEDk2GeeCJDmB0D71T/OVirIS6SC2nDPHA0Bxpo4aVzPUwCIQPl0N75Dp2RnylcTr6kEj+GBBAEnfwqd/JZHft1BV/CZalO2Px6Kts7hcDa8JLFwIu6BxiiaIh3RfTm8SE7xr6LCmwcFUH6DgnQerE+c89IueCfbLOrLk9pABw2m3UsNRYFGLXlnsHtV9dg3/I4azrhbg1Qo9j17sLsZfFOFkGe5nQxuNQUxblgo=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24f8b5d0-221b-41eb-9876-08d49b6ff565
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	3:iylyb29aCPeReOGoPjU8aw0nOA9Xjxbc+EZ2uaqDMV/puaVJw7AFJ1FSbuB+2Ev+0xkfGvAVUprWY6kiWhSiJ3CDtS8yprJC4unwZPWDYxKnC4LHyUT4NiOaI7N0wiGirLDewM9E1U+oAriPLmwqnSa6w0tBqlUBzJQ0N02Ahoj8LBnEQzjtQjnccnGaClTx4UA3ocIfCERztPDx+5lM3KlpldPncrTgCbDG7heqHxmUG0EfYug54wXSsmoTvimcAzrJXfFM8nAM6rA+oBIXLNTUS9+1FlkaBg56rWMaHdm8ClHkDOCXvYwn8KRuBy58gDbvW2xwiceBM5HQL7JI8RQ+nORBQ5WYqxjqt8kf4PddSofAMUiqcaDuRBtqAXfFc1K1HkVX60Z/SvAFWfPKcP+z7yjf1iEIQ2o3FnHstRM1LmiDbxVhsaA7zcrKT+sG;
	25:o1E5uHIjvdV3Wk5OvHkIllWhcgaoIb9V4a278QYBpWjfWXx8FOtvuD1bmY0kPR7Wk1i2vcdDX1y3Fe+/4xNwoDT6KOOVy0Rj08qqrR7/Z6/nhD4jEKDB3Swc8yRhUIUIl+qVgAQYnmWFUepWHYBTwXY/hyQUN+ULEL6Zbby9ex88P5XnDdVxWJ9lngQXZJmgkhQRErVpV9Luwuy4ku/E0Jg0aFRv/SAjrYA2JCvMJdJLLkDN93G3gM6w+MODST/LeOY7khabbaRPYZYzWuy+KowXVB3IT6we/Svypf3Y+Z5btVevVKWVrPSpQTNkwGqEVPqC4i1NYkq4Yk17xh1sRJmCaC3ZskEBfemRpKNOVNwtpSpXQFIDPuLg87FSpuJ6TNw3JZAUaukpamgPtveESM2zHeVbrGxmYhe+GTMaLj43eAJMmDCNdtAZ73RoKHEfSdeN2RwANDgxtJ9IQgmrTQ==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	31:VXvcMGGcXirK4Iwu9ThaQ/Xg3DzpgYW0qIDPXLmTVGYEa5TGwt1zbrlgEEI8gJqZxNte3woq4IhU84/Krj77E+PmzL1ZhvcvHivATko/pjiosXGuxUuAi+8GoBtO4E6dUiVJwFZWPhsmOX0Zd9znUDN9elOeeseid9piYQ7rVCu5lJ2chlPtOZWSFZmAMdcFvZHKhTgnSWPJMy9vPrhbOy9k5Rjnpt00EPkx+VAyBKYxsBOgMQeXB/OaMhAfiXLq
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0908D10426A8150280446936E9E10@CY1PR0301MB0908.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(8121501046)(13018025)(13024025)(5005006)(13015025)(13017025)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123561025)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123556025)(20161123563025)(20161123559100);
	SRVR:CY1PR0301MB0908; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	4:zG0vKfOrMmJxAHzCqKTZFAVrkU7rP8PKKG7X02Z/?=
	=?us-ascii?Q?i+6dQk+jJKNxvPP8OUO8nHnmaTfUomurNzREgrHMahTFI888TIgUWAH5eAHD?=
	=?us-ascii?Q?O1k+Mj5k05aBkmiK2hJ9aAvWJxrat71IQTQuvg6Jv0EoqDKj112lVgHirQaT?=
	=?us-ascii?Q?RChIp0F/wdcAAyazvbKAk4dWUxdaONAWzOpfvrU1vLG0Zuv1aF4UwdEufCeE?=
	=?us-ascii?Q?zpS/QO6o+LQraBa+roJq3j+h6L66irC3dV0KF77RhJpk1uGy/HLTlVJ6GH2f?=
	=?us-ascii?Q?3gQmGwBp8wRKUiPuBJ3wKaXMe7eEK9539x0UGCk59KqgVahI40k1qLeGgtmU?=
	=?us-ascii?Q?U22O/X6nFkjHygcn19M7tsqdZ4zjZ9Aka8so0qxbvBOiH/UB3Bag5hUcdS68?=
	=?us-ascii?Q?aUCzjGIF3jE4ZVb7XmyyyuQzEhkkN1FfLZ71uaiHODrQe3+LcP7Nhs9hvhqD?=
	=?us-ascii?Q?fizKNsepGNGjdYlzMfRdFh3p5ahZptn+WDeiysV6T7fhVl5OC1/IcEd60svs?=
	=?us-ascii?Q?zje+Aj/0B9w9wgCZ94PVpyV4qq3aYTS4n30Kp5u/tndmj9AxRwtPrfM51nGl?=
	=?us-ascii?Q?rprXPiZe872BFIyhckvUSgVwGcregpaFXkiRnusCFimYCmcyPLP3EGDWnERB?=
	=?us-ascii?Q?Mggo9WouONNyaxKPKUJzqwtPUjx2dmT5yMrIwOHTaDJ2a+ojU530XzyQqK5D?=
	=?us-ascii?Q?byYcgIKPI1NUE6FMs/TVvClx+azQ262BXjJYkrICm+sHVacD0stodWFxw/HH?=
	=?us-ascii?Q?ZKSK7UaDd2Xlu4UjkJFUJUeuc9aIY91pbsfJMgI0TThIoBwoMe/k9yImWDi/?=
	=?us-ascii?Q?BTIhQBRC3SDziaM4Wnn9Iiw+Pq05geHsrUmhoHz/8SA4SFYNes6dlSvU2drz?=
	=?us-ascii?Q?IZUYhwoGQXBd3o/3rb0/uvhyBIS6nP8dnaEWiMQZQoNYqMJBcNZnO8dIEmC1?=
	=?us-ascii?Q?YdHKGiLMGbJJdotxf1p9JuYyBUmrRRLQP6e1+x6z3g=3D=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	23:xidQynp6IR8OQ4PA7nP0IimypRsLGmQiPJtbK9x?=
	=?us-ascii?Q?Krvs34Qk5W9561edf1s/gW7Qu/xIXUm9HmZhCRhjETICoN/yQYfTxKJCTEAU?=
	=?us-ascii?Q?yrPJS5kGUNBygLL5jnF2GHRp4ynnxto3tLBIIbI0lcUVtuQEWPq/iYX3XgoX?=
	=?us-ascii?Q?TvTZCF3ljjoje+MzPpIZDu0LduZte/MqcYWV/qEs13aXFXIls/2eWEkJyLnG?=
	=?us-ascii?Q?7VR7FTpHNO3JJa/MiRVVFA0LABkieMQGKxwnohKa4c7CBFl/FTQLYZoD7Lyy?=
	=?us-ascii?Q?d6vTJjy/07MnLMk1DSHP84/6kUf8jhpE5FRnGsk7A8kP6bEA2+uYoXu/4XuQ?=
	=?us-ascii?Q?2xoo70Yy9Uq+U8+04ENltaUoqWaT51R3Nnr2IBXXPPwurL4O7FfI6v+UeApE?=
	=?us-ascii?Q?E8c86nzOoFKWsZXpA2KMRLFddWsAphPRi9q7QAxa1Vf+dMC0fJaNDxM7Zxf5?=
	=?us-ascii?Q?DOgL++xO1jh2lXlVETYlmAa+BCcxpTIM+V6d4VN6vFwI8BUhNUg/QUw6AX0H?=
	=?us-ascii?Q?Q3uxNeWIJXslbMO6u9F+quuMC55iNg1IOa4q2cy6/EtYov+k81C6y1JwsBp9?=
	=?us-ascii?Q?QQ9Z1E9LazIVUA9Q++9QHiO2LMhdkBA2UoHtBqABWNM5YSOZ5gwqcf1d8HQp?=
	=?us-ascii?Q?mBX9rcQ0b1EnnT3FSQVi2xVwaOdNppTx54K9mg9249/h27kHeK61oF2M85aR?=
	=?us-ascii?Q?ciTygvL0EsRXtsKhSUGM+FMo7Fg8GUd/udMDJMIn1pprT1cTFHT0ZQ8dUSVD?=
	=?us-ascii?Q?V2t6y5J9kC1dO/gnDRF1zDAnf6Vk4/yiavEakcA21tNucTRQn6kI8zmnDGtl?=
	=?us-ascii?Q?MXYYqY2ZVlk/5g16yq+R7K7HW9D7qnA13Wo/0Go+2mjgu7xp8YRPEE6pAVjJ?=
	=?us-ascii?Q?knO3KhS3qbhcuGI6ivCUjP+b1xtuCgPtjGvZ/bDfYiGkQ5SXC1CNHgzw4ZPB?=
	=?us-ascii?Q?pGN0WdmE16ic5UBET4lvKzK7VcPZzMV95826Xtf4vPdj1A4GusVHjsAwli98?=
	=?us-ascii?Q?W6IfR6oOuYhrmiwmh5X8astU981qykLDbGijrU76PMibegHP4W3NW+MOc3MG?=
	=?us-ascii?Q?uHMcnsMVhtyioOlMKT8MX528QV/7kbKFX8Ut63HpWoh9ec8e0ueNF029LQoM?=
	=?us-ascii?Q?GV708vdbejdq/PIsdW5kUgOIcYRr4j48TW0m6yzr4descc2n0QT4D+RziZJQ?=
	=?us-ascii?Q?9ARPa3VqL6G1QdSvpIeL63tiqdNL3VAx7Fh2j4fea91vboy9NSJtuBYDaRvB?=
	=?us-ascii?Q?7bFIKCurctL6AF5aoi8G4+te9Bunqu42SRfW9VqcrAUIIZKJwTzRdMESSDKg?=
	=?us-ascii?Q?eOw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	6:d3LRPZqLrXqXUDrnYJI3/mmfd88YraIvcgvnT0S147ABATHM0tjgJ8lP8pHnDJaRLlT5u+5R7IAJUR1sUHKEcaBK/qCMI84o9cKwRfIQNxdjCxpzFAB0mwTmbO6AvQMBwPQ+Jhv4YDKOeq9O0eQoDgWrzgsPZv51oH89G98nS6sFQ80KMoMuoSdHfDADwrx/oM64XYTJY/me55fOaVK7P+wOLmMi/zJC4U39jWs7byIAKZZqfIm+S5Napc0Zuay3wnkiyEWgfNGhWmBf3dUZn7F/ik3d3LF5JphhekXpc6YS4W1pcLhec/aTWVMeJHLe1mxL6dxO5Y2ot/RQmuX8IL8AqRThNWsm6Hy3l2DfUMmc9pllbwbPswdEGxnze0CTkcp1OvTp83uSnH302AGd/ulVkDj1563mwrZI2JNn7jwX0OABFicx7KGzhTFXYiAHwxmg30TkDJyfWWUdhRb/BE7YCwT8x8Ni+NFRd90gL/zJMPt2TsQjAeVIzlcdnRkrLdRuxPn1rkD1KMCfxAoOEA==;
	5:1li3KQglBxzCJBzfMN9taXMHFYbLSnhPve71pqc8FR2E3j/Jj4Dsro9TRlyBDO3UeI0YixqbXULJ1a+WNkGMbgLYAQlQ7a51zKjRcjS3GXkcjmIWae3TciLtMIHWeEJ/9CgYvELg8Xlcb0t2K8RvLsFgKWbciwMvnNASclvXPn1FqqbzqOAcVZzTdiroJcfo;
	24:gAQdq0XNtVxU4I9rXLGsPhTtW0p57HE+pufzerVPIVE634kLsR/2U0eaRQ7mnHsEjeYRSyiOhzprlDEG7whemoZuZfOta3YAa3ju6UhsfR0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	7:nH165n/b1Uw2xdZ8Xyww2E4h37jyVZ10U5ojy4Aqd/v7ki12OUSjy9/CpNEnk1peSpjYDamoeTI1NEqPeCJKgWjpbEW3BczS8EkG9sTA/eype6Kmw/HlMKf1+rPqaZcOQf1HozJD88576YZ8La1xtfk9f77qCxJoTa7lgLdPuDFqqQp0ZyN2rdUme66w9ViANOkHvkzkxchbXqv8VM0FPnHn9ogON8O7lQrD06Wqr5MnbveXDvjc2tzXaOzTG7HbHPXKeTS0rIL6AT7iKvZpl9GocBeDwX9phu45PJBvwTPHTGi114yLNQyEB7m9ewwZgJ3CG40fwEJHGePB64N9rQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:12.5273 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0908
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 5/6] gstreamer1.0-plugins-bad: Fix gst-player failed to load external subtitle uri
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
X-List-Received-Date: Mon, 15 May 2017 09:09:39 -0000
Content-Type: text/plain

gst_player_set_uri_internal shouldn't free suburi which maybe set
by user to load external subtitle before start play. It just need
reset playbin's subutri property to NULL no matter if there was a
previous one or not.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...fix-gst-player-failed-to-load-external-su.patch | 50 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
new file mode 100755
index 0000000..0d42243
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
@@ -0,0 +1,50 @@
+From a085090ec68efccd4d82c7cf4ea6f18fb475c4d8 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Thu, 2 Mar 2017 14:36:56 +0800
+Subject: [PATCH] gst-player: fix gst-player failed to load external subtitle
+ uri
+
+gst_player_set_uri_internal shouldn't free suburi which maybe set
+by user to load external subtitle before start play. It just need
+reset playbin's subutri property to NULL no matter if there was a
+previous one or not.
+
+Upstream-Status: Backport[1.11.3]
+https://bugzilla.gnome.org/show_bug.cgi?id=779453
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ gst-libs/gst/player/gstplayer.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index fc5463a..3757a09 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -582,12 +582,7 @@ gst_player_set_uri_internal (gpointer user_data)
+         (GDestroyNotify) uri_loaded_signal_data_free);
+   }
+ 
+-  /* if have suburi from previous playback then free it */
+-  if (self->suburi) {
+-    g_free (self->suburi);
+-    self->suburi = NULL;
+-    g_object_set (self->playbin, "suburi", NULL, NULL);
+-  }
++  g_object_set (self->playbin, "suburi", NULL, NULL);
+ 
+   g_mutex_unlock (&self->lock);
+ 
+@@ -667,6 +662,9 @@ gst_player_set_property (GObject * object, guint prop_id,
+       g_free (self->redirect_uri);
+       self->redirect_uri = NULL;
+ 
++      g_free (self->suburi);
++      self->suburi = NULL;
++
+       self->uri = g_value_dup_string (value);
+       GST_DEBUG_OBJECT (self, "Set uri=%s", self->uri);
+       g_mutex_unlock (&self->lock);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 82cd91c..91e1a51 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
     file://0005-player-Add-overlayvideorenderer-video-sink.patch \
+    file://0006-gst-player-fix-gst-player-failed-to-load-external-su.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


