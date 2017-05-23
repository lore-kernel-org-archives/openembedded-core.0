Return-Path: <carol.zhu@nxp.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0079.outbound.protection.outlook.com [104.47.42.79])
	by mail.openembedded.org (Postfix) with ESMTP id 8086A7016E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:35:53 +0000 (UTC)
Received: from BN6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:404:4c::12)
	by BL2PR03MB163.namprd03.prod.outlook.com (2a01:111:e400:c0d::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14;
	Tue, 23 May 2017 07:35:54 +0000
Received: from BN1AFFO11FD017.protection.gbl (2a01:111:f400:7c10::194) by
	BN6PR03CA0050.outlook.office365.com (2603:10b6:404:4c::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 07:35:53 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 07:35:53 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6c015402; Tue, 23 May 2017 00:35:51 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:17 +0800
Message-ID: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985537801307;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39860400002)(39840400002)(39450400003)(39380400002)(39850400002)(39410400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(5003940100001)(4326008)(97736004)(498600001)(104016004)(85426001)(305945005)(8656002)(54906002)(53936002)(2906002)(38730400002)(230783001)(50466002)(110136004)(48376002)(36756003)(81166006)(8936002)(50986999)(86362001)(33646002)(50226002)(2351001)(47776003)(106466001)(77096006)(189998001)(6666003)(6916009)(356003)(8676002)(105606002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB163;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD017;
	1:682sGLH+XA5h8JY9SrckewR71VSBMZXpBtsJgmM0Yjxw0wET26wPrQcgeUWQLI+2/CXw14UNbp3hR22rCE9Fg9t2Xe8D2rMu0iuwMr76nU10pIu4cD4DUVWs36n8hrqZ5EJVjdWFwCe3cn9tluNh81uHB8oFFncCR+XReyl0nwljuFuvS9zaMcl42fz9gl8Gort+/crm22/veFGGTu9T/gyuB8Zku+KnZg698uzLR3AvgbrxmB8Akl+q0X6f/0mcnW+V+4sXnHvRwDAfySrbPyujzlczVf3DtIzPA330w509G24k4V0+N5p0ue1MOHQvSiMlqWf4OfI+mJ+teQYkxoZsJJiciQPVcJXZuEBXwso8WE8b4kEhbE7t2B54efCsFTx2AogrKSfvPmVZ1JtwjaDC+6OP/5gxdvTj4VlSYvtQdBqzkV3+mbYH7zwPaWNnDpYCsPYVCtOB4n6JKQQGGJdVyDLmnX1UWTZAdNhKqplgKr5WmsHKP6DJ8tYn8i+s1eu4nehqQ7nvUhljd5LZWsG8JNI2uqfCz/+lXh4ZfUEPKXIIfiEajKyliUQjefJ7I+0oyFfvWK34ZBO3ZjZAtYTjiV30H0z1qEM+C2cQZ5cPPcT5iX5/SnGuIZ2F0eTPMtRHBwcz7dRJAAyvdUT5LiXNt1UCqi+g0+DGacszrn7NE488WwnWDj40RVzVFqDKoKxOUP355JntDum2i9SUSrMECrUqJUgSivryUPk1ElZvh1BecuBZvj1Xn+F+8f79NUNYPQaVWFzroZV51+T7Bw==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PR03MB163:
X-MS-Office365-Filtering-Correlation-Id: 8ccf1dcd-fe3f-4300-d15b-08d4a1ae57dc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BL2PR03MB163; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB163;
	3:vwvIc6E/GxrmxFV6UZVxnwSAyZP0cVOWxYEaWzbKqi9lrMeOloO/WHwn79uDc0J2muII3QvLDNlWk4i2rroAgEqa0hInokq+aqptC4dz24W0b52uZPtP78Yv7S0tv0zV/xFdX2nkWYeXcscWKY+zDRqssDGSAgS0j4yqby+SaAEBc6XM/0N3mxWxwmBnfpVVPEB2WDf9nyhiG139GZHfFBHuR7XUmQe+Jo4L2n4AAefmyR5dId2QJvDGXZttOC9z/Kd5dqrma4aQDLeApqOlU2g3ZgqhGc503tnptGnP4omrejRD7Of64TY/xbV6jPSHkP2FN/8OdRFC8DY5AkIna/ejzBN52sUI7WZTF/e6qvN47K6+tVRUCDZdE3Tzk4tTgDxXuWFwSqZQfIqGcLtbrATD+hFq8Df7KMER98rwF6qYx2F2Z8P0oVJlJAschu8S;
	25:BnMz3VBiRg3nB190qckAR4TkZpeqwu4AX48kAALum2Dga8w9lzZVW7Fm9u2k2dVzVEwu2HIFu6z8Jwt8uvv/x8d8LVsUgYfKfadw6MWyQ5s883wiDVFuAv+AbBLR5YmT6bhljYB39k7Pnfp3ymrOiwcU9sYEpHBmjJtssH7uxr7+lB4L6san9kA1S7doBJXcowVnzkCAhe5XGUYMQadxsPuetFscF/NlYX0fLu4t6OBJZUNq3+3tjXx+lTcXUWT2MQApHMsPUW0otbe1mZ3jTs5BBXBqrqY0IrUhutnDV8OA76YByWkuVPw03AFxasu+zseXEVSw4lP+/WJ/OBee99I8ZXlrdAmQcQpetAPmuz77gWvmUirGtOE629Dn6tvV32zgMu7FZAAs5WBUUPumv+LEjTbKi5qJk2qeJUMnkJqYZtZjO1Somd2/4L82jUxtu9dXXQuG896WR/l/krJyp3BxZXBAcvokZ94+jPBoqO4=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB163;
	31:t2HEJjRNIo23bRNVkdTw5WISmcH2i7FLXjR2DR9UY+JZnmT1rwKT1nA0x7vLctdPXLUBfDOhJbjNBHq81M+oB79JjUKAgtDyCJVfTUYuoAuiFnDEmuLbEMWrTFCKb+3UGTQZR//cQJOtFdfA5hZsCjQuuJCgPbgtkIk7HTGXF4nqmQHpHJZGRqla78PNHyxmPDgYh4OxUlR/s/JiU91Cm/ubM8jv/RWoGJBRtduV3i/ZpxtjvTDp5Ic3SdciUHNm3GR3pSqj6QatT5THHqfU9A==
X-Microsoft-Antispam-PRVS: <BL2PR03MB163DBF88CA63973D74E1544E9F90@BL2PR03MB163.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13024025)(13018025)(8121501046)(5005006)(13015025)(13017025)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123561025)(20161123556025)(20161123559100)(20161123565025)(20161123563025);
	SRVR:BL2PR03MB163; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB163; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB163;
	4:m0usVI65moRviOVZCpebnGSPRdbihnw61AatGZsY7MHlL1mESiZeG81QuMN4wEfoktHZSQyBUTsntSOJnP5iF+rQFWAur83qgO/LZMb6t31QuRM3VSEohfzl/07k/B8a2o6bueKQpMb0XlCsIV1+VCg3+LHyUSS/hem4lSAOk8mW3+y70+/lkqNUS2K6cMFJmRCuCVrXKZeBCQMk0MrIS+OUK/u5USMBt14eqv+QEVgS8juBKPhCGIHs1VKclU3rGCZ7vWsZvcIHyD2VbqGuJuyQKZZKTY7pmAuSGP3mZnl+EC3o3pCNnj7FdOJ6gzHxYXF0ZNSbxov4ZS2b7g2ImKLq00brDeJXbORBFj66XOrXwkYmoG3WBHL/y3KUR/J5KBHjwT6ycLVUp5zi+XIGtn3GJKCaXT1qbtAwON9zbQBrQ/UtnkQbetBeTW/U/50epzDGE4k8CEiljj06tZwataJwHy4N9ShGQlK2+6WoOOJqJ0cxJL8Qk1MnrMzxYIwiHI7L0vYQ8dYfWC3RjgXy5mSOhRrfOknE3zCgZ1wt8IiTIgAKUsxEpCB2eJezz8WlgOzkQmrOcIBEr0nYjj0xvB9ZUiW++3bbMnAHMKdDfY6wKblMC2gyU3t9ZtX+sttvGjXDlYhVoIgg3ukfKJ6whCS1TMTizDwCaIskkc/Y9quwo47+a/y2nCvYZ+EUc03wcyFzqLyZrwqtCU1VXsZQBD5GjDpiowyLYwDG6V7fmI+22YZjurkY5WwwLajLJj64j5tXGMGLcLfWFfffAhGMx/eOi6A7uRo4WCPP51hM9h9q4VFjqC2qAdYeENH6+qeKwBXehXiVcAj92EUe/F69FLU4Oam8AuunOX7vTuCIiEf5RcCt6/I50lQka6QAqzMiRSiBd9v/1iDBOw8ZUyxCd6ZfgAEDyPqdCsYi/plenu8=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB163;
	23:DUEgtSNtbKwmx06Gt9Rx2aSTIah8mFiMh9/5ChuOLA?=
	=?us-ascii?Q?3vEbVR40cA5c1oLL1rwKcCspLkuy6PAD//d0Mz1z5G371s4O6j+bSZYNDUtt?=
	=?us-ascii?Q?TwjPF9JnQhvA1P46Fm718/qTixCyndwzCz6LuttR5rVI3bIANVXotkc9bp6M?=
	=?us-ascii?Q?9qnQw8QDPqyYEcwo1SAKR3tEP6W3RWU1kl/8n+iEXsjI+115cvEvpo9yHLYD?=
	=?us-ascii?Q?fiyWaLmC7t/oje0n/rAIVWOtiJ12AfOJSWQ4jgHBYirimgDOtRUuCUq89dz6?=
	=?us-ascii?Q?Znd/I1kGUrutQxzTA6+MRbfxCYAs8OLKI5/Yc/Wlv9jw/3ViBhFCAhjszpVW?=
	=?us-ascii?Q?7DafzhkIGtV5azn577N+7oahwJmRR2kwKWKC67q1nMUfr5fa3u+HmCQjEBlU?=
	=?us-ascii?Q?oR6rDXZkfnfeXfpIsOAeI5m1IfDvFZNJQS8ilYjAQBxzYY+uIc5CPi7LMMCR?=
	=?us-ascii?Q?Y61A+CU2LE374eZjL8SGSd1EV1oB2IY2W4LgDYsHi2+/hHhgZ+kzZGRoOvka?=
	=?us-ascii?Q?z3I6vX0k/7MKSaLfgT6yALnvaq84SkaF3RjCtLlJtVbfCHYfFzgFbgN24eJz?=
	=?us-ascii?Q?BP3/04N20AEJPUeoYM1p2quTFTXzcLjjE8OdV3XAqnN2McVWD2l1D7sTQVAY?=
	=?us-ascii?Q?443q3YwBKOWWfpThEWGwplH7x3Ndxys/WZTqdZdPfudvgJqI8H+Ej6n+XE/e?=
	=?us-ascii?Q?jU7SO6W0I5hNd2NcjuYsQaH1pyMuMoqLUXU27sQSWll4YKY/Wb0NF2wg67K6?=
	=?us-ascii?Q?/vcSC57p43XEZn9KRTls4RguVDVKJrtcupyoewcN8NHOOG73L7SgqK4wWLSb?=
	=?us-ascii?Q?PH/XjuaBZRp4pJpIANBqn37QjBrHGiFlWxJg6JP0vSgCbO1ssSkn2SEUhbT7?=
	=?us-ascii?Q?8w0W2+EjTuOhmXPHQW54ptUM/aWyHLyVuKZ4C4yo7eNuSsQnFsqCELDYBofW?=
	=?us-ascii?Q?mwXHroVr+d4eaoPhuTit4wejTFx8MFIeLm2bTDoBFXHZ6dr2JZD800ww2PYQ?=
	=?us-ascii?Q?b2qD6KIMoSr/va0Qa23ff1vFBjfIuxWXpePHwgbDuKj/p3RMch7kyqhrxgxs?=
	=?us-ascii?Q?mBS82Ry7pWLs1lbvhrYz1Cs0kCgqfgVj7Qb5og3tLjZ697sKbUOtYry/1ZBP?=
	=?us-ascii?Q?jgOVZoEp9V3bQHtkGAntLU17vHGfUL+TLipPQhT5KS7RCyF1HWWK5J9q0z5I?=
	=?us-ascii?Q?1LYX4anBzysqX7gjT6yRkw9w8Yf3h4B1c2PtoGWnLqcpvMSojjE+54FA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB163;
	6:B6D41jjJQ5LHbR4vPi0MNHQ1LgIWcoAsWIVZ1TaA1vDbb2pNH0Y+LUbm+5lL5mEWQw4OfbMA2Cfn7JpiRJlg2v19cJqd4zAQBhkBoozCmDFo9LNtRbq3pR303JF62GKOwJvlpDXlQD8bJqRWYN2nn/GvNM2MJNBLdSYjj4NDZA0U5xt8UxRAWLBd3iRy4iRV+dPEQAHznKnTAe4DPIj0+ec0x6uZenCzsFzYnh7/drGul7gEbJ7N4mcba8OgixJmgwXsvwV0Td+fe5+OZY8lwEP4ONrbPZ1vViXWucL5y3ZBPTp5YpZ/YZVqq522FO9paPbhG1XrBXgE9y0NKqf+KVp0NC5I8hDxfSrP5TXj17XK01zSKQ8NerfzeoT3wOz4buzW2y4IM2rkSPvUZ5fYaaSHz6S/1UZcftfV9zJ3PZTGUU21iHSKlytvXPXHx/8+4ROLF8E7mxNZmrYPmQQXjqVRHaJWfM+Nc3Ge6TnveM1rqeBhKEONzrSFTj7iuwzf9SWiCpqPwvZEfY0NGepnTg==;
	5:5neTiT+gCZOTj3iUVPj5aUNUvcjUm3p+dfYVWLqyll58OqUx9kyzOIkgGhnrH3afUWR3xZ5etskmktSfOcv42o4dvNZTyAPhVyMH/vFKnOu4dJaJHtOdmKEsRqNnzO3XYcthOseMITmdNssHltEnWyQKvwK8qQSesvZsG1wsHVYitJz/xzW7b8S3LBLozAk3;
	24:2a08yL7DgBvGyoHTwHC+49OPELmerwN4/o6kH4lqleJkoR2NEJ0JB24rAXfnGQyDDqkwE4pok0+5VCtRr8uie6NYxLA8JnXCUWEXCADRa3U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB163;
	7:Fxiov6AqzF+m6fnwuEc9wVHVGIOv40vJGTp3/ZKWXsqS13CpqMCmSqAibD9tO0lAKwTFElqJIpAFTQXgmXFEhCcStcW7QacFQZdMoKUBCKIZMtor2isWDhqfx2/Rs/WsL8wIWTCflS15twnrGqrkhJTeRDy1F4VtAh1+6eN2IasB8E95agqpvEt/trPiFG8/thhjN4SJ535w4rgzMfmPz9B4/4+NG0aAbSH2ob/jwAsDNBZnn3Vg365K4lAm7fF1aluB5YC0y4EXQrEHLsb50nJ5XxX/i9FE+DYveeWyWdym/2hJ95CxEiBIKd7MhkY5Tu+Zj5YOr4CC+LQPbSrv8Q==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:35:53.4681 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB163
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 0/6] Add some gstreamer1.0-plugins-bad patches for pyro only
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
X-List-Received-Date: Tue, 23 May 2017 07:35:55 -0000
Content-Type: text/plain

-Add some enhancements for qmlglsrc
 Some common features for qmlglsrc are added to make app development much easier.

-Add some enhancements for gstplayer
 Some gstplayer API enhancements are added to make it much easier for users to use.
 Without these API enhancements, some features may not be realized 
 (like accurate seek, video sink configuration) when using gstplayer API.
 So it would be better if they can be picked.

-Fix a memory leak issue in glupload, which is common

Yuqing Zhu (6):
  gstreamer1.0-plugins-bad: Add two enhancements for qmlglsrc
  gstreamer1.0-plugins-bad: Add configuration for enabling accurate
    seeks
  gstreamer1.0-plugins-bad: Add get track number media info API
  gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
  gstreamer1.0-plugins-bad: Fix gst-player failed to load external
    subtitle uri
  gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in
    glupload

 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 ...configuration-for-enabling-accurate-seeks.patch | 148 ++++++++++++++++++
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++
 ...fix-gst-player-failed-to-load-external-su.patch |  50 ++++++
 ...-glupload-fix-memory-leak-when-use-a-GVal.patch |  29 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   6 +
 7 files changed, 667 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

-- 
1.9.1


