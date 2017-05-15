Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 923 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 09:09:25 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0049.outbound.protection.outlook.com [104.47.42.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB50471DDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:09:25 +0000 (UTC)
Received: from BN3PR03CA0115.namprd03.prod.outlook.com (10.174.66.33) by
	BN3PR0301MB0897.namprd03.prod.outlook.com (10.160.156.14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:14 +0000
Received: from BN1BFFO11FD021.protection.gbl (2a01:111:f400:7c10::1:148) by
	BN3PR03CA0115.outlook.office365.com (2603:10b6:400:4::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16 via Frontend Transport; Mon, 15 May 2017 08:54:14 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD021.mail.protection.outlook.com (10.58.144.84) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Mon, 15 May 2017 08:54:14 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gw005326; Mon, 15 May 2017 01:54:12 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:38 +0800
Message-ID: <1494838358-28036-7-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120545192503;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39410400002)(39400400002)(39850400002)(39840400002)(39450400003)(39380400002)(39860400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(8656002)(81166006)(8676002)(2950100002)(6916009)(6666003)(189998001)(5660300001)(53936002)(36756003)(6306002)(50466002)(230783001)(2906002)(498600001)(48376002)(77096006)(356003)(105606002)(106466001)(104016004)(5003940100001)(4326008)(85426001)(575784001)(33646002)(86362001)(2351001)(305945005)(110136004)(47776003)(76176999)(50986999)(8936002)(50226002)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0301MB0897;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD021;
	1:hT2XTWi+rNyu3a2A4FtKtSHywpZ0OEhRAEc0llGXJJGgRTgBnonAoy47tnJso7lpobV3wAO0V57IqKYEcvj61TPUj9JB6KIQWn/qZtuXXmslv/onsCT7wRNYONF/SW+r45ikTdit9Pdoz78IejF7b0cV9Bzs3s9BfRrS5Hb5ZgLvUEt+w8oG1MTA7POE77ChPcnVl/UBkyzJOMv6nqYb6U5ZPt35Qp3+gFZbKD4+5JlhEIIbHckd8yJleUGdQQLJwVo1vESO4mQ3PGFqhWqFWGDXqBABbzZi6u93ZXbc4UlJKI2G2fsZoG73xjrcSn7EZGPzhUFcrIdImnu2CHDGrNKS0cj7h/p9XIuiuo/3gPocewmPjuilAYYCQvwLupG+Z1c5o5mrQZZYKaQdhSMjSQ7qJ1C4yMDAhDHS477yq44au9wuIdWxkystxKOLzt4rJkjPH75bV1lBinbTad2T/L0t6FPKzOv5iRopa03tUeyQqBC3w853rsvx/agXjS+6AY8kUbBS0JVeNqCG+E3xzBlpuMcpmUrZziCWLBGiXD18J6Lf1vSiY8kWzXAfkiANewlHxqMSif979321M5rW5R8MEZbDBwKxB/ZLq9VaGRp9PEbU4wyTaJADyjkhgWdjIHIJ5l0BAbYxXNGrLA7VvDZWLph9eU8KFRd0rjZXTiYyLzMeRPvyGtovYhMfDMrcZRfVduMZwIgl+PycERPnF0R2eCY+QgLBkdvc1e0XL7k=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00482f3f-7204-4e84-58d7-08d49b6ff67b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BN3PR0301MB0897; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB0897;
	3:qWU1faSlYWBTzBI67/4OpeBnQfS/dMGD4gio6jvLJOeG4R9XwuhnRL3DsqMZf8q9atVw/0osXv2p3pAJ/bWJQC8Agna4z98mcNlY7A6Ycqnuf6Qx9J1Km2TPjsQDGCgHn3sbAc0ZyQDyf7PLlUh2dhjJ+9YyvQEf6vTh+7WVGzgMoxabd+tzeQIH1cy5Wqh4dSNVjZyLIEqvZ57f5O8/I9ywb+LRlxf1cUnjfBWblZEUC0sPjYsG5XPAFEio3VcIddOpcqjtAOagPr496w/0e1waP+tIv1T23WmGNwbHu/Sx+Pi3dLoq5/9ySDCvgb5N+z/V/zne/x0nO36ldbhh3PePovQ+/mAcxZbAHKVkW2nK0bkeecwYiQfXJZNLxg4KAguPjLxGCy7lw22hkegRW8PtIT2WckPJageVNrBeeUb9CW+FL2CKa6W5K8k7z6hK;
	25:Z7VFTd1b4QOq16BdDGFQwtPWP4PlGD7Xrf6h0xk/fH+PfIHS3qau9ih47LbGWh8oEM3tTxJZJ1shbhrxOpQUijbmldmNOmwvne9hhtc2qAEqHlVND8zuZiaDAvfIwWLSPZVbuWCFqDrQ3Beegmo+AsH/5OlgOOqOM0te19uT5M5OBDuXTy1HZZyUI3y+tOqF3d2kxCyigNKM7YaD6WZ08uI7xm8Fj+5SMcvSc0jPzLz0rCvuvcrz5Kv17zPjgARnalHQwPZk0ZqtpZFcauBfLoh6iHEMGPjBXfnMpI4UMDydTssE8eSI+RdMj0FKnUkfoWT5OKsqP2q6i2X+HXhjCjgxuMhz67eESq58jejSNFoqRFyMOziZp0egUziax3N1WKJRQJuN07C/dzievbHcrvoXM33XUvtxjszUMSJmreNFIOdxH3TA3PAC0zF9jRrYkIiRnA+hIk6horL5JyPK0g==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB0897;
	31:CanP1caEuM9PE9FQiwimPGphBKjy07kFcu+ClleB3FoafGX5a3sULtvDfv3BS3RSkbugCQ4SWovsTd+1w7QbU2UHmWmK9KNKvQgNrTzMXfOyt9DR2YtWS1DOp4KiokJQRW1ErT36mCiDtQA+5ysJQMtu1Ik+HKKIkyIgFGbfYLVooxMavSPND2Qoqo0ujgfaMVvspcxfdmWbDaM/W/QTqkDENCHdy9Omg9NcJqi9QejcJOU0GzS4SAxQBffDk+tE
X-Microsoft-Antispam-PRVS: <BN3PR0301MB089742704F9B8036E5E2FADBE9E10@BN3PR0301MB0897.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(8121501046)(5005006)(13017025)(13015025)(13023025)(13018025)(13024025)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123563025)(20161123559100)(20161123556025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123561025)(20161123565025);
	SRVR:BN3PR0301MB0897; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN3PR0301MB0897; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB0897;
	4:JcXaDhMtm6QkeeaPJGgNjG5dpNgNt5TAuzkXYIUG?=
	=?us-ascii?Q?PXuDEK70ZvG019twGbNlVKZIWteDKcv5Y6/dK2MTe6OWCNdJA/ghkY+ULFux?=
	=?us-ascii?Q?SeZjaFH2Zq1Wwi4e0aCPz470jBHZny8pUsf5lGsAkVWqF9OsclgaXwaV6hzh?=
	=?us-ascii?Q?YgvlrPWwkHxKH6Nv8/kr+AKXz2Dx5FtGGAqS3FUzg5HXm+uVKQfdcodOl0T4?=
	=?us-ascii?Q?ADtY/yuRsuGPdnEigGp2hhfwRZL7edSuKCerzQlmxZKr/3cS8OgbD+DfVIcx?=
	=?us-ascii?Q?iYS25fm33P2sgf46XWDcjG764OZowSn52QaFQMz+pAYCkvCAcn7jHjgR4Tvd?=
	=?us-ascii?Q?7lS6rl/0CWk2r2ElflZuNvZwWzzMvAf6UfC/teAjOxyA4fsdYnjWMIqwhKgK?=
	=?us-ascii?Q?bR49XOmNXUQjzi5+CVPAPQFO5A8BKta8mOUgCQbc3cWye8lvQH3vME9pBpDg?=
	=?us-ascii?Q?kG6nqftzddTmRUHxSlGdtDSFTWUAdHF30+mZT49+vyR6WtXknRZlXu00/UJ1?=
	=?us-ascii?Q?KOPwTBuq6ThBLgcQeHhCSHj6rU4QbD8qIJHQFhIrCgIWZtsp539aKEaRrdu5?=
	=?us-ascii?Q?8ivr+hjD1b2JVh/wfb05QeytILJENS1kTbeSRl/967vDNh0Z8/oZTF6gK8as?=
	=?us-ascii?Q?/WOCM2glITIr/86757nMo2+hZETnL2vtbkiEJ0zAahaMwquT+8P+DMJ39cuQ?=
	=?us-ascii?Q?nXO/ohcJ1qpk6sEk5VeogCKccXWYmMGMpqhxSbDACD0Qyf5gAa2QmK6RL1w1?=
	=?us-ascii?Q?7YWjM3XgOno48dK2XtLfi3jcpbWFz7DrQaODyww5mpR8zORbJSkhS1/+47P6?=
	=?us-ascii?Q?x5cp0wGerf0WAHE6ufBBVcY4EEeG4myyuyHj41+rXpRRPVixhIQa/+3crwsM?=
	=?us-ascii?Q?iNqx9t3rkDQQfrq8+icG2svvDRFxtYMSuPTSXE+ZWaWOOY21Yq5vvb3wFPMd?=
	=?us-ascii?Q?88/3jvkzRHuSVkCNH/TTY+8CNvPubpvN1rzMKyzy8w=3D=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB0897;
	23:KyoezMyC08d/ekEcUSdTFP5ho3Q7+52ZdXe+uup?=
	=?us-ascii?Q?Gh9BtRhYCrJDjQ35khkUo0N1i+blfZVUXEXJAsum1QTEn5Lj27rEPeBmtJmx?=
	=?us-ascii?Q?QzKfjTYnhdSixAsgEW+zI9IpvIfuY8jW6Wk5uU8N0qxEnZJvfPnGG90Kr/C2?=
	=?us-ascii?Q?JF+ON5rPp2UNlT3Mi4hUWrx7G6xKKExcPLPxcOk3gFcdj8IthCJvM2gvKfun?=
	=?us-ascii?Q?EGiEILxAd2wjoJnYfzcYc9+eXRAY3d9FMSJvNFjSkSTzb49tKWp8lDFnRMFT?=
	=?us-ascii?Q?8usTEYEyYtjiSMWopirVZstjlVxoEXCt1G7WIjLcVr7rAXo9Ch0SLoVpSWc7?=
	=?us-ascii?Q?y+T8vqKbyS7+Zq6bFZNvovh3YmHbgGNY/DUKgi9f9uLXMJn99YZPCNUCaXEV?=
	=?us-ascii?Q?pagkQB2nymdVumBDNc5ClYvhZolWkAErxc1xfrTHbHrd3xah8TIp7rPD9LPX?=
	=?us-ascii?Q?w2qtF4nhfA6Bqdo0OaA5KH/uC23KDAZglxudl+cEifJ6M0sOjPrkiuSIW8bj?=
	=?us-ascii?Q?8MZOekvNXfkWBsEHDqqOFKsh8gbnWF3vIN1HtfDL4FMO0EHJQLVQHBYgLjiy?=
	=?us-ascii?Q?kCEO7qd8mhQfExtk/GYWg+9fvAGNMxDgKGvBSJZf0bCksiZrUqWlGdWVSTo4?=
	=?us-ascii?Q?bRcmWFxjtXLI6uAp4+1GjF3mK8cDRI23skFBxRpbgXqA10uVXcixqd0xvh2V?=
	=?us-ascii?Q?wD63bzXPxxr557j/uc65R6tiNZelVeyQsfLSWI6UfDAvWJTsDSvplIi70H+F?=
	=?us-ascii?Q?zp9BuBOeNFq6OEgoNxEr8v0h9qX6Zt97ShIIIZhE7Xtk6aqWpoS1gdd5RF07?=
	=?us-ascii?Q?BNk0gUmg1XYsinpMNDOqlNoofmN6rj8EN5PMRcrz/O3Xmy0jGIWBoS4kv/b1?=
	=?us-ascii?Q?LzJmJJ+Z+xFPJjrXxZr/hvM39jN/TUWxluNpOhSFBJuKWycxJh+vn9k/gsLG?=
	=?us-ascii?Q?abEBgtSpWjhTROuykAt7ghtdcK8xuLwtdeFziE2ZZFme5XsOUIVN0b5LzyQz?=
	=?us-ascii?Q?03iy902KBzvl3PX0FBN6otsRAkK+HoBwwCmmbFe539FQfyYHJ5Y241tIb/XE?=
	=?us-ascii?Q?3NkGvWwyWDEkrGli/Lj+t8h9gtf44Lidv59zUrhvDSpVvPvl950MI6Q0DuUg?=
	=?us-ascii?Q?Xs9C7adMxQy3633mucCON2QjKjCadVQTeClcL4AJVWRUy7mFHSfIzG0dRgjv?=
	=?us-ascii?Q?IlqeM2EgDbHKdGIG7djps061EFE8HAxOq6Bf8gx3j3+aLnHiGvVeiOGuq7gi?=
	=?us-ascii?Q?5U9iHv2PnEvOqXQ7IiNk89FU2itSFbtPTZ0rRyaMp3boVt0jmMwqRr+LD/oD?=
	=?us-ascii?Q?gig=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB0897;
	6:AtoyE0VHJ0FpStH7PjoWSXg71jSyikztEAYcv7vM9zzsmAAVc8GKvoH6bbl7U6D5322pr6iLmX/vA1OOmCg1NL2z6FCywZA/mxsLV6ekhWWmfsfb4uFiHShrpIMxmeKAeur8ZLZBT281CjrcdDAj8XaeYx+0+7pOdPL+M8rRjxWqBO4JFwrW5Ur6a8P/DY2NThA6BcXJcr7zI4RVDDzr3v59NuvnrMplllheGLachr1dpVRq+rg3OCFHAPgZoEfBSg1f/ouu0M2O+F28i9nQigVJAHZy3bOxR2bJHPitKeLqFV7WmXJJXE3DqzA5JLfdSBnKalhMIQoy4CjlkTjFwHXLRNowK5ee3Ay6DD3U1i1ex1Hq9URd2tW1LK+9TD7wCQ1nQwq7vCXr4Uu6Ay/UZNIXmtLN6nQHWu/qk9bcf+mIuWWabaoiJAmugd4eCl7OApX5GkvoHnJ7xZr/y++JmFw3Nx1t74WYxNuvAKukkku2UQJIs7Ai+tARr5bhelGvlKyjQX8748AW5Fh5lOE+Kw==;
	5:PdkrKaEcHzRRybwHoNA1rK1fUmUgT5ZNFctlE1Y6H8mycTH3AA9+RoXnlhSRx0qvT6qume/6AMSQKWdNwL2M08dgZ1EWMLNR4FvA3drPICyLsKkemU89JLup2W1RJFi8BiqgphZQ0NOQYESOpPuyzLR9QJ4b29UDWnhpvDaSHh0nPtU+s85KOpJRxEV6aLQH;
	24:dugpuz4D3luPTFYW+QkM6aELBKhtsp+gR/9a2zH4YvkUucK6VlgL+7or3e+e7dT97tYupUK/RmgemdVtbu2ojFVR2SQcusR/E9HcqvarsEI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB0897;
	7:SAt94cNMRF6hMwAy9muYTB4n4L/4ZlW5FSN69KUiUeKzb7rLC71ruS7DqggwlpXyBgfO5pOz+IYfU0U/GdxYD786jcrQvNlaGtJzFEjNaUWlOrhp0uh9JQL11bb20HNBifvXy46Qx+rGvpn+Z0S/xZgKjZIDmnoQZPcBR9QMofwDmBfqjQxKKrlVYlalX2Lm6oKelnALF9YTPMJxyh6yu5brUCSYY6FDRhmd31GelcHIw9Kd/MTer4eZNFXPWXXb6j7pfFtlQMBUeiJZbCF5aVMtQRd6So/AZ1qW4woj9TBCv3tTX7MSOZZ20sLOydwyAEepsNoL699B5xYxx/nNzw==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:14.3320 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB0897
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 6/6] gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in glupload
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
X-List-Received-Date: Mon, 15 May 2017 09:09:26 -0000
Content-Type: text/plain

GValue "targets" should be unset after set to caps
to avoid memory leak.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...-glupload-fix-memory-leak-when-use-a-GVal.patch | 29 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch
new file mode 100755
index 0000000..fa98405
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch
@@ -0,0 +1,29 @@
+From a3988d464c89742cfe8fbbd570eef5e6ab5159ba Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Fri, 28 Apr 2017 10:21:31 +0800
+Subject: [PATCH 1/2] glupload: fix memory leak when use a GValue
+
+GValue "targets" should be unset after set to caps
+to avoid memory leak
+
+Upstream-Status: Backport [1.10.5]
+https://bugzilla.gnome.org/show_bug.cgi?id=781876
+---
+ gst-libs/gst/gl/gstglupload.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gst-libs/gst/gl/gstglupload.c b/gst-libs/gst/gl/gstglupload.c
+index f33a696..3ef3b19 100644
+--- a/gst-libs/gst/gl/gstglupload.c
++++ b/gst-libs/gst/gl/gstglupload.c
+@@ -179,6 +179,7 @@ _caps_intersect_texture_target (GstCaps * caps, GstGLTextureTarget target_mask)
+   target = gst_caps_copy (caps);
+   gst_gl_value_set_texture_target_from_mask (&targets, target_mask);
+   gst_caps_set_value (target, "texture-target", &targets);
++  g_value_unset(&targets);
+ 
+   ret = gst_caps_intersect_full (caps, target, GST_CAPS_INTERSECT_FIRST);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 91e1a51..68f78ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://0004-player-Add-get-track-number-media-info-API.patch \
     file://0005-player-Add-overlayvideorenderer-video-sink.patch \
     file://0006-gst-player-fix-gst-player-failed-to-load-external-su.patch \
+    file://0007-glupload-fix-memory-leak-when-use-a-GVal.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


