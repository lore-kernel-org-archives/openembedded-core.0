Return-Path: <prvs=67396d1221=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC3B71A60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 06:32:14 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6K6UKnM013152; Fri, 20 Jul 2018 01:32:13 -0500
Received: from nam04-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam04lp0111.outbound.protection.outlook.com
	[216.32.180.111])
	by mx0b-00010702.pphosted.com with ESMTP id 2kafra4018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 20 Jul 2018 01:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SOa1/lsgM7vK9b9I/g/RVG161ftnFmfmJ9ivWhUmxms=;
	b=aPM/zhjKO8NXh+6EL6YCs5hxpyG6+7yMbGEGJXTVmRpDGgPd4WqcQWyakalnwm80IDEt7b0EFShHaf/2IwTBU3qfzX0f2rWy0xCV1o97JH69GZoqRGJhxYYzNoOtqklpUzQnnBiIsyZPGnxkHsmEs9pMIYSrzuhwaGRItf2qALU=
Received: from ionel-work (80.97.64.55) by
	CY4PR04MB0391.namprd04.prod.outlook.com (2603:10b6:903:b1::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.16; Fri, 20 Jul 2018 06:32:10 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYfgcFCwKNRTxLQJLJ+hWMK56FeaSZEMFp2zBBXZBPpqg@mail.gmail.com>
References: <20180719134150.8488-1-adrian.ratiu@ni.com>
	<CAJTo0LYfgcFCwKNRTxLQJLJ+hWMK56FeaSZEMFp2zBBXZBPpqg@mail.gmail.com>
Date: Fri, 20 Jul 2018 09:33:40 +0300
Message-ID: <87fu0etnzv.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: HE1PR0701CA0063.eurprd07.prod.outlook.com
	(2603:10a6:3:9e::31) To CY4PR04MB0391.namprd04.prod.outlook.com
	(2603:10b6:903:b1::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ae0acaa-3f89-4cc9-8076-08d5ee0a862b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0391; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	3:NJTPn++LMcf3dqlWdyFTISPA81VO/JmAPYuPaQt3l9S2zZWnwm7IgkGjVFRSwV+VS8R5EXwNP8EG8WFv+1/UxxkFyFr2MIQUkEIrrRz3qFEcvTBNFyOF3CaYC9V4MNLTcUFUYY3oOIOZ9vPq5SQhdZ9Y8dpuhik6BQXnBjyWwY6y+OwlLoeWtHGhM85yCqaqUrHSfGJs+NaoOvu7WqIHOIzA/cCsD6JcYfiN4f1y7JJcdZA79NrXzSCIzXTAhir6;
	25:8SczwRbmVLFzeN890quqELWD/72UlPaRQW+3XltYBMH4oxAIQwbRHEkMc7UZUCyiHNuyv6uchkTeD5awkHThAsIfkvLfq6w/Q/fUIejVvJKwoK34hK9DOWeYc3Nz+WXpYi+eHBDrRdprT5GH5dlyrwb9LwvJnW2dZmJ5YDy8jURuMSorMXNMF2PVsk/TQOGXkFan6QRIQlDa+6COElZ29XSj3Ioz96DpcX4sevnnoYMp8jVO61qTjtbKd6T4NQPFv2x3ZaIfwQ0z0sjtyfzn0+L3aq9/L5aIODmoLiFQD2ZiNoleuY2H0wbBxVIOoRwRJjhh8iPh4ebZYjhgQHML5Q==;
	31:tk4OI6Ux2aeeMTrJufSC3Y/NHcLfUR9QulKlty/WulVnDf4jc8Q5AO36aCdelmhweJHdsaP1li4IenAeqUR3vT21xRt5k9Lp6CMP/xMSCXExa4+chwvwUaHN+b5vAtQ8rnb6+TZM/lQ/qr/R0XYRj8KCoDTiA93YCRACuenC9lCPy5a5oorkTiVwzoCU1Btm3PLJH1Z1uRQICPPZgk5sFoBy1BA3jREx+DVBO7RWChU=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0391:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	20:QP1+9Jws+mQPVMDYqoKB1Dpnj1q6Q2xWPCq5y4MiK1Iq0WQpu5fzT7Ae9IdYABanGvDfDNuVcne+d66JAC4JK2wcQ+MEEUmds9OVZmFKHm9hlahp4cIGUgc7G4+wyLz52fvxUtkaPW5cxl7sbC27wEq51JG6KEE3e7kbfr8ExaG4b1jBWwsUDsTKv0EjpeH+wQh0+1hZbTge0mMiTq1ORwJdizX7PLkLxxJ8JXVuT6nTTuO7rNX1uuTG172TCM4Al1B/C7LfjU9n3cCEwvF+in1RLsyhin+wyKCmFKNbQEdyeUoAuxj2jHzMQbS88jPMWCa4hkQOPNgbQLNSdH1CEtJf0XFrRfiE7Smm/hOu6QZFu8+CCI/er4JwL+VR3UuGIXJCFqr8tmZNmabh+iHqqm20C87EhIonTdeBKbuw7Qf1ZftU8Y3DHO7bAEr2nISAFYv5Wzl1UtibHvA9DMV/OGprV+EiQ6l1+Cu7+70IXQW3t/P8hW7lAU2LkZtuKK5DToFQfVzncXrdqr9av7x5SvMSJ3m61qqMUwVtZdeaMbetOT4B57gfKm/5afiIGmDnsRDLzXm4GKDZ6dGsqdSwJPC1GJ6lpDagvIp1oU7wL/c=
X-Microsoft-Antispam-PRVS: <CY4PR04MB0391826FC2BDBCF54430827EF6510@CY4PR04MB0391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(228905959029699)(145744241990776); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0391; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0391; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	4:Z179zajpmhzylaLskqTzxELMyrBeTrHMlxHKrrYG/uk/bQREkJvjXb2PTb+Bf3B+Nu9NuyoyNdMbOEKsZQwdpsrYe84jbGqgWsUGUu33UjUqU0i9aOUicUTTtVhnyKlUURvMB7ELh/mQ6YMXiEW5nixoNeJLCnhTGw7BhYl9A0WCZisvJiVdTZWZYos53UI0+4Qr7CS9GWRzz4GjQP2pQcJDXYWqvZLKfeOQ6ryjb9lHLyEA+rIBq7LzbE8Dtm5hiViuwiZ9kVJIzehL9g9FmG1Wwu8FijbVNYX/omhntGQdNSzbhDgMjrx6b+DY6JXZA1pzFw/uva99MTaEUuQtwL33ihU9L/hYyVMdnl+lokJ3GvfPeSppnVXsBUZufV1n
X-Forefront-PRVS: 073966E86B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(189003)(199004)(6486002)(6496006)(4326008)(97736004)(478600001)(316002)(48376002)(6306002)(11346002)(16586007)(446003)(6246003)(8936002)(50466002)(66066001)(386003)(53546011)(47776003)(76176011)(52116002)(51416003)(86362001)(36756003)(16526019)(966005)(186003)(1720100001)(26005)(81156014)(81166006)(106356001)(5660300001)(105586002)(8676002)(305945005)(3846002)(53936002)(7736002)(6116002)(6666003)(25786009)(476003)(2616005)(956004)(14444005)(6916009)(2906002)(229853002)(68736007)(486006)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0391; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0391;
	23:34MpmHUNzQ6+MWYFMKzTmqZwbUN8kA0iniEtaYezI?=
	=?us-ascii?Q?UTdueLukCt287wh2uNTr/I8DqTjXTVul3gAiTsFAwZFn34dqDZF3Ta/p3rf8?=
	=?us-ascii?Q?iFebXXUIN8H4e6VFU6s7YBqwQTgcCxmvvJiK+nDjxICGS00Ie8KDlxG5rThK?=
	=?us-ascii?Q?okkwsgVwpu0Fr1+LiJf045nAYveaDu+CwCTxVxbxYLbk4MP+KvxcSB9g2i2q?=
	=?us-ascii?Q?qu+qyg9mbnXtzbLl/39yMDh94qvO3jT8tOC/43M3A/J8em5AfCp6ZTGyMJBz?=
	=?us-ascii?Q?c1eLAFPmjbXO62Pp1P89rotgPwVgL7gPuDMbOKMpjxvMtW4qjC6mscn2kbBW?=
	=?us-ascii?Q?0eYD3r3r2+EqNOeMCrFQRHib296BurX7rZh+p80nQLBpjQqcYu8dnEHjICOT?=
	=?us-ascii?Q?tmp6k/7qfQq0op2ho+k+HTjeww2CKgt9FGS2hp5q7zfTaGYUjlaDjuxr3YV3?=
	=?us-ascii?Q?wLz3ijDtuMHORo6rj4eqzAv8ZCTX9zFiTVLW3WYdqEoveLEjGAwDUo6fE/2L?=
	=?us-ascii?Q?fcUrm0JWzAgWVnaxToMzc8FjUxTEAF9d4PJPx1kgve09Q4tN3UMFoe9G9mlX?=
	=?us-ascii?Q?phnHQmLyegw8mXyLYRz7WOsDRPNLns576wHK8utr/a+Nnse5eykSSb5lslFs?=
	=?us-ascii?Q?6Kdgy26RhKiaPulpk+U9NdwMTidDq31znNB/8YjPxIF+ibcUqBy8XVPi1+0N?=
	=?us-ascii?Q?nSm8epBSmDwv1cQKdb4ERI4LoKxcvdgF9cMqw5/EAC69JTmjp8yov/Ix7b+2?=
	=?us-ascii?Q?0FCqQaoH3+rOWZZSf9+gD7Y7F58LnOVhxPvpomyzGp0QAyagJ/bALVRajUDH?=
	=?us-ascii?Q?z7AST9V/seDcpc+23B/ishaDXzEM6Nq1WsnOiP2D6dhbZ+Zm9/DPfdPddNrj?=
	=?us-ascii?Q?ucnJcQQZ3geHnxAxauBcyHsS80LoG/DnEX7/DELRlIM0XtxyeCw5jkLk2zkK?=
	=?us-ascii?Q?hdKWlMkhPAJBkWQeE8fzHi1L8xXhV5YjZuMIiNO8a6C90IY1BCdlUoFUmEJd?=
	=?us-ascii?Q?xAymSrsN3UFVpBCzssx/ZkiYPfjeO7apd/D7y28JLD8djDpL98nx0ANuVDrI?=
	=?us-ascii?Q?+yW5UKAkel4wpyzEiYk1tfHf6Rh9Ow5lUZKwuVdxlxioDot0ku2R+efCufmB?=
	=?us-ascii?Q?jj1m4iZaoEo4MWNtxApX4gJ8wV5DJXoSPgCmaLNlR2KHl6QTSuejyr3cxhha?=
	=?us-ascii?Q?VbHxsGxKoaZamr0EOURMdl+3jxtlvqaZTbggn7L/H28pbnyOMZYZh+vXzo7g?=
	=?us-ascii?Q?eOUsA60UZOlBJtS4dGcFlKazrTb83k9XikFpqjmeeU87zSTdyJ5aDiTF7a3q?=
	=?us-ascii?B?Zz09?=
X-Microsoft-Antispam-Message-Info: VaJCF6HKfG5P2ii6UpAAammwcXFTuwXdVaiVU3rASGL/Is7hppCc4+PYvazFKelfom6hOxHMUkAlsB1OJ2DxZOb6vt9Lw1VOMczxLcil902BK20VnUhXgr56hve/H+FgIP6HSQ6WLCk4QRhllrU7e7JejeAJfMv42xPLHEc9wYowb4fiZaAjjSRoj5o9UFxcZAAQIM9gxM6s4eTSXAaa+8xnbb8rK+NTs7sybKzxdJ95kwGCrOpngfVURVL/Vo5Wy0adaLAPmUpMsOTmJujwmHj+upjXf6gPll33l1XoFckXZkRx6K6Z584C8zHouf0xkWGEsYjv9/jZIFJcbWzZrbQw5ArEeOMaArA/mI0hSlA=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	6:jog5H9Ttby8Cb2pXQLvw7gdTGusPtkhLjSKqezxu0/Hfq8LMqZN5Sofa4I2QzN570SsiCymt1n2LBhsfCG6xSoe+2bv2sBlCLi5DI3HUNTaYr/dSg54Zj2uK69dplbPHTXdGdlgWXGuS+iRPcbBaSEeC4E1CPXuSvvcVdDNmEBgoM8a1sbtJECyMugza8YgqZzBG4qjOgjJZqkjWmulJT7PCcPOQ/bcADm6a66tyInaLlxGlAxPD2Ls2g5XCXOFj0wF1xp5ZbNR7rLFx9tBwKixpdnkfijB4Xu+eulSRKRObxavwULLO2P8fDsa1piaCSModQ3/yprF1hSCkZeaz4009hcUT+TGif8NLeLTlpyngT8FYdXZRcC4WJ/bs4t2so6/JIMPhahqWJ7R6gxlxbu7ulcGalefQsvjT1xD5wmB+QPYd/6tRuo8pac2MmijqsyyKuxdpi6xdP+IOJlF0HQ==;
	5:D3+miq81yiGx0kMFSdOuB0n9FRba26lofVeKjn7GzijX1vbMbsSc1Mnk64jn8c1i3F7rUtd9MIRkT/Hjytz00V7B/p8H8dd0JqZ0i+YDsQW2/U8bTCUETiwsex7NKHP/Hxl/GG+7hYvV6o9BT32I5kjASg1globy4d5HPAS+Vvc=;
	7:FfbBN6Q0+KHWJud3jxY+LiHaVD0GHRtyb/z48YkDU/3LD5HmdHVeeAyvQiq4xjGlykk3RVzIo3iUrEMK/rmSDBpp0pGXFyE6G/Fl5qcSrPbHQzaqgcn6j8fuX1g9qC3FCS9qbaHMZGJE03WkoKF48Rbpy/20J2kzRPV1DWjcHy4d8uBZcUzjJ6p0d3U2MvCgTP3geMW/I3p5WWAMlsUulFwx3oojJcLWH/MVoVxyX8E0HpDmJPoStGLbsDtoMGdU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2018 06:32:10.1656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae0acaa-3f89-4cc9-8076-08d5ee0a862b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0391
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-20_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807200078
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsb: fix usrmerge install path & QA warning
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
X-List-Received-Date: Fri, 20 Jul 2018 06:32:14 -0000
Content-Type: text/plain

On Fri, 20 Jul 2018, "Burton, Ross" <ross.burton@intel.com> wrote:
> Remember to check what happens without usrmerge:
>
> packages/corei7-64-poky-linux/lsb/lsb: FILELIST: directory renamed
> /bin -> /bin/bin, changed order
>
> lsb:
> /bin/bin/lsb_release

Sorry about that and thanks! I'll send v2 where I'll use ${root_prefix}
which takes into account the presence of usrmerge.

>
> Ross
>
> On 19 July 2018 at 14:41, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> ${base_prefix} is set in bitbake.conf to empty. This makes lsb_release
>> always install under /bin which is a problem if usrmerge is in
>> DISTRO_FEATURES, because it needs to be installed under /usr/bin.
>>
>> By using ${base_bindir} instead, we fix the usrmerge install path and
>> the following QA warning goes away.
>>
>> WARNING: lsb-5.0-r0 do_package: QA Issue: lsb: Files/directories were
>> installed but not shipped in any package:
>>   /bin
>>   /bin/lsb_release
>> Please set FILES such that these items are packaged. Alternatively
>> if they are unneeded, avoid installing them or delete them within do_install.
>> lsb: 2 installed and not shipped files. [installed-vs-shipped]
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/recipes-extended/lsb/lsb_5.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
>> index 746204b6ec..1657ba6f78 100644
>> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
>> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
>> @@ -33,7 +33,7 @@ S = "${WORKDIR}/lsb-release-1.4"
>>  CLEANBROKEN = "1"
>>
>>  do_install() {
>> -       oe_runmake install prefix=${D}${base_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
>> +       oe_runmake install prefix=${D}${base_bindir} mandir=${D}${datadir}/man/ DESTDIR=${D}
>>
>>         # these two dirs are needed by package lsb-dist-checker
>>         mkdir -p ${D}${sysconfdir}/opt
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

