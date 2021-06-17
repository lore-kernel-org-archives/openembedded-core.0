Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5193.1623921888582612809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 02:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M9tVozQ4;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1802350115=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15H9IbM6031566
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 09:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 396yn09h0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 09:24:47 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H9Oki3005595
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 09:24:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 396yn09h0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jun 2021 09:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0aP1gD8KMIF+oVVhph0CfGhS4eUTqQKsSdf7i53h0UySff4Si6fE4etJ732nVxte1RjidCCvUqNFIpqpHHu97c68aKQvkZdbdvR+HJbObqXvVsY0YSxKkr9FTy7hRTnEFgn9QWNj8rN5k48/+9bgnLyZfrapIgG4WDxIRwOy3yJgVelgVzBNNMwlTTw9tfeDIMS+oXYmrR2nSuk5AisGS7prMRkr3VrCQBJOEg4LoourtiMr1qZmT3u4YGbXMsu50ayLWF1Ln59/yKD+5TgU+CoxFlzD5xP2De0Q8pRa11aM43k4Ao9Znw+RygJ8DVFBUN2SWPtnkjv1PCz/K7VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5lN9SRxv8p6n8hLhSxI31l/mCshLoMTNK18jnpXHm0=;
 b=UOUhI7YsHl0zWCgvaRxzmQC3MR3GCyS44waVDPYH3buvQ9O8xm3lXYZDhvmzwHTa9Ik1ZQExuTlS9UPFQTiXyc6ImAsPbuIsf/s+VC9q5soq/jEa68Y0Th0Oc/8o5Ub9+uucN4Y+Q7TsgnhJSL626AjThzMOKr12WzqTzQb7ecg3xU83Q5HdyIJTAJUmIsE2vaSNB8EGJWuCGJ9b4t5WePe2a6FDHWK4MVf1vYb/g9GXSTy/pPfzeHfeP9K1zmwF4GuZyTp9f0UDgfX7KMfRKJAnD+ippStsPQMCKhBgbnKAhicNBNLtgRmfyvaiufXwbY5Boc5otihHUHYUbBNa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5lN9SRxv8p6n8hLhSxI31l/mCshLoMTNK18jnpXHm0=;
 b=M9tVozQ4KfIrSJW255Seqix1LFcrpJRe38sd39TH5jllsGUm0FeYb1WLSr1LGaGIEjY5H9hqYcg8pvYLtu5pyYA/h2ZmxDzTnA33EspWw2VoLFc6c9K1yfqNz3bu1N4x5bjjaPOWeB+8x3m5/GeDa2eHH54Kq1rMzYyYkqQJMPA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 17 Jun
 2021 09:24:45 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c809:efab:de5b:a06]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c809:efab:de5b:a06%3]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 09:24:45 +0000
