Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0073.outbound.protection.outlook.com [104.47.42.73])
	by mail.openembedded.org (Postfix) with ESMTP id A1C0F78872
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KfcZ13diTtFNTrzUrlryqqB+zeTAEilXHWsQmGcNYPs=;
	b=uHowsACGgG/mFmrMPkMvO2Y/QnjVcACTSZsiCyV8c0/CltUF64laBYgNhffUWiSF+YE0U73tHPvMSrRxtIm6t7lqDovigtMGqtJdMYKGHDENRB1KsDtMSF4xoATO5CzBEgVwo4+zfgscAlShQ1mZMcFHyMRFxOn6HuBagQ6Djx0=
Received: from BN6PR02CA0036.namprd02.prod.outlook.com (10.173.146.150) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Thu, 14 Dec 2017 02:24:06 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BN6PR02CA0036.outlook.office365.com
	(2603:10b6:404:5f::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Thu, 14 Dec 2017 02:24:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Thu, 14 Dec 2017 02:24:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48447
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBt-0003yI-33 for openembedded-core@lists.openembedded.org;
	Wed, 13 Dec 2017 18:24:05 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBt-0005UJ-0q for openembedded-core@lists.openembedded.org;
	Wed, 13 Dec 2017 18:24:05 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBE2NrPr005332; Wed, 13 Dec 2017 18:23:53 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBh-0005QW-Gs; Wed, 13 Dec 2017 18:23:53 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 18:23:49 -0800
Message-ID: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23526.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(39860400002)(2980300002)(438002)(199004)(189003)(81166006)(6666003)(81156014)(8676002)(2351001)(107886003)(106466001)(50466002)(8936002)(59450400001)(50226002)(5660300001)(106002)(2906002)(47776003)(478600001)(16586007)(9786002)(72206003)(48376002)(36386004)(51416003)(77096006)(6916009)(4326008)(7696005)(63266004)(316002)(36756003)(356003)(305945005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:2Qixt+e80hKfPB3pRuhDj0LJHBxRjlJgxAE85GjHar0OV5o+GWjQxXjYUgyPJlVx0/clwkPYGoYidErxXfLc5rbp4W+rlg2qquyRLHL7WYwhW7F7/On+7sK5lxccV9cy
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea2f79e-2f3f-4d09-df15-08d54299bfe0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:SVS/9iR7Vz678G4oiVUBjUjj3xGpPVRqJsyCxDvNWMA64tt7Lzqvl30bWKsSk50J4LRhwZ4/AV7I9+96jqlpFcXfgaheuvOyTViHQmqIALIWhQX1iENK7L0rMrmlKE91q57a9KrL4hjntNVO52ilIZkgLpURhMU1JWXPQueSjEiRzTv+q3kAa9Zhh5mjRAE0GCUzbLVAGMEVPTWxbMbcApd6suG+OjibpRMuWaQjsXLcv6pksxYJTrxeLrEPws3ftGInYG6u5LE1f8TPjbANQ8Vj0gdR/CUuVMNhx7c7qJTufgGMt4nPuC75YbRtnSg8EqCJ+Q5Hkvt/7jg6lk5psrJqx8DW41+8KotlkbAb7RM=;
	25:pdDpNIoocS6nsew0wIsMr+eZ1TBitGFXSgl9byRzWtHJ4qA2tmqSs1Exyu9Pnmep67j7G6Jp5IQVWNDoWs2ftP3wLSu0Oot3UEWTUZby5scOJoa5P4i8/+cHgSfNz/I3Y1esZzzNmBWcqXW59hKg5oSdu7XMQftoFKKJiB0Pg9sgablGXLMVhaa0po7QbgZFqsLv1DX1mQJmBghfjhT5dbBZpTs4H7+IQsn1J5N0ToPOLi12/IbzWAwqf5j2oaS0e+u9IGEZzSrFcp/nhEtmUywZMmfIhM8y/yfuN0NEmFIekZE46L3y+HfHnVA4lVGDWxSrAFxVa0SVg017yOhYyw==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:OOjbWTag8f/qjEX6PpTGFyzOsV44iVb2SCW7imuKgKPIeEmvV+SOk84Bew8+ZKB1cEzGK40DhIlwnhUlr0WPqvZ3rSWgAovs8NAWlHJGS7S2XxI179Rq81RCsJe1sgpwix1wJnTXf8c2TKtzHZdR0t2EE2pYQ3DyJ9js/BWm8zaucFaRQkkuMoGYY/EyauTv6V1la0C9tGHzPPax2/+X1C66cFF8Ksb86xgJsQa1uTY=;
	20:zLLq/UwUNPffkEG3bfw7+IDKESeasVLxCYRP+lMhm3xjXFp8KskuB1/tLYUFfiPWzhHLm76RQQo0egx7uRoPJCtZNFSFEcd9zDc5v2D1XQsBoSDhJQDVAEOtyo0mxF1FGSJ9OKLNaBPsSlt3PvjWifN2npBt1uDeo7JNztgyCcyUOaqt8e6qLbhwQOClMOu1VOhl9tTfuXrdyoE6wPxf9BaM4S0lC7JGNVRXlIbgWPoa+qtgSx/cbYN1kKw36ZieGnO02pCfVzVCis8abhIayNM1X0Utca8zMZ5dpuOWK3JPsdqRmx0RRPAZRjEoeCF/6hs0R0O8/X6xRboGsXVvCzozJq1MQ8VHc4zBmb8Yqg1AjZukQlFtmGoySvwYeNzMt8fzVHAAhpwVFnhPF7TRVXW/YFEus8V5vIHzcVu1DUG8rVSFjw+MInUaBMoVKHkkqTU5e707Wfv7QOOgRyhnccqKJjGhNS84BlejUOme4fxddG2T5RwlkKvPUMksjm+U
X-Microsoft-Antispam-PRVS: <BN6PR02MB337702C527163FDAE2698C6AB90A0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(3002001)(3231023)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123564025)(20161123562025)(6072148)(201708071742011);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:NGI1MNI4e4lQeYMGsxFcI/PgQuWuM1lAee9kNhDKHRFT1wn7OhQ5Xn9kq/2Z/wROqI+9C81D0ucsBzGptQ91P2wQ9TShJF2MbBdWrHZB6YJWyGFQ2SUwYtg5l8/NC4Q4ZIhcUTn5E2TGy7vlCNNengKCbmDX3kTIjbTwtKQeU1qetsbzkLXWOFFtFwuLy6+BNHAoCxd2Ow6qMQ4vTuXLCtY7iw7yOGkK/hFKoDAYPD83FTrKYqzxG9TpGPvOuNnNEIcEtJtmIVeoI+t4nlnR5w==
X-Forefront-PRVS: 05214FD68E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:Aaec3D68g3ryr7w7HEJ7+xKbfWdmJ9lggRHMWChtl?=
	=?us-ascii?Q?k/gaYcwVQfvjHbnqZcwiT1U3SbElQk/lzHKXL1hYZ12pisQhFGkXq59t0pAd?=
	=?us-ascii?Q?Ai85mE/zE96aQeMoDTRYgh+rR7R18l0x3smI1TQEipFrAf2BlHZhy3tCaAJi?=
	=?us-ascii?Q?nkdQbSS0uDhoErsvsGkagnPCIQ/fO0OgFEG3QivfbqtN/REuHNLG+wkhj8U8?=
	=?us-ascii?Q?is8DHvKfpDV+gzRUu2sw1UfTlBbfuebcFX6L9VLYyK3/ot2xPOCO5Wr7b9Ks?=
	=?us-ascii?Q?UKQssb8mYM6nHUnfgSQLw5+uAFaCfNNz0BiM1XMJ/NUwKC1rx5SUOzaS4/Tl?=
	=?us-ascii?Q?FRuvXT8uir3wIl++V+sxSrfDFajt2l9mznz3AdBX6COexBEi5P1kD4A1+QU4?=
	=?us-ascii?Q?btok4eeF+iGv7Nvl+DH9qjmPAzMRFURNUK7nKbPessnzd2Rzk/wXlDru/k2B?=
	=?us-ascii?Q?miU16NnhnQ0DeFl8FiKJWxUI8+e9siI4bk1coQsAEUwclIJTVNY3WYLvthJg?=
	=?us-ascii?Q?jJuVvHM0KK3CbtxznP/5Bn0R2rXn2fezZerwPHwnbIT3m0aEdH5l4FUbhFRZ?=
	=?us-ascii?Q?cTUSYOsfBUgdBW+m1FeVIfP84uLPIK1VDLdhTkKe9kms8r41ViBo9KPw/gTh?=
	=?us-ascii?Q?N1dU3j/oO0A9NblvdVAF3v5u9EeY4G7ZMyAI4ngE2ntkW2Py/4afOE2AmTer?=
	=?us-ascii?Q?gM4iUMzFFuhUvL582kxGbepF+3+a31y9ePliHNs/zP0sIB3fpeyHvSs343eM?=
	=?us-ascii?Q?VidVWsTVIR1UxPD48ROQ+Zhxbe49msNQBmer7rh8YcjTp3Kr89PjE85JhXa7?=
	=?us-ascii?Q?EW/DNJtYDX/HO4tjpijyPAH2DEQLHJoFqsp8kpDJYEDK5hHyZWz9kliEHmNe?=
	=?us-ascii?Q?Bpbefxn/T6Pr/7yA5IRRIFl7zVs/kVm22CN84uPKQXVDoPiJC/g19olYl2Fe?=
	=?us-ascii?Q?oKGZdXzW54YLEMbqvimWY2kRG5l/vW8IedNS4Wwuw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:JvJ442nW7+/Hy3zt/HrN6R+yxMIXG7S6B7OOJLzeyssUmor9+1EZhCMKLg0WMLJfwqsV+uAr4MDhDmr7H1wqSD7mPfwtsfKYwYCUtLW1FqN5HWcRodPFpcxIGaMQrfaKsi9tILes9WWqUNh0Hn+t5gLCDlJaDe4LZxLCl4zaPmAmfBQiOsKbIj2RZkrokl1tZlZ1Bl/7IYLz2sS8JjNNvxp7BbnY/iFeMPbIVJr0PBfIEDsxVZIO35WoxzLS2D6N2tUXx05ewFmIc1Ea0sOt6ETMQLN5zQvfpWqjBWdnSNLtOJVFWNpTN7hcqTWUbafDpumN59frAGvc9rnZ7QmIzPgwp7+2Tv35kU6X2Dn54bk=;
	5:OnlBDUELaHG5bGqT20UVZu8o/zl0LZHpkwIa0L6mwdaBB4Jc4gIJ4N1oLhFQPLjF8k7VUTqw++w6LVyWuY0IrlXpOERjisBISlAfQ1nkKiiA9CjGA22QhyTa2LmeWyCKYyb7BJqwPgp0X4nePNnZbMMGCqgz8INsIbiSC1jueZI=;
	24:vOhW2TXqF4SWAcJjt6YQvFmARQP9iNScR8yca8C8vtzqonaO+FceRsQzV9u3d1fANKo54+Tew7/Uo7hvUenk0ZKElvTEEr157EQnQoxOnjw=;
	7:LP9EZXGiVRC59CfIr+0eGnmZasEbEbSN9bqxg69/JeTbQ5/NH2VFr20C0+LuPvyOPj+I717aUZgSVz/O6pvP8eNDLpz1/ks8nlXYWsQrT7B/5z0v5RsMh3DqIiJv4fr2IqzGPUrrQyBGAZ/jyeB8jWZSZ0JTzNSJ5vZEEd7WQvYCxuF1dSlW7JTT8enBnKM3LBifEE2jm2wBC04wYNRakOzDK4hw22X7PPzWx8Ae+WEBJ4kWJq0uq/y3+LZ0bwJR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2017 02:24:05.8158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea2f79e-2f3f-4d09-df15-08d54299bfe0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
Subject: [PATCH 0/2] Fix build issues with fitimage
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
X-List-Received-Date: Thu, 14 Dec 2017 02:38:51 -0000
Content-Type: text/plain

While building fitimage with initramfs bundle using INITRAMFS_IMAGE and
INITRAMFS_IMAGE_BUNDLE = "1", we have few failures

do_bundle_initramfs fails first stating the below error

|   CHK     include/generated/compile.h
|   CHK     kernel/config_data.h
| mv: cannot stat 'arch/arm64/boot/fitImage': No such file or directory

and later in do_deploy

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_deploy
| install: cannot stat 'arch/arm64/boot/fitImage': No such file or directory

This series fixes both the above issues 

Manjukumar Matha (1):
  kernel.bbclass: Fix fitimage deploy errors

Thomas Perrot (1):
  kernel.bbclass: Fix fitimage build failure

 meta/classes/kernel.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.7.4


