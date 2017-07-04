Return-Path: <sorenb@xilinx.com>
X-Greylist: delayed 1137 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Jul 2017 18:03:05 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0082.outbound.protection.outlook.com [104.47.33.82])
	by mail.openembedded.org (Postfix) with ESMTP id AAFDA71993
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wvg5OvE/iq3SsPBaSCvU+UzWLPyg6CZx5smVXD5V4wk=;
	b=ynMs7+pzJ8Wsvzf0Yq2N9ZNfbR4qK2MPfMD4sa9YBP1zR3Dj3NsrjNKxCVtW3nRE2ZFnGP1RTISLhAmv7o4NMJ61bFB2oeIv5GHpW1L/ginga2MmZlBKU0C2O29yT8a0gZnia9VqCDAMVYImSz3WOxcazAW8En3r2SLg7fjkj+c=
Received: from BY2PR02CA0125.namprd02.prod.outlook.com (10.163.44.179) by
	BN6PR02MB2724.namprd02.prod.outlook.com (10.175.95.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Tue, 4 Jul 2017 17:29:33 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BY2PR02CA0125.outlook.office365.com
	(2a01:111:e400:5261::51) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11 via
	Frontend Transport; Tue, 4 Jul 2017 17:29:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
	via Frontend Transport; Tue, 4 Jul 2017 17:29:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dSRdi-0000sU-CL
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Jul 2017 10:29:30 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dSRdi-00087H-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Jul 2017 10:29:30 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v64HTKl8022393; Tue, 4 Jul 2017 10:29:20 -0700
Received: from [172.19.2.240] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dSRdY-00086C-1F; Tue, 04 Jul 2017 10:29:20 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jul 2017 10:29:07 -0700
Message-ID: <20170704172908.14734-1-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.13.2.3.g44cd85c14.dirty
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23174.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39400400002)(39850400002)(39840400002)(39860400002)(39410400002)(2980300002)(438002)(199003)(189002)(9170700003)(107886003)(53376002)(110136004)(966005)(478600001)(38730400002)(81166006)(8676002)(9786002)(1720100001)(50986999)(8936002)(1076002)(626005)(189998001)(4326008)(6306002)(33646002)(1860700003)(19273905006)(106466001)(5660300001)(5003940100001)(77096006)(36386004)(36756003)(2351001)(2906002)(356003)(50226002)(47776003)(48376002)(50466002)(305945005)(63266004)(57986006)(6916009)(6666003)(91966014)(76506005)(107986001)(562404015)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2724; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT060;
	1:aa425iMETbJWB/FReaUO8EpCLk5+KcZHkrWGOVJPgU22a09IBshpL3cfAU53iazCCdomimr0eIin4B87qvsztCkPYCTd4jgcLSdRy0rSx3QJ8q0SemnpV+myhcwsZXtLlAV2v5pqiW4yS+tOfRwlsL9HsV7YAktD2ZkQ1IigkG4vxXo5P4VkKepqXCojtpr7g/Y2Kqxys4BS/S01IgSVVmeacfxJvqjoBm1Xn1KOZLSFPRqvBMpdHvCtlAXufbLsTeDwBt3SzYSaprfl7YtI6XQHkhWItjZvCP7mjP0SFmK9NpCTk/kvenNzD6xw24yeRRrKWstiktWx0uiaZhzF5POzEpvUzvuLvW++MVG6bsDiBdjYSUpdDmHpvitE6+JAkE6Gvxdr+VsSU8A0FueGC9ibjcVENISRQOgzsiZQrLiX2IL/CPTp+yWYsUVUlY0bcH4+5I11GvW+D/lVgjakgWZtCQ6d0Gy0B35RXsBSOnBV7vzIJiWOx24FekXrpdrDyvTkHT4yw830dWoDvN/nlqdSOy+TY7mZ+6g3cKOjVc4NWJTf/ZNNvSe1qc6cRA62dDzk5TKAA+f7JsMseIzdGa8gmdOhja/X1hs2KsQsdACv+UOOHVWr0RW74WHvKrJ82dYjh3F8fEHI9WUTYTxixpp95m0tYl5XZOl8JnpbJG3jn98dQ0ViCbS7hKLIR0z9jRkUQcE41gRmgF8LK6FmY6GTqJMVB2+4z2gqASw6wUdYlKsXE1xEAbj5o7OFMQBAB6EVsbOTNKjEjmwJ04cACawWi8+cEWGA6pC7cCF9NJLMpios4Cy/HHrRakWHGsHuSdkvI8jCyURAv7K9iS7ezd/RYWjJQDzt4Lkdom5NxvMiS+xQFXm+Y3BjTCKfJQJj
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31964f6-8ee6-4bed-6d85-08d4c3023b02
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR02MB2724; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	3:1h1mQnQmCBFIQ9N/6u2O2MqoJ3YjUvox/ViI+EXPDLgohHGkoP/FFA814ZqNmDIxjM+TBMbFTADT6ZUrr8RddDeIXFsByOhsiZ7yThAT834K/kBh/4VkJuksQwPrN4Ln7xaSZNBSphz2GFCZC1V1dVbaKqVJTM6OHs3U+hQ+Jxb/Ne58zCa9u4tjhNuYIMlwyxlalM9ngZA1SMzOASCl/f7q+L16ITH84FXzeLp4YdV5b6rAwnAsCxz/cbfS2Usc00p5UI0AHJZs4OQjJXOpH1HvoIb77Hg0ma7pY+wqtMCYhEY8/9u1C9MzOCdNqGcmbZpsuJR+vUB9qCjN3OoJE0a2sXTWO8H6Y2T+Yw6zY2Ic5O5xqLemZgU9x6fVKd7zQ6xssYMkONtia99C7Tgja6Q1j/YGNPwCS+FvbuE0lqKXTDD24OMnRYZWuS+I1ppN44FpuQmp0tecvrTW+Cfvnddy1nw+C4ihjHAvr1ghiYYSzkbVUaVD7sgZ+wZ/dd9e+uVjIlbiq934QvuICH10QIuWmeJfAIVzmfWzVHLlCjI6E0lSjy6UXPtnBX3khUDj6Dj99Ab1+NZvodjgzMmCTIW4LmjVOhgH55sJL2+5pfdO5xtodQ96mDj9stcl2gN6QU4b1oTxXlTAoQwRUpbgVIo1dU41chPk03NFqWm7kU74Q7VZNbPIinsWqObPZEZQ9cXq3ueYE42dk/PTPPFm2xqwFzMKwHv8GfTOFOv913plC7KOZdcD7YX0gTaVX1ktlfKbLyBzRwbKDiVPxCKwResF6MCaGHjKkWECV9LDo/aw0V1SidRxeb+LKhV2X/8YQeYJdkVStPiUpMnQkZm2b22icdWYF6F2z2fxF7tCbBr6aRNbbNwcQo1TCUmZkjT03n9ctv3gqJ7SKUs+2pBzAf0goBWlF5FqbTemhgcAKQPdio52AcU+Lmxto9uXbemn
X-MS-TrafficTypeDiagnostic: BN6PR02MB2724:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	25:u1fENXuheA+2WQcobqn6ak/QwgOvuiPGoe5TiGsdlXndQy8FIWpyMuuUGT1WUH0idxr2PvdTL2+HzadhFESCXdiiTwoCD1yEP6k4GJU3RYK+/pOXd7vJ20p2iimrh+HUDgw7kozjq3yZ6ospx7fOZ4xYtVkrHeTSMJ/8PvhTPdy05wh+A/vWRVxS51D2D7rHoba0pIYoWWj9gpswftBmFWT47L4Ld88vDjFhCA/OMRcOyyGdUknQXXPfFVlMzw0N+ySxP83+RDtQP7hKFz3Tg6Sib48c1g8CJ9y1CDF+hpVrbW0u70zVnJ+BgA3pBJ0arfDXOlfC5DkaOQPc3UP8eD0JDwBbJOKzXngH/3FNgNxZNXjfdXl4e4JeQoJUVeSCvKku5UvNMigyufDnp1K6wXHwF4EpBWN2Eef5QisyZjcFh8eUEcBoJFGvSrloPoT+HTI+W4M4OYksaDE+sA8XRWlQfQ4GPTtDJZstH7XRGeLTpEQ5giiAAcSGL7+Si/PcmzxWFi8CGZnRqPjqUUJqDwDXC/w7OBqqCkU0pFediFTQbmdAPcgJrQv6eZz0R9iSflU7GZ0b3m8C3KPNIb2hgmg5f349maSW5uT4iEg5ry5+a6iQfraLOJaCIccbecB2sAnim7nkuooQPXr3He7KEcccgoLSo8WZFZwbQFYn7qwgwCuNLeQ0kBxWQ0EqERt47jJ80+ixNhSwHZ3uREzABhXPg6k2fm3lzb7idzVrA+5ADNRb1osBuxgJiW2nFwvm1HdjvTBCLFC1FcNIOreLOXBOUXRfSQiRGyl9hr0Rb6XRb8FeCHhZ+60//ayOwRYE4aeRmgMNLlvi8ija5TCB0RRaOUVL4i+MOeUA9+ITIbgWX8j+nEeDVARjggdEy2hZDxIruS5S39vzzLRD6dfuFdbhjfVOWYerU/zEXYfc0UQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	31:pZ3OgfT3w9MchFlsJjHmxQ0oIYhy9GF/VNrDD+CkA5kYLe3dACvULcyWhxuLXN8tfN8URiYVINXG1YlFCaF0gCrhMM2cm1RnoJBKj7aaz6jHeAErfBihz+gCgEKQtp8HLNQmR487CT0BXHiJGF2MekEOc9H5DpeouAFaMp7JGcSQBXXaD2dop7k7M5bdJElexUdHEMwl1G7MD5VMvisG8NmBIN3n3nWRkwv0G9xvfLSjo9vxFR9T9GllDciA/qn5sN8cbSFS2btgMNue2ccfs/SY7tYu7QSr6+KDujJ27YcdzSIydn2T3HyomjrA9V19N4k1nDvJ9DQqIy4r8W8paN41FGorm79kvNP2heVcd2EHcNxdjGL868j0D41NZFmGUW8jEmNIwEnz3hKW5tPoxnbT3R5d4lVcgsp2Kp6xp4/NJIHaiS8EWbgQiRLe/812DL86D4DHUcWhFC0DcUOzS0u9QEBvGsVQWc+ld+OwRBBLcSkmnjaZd+WS2RxUhxnlKlzy9DX798LY3ZJ7MLw6hPRirp8Svk7MmnhuEo0mrsbebqY9LU64CvR2DIRuwryoWubu9fInEaMuef9kVJUM23Fvuiz52bEuCAp0YWWHNIp+Xm7WD2wPim11RmxpEyS+usD1hfFscvnHRHYVHTXdIyQY6uJ5ql6kFYzetpNHamc3vGyS65W/OAmOrtU/m8McVzXLFjUQo6xl4JFQHncbCA==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	20:0hWsyev8R1YYhs9lYQ3FFVYqyc4FGD0jSpt3dis+bojHML5U/oZra05Vvd5g3j9cQB6RZs6xy1QTwImkvk6loMeAU+Xd/iz/Hdh3+e4mMseTVgfxL9/+pGfsdF6o2iwoQDd4qAjZKcMAdOWgyVitGs5uK01+TAvme4sXOPUwyLAeH3fj1JBeZwVa3qqwxcy+fFI9qU43l+7jfyqh2iRy21A7v90yF8kYaEqRTNZRyZoghJRXyH+QjE/1D+Mv95h6GisOzn3yAE7KW7RvWlaTWKXXI0kvOG9IldYalfAgi4+Iap52NJEbHoqqs44ca6QSQ+y4pEBqZvGhE3tXXq+dGF7IsHTVcPN9cWWg8xjGFzZMPfhuD3wi416LHLf6nUnk8zvx/pzrqlDY4sSG9ePpk6HD8m2FF5JP8HSRakV3SYj2yZkSpk3v3hOAXc0ol/gMABOAPz6IZF3qJIo+8c6oOGAr/7ZaPTA0sbKsf6VW3KGedGmW56tr2+Cm2E7j8tcx
X-Microsoft-Antispam-PRVS: <BN6PR02MB2724B45B4071A130FF3F5D67B0D70@BN6PR02MB2724.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(22074186197030)(192813158149592)(42262312472803); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(5005006)(8121501046)(13018025)(10201501046)(3002001)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB2724; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB2724; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2724;
	4:qRJvw86LjwWalOzc/m5sZcrqrKjQwSTQYAofjZHL15?=
	=?us-ascii?Q?Wmk3W46oc8HUibEZE2qtbyiM/vAPGSLRkPsGCDLTEKKnesE+1Mr95yUL4p68?=
	=?us-ascii?Q?rW/ZgQNzi9tuIcupJ+FE00sfkV+PRMYPxMjgGtCfA5UnzWP0tzMTHwdjOFvY?=
	=?us-ascii?Q?0r/DDYuu93bTlimFUiw46SiLtYTaUexgDUiQzgaJzoksUhyanlrAOxwQFqVN?=
	=?us-ascii?Q?xE7B7HQcaUkJf8UhzTKo54h/wja16mpUJNjGpmzhHNnWwxLlkm6Yn1kae93Z?=
	=?us-ascii?Q?3UVfSMAKwIX0P6vmvL4n1ZA/NVJlbYSRYTiOOsOmRPfRhy0G1QK7ZUHh1Ipn?=
	=?us-ascii?Q?ejKvqUmvmcJeC9uvijGaLB5yNODIndfDhvVjJhfPfQvC3yuw10To42+F6Ied?=
	=?us-ascii?Q?e+V9TT221ZTWX7I+7MfzPZMBC2iS0N47g1Sppuy6A90+oiKVDYDbDR93EiSW?=
	=?us-ascii?Q?1HPdccC0fTtRhNmyk3DISVVCWM5RmgxvjrLeoeJ9h625K4fijkInSO/MjheC?=
	=?us-ascii?Q?pkUiDcIxMoC8ekS0v52UN/k/xX/dk2WhWf7rKgNavn5nG3/s/LlwCc6Iwdsd?=
	=?us-ascii?Q?1GBt1ml9MYcTJiZBRpC49ejwnxABOJw/i5SOeo+pufh6NKUCnxGL7a7AgjER?=
	=?us-ascii?Q?ziqEO3X5dFGBMABVodHrn5eKS+9VaN806w9a0mQyHsrixGXU43RUrS9guVX/?=
	=?us-ascii?Q?gzYKHo0oLi1pDXFanxHBCAdP9nDhDB/Kll+LX7aV/cpb9aUnX2JeAMNAK80p?=
	=?us-ascii?Q?rr0fVHMBVLFj3JlXG1ihqb9yTLCSHq8PuFV3zMAq0AXiVsy8SLNBw4avsS08?=
	=?us-ascii?Q?AOynRAcVbd5n9dhiEQ+OavPhlu8wzKQsbb7g3GsnyNcnctmaHTkDW/PmnyHA?=
	=?us-ascii?Q?1J74A+pmiBROVRYd1ZRKerbUJWKvmfgwzubVyAq04rMEBMuEt3nFNuS4CzBc?=
	=?us-ascii?Q?tcl1dZ8JBB4VJGbCMFazwkjRWfRtTqRsqMy4Mh5HI0O6B/csVCCnLY8VlaF6?=
	=?us-ascii?Q?/ETlRSMv5Tbcw2afPfmgpcKLE4GqiyG+Z3rwBkOchGBGRt20PeSmzcRFEF6j?=
	=?us-ascii?Q?BmpsOpcbEqtjaT3ZqVoTOamxt53JvmleTZoq56OXFv/trFWZ8n2DWReg/zwh?=
	=?us-ascii?Q?LxP2R5n6tHVYa7zkjn8Fke9bt9g9xJZFfyjPJrLuXTCzark/f1GWTObGa7A3?=
	=?us-ascii?Q?rXbhV/Se9QrtMta39yJ5e1IkkZEiXeYwu+WV48i3lckiroJF+nZhHA6ZvbY4?=
	=?us-ascii?Q?eaBgq2kZM8g2fTWmRR4PnQ/7wHzRAb1RbNYESJPvvPS4e1ITRtjZY86+xBxQ?=
	=?us-ascii?Q?/10MlEXvtPN+1bn7QCqr8=3D?=
