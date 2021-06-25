Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6446.1624622010784847558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 04:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m44rR6UH;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1810590aea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15PBrTLH011093
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 04:53:29 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d23ygh59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 04:53:28 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PBrSbB011058
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 04:53:28 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d23ygh58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jun 2021 04:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8G/C8k5nBs0uEwNfq2AN2d+TFbe+a1k1e9QkiaFklWVNTP9xUolI+1zxGRzfYqtFMNxu2KWnZskuGWD7d4HN4he/3nEGQyP5IdbqBJA+6+mjgOq4J5x0QZWh1oBvG4hnUIyDv1RNnl0gmVoxvwclxiOUZmIByNHeTdY/LlHYKCb0Ujh37A7Y9mctrc+ziogo/foQz3dUl/TIhvA6AI9djy7MY1ZZLBofJp6uHqQpeSFbi5tPjrXRfnvllojzTVJEZq7/pYHG3p6Dps/sKVnfD4Eh3ujy6bx/xvR9iwRzJff3uqooZ/l1kPYWzu8rLc11LUc6XCwWuFot1VYTdpi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIs3WrqK2pyQRKNJ/nydL/sXQFG46QBG/WULCShzawo=;
 b=e2KThrcIiR+HIEVz1IYrjVEi4Mg+hHqI8WnBL9+BCnp7tNZXfRR20270i3pLjd1Q2VI2GNyNuATCP39DY88+nQpHgbZBB1CIODIZgV13+nnQ2t7By/kQA005EWyG+VV+08woAIedKOKFF3CGMGD++9RruvE+mQ6vAqgT27BzoJxqp0KK61zuImBA+QOshfBKk6e95nnWM+mwgz1fwIw+Z1aGFC/867CWm9JVj2BUjKsEC3safEJC/wxd7Jw1LYw8wysyQbrRaTZ9wSoTHIQi4c6WIDi0YT1MlDqmNRnO7T0OGc2ZENL5gyCOYKt4WtceFkkHo2mNF90vPq4GCt6fpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIs3WrqK2pyQRKNJ/nydL/sXQFG46QBG/WULCShzawo=;
 b=m44rR6UHvVI7YEm556jfPSKCNOfN/ob0STbP01XntyCKFVb7h0PoVUuVr994UFeF4N/CDE/DkwcbjemuWrpxHr02qAcEO4nqmlpcJDNdBjFYqiQssn1IdNzivZfZFL/LF4ob3BjmcrzBOg0/5AHk+tZjjZNXDp6dvoHfYC2kDYM=
Authentication-Results: consultant.volvo.com; dkim=none (message not signed)
 header.d=none;consultant.volvo.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 11:53:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.021; Fri, 25 Jun 2021
 11:53:25 +0000
Subject: Re: [OE-core] [hardknott][PATCH] curl: fix build when proxy is not enabled in PACKAGECONFIG
To: Anuj Mittal <anuj.mittal@intel.com>,
        openembedded-core@lists.openembedded.org