Subject: Re: [OE-core] [PATCH] util-linux: backport a patch to address mkswap hangs
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210617084924.1794989-1-alex.kanavin@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <993f16d9-c1d7-161c-eaae-e00aef69bcd0@windriver.com>
Date: Thu, 17 Jun 2021 17:34:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210617084924.1794989-1-alex.kanavin@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 09:24:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffbdaa16-11b2-4fa7-6f93-08d93171be8f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4846:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB484691BBF63CEE89DB0F276AED0E9@SJ0PR11MB4846.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XpDFSdSmA/Q9n5kiJm1AAmXKLx1MqcTpZIJ8V07/REKkvpSiYUjkjFtLg5szb5drWLLGjIYa71oc9cDjTXVnw060oefyuPPVlTOY0Y55tgjwYDFdL+eX4UUFxTIh7ehXc0oTT5ciW0PAxhRp2lo2U2h3dHyhzWjDzhpeVv3KGPlaao98atAggTToIPS9PJIJZeFkUXjwa2irj80kGqNVwTmpMIDkSmnbBj8JA9QEx/KGoxY/A2sl6ZT+HUIcpngEa779nEzjiKOJ+y3FEelNfY0GYVcEuRPJ/UulbVc3AmoxHvBx+xCQhvv/HDdArqkzzQBwBHB3GifX+ArzRN+pKp4NiopEXNts12CGBh0MAcd7T4f3i1d35ibLid2/xgIb/zi5omMCDYmKoeB9dTJx01jYAZfa+LHi/XsPhVPWWHdD6ec0xHa4N7Be5FFqd1Zxp4IBzAUV1skw/idwfsVGvtxyNc0rzZtCH+SQpIlZNbq6RrlCrtA2WVwo3SHX08qdVfp1SO5mEax8kWoYtFg4KnRdMXtp6xlSI1Jd/E9TWlfxWV/AmnuerX9yXWq1+JzTkdDerXdYXZ3IHe4zh9RCTytpkCTJcBRFQl/aDuKzESCe3zbyGk/uxMlE6whZrnczpaaZNZ2P54oHkhPZqfXUWvE7X+TlXe/mgjJeU9xwziH4yaDfe4uqZOtcTVLqHf9z5HuM7clRCmczcgtdeNRIB4BDvGH5PbJeJvf18WdaoJgOtm44eQmqBycibh0JG/M2MequlS2J/dL0by63hUx4eHofAPiP11HBxBZhVI1hOfchlBdv3YrXLeuS43s3wwBITFm5MEHd9GVt71twqD8XneCw4BjTtFHO/TM6ym0R4fJVRThd2vF7eu1ax3Lhitb/U3RREmlmN8w0d3r9JrOElQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(16526019)(66946007)(16576012)(31696002)(478600001)(26005)(66476007)(6486002)(966005)(6666004)(186003)(66556008)(316002)(86362001)(36756003)(33964004)(166002)(38350700002)(38100700002)(8676002)(6706004)(53546011)(83380400001)(2906002)(5660300002)(52116002)(31686004)(2616005)(956004)(8936002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDFseEY1bzJSMU0zYUZvNHpIUFFSckgwMGZ1M01ML25iYThIcTJyTkVvVzlX?=
 =?utf-8?B?cTlGM1E4djVTWEQ4WlR1cUJLSHBtdW5FN3BPY003QXFmYXFWbWUvTGlMWGJH?=
 =?utf-8?B?bWVPRW5HT0FkcDdXOVc3MTQrb21WTFVmUHp1VmdpY3hIcVZ6SUg2QmgzQjJY?=
 =?utf-8?B?Rnl3UVJKaW1QaXgvWXF1TldsTHFYN085Ti9WOE9MK2I3WnBGZTU0Z29NZjc4?=
 =?utf-8?B?WFd2WHdsd1NjN3pvdUxpN1RUWU1kWncxeXZjNGR2U1BJR0dRTlFwRmZUckJ0?=
 =?utf-8?B?ck13c2RBaTBZUmt0dHMwbXFiRjlFMGpQUWh2YldGVGZWdkY1ZkhqV3RjUUFP?=
 =?utf-8?B?MG1INFRSMFdkTGZZS1BkajJ6ZDRVSXFWdGs4MWhSQkc0eE9sK1lHQkVBZjE1?=
 =?utf-8?B?cVBoaHZFZkVaakNRc2Q4YmF0YnFLbXZTangzNzBCeU5xZHdTekZ4UlJkOXZk?=
 =?utf-8?B?ZGN2WWJ4VTNOUzVJZHNQd1krMFRSUW1iaVRNY0lLcFdrQnRtcWowL2ZBVEJ1?=
 =?utf-8?B?RXFiYWIxMk9jSlZkN3NuQVlsQ08ydldWV2Rmb2RzeFpxQkY2KzUwMHBaRVgx?=
 =?utf-8?B?ZDJnQzlPS0tDdWZVTGVqT3puZXh6TWFFUTN5dUV3TEluWENOamdpZW1Vekc0?=
 =?utf-8?B?cEMwODNLallxWkNtOXYwZVQ0YUd2alkyL3dtSHZPNHJFSkVSbllrODhOL1Mv?=
 =?utf-8?B?ZlM0NWxxSVh3Kzl2MGxFdkFPSDNaU3d4ZWQ3RGRaNUcxaC9uWmpGSERZaUxZ?=
 =?utf-8?B?eHk3NGV3NE5IQVUwZjJIT0IrMmtKNnQ1N2ZUR3B1Y1dXbmdYd2xKanNkSWRI?=
 =?utf-8?B?UG1GN1F2cFpEUEpsVk5IaEN5SmQra3dBZ3dCbnpodHQvaXZIRHJ6bHhNNzBO?=
 =?utf-8?B?UmRrdzBaQlcvRnNTakhHZlRxTThxU2E3dEJwdldqS21Bbk5Pcmt1cjI5bVBi?=
 =?utf-8?B?M1M4ejBEbE1zUkRvZEprbUFJTEwvQWxkaSs5VUI5U1J5Y1MrcEIrTzJDa1Jv?=
 =?utf-8?B?eG90eTRkQktlZTRmWlBjbndwQWhRaDlJNEJxMHMvN0pQaE55L01JQllYN0d1?=
 =?utf-8?B?VEM2OFJhOW1RYm5kbHA4KzV5TytKVHZZdmt4WE40bS93RFBqcUxUejNnUXg4?=
 =?utf-8?B?ZUcvSjdvN1V3a0ZBMVhzaUZacXFyUG50d21MQzQ0YTNEdFlHblg0RWQxK3Fr?=
 =?utf-8?B?TVN1K2VIWi9NbVlSb0VZT3NQaDdZd05VYzhsSk52YkhCcFlBS2VCM0ljRFNj?=
 =?utf-8?B?SE4yNTBmTHBjSG03YTBQQjBYUS82bDRhOElQd2NneUQ4cFFRNURYUXlvOHAv?=
 =?utf-8?B?T0E2dDA4K0NQTGFxcXJMd3gweVg2cEtDKzdBdlp3Q0NHN01VVmY3c2lNSVVL?=
 =?utf-8?B?VmNKVGo5Z1NDYXd2eUpuM2RERUtTdDdGaUgvd1lYdWxJMzZHZmJnWGlaeFht?=
 =?utf-8?B?WjFDdzZCTzIrcDlGdTJCd1M0MHBLc0NrOEVEL0lIU2xqU0k3RUFQUnpGQjlT?=
 =?utf-8?B?T2hFVloybUhXVWVoMjQxUkNtOFRZR2VGUXdxR2N3L1l1UytIZnRFdUFmTjlh?=
 =?utf-8?B?YkZ2OThOL0NCOFU2eGxtdDlSbGNiL0J4TFBzN2hNbkR0d1cwYUZ3QkhqSGpC?=
 =?utf-8?B?Z0l5Z2E5VVFZZzVXYlFmYWRPRDdYanNjWmpxMFdBRXNoQkpWOE1WTHg0NkJ1?=
 =?utf-8?B?amR2OUo2Slc1YngxZEQwMDlyanhDSmp4b2YyRTdJSnpZMXhGMEJjRWtwcjlp?=
 =?utf-8?Q?8vYganUvvpllXqW9kwd5HEgnCcRf5QId+J2DPQA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbdaa16-11b2-4fa7-6f93-08d93171be8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:24:44.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghfhwWh3YDkrY5fUsUrkfJECUXFPkK3tlN/QLaXzWfUuerQJ/J3IMefL4Uj68WMstTkF6lF66/+AdEaeHOuQTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
X-Proofpoint-ORIG-GUID: fLM3U8rTvu0LO4Vz-nCaqQCNjnIjnoM5
X-Proofpoint-GUID: o2r7e5bB_CguCRxMiZ9xkcMsBMJkV6Jy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_05:2021-06-15,2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170065
Content-Type: multipart/alternative;
 boundary="------------31CF623C1E9675CDC3ED629D"

--------------31CF623C1E9675CDC3ED629D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The patch name seems a little weird? The commit id is better to be put 
in 'Upstream-Status: Backport [xxxx]'.

Regards,
Chen Qi

On 06/17/2021 04:49 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc   |  1 +
>   ...74160b96498d672e3652827aa7e6d7f3a120.patch | 29 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 6a7a6a968f..9d7d8a23aa 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -35,5 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>              file://run-ptest \
>              file://display_testname_for_subtest.patch \
>              file://avoid_parallel_tests.patch \
> +           file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch \
>              "
>   SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
> diff --git a/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
> new file mode 100644
> index 0000000000..a5bb00ab65
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
> @@ -0,0 +1,29 @@
> +From 8a3a74160b96498d672e3652827aa7e6d7f3a120 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Tue, 15 Jun 2021 12:04:43 +0200
> +Subject: [PATCH] mkswap: fix holes detection (infinite loop and/or
> + stack-buffer-underflow)
> +
> +Reported-by: Brian Lane <bcl@redhat.com>
> +Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=1971877
> +Fix: https://github.com/karelzak/util-linux/issues/1348
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + disk-utils/mkswap.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/disk-utils/mkswap.c b/disk-utils/mkswap.c
> +index 27374fd72..c45a3a317 100644
> +--- a/disk-utils/mkswap.c
> ++++ b/disk-utils/mkswap.c
> +@@ -267,6 +267,8 @@ static void check_extents(struct mkswap_control *ctl)
> + 			return;
> +
> + 		n = fiemap->fm_mapped_extents;
> ++		if (n == 0)
> ++			break;
> +
> + 		for (i = 0; i < n; i++) {
> + 			struct fiemap_extent *e = &fiemap->fm_extents[i];
>
>
> 
>


--------------31CF623C1E9675CDC3ED629D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">The patch name seems a little weird?
      The commit id is better to be put in 'Upstream-Status: Backport
      [xxxx]'.<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 06/17/2021 04:49 PM, Alexander Kanavin wrote:<br>
    </div>
    <blockquote cite="mid:20210617084924.1794989-1-alex.kanavin@gmail.com" type="cite">
      <pre wrap="">Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...74160b96498d672e3652827aa7e6d7f3a120.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6a7a6a968f..9d7d8a23aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,5 +35,6 @@ SRC_URI = &quot;${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
            <a class="moz-txt-link-freetext" href="file://display_testname_for_subtest.patch">file://display_testname_for_subtest.patch</a> \
            <a class="moz-txt-link-freetext" href="file://avoid_parallel_tests.patch">file://avoid_parallel_tests.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch">file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch</a> \
            &quot;
 SRC_URI[sha256sum] = &quot;bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5&quot;
diff --git a/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
new file mode 100644
index 0000000000..a5bb00ab65
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
@@ -0,0 +1,29 @@
+From 8a3a74160b96498d672e3652827aa7e6d7f3a120 Mon Sep 17 00:00:00 2001
+From: Karel Zak <a class="moz-txt-link-rfc2396E" href="mailto:kzak@redhat.com">&lt;kzak@redhat.com&gt;</a>
+Date: Tue, 15 Jun 2021 12:04:43 +0200
+Subject: [PATCH] mkswap: fix holes detection (infinite loop and/or
+ stack-buffer-underflow)
+
+Reported-by: Brian Lane <a class="moz-txt-link-rfc2396E" href="mailto:bcl@redhat.com">&lt;bcl@redhat.com&gt;</a>
+Addresses: <a class="moz-txt-link-freetext" href="https://bugzilla.redhat.com/show_bug.cgi?id=1971877">https://bugzilla.redhat.com/show_bug.cgi?id=1971877</a>
+Fix: <a class="moz-txt-link-freetext" href="https://github.com/karelzak/util-linux/issues/1348">https://github.com/karelzak/util-linux/issues/1348</a>
+Signed-off-by: Karel Zak <a class="moz-txt-link-rfc2396E" href="mailto:kzak@redhat.com">&lt;kzak@redhat.com&gt;</a>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ disk-utils/mkswap.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/disk-utils/mkswap.c b/disk-utils/mkswap.c
+index 27374fd72..c45a3a317 100644
+--- a/disk-utils/mkswap.c
++++ b/disk-utils/mkswap.c
+@@ -267,6 +267,8 @@ static void check_extents(struct mkswap_control *ctl)
+ 			return;
+ 
+ 		n = fiemap-&gt;fm_mapped_extents;
++		if (n == 0)
++			break;
+ 
+ 		for (i = 0; i &lt; n; i++) {
+ 			struct fiemap_extent *e = &amp;fiemap-&gt;fm_extents[i];
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------31CF623C1E9675CDC3ED629D--