X-Forefront-PRVS: 0358535363
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2724;
	23:jVvvxZ8/yaqDuYSVu2xtThJ0FsrZna1jXr1zEWxoo?=
	=?us-ascii?Q?aCGmT7RqBMbKeK4eBO53+WrCgoJuMPJQg4FClQRY0kNOkOBW7IMBVImRJ36a?=
	=?us-ascii?Q?jzmk9lzo1GP4rOKGipfaQWQsLYz0YDHUJQeiL3PGQloYQT/WauYwO5NJvRWd?=
	=?us-ascii?Q?zIj5H+R8VItpzTQalnG6+BEgP9F9eJK09iUwGJ9Th/cEh4lfRU4ja3/lGTb2?=
	=?us-ascii?Q?pyn2/oDKE4/KrPVDitBdeUMRVtFMaavxfEZIsasxqZVO3uvQuz5ScqDMKafA?=
	=?us-ascii?Q?y4UTNvPhAgfyJTVlOvvjRIUPmlJBn2NTKpG4O2cIQhh+bSkIjXPVCj7zqQJG?=
	=?us-ascii?Q?LP1P6aWQLtD9M4gIoZP/aZW2hdefFvdfxnauK3JXarAa2p6FXbO6HE7ExKQp?=
	=?us-ascii?Q?brSNB/VxXu5rpyO3Ei3RIyLOZ279LMe4W7rW8fNFyBvTkxf9aZKe3zGh+RkT?=
	=?us-ascii?Q?HKFkk6b8ZX7pzjrOB5mREm6EhU9kdiQAF2/8sfQy5sPd+6TfwxiK+rNunVLj?=
	=?us-ascii?Q?viDBvX4vkwpIOD3ok950uoNWuzFr4y76O3Xc+c/iErnFIjHeqtcBWXUoyQyi?=
	=?us-ascii?Q?JiA7NdTbo3jqym6SlJzSeKc0p9h4q/8gOsyfbqJ9BQC1B6iVtw2BDIocnV8t?=
	=?us-ascii?Q?S4rd+mFg3Zb+Jnk2JfK3nXLy+MWtXlY/cQS2UsATD+CU2y+z5pRO0t1EMhBX?=
	=?us-ascii?Q?9hSpvaHT6T2JA1EzdSpqGEZ2J9JRlcU+rD7wpBdjiX35M8eUng42D+qROgN5?=
	=?us-ascii?Q?4WX/vqDoliD1w7GnME5MRHtlTEeoCIY4skcNxougoV2Qj/4VVYH2brAqoVNW?=
	=?us-ascii?Q?nWRHkXL4wSIv71k8qrlD3Ofnwa8wwNyFc3TskvbEPUrNodLG9tUbmLvcOzEz?=
	=?us-ascii?Q?/gBXi0zs5D7AVXZ5OxUqgNQhDWt1DxY0lGIR578Hul1yVWVU8HkCfo8f3cxB?=
	=?us-ascii?Q?lNYQvlYWem9b6i7DX2+Mvk/bTyTzSXSacqK1q5o3h++N+1ahOdFHBEN6BtEw?=
	=?us-ascii?Q?iUp47RWxeg/KuIdhJs/APE/vEl3HY1NXd+F3hzL/E9dYqLiAcdzsYdDYCImY?=
	=?us-ascii?Q?Zpt96w8PfLRSKsdvci8PzJyPbkfPAHV+lwHu4dniI64ujWJ1ytf9tB86a8G8?=
	=?us-ascii?Q?IMvejAx0vO3j/vbrMS1thaeZiD7XNVydA0p28gg4GMmi8uNso/iG6Yt49UGv?=
	=?us-ascii?Q?bfcl2bF43gOH9xR9/WLZjNVFwrgmTHY+CYNINprquJXsa2XS0t+1BiuWX6i+?=
	=?us-ascii?Q?52IcykvMgmzaOSrF10R1llS3mSl7GoVehzrKJl7aL//UKLP5kPTuL56BEUaY?=
	=?us-ascii?Q?Nr5QJtJKm7yVzVO7q6emevuXjP+wxGEUsmPRfxqLEbd?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2724;
	6:HwDaiSAQdh6ifldGZ+NR6BhUVgTazi0Zrc6xQnLegD?=
	=?us-ascii?Q?Did1bZeweTosRm+IvJhcEbR1GWKF/QkEmykC2fHnLMLQWeSW84s7b+R22qLe?=
	=?us-ascii?Q?86KSJp2uDoKYwV/FpxeZCz9dicaexfa0Vuu9qur/u5VuD8c+AYigYGBtyZ10?=
	=?us-ascii?Q?yEgmQ6y/MNjdxwuxI5+EGWaIJSa1mrg2WjPLcLkGXBSyAW1o7wzEhxjg/bk2?=
	=?us-ascii?Q?5ULHFLjxeSzC6liGDZ3dDNrOQXXMVC2lsonkUsC4nO29ouSphHWyF88SQGPm?=
	=?us-ascii?Q?5rNttHe50EiIqRrK2WlV5Orqly/82u0SVJdXQ5RUVyRjiZKVsdLOHwCPVNtX?=
	=?us-ascii?Q?eiS16aKlbJ1H1zRnhfUI9ihZjAP0Hs/V0HBwPcRv6+3KZVEWMhm0gRYBvQjZ?=
	=?us-ascii?Q?myDZ34vtIqvXaxkkvKyGkWe/BcLR4Kq63daIOotX+kR8+4ymY3jZNuBIIte4?=
	=?us-ascii?Q?HL+28o2JXtxbKbrFl7dQ9KcMbuLfuxGmbQ4IrzSx0IAXBwEFPth9DQq0QnKO?=
	=?us-ascii?Q?u1vfBzRwdTZsyxsaA6DnI/0tUcRPxUC6jChic7QDPdMKkxjQu44n0hEkvWmP?=
	=?us-ascii?Q?GwbtvOzxVixAuy7SkX6ZE7Q2L1AJ6pSoeWIYAEO5vbMSfmgqqSCgwOykDre/?=
	=?us-ascii?Q?LqLRi8VZCp8SM3QCKm8L2+PzrJwMl3R4ppGIMpx1MkOMg8Aj8ctgKmzpRwN5?=
	=?us-ascii?Q?wazk3AwkWiIJqzCm1ttlTemGH1yESy1J247QdTYCFkJzpnGRn6WN88jPRnSC?=
	=?us-ascii?Q?YD5SeDPWYN73Rn5Do6Z7gnVQ6xonJtq6bWjZo2S4ZrpfTrE/fXSBebJS0Kfi?=
	=?us-ascii?Q?FcL/sjtF8vnt49SPCsndTnUf1oeGmXW4yWeeWqGLg7RKm1YQiCYviOobPdUf?=
	=?us-ascii?Q?nykiGx4b9WsZS6Xkh9lW9gz3azdmJ1mQrWc6W3CnTDN4YjVqYZXXRMXXb6TG?=
	=?us-ascii?Q?0rwtNlTYiOrjVqqu8T6NYRmypck8eR/u1Ilxw1bdp9NPFb0G2pDP+1MPq4oG?=
	=?us-ascii?Q?+EDFbC9MByiniqJgv/Zfsr?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	5:zTva+nUrA0jhvSMsSis8zuGZzFikyfzm1OctjuKxGD26gZrF+c8RajNOYBZUfOPTsQxp1RcRTvqkVxWczYH/XQ7qabEoWImJyddUR/+GN/i8lv6KaNz5Zr+JQnn3sivOlFzPp+fpdYdhc5Gx/RXvKpGxpVjmAXxFgqMsLHkhTWgve+IEntjOTBtah0/0fQnY0FTmnngQiP+JIZ89guY0fZQcj3d8W1RNvZdvqDVXGIKv3pMLGCnWjvD0P7zl4M2Cs3IesNExN6YuemBEu78e08fi2EHadJ8xFR3aL0TbEniXwlxQx5jy3DxeiDZJsVCEKKSZ6ra34EzY8ql6tyBTs+bFUJ1+Yk3Upm++yyLYYQqLOTtZeKLU8ntr0Tr3IjjJmx5bzRTOlCUInrnEY2xdSWdVtBK43J7Z93LmNPvIZb0nO2jxQNYZp6TCcNu6v2AMJhHTCfDsHueUFe1jKb3Nz/0ommkgLcwpfysCzjilzDlnsJJ5ZICXIU1lDKZOb/SN;
	24:2nBvNvFuy8otGEGhWCGf18htquQf49iLO5tHMG6cHCFOchBGNOVV8NgFYb/6QjqEDXebZN5Ho1rfTSp28iVEM3t2y+djNgj0fgss/6KN84U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	7:e46JjqiObUgnsCYCwpTrh85IWrt1WfPy5vvIyNqm2Bd/e5TxsmRUaTQT9yH5kwY/BN9yNDzcQMQFAn7Ws4goCI0HDF+FhGey2bcMJ4+k8BcqBhVJYyMXoWmAfJ1ms0Y0j8avacYvB1j6M1s/6TCsm4mi9III2q3MnsRZklHu0WofiJmR8kMlR4+XxXz9bohJOtj/CteGGzuNaCC6h6D0wsuDzg9KGfVU+X6DAyumNiWAQz4e8bMj4qOEKqmZoFK8eP+9618qEZ4ZViBF96xceOdNdRialB1OCjiUYOkfRjqtvNxpqoSNrO13bnONHh13GYaBsjxkzq4YJfP46oL+QzvwLvnN2KhGFgy31Zf65/wEXUy/Qt/F69MghNEGk8HHMIO30QO7vsQBU2wbpFMdo2rOT/6XaU1tPz2J0wxBVGwU6JHxsYbkl3LsoPdBmunHp2cj5FJVudF9WN5qntAWSTitpHomxtQTi0jBmqSPgwbSW8H/s7aCUMp0B0dNaf/dWx3I7hd38Y2qcvU+C26wbH4BIscAZkbZ7vLxJ8KpwURoYV/IVDg0O2NILkAZ0AiZSYNd6iNYNZ5xGqFReA85xt8urq6DgVnbdMHCDCUyOQUTz8GWNxkyPyTaNXXsOaNx0F5eqUZkr0bdjVtHDm/VjQz4rtjMGFPTkpHn4KwOmRnIFdjc2UPDmYgJfxtN8P/xH2i9YuSAWPFVY0vpjAjocw9BQ0EixBUc6jZ2zeC1+7xAV/T8o87wrDGhRpLNb4yySUEGLN6TLUsJco0rm8IcCdrnRxNcSUn8RMsnkveKy2U=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2017 17:29:31.2198 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2724
Subject: [PATCH v2 1/2] mirrors: Add HTTP mirrors for ftp://sourceware.org
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
X-List-Received-Date: Tue, 04 Jul 2017 18:03:06 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
v2:
 - Add '/pub' URL suffix
---
 meta/classes/mirrors.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b7c20b6cf5a2..de2c2b995bc9 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,9 @@ ${APACHE_MIRROR}  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
 ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
 ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
+ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \n \
+ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \n \
+ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-- 
2.13.2.3.g44cd85c14.dirty