Cc: sander.visser.2@consultant.volvo.com
References: <20210624074243.163441-1-anuj.mittal@intel.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <38faba09-7e88-9db1-b3af-287268db27e9@windriver.com>
Date: Fri, 25 Jun 2021 07:53:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624074243.163441-1-anuj.mittal@intel.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::6e79]
X-ClientProxiedBy: MN2PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:208:15e::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by MN2PR17CA0002.namprd17.prod.outlook.com (2603:10b6:208:15e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 11:53:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d71a53cf-5cd1-4d8b-9993-08d937cfd685
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766E0701C2376CD4C3300579F069@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Y1NCxD7MQWnZohP1aQUYXaw8WnuwA+BJWasD+XsJfsWYXvWe+8FY1IW/7wzUga54NoY0tWLEuQ+PGFjbPQOeW13HpXHVAr7QrUO94wsDrOJmMSzY5C0geDkguog6VBM9rAW2WDuCY6TD1/KHX4rJEBCxhqk66WDo186fjCKHZP552L0lWxIFFPoJEHhsbOhIroTl++HMJrXRjMWyuiORvXWC3PmcJuXM8zB3m+Ff+keCYySpu5lkOLW1CzlJ5NE0Hg8sMc/j/euoQVjiLjqPQJEb10vCc6k3H8JHZXbl+hBpVmcrhLUMc+5oAF9aoOqTzdyHU1HFoiC7j9UiJIy2bUZHq8r3HB0BdwSdyxr23VLYIq5JSZ9yWZssu079jNIm4LtJPN8LcziSdjZl9sAVS6Igc1bQOsVk0Hw1r86ng1jYeJ/Vc/ZIezZ9xlAVB8aFFSJTcmEUU8Huf1xtUf7Dw4YzLBW+ExfjspYC1pp+laJKVJqypdzaN+Q4DVfBfYAyQ6LvRzCaFO50W8wMRzBK1XRbTliyg+8hX61EFqgg6ttVjkJPBKi0gAZ1FdxwHUaAsOgq5fRJEK6d9rL1Zw2PnOUB8HjB8nWA+O9aiX9Iv+/x8NxrFaUSuNoUXrSSFTDFvKJEGAjoovcMFNz1NoimId0r2xqPtqAsXuM6cDj+NLcEzqd2PnrvQjJi+pTuE2euzWFEy3yW8uQbcIboY7HhLo3qrTbzLuv9zY/mXc+Z4/zgrpv5QGxxxt6ynAQ3c5g/Zl3G1zoxFnPc+mg0LU0d7/47xOucxpD4sXchmKn6s4A41YsdSNaUiiNsWmAFuMblIFw1qYOLhsRaRG6AhxrFO1XXp5kFJiA050oy+hXGtQyMa1AQ9rLNPuyyEG7XBHBmArTzaESPLMREstjsYWfxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39840400004)(66476007)(31696002)(66556008)(66946007)(30864003)(8676002)(86362001)(166002)(36756003)(31686004)(478600001)(4326008)(83380400001)(5660300002)(8936002)(186003)(16526019)(316002)(33964004)(53546011)(2906002)(6666004)(966005)(44832011)(2616005)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXVUemZBamFORHFRelZzbWk5ZFRSSHRPQk9LYWxnaVo4bkJXSmpIYnZZVXdD?=
 =?utf-8?B?WUZ2a1RFMmFiU2NBZmw3TmwvUXF4OUFucUU4SElJMDNrcktKSDcwNGFLQmow?=
 =?utf-8?B?RjgwMm5uOTBwWFY2VlJBS3R0bzhEOFU4Z2RSQzUxbkdWOEdKYW8yUmF4U29u?=
 =?utf-8?B?WVc3S2dza1N3QUN3Nkd1VmM4QXloQit3M1lVNXVScmJDVXBNdWUycDFRVk1U?=
 =?utf-8?B?bE9vemlHUlJsZnB4ek5pTkN0VVBSbWl0RFZ4RFA5KzVGa0hSUFFMZStxTmdT?=
 =?utf-8?B?NXZlc1RYREcxbFBFaTRPV1M0czhvMkhHaGxWLzI4WXJ1c01JbkxuMU9aQVlm?=
 =?utf-8?B?cE53SGpDb0FOQWYwMzhBMFBSOUhLWnRwRXlIcTFZVHcvN1ZLQlJKbUE2cGFW?=
 =?utf-8?B?UzJvc3gyYW50dFQydGFoR29JMVRBeTUzSUl0Qi9Ca1lOK1o0eFhLM3Z6UTJn?=
 =?utf-8?B?U3haRzEvYkgxNkxYeEFJQ2pVd3hHUXNsRFdOckdHSThoODdBU2RocUh4T21O?=
 =?utf-8?B?SXl2Y3FWc0FTODFuWGNURjFsNWFJd1RUSnozZGhKQ2Q0d05LblBxT3I1cTJY?=
 =?utf-8?B?ekpLa1pjU2poLzFibSs5R2JzNEgwVlZRVXkxek1EbEFDdnlPY0liay9Ucnh2?=
 =?utf-8?B?aE12b08vczR5cW5HK2FncHZSNjVoUDBnTDVsNk5RT2d0TlQzWlJxQm54MHBT?=
 =?utf-8?B?YzdRcXVGd3FGcVFUWDlQQnRKM2hHQzZBaVdrakZUR0NwblVDTS8rWWtwcnlR?=
 =?utf-8?B?V1kxaTZMaEwxTXZmK1RPQzBnRjBFZ0g1Q0FTbVd6alpsOUZPNXVlTllFZkdi?=
 =?utf-8?B?WWFOakk1cVBnNThNb0VMejk1czBvKzVWbk41d0hVNno2MEE3aVdONVVsNkhR?=
 =?utf-8?B?U0JHbG5nRzRvdGpqbWEzMkl2L0J0Z1E0UWoraXY2WldvQnkyWlRMbmFHZWxS?=
 =?utf-8?B?ZDIwR3dqS3d5em1lUC95MVJtazhIM280WFNEZWhpVVlLay9oeGtTRVlGLzhI?=
 =?utf-8?B?QndNSXR1RWg3Qm5Odzcvbk91OVRFR3Z0SG02ZXRrV09iNUFJeldhT3ZodFFV?=
 =?utf-8?B?QjliRWpBaE5zTVJ5YWRGbTVQdTlUeG82RVVaM2FoRFZGbGswRWhOb1ZxR3hx?=
 =?utf-8?B?ZGJmTi9IbGNMMmtlYlM3eTUzVURFcE5nVVNHdkVZdGNwNlRxL1Q0U2JkYjFk?=
 =?utf-8?B?MnRveWZDY2NBQUpMVTA5NkZyMEdNeGdwQ1VGWTY0ek5ZV3VHdFVvYXhBSEQx?=
 =?utf-8?B?dkhiU2RmWnRrb2svbjkrdXY1Rlc5ZDVkSisvRExKUTNZQXFreE5ZcVNuOEt1?=
 =?utf-8?B?Mm13T013bWEzVVUvTUFxUDJyY0VlOUIrdFg4d3k5U0R2eFlRMHBWKzRpL3pC?=
 =?utf-8?B?TlE0NkVtRFpaNDdOc0tYbDR2TjRYcFZsV01kOHlOa1hrQUZHWUhxdHFxcWJ6?=
 =?utf-8?B?WDNTV1RWcHVpYlk3R2h4TnAraklvM1JseXJtdm5wcmxWZk5SNURKYjV5dlBq?=
 =?utf-8?B?R3R4ek5qc2dGQUQyL1MyYnUyaDJDaU5KcytZQzdobW0raHI2WjQraEtTS1gy?=
 =?utf-8?B?OVF4dUFUOTcyczBBSFZGbGZQaUpKWWxzZFFVSWMzYm5RWVdVYUg3bk1KYlZS?=
 =?utf-8?B?TXFDQnAxdFZIWThLLy8yQ1ZkSUFZS2xyT25LY0tuL1NicDRjV0VpbW4rRXdL?=
 =?utf-8?B?eWlZWmIwckNydkZWMFRLMlRPSWx6Yy82MmVHcC9Cd1laNmZ5bWhmTzFnNWQ1?=
 =?utf-8?B?QlRtdnlHZUtLbysvRUdET0FjUW5acFZwRXpzbmhSTXRuMkN5a1J4WUJyZTMv?=
 =?utf-8?B?dUs2VkVVemU1RFdtQldGQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71a53cf-5cd1-4d8b-9993-08d937cfd685
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:53:24.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beCS/wAIkdwZbdfAc/zkJ6qlM4JIfZ+pRl1QGcRNJSB8f7tFZDLiDdqWNSfBlb5tfAsknyzGRoSPbI0dxIwbNVMoxkdeAOxhdG0h9uwB1Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
X-Proofpoint-ORIG-GUID: 49c3vFA-xJL0XXgv-_G-onKToKOVb5XW
X-Proofpoint-GUID: Ctf2BUJrEqma6vl-whbMj9ifXUudExca
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_04:2021-06-25,2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106250068
Content-Type: multipart/alternative;
 boundary="------------9A4CA4DC6583C44497F2AAF1"
