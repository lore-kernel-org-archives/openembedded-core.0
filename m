Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 3500 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 00:18:58 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0052.outbound.protection.outlook.com [104.47.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 991BB71A26
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XYnd2qtVguDKkYPPm2Z7YlvzOd42S+/SBS6CdIQCxi4=;
	b=s5vQwcNBGvhZAKe33z3rKv8vt4YkJbT6IuYyM8c5r4T86UFG6I0kVbZU3lXSBHcTclF2vPXrcCHiqK/bFNh6ua7z7GlNqhUclLwLHtLvaVpBt+YwzsBTaiqgPjrssOItgE0sW23Pyz9BeTFpF1IYXy9yoVPs7R+gXzkBJZngc+4=
Received: from CY1PR0201CA0003.namprd02.prod.outlook.com (10.163.30.141) by
	BN1PR02MB149.namprd02.prod.outlook.com (10.242.212.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Thu, 3 Nov 2016 00:18:58 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by CY1PR0201CA0003.outlook.office365.com
	(2a01:111:e400:58b9::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Thu, 3 Nov 2016 00:18:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Thu, 3 Nov 2016 00:18:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1438; Count:15
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0002hx-9z; Wed, 02 Nov 2016 17:18:56 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0007NB-6f; Wed, 02 Nov 2016 17:18:56 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA30Ik1e025839; Wed, 2 Nov 2016 17:18:46 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25jy-0007L9-7K; Wed, 02 Nov 2016 17:18:46 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 17:17:15 -0700
Message-ID: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(4001430100002)(8676002)(586003)(92566002)(81166006)(356003)(47776003)(305945005)(106466001)(81156014)(5001770100001)(5003940100001)(50466002)(11100500001)(6666003)(33646002)(36756003)(48376002)(50986999)(7846002)(63266004)(107886002)(189998001)(77096005)(229853001)(4326007)(5660300001)(87936001)(2906002)(9786002)(626004)(50226002)(36386004)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB149; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT025;
	1:cgSB/Vnl2SPzQek1/gggEO/m0mcuaPr2eruQI5zKofKP8xbTPQWj5eA+HbgnMTHg4bc1a/pbutlulW94/eLzPilFAF8MwWmDvjX5d3ActchCkdL+AqcCO2JX2t8ne78qvGV6JRzOahorpvxLaT2FCL0MNH4o+VFcKsRWrlHOjj9ZJl3yEPm9ll2xKXMvOYNnBscOc91qrba/CUtPhqw3XalVVLIKIoV8Mx9FSv7ygkxkZPfRZuhdum1DRNB1QPnkiqAUgh8JuHN8/57uiUCIGTNxfI8giwvCbkqeCFDXuPFkaKmGFY+NuNkSLmuEHomxEDc73UO9b1G34mNjvC49imwDXxuUoOK1XPVOwIb9O73uK8sCXqPsu/752p82g4yaJZLz5/8wQiBSFeuiplQ0Bus6/2ywLLULh31I3XaQII0gPehEem22z/Ri0CqFq785kVzy4u4TPtPjcogfhEQa63LQOxsn2ASPJMCVF8UpbycrpWMWa4RQNSw5vsQJlrv8AKvX9dm3Fra2Fq7njBznldQbknuyw0AGlW39Uk057rOiH8kFBgZ+7F2vAJWibaonO0QM+HhW2kYpPSfdU8Tu+Ikm90Mmb1TlJtp+xD9vzQQ=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 721c7a26-9d26-4850-37cc-08d4037f00c9
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	2:sLpxZIcPxrqzZRnK/VfoQ+ZQh4irU/uYDYyfnzZOjB/MD43zLzrbaaryC3QaByGzO4xItS3pE1L++bHbT+8J8Esf6P9jglVuQJDnecZdHtTEOLxagntuwXSduALCaAwUmmBz2sILPkMpKudmZUfAkfJizy4d33F6/kNspiAhNphQXqxRkYOZj/i6HM74f0DC84f1789hTokJk+LAgSwcUQ==;
	3:EceIWCo7U6cDY+Ih5U1DyIdZTUe48LCmnPujLRNUVUj6MUoVTna8GZtJoGNRU5rJDpRMXN/xjsyCUzNCcWh/VdJ5F2PiwQYEZtZGndOcRk+Czr6sEYz6bLRCnCKFS5Lg8sK+rpLKMd/UDtkvEzxlGCwsuUpXZEoYgzS6woGKGIkOor6YLhTDbAvQb/G886JGOsxvuSpJvPhcP3ItdFf0sV8C15605sFIVpwFBueG2ToJprL4E24+ZlBxCzNVkqQTrJ/38tMeebwLFv9eG63i8mB/GXM3JSsi6DxwlavlYJk=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB149; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	25:P527VqQjCUM4fxyLx40gquwyKWaD935oqrBBD3QDsIh9vI3TPtd8NL7Rt8sNT6vKoJuRlEEZbGvEpV106Qb64hjLkUjjaTqc2KFtN/4DcDQK3gXY7dgMQCggIKbbs22yc9CYuAnhNxOvlCF5cdPLHEK0afj9+zPHQro43b526IkzazeVbDzoExIFFkxX+LN3a//8HDYW5hv8sOQ6O4+WFZQ+F6lPhwwkRPbjrCagvf9udsVVsAfOcbT2HLFf8Zi4RAgXwDyJAkGNIkCIiHcD3ZsUxhY1fwL4TyFo8QGLNop3TtPojXiZIEBMRfetVhIdtLwXk9URWqnpBrnjKKmZUHTockhZ77e1QGv36jUVWWugLA0d3UoPsTQb8F8gU7JkHkGUnV17xdG8p5Ri0VWZSukuiEiB3IMmot9Bp8HyEkihT3N5niX9yFLP6PmvP/Ok;
	31:ycAWq8uG7RQx6lY1x6RiZ9JcHzIHcKAKNizgFzioNSsbPWRp+S6AsRtMlUrAQ1zVkarw9Ej3LoqnyFPWOy5ztjNzfn8CaVW/cZLXSys1W3g7PI2f1ncr9VMq+VsHSnNeAQ2/Yq+bRvkuJjmtN40kPOTJ+4Pp4UPGDK9VrgviT0/BQ+ASivYnxTFMbVKmZzRyIkvEmVGTNkXO3Je79H76AgSHKzO5u/VLyc8KGwQmbxn2pqm71YyGTSBR/j9zivH+
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	20:+OautCV75bD3yVF+Lf5r/uRwLHYqMEe9kdMqUEHTUoc5v/9sGQnAUzFVjh3SRe83G8tLAYYoy4DY2P76UGI9Bgc+dBx18GL6capO6GFYJFMIMRMGGdr8PhAUgV3mApUnoD0VxQiQkdwOVDYWkOuxxXX9amUTUpfjHX1ls7BRbMChNlEijEJpd9QCkl7Tt5S0TJ7se434Y1K+yTBog9VWqA0ufiLratIwNlXnOvPQ+k999v4PPBkgV2OyHDsbrmfkhsgjbHUWRLiSYAq4EMrUhBpKd9C6bpE7q3Tq7MXUlArL1B7MFa36PWDNTz+gdgDJh9Ft2dkOPiP3Yq/vbXhqP0E0trhDEeXt/zBp073JvilPcnyiauojYDA5UWTmN6P81xZrWpvlwkTA2FuFF7VOTOE3MasNc8QvqCUPh9UUHQPsTo6iIaxlhrczQeA65z4eRxNkJuIPeNg58GnYJJ5DThlJS9AXbnd79P3isQDypCaWQZ3bMhRUYoDTgCzol7m5
X-Microsoft-Antispam-PRVS: <BN1PR02MB14936B9B469481600F775D5DCA30@BN1PR02MB149.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13023025)(13018025)(13024025)(13015025)(13017025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BN1PR02MB149; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB149; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	4:lYY7RAgggDyja6eJ5QqJoZwESgn4hr9exVBV7oDFktTAy5mZ07XeLuGZhtHj+KRnSdsnCbZTC8tn16rfALQPfKk93D3095J+55iM3EYaa0micDVdSA8pU9qB79rDflCI44HUYRq2r/ohYi3Um0jQ8khEl7vWr2QOtSFxHj865KAKIiWDgQAWFr1KbENEkblcQDQaqWlbVNoyzQKTRkZPz2AePf5f0TF/yB9SQ2xmT77Ct7mfjpNa+7K0m8AnIDl7tGV8rnC/1Br88OUGaamHRKAcRDjJxYZS2B7+EjLA0vXcHLfE2XYP/hPyNJA+L2BTdulveZHNskA9wiIgS8RW5ym4GvakHudDVhg+kaaHVxJ33CQhT0QaOJTLg2F9YWrZBkvHprvTnqx2WiFk/RIOeL6vJMObMUV1RdnALzPUEiCPIn5Rm64twpURBXxFEUX3kDXiP0WBGtMG0nN81aM7W8Ih6tinAWqclA6bTIk9zxufaLXbaz46r2zCZEBwCHX/XyeUgcfaCYtyjAD8jKU/pQ==
X-Forefront-PRVS: 011579F31F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB149;
	23:p7dCOurbk5rxXxGB3WIUzWtocBXPGQn1AtpBVS5O3H?=
	=?us-ascii?Q?0MoBWfNJabYx8Acj4RtFep/sCqOqels8hETjo+wwYFLbrG6qPFrUQOHOPH/y?=
	=?us-ascii?Q?lTd9P7Kac5seILkGVELVhfeZ4FNW1+GqzWVIxMiwBhFOQEjwsjuJSJXAgSgw?=
	=?us-ascii?Q?Wrn9wMxrs/91Ugaltb2IFYg0y6eJyYE2XbZeV85xiSoh3eMq6rENPPFuU2YM?=
	=?us-ascii?Q?J5ao1r+YPGJJkZZdSWQd/fJHuXA3fqRupmLSq0JKtuNSxSvfjq2Fn19+lpK4?=
	=?us-ascii?Q?SVuKWW6gyGxfzBXKZOL9jr3OMM/EiV+xQJpe8IPk/JX7dhAMedzXSSx8S/3T?=
	=?us-ascii?Q?+qB43L2Ofzz6fDalQWeyZ3qD63sRSYctpsXeyoCLowQpTmLQomJFdcDjYO2O?=
	=?us-ascii?Q?mYGRCv2qv4YpZP/k6tWwq0uMWBhem9AgO06cZJVXYmIocvyB43Q0x6ClkwXc?=
	=?us-ascii?Q?Hzf7xvuSc5DPir9uVTNcRvZN/jDXUvSyAlKqiXgi1/eyMMrl2rAMFwc00Gko?=
	=?us-ascii?Q?b+AOyqtO1rXU92UPPSMmU9Ck9eHBin5ZiZ5kFLruRP5ba0yf+Hkr/fhP1iMO?=
	=?us-ascii?Q?rWrFXY8VeSFhCqPEn3PebJmVzQcTZBicKev2LshzpUEHoFVf2aEPaf5HeLcM?=
	=?us-ascii?Q?XODudJ588j3KtQF0855toFXm1ZG0zsa64gcd5RNk1MyaNEKRQ8bAfTtK3YfA?=
	=?us-ascii?Q?4srivLFX/nsY/cfV9Z2JiPu5bbgmo/NofAs2/IY+jq85WaLezuBELRXe6rqj?=
	=?us-ascii?Q?hYsTeXKmSzQEJ+Vy77eVD8KRcV1vPBh/M5uoUpjE9lbkT3rpaaNGgArTZXHk?=
	=?us-ascii?Q?gYJjP3TmSu7MRT/W+kowXW2AG4bxlcAp/ENeNbbbJO3QNuSvdmYgeH71QaHN?=
	=?us-ascii?Q?0UFIaxyLwemHfo7D3Ql5sHjrrvyP9RvCJFu4h8rH/5QIXNc07UHWL7YHEc8Z?=
	=?us-ascii?Q?+s4xmttHsk+KkCMpXNSrdRtlkFdP5WDfWJB9OkOOLaLTjEl+V16PyfWYV4pm?=
	=?us-ascii?Q?iBagjfcNRmZpD86AeeLWoH?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	6:gAH3FtAmka0v7DyoMQqnvlNYQ456rjoguzGQR/3d6XkCxBvBjyq4wmqpgxmTKZV/zZ+jsN7K5N0NLrNwQu0QSDryS/C+9R+qZivjaWk/h9XrmiArLX6RdmpNfx06noNfJ38FlY0XUqXVEuWsHBM+aRepo+feNiHfuaARq/ByWBkUhYJiUAQ3urE/9PLSmJ5A0eQiesOeFkwEeE6Ishevb5mjmG3SbBCTkpts/UpI+rBA/8TjesEpDY1cMG5WgnzelHaoPJBgL5zlKSiqtatVjMkIP9rDYdPL/mSIPaPBxsPg3IcLxSJ8U+8vmh4A5z1edHSPhBfMISAqRhxRfbNkkOhLvJyq2ArgJm1/+DGV85Q=;
	5:k4RaN3zofzFxJKAMWl0bLnzVUTXPDLEibhGrXCvx+wfdNDu9/cr7fHR5xqtun6PzWdyDhTFLtb8mmUhtoedwvf+Yv62IsSx0nJhuYSETm22+42ZBe4p7fBD/TSww2SzNmG4UWeeM1iEVZd3tuy9GjW5CU0beuuc7EO5i95fHFi4=;
	24:FBJW6mHzrzKkZRupjO4qiy/D1W3GTDflNjnSGRi8aVnMzuN9PxwFtRk2YNDIyezkPfHfTzc+HeQ1qfV+tj908BV8yDz48vImjQcxFFAbxHQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB149;
	7:im6k8VUOxu2loqa2p7kaUS7l1jZxim80s1uZnPkXs19WA7Gdq4TCt69WUnOQ5cZzdjCBv1p/Thd3/mAP7VoOnCbrdtgc0fqDPPxoTTFkYIGfJ6oPfe6OStJeBoSLmOs3kBhCDX7EIrlFSSCyOjexuVBV87Zllb1ocH4zkENJikD11VlceY7VROS205iMP0AVgdSi619hV9LvWeiLuJibp3CmgzFBULug0w7aE5ySDNDuXxy05XNK6gtZN22ni9mtvN6Gw70vYZjna7WnAGqaSEGvzdrbOnwtRywcbvjol+REfzRQP/wF3nX8L86wKqDGa48j4LGnAieJuWqRs7eZzzzSnUO1cejC9QYsaKOpoVM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2016 00:18:57.0155 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB149
Subject: [PATCH v2 0/2] runqemu: Allow users to not specify a kernel or RootFS
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
X-List-Received-Date: Thu, 03 Nov 2016 00:19:00 -0000
Content-Type: text/plain

This patch series first fixes a bug in the runqemu script and secondly gives
users the option to tell the script that they don't want to load a kernel or
rootFS when starting QEMU.

Future versions of QEMU now include a generic loader that machines can use to
load images so there are cases where the user doesn't want to specify any
-kernel, -initrd or -dtb options.

V2:
 - Squash patch I missed the first time.

Alistair Francis (2):
  runqemu: Split out the base name of QB_DEFAULT_KERNEL
  runqemu: Allow the user to specity no kernel or rootFS

 scripts/runqemu | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.7.4


