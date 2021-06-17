Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5126.1623921357559430066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 02:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pxqjbC0Q;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=18023c9e8e=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15H9BZ9D023256
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:15:57 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 397xms068e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:15:56 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H9Fun3031052
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 02:15:56 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 397xms068c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jun 2021 02:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtYLfADsODJYi04XmcxIv0aiz9CnlWm3ar2MtO6pqOzuA9oKx5WxaShSNbPb6D/1GPlTdT8vjX34QCQspk/PqVJOgufIQbb6u7VQpsBEB/SKYFWPe+wMrVvRWgHjPwXEnag2GweQxhNZUoAemoLZ1fUAePQnBacGRVbT93DKwjNWEmVjRpTPk3aWz9KiDuAz0tQMIVNUDk8S84pw/ipAyoz6hcLYH+mkWINDyK68TwGVneEqk7b0/7mXAHMKo5PeNyn2JkjW1k6auSGc8WCol/d6vjI2WAp7J7U/YKgQsRFjoNXV9GcBJLLqwH7WRT7PlDfZZkWAxB7WH5gHSsWwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaWhgqflGghMcvkJsttO1J1M00Ecp6vlE93+py3k+FI=;
 b=Fkpk2LO76XHsoTDS68vpKp5ECbW+jg3MXd5Dy5spRYnSZCman+aq7FmCJRjZ9cXoB3i774J+rRy6KHXipwpB9CHALv4Gc6jDLqSfgAm7olURTGbceClybqMX2rRcDMZcZXrF1PTa/WjViYM9kIwv/hZaDpFe6y+x8JBCrMfAK5XkgdVFHg4+r1Q/74fLHr4pXdtuydwWCY8c1l+MoWW40dA5L8/e1/nv86Xf+iufRoWcvlXQoRMZqalyQmSipmwykJmDbyRirT90W5Ei9KP9NDMCFXLj3WD8ojHH6LAGTyLoeTtxVDts281PeW1S2kfztXZJS86j1uorikoIHwpNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaWhgqflGghMcvkJsttO1J1M00Ecp6vlE93+py3k+FI=;
 b=pxqjbC0QFO2C8XWZD5ryEgJjpj55M/UI+2hMFdPD/JuVVVf4OxEDiIN4vU8UAJmvy+HFQJYJ8uA7ugIDWO6q//Kiz2CHXNw6RDmLxX+rPvAtYhIzd4seMzopRhyY/XkvMa+c4IFhRnYlP6tc237mdQ0Eqx1ZndjHaSn+tewpUFY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2239.namprd11.prod.outlook.com (2603:10b6:301:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 09:15:54 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Thu, 17 Jun 2021
 09:15:54 +0000
Subject: Re: [OE-core] [PATCH 05/11] perl: split perl-cross into its own recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
 <20210604091030.1380877-5-alex.kanavin@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <2d5a058a-ec9b-d466-d1ac-a5e45e4da489@windriver.com>