Content-Language: en-US

--------------9A4CA4DC6583C44497F2AAF1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15PBrTLH011093


On 2021-06-24 3:42 a.m., Anuj Mittal wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Backport upstream patches to fix issues introduced by a backported CVE
> patch. Fixes:
>
> | ../../curl-7.75.0/lib/vtls/vtls.c: In function =E2=80=98Curl_ssl_addse=
ssionid=E2=80=99:
> | ../../curl-7.75.0/lib/vtls/vtls.c:508:14: error: =E2=80=98isProxy=E2=
=80=99 redeclared as different kind of symbol
> |   508 |   const bool isProxy =3D FALSE;
> |       |              ^~~~~~~
> | ../../curl-7.75.0/lib/vtls/vtls.c:488:37: note: previous definition of=
 =E2=80=98isProxy=E2=80=99 with type =E2=80=98_Bool=E2=80=99
> |   488 |                                bool isProxy,
> |       |                                     ^
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Thanks for catching this!

- Trevor

> ---
>   .../curl/curl/vtls-fix-addsessionid.patch     | 31 ++++++++++++++
>   .../curl/curl/vtls-fix-warning.patch          | 40 +++++++++++++++++++
>   meta/recipes-support/curl/curl_7.75.0.bb      |  2 +
>   3 files changed, 73 insertions(+)
>   create mode 100644 meta/recipes-support/curl/curl/vtls-fix-addsessioni=
d.patch
>   create mode 100644 meta/recipes-support/curl/curl/vtls-fix-warning.pat=
ch
>
> diff --git a/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch =
b/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
> new file mode 100644
> index 0000000000..a4b9cb8931
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
> @@ -0,0 +1,31 @@
> +From 2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf24 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 29 Mar 2021 12:50:57 +0200
> +Subject: [PATCH] vtls: fix addsessionid for non-proxy builds
> +
> +Follow-up to b09c8ee15771c61
> +Fixes #6812
> +Closes #6811
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/2c26eeef=
12f0204fb85d6bf40b4e7a1e2ddcdf24]
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + lib/vtls/vtls.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index 95fd6356285f..2e07df0a0462 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -504,11 +504,8 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *d=
ata,
> +   const char *hostname =3D isProxy ? conn->http_proxy.host.name :
> +     conn->host.name;
> + #else
> +-  /* proxy support disabled */
> +-  const bool isProxy =3D FALSE;
> +   struct ssl_primary_config * const ssl_config =3D &conn->ssl_config;
> +   const char *hostname =3D conn->host.name;
> +-  (void)sockindex;
> + #endif
> +   (void)sockindex;
> +   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
> diff --git a/meta/recipes-support/curl/curl/vtls-fix-warning.patch b/met=
a/recipes-support/curl/curl/vtls-fix-warning.patch
> new file mode 100644
> index 0000000000..113b6fd116
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/vtls-fix-warning.patch
> @@ -0,0 +1,40 @@
> +From b31d9ccfc2da288900e6857ad8d048c612328cac Mon Sep 17 00:00:00 2001
> +From: Jay Satiro <raysatiro@yahoo.com>
> +Date: Sun, 20 Jun 2021 16:42:58 -0400
> +Subject: [PATCH] vtls: fix warning due to function prototype mismatch
> +
> +b09c8ee changed the function prototype. Caught by Visual Studio.
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/b31d9ccf=
c2da288900e6857ad8d048c612328cac]
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + lib/vtls/vtls.c | 2 +-
> + lib/vtls/vtls.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index 82883c9c55e2..fe43703bf8b8 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -497,7 +497,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, =
void *ssl_sessionid)
> +  */
> + CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
> +                                struct connectdata *conn,
> +-                               bool isProxy,
> ++                               const bool isProxy,
> +                                void *ssl_sessionid,
> +                                size_t idsize,
> +                                int sockindex)
> +diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
> +index a0585c9cec4c..f1a9b8033ae5 100644
> +--- a/lib/vtls/vtls.h
> ++++ b/lib/vtls/vtls.h
> +@@ -247,7 +247,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *da=
ta);
> +  */
> + bool Curl_ssl_getsessionid(struct Curl_easy *data,
> +                            struct connectdata *conn,
> +-                           const bool isproxy,
> ++                           const bool isProxy,
> +                            void **ssl_sessionid,
> +                            size_t *idsize, /* set 0 if unknown */
> +                            int sockindex);
> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-sup=
port/curl/curl_7.75.0.bb
> index 7c7b363ae3..f7a8202bc9 100644
> --- a/meta/recipes-support/curl/curl_7.75.0.bb
> +++ b/meta/recipes-support/curl/curl_7.75.0.bb
> @@ -13,6 +13,8 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.=
tar.bz2 \
>              file://0001-replace-krb5-config-with-pkg-config.patch \
>              file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addse=
ssion.patch \
>              file://0002-transfer-strip-credentials-from-the-auto-refere=
r-hea.patch \
> +           file://vtls-fix-addsessionid.patch \
> +           file://vtls-fix-warning.patch \
>   "
>
>   SRC_URI[sha256sum] =3D "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e5=
0a01869effb316d026"
> --
> 2.31.1
>
>
>=20
>

