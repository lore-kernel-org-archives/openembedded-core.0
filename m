Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0071.outbound.protection.outlook.com [104.47.40.71])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBD073216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dCag8K3arSjPNoZqxZLf0IHL98/NX4g3a3uWhqbBsI4=;
	b=0J+s0Khfm1ynYg49GoWBusrfcqV9nwcvhPGa5dblV7tpbDZrHSYLdbVCr4j/iA9q/xkTjOdSuvuDsXDM6hfN3YRiZC1fup8ILsgy7MKpjqAAwoxTtDSVFLhTGfwb43YkUrTvostC3mxy85dEqqgQxrkPwGqzL5fMkB73MxoI1ik=
Received: from BY2PR02CA0019.namprd02.prod.outlook.com (10.242.32.19) by
	BY2PR02MB092.namprd02.prod.outlook.com (10.242.43.155) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.549.15; Tue, 23 Aug 2016 09:47:42 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by BY2PR02CA0019.outlook.office365.com
	(2a01:111:e400:2c2a::19) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.21 via
	Frontend Transport; Tue, 23 Aug 2016 09:47:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 09:47:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60429
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J5-0001l9-Iv
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J3-0000ov-SJ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:41 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7N9lXeA008022; Tue, 23 Aug 2016 02:47:33 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bc8Iv-0000nv-2R; Tue, 23 Aug 2016 02:47:33 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 032002CE077D; Tue, 23 Aug 2016 15:17:31 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 15:17:26 +0530
Message-ID: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(50226002)(50986999)(81156014)(36386004)(47776003)(8676002)(8936002)(450100001)(626004)(2906002)(4326007)(7846002)(36756003)(11100500001)(106466001)(5660300001)(5003940100001)(81166006)(305945005)(50466002)(42186005)(63266004)(86362001)(52956003)(90966002)(45336002)(33646002)(356003)(4001430100002)(2351001)(229853001)(46386002)(48376002)(586003)(103686003)(189998001)(110136002)(107886002)(92566002)(87936001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB092; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:fHq/q85cJHr25lpBJDnLH1RyaKw4VE0GmtNoPdf8buxl+bJhexzeHfLAOIL9+irqMcVZL1PsEJlNq9tgGOJzicz/2lFY81BadVvI6mC1cv2iNDkjY2oNDAxWvWiQXj534ReKzsBpTNlOFhwE0r8S7uWmeX8qEv3VwKxKWV1gPceySEMMqPDoDi0/lAp8n6LhifYQMln++nxO/j9z/pLGPNaVJcMYAPwWqmfcE+obyNffcAO0oB2M3ZJVlFKVDoUsfoVK6+6pmUvIcH35m6ERLJYHI+UccyizItkugfvAfBWd0T2/UU4rRGN9F9ZKwTlOC951Rr/yp7tyqwSov89zWMlE5wOJzpLcFxeMvOjdKNzSNS7BrymbCRVAfW7dPStSred0LdkZRkzhYwkWkpPbteE20SYvBaDt92kiaG8lleHvIjsIqs6Q5d/cSj1bvfk5vmDQ5P6AxaeRAYjwzy8q+8tvjyEwG7cJXp1uSUibY72306bQiJTh2oE1qoVZTH7qq2WEWif/nYnfOAE2gxzjj69aW1L7mEsqaZu/JhdLFsSGH9BXYmxNa5RhCDceoqrU
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0831d285-4bf8-4402-f0ae-08d3cb3a8779
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB092;
	2:s+Bp8nAeUnKspL1caxePyoyqh97Rc7wZa9cRYvUZ+mb6sKBaVCVfxzJQnytZtQYF8A3YEtUnGVrwWoavs82qSnboWLeYJLkY95FoBMzb8JxWmxXii9vUZKBjSNZxLbRoIw1UM3kogrKLhE16pbxJb1hqHavzDPUW/p0po6gYs3+tntjuAH93n56sXe7Pq6PF;
	3:UVzJG1D4K2pNXie5glBhHMpDGkqWWjPdZIsbk8gLAYMcKq9KAAkXovJnYvel2yQSp5tSn/GHCb4CoKtNXwDUKpmxAOluyK0payVFG3juEXPxg1FGDSrYZMgJQOTVYA1vhr4kVexuc9p5sL+o2CH4XKhROM4Io/GWSptmmnJC4l41EWCtTb4hTs7X/ysjE8ZdyRptuDMUN8pj05tMh6zErCr0iHGbtnwFq0U/YUCyAQ6etc2amAjdSUX07aRwQEsivENTik055LnkceqpMLwXyQ==;
	25:NMaLctAZwd9UTl+M48i4u33jxDtkZeDPDapdXS1oz9f7K5onyRXTYFhTH6ucQYbx/rK06gOwrEefw++/HFiXe/KHXbzvvsMmhhvCj1gKCefcO5nseg/QhGVRMP4IO2RWR6B5f6+L4FxgrwiZ0gKewx6iYRhY+XTLs2T3eqk2Dmf8ETJs0ijYzrw4868XwhsoznoOLZmuYoxqFJFRPPyBWq3WpWv7XCcFtHOtSZ1wRDADUDI1P23LEpnmRGyWzyCNUSgq9dE6yMFFasODfarnkNDsUIpYkrX9tohAsEWLU5/NyrOx5ASQU/f7htBvnLfN0XRyRMtom1ResetL8w0e32Uu1O092i9SHAmDtOSRw7ogpFsGeANyiE40i171kFbXno8JJ8yO5z5kJleumbC4S8/Ilrf4URECZxm/+yrC0p4=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB092; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB092;
	31:S/oQA2uiZAWdHJ5cEkI2ifNn+1/1ahjQbXgHrA4VQwRoOreS8e0FIHhJ4vgn5rweAYOzDmEyJVCcYGprsqeL+rnDYTjMUnKp7jruph56JJ/P3sVMKpy8XUVkFMrCIKmxL/fFVzi8RIt+TG9XVPLsnwgkF5Nj2nvfP9DPxpkPiSCdgnzfAd8DWTns35jgZfoy1MCQ4cR//iaPkhT03M5wUnyLK3ElWaTbSq9JJM9YQX8=;
	20:rWjGTke9Qbm6avlBHrL5yEvNfp1mjtsg6OYYYisXrYS5C+oTSeEolYRNIiUH/dwNis4LDHgI6yX4+2bcad1YQaaTvdm7x7xZUhTQ8Ysy1Ko4DBTC2l7+3049OaNYL2GUScaOR3S7uUhK2j/in8Pv4q+5ZHWgiB5fc5tMNRWEyOsv0+WH+NhOFKYgPKuwRliQDHEPpsHkelPWmk1/0iVv0mvG7T53fgJJnWYqFr0wkO/+wvSQpWi2psJeIQJWGl1NJgb3hhYxzOIc7UYT4SbkOAonZjkxmek3JJQquGEMHQPpjASXF8HxJ/uHlfXp+KIrtLAAj3w7+ww7jeAHqFiej0Xmslx/13rF6VqLItQ26J7PrhZx8fvpNJGnB1sSR0uAN4XhK2tgdgJVmra/6vqlufi1D/ZExgq6bSKhMBJQUicNLXBk3Cu6610FYBkRVn6kHcA6MaxF9xrSNaizM97cuq/+RUkssfRjJQMANuDaAaUEl5RagQd8TTc6waCGRNpj
X-Microsoft-Antispam-PRVS: <BY2PR02MB092A963269FFDBAC702C366BDEB0@BY2PR02MB092.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB092; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB092; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB092;
	4:+c84h3xFE70o7oPmNU3cVlWB0Qw/8Wmw5g1XDfrTCfrpVasxvwBcwSNWjWaHDxHLPCEyFta3/QLpNpoVJjrGs+NrB8KG9ebb6EDPDl6STNpUJ8B3zwMUQC/MbZ3lwv2am27vG2INeExuVZ809yG1ce29J8sgxoWs3nYs8SQPQdWbmv6vVzYVA4s26kuCelXBB6iIjrgCbez0VHq/WvuXTauK3lFfCwTcQyIAiNMZ1xZ8d03w0OkCVeXrdzdgFoVzErcgY4QfFffVVnJyKtRz0IfMnyd9Fouwh1uLbZUAqqb4ehqUJHWxg9JR6bsY288X+gPIasumzlxkT9SdWUS2LmFkJT9SdKD/CAALRcqxj4Je8oMXuJl0JZS/wwc1fWRinLaf8nIZJN2sSMFuSA5kWpWa/3g+UKyaGgtHUf/R96IX+1iPe+jxGlXRlsOScX1Mz97uESKUKMHk+e6hj1Lq0YeQ9NQiyDdjSAjbxim9yUFhNwcGksO2I01eTo2jxAdX
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB092;
	23:yhY3uAMn2S2fYG8g9BXErTrM1L6ZuxJgy898Ze94FW?=
	=?us-ascii?Q?Wvk2VCePRRgbT/MZ5y3wC1RrCm5QyL/mHBQIjoxSFZeZxNFSWZpH8ANJS8ni?=
	=?us-ascii?Q?/aVL3aqkjfmAn/IyK/9FhLurjZEey/s43o82JTkWtezdNMvY6JnCmCAq+vQk?=
	=?us-ascii?Q?OW7zpyazfN1pYaqBFdf16LN78TlxfRSsykCly+i9C9AUdqWjMIcR+ppOp7q3?=
	=?us-ascii?Q?hS1yixzW3N+7x6cSqHL9OdIMdtW6tjrWpgqnKeRSBDqGves4h5DRwgTLCbwJ?=
	=?us-ascii?Q?i2+3eL16Ul9UHhRY6OHandckwqZfNQIrieuQz5pEjkVOVasE735xnFliosQm?=
	=?us-ascii?Q?nNriDwmP22jW2RXDeov9bgt5pN09KeSPhRCkYUI0rDbPt9J26J/AFt0vZxEr?=
	=?us-ascii?Q?oXep7/gbV8Gu2q+V56FXLK/91+MFHhgE6uG6+D+zUZ+yu8OU0d4pC5AEbV0t?=
	=?us-ascii?Q?BU/b1BwurTUCvSVjzfbmpWhUMDye92egjWnnIsbz2XApvCzDhOmGIjg9zWU/?=
	=?us-ascii?Q?Y1GZ1dJyz6dySccmCHXROcL9j1XlLlr+w4ZF8dFq3SajJ2Mb85xrs1ELHspr?=
	=?us-ascii?Q?0P7HtViEVAesjsp+31sE2v+qdeBSBt/EQwdnyd6OV8etUWC4uvh+NK/EIrS4?=
	=?us-ascii?Q?LydP6hMs07Dk3Q7zGLlBT9v9gjC7Tm7BHPyzFM3lE2A33tDSGXzSorsx0Qzz?=
	=?us-ascii?Q?ORiMg1RClNuHYCkgeFddTT9/3RtQQyNYFvYKQBylkUjkSDfuL3F869DxYGq9?=
	=?us-ascii?Q?FpEJHzI5j9iOAuOwGt4QGQePqbLtmwPxw2GfmUABTptKFvM2vyyXpGONg581?=
	=?us-ascii?Q?VIfq9KYOP1kqBGgTkMatdoI3SCjmaPW23VeAHzXR/uRdhvEwf8in8uQbYCr1?=
	=?us-ascii?Q?J9d/n3hV1ckfWgwuYupTSSSR6hd9dWDDBSsdsxSaiKDLI7H4dLHjWbSFMrNu?=
	=?us-ascii?Q?ANlueacUseE5IVRIsUH1GyuX5KXO5/L+LBj6b7ZWKX86v7JLy4PW11lVqSYS?=
	=?us-ascii?Q?RWNQXx+cTc+0rhfCnWHSSqUfXF69mGz2s0rYRHD1H2eGCpm71olJ0ilNl3b5?=
	=?us-ascii?Q?5Kb9AzUgjUhwetpjbjCtLQavmUvAvQREX0ptTUwq5Tb8Q3tpww9qpCqDxDsu?=
	=?us-ascii?Q?0IQrA8iGP6PV29kh+xe5/J0SD6MXwg4XiC0pO1FY/o1+D1ArGVHw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB092;
	6:l1suZlnTzP9XgSz9nwAII3FBpzpX6VDNJStMcYGN/5dFVgMwxpntwslHmGDdKK284zXRe9JbE95RQyiIQQMf3mSXNJHJl0kwXrsyKNMOUFMCQ7dc6NBm7s5us5vBYDfypmzaXSkP5rxfPYeLSKCG5qYJnEWYo4+tjfq7QRFxg7ysB6pfDpwrEyufPSNR/H60tktxod+ZEM7XBm1wVr2/aytv4Xiw9CUz/u50jumK6GH4HVcIlXGDT8YGonU9QEJ5vV49Rkuvc6P1B4wClNfgU/wzsCYFlUhPPf6Q2TCPN0oVbeRi4dMJOcDv+BKNEeZxVpPIOZrdeHvfy2HaQZOWKw==;
	5:M7qUWxtH5lJ/MML4zIiYxjsqTtRt/lW1XC1kn3rSoPDOx3P9WIo5tMJxz6pAseuKlE0gUHL6HXaZAJx7U2BDXaSuje5l0OcKI4S9+xChJxO71A+uCkMLcEsZXu/M3/wMHOF7p1CFSYGaelhDQ4+O+g==;
	24:/Tx0OHneMHo6kgAS54BoYyLolf+2k3EzvirgFpxxAaLqTyCAeUo/IoNkn/SoQdMzmbNy79nhDSaHkfqp6EYrXm5UyNOBo1wthXFv056QN74=;
	7:w8N2py9QSVZc/kVnvM9dPnMuiYeb2FwjOmowhyGqYDvAxr4gI48PM9HU13R4BAZmX7RAW+XInl1b9xnLt3FKR0Ovs/cD/KVr3AOuQ0iTJdfRqU8x4Cpkk0XIPtkAWFZPC5AnbHpJhjSxzcH8PSjJuY6MsxF14Gc8j8k+qDDnJuC/RFsJ2HnU1BnoLyIe9a5hychTvrjAJPX1m+35g83UZt12LKCwBGSEjLMrEe4lu7TW2kbApfYULVQNSLSx6V1z
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 09:47:42.9266 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB092
Cc: Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [master] [PATCH 0/3] Added cpu benchmarks
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
X-List-Received-Date: Tue, 23 Aug 2016 09:47:44 -0000
Content-Type: text/plain

Added recipes for cpu benchmarks dhrystone,whetstone and linpack.

Mubin Sayyed (3):
  benchmarks:Added recipe for whetstone benchmarks
  benchmarks:Added recipe for dhrystone
  benchmarks:Added recipe for linpack

 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22 ++++++++++++++++++++++
 .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 ++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb

-- 
1.9.1


