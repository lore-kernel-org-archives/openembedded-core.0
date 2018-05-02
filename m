Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 1993 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 May 2018 18:06:57 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0061.outbound.protection.outlook.com [104.47.32.61])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACB474753
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=npH569G3B6i7KMzzXVvxGtv26lOB0kKMrp57LoOgpb4=;
	b=lcuqVYqjweLLQ7HPLhTdFSyVgQhmM8mIVeyK8wGqvORVaLOfJpNqs71nlRB20RQgVWFyvwOH4TjQCgbH/Ti9C0WF6AuzI7iDCUIPcxoKrCej4NB4o1WSDzhj1qG4qHTDjNj+LX8RaQmm3PrRgCsydVXxx3RN4H4Qpz9UF76Wgw4=
Received: from SN4PR0201CA0065.namprd02.prod.outlook.com
	(2603:10b6:803:20::27) by CY1PR02MB2042.namprd02.prod.outlook.com
	(2a01:111:e400:c5ab::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.715.24;
	Wed, 2 May 2018 17:33:43 +0000
Received: from SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by SN4PR0201CA0065.outlook.office365.com
	(2603:10b6:803:20::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.715.20 via
	Frontend Transport; Wed, 2 May 2018 17:33:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; variscite.com; dkim=none (message not signed)
	header.d=none;variscite.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT036.mail.protection.outlook.com (10.152.72.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.715.13
	via Frontend Transport; Wed, 2 May 2018 17:33:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fDvdO-0001ZL-PI; Wed, 02 May 2018 10:33:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fDvdJ-00055P-LM; Wed, 02 May 2018 10:33:37 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w42HXaZo007308; Wed, 2 May 2018 10:33:36 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fDvdI-00055B-0F; Wed, 02 May 2018 10:33:36 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 May 2018 10:33:29 -0700
Message-ID: <1525282409-4623-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(376002)(346002)(39860400002)(2980300002)(438002)(189003)(199004)(2616005)(476003)(486006)(106466001)(126002)(44832011)(63266004)(426003)(336012)(50226002)(1857600001)(6666003)(8746002)(5890100001)(5660300001)(36386004)(8676002)(6916009)(81156014)(81166006)(8936002)(478600001)(48376002)(7696005)(356003)(305945005)(186003)(51416003)(2906002)(36756003)(72206003)(50466002)(47776003)(26005)(9786002)(4326008)(316002)(59450400001)(77096007)(54906003)(106002)(2351001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB2042; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT036;
	1:zQYYUysl+1MVLHPQqXQ5uhKtv1LlDtE4a8NRpoSKu3fOHPitKtcEg3H2LTKs4AYhVuLnToV/XU67/XfcfBz5HD0vVBBa2Jc9VFWi/Zb34/BkJJLKcbfUzF6Ha/h+U/ei
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4608076)(2017052603328)(7153060);
	SRVR:CY1PR02MB2042; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB2042;
	3:15SZuOL45BLBvWaypAkLlgE/lRzxKd1rkX6BUDYU3djKx5skoqSoU24n9U2qTElYEV6lshG+21XxSQzefqvJFEA+ZzagSs5rQ4hgCD20wk2FEb0ozFm1QdbUwLeQ6RRfJ2fdwo51yRijmrSwHUcJp9ZRtofJADiJiJlNYx8uEf5szWMo+AH/v7y/Qb72RvnCstwn+LJvaUbGUyBRGtCqn6MwmPUTZ1GYfq8/9oJogVnbdJiY2HR8zP4REvml3E+rrp0LZTx/h1SqgZ+hu0RS7++s2iMDKKnPpJQyE2qtPatMamJAFn94BGEJG6p2espsE4W5V0eO+LRUgmXAwlhMH1XN4D01xcTvplkSn7botkw=;
	25:b7VPWl9dsyi9RdSE6lZwC3dXOJkBigXwDq2b6hjr7/N3/SZ+jtjNKOBM9j5HuYLTQ9YpYsCsgFUYxlXXcHvzGJ2DFBCgKrCyv6VhwNxJp6nuUk6U3Qpm1BzLPytqAX2cQhSSjOK0LopYBh4pvSiytZHQDrHYH45OM9taBcGI5udwFKTIrwYrS6EZ4MJyZlGQaPdWTEUu+/ao6xwU3gnIR5cIxwREVsfKVxHpVDHRgC7AuKDkEf3m/4CXpwrTqzEp9mk46Ey4Csz70Wqh506h+hM409S3GRKxwcZ+tPYqgK8YX/Aavx18i3CrjmRQYKJYFIJMXhrQI+Dmm6A8+tsIbA==
X-MS-TrafficTypeDiagnostic: CY1PR02MB2042:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB2042;
	31:ZiE6pXEIiXz8qtuLvzZ8PJwkq6fu1uar/+qLaHpONqY9nkLrI3OaSfaAZc6D2eZsImiblMnce4EfWLQirO+j8mNlgrfm7m5I/zCOEQdW1pD22SD+8NGOwTMki3l0ivCvoQJcXEgiUjjXY/+ZDt2bewKyHoLNE52HXwNjGCb+VwpFzQ/67SGBNLAjcbnqRY9ZonNgDTxU4rvJVk0WsMnJBl1xwZraaFXlZErrxkFYvvU=;
	20:LXljAACinFjvlm01b5ybKzhi/NYCj7Pr4eMlK6vEg996bDQXwugUw6n1yAXIDAPkI2SfTuksU4zZq8Qx/WcQDQzYn9V6re4eUTdNkW6wY/M5Zg8gv6n4tLnpdCQvWlf6wQxLRwQAOS8rdonoHwN+dbWgV8mOr6i3SEfuLjqbSZAnY1H7BRTU0vxsxZRzLv/F1Mfr1fRBXCWhASMEUOgQA8fPrPSFJbhQ2yQf1A743j8FYc0F/G6p17AK9ePo3OKzPUgBlXlEFcxnz8ifpkp16/Le8h4Ey4JIzVIJF55IzHDC1HEdmsZlLKsGvapN3npFkPj87EIb2QQ5EEbSey5qnYHDP2bf2xXoXTXJoo/cXwsaTZboDfJ9RdPzUyz75khxOq2pAIgl3ijzajF5llOgJUaBfZ/Z8ejVhFvYubkBsZvz/AYdKFrijlgvnMq1gI9bd78pf6BthDCLauXNKvAC4w0r83rvSDruVQEqxbf00LgaJgWAhwpM1Vum063fjFq9
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB204219A06747CDCC972B4A36AF800@CY1PR02MB2042.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93004095)(6055026)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY1PR02MB2042; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB2042; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB2042;
	4:GUPXAvc+XwuEm7v8M5DSvdtxwKy33Tye2XajD7Y92FGS23ECXqS1a4k9he07WMyfc3IIvZhiDT74NBtVMEiunczx7iI7s1KR3a5Z60XiiTwPM/PbY7zEHWc0V4Fdm/3n9LB5EC+d6MjZP3rfZzmBaUHJhg4Af7RnaBDkB1gckdOHZR7Ixy8cYND43r4q4igWmaRlttK0U0ZRd1F/aMQdX3E7nRqaqDQ4oEKD0vatzltDObXkhVXzH24YObqvmGaItAkdyOx6JTHlskQuqSDf1A==
X-Forefront-PRVS: 06607E485E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB2042;
	23:W1TVWKTtxiyrxMFrN0RmwFmn2XrmprJS1tzacS9po?=
	=?us-ascii?Q?vm7zQpH7qvRiRVoM3h0/j9mr2MoXfYJU+QWTVqWza7+LeTr4rBx743xFt1iC?=
	=?us-ascii?Q?X/evsZeVOmerW55p5lXtSMybqDNbbnx+W0GDHGn+yoLDlVOrRCu5vYRp8N6t?=
	=?us-ascii?Q?vBJdNyvUkJifjBoZ1ing6e72R4iJ4rHFATgTegMLgit7Z+kagozRFD9V0knl?=
	=?us-ascii?Q?RZH3ffGd8E/hIG0Zrwj40mdNe8Vje1em/nkbUh/WISe8d1Nm9M3nDqSVxT9z?=
	=?us-ascii?Q?cP/iJ14WpGGKo4239vzKNzU2cMg950KSeMwkaU6nvTCFwqUWRvKHAS6BdE4R?=
	=?us-ascii?Q?gm3S33yo2jJ3g8VMPKKxe15VGxNbvUXmJReRYbyC/c/2ZjdEY/eJt/Smwcw/?=
	=?us-ascii?Q?DPSDdxUUKcBQwhiNjnKar2vk/v2oOCT/JAJrIaq3y9CSdHhHLswb9GLx9uMS?=
	=?us-ascii?Q?J+a+k6rPwg34MPHjewa85yHwIly3XvpC9HG/rM+AtsMuy4ghYHK1isdsxWpe?=
	=?us-ascii?Q?HZ2lKG+pS071rT3bms7MCVkRvMQMHF7rVqpX1ejLYJFJ2v++p1BahaNtf6NO?=
	=?us-ascii?Q?kGi8SQJWTdo/ONtBwCei/7xXL55gGyYRnEDPuCxgBXh2Z2VNZuHZrWfJRIQc?=
	=?us-ascii?Q?Rm6Cb4w4svSbjt4J7eGvlMx4T7qhM9acTXaGVE7ilYLwmbsYWjcV3cpYJjb1?=
	=?us-ascii?Q?3LNe+vywSzO/9OtBCAtxEcyXIqDClhrJEY4MSEZipKjBImvqxL8nSM8jgUlN?=
	=?us-ascii?Q?QP2/Nhg0BwRM/cv72ZBRSesh08hJi1IvcXBIkTeEcwpjGqbmKrMYxB6WUbIj?=
	=?us-ascii?Q?A5zy2xnhZCAheLHCSDs4+85U0xtY4CFz8H5v6moZl9oEFiogPKv5de3JOGMA?=
	=?us-ascii?Q?Wax3M0KCgAMoeUFh1AiIN0mYUH4zmUU4K+axCcfD+sfdP8+pdCvHUe6zS2hM?=
	=?us-ascii?Q?F//WhXpMvHdKl3q8bN/d4x/HXlUAnLoyC5UCaJ0VvLPdQVV0EnnZKVVrrFDt?=
	=?us-ascii?Q?Mxzs3/Mn/UDL8u0ldAhScv5GaR18ynxdN9Tm6lthIfOGE0PdfOmBNGk4Ctwx?=
	=?us-ascii?Q?fuKRF1x1GJgwaXTd3pCB/2aajp4eIyy9IZPmNg1ve5e+Ws453jtkPMJKPKqw?=
	=?us-ascii?Q?eQYFrJSpNlJwFJuVAZ6ocJhKSx2LjUnlUXUoPR2ZaQ3mY6upX3qDnYymAGQ4?=
	=?us-ascii?Q?y3qhACZW1sGjbo=3D?=
X-Microsoft-Antispam-Message-Info: 3gWG/kI5wlRoFNIOYyTFv76rFnZo8qJmPOVlo+HDN8cipQW2z1MJbQwulIaPJ3PVSDiKL/Tmc4DZvIv4SnTbpzV0emSbQKPtVtNbN6USK5cect5UBtsjwDfESEjNkjV01jOPerdI4vFioCRtRe5OGTWQL15E8S3ZY4fxued/E6u2VQSjidqrOQFaVPg7kyJB
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB2042;
	6:0H5fbqgJlO+Ycr3JncQAhKTwqjeL8pQKQ/FYImhcd4KSXMyjhf67PXzZ9q17KkYvnQqGOmsxLLGtMh1pOxn1pBwgjuzNVkNidtm9Hjalw7ql1dE5j9AMzAbIkqTfuwlGCEazKvs8bIDZdMMr6phl5q06PKR7H8lOhU7aWUsvn0u+rMHaUYDrywLFv31zqQZfKmFe8rVQcTsr9fa+Ej0bAuzV8nLIHjTa6nMSYdejnabG0zPjAiEuXB80xj2pETq3DNXcy6lwaeZvuOGjNaVfzK9xP3RRAmME0Mqa+4/OnQCBQCcINO+P8uPfYOtdQxeBZezUjBlNGH1WBHQ5md6gdwYapyxuQGmXq/s1CJN7q49Yrno1bIMiTFeNQGBf3mmzcPtrQ4Xr2pAsF50GE7W15PxlAwzfkVwOjyDLfOdAboeWDDtOdA1YYNUtvgH4eyC8OkwjXJSdG76QFVlP9nQkng==;
	5:qXAKdYNys+EowtxRoTPlPugSq1G0Sn4/Gu78EJB2eiNHyaD2oCtLOYGyit18eS4tCG2bG+xR8igwT0idV5BdAlwUg9/oYftuNhEKV4tZuKrIPHRpNw/0tK1mVIIaAM5ea7YxXsD3KpaigJPqjcuzVkl1FGS7h8aBOmGTNiv6Xo0=;
	24:i4vXSk5mI5pn4kH0wLAe09U98HGRSuEyKyXv0J7n3AM6DA2gyCCaLy6FlhpDjGWFjebOWCIQGa40U5SP1/J3KIihsEvnUkIry1IDeT/gPz8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB2042;
	7:DQzpdFT9QHQQEtDkSCrxX5SLIjADnY2LiBR+IX08067thq3mukmUXgOnSR4N4qLdgbZ6x6xbHausRsX4vHGcEYS1a90e06MWviKrGCnYeac6rsZ4aV9B4uFkj5CeDLM4ifpnfXx4aFCHBX+f3VrUaWq0nPAQGNeDVNHP6Xd4LGwCIgQoGcQgwvy1OWcH2kgPsm2162P/wSZTEmchi4hFl1LzWxR5jYWW7cpdkVUrhgne3+5A5G2H7HVXFukJAbcR
X-MS-Office365-Filtering-Correlation-Id: 2a4d8c1a-b5fa-4cbd-8685-08d5b052d9fb
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2018 17:33:43.2177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4d8c1a-b5fa-4cbd-8685-08d5b052d9fb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB2042
Cc: Eran Matityahu <eran.m@variscite.com>
Subject: [PATCH] matchbox-session-sato: Make the battery applet depend on machine features
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
X-List-Received-Date: Wed, 02 May 2018 18:06:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Eran Matityahu <eran.m@variscite.com>

matchbox-panel enables the battery plugin only if the
acpi/apm machine features are enabled,
so enable the battery applet in the session script
under the same conditions.

This avoids the 'Failed to load applet "battery"' warning at runtime,
in case these machine features are not defined.

Signed-off-by: Eran Matityahu <eran.m@variscite.com>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session | 5 ++++-
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session =
b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index f6313bd..3a70574 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -20,7 +20,10 @@ matchbox-desktop &
 # doesn't have the feature "foo".

 START_APPLETS=3Dshowdesktop,windowselector
-END_APPLETS=3Dclock,battery,$KEYBOARD_APPLET,systray,startup-notify,notify
+END_APPLETS=3D$KEYBOARD_APPLET,systray,startup-notify,notify
+END_APPLETS=3Dbattery,$END_APPLETS # feature-acpi
+END_APPLETS=3Dbattery,$END_APPLETS # feature-apm
+END_APPLETS=3Dclock,$END_APPLETS
 END_APPLETS=3Dopenmoko-panel-gsm,$END_APPLETS # feature-phone

 matchbox-panel --start-applets $START_APPLETS --end-applets $END_APPLETS &
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b=
/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index d146e83..8230e95 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -26,7 +26,7 @@ FILES_${PN} +=3D "${datadir}/themes/Sato/index.theme"

 do_install() {
        # This is the set of machine features that the script has markers f=
or
-       FEATURES=3D"phone"
+       FEATURES=3D"acpi apm phone"
        SCRIPT=3D"${S}/sedder"
        rm -f $SCRIPT
        touch $SCRIPT
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

