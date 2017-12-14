Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 28636 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Dec 2017 02:24:06 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0074.outbound.protection.outlook.com
	[104.47.37.74])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4E4786A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ytf5/qFJWXDJKZeX5ueCN2S7Du8tjFC6mykrlcKZcko=;
	b=xL9IGie8rIZibsuJUEiyL67Pa/OyaovfG3t62e1uINfPM2VLKSjB7vmmW4HGhenu0nTtzgvNA3a60/qWotSCeD/lfJ7SzbgNdsUHP1BKclEEkwxBV/rXDemwH1TBMHGbZEwkckr8a9j6GdG6CPZ6P0C4a7EjLOGXC5mZFEHERAo=
Received: from BN6PR02CA0074.namprd02.prod.outlook.com (10.161.158.15) by
	CY4PR02MB3382.namprd02.prod.outlook.com (10.165.89.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Thu, 14 Dec 2017 02:24:05 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BN6PR02CA0074.outlook.office365.com
	(2603:10b6:405:60::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Thu, 14 Dec 2017 02:24:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; tupi.fr; dkim=none (message not signed)
	header.d=none;tupi.fr; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Thu, 14 Dec 2017 02:24:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBs-0001y2-UE; Wed, 13 Dec 2017 18:24:04 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBs-0005UJ-SU; Wed, 13 Dec 2017 18:24:04 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBE2NrOJ005336; Wed, 13 Dec 2017 18:23:53 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBh-0005QW-Id; Wed, 13 Dec 2017 18:23:53 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 18:23:50 -0800
Message-ID: <1513218231-12626-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23526.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(376002)(346002)(2980300002)(438002)(199004)(189003)(2950100002)(5660300001)(9786002)(72206003)(356003)(4326008)(77096006)(81156014)(36756003)(51416003)(2906002)(107886003)(81166006)(8676002)(6916009)(305945005)(76176011)(2351001)(47776003)(478600001)(106002)(50226002)(106466001)(16586007)(54906003)(36386004)(316002)(48376002)(50466002)(59450400001)(7696005)(8936002)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3382; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT014;
	1:vTDj3VVA9dbO1ndZWGEXHZ584YcW1cPanFmEDMIqJJkG2GEaAxs9TfRmxI3UBk5NrUKxtnPksAVzxijfp579ZhWnjzDPcaNC3AZWUXec7fRN/rn8suqCwbunw3op+lHW
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56411af0-021a-4682-9cea-08d54299bfa7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	3:+dwnfX7QAmf1/xGFWnfLN1NRTdx0g4y9YqxYck/P/UwW51J/GHv9Em/1ZRQWhzzBxUQaVqysKYyiRVKv1eWuYBlfIeR90d7j8wRP4edfRD20MMCNjYTmPNakhB9lH4Mwq8SsX2tCjtzHAeT4YalDfnEZPQDn57XDcthSuacbLCdx16Xg8hNWOMCf1ttPbEzsTi4arzaLu23BZ/Tuyl4tdnozhQtA6pPB2NjnDq444GkfC+Ktq32KsM3tphuE25i2x/MSSgonL4OAE8NrZB9EcqF0lWHp6EIxV70mZC6olce87Y3fEjzY19gNxVfejwbAbVom1XyQn9hMZprd4wgTwdMoFL5K8cvWFcQrHQi6LfQ=;
	25:tAiJCSmOMilTGs+IZu42l79S0E4e8eWmULmV2nSzITJ1O6MOk8wT4mi+HsfrPbr8v4sGRLKZQs2z9/7ycj/ZWFSroEgXHQAc7tlgPnESSPO8B9geSYOafU/s5b3FqiXzacKzKk5fnRK7GZG6b4uwzl3WYEvAZAUwYy0dSrWIlWAUSQmf7nKCUpM4jyYweJUHpfV8gmOdFlHHp0/fdr4eDcivWU4wf7oEeNW4PrpQKJVUkM27mIi64OGjMTRCFgfs41MR5n8JraL1d6Ao3WyxCej4zVuRmoVS4gGFlWxH4SQteAf/8fJ7/SAfwalBDyjITUhsLSymkDnwPnFxMCEehg==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3382:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	31:GIcD3JLm8BhzXOOXNvEK8FT8Zn1d/PJmMeFWYNW+QCVbfb7zvqDKazEiJtA3WUBsDSHXJS8JlNgOxIlm4iSed+Z808sEVH39jFOmD3OVIATHdmnTVI8QRJ30TVIxOIFm966CC7wHDZpyseUfqcX7Qj5F7t4eLk+NmeF6p7Anj1hMxDNlDu+k1MAeKxPZVtTIRBpznNcjQ46C+/IFSyW7fn06m+VEOMBNC+P9KcsEYzA=;
	20:EstvU9m/ktxehJ7Iea1HJs771InA2rIodmRI8SDppBIDM5S+oDGDkjU+9lCRMRpQph+1JwhwhmR2m6CJawquZcpltfJU0oUQ8dESJNKU+p08+reEWIk/rZsMbKdH0HgxZf9RcIN0xqQa3OtwcCBA3J2gPoXsei541hhwVRnRHrVydfWFW9u9rABOkoU7GO+A77FS7UUe22+MuSJjMnaxyFl81n7fM93CrVzcXa2ZvQur1uWSiWVi0qKH2ljDx8YaqSYZIB7lSR6kvlg4xPkCExfkSCjHXVKV/Z+t13TfLPg14f3uNKXVi7AcHTSSZiuuXXfcJ/2I2/BmtJmR/hTNRQK4JPL8aq54sbfiAKqLgY5WNxM5/VfSt2Tkk1o+r2jFZvmQj3PkZJ6eyPFh9AZK+OdE+H5cuoBVLObsB721mrHD1jnF94kcAgF0Rz81dq33hd+GLZrs5O837MPjTp1sRGsVs9CTDaJ28PBL+u0alRYesEbfbbtMYorLsM1yRU6I
X-Microsoft-Antispam-PRVS: <CY4PR02MB3382EB7C6C4F987981C415B6B90A0@CY4PR02MB3382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3002001)(3231023)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123562025)(20161123564025)(6072148)(201708071742011);
	SRVR:CY4PR02MB3382; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	4:FSH3W69VSb5G16BrhKNTjpoZwYNfoOpIlUWjcn8MMHUMBCkcjMdN1Rt+rKilPPQC9f1NQgnLlDcCDAlfbb0DM2ltnsCpRe9uS7cCjfnQBkRf37grwhZ0gtpswb13Q0MQWANEbnB93e9hI9hHIlL8DdD3xR1w7oF0A2E3GwAem6srp8xuH6NfAABW6GTlFuKb3GNn8/W12HsFU7nTIFTzabyu80Ux4frHPJyam9g8fGkAn+58M4fo25Twz5S0/V4U+127qNricpx0+YB6kC6+RHv49dVU5sgg/G3B8qIFXtlasytihQGaSH6j4Hpfu2TX