Date: Thu, 17 Jun 2021 17:22:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210604091030.1380877-5-alex.kanavin@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.2 via Frontend Transport; Thu, 17 Jun 2021 09:15:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc67b81-8727-4009-ed76-08d931708214
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2239:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2239C4E993D82897F5AD7851F10E9@MWHPR1101MB2239.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mswp1SUkhrLkguxAxJ2kftJryZuJkGaa73lB0e3yoPbuQQkPqfkBJFdMXH3aSfEW3z2pxcFGg1tz5Wjf5gco7LgGWj8X0RCtQRkqr7RfxIh1PotO7Nxv+T4/3O0XVCj+xCQQqEYT/ivIEUdMyZFWMXAxVXDJY0zpK0f6J4hEnUGVvI0zekaCnPbylVIBobQwejgnxqit/I15qCGggFpmSjphgB0pUIrf6FYnfqTc6S+XoU1gvM8etpwE3E5VvcrgXmHqkqHRMSywu3cMzKXB6+6n2EPKvWpx+6KWop82E9iKya6DAL/geZnH2OgcDQptJg8VxEVs5FwpE1gtJygdwS/npPbcp6NHFsvPtB54H48eAx9hE9q0pKGMeavcBC1wVH7QeuDUKNNXJN9r+f9RLHT5qg/CbfJHlp0KlETywsIx6STBe3Crl51HUtD6EOPYkcnFGpi7OrpG9l5hF+x6fvca0RwxaQg+lfjR0MDeYKZVDeQRK+Jq7U8hj1ifPr/Y0Vtoc8RhX2NAfTHyfpfnlOzH+tue2B82SdAx67KoDT8lAq1RYL57NbcmhEH/gF1dYdJXbH01CTmiqoc7Q1jVMGco3LPzhgCyY3LTulREiCgBat6EXGXVz2S903CGnesXWjLUm9zZ2imfsMyp+KvageCUrZSjKzr2bfluNKlGLch6d/PrYGCw/Q+gY20e6KOrd9UhWvHIZJhcPww7dXznpIQDthdIiuDdXvoIIR6iHJL1ZpOVqlxzBUIBTn3Hpo78TVVGjxZULz21cghRRpunlTQ1QTMPhssyQfwXbhUlpPW7+NmNEfn9TDdXbMH3v0Du8Bp37ivu5rh6p1Ec2frEmljSvc3UnBK5XO+I1m0RP5u0yxXYMxQuq+ksobu0ha0fGpqipJHgsuyRVaApXQElOnjdbWj+4WYOjwclj6coBgM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39830400003)(396003)(6486002)(19627235002)(6666004)(2616005)(36756003)(66946007)(6706004)(66556008)(66476007)(52116002)(53546011)(478600001)(966005)(956004)(86362001)(8936002)(38100700002)(26005)(83380400001)(38350700002)(186003)(30864003)(2906002)(16576012)(316002)(31696002)(8676002)(5660300002)(31686004)(16526019)(2004002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2JXSlpnaTc2RlFCMWhHUFhVdm9IMEEycVBBVVlXZWdiWTJlR2JyUDMvSFMw?=
 =?utf-8?B?OHZaVUJGVHAyU0lNUUNCeTNwMTlycDBIMndmOGxmZ2NiOHhlWldjOWtXSDJB?=
 =?utf-8?B?Wlp6RFdUblB2SzJSNDI5RHBTOS9VTU9hTEVhSzltSmhQRjFRYXN5RUhGR1pm?=
 =?utf-8?B?MkhtQ3NrYStTVHAyNXFNS2FmeU5TVTIxUHk3Z2hJdnFqRURHSGxmdVNOQkZj?=
 =?utf-8?B?N0h6WWpQN2tBeElUck85VHVnSmxUU0lpUlBxWEl2UzdGemJrMFhQYlNvcGc5?=
 =?utf-8?B?bzZaQkNELzVIRUF0VWo0c0RtL3M1aDN4K3RPK011T2I4anlUQjAxNEVOSXFE?=
 =?utf-8?B?ak1EZVJ1by9rLytrWEUyUlRvNlZoR3l5elQrUDFWYkpnckNGV1JPQytkb2cx?=
 =?utf-8?B?NFl3QmJIdlg2cXBNcEdXMzVLS3drYk9RYlpOYU01Ulk3dlg2dDd5cm5xTUhC?=
 =?utf-8?B?Zk5IaE5IREpwUk42eE90WDRUTU1iTmEvK25qcWZhaEw2YXBTb3Z2NmtjTm56?=
 =?utf-8?B?eDUwSlN6dkI5cXFIcHRoRGF6MEE0c0FQQVRpMWNGdmVtRlhlQ3JkZ3ZsN3gx?=
 =?utf-8?B?Q3RFTEl4Z3ZRZ3pVcnA5VlNmNlp5d2JUZ2lWVjdNWEwzUXdGQWVaclpPU3lM?=
 =?utf-8?B?MWdJZ2p1NXg1MWN4TGdYenlMcm50aWd2OExVTTVjT2dxblVweGU3b3lWQkp6?=
 =?utf-8?B?WUtORHUxRmxCYUFUNmFtUXFZY216SkF6TzE0UWthQTV2THFTSngwRmJ4d25J?=
 =?utf-8?B?eVczaWQ1NFRFN2d4YjF2SlBPdEQ5YWtYNGZRaGU2UjRGY2RPdGtxOFBqVTFW?=
 =?utf-8?B?VDZyem5jcHE0Zlcra01QWEJML2w4NTQ3eW9CTjRFN0g3MHUxWGZZamIxQ3NW?=
 =?utf-8?B?R21KeGwvZWd3RE5WNmVoRU5FODRac09DbFlwWWcxNkRuTjg3NmVTb2dSa2dN?=
 =?utf-8?B?VWN1ZTVWYmQxZUVhaFE0dUpCR0ttNThBL3pvbWVOSjZVdks0MVpYZjg3dkNV?=
 =?utf-8?B?SDdOSmcwZVpLV0RMTzNyQjRWa3J1bTg3aG1PVm1HdER2Uzl1Zm5BMVNrRWRa?=
 =?utf-8?B?N1h3ZE9lUUdBQXBzT2JFa20xM3VsZkZxangwMVJkbDl4Y2JIMmxUQ3pSTzJX?=
 =?utf-8?B?OHRncVVuYjM3U25NYXdMQ3FFQmJudGJMNjN4OWpaZjA0KzZTTDVBWG5xbURi?=
 =?utf-8?B?WisycStDUUJORHdXMVRZMXllLy82V09JYWp1eUJ0NHZHQXNHbFRwWEt4bFBi?=
 =?utf-8?B?a3I0SUxDbnBZVXpWTnh3cUdnamFxdm9nNk9KRkVzMWhrLzdKQ3dNQllOaUs0?=
 =?utf-8?B?YlRhZWJST21qQmF0UHBEekkvZ2w2UkJybm0rREFqM0o5Rlo2Rm81cy9qMWlm?=
 =?utf-8?B?WkNhdVE4K0FoK2MyNXRrR1FBVWg3bVVpQWRoaFVXTjdLZ3pTSEVCUDZXODBZ?=
 =?utf-8?B?dXJ6Q2t4VHR3S1Z2c05Ha1BBbXduNXdqNHRRYThwamErUUF4L09ka0xMcjBB?=
 =?utf-8?B?Y29vZ2tKRStjRnhySjJJTUNDOGlRSlljeC9RT0ZhQmNwZWRoMVI0QTdPSWww?=
 =?utf-8?B?eStvY3h4Wm1UbCtGMWNCcFlrR05lR3htV3FQb21oTm0yREoyYUJ1VEZMSjhW?=
 =?utf-8?B?SzB2aGpqaDk2a21yN3FqdDUzMFRBL0hDQjlOeFIveVZ3a2tHVVNWcGhISm5H?=
 =?utf-8?B?UDdPbVNmemxzRW1DWlUwOWljU3ExSllicUdueUFxRDhNVTVhVEhTb2RBaytI?=
 =?utf-8?Q?PtVDQQDkL5sMVq58wrJUTWYjdJUoEABUeop/7KA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc67b81-8727-4009-ed76-08d931708214
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:15:54.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ado0tKwQSHf0c2exbe2Frz6kNsF8MHE/hxEDaoIQw2CYJ2+I0J7NWIrJA381DeU3jIpP1z+qJEtV6yhEoZjz3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2239
X-Proofpoint-ORIG-GUID: VPv1HvVba01NWAL00Bn57j3NnGDvp81v
X-Proofpoint-GUID: UyfqHvHma_gFhTfOV02H2AZPE1leq-8n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_05:2021-06-15,2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170064
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

After this change, there comes below failure such as below:
$ bitbake perl-native

Make a change as below
$ git diff
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb 
b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index b77bbd1fd4..4c5e35ab80 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -33,6 +33,7 @@ do_compile () {
  do_install_class-native() {
      mkdir -p ${D}/${datadir}/perl-cross/
      cp -rf ${S}/* ${D}/${datadir}/perl-cross/
+    echo "test" > ${D}/${datadir}/perl-cross/testfile
  }

$ bitbake perl-native
| NOTE: make -j 48
| make crosspatch
| make[1]: Entering directory 
'/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
| patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch 
cnf/diffs/perl5-5.34.0/time-hires.applied
| patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch 
cnf/diffs/perl5-5.34.0/xconfig.applied
| patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch 
cnf/diffs/perl5-5.34.0/posix-makefile.applied
| File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
| patching file dist/Time-HiRes/Makefile.PL
| Reversed (or previously applied) patch detected!  Assume -R? [n]
| Apply anyway? [n]
| Skipping patch.
| 4 out of 4 hunks ignored -- saving rejects to file 
dist/Time-HiRes/Makefile.PL.rej
| patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch 
cnf/diffs/perl5-5.34.0/test-commonsense.applied
| File perl.h is read-only; trying to patch anyway
| patching file perl.h
| Reversed (or previously applied) patch detected!  Assume -R? [n]
| Apply anyway? [n]
| Skipping patch.
| 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
| make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] 
Error 1
[snip]

Thanks,

On 6/4/21 5:10 PM, Alexander Kanavin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> As perl and perl-cross need to be updated (and patches rebased)
> in lockstep, devtool upgrade (and therefore AUH) can't cope with it.
> Manually updating is still possible, but painful.
> 
> Split determinism.patch into perl and perl-cross parts, move the
> rest of the perl-cross patches.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/distro/include/maintainers.inc      |  1 +
>   ...h-do-not-hardcode-prefix-lib-as-libr.patch |  0
>   ...h-do-not-quote-the-argument-to-comma.patch |  0
>   ...oss-add-LDFLAGS-when-linking-libperl.patch |  0
>   .../perl-cross/files/README.md                | 29 ++++++++++++
>   .../perl-cross/files/determinism.patch        | 46 +++++++++++++++++++
>   .../perl-cross/perlcross_1.3.5.bb             | 36 +++++++++++++++
>   .../perl/files/determinism.patch              | 23 ----------
>   meta/recipes-devtools/perl/perl_5.32.1.bb     | 17 ++-----
>   9 files changed, 116 insertions(+), 36 deletions(-)
>   rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch (100%)
>   rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch (100%)
>   rename meta/recipes-devtools/{perl => perl-cross}/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch (100%)
>   create mode 100644 meta/recipes-devtools/perl-cross/files/README.md
>   create mode 100644 meta/recipes-devtools/perl-cross/files/determinism.patch
>   create mode 100644 meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ee118209db..6024d57717 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -558,6 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
>   RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER_pn-perl-cross = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
>   RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
> diff --git a/meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> similarity index 100%
> rename from meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> rename to meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
> diff --git a/meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> similarity index 100%
> rename from meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> rename to meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
> diff --git a/meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> similarity index 100%
> rename from meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> rename to meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
> diff --git a/meta/recipes-devtools/perl-cross/files/README.md b/meta/recipes-devtools/perl-cross/files/README.md
> new file mode 100644
> index 0000000000..93217245c8
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/README.md
> @@ -0,0 +1,29 @@
> +**perl-cross** provides configure script, top-level Makefile
> +and some auxiliary files for [perl](http://www.perl.org),
> +with the primary emphasis on cross-compiling the source.
> +
> +    # Get perl and perl-cross sources
> +    curl -L -O http://www.cpan.org/src/5.0/perl-5.24.1.tar.gz
> +    curl -L -O https://github.com/arsv/perl-cross/releases/download/1.1.3/perl-cross-1.1.3.tar.gz
> +
> +    # Unpack perl-cross over perl, overwriting Makefile
> +    tar -zxf perl-5.24.1.tar.gz
> +    cd perl-5.24.1
> +    tar --strip-components=1 -zxf ../perl-cross-1.1.3.tar.gz
> +
> +    # Proceed as usual with most autoconfed packages
> +    ./configure --target=arm-linux-gnueabi --prefix=/usr -Duseshrplib
> +    make -j4
> +    make DESTDIR=/path/to/staging/dir install
> +
> +Unlike mainline Perl, this configure never runs any target executables,
> +relying solely on compile/link tests and pre-defined hints.
> +On the flip side, it is only meant to run on resonably sane modern unix systems.
> +
> +Check [project pages](http://arsv.github.io/perl-cross/) for more info.
> +In particular, [configure usage](http://arsv.github.io/perl-cross/usage.html)
> +lists available configure options.
> +
> +Perl-cross is a free software licensed under the same terms
> +as the original perl source.
> +See LICENSE, Copying and Artistic files.
> diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
> new file mode 100644
> index 0000000000..e9bf752bcb
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
> @@ -0,0 +1,46 @@
> +Fixes to make the perl build reproducible:
> +
> +a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
> +   whether the shell is bash or dash which can cause the test result to be incorrect.
> +   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> +
> +b) Sort the order of the module lists from configure_mods.sh since otherwise
> +   the result isn't the same leading to makefile differences.
> +   Reported upstream: https://github.com/arsv/perl-cross/issues/88
> +
> +c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
> +   there for good measure)
> +   This needs to go to upstream perl (not done)
> +
> +d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
> +   and "" with dash
> +   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> +
> +RP 2020/2/7
> +
> +Upstream-Status: Pending [75% submitted]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> +
> +Index: perl-5.30.1/cnf/configure_mods.sh
> +===================================================================
> +--- perl-5.30.1.orig/cnf/configure_mods.sh
> ++++ perl-5.30.1/cnf/configure_mods.sh
> +@@ -82,7 +82,7 @@ extonlyif() {
> + }
> +
> + definetrimspaces() {
> +-      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
> ++      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//' | xargs -n1 | LANG=C sort | xargs`
> +       define $1 "$v"
> + }
> +
> +Index: perl-5.30.1/cnf/configure
> +===================================================================
> +--- perl-5.30.1.orig/cnf/configure
> ++++ perl-5.30.1/cnf/configure
> +@@ -1,4 +1,4 @@
> +-#!/bin/sh
> ++#!/bin/bash
> +
> + base=${0%/*}; test -z "$base" && base=.
> +
> diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> new file mode 100644
> index 0000000000..9509313b86
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Perl-cross build system"
> +HOMEPAGE = "https://github.com/arsv/perl-cross"
> +DESCRIPTION = "perl-cross provides configure script, top-level Makefile and some auxiliary files for perl, \
> +with the primary emphasis on cross-compiling the source."
> +SECTION = "devel"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +# README.md is taken from https://github.com/arsv/perl-cross/blob/master/README.md
> +# but is not provided inside the release tarballs
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
> +
> +SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
> +           file://README.md \
> +           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> +           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
> +           file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> +           file://determinism.patch \
> +"
> +UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
> +
> +SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
> +
> +S = "${WORKDIR}/perl-cross-${PV}"
> +
> +do_configure () {
> +}
> +
> +do_compile () {
> +}
> +
> +do_install() {
> +    mkdir -p ${D}/${datadir}/perl-cross/
> +    cp -rfp ${S}/* ${D}/${datadir}/perl-cross/
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
> index ccdd52a0d0..aa85ccef10 100644
> --- a/meta/recipes-devtools/perl/files/determinism.patch
> +++ b/meta/recipes-devtools/perl/files/determinism.patch
> @@ -21,19 +21,6 @@ RP 2020/2/7
>   Upstream-Status: Pending [75% submitted]
>   Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> -Index: perl-5.30.1/cnf/configure_mods.sh
> -===================================================================
> ---- perl-5.30.1.orig/cnf/configure_mods.sh
> -+++ perl-5.30.1/cnf/configure_mods.sh
> -@@ -82,7 +82,7 @@ extonlyif() {
> - }
> -
> - definetrimspaces() {
> --      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
> -+      v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//' | xargs -n1 | LANG=C sort | xargs`
> -       define $1 "$v"
> - }
> -
>   Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
>   ===================================================================
>   --- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL
> @@ -56,13 +43,3 @@ Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
>        {
>            print FILELIST $self->catfile($dir,$file) . "\n";
>        }
> -Index: perl-5.30.1/cnf/configure
> -===================================================================
> ---- perl-5.30.1.orig/cnf/configure
> -+++ perl-5.30.1/cnf/configure
> -@@ -1,4 +1,4 @@
> --#!/bin/sh
> -+#!/bin/bash
> -
> - base=${0%/*}; test -z "$base" && base=.
> -
> diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
> index b28040c7fb..01db924a73 100644
> --- a/meta/recipes-devtools/perl/perl_5.32.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> @@ -9,18 +9,14 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
> 
> 
>   SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> -           https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross \
>              file://perl-rdepends.txt \
> -           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
>              file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
>              file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
>              file://errno_ver.diff \
>              file://native-perlinc.patch \
> -           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
>              file://perl-dynloader.patch \
> -           file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
>              file://0002-Constant-Fix-up-shebang.patch \
> -           file://determinism.patch  \
> +           file://determinism.patch \
>              "
>   SRC_URI_append_class-native = " \
>              file://perl-configpm-switch.patch \
> @@ -30,13 +26,12 @@ SRC_URI_append_class-target = " \
>   "
> 
>   SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
> -SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
> 
>   S = "${WORKDIR}/perl-${PV}"
> 
>   inherit upstream-version-is-even update-alternatives
> 
> -DEPENDS += "zlib virtual/crypt"
> +DEPENDS += "perlcross-native zlib virtual/crypt"
> 
>   PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
> 
> @@ -47,12 +42,8 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
>   # Don't generate comments in enc2xs output files. They are not reproducible
>   export ENC2XS_NO_COMMENTS = "1"
> 
> -do_unpack_append() {
> -    bb.build.exec_func('do_copy_perlcross', d)
> -}
> -
> -do_copy_perlcross() {
> -    cp -rfp ${WORKDIR}/perl-cross*/* ${S}
> +do_configure_prepend() {
> +    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
>   }
> 
>   do_configure_class-target() {
> --
> 2.31.1
> 
> 
> 
> 
> 
