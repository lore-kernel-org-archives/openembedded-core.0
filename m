Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 1104 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Nov 2016 23:53:20 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0049.outbound.protection.outlook.com [104.47.38.49])
	by mail.openembedded.org (Postfix) with ESMTP id 96E00719A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/9aOywPnY27L2pJU0J03KZ5VMsRD6IGN6Zfvwv2Zhas=;
	b=3Er0C97v9GjCl2VPujecisHX5OgXJegtqV3Xajzto1OcWoyprc7QMLtQdm6Uk80dYdWcAzV/wGLrMsUYwI7FBD7LGLuIG245+Ok47U3zBIR75ioQmpqMTUc11OzINXDOWl8G8IbS9HsFGEH60TflEkI2+a7dcqoa8lOl3N9qK4U=
Received: from MWHPR02CA0006.namprd02.prod.outlook.com (10.168.209.144) by
	BY2PR02MB2006.namprd02.prod.outlook.com (10.166.109.156) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Wed, 2 Nov 2016 23:20:38 +0000
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by MWHPR02CA0006.outlook.office365.com
	(2603:10b6:300:4b::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.12 via
	Frontend Transport; Wed, 2 Nov 2016 23:20:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT020.mail.protection.outlook.com (10.152.75.191) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 23:20:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1439; Count:15
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53085
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-0005bR-HG; Wed, 02 Nov 2016 16:20:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-00013e-Dg; Wed, 02 Nov 2016 16:20:34 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2NKPa5031338; Wed, 2 Nov 2016 16:20:25 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pV-0000z4-Lf; Wed, 02 Nov 2016 16:20:25 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 16:18:21 -0700
Message-ID: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(4326007)(81166006)(7846002)(81156014)(305945005)(50226002)(107886002)(11100500001)(356003)(33646002)(5001770100001)(36756003)(2906002)(87936001)(8676002)(50466002)(47776003)(48376002)(6666003)(77096005)(36386004)(5003940100001)(63266004)(586003)(229853001)(106466001)(92566002)(8936002)(50986999)(189998001)(9786002)(5660300001)(4001430100002)(626004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2006; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT020;
	1:k7h5adS8jmprk361hh037aYJaZfiPQDT2gL0Y5QovlvAaAyOFB7sKek3Txlm/8xVNNHFfUEzXPRilsyB5PbmTXLidtIYT9emXgT5LRsmSTljqJGy8bEyYXRjz5f/Mq9ljg1CJO+bIljnq7LIBdArvuWrIqULoHm2HvryvppW8VxtmSqvntPi/ovEuc2osVeGDnMn59+x4RQ0Agq3kpEsN71NkUtjX568urwVVfD4ROiQClHNsaaeXXfGh8v5lH0zixpFA1FoqP+9P0ByUWBB2rtNN5dTK7eDbF/gp3LzH4xgY/xHRVyYtWwZHztQwb7xFPanIuHLd2RQEHNnpT8sDqKE41lFOMysb4N0GP2bYw2VCELyOsCreuXTJ4gfMLBnt7aM0tpwg7I5Pwi/WmRvIeCAnJb5lWT9K73eek8eSRm0cAyhC9YIk85nxpB95zprmWiC3m8ZPMplujde6/0w3VpZZaNS3a3KJz5CpwoWpvSeu/UzQvwENqEHl7W6+457+KPd7Y+Q9w2U5EaA4TEffwFejARsbVuiy5rdHZ09IYES6yMK86efni0FBWb9EDSdN4h0HRF9psFAADXWqETDDO1B8Ww2K8cR9qn2r/hRP2c=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: bd88298d-6a7a-4a9a-e8f6-08d40376daa2
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	2:uzWJVWupso9t2ZorzeF0odw8K5PulVP+Fe4+/HA+v6P2ESRq2tL5lX8n/Qz5PF5EzGBYZeXcWraumlg7vnsz14RkZC029ik5SBObeWBvln7ijAbjsNsnY8XLXf7i46YhDQ2nqcOhRkXfnDOjaVMdaN4S79MRxuTJyok83+RpIv6qz4/eUpZE8+acU4gHPmNm0omPh36mmkb5+Y938WL7Fg==;
	3:tC8oq95jlkDrBd6uK7B3bSf+/jck00Wij44FWuOqyWXXJvfTmRxxAiD1VdiFoaZCV0bdf1+FpS/L8FrUDDhij0/g4Z/tiP5xp2bk52072GqS+MjvqvciD556iH/R/DLww3NbWq3eJO/pc/e9/MoJt131DOuPPnJ1onZ/NkbbAvHvJD5ttr4/832Wwre3GCQ/zP1LGoV4g7Td9tHShtSw19QCGtw/V7CbXY+hVdg4iiXeJ/YuFmAmOi6OsGWKDmsmqo5ANu16S2XxF8yqAuTm8FxuaRNleABbv4IsykbM0TY=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB2006; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	25:Bh1rX5ZvbHbbmJYBveZBhQK0l+fCIpPqJQ1jVHQU3XAbaSN0GNXDAyZtS9+vkMCpqTtjWjbJstcXCDcX8aUdEWaaML5c1N17FBssKqua9c7q0Cd8LMJCIGn4Dr0tH6dBpsH3WMLi9D0MaqdalR5gbM3fHXBKbZLuuUkGBWeXExgX635spiCKdOpdSdT98tQKOxj1F6ycUy1F2vzI7xdrLVNinpPmMOdjPIXifSHWL1gZtzq3F+MgPHUHpdC7MuQWYoGn+bl2imneiVzDwLLZc3fnezbcY4GjGf7Lezb4ybQOmh628VRV27IQxTCqdEMamOSZtcKBs+aP+gd59QeJadxczJHNJNlfUVR1WTXpOpcd6AqFkrNx4DcBqrNU1Z4LKFVTvEIupZ6o1dQ/KU8H+IiRJLr/YWILrOmo9mhBS9srVGUaetV2tuUg6e/7blks;
	31:znF3tW8tSWS9kvJg1w0ioNz3662kiZ7NRv/xTTxmgmpQ9DAdjsI5DogN3doQLc+bqTB6oklLxpyCe0N3kJsCYem3aRCKtPjkiiaN3ZbJwnHegD4P5OFg43PZSXGWt9UgeBgDD6mZPyt/aBqw3k/9x7tgp0dqiCcDfIzkbrPtizFQOEnTc9DDXq2Tu+ju197OlxALVZuHMHKFGiceoiI3nQwrk8tCv0fLPRjA9ykEBC77qPG5xm1RiWDnclvECEmfSq2sS/8fBVTgIvfWlBmoUw==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	20:7yJxcANTv6NB9obvdPcJmnFNIB7PHQ/aEZTpT3evX0yA4WbRRUDG4eG34BZx/GTtW49IO9J1FEOwryRjSA7lk+fwoIoiI7oE6GFrphRRhblxkQgatyTYo95ilvvDYalbd/GoN3712CHjWEt79xRkVKH+BfIo41Wr6QqAbA1QfNUhRINgY6sqn6G3+F/AqyVYiZQttGkQ41naZZD8ZoHtBBgVn19hTttaTEAd4ZUa3AGBMBLNokkPQdw8GcJV5ShAIHk0zKjMRXi2v0pDG5xkm4g5Ob1Vbp9HXEAmzylKXy3WIpfNLLMCpruXm3axghKgoryQAHizTu42uv70TN4JRE0ijSC9KmdS49X9hvkKiqVnqvkyc/YUfYZaqcT/c7cL3Wch/TlEXEpI8Md3HTNTPDv8kNZ/yl1ecWj4SYfDxUl4itjgzNGmkryXn0znjMtPe6ujqvMRA4cgSAR+8+szmxKYrXU6kDxE6CkIJzlgqZ5eVoY8qh9wNL0OjnoE15NU
X-Microsoft-Antispam-PRVS: <BY2PR02MB2006832C6E060F898799E048DCA00@BY2PR02MB2006.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(5005006)(8121501046)(13015025)(13023025)(13018025)(13017025)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB2006; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB2006; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	4:5Q2bZS4hog3nNE2zgvHq76CdsNLRRSoEdoF1YPlXkrLp0lXxWuIW42e0SS3gE06O8lrr3uQehr/d3Zr8vWwmQKHSXYt4kWD4P//TSlnpmJHXgI6mIwbjFUlVYljIuKop7fsit3P1xVrs6CleQ7RqFxHINzA2bvdMspha1mp6ebTVyLo1DISPqUO/gczoDU+n+5DbTHfbTKMtn9AZvVq1WT8BREyA9b2pgE2RHeT0mlmSj0yACXjQarNyVSn4gmR+QDu/6plWbU0qqBVXoLHROLo3eXDbeSW2M9z6NnOJNcc94CDSmoQBRNNTYUWRggA69hYXApCF8DcGgSJKiBvS1Hh0x/axI34l9E/5JRxwOn8W9poaXVMVGoPweBi3dVF3ZLMrMmceXifCtXZ+zEyMAaQodHcDRXTEJpS2fWQMhSAsdf6USzLqWNG6yfnPUU3aa6rU85Bn4//BEqydv+pIwq7nyf+MQI2rfAb3/X7eZ9nS0d+oW++WwC9hc0y+T3yDXbx8ClqWUG9/HE3IY0i0pg==
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB2006;
	23:lbUi1g9lfYy5O2qkziJ9n0+c268n8SMPKhiNz8OhZ?=
	=?us-ascii?Q?4FIqjcTE3VzWbYEExcNnL57E4RVTCSyUs3H9/InHQxWM1O3REwoGJMoAKx/4?=
	=?us-ascii?Q?CLuTY2coKT9bedM5eRbZ7JmDy+7jyGA0lG+7adLMYkJPjcU7Mj4xID6jImv8?=
	=?us-ascii?Q?QUrnN4MkXCHJJROcYJjWpISlhxBGDqUrsdHQO/fY2e7tUsLW2hKxZ8NvutD8?=
	=?us-ascii?Q?4Y+zJakg2jbax0nlkCUXW9cgpDvV8c+JhVFcoGQ/CIy/CHpImtn4j78TpDwr?=
	=?us-ascii?Q?OsoTHixHbJBKOQv2Dl9JFNL0ts9U+uNyMd6G/uEQ8o+Lo+0/uHttAy/x7xiO?=
	=?us-ascii?Q?/3lkZ2MGycGoK16V07jJgAu+8lh+bYQXGe4QcJ3uFucyu9Wh+1wuPyimOyUe?=
	=?us-ascii?Q?eD2KQAieIDxxoO1rZbcyfFpTF6rE2mkRAWfvlYX9Qm4CdSkjkJDOvu4QQJ4T?=
	=?us-ascii?Q?B9t95LJNCnvPTBpb+4BgPEGZI/3jpY+nUjoqG+Z8NiJpC2GUVtcbGTgtplhz?=
	=?us-ascii?Q?OiywIZhJpw7kC/IpMbWnhayUB4OldfMl5vL0e3ZwiobOjdq7pkiq9YRJIx8P?=
	=?us-ascii?Q?YW7OWk05vgJhPPeW1YDfBcUFmLSIO0IGBQHi9URSWS9c5c4R4naisIRUSMI0?=
	=?us-ascii?Q?d9YT3H1bfgSYRSc3n3qHZ3fh7qpLq6biMYhlaMRzLjhEiJhqIOqW2QKNzrEk?=
	=?us-ascii?Q?z8lHREi5F9a12SoH1tnlGbKSDx2xACj8Y96o1baKdErnq1dpwV4s9mf/dyJb?=
	=?us-ascii?Q?YwkK38sG2P21NJmkRWyvdPbufckEyRs85gNwWnDiUA8JPJk5f3Hs5q52qU/W?=
	=?us-ascii?Q?iP4gBxlOS9Q4ruGhC4GBSycVGcBpMuLnn7VvvGGN7xO21lEDu8sH+teE9Hxq?=
	=?us-ascii?Q?9UzKjohs5oOogfgWs7SpoVJ2OSDNHrldc8iNqgdwvY9d5dtIPEx+hLW7fIPs?=
	=?us-ascii?Q?gZS0Ir3OiXAsTTEPrJyxW0WlguyrOJzRidJPzb/k7xhcE3iD1M7QFWLOPvn5?=
	=?us-ascii?Q?ee5j8UJcRVWTwFp6+YCETDxf8sySjvcEq+PA2RcnTj3cA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	6:9QO250i1b4gCdSBNrXFDAVQppe9AtBTZ5ldZ/ibP/E9gUg+X47nrYvNcGMlGRR9g/KIpXQ3F0GFFi7BoViAa/ZAwhOLrJrUjnR3Jsi+fD9Y3m669lRXSoFimqVZ/+77kZV1aQcKnA4vy1Ko95c+Z0nwqrYlFjqbJ1ybK9SvEpybP3Td/VRPVdW6glVkWa+++RiNo3z5LL/xEwIrQmahWBOxKHkqf57f0KfUo+njV0gjRc7AeDXzbAiDTWLmmfxC6GBvxzQV4dFygHKUKqnH0PbZqHVXW7fNWo8V9rLpJzwU44BFiu0lJubhq6Z2Rqd0d/QSNAeOeR0pX9YEZD5LibPkxs11JRwIyjXJHa8UwzHU=;
	5:qUiywIhYGkpVnh+DbHd/CTbKynBKBNBdBZR+s84EU7ztE+W4rzD1kPwKcvl3v76O+yF7TdBV30IIb7+Y7blq69cHnn+PHfww9N7tDOLx4BrqANLxxbQ/EDFr1D1+UGa9sACB0lmVFiHqPJa+ZstYqw==;
	24:SUcoqBfLjzkHy2Wqzq/Qk/Gzhv1nR/GstVnnyXw8trz7b3E2cOuPA+UyJcCxE/PQ3rb0usv1lN+B8talhLMlKXgbe3JBnBMeqxr8kH7+z4s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	7:QGMAZq6AKL2L3ARU3Nve9nTZhAgM604yS5YRP1gXrg//mz7SWjrGnEJIneLZHC1UrPfkgPBGIpb4ve7J+qoFXewY6B5VA+s9rB4J/zx2lSZUYC0322GwSHR67UEY1SIJk/AdcvCNboAchIfgKsYrCsdoix6iHlNJTANClMnisJLBuYWFBQmjDWwWtzlh148k7weU1vvCTwTTXLvsv1llye2WGm5BYv9xf/EtOX2xFIXfBVtjHnGEFp9/VhuiRl0zjrEYtvDTkX4lui1YOIGejihBqVXMNdRDilklnTUDTvUdl4EWbk/QqPRg6X6P5R+WtSGiXueom8QXuJ3XGo6TqD8+2MwtTYxyOjQu6Hc2MCw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 23:20:35.6934 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2006
Subject: [PATCH 0/2] runqemu: Allow users to not specify a kernel or RootFS
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
X-List-Received-Date: Wed, 02 Nov 2016 23:53:21 -0000
Content-Type: text/plain

This patch series first fixes a bug in the runqemu script and secondly gives
users the option to tell the script that they don't want to load a kernel or
rootFS when starting QEMU.

Future versions of QEMU now include a generic loader that machines can use to
load images so there are cases where the user doesn't want to specify any
-kernel, -initrd or -dtb options.

Alistair Francis (2):
  runqemu: Split out the base name of QB_DEFAULT_KERNEL
  runqemu: Allow the user to specity no kernel or rootFS

 scripts/runqemu | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.7.4


