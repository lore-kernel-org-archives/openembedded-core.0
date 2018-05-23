Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 928 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 23:25:09 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0072.outbound.protection.outlook.com [104.47.38.72])
	by mail.openembedded.org (Postfix) with ESMTP id AB680744F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 23:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o2H3N9tsslKNDVF6ZWtSA26AyTk+qpZRuwzKSnxng+I=;
	b=3CoOBChFKDGz26TuLSCmzE7BwrNPTo5svMWrmNjC8dSRiCAOtBbwcWuSnntudiMidoz07ErlRnOHw2VAtzUclVLCsqma/SK0SxJWunBxZLu09jbOPUedYWnSk8VlFhkTDYUDCSMMbg14HgPIxI2SEHC1qTznXFwA95T/qcBa3Xg=
Received: from CY4PR02CA0006.namprd02.prod.outlook.com (2603:10b6:903:18::16)
	by CY4PR02MB2824.namprd02.prod.outlook.com (2603:10b6:903:11c::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Wed, 23 May 2018 23:09:41 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by CY4PR02CA0006.outlook.office365.com
	(2603:10b6:903:18::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.776.11 via
	Frontend Transport; Wed, 23 May 2018 23:09:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Wed, 23 May 2018 23:09:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39498
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLct2-000062-9M; Wed, 23 May 2018 16:09:40 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLcsx-00050g-6J; Wed, 23 May 2018 16:09:35 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fLcst-0004zo-W0; Wed, 23 May 2018 16:09:32 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 16:09:28 -0700
Message-ID: <4a65b433218b93a1da41dfdf21746b57e4f14f1b.1527114300.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527114300.git.alejandr@xilinx.com>
References: <cover.1527114300.git.alejandr@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(39380400002)(346002)(396003)(2980300002)(438002)(199004)(189003)(54906003)(9786002)(426003)(106002)(50226002)(106466001)(336012)(316002)(356003)(2616005)(446003)(11346002)(77096007)(26005)(118296001)(59450400001)(76176011)(8746002)(51416003)(305945005)(8676002)(7696005)(8936002)(48376002)(50466002)(63266004)(47776003)(186003)(107886003)(5890100001)(81156014)(2351001)(6916009)(6666003)(4326008)(36386004)(36756003)(476003)(126002)(2906002)(478600001)(486006)(5660300001)(81166006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2824; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT058;
	1:scV5e28aUjyr690bLF5GQy6Q74QHg9A+lSgnUdjYHYSBf5s8jHsuM+s3LHvjZUJmxhvp8vfYlMGDolyFf2/dRoEIya9UZ374YwxEcxmXL6wXCG9AXj5DkRryshyxPGoT
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY4PR02MB2824; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2824;
	3:HO9iPC4nS2G+Pwva97ZKvUNRVxPFnTX0ePmvCeu8CJrZksdSujlC0CmUAtBrAhe3cR23+WrK5uT/xjpbc2m5Vb67zS61srX5r3m0C4W6z06HAlOI3G1NOAGHg7ufwv9dIr7/0RlaxhBziQ1flwb+LSKLCEToDloHKqPQU2TWYVPJi6pgQRZ5pXdX8X1IRwlidFXxXyuw128599srcEXKR2WDuZR8Yhm7TH1wUxyJBWpHPsF92S9JF6W2Qj/hGdp0pfAWbwOESwgMY8z08qY6U9OYFFIhzEBjKmzACrhrE9Kum4iirY0Fw7omIdpeRO3BeYh+jsLD+kF+6A4loWyPhUfIqsJXBkRMZBZzN39UXn0=;
	25:tcz/q+KDEiUlGjTloLFprErZlZusbikJoubyP5jaBI+Gv95anjaorDAo/s2lN9oZr3CXhBeYHP6V6ogigCWSYqMvP4I1RyqlYDba3sNt1tuYTxX8Y8O8nlHOEBCHF0huVy/SsiXGj+S9Z3KuNyFwVnz7gVaFjFcNBwpxt+S4CD6K9eBJ8B/RcwF0/c2JRB0Af98sRbD2B2QXfSDV5G2h3qVmygGYpnpRFT727Jigymd8Q2NsUfvF5AGszCXE1fVWdDe8f4W/t8/dsnXKqfOAiDZiu253FGimUsKXzNX7FSZ0pLHO5mS4MAuFyyl7+bxs/S6evC58ogBBqCjFknkpKw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2824:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2824;
	31:7PNEPxNttJGnRT7gLhHRHMBh7ianUMch0fVyHN2moU+9vOJZG9DIzDm3X3LZ1AK1S5dbQt1XOFTfH+l7T9mVc55KkOJRL0kKv2S8/9/HOncWVPmZSG/nkfGmDj8FCawXjWxTjx7tQMTW3v3+68zsOhd5BG2/OlkoQDyTu2BUKBGlmWBHnvUESC8KXAF47Aq6c/gKEYDZvClyerhVEFH0Rg/k625Zl8x37OOyVfuSqOM=;
	20:1BDU/g/l4LSkNWXPq1ZFFp0G0NpFRBGtaqUdz8hElQEx3Q8YQZkCjrCL+peV1yE6bbt8R9DuA/K78mnwZk14O9TXvUPEUWDchwiJACSOneOj5WIfxVGkI+xbv8/dvfD1og7ehlbg5sXGA5bOxNXbycz/6Ec0WI1RkAvbd6DRP8spqU4Ev1ZTbe4HD6kOvxL7CAqafOnsLO0tDIhLVZ8S8myuvi+eKXzIQwleNqHn+FfEr49vKN8H3BwO1oL1JAQjsTfOd3yCgubirkwBwZJWv1YmMnZvDs9rVsNYywJqvCclgf3eibRW8ICLi/2bXq8LK+5/9fXYJhDQn3/DsbGOCmdX5FmX170Z4Zxu2QPqOgYAhVeNJUrbrSi9tBIz88KOzYsz+lf8Nm3y6yjaVajnIBiCC6Wu+yEej1IHQLU2tW0P1W3LCFwaqIufeo5bJc2d3zlC0fZAf7SThsn8HU8MYjPb3eu78BLsfodlgv+PTvXBNB/P4oOx2NBMd9sgvpRt
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB28245EAC39722255015898A8AC6B0@CY4PR02MB2824.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(10201501046)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR02MB2824; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2824; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2824;
	4:rbGcjftU4P/hB84iSt3BZbN3Z6YCttnDD9F/YB+77555Q+Mvvvpt91PHnXg70R2jhiyhgsPKR+pTif+Nk8bgekW11i7xFXUB18gbKdEk3r185qjW78gvCPn7nKqp3CoBOWNYPFXp2Q+w5lEkT4WWOznMPGbqiiikSA84Ri9h/ARKk/gEOnOO5sdzq66lsLMVT+FlA8tBIhihjNqgmr/SqTbbO9GBc75dnle/wT+LX4JAHHpuqCkoBgeOtHBAs4y8q7r5v5UmPBLqOlXwO+9Su3Am3zz8kBOtAkg15AU2EYvpHdSUllVBH2yyxdQRv6HKaTPC/Ouitax/Kv2LD4DvNm5ldV5+Ky2RDVQHsT2jjSk=
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2824;
	23:HUqjE8cFO4OgJfPlViXQ6vyfmeLhyXtTsKUDaAzWG?=
	=?us-ascii?Q?mGR6mQ26T2rtOwHwtDTFIFgYZh4O2zGZtUETzNS6oc1zNQ5rePnBeuUkAQ+q?=
	=?us-ascii?Q?3iiC97J2QkPqlOi2azjq2VqrfjVs10o4o2rVHJKfMkX8ISvDZGMx4e/+izw0?=
	=?us-ascii?Q?TxnhOx1qepgzMQtHXvUSLOE7n6eTjuw05+VenQnMYQr3Ju5OWx4mgLAtFsyT?=
	=?us-ascii?Q?vxEDti3FDnv6YmKpaHg/4Ko9vHyhtymVinjWjuE4k34OSmN41BGav9Ibhlda?=
	=?us-ascii?Q?faRMYWhI9H/6yeJDefzA57gL4PjU6Gun4NeNH+AWe1kR7vm1E5bZVJ14fs74?=
	=?us-ascii?Q?c3S5wE0PES0zZJtKntZGzb4bIAS5VOLRjcqY6nmTI95nWetjABjSK4rxGdWl?=
	=?us-ascii?Q?t9NrRoiNXP5kzGcbW5IMFC/um/Za9tx4fRzZJKdQ0Wre+4aEIDziEp5zP4Fc?=
	=?us-ascii?Q?gyNRx9G9Mr718CEgfbEoFt5Us8Ugm97zcw36OR70P05PPDjV4UHhkHk+dLam?=
	=?us-ascii?Q?D15/Qhhf5WNdzsJQJKgmJ3BcYZE95myMdL4VqT71JKJ5Qsnr+tXGg4VauFlp?=
	=?us-ascii?Q?KWyemMOpPHsm75rMif/nhKaBF4Q8sdFU3noj9oSPy46PkLCOakfp2bX92zSz?=
	=?us-ascii?Q?yyiCX9gOFGBMcC6r+NmuHsdxWJOYLYncoMDE+fqADAiBY6mn5x1M7pHoWRfr?=
	=?us-ascii?Q?cH9y5MUrHdGBWkuW6YikKzzccyFak6CZxS3RL8Bpcfng5/9Li8ObZjpvFdSp?=
	=?us-ascii?Q?rzP+0V0zZZyvWLtxWP4X2WroaYi7QucsRiDeyyTWz054vuBKjsk/Y4Sfr8U9?=
	=?us-ascii?Q?IX9Qzr5UOis0T3UaxSXlDgNr1CzuCPTU8pkyFIK/pkl6Ow7msCBDgvTTPvi9?=
	=?us-ascii?Q?rXljv5644ONiL0DWqVFAJ9PcUkhhm8gQSlNqYdwCrdJBmPQ7wKgSQctC5IGG?=
	=?us-ascii?Q?BBxnuEdifdx7UpEKc+BnZgpiCaQITWHDARhBa6zmrr1vqhnrEE0swav+u58X?=
	=?us-ascii?Q?e/P7EcDHWMfdNwwfzunFpiCoRVNWu6s9PdcTNwappYpBcZzfnNoj3sZTosjF?=
	=?us-ascii?Q?QfIr2OQ4tlYhRZBf/Z+DMW7elYfOKcp4+37r7fSkm+lr7kfNVcHDEELTY89Z?=
	=?us-ascii?Q?+eKlWP27eZBqTj56eHeLk4DcGXIvbMw3zp8HT0elE4S+B2MbnGHaF+lWek0D?=
	=?us-ascii?Q?fKANwK6vieadZlrgkjnZdTLPrxVHWEWwmKLwq6qC01p5PDn0bEWJxYkiYcQ1?=
	=?us-ascii?Q?UczSQ6kjtccjO1YDZ0=3D?=
X-Microsoft-Antispam-Message-Info: v6U/5+65Tto3lDElWWBRvlUxJRZk/3r7E3+IpQ6k0I2n6tdOgkESN1z+dua1oEb01dfQGFy9kQteVEh0m+xM8JoJR8ed1IcNSd4sq+8HOSSTlZxfrqpweH3e9s07+4+KsT4OGskHovdE2155f8OZ1G6v0OpgbSfpbl9Adzn1uIIh/Gk3k6ZsLtCNaRbt/1Ls
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2824;
	6:N8LiIbaWgpjqI5rcHYjub3SI3IYrmyaF8p6Kf+ZuOZVhYf1e7RPrMHOR994rUTm+Pzy/Lgp8BZOeTDzxPF3W+ZhqgegW4P3Q59GIiUiCFCzeJM0/5JZ0a1Cxcnn/ZvZDvCLjM68Hne9Z0PQO2PiYdlxljUXZIBCaJqKICrjWvwFammvcYmH9F7TUmfF80vokPyI4CvUsiuhwL3fb33riQfIb2WmCGcH2uQurPU3mxYCo0MRB7CDAOic5Na0zo6iZ0IA25IIcc3r9rIW08BGJXVQNn8Bk6JQw6OW4soe2rQWiVw1r9vaXUAJzy058p5y2UNFUIvuzte7SGVOwhGtBxteVZ/UoOADY0V/MO/6yHap35gSRjHtVGViliTE1xOOVdRHo8PlsD0QLLcLU9RkUN5SlDt8uZTmSXBs5c14yDzcetMHZ3Jo+9p4RkUaAG1smsoYt1GfG8PT75/ugzo/mIQ==;
	5:dOtKcbnAkUa54ah/Yw7TpzC3e9YKmNlT+s4RKZk370nEFnNlVShqstIuY6NETfCnsd4/a4EqYpt0yN1trn6EbOknHQjc77VLfOLie5JeYdgeNzB64lXEhPzqpF7CQVyTr53t+ErFS9tiAKCf8snBDxPmtbYuVyVdM3Gv216Sz+0=;
	24:0X5OLYRIMipW2ul6DzgVj5ns+EEh6yrLzPwJcLiCJWO61R5FdkqzPYiki78WHxK+auNqaIQXonkViz2s5SL33T9zhgU6WDXG9TJ9olKIWk8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2824;
	7:MWuAAkuB4E79xnzhNhyJe7ew6sM0nKcwEDuFDCZ0Z8D4TrnMOWeqzcCWDrl3ORryGFAEPX909RNib6myB1nPOIC4bldAPBCmYWz8sISb1EpciAxjk9NjHy7ZlKSuVDiWAxEsczfQo/zdI6a50ffuZWJGD3frQL62Qk9P8hpWXTB4Sq1kkluamSbnapfZbCaq+8SETuLw3e1jhfNK7HKSCJp5Y9mBlQ9z6w9nUMZ7DaSnFpcaLliFOpPKX2xOiuZd
X-MS-Office365-Filtering-Correlation-Id: cedab11e-297c-4196-cd41-08d5c1024388
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 23:09:40.8208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cedab11e-297c-4196-cd41-08d5c1024388
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2824
Subject: [PATCH 2/3] insane.bbclass: Adds powerpc to elf headers machine dictionary
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
X-List-Received-Date: Wed, 23 May 2018 23:25:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds makes it possible to build elf for powerpc by adding
this combination to the elf headers machine dictionary, this can be
useful when trying to build baremetal applications where the TARGET_OS=3Del=
f

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fa15460..bd7f519 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -71,6 +71,7 @@ def package_qa_get_machine_dict(d):
                         "microblaze":  (189,   0,    0,          False,   =
      32),
                         "microblazeeb":(189,   0,    0,          False,   =
      32),
                         "microblazeel":(189,   0,    0,          True,    =
      32),
+                        "powerpc":    (20,     0,    0,          False,   =
      32),
                         "riscv32":    (243,    0,    0,          True,    =
      32),
                         "riscv64":    (243,    0,    0,          True,    =
      64),
                       },
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