--------------9A4CA4DC6583C44497F2AAF1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15PBrTLH011093

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2021-06-24 3:42 a.m., Anuj Mittal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20210624074243.163441-1-anuj.mit=
tal@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">[Please note: This e-mail is =
from an EXTERNAL e-mail address]

Backport upstream patches to fix issues introduced by a backported CVE
patch. Fixes:

| ../../curl-7.75.0/lib/vtls/vtls.c: In function =E2=80=98Curl_ssl_addsess=
ionid=E2=80=99:
| ../../curl-7.75.0/lib/vtls/vtls.c:508:14: error: =E2=80=98isProxy=E2=80=
=99 redeclared as different kind of symbol
|   508 |   const bool isProxy =3D FALSE;
|       |              ^~~~~~~
| ../../curl-7.75.0/lib/vtls/vtls.c:488:37: note: previous definition of =
=E2=80=98isProxy=E2=80=99 with type =E2=80=98_Bool=E2=80=99
|   488 |                                bool isProxy,
|       |                                     ^

Signed-off-by: Anuj Mittal <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a></pre>
    </blockquote>
    <p>Thanks for catching this!</p>
    <p>- Trevor<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20210624074243.163441-1-anuj.mit=
tal@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
---
 .../curl/curl/vtls-fix-addsessionid.patch     | 31 ++++++++++++++
 .../curl/curl/vtls-fix-warning.patch          | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-addsessionid.p=
