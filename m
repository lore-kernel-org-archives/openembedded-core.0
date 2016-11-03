Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 2450 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 00:34:41 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0056.outbound.protection.outlook.com
	[104.47.37.56])
	by mail.openembedded.org (Postfix) with ESMTP id A2CDE71A9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8/k0b7ZlWcGCqv6YU6YuFIvoko4ERplSIvbViDcoLFs=;
	b=sROHvuqo/R47AQtdHtoP765z2vHMyzSGXv79+4M1qKbjIsOtLfrPGiXMG5xA2SjbX01wFmc3ZrWBhsIv7b5sWujtUD9IfHMfmr+JkhuM59uD3z6hAIIX8ZPXUlYRLn7FOOYl6tMfKyQvQzOqJ1PqfNRfDislnqGvUcjnt2iIcJ4=
Received: from BN6PR02CA0055.namprd02.prod.outlook.com (10.175.94.145) by
	BN1PR02MB152.namprd02.prod.outlook.com (10.242.212.156) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Thu, 3 Nov 2016 00:19:00 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by BN6PR02CA0055.outlook.office365.com
	(2603:10b6:404:f9::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Thu, 3 Nov 2016 00:18:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Thu, 3 Nov 2016 00:18:56 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1595; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36859
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0007SE-8d; Wed, 02 Nov 2016 17:18:56 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0007NB-59; Wed, 02 Nov 2016 17:18:56 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA30Ik9Q025841; Wed, 2 Nov 2016 17:18:46 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25jy-0007L9-BO; Wed, 02 Nov 2016 17:18:46 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 17:17:17 -0700
Message-ID: <1478132237-28350-3-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
References: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(36756003)(5001770100001)(77096005)(189998001)(19580395003)(107886002)(4326007)(48376002)(33646002)(229853001)(586003)(19580405001)(5003940100001)(4001430100002)(50466002)(9786002)(2906002)(5660300001)(356003)(87936001)(7846002)(305945005)(50986999)(2950100002)(47776003)(50226002)(8676002)(11100500001)(81156014)(92566002)(76176999)(626004)(81166006)(6666003)(63266004)(36386004)(8936002)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB152; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT054;
	1:vI6vRy4jnfNOMvVAhPj11mUk/Ng4DVLsrQKyuZDuYQJbFnl3ou8GVmCmc0kpSv4n/3WoaEk8jsbOdMS6zYfCugsRuAH2K6JOXQ9uxpNXkVMQ26T6BOmTOYgSoLUIUIEv9eSNfYoo43k+EMZerV6OXsHXbYIWqcyv52Rt7fooEitx6zlLq5SZGuOYOCYfTMjPkBVF/LWq+9sTS1nLhk9HEACkdv13m0mnbBlAd5HnRXl/kPiuVh9DVpCTTUzZVu8LZmap2W+Q0iXPXp6SPVBidHA02pjQ7mDdSMFEvEQH1rRKtvpSg9dMY/F1R0fJJoZniMg++as14OrkQ8BayM4rlqHWMWKZ1Eiaw5FPajWInIzch3UNcNMPFBKhbcRTPpprmZPWUQbekH1MFc31TevxTmn/ftwvabFETO/kTYqxoU3lPtyb1u4TetKIzVJp4xBEZ7A6U+JfXKrIPRTpFp2Vtg2NQ5z2KtSbLaBQT1BEJ+X46HM9vb2pfFubMEg4LJBjmb6addKn3qttoF+njb5+uRCODSp/us/aX0v7ENSfq9IxN0HkpCkLuOPmzWMA9AhAFUKGa7p+DBlBrpfoaO1hIceY7zrKyQNSlYsA3hvXVGs=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0c09e8cf-4eed-48d1-1024-08d4037f00b8
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	2:n5sw4cGsaMc2GiXmxE48nmme3Amit4yv81smcAJ8ItU+luNgU+mmmZoG7UKn7jR2TWVtSBJVlrvpJoKieAZgpoq8tOgenky4rx6I1yqTpFsFVf4yTLRhuPDPPDXZJsnI++Rb8xLqfdg7u822H57hDTM/kyOw9m50vljwmYMDOY3AVBlLLHtA+9sRJRmG9MVhzauxCemSRp+GE2aVIUv4eA==;
	3:Z6kEbRiRoHTCln04Lrr9JePAyvh4NpXuvTdj/R5vTauVljUhfVp+wJ29Io3jLgKxW0ur6V5mRNM3HBIVYCUhpmUSoQWqqDBRkJq901YOMDJ/B550jqOybc+/ZXJ2ZCjG8v3z2zIk30yIO/ChEJ0I5zeKVx0WWvJzqLlgnjwvOJPQujws3CgiXK+PbvVN9vD7dNwaNnoeY6dsTgjCiGlZGW/B039hHwRa9UKjAFSZtx3fP5O9VD7ZIPIv1rMC7+3WRp7sI69pvOC13Q0owkdvySRsOymNyrGJv0QucG/+Uj8=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB152; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	25:RiXpl0730hq4Dthm1zfsizdBOfdaGWjLI6gA8lmcrUT5oo+UIycZUXOVe+/jXIlSzL0VPK0nHMQcFynOFnRlq6BUy8vJNzpxpaPb7Ez2HwR6z5Seo9d5uGt3OwlhvQBmm4Oe5qmEbxcytfUeB/ezR0Psg3duCM3Govyz3vPByPZBwz8OJliFUjtZUVtekj4XledRuf/YNWIXz1wXWUHQEfww/UBbfN/lXZ+fH/0mhmg5mwxdt9Zq6hwRGZMn0uqgJgEPBluj0tAov6EKbiSavjHvHAnZBQJaJIONWt7TqjumL99B5Y/FCLOZ9jYQN1yQw1GrsXPBHR+lD+DypR+sP2Ijri4es06yxkgEoyHbQEP+Gcm6dkWlileLrBKXCHxXaU8cIBktRrZs0lV4FqDZTKAuQsrnVvidceZQuTkgv4xIvO5tUf+pmL9VGrOMlXeNwpgQU34gmMnhpS8hwxgjVZ9zQMXskIEmkjszWxA94eEOD9pna9SsvtksRFlewyokXH8KEEO2ijYQluVDiz7TfnsSYEtoszu227McKIYaHVuc73aOTeeIeRHyy057n019m02hoLBoE9uw9k/4dJx5L7XU6zKIeRpzavEulJkaapyiaaWUsTt2mA+0GOlbYPBu2TjYrCBqxCjZu6xTGkzB9274ulxzonq5zPXrhfERzggEF3LV/QcwelqjXL/Xeg46s0mw21xd2BDOrdDEnHs+EM30eSD2XQwxXL+aqI6ccWF3FrhetMSjVRg9yh1wAASEGWfl4VUpMGW1ngmSB6ftxltIztOcwouwlbTzwFvTgrvsWqvJCLy+CO2kvUurt+bi
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	31:sXRuTmdXU4GjSbg3e8PZtkWge/BIJ9hVYUGnSNQEbLBi/2OK1EIV7rAuL9703Tl8svKYIS0+lg0Y3xtJIDUTq53QIgtGmux6rbumvcJOWayJoXBQU2HeKWi5tozZIRvimqXw3h0xTWCHYW6WkeiaU4iGwTKxK9R3KeFLZFOvqak7JDcG9hKjpFY6MIessorcqipcOm+99+zD3bcSTvXYVx4YbggiXhtffjsUNwIuuN3Te22t39Dj2AzeCSuVYpZqJJi/2ekwPlkCNef+TqC/hg==;
	20:HIf2j/1phBn8ZOajBT1WVEu2R+Y6Z//48Ep0bfRPREgDJXWkVp8Z24PtIfFqWLfSrS3BcY3ekXsx+u/KyC5shHp6Nv0pG8X3PCZ0KCKa3zwBnrWQYBw6ME31B6UetPwtP6bQhIXdfrJ+W54hK3MorFkxsEqPzGYOU2vqi8MC20cs3rfooQu9YAiwvgJ1tL9LxcNwmOtOujGmJd1d+XUH2F3bi0bgfAgls9Dwk8AHhBHEZ5LXkL7/zizLxPe/9JpIn0PbBXcrKUH6E4XeMNRmPuh5ZXSn1OoBUBrf9e2lHSiBpXbyk5+bhALtNA+joSG3m/ZLWH9h3gNG2Q8WuBpJ8gxvhaDu7pGdQHEVJXJ9xTKX/EstV2TsxutpZVKRfDLan6KIKwK1qmg2MXnqv5UyOnnXpMyP0nt8qEaNezWoAPjZDL0EjjBr+a5JS07309p1rTck4X610NVPfBgBpnLlTrb+6vouu2GvqOhUSg491qHyfQScYeHsC/jUmIYAqXnV
X-Microsoft-Antispam-PRVS: <BN1PR02MB1521EFAFE2FCEF66EEF06F2DCA30@BN1PR02MB152.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(5005006)(13017025)(8121501046)(13024025)(13018025)(13023025)(10201501046)(3002001)(6055026);
	SRVR:BN1PR02MB152; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB152; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	4:hYEGtKUQlNwkeqMT874wLM6DEVwBOrcdL6EvtYhx2qM1urPCrY4gYPmUYbXH7a3EPMRsWkgyUthlTex1fRF4NbB0vnHS867DL6XJBLPu9ZLu4TLBQ1np4TS9Qlwmp5Vy+Ew2A2Gs/QPEPXeLVwcCjRlSBZuLBA/6qmmm8A7rLmp//B9Vb0eePDiy56MDSY7IJFFNjGbJ15bUjtF6JNtLsnTBvEhjRTsANCNJMchIyHXJyRzMQD0R+uXFJCGC6l24a6jCrFJKoYJydpbsO412+yDNG8IkeJuWzvSHvtoo/cm68R4GSnkQx3EGJChB0s/mjm60K+QGyoXLfsRv+2Gp4FA1cHSaLv95XuFbIPNt2oIMS2LUX4PPAfPJTAwJhu/lAwMPysCfsbu63cYtBKMXen3qC58tr96Z2P/bcARaXoPhpVri/8nukogY3GorSIf8fEs3wtEEIND64h2QsvANO6joa0D3/hlRuIYH218ooEfgT+k6PjOhv+PkvnaKvMVspItKjTGc8EYzY4LI7jNFEEyx50+EBNt8wtWbhIYJrtpSGokY7oK3r2SZ7Y6DRJzr
X-Forefront-PRVS: 011579F31F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB152;
	23:bRdDCAm5gIiJT7ltympeUqBsBvvYJnaNdyXJHUCE6d?=
	=?us-ascii?Q?yAKNTkrNSGSULTHGXTMukgQ3gwESDX9f+rgkdD5pxSd3aCgON+/9m31JwcbP?=
	=?us-ascii?Q?4zZ49rbo/1fdTnk2FuuzrdHVdfchKoTNgAEMx1Om9kBciGwKTlibYuoRZ0M+?=
	=?us-ascii?Q?lPQSi72MKdGthvO6/8o1dGNY0RfkWLi8fATSWj/Tk+9Jfh+aSHxr9poSSgvh?=
	=?us-ascii?Q?snIgvUnRyBN6gIrxCWQ/fw6CSHE0IeJK+Fkw9lOnKUSH3aq7zJsSbJPua3fB?=
	=?us-ascii?Q?xkHvNpVa8cMnDAWRoyEBg09tHoXoW3UhKsTu+JiaIBUG+haZgT9JfE+Yms8v?=
	=?us-ascii?Q?PNZzu7L5ihhB0wEDeisKwLhfXoq8hRiATSGtUHipPb6kazwZ+J1yHRec7Qho?=
	=?us-ascii?Q?gaie+ylu04mRJa92J9BMwKj6ELj/o4P9X+5Mw3zSJj2IY0otVf75d47tpuRS?=
	=?us-ascii?Q?hC8vXXh5sw5AFj8ER3jUZCTLd4sz6/FlpK5Bd8GEqfN651y9SljxTxMD428x?=
	=?us-ascii?Q?i7O3mvDszwYcNqHuA5GNmFSj7hQ92P5/4/SUvHuy5246bsdiilaAU9F1NY+F?=
	=?us-ascii?Q?TU2nVCtKu9dLD0ZQIK24xxgjfgCpM0jF5yYA27hdIqPgjXV7RiOnYu4J4F2X?=
	=?us-ascii?Q?yCAl0mdIPWUGaHM8n6XMVUNZBv1utj0lP/GOny0aY1/W/6tPcXNZ9As0oDUM?=
	=?us-ascii?Q?3OeBx831sLa1t5aRDNoM17l2IGJVtsnUGS2cx6ux80X/ao8mNbVrT9mZyPl+?=
	=?us-ascii?Q?K04A5/ZZOnpTdsFeAxbe3hjoxFotRkD/hN6EIA0LtzucbkyqiX1sjn9uwuKY?=
	=?us-ascii?Q?dTUw7eHHck+6NQp9eD5r1PB5fm2UGLMKwBPr+k5hua2HTQXO1g6tSg7to39S?=
	=?us-ascii?Q?j271OmpThR1qdyrUc2/4RCAj4nlBhUc6NL1VucJYOm8aAZ/HRL+cgbHB3IGi?=
	=?us-ascii?Q?/QHZNv74wTr3GKR8m3/pXeKduW9FNn7h0MO1941w22/sJHmJxaURLvZnbuUQ?=
	=?us-ascii?Q?upGH71HyxEUEztFFq0jJEypmIOnoF84AUN1jxEVX4dIResgxTebIGKQAjsT5?=
	=?us-ascii?Q?VyE9J8nZ/eboHjysg/4DFVXxU9jjtLb+/iylTEsTKPqqLijwlaFCBg56p9+I?=
	=?us-ascii?Q?QpESUubIgtROYSUM0qGswMbDq6LxWA?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	6:qkCDDOstVGXr4OFBMWbC6V/EozAIo0kV7r1xvqLq93EDiyUZRgQ3ou8/YGSNmoI09CcWs7b7561sFsJK9tF/zDgoRw7W3yAn1rXyc0u1zmSXg4rl7jRVwnHLjryMfM47iMatx2z3Oy6/TiCStkirOIhLXfXOX2M/l26CaPb0KgmtRBjrii0xEkFauSubYzOKh3CASdQljHrhcDFhzSXe5fy0mzY46KSIV9BOQxf10qLT24osT7kZu7v3HcfP1xDE0uXH6A1A5QjK5xXPecapajDrXqJzL6BbCZ9eFYCCC+Qxv3k2uvoiMA1VB8Z23T4TCt3OcVyNaW10G0MYH1fiIeQRRO8JqtbmVeruutqWX8o=;
	5:M9fiyQAQQ+OjlKtATaKATEqJfFruHYdeyiIDddU8h5h7bifvO6fDBewaX4ZDNXABR0UjA55u+bQfCdmSqqCOkW5XNbCwB95xwvqXAMDcCVyVXtxOHUbxPEM20rd7yW6Sj+4+ahmPsbkcRX4bw5bKzAvHEuBMpXgqsdrWKi+xlwM=;
	24:GdUl9Q2gEORqjk9ELqC8MA2D+e34kF5NqJfidrj8I3w+XUn3xjJN8roYltOzvM89+P1JsjT4wYQ1ktGyq6ciS7iBGAG+2W1tdhsT32YLtys=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB152;
	7:sfoMzOov5Jj0KOkbmm6FzFdzDGRlQ6i32LzcgCY6WJlCX3WxT1P2hLIFQSV7L1ork7IYXr1bPtDlPAh3H67j7NDLsm/OZyY9W2InBww0rOuNpqU6PaW97ILiL/Yq7EAjFtfBvb3zJp9Ah8YqXUkmIceoYUnjiXwDgJebqvTp/0EuoYnxS81mplTFc9DXlnS4SbbHQ8H5qwLnNX+J7XMwYeeGqheNyDch/HhJg9l5R/wp1GKOip/BYm8YVLselkN28xQEBOo3APG9g/b2rO+PS65JOUGMphVAYacQsEo5Tn0psHfc2y1ILCB3MtHXM8V2+/hwxrwGGvcc/7tZw2UUBkGjk+Lf2jiaihzN8wHgahg=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2016 00:18:56.9343 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB152
Subject: [PATCH v2 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Thu, 03 Nov 2016 00:34:43 -0000
Content-Type: text/plain

In some cirsumstances the user doesn't want to supply a kernel, rootFS
or DTB to QEMU. This will occur more now that QEMU supports loading
images using a '-device loader' method.

Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
to avoid supplying these options to QEMU.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 922ebaf..5f60312 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -453,7 +453,7 @@ class BaseConfig(object):
     def check_rootfs(self):
         """Check and set rootfs"""
 
-        if self.fstype == 'nfs':
+        if self.fstype == 'nfs' or self.fstype == "none":
             return
 
         if self.rootfs and not os.path.exists(self.rootfs):
@@ -481,6 +481,10 @@ class BaseConfig(object):
         # QB_DEFAULT_KERNEL is always a full file path
         kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
 
+        # The user didn't want a kernel to be loaded
+        if kernel_name == "none":
+            return
+
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not self.kernel:
             kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
@@ -857,6 +861,9 @@ class BaseConfig(object):
             k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
             self.kernel_cmdline = 'root=%s rw highres=off' % k_root
 
+        if self.fstype == 'none':
+            self.rootfs_options = ''
+
         self.set('ROOTFS_OPTIONS', self.rootfs_options)
 
     def guess_qb_system(self):
-- 
2.7.4


