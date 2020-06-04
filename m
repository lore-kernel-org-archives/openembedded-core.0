Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.73])
 by mx.groups.io with SMTP id smtpd.web10.7685.1591246355175942942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 21:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DLFF/B8+;
 spf=pass (domain: windriver.com, ip: 40.107.237.73, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT3RXFllAzPKsBBIHcd7rwaBR5XwinrPs7oZ0Z+nyNJoOGqqeZPJDKKwCH2rFPzcjvbD6xoXW0R7Vk7b1vWwOaN9yQv9H0krBOLununNt7l3gR1Yu2eSC5C17pIsX+IbKZKAAmvdCnEya66/UZPixyGYL9/c6PuNSLIeCwSX8o3TUwiP9y5b2dmOC0ke5Ueqtx7Py7BryBCmGbIoMJj2Yh+VbAsHS0H3AOsYYLB8SAHklTxrWlb/Pya1uC1JqJIV3uOvZGTs1P3aagrw0/t1uCbiecem9wZzWj3dk5uQ6JDeJ9quD75JzDVZto54Qi+DMq8ml/rUZ87CkeIWuF7z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cczIaEct75Jkon5NgD3kuzgWnjr3HIszuBTWLwEf3iA=;
 b=NilI7AsXCnUbeBd9Lreg+6GQxnM5LZaFX+uFsu8PsAzYQsONX2FhyD0Bo4DIcVqXFnHhqoufvfUIuu2pI/5wDTXQ6tlp81pRzW/sB8/4egXgr06YfViWntX5F0auh8bVZ25V45iRsWv7YSIKl3DIgPK1t5mjcBfTBp2tcL3xQtPo/FRY1GMLFYywE9HOb1A9VsM/kihCJ8We8gb4RBOA6YANrSVwiciOjDBVmhMa3eLf4FmdwXkh0gJWQuwC0xZ+mtVQZWLUCWjBZSWFmRaN8HqInzlZly7ckm39B/LgAwblmB9Xvm9NsBlNTjWpICdQjU9jrCF99J3k0TCMQ2M63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cczIaEct75Jkon5NgD3kuzgWnjr3HIszuBTWLwEf3iA=;
 b=DLFF/B8+MpVLM/IcVijiadEyLePJjChpXBZ40OsB33u5yIdCEv/+zvAyczWQTkwlSQYx6XLmcvhyOoX72C1OefBXJeQ589aFKtHIKWNFSFR2dYLHiOB4/FIAEz3Yy3UBDpGuFY+oan8qjjeanuS4TH7ykaf+bcgPeI6bcBy/lIo=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3335.namprd11.prod.outlook.com (2603:10b6:a03:1d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 04:52:32 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 04:52:32 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Subject: The change pointed to by a .scc file not detected when compile kernel
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Robert Yang <liezhi.yang@windriver.com>, zyang <zhangle.yang@windriver.com>,
 "Asselstine, Mark" <mark.asselstine@windriver.com>
Message-ID: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
Date: Thu, 4 Jun 2020 12:51:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: HKAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:203:d0::18) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HKAPR04CA0008.apcprd04.prod.outlook.com (2603:1096:203:d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 04:52:30 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f893f48b-3df9-40ab-94cb-08d80843175a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3335BB4EEE12DC766B68D8E1F1890@BYAPR11MB3335.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TvgJJ/2rpzApNc3ExLKd/txTNhhYkgMuqFc7xH9v72PSI5wwMciPnV4RaLuF+4/SSuAlx9LSDZDwTsMCH/NpmXLD3nKUyXEApZ+D39oG02CcIwZafCcdow/52tpjHd5kSWPGJE+0wBHYLbQ5tEsd6J1UKE4OiU0wGnHt4vpj9hxBjjszaQZCViqntbhwgd1l4IaT2/wDVuZuwmBhGi4YvGe+2b+cKWycIedikoMgi367WKI/9bZRSIZ5kqWbMWBMauZszG84Efz3Lpei4spa2rEUsXhCfo+yqvDSCdafagO+BGrE9VyntRyA3kH+RAKnJtHdyYm5NjuAYm7/tUA1hV+qft8fkZ8hPpRkzAVRiJldR/ATy7scP69PeHtJFPI9miNMx9/HX9sMyAmcthmncX/UEDc0rXcTrO0kVaJDW32stIVTI+RZAit1QcgwwyM9dbHtbYs0Wc2jugpogzSTqhvUin13aiKjLD8D9GKBmjY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(366004)(39850400004)(376002)(396003)(2616005)(6486002)(83380400001)(107886003)(478600001)(66556008)(66476007)(16526019)(4326008)(2906002)(36756003)(186003)(66946007)(8676002)(6916009)(31686004)(16576012)(86362001)(26005)(31696002)(956004)(5660300002)(316002)(6706004)(52116002)(8936002)(6666004)(54906003)(78286006)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bEIkGqFPlI5Clh8qcsKfGNbQzZgwBu//mfnhZvFb80NK8jKJ5Q8pK7DY3L2zk8U0J9nOMZwld/KlGSm9LUu+zP7QxzGfBS7mXCUB1L+y4WK1zEQD0JSMYIWC+vd5WlycV4eDK96G2UUv0Qj0txIEh4/iSL12rrpKjgY/36XI1prp/kk1htNerXkV88NTUI6jgprygsOQPozIEa3Ww1MEFfQR/SMuDfJ95KrX5o6Ky9Q4ya31PCTD0cPx5zxsLtSGAXE9IETS8lPlgjFkJlEcGwg3n9XT9akCNyXKhjyOHQ09BlaobM60l81+OC3o1DNQsjb8yKfscdZbwlXSoPotzjomv3t2dAPVbC//OjG4NN1suRc5UtgCmQcFsOY6UVqrYUSqYgq9b0Ga+hZqTmipNsPzqSM/Mb3vbghQi7fpOwbF2gK5mpGN54c5Y3hLcamt6ODuoediN7Cn99VTIZXjxH0k5vJqKXqOOeC9b2DQtHc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f893f48b-3df9-40ab-94cb-08d80843175a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 04:52:32.2797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hI6s3JkLTND5g59ELRgoCzwLDHh1x5dhxNXJiKjvMB6WGvpiA8nK5dGb9CG36ho9UVIWSHUWobilQcTC5PldOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3335
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

Currently, the change pointed to by a .scc file not detected when 
compile kernel, for example:

1, add DISTRO_FEATURES_append = " virtualization" to conf/local.conf to 
enable virtualization DISTRO_FEATURES and also add meta-virtualization 
layer to conf/bblayers.conf

2, bitbake -cconfigure linux-yocto

3,
$ grep -Rn CONFIG_IO_DELAY_0XED 
tmp/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
5367:# CONFIG_IO_DELAY_0XED is not set

4, modify the lxc.cfg which introduced by lxc.scc under 
meta-virtualization layer
$ git diff
diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg 
b/recipes-kernel/linux/linux-yocto/lxc.cfg
index 3fefc03..b7a19a8 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -1,3 +1,4 @@
+CONFIG_IO_DELAY_0XED=y
  CONFIG_CGROUP_DEVICE=y
  CONFIG_CPUSETS=y
  CONFIG_PROC_PID_CPUSET=y


5, bitbake -cconfigure linux-yocto

6,
$ grep -Rn CONFIG_IO_DELAY_0XED 
tmp-glibc/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
5367:# CONFIG_IO_DELAY_0XED is not set

The change for CONFIG_IO_DELAY_0XED doesn't take effect.

Thanks,
Mingli