atch
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-warning.patch

diff --git a/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch b/=
meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
new file mode 100644
index 0000000000..a4b9cb8931
--- /dev/null
+++ b/meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
@@ -0,0 +1,31 @@
+From 2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf24 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:d=
aniel@haxx.se">&lt;daniel@haxx.se&gt;</a>
+Date: Mon, 29 Mar 2021 12:50:57 +0200
+Subject: [PATCH] vtls: fix addsessionid for non-proxy builds
+
+Follow-up to b09c8ee15771c61
+Fixes #6812
+Closes #6811
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/curl/curl/commit/2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf24">=
https://github.com/curl/curl/commit/2c26eeef12f0204fb85d6bf40b4e7a1e2ddcdf2=
4</a>]
+Signed-off-by: Anuj Mittal <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>
+---
+ lib/vtls/vtls.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 95fd6356285f..2e07df0a0462 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -504,11 +504,8 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *dat=
a,
+   const char *hostname =3D isProxy ? conn-&gt;http_proxy.host.name :
+     conn-&gt;host.name;
+ #else
+-  /* proxy support disabled */
+-  const bool isProxy =3D FALSE;
+   struct ssl_primary_config * const ssl_config =3D &amp;conn-&gt;ssl_con=
fig;
+   const char *hostname =3D conn-&gt;host.name;
+-  (void)sockindex;
+ #endif
+   (void)sockindex;
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
diff --git a/meta/recipes-support/curl/curl/vtls-fix-warning.patch b/meta/=
recipes-support/curl/curl/vtls-fix-warning.patch
new file mode 100644
index 0000000000..113b6fd116
--- /dev/null
+++ b/meta/recipes-support/curl/curl/vtls-fix-warning.patch
@@ -0,0 +1,40 @@
+From b31d9ccfc2da288900e6857ad8d048c612328cac Mon Sep 17 00:00:00 2001
+From: Jay Satiro <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raysat=
iro@yahoo.com">&lt;raysatiro@yahoo.com&gt;</a>
+Date: Sun, 20 Jun 2021 16:42:58 -0400
+Subject: [PATCH] vtls: fix warning due to function prototype mismatch
+
+b09c8ee changed the function prototype. Caught by Visual Studio.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/curl/curl/commit/b31d9ccfc2da288900e6857ad8d048c612328cac">=
https://github.com/curl/curl/commit/b31d9ccfc2da288900e6857ad8d048c612328ca=
c</a>]
+Signed-off-by: Anuj Mittal <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>
+---
+ lib/vtls/vtls.c | 2 +-
+ lib/vtls/vtls.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 82883c9c55e2..fe43703bf8b8 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -497,7 +497,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, vo=
id *ssl_sessionid)
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
+-                               bool isProxy,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index a0585c9cec4c..f1a9b8033ae5 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -247,7 +247,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data=
);
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
+-                           const bool isproxy,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-suppo=
rt/curl/curl_7.75.0.bb
index 7c7b363ae3..f7a8202bc9 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -13,6 +13,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"h=
ttps://curl.haxx.se/download/curl-${PV}.tar.bz2\file://0001-replace-krb5-co=
nfig-with-pkg-config.patch\file://0001-vtls-add-isproxy-argument-to-Curl_ss=
l_get-addsession.patch\file://0002-transfer-strip-credentials-from-the-auto=
-referer-hea.patch\+file://vtls-fix-addsessionid.patch\+file://vtls-fix-war=
ning.patch\">&quot;https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsessi=
on.patch \
            file://0002-transfer-strip-credentials-from-the-auto-referer-h=
ea.patch \
+           file://vtls-fix-addsessionid.patch \
+           file://vtls-fix-warning.patch \
 &quot;</a>

 SRC_URI[sha256sum] =3D &quot;50552d4501c178e4cc68baaecc487f466a3d6d19bbf4=
e50a01869effb316d026&quot;
--
2.31.1

</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------9A4CA4DC6583C44497F2AAF1--
