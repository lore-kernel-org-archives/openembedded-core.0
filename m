Return-Path: <alistai@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0071.outbound.protection.outlook.com [104.47.41.71])
	by mail.openembedded.org (Postfix) with ESMTP id A49F577BE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vpuXnglguJcCXgw7QsWTH+lyb8N5vAs8mblN1tva5dw=;
	b=qn/tRT+lrOB/rD6S+nQsFv6pAm6hi3MtJtylrQ64TMyhwDU9tEHhHm9nCVzcX4K/a2RnTB7CL0ZiM3oiNEHeSA1bCftsr+8/f92PTbnBhUnlEaXCkf0ej9yPrZjh/YxRtd4QK8gGI3auyzaaIUdX6QeH3/b40CZQdg84l3echX8=
Received: from CY4PR02CA0018.namprd02.prod.outlook.com (10.169.188.28) by
	BN1PR0201MB0708.namprd02.prod.outlook.com (10.160.169.19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Fri, 24 Mar 2017 20:41:33 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by CY4PR02CA0018.outlook.office365.com
	(2603:10b6:903:18::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14 via
	Frontend Transport; Fri, 24 Mar 2017 20:41:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Fri, 24 Mar 2017 20:41:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1b-0000m7-MV; Fri, 24 Mar 2017 13:41:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1b-0007Sm-Jm; Fri, 24 Mar 2017 13:41:31 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2OKfKg9009611; Fri, 24 Mar 2017 13:41:21 -0700
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1Q-0007Ot-Ol; Fri, 24 Mar 2017 13:41:20 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>
Date: Fri, 24 Mar 2017 13:38:57 -0700
Message-ID: <20170324203858.27464-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.9.3
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22962.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39840400002)(39860400002)(39410400002)(39850400002)(39450400003)(2980300002)(438002)(189002)(199003)(9170700003)(8936002)(48376002)(9786002)(33646002)(47776003)(2906002)(50226002)(8676002)(81166006)(1076002)(36386004)(106466001)(305945005)(38730400002)(107886003)(189998001)(63266004)(54906002)(2201001)(77096006)(5003940100001)(4326008)(356003)(36756003)(6666003)(50986999)(50466002)(39060400002)(5660300001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR0201MB0708;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:ovrnspm; MX:1; A:1;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT003;
	1:uANBXq4+QnE5gnL2GKK9UEumdIBg2osd6+HLxlWuHFgaH6cxT6Dtyb/So9Qjo3mVDLqQSMytJeTO/Oh7iKGkeJzVAOAq16pBFqQBxcz57B7TFJwTU4en3VYM8dyvTiMVKA65m2zdn1/6zIeaQhDOYYwtGpJZweEruhKzsN19dNMwb7SKyL6PZa6bkRIzZj8iio5BvpxslWyoNamjEP9LLWHOaLkbOzgYP3xibUsPzxzB7rP326MFEr0UAw7beD66GSHb+2KjqPdYUpsGmybgshxNbX+1lJ9G5Wel0x+QiFSPtT+FTj3IFwYgFl0eY4pKxrmC5e2vq3l3sXaZ/RF4gIfZmVEQ6M2ouR8ffqZjaD2txbgHdz+SS5mXz2/bmVuAv7t/Jo7eexwaShsYorxZPWXfGz4mNJLZZDWzWJbBtpSlIDeDV4SAmuvn0/wZpOQlpMjl0me3nrs4VCg2mJDTcfBLLWpehVAUqlTO4r/f5l2+5Ywl//8g1qpavwK5odsQlBFJG5A73XJMfKXQgrUprzLvOT0HpZXPqmuWBMoVhzgF5N8kwbcLWdl73SFWMA5/q86s8Caj/htbDLMkwvBFiy96RETt1nYuCwuoRXksdzk27IqIPJ+mulHndjZyc9nY
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d5844a84-a195-47ce-d7db-08d472f6282f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:BN1PR0201MB0708;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	3:o2meK3m1rWiZXxBzr9X0qvLbr+OatIsPA14uIqRn09GEMl1BXrKzb1WgVTcZv9LGFo5u+sYX+5jMd4iEuAZYexnlk1gw389EGOyPALabYEFgUQv/f+LaM0CUvEOmsn0qbD+q/G9XQuY5EyCiZhhN7/+oONsiGloKtpqg6gJWbhnmv/XcUGkrjCZLjQE5TQcGik2ocmfGsqBc6ICuj6ce7lJGgy9xmM/o1aK9rXiq60e5dIqQQb3MbjICpmdIMJ7FnTdDfuNbc/5YErt6XhLYgHCHf2D+X5YyXMQPQRG/5s5qR/dPEvDxvjpCR0BPlVo27JuT1F/7gw+GViT5g5lvDSNnD2Mt9x2LV/T970RCPSffyI3OBfhvAo0we7xvXV5U7jY3d6J8TOdzTfVcpURXBgRZzf+GT0p6IVq0lEcsIuE=;
	25:13+BokZQXoYhJ5gX6iXZu4oNxKryb1yW0FvaAo6Wvc7aFF4oKl10XGL3rxMpy0mInlon+PrQCLwVTqOgytL0KTqlPdjQ6DymamX+GfRVaJOXoEynd96tA1fzcKWUJUPrlnlemy/ViWby1BqZ+O5d8imtC7Vc4Q80zAaPhx/XtLYGk4ZitMUT7BxSKNa00P8reKotTEuzNkrfZ+EwzQHN68mdu2dIYG+g/RH41TxAYhAtMMBJKpB9/yfLxmvVSWa/JMAcVN0xAaRQjwq9duC1MNTJFmNDAdT1Mfa+jgTf4Uu3tPq7v3cK73R6SH4zeOFzF5ZhjRzWS8p62aDWSFxNDROFsEBw5xiv6N+6TjpEklYr1JSPFQYpwiClJa8D1Up3CMuZP+l00GMEgoPDUBl8xGsV0YshxB2n58+14Aw8AjbSNGbw/ztD8qCgwTdXI3m3Iw0QRo3Wphndw497qSAfRw==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	31:w9fOrr7251CKf0sjKgGROId+aBGm0d+UQ/2lSzI/7Swa+4sxNTVRqP3JNTqS3qSatfcaRS/GeuAMiZANm1+s2Uc3qT0nF3rAW/wc/h7VieKfAix0I4Qx5ReSVJjhM06GL6VeiAt+EI7+DnWbx/K3YDLj3PNWh9k79T1unQzYNsSx3ptu0esLmP9eo3NOXxa2WY5F4mNF0qxMdVNdSmd1CXl/VQQc+1nHfByyQvIQLo3ZODEm+l8G6gKEwTLJuUe8JNYyWP2IyT8pnrOozPNsVn/3KsYGwx0+eHcLXyGlkOk=;
	20:fbmXnt6zwSixLw7i0iHslSKQwU5TACgf6pXbHOxuaFnyuivhwZIhw9x+HsLwmk6TP8J+xOg+V9oDYrcuEOQQEFoLJzOgX+pG7+cinlH4V+xDvgsJ47/2gKt2nrn7tMLZIosIR7ZH0uStYoziZoGS2dc6N1jKOy6EKfIrro0otupz1/M2FAOAIEkKERPVkvpenv3bTbLcfOJZsLET41zDqiMuSoIBrdI+qU3B7U022TqO5Gkcx4dvQpxHdHZCxuQUMJC3gH4l38oD46n4AErs1tHKjx/RuRGPigQUrdxcL2JB13ty/El+cohTI20iIm6zy7uNKZVP1k4yKb4nE1GN3uBse2NGi1TiExg+L54HhlSQxGeDM07ncDBwFCQcDk92p766O8wVOznKwbUnIqreUJwm15jXwSy0cFNGpHGSqq2Vu6exH+8HgYm3Q1h3GD1kxfNoDwHeN6gkL9602S4jETsvbdjt1ztvaThc2yiaRINotmn/U6lKoRsQDsGuFHVI
X-Microsoft-Antispam-PRVS: <BN1PR0201MB070890676CA9496B8AD5DDC7DC3E0@BN1PR0201MB0708.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(5005006)(8121501046)(13024025)(13018025)(13015025)(13017025)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123558025)(20161123560025)(20161123555025)(20161123564025)(6072148);
	SRVR:BN1PR0201MB0708; BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0201MB0708; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	4:2BjBTaYNtn9v12gJ71NtnGdeSoHuZiJT/tpIeMHQgXrPZCXb8PvqaBfB2HjhbRXOEthlgDh6TziuFw6hnSeftFgHLX1YZCqo7/QjrVBQmytFhNRS+TTc7fGBzl1QzbzxnGVFYSUOOcn6xnIjfxKYZucI2Fy85HmpxZG05ZLvjsZDnDSHod+v/aHmLIEVxX1PoRAx9m2B7lYukVzlJlQ56f97QqnW81zEXp/gsm/nSRXWrfxgemLlYNKlV4Ka9CIee4I4Kf1PkK/augMYmTT6JyQUA9UfVOtqNXQIlSAlT/CTnMalDAjdmSqFTgx+lt4dU4dCFLc7Zx41HB63ZmQ0Mtig/CqbGxVKRqORfA4YQ0bRNslCjXQRL/Dtlj1mi4iETzshPp83AVUIO+/SJLwp6G60MZJVRDn7pkkY4UfSDu6rFdfT/p5atOOuHxQPh2yVsnzFQTzqTpd1k/5pywjYzIn10TBzC+Ncyj/USEGkmfMPz53oh0p1X+RahL5qnf5lpRUFylr4Gxq43HOcF00ou7O62jecAxvYYROS5ygw9748Sq6CSiFjkZHb++MnQLgwtCp9LOApZxuOYLaEPV8I1I+VD2bEF4gdfP/+QjkJ+VMnaCmdGfcBeQQWl5TyQ3okcn0xFqq4FWbolikpDF2/fZ/ytgTNZQei8Gz3ljNQ03YpSZNz6Aaz+ZXDa2j7LnzaBYxIKOwV40a1j7nQkNjvqxobvZcvYsFbGR6k27apl+UdEVAsVV17T8b1bqtFzONs+p0IF2rg1dxf+VB0IIZ2MrjrFccozfk7wwKLyQP5SIQ=
X-Forefront-PRVS: 0256C18696
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR0201MB0708;
	23:UT1beaYlSCi7qr/iE2ZeKqbldTH02mMZACDa/rr?=
	=?us-ascii?Q?m04Z5gE3GmBi4ndmsNZ5K9c8BeV0qLe/r51rvSTs8c16JTAhzKermvsrJkfR?=
	=?us-ascii?Q?fl7TsNs6PrI1ztk6pdwDI4arsETHfAGyFH1KV3rl70biShbf1UWFc0U65mWh?=
	=?us-ascii?Q?3NXrgehLik7qeKWY+Rlq6nE6EcdwLm+ArUdGcqgc70vEB6dLu2+htmZLEoqY?=
	=?us-ascii?Q?VGZimeTGfoQPj3UeR6SUlNbtRfaeVoJ92ldK6uV4A/GviJlpiluWFg/NnzpJ?=
	=?us-ascii?Q?MSsiCUArZlZPNt9/v5ML2iMRfXnMzP/xUkhTQJI0v38gzZk71kgV2K5qAq25?=
	=?us-ascii?Q?J4zGMRTLjvMaiUCOVK9ZztSs3E8UcYSL7scrbLcvrnbTn8+7B8ZfU2NVBxXO?=
	=?us-ascii?Q?p/rgFPhmjxBrTtb+R78oOYJeshNO9xkq+4C0ileG9cxisZjEYwLi+c1XuWK4?=
	=?us-ascii?Q?xZjimD9dRVCy/h8MGYKLRj6XDojZrrSL320dJBFCu9Zn+s6dmKBJwJuXYHDm?=
	=?us-ascii?Q?sJOsjHiIGiVepbcCfT8tVzDZ5yT23rymAU84PrJScqzcuPE8pIWBRjhMenlJ?=
	=?us-ascii?Q?ZExbP1yGW/NsAzBjshEmgwB+D8muCn9PojQ0+DYkEDzS6D3Zn20Zywr4JRNZ?=
	=?us-ascii?Q?G+YswCcFD9s2Z6tSqRHI/5PrA42rPHInawjndd5C4V5K8ybFYpwJnqS4gSPs?=
	=?us-ascii?Q?Rp5rb5CcbH1WHBatLyPhu3czkeri3LegZ+sYwlzQMxlzwXC/xDSW5yQy8vf5?=
	=?us-ascii?Q?ciDetOBRzEj6sZSodtGRqYxwaINb6kACw6HmXlOfV9xSqRoOooFQxygbAN66?=
	=?us-ascii?Q?s+b0SsO0gHRZmY5LK1T7/Tzj6gCui+d5F8QflsdxL2jtQJEM+PnE4Gi/HiuU?=
	=?us-ascii?Q?OwTtpZ4W7ECpPbO38AWv6n3UUB2U0C9FDsC3/1BqIxgUJdZEmgsoNLI4KayC?=
	=?us-ascii?Q?xb6KpKr+qDDXiyMMT4779T4XtUzhHlbCCiywGKjMig26EgZtDn+YaeHzjfYk?=
	=?us-ascii?Q?4EhNColXBrr1xKfMVSKdFBNVMMThIITJs71XmPiOIjfleTA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	6:fGOuvgyTydjhVGKmlvCsQsOvxs8KLa+1clxw9mJhARfREL12alY2xfqNYjroaIEGWQ5Ed7WT9zJn8PYBAc8d2PkJ3g/F3eJUt+lPbNLFIis5VP5geE9C+v6qMZET+/mSMatHdQR917AVHH6IB54qeRrVPfUKJYGQsRHnd4B8ae8K3qtE4yrP+T8N8JIX8XaiOTBxwzCh/7R9x0nQhpwoUtYAFgQPQyOgVpIXZj5yVtMllBqtVyPaVpuLb6652LaQDa7OZNXy69myoVSIqyPNhLUFNwtlXn67jI4Xcd9lpHJSKlRH0U3sNOcXew0FAA6Jeq9cDIelBAjV4y3vMG4Qi3Tnd843gPY9NCs4fWQ/thk/vzEcYfbo5cKlFplqAD+DhvyXECejkF5MPCEES6PPmwgKe9y7UBeDGGTeVVR80vE=;
	5:lCEgi+mOihmF2fpj4Y+c7pJhqatAwlzkExGU3Is14EZdWyuvNCU8uhzd6lkPOnaK+5r7uYm2PMxXjxLO2rUG+9jdAxfhcZGp1Y7nsMcGTfwlGB+WiS2X85H8NEI1SdwuPYHmtUFTI/ZBMUqjDmWrbA==;
	24:9CTtg22neinlOUETf6FSjGY9YIIYPeKYeteQdlbOyKdTCskI3RbpPLctTs8rCoSHFueFPSCz7cHhj5uwb0FXa2mWgT47BAIRk5iwOyai6TY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	7:pTJlRUZNhTYHWHn1GccQv6BNwkAScCM3lF45mAhe7qBlbQbxhfHSRLaP8h5qFYSobeLe0n9SZK+7WMvr3Rqrh1lLQfjNmdTjuvZn2vwwRc89qbPCdYipaymIyhJfwgUKWi7x+CaUUHvxCQNGYItX3D/e1vUYo0lLKl+bitAMudECuCj+95tF8XTM1bEfhuyXXLPoIzorXgh1BcuVfu8QXHK2hhNSCfWzzc9XRCfHcR7LIx+sprqlEXGRqkWHmP/lU89gdKie0anj/TSn0kkcUbYr17oEWvcPOZJMZ+sC8EmeMnF7ftfwXG4daN/6uJI467MaM6+yF9uoZFRDsY78sA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2017 20:41:32.5640 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0201MB0708
Subject: [PATCH v2 1/2] runqemu: Automatically add a TFTP directory for slirp boot
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
X-List-Received-Date: Fri, 24 Mar 2017 20:41:34 -0000
Content-Type: text/plain

When booting QEMU with slirp networking we want to use QEMUs TFTP server
to make the images in deploy accessible to the guest.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 23c9efb..f76d976 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -832,7 +832,7 @@ class BaseConfig(object):
         self.kernel_cmdline_script += ' ip=dhcp'
         # Port mapping
         hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
-        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
+        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
-- 
2.9.3


