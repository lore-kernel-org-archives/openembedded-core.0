Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 925 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 09:09:34 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0067.outbound.protection.outlook.com [104.47.41.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15FFB71E52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:09:34 +0000 (UTC)
Received: from DM5PR03CA0033.namprd03.prod.outlook.com (10.174.189.150) by
	MWHPR03MB2799.namprd03.prod.outlook.com (10.168.208.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:05 +0000
Received: from BN1BFFO11FD040.protection.gbl (2a01:111:f400:7c10::1:122) by
	DM5PR03CA0033.outlook.office365.com (2603:10b6:4:3b::22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16 via Frontend Transport; Mon, 15 May 2017 08:54:04 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD040.mail.protection.outlook.com (10.58.144.103) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Mon, 15 May 2017 08:54:04 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gr005326; Mon, 15 May 2017 01:54:03 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:33 +0800
Message-ID: <1494838358-28036-2-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120451548113;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39380400002)(39410400002)(39850400002)(39840400002)(39860400002)(39450400003)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(189998001)(6306002)(50226002)(8936002)(48376002)(5660300001)(50466002)(230783001)(6666003)(6916009)(76176999)(50986999)(2950100002)(305945005)(5003940100001)(53936002)(110136004)(77096006)(38730400002)(33646002)(2906002)(36756003)(85426001)(498600001)(356003)(105606002)(47776003)(2351001)(106466001)(4326008)(575784001)(86362001)(8676002)(8656002)(81166006)(104016004)(129583001)(146423001)(17423001)(121003001)(156123004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB2799;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovr; A:1; MX:1;
	PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD040;
	1:Nsl55d1RKimNDOyPogxTCdZOQSEkAUB04knS3BSRKprksMfoLrJTpPddmAZgs2DbFgZ19wQJQVszvWYkMFVvPP5PvvySj53tjv/CoYYTPitZVCf5LA/rP8+BrM2qR6cOPtQ5+yYQtMcUFipnWg1LbcwksTjeOo3m7jRVXyEbX3dFQ0VZp8W5zZbzw58M5IKc5SdTqkjgvZxCPAK1PGKdSQfeFpuTLSJZ5v2OwbHoVZGiDxDNu1/f9GOPQlb3RVuRfUybIEv3gI2eaiU4vfrJ+QS8vH7a4wEo47UtqEs/uMhpGTO702fjKV7xQJ0kcO7BZnkACedKd52jB14v2H6P9F/67dZCzzDvkLNWDhbQpLw+otVEcAX2wsCmz/r37prYeupQ/TSo7hnOxXmT5qCwfXffTI5LqgiYfQaiznT3NF+XfvnADLAxEwm4vs1KUeEVtWasmX/zRBMZShbfjt3Efj8AAfAwa2nFFkQt1m/Nfj7Vp73yHR3Xpt3RVPtOSnD2qWSnXMzwtDL/G6BlgBrWAfojcyMOad2b+Bo7d9i88QKlHz79asIk/FbjRCYC2je2bGBXlX2aJN1LyGMA7KxrsNtlS0fhPcpg04c70VdhJ/NCZqTvpwx28bf1nn5GvEBG6qaM+vUQh3o9qaHyMO8/dVh/Ih+U8JbAi+tyoIHFkwUVlcv4J6KGk7CXxAAT8YXTQoQv635JGFInpWvSGtaipD1G1w+MO2GxKwvU8tz9uqQ=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dde4dd-3749-4c23-d3d1-08d49b6ff0e8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:MWHPR03MB2799; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2799;
	3:EbCb/wfrWZqY3Nklivt2oEb+wLmy0CsMuH8xa/WiXPWCtjZKUyBWNvsd7oI/88h3a0hxGdR//OCjLFz2ObGdd5Xfpaq4UgxQIv/qcLt+WvDjX1g5oUfC+ppO79aw0VV7FBtZOd7IE+KP7Wkuqy+izkIRcMWDaxlVSjoGex/6qZTQLaKfmqLVEG4rSrxOZUTExZXt1i9HTPmkHs/Jo5VTI9nKN/K3MxFgBIbpWh9BsF8HtoymBAjiYlJ2Lt8nqDsZI63LfX1JolNVRftCNIF4y7/V5BFgqS+GOcsOq2nJtiFnv4WhTOFk4O1vNFzDCpFh+JdNFWoqu5Zs6otLLF6Ax2rv55PVMwAraLFdD6Z8FO/WY48Gc5rAoTwY4tO3RwQOFw/e2eA5AluqrPUrBnixI2diO+t/mNWYhzNBIWv3SK7D6Scw7GfojNV+9ZHf/Wi3;
	25:pTCB91+NgUa7KmVKWSPvFnhGm5gkGyVsx4Bvh8BDe2h63CKwbIObH1EvbDeLKq+sVf6fn4DTMPM9s7Nb1vr7jui8yXBm8d7ERhKRKDVYhY0+Z16jv5zzTuJa9EA3NxLV0DGogZ76KpNyO/If4zgYPzsGq5Me/YlRoxLGu/TTihyTX1Gfx1tEFzILbsS3T2ckZeq/LcIkxIWVcKcpZQrdgwJcCUDv4Gu/DyJKgwHg+TEzMclDRUT8XvObMMQgdzVFNjyr3+xsN9IgEzRpAVxa/un9egUXWPa6KEE4gSOoY2R8gANWYIzo1PfNWb54zW7Jf5ql2r3a7jnaomjw7QSCYZvUHojUMy6sBFKC7j0k+eZjG2o2ILDRu1LWA4XhJAj9KErTc+GNgwMwYE9yzsfBeYCIyEyd5eEEM+N0UVBh4pykQ7Bb04TWHkvOAgpzCpaENdzdjUC45Ff6dy3FLorwfw==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2799;
	31:IfY6AG6ID0V712QsWtbyxauCLLNfLiCpub90kdRzkmPwk7IAgEB+lpsypvFTkkGS7nAd4TYgbJHRMCEAscV1QJBMIdAufqdbZM6DoPXQN7x5jdcbbQiIerjS+1nAE2AAx/W3ru6BOytNYD2WiceZ8hRckCsm4vXD3ETKCd0GVMlWY/6+xuer5b1+9vDl5bCykh86FQeCeN1PJhFBTqjahWhcrUEJE2RUKX9PxOn+xyPsSnUBCJf1Ju3U7hd59TPph+DOo4T7YIu2mGuZ0yaoiA==
X-Microsoft-Antispam-PRVS: <MWHPR03MB2799D0BBCD5A8747E9FF2622E9E10@MWHPR03MB2799.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13018025)(8121501046)(5005006)(13024025)(13015025)(13017025)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123565025)(20161123561025)(20161123563025)(20161123559100)(20161123556025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153);
	SRVR:MWHPR03MB2799; BCL:0; PCL:0; RULEID:(400006);
	SRVR:MWHPR03MB2799; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2799;
	4:0v6578K77dl1+tb4nP/L7VkcxjjGShD6qd/MpZ5noy?=
	=?us-ascii?Q?Es5DOh8PqOCL+nW+OyA0we2iaU3oPjQ/N2nPIEmdsnAleygTAGJQEzwlGnlz?=
	=?us-ascii?Q?HF0vCa8CUU58eEwrdyySWq0lw2R92uoakzdQNpSnQGdoNd68XFyPv5DiF5dH?=
	=?us-ascii?Q?horPswNnakwiGuPZbqhlg5BQ23e3Zds+8koQ9hn4Uh6kqoAKLRviOaq9pUuk?=
	=?us-ascii?Q?FIjNbNtUWCs/S00WfxVJWnM4M+Qlg7+HHedyOYoJMntz5OMtkGYa8NR4BpVV?=
	=?us-ascii?Q?ShZ7+hZXd8r+BnlS1cLRZbff3iFETavoJwvkPICxJerYJ8cgeTrDeeifjL2q?=
	=?us-ascii?Q?PooikkPtB2R+z7fkaRymkD3iCWDda9slnm9dlI230SDrEzmInyLvKEK5Su/h?=
	=?us-ascii?Q?xY/UzidEJNRR821ewDVUiFSdrWlDAvJdHjaSbPacfjJij/grc3NxZ5GUfzQf?=
	=?us-ascii?Q?dXJtabYzfU5W/lk2aJXhnRescodAB9HUGeFUjy8XaG5fXdJhyPzh3DbySUYA?=
	=?us-ascii?Q?cAZ6KF91f2lV8UN8XyyFToT2w0tdP3m6UP2NT7Pe/QfHtNupiiGM0dFfeEv2?=
	=?us-ascii?Q?NeI11y1tBhl4wh7l3LVXzBx6H6BW83mvU6LYrrbK7TsmDrs8la74VPVdz4gh?=
	=?us-ascii?Q?mSv2zJnK0ooRJIKMbDi1EGhYosn+3ZK3p8MnSAY8xBCGzCay/rfQTZvO/lM5?=
	=?us-ascii?Q?nt3AnIkjhdUFWXws6k2sBr2indaceWk4yUbrPBmDTENxxTX8vXu0jwH7uJ3N?=
	=?us-ascii?Q?3vWqxD3fmvQSAGrFo9o7FOYogutDs2YweirFW5rUgKFlRknzeTUb/BRCUR1u?=
	=?us-ascii?Q?afYsXHanuxRU4CvqvZlb3GO+QhIGWma0KJCNlfDg17HlbmNx+uTFTZlrzl/A?=
	=?us-ascii?Q?sq4q7GFpYd+G929OuLpDlNfak5E6UlfZ1ZYjlt7VJpFzLSrzSGYFzBseEPOk?=
	=?us-ascii?Q?Etj1jyvhM9g9+mjFx/KIr5Gn3IsI5VB0uhRHupSw=3D=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2799;
	23:SQYw/DBhoc+PdDNi58x8tL51uZVmaHY67lQuNZLa3?=
	=?us-ascii?Q?0Pr82yaR5D40rOAvE8Y/miyXkWKcJAFSwAjv1jvqiA06W/1hSJ/KmdP54mYd?=
	=?us-ascii?Q?3tCDT/mQAmbxrmgZ2qcdfnJfDBUEhUX/lCccuGHylyaLMNc2wBEN/0dFcodl?=
	=?us-ascii?Q?wSa9XnYodw5dgGXlTFZHUkzx/oBcb+rv9ghcSnnpTIxQT01kyagkykS2yAQR?=
	=?us-ascii?Q?IZkYZm248tUSUMwtVEMFBbPFSqJ3aoEstvKls5INYCeeK9MO8Wmt8JdfuOo7?=
	=?us-ascii?Q?ilIViLqqtlWLSDvsgkVXUcCClRUxWHOjPYpkn4IpKRetJixZFAjdfQsGIgHq?=
	=?us-ascii?Q?J7qEzA59v2d2cpJSWGrYPSB03aB1L7LsDdC+65uTpIyxGCAAo4SC8+b6b+IS?=
	=?us-ascii?Q?2GGxJc0RJBhp3SiX5f+CQbWFucFny4eMorChRAFjkmuOVLANQQciRdWW4jpU?=
	=?us-ascii?Q?23SZzckYK+4mHcRHt6d+9l1hoau/at3ot1sRiZro0acdjx+Y5WFqoCWNDsdD?=
	=?us-ascii?Q?cD5rueJtSmfoN0PpDyDlLU5oSQ6sMmtQSliB2OaTdgn2IsWSLrHXBb+i8M5U?=
	=?us-ascii?Q?myBCp/Rosr4AAdlwzbxXuIECFSth7idOjE7cyjOBuKTkF2qAI/0UK7sU6mVk?=
	=?us-ascii?Q?oAIb5tr+VPAyaztIqhNfVhXhIp231zmFa6d/d3+df2oR5W6vw4M0Km757NKi?=
	=?us-ascii?Q?gernaCAejySa96bTldCIY4i5HO6t7dx6Q21zdPrcyzy4lHSgolNIR3e00cFS?=
	=?us-ascii?Q?m2FpuOgalmfHur0nd3QglghiNVgIDGOgOgEhSOy43L1pl3haA9JaxIdW6QOx?=
	=?us-ascii?Q?4gfzqNAQ+27M8Fxfc3boxy12M1I0vrbN9C7NIEnDYtWvvFUgoD0y6JlnX30O?=
	=?us-ascii?Q?ucBMmmXSnntK7HYKzNnpaaGM3pzBhJVK3vx9ArOq0yoNaQ8FtdXJ3y69v8qW?=
	=?us-ascii?Q?+4gFVo4S1oS9X/vc5/rfWd5ZPSNgup6mtzCWdyBbtfLKer+H3kd7wu6uh3kU?=
	=?us-ascii?Q?W9jCgKarEuyM5Tku/h3vKm6/f/EoWkDk6lHkT/lcvJCFMmESeYKz1CRlIpi0?=
	=?us-ascii?Q?BVlR7ay8hdc9g4g7utnaQu7hufIRDUhSwQDaZJ53kHyvbifsXfNisNJUcPGR?=
	=?us-ascii?Q?9Pe0tW3wXTMuyghHwneWgu27hVJT5IaRhEiz14fIP7Dhm8YIj4lc8q3gwKyM?=
	=?us-ascii?Q?KTJhnu4uUoUIKZiWTXB5P30jCeVLRhltgZiN+kRWzUdvITCSmxUGsx1dF+Gu?=
	=?us-ascii?Q?e6Q+VI0iNZQM5nP+U8vBIW/CL29GP1HnCl55q2+33b/FlyzwWpo0iRwkAhmt?=
	=?us-ascii?Q?dp3qNoEL5Suvrtj72GExerlH8fgAItwlq562EnE1tauMYBhbySdH12IuCN4a?=
	=?us-ascii?Q?EUlJFMh7AZC9i+w2NrQLsoLRFQOReQ0V417uKIud7YT7R/T?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2799;
	6:OO7awnHoEvPHgLFOEHnX7KS+qq3tFR6Ob7XcXhpt9cyW2CYncbDC5Q3WAec/v69LLFFBitWBOe7bi4IZTkYBwZWhUW25FMxffv1Nf1N7Bf060zhzOlb6F8Xe1jHsk1weVfswo/x8RbphGbne3aI8xjQ+nomgdC1Bggw4wI1VwtJmBeFZ9bRwGAG/fAj7UhNJ1TTvK6bwUShdeLUo07CXmdK+H+fYPidaqrW5oRsHeM2LqScGmlOPlwidCJS8K5PadMY9bcsOIRm3vgf32u2GGBBPvQ9EDtZA6x+ozoaF/v7UTUt4Z/6kL1XsN3WTez4fXJJmxamJ9N/V9u/CyUTb0utdFax+1lCEyNbns6YSGPLQ1TpVBybtfJ1ymSXAqF08ScHFrmsxcuK7oKN2NqrqeZTUPH2GD4bYME+rW1j+t07I2c2eBaOVHXjCwvZ8ZjwG+MrB5srEJegumRwgq0tBbsA9AKQeHMcqRj82tKy2xlNAo68x/zHvfEwBamHjZWT4quczNHFsjGnz+SMxyIBc8g==;
	5:x50/GBPlHGSLM619WiPNMvoijkYy/5mapdKNX073sU5BuF9oi0vxy7G6svGfKYUBNfeIBByjofsxl33apNWP3MFSJsbjG5EEw86fgIEKx2aC9BtG/019p/N7u/ABVgV2sBGb8wUn0Gd2ksJiyZBV+Ya9ikBaCqsn780ppb/mIH5jl/XzOKsbKXGDSDVrYLuI;
	24:R00vo2M9wEZbMDajIFYtPohh1FZrhpOUq3yljZSiTfOOR9DA3HHnUloAFXmq+SZ/kQXNRR2U87tiF4WT1M6ROAL/lBYFkctQO0JOsY2FL3g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2799;
	7:KgdTcAluyVlo0xrEExnKMF9TZM0veo8IKvmG0A9KBjXdDVnrJlgyypFtf0Zki+a4svmx8FxZ4VaBUd2Nt6HpwUAibRZZzJxoI0oB2gJS+GKnB6Wg+VrOrdaq6F1SgmWllO8a3iK7mdSfPOYni3Im/cyONqAH8KtwXrLsfhFlNIrnaXvaOBc2PuTxLX53TeYv6uEk0K+BuPflnxKU1K0B6C+u2w3YkRS3Bk9rCF5sV8tMhdycWNN9v8hVmdJyNN5Q0zG8t7TOqjXM4yBWIVDkH5Er49T6ZIrubUaVEZGEKfE9OCaNzWNhamuP6xlFp35Pmz15Q3uH0r+ZFr1AYlkv9A==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:04.9832 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2799
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Add some enhancements for qmlglsrc
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
X-List-Received-Date: Mon, 15 May 2017 09:09:35 -0000
Content-Type: text/plain

1. Need set use-default-fbo to qquickwindow during set
   property to support change render target on the fly

2. Calculate qmlglsrc refresh frame rate in qtglwindow

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 171 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
new file mode 100755
index 0000000..b4e662f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
@@ -0,0 +1,170 @@
+From f55cc58325ed5df0b0d5fd0a61ebb32d735c2481 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Mon, 7 Nov 2016 16:31:02 +0800
+Subject: [PATCH 23/24] qmlglsrc: some enhancements for qmlglsrc
+
+1. Need set use-default-fbo to qquickwindow during set
+   property to support change render target on the fly.
+2. Calculate qmlglsrc refresh frame rate in qtglwindow
+
+Upstream-Status: Backport [1.11.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=774035
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/qt/gstqtsrc.cc | 14 +++++---------
+ ext/qt/qtwindow.cc | 34 ++++++++++++++++++++--------------
+ ext/qt/qtwindow.h  |  1 -
+ 3 files changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/ext/qt/gstqtsrc.cc b/ext/qt/gstqtsrc.cc
+index 3cfc709..350f70d 100644
+--- a/ext/qt/gstqtsrc.cc
++++ b/ext/qt/gstqtsrc.cc
+@@ -132,6 +132,7 @@ gst_qt_src_init (GstQtSrc * src)
+   gst_base_src_set_live (GST_BASE_SRC (src), DEFAULT_IS_LIVE);
+   src->default_fbo = FALSE;
+   src->pending_image_orientation = TRUE;
++  src->window = NULL;
+ }
+ 
+ static void
+@@ -147,6 +148,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+ 
+       if (qt_src->window)
+         delete qt_src->window;
++      qt_src->window = NULL;
++
+       if (qt_src->qwindow)
+         qt_src->window = new QtGLWindow (NULL, qt_src->qwindow);
+ 
+@@ -154,6 +157,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+     }
+     case PROP_DEFAULT_FBO:
+       qt_src->default_fbo = g_value_get_boolean (value);
++      if (qt_src->window)
++        qt_window_use_default_fbo (qt_src->window, qt_src->default_fbo);
+       break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+@@ -508,7 +513,6 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+   GstQtSrc *qt_src = GST_QT_SRC (element);
+   GstStateChangeReturn ret = GST_STATE_CHANGE_SUCCESS;
+   QGuiApplication *app;
+-  guint64 frames_rendered = 0;
+ 
+   GST_DEBUG ("changing state: %s => %s",
+       gst_element_state_get_name (GST_STATE_TRANSITION_CURRENT (transition)),
+@@ -553,18 +557,10 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+ 
+   switch (transition) {
+     case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
+-      qt_src->run_time = gst_element_get_start_time (GST_ELEMENT (qt_src));
+       break;
+     case GST_STATE_CHANGE_PAUSED_TO_READY:
+       break;
+     case GST_STATE_CHANGE_READY_TO_NULL:
+-      qt_window_get_total_frames (qt_src->window, &frames_rendered);
+-      if (qt_src->run_time > 0) {
+-        GST_DEBUG ("qmlglsrc Total refresh frames (%ld), playing for (%"
+-            GST_TIME_FORMAT "), fps (%.3f).\n", frames_rendered,
+-            GST_TIME_ARGS (qt_src->run_time),
+-            (gfloat) GST_SECOND * frames_rendered / qt_src->run_time);
+-      }
+       break;
+     default:
+       break;
+diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+index 3d96751..edb6b24 100644
+--- a/ext/qt/qtwindow.cc
++++ b/ext/qt/qtwindow.cc
+@@ -29,6 +29,7 @@
+ #include "gstqsgtexture.h"
+ #include "gstqtglutility.h"
+ 
++#include <QtCore/QDateTime>
+ #include <QtCore/QRunnable>
+ #include <QtGui/QGuiApplication>
+ #include <QtQuick/QQuickWindow>
+@@ -71,6 +72,8 @@ struct _QtGLWindowPrivate
+ 
+   /* frames that qmlview rendered in its gl thread */
+   guint64 frames_rendered;
++  qint64 start;
++  qint64 stop;
+ };
+ 
+ class InitQtGLContext : public QRunnable
+@@ -146,6 +149,12 @@ QtGLWindow::beforeRendering()
+ 
+   g_mutex_lock (&this->priv->lock);
+ 
++  static volatile gsize once = 0;
++  if (g_once_init_enter(&once)) {
++    this->priv->start = QDateTime::currentDateTime().toMSecsSinceEpoch();
++    g_once_init_leave(&once,1);
++  }
++
+   if (!fbo && !this->priv->useDefaultFbo) {
+ 
+     width = source->width();
+@@ -157,6 +166,10 @@ QtGLWindow::beforeRendering()
+           QOpenGLFramebufferObject::NoAttachment, GL_TEXTURE_2D, GL_RGBA));
+ 
+     source->setRenderTarget(fbo.data());
++  } else if (this->priv->useDefaultFbo) {
++    GST_DEBUG ("use default fbo for renderTargetId");
++    fbo.reset(NULL);
++    source->setRenderTarget(NULL);
+   }
+ 
+   g_mutex_unlock (&this->priv->lock);
+@@ -256,9 +269,14 @@ QtGLWindow::aboutToQuit()
+   this->priv->quit = TRUE;
+   g_cond_signal (&this->priv->update_cond);
+ 
+-  g_mutex_unlock (&this->priv->lock);
++  this->priv->stop = QDateTime::currentDateTime().toMSecsSinceEpoch();
++  qint64 duration = this->priv->stop - this->priv->start;
++  float fps = ((float)this->priv->frames_rendered / duration * 1000);
++
++  GST_DEBUG("about to quit, total refresh frames (%lld) in (%0.3f) seconds, fps: %0.3f",
++      this->priv->frames_rendered, (float)duration / 1000, fps);
+ 
+-  GST_DEBUG("about to quit");
++  g_mutex_unlock (&this->priv->lock);
+ }
+ 
+ void
+@@ -410,15 +428,3 @@ qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo)
+ 
+   g_mutex_unlock (&qt_window->priv->lock);
+ }
+-
+-void
+-qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames)
+-{
+-  g_return_if_fail (qt_window != NULL);
+-
+-  g_mutex_lock (&qt_window->priv->lock);
+-
+-  *frames = qt_window->priv->frames_rendered;
+-
+-  g_mutex_unlock (&qt_window->priv->lock);
+-}
+diff --git a/ext/qt/qtwindow.h b/ext/qt/qtwindow.h
+index 8cb5a2c..697f389 100644
+--- a/ext/qt/qtwindow.h
++++ b/ext/qt/qtwindow.h
+@@ -65,7 +65,6 @@ GstGLContext *  qt_window_get_qt_context (QtGLWindow * qt_window);
+ GstGLDisplay *  qt_window_get_display (QtGLWindow * qt_window);
+ gboolean        qt_window_is_scenegraph_initialized (QtGLWindow * qt_window);
+ void            qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo);
+-void            qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames);
+ }
+ 
+ #endif /* __QT_WINDOW_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053..a5fc913 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