X-Forefront-PRVS: 05214FD68E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3382;
	23:gDgKyhW13Iv4YDhrv8Bqefq0O9l3PVuywRmg5tCrV?=
	=?us-ascii?Q?D5Pwd9yHgX/xqi1WKcHopVWzJxxiyNjURulnm6D4vZMyMG2OKgxFuLlU8GXl?=
	=?us-ascii?Q?fGoXoHSq/Yulr4XY568fOIkidqYeN2Ejom0W219PJLKF1rT06nTw/ifE+UAT?=
	=?us-ascii?Q?ymzRnpCeAtAjpUJB/8WYV5k7HxjNMPmrThJBER87s/lA66V+5YRiSIfdOXbL?=
	=?us-ascii?Q?f43XqVLpKPtanZ2UFTYk0fRctNdtX5YHFs3+AXrMPmZxVWl15DNXK9JEfiLy?=
	=?us-ascii?Q?hhdprgn+Ef1yE/FME5EFdk2Bvi+Ok7LyCECdrmSMi7Vl32tX5ihsmWq19ffk?=
	=?us-ascii?Q?fd52JTVWwMupOpUoOJxlAve3IHN6b+kBQ5YQfu0Sh0zYB8z65jhr1vaB1iGg?=
	=?us-ascii?Q?rKTbPzmrreQPsg4hcDvzIIDB1PzPPHBkDTqSDO53sjhNfqBCtyLajDuvw47M?=
	=?us-ascii?Q?06OlUHOg2Y0jpJGfeANSVNI7RXLib2mHmICLv/NmmjLZVZHpVf6VET4XPOlf?=
	=?us-ascii?Q?o4Pd+qTW46hOOzYNdX3KLEC2gnd28NmAN3J4XHHPAgK1ROf27p8Q0u5A6+Zb?=
	=?us-ascii?Q?ocJltrEgMBl9MbKzJ1BVA1ZIfwBqKmBOXCHgA5WFdCopsdh+Kvj5afEDJINH?=
	=?us-ascii?Q?xUnKJt2Xq0er838ZOBQZOgqv998Rovah4tmxSyGbPChGN8gk1GAAba7xcltT?=
	=?us-ascii?Q?jkoR5xDjkKRHYy8eJpBzzC4oOqDA+qJjKOMfw9W/YdriEB8M/d8Pc2x6AUuG?=
	=?us-ascii?Q?5e2+K98OhDvkSBBoiDq+2UwlY4EBd0DX3uCOLNgBYmEMz0raXoaupDt/CeJ1?=
	=?us-ascii?Q?s7UPObIJnPc5nj2nUips8BAgFL9+6bRKzV+13x2AHrbQdJJbDCTeW7g2C5JM?=
	=?us-ascii?Q?P01CExjxERfNSUlfnMg9nuCpyydpx5Fymj2mSXmT299m03MdzrD0zo7+4VbO?=
	=?us-ascii?Q?3ENW9e9y2SbxfJwzASAdPI+Dis1YzDfbiRvTjhnmV+FTzsjmOFxPi/2PujUY?=
	=?us-ascii?Q?ZA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	6:Unw8XDqxrRWlw6mSu938jGpu+p9pZOVf8yJ9hfZtaxFZwU9UhDDiMDXLdqhDbhrf9l2FcpVNbxGkMLJPiIXCTm1qGAfJUZRXolQcPBMylPgBgL+b0EN2vq1Mfy/FbNhKxj4cT9XtffNop0j4hTDKecjW7stQaFnvXy9843LxXAVmnL1e8SwC1Fhc5nKhRxRNydRVWoasH9N/PMT2euty8Pxpy60Jw5WXafE2mb5LtvB8ThRW9QjtJO2KLLJQGY7aqhv8W/nqG0IP4Yfbm7nUdnsLOlTKWXdXNeZjnHyux9N+RgfrYYNcl1pcp82UNOU2+aSu29I14qvqsBbN29si9ySsnFUpyy9KRr7R1LtyYwo=;
	5:IVuUAPXQ63JW1P7/mWFZSsvUg2nrl1p++tx3yLpSSUfA0DJOkIuswjIu7Sh0w0qICM9izYiJNQ7HE7ONx3KtMa0UekCcjLVuutJYLSwlXTdmqtcKYhGVH+ZD1Tbz38V//aNFdkGHE8a+08nYacZFAGXx3SFEef6YNWLbGOAEPXk=;
	24:Y3VYOchZKRQku9jMGNh5JlaeKluUK5+4DlWG6bRXSrhWWUUN4nSpX3DcNWzIDv8gKS+J5ltSXr8CDyFlw/pF51IlR6EuphHUSR/QbhLAkx4=;
	7:fclEaw6uFmfdkR56irWaiLeoQ3Zo0YMsNj/u/4kHLSrQBu/WP7Pd22mPwM+4T17KkcY+tHagPuDIn6EgAxXIn5kDHIYaHWwqsz2VQaUtllKoenXrntHMUkeXNcol/MLhtQriDat+JGKWuN2hsJw+Igu7HxL+QrTetx3qCipdKRoIihEMzUdQCd7sUjv/oSylpoQgXXpGI4bQzFBIzV2ZqVeJyPdItnQ/4QNsUCw3XatAnSbW8Ytn7tA30zBKn4UZ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2017 02:24:05.3770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56411af0-021a-4682-9cea-08d54299bfa7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3382
Subject: [PATCH 1/2] kernel.bbclass: Fix fitimage build failure
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
X-List-Received-Date: Thu, 14 Dec 2017 02:24:06 -0000
Content-Type: text/plain

From: Thomas Perrot <thomas.perrot@tupi.fr>

When compiling fitImage with initramfs bundle, the build breaks by
throwing the following error
|   CHK     include/generated/compile.h
|   CHK     kernel/config_data.h
| mv: cannot stat 'arch/arm64/boot/fitImage': No such file or directory

Fix the error during this compilation by skipping fitImage in
do_bundle_initramfs function

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ef4f47..4240752 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -208,7 +208,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" = "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.7.4


