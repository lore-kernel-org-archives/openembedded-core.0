Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.984.1794246760304415656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 09:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aW/Hg8uM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5773238b9d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HILaD1664805
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Nov 2026 09:52:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=SPSJYBw0m7/BpoZPIeL1uz
	PJpib/uzrA2q2EJ/D1lg4=; b=aW/Hg8uMckjdhSmGAWAcF5A8T6qkDV3x52UJ1f
	njVv6z1AesHy74Y+GLjgoROV4TXXkw8IZ6hOWF2Nhr1KTrlH8wY8S2U7LVWPUDLN
	k8L4UrWUg1igHITmx+NMd6+/cILtzpLy+TH5g2CtMCjDtAEsclfa8ylKgAq90Nqt
	K7BYRZiU94IOVq/bkRl9l6GC6RTYEYu9WRjRuhobAednqh9eZQDIIaTAhDRfXJFJ
	kJHaV3snoEduAf5OIaqJKtDZx5C3bg74nQo0ljlDPm8kS0UDI6WmzwnR5YYNjYIV
	yYSa8bUbz1CYWh8DpWaC3f1C6bGixQso6MJgHbt+3SPvhWPg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023115.outbound.protection.outlook.com [40.107.201.115])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ht05341f2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 09:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdnfVSYFx5OL1283iyL+qhsTEyoIIgl+j2Lm+pnFyTvw+WrZ+i9e/gBf6QZKNT4Ettezps1jWjWfpXuLeG8bEkFJwHv4NYKQOeImOTzbKBJjrRK30GtijwQfcjUEpeF00gQsBwfMx4hy1ozN1g+Mwth0AQ6V0xGZpJP4wPJwalbxz9h2p66f7h4rwNbK2Vdde+PPMxtGFljxo6THk2/fjVyFTaSksJdkNgcsnxTv4Z9C9SqjL8O49x3QwOpakOKxzmyqh3mqICoU6XnwqdSfTOd7YgRw9QjXEPAsXTxqajzweJ0SMXWE/y70BzNZBayA82hEVFA75+hxGi2GKsMxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPSJYBw0m7/BpoZPIeL1uzPJpib/uzrA2q2EJ/D1lg4=;
 b=sU0zXfWgSwWRHsSvFl/XMlWL75pk9AXP/7emlofCE3QyjpWkg19bfC6RejpcH5bs0Gfk+rdkTMPg9jyikjJjOj6YiqyaJ555J4PytYvYby9QOm0ns/lAkXeVHmj2AOJDLpZT0XRJqLf6Mal5FkMgnk4EOBXteHczrH6v5PwQpqLLRcQFudoNoHiK8r2OeQWo1LmG1VQO43jq5jc2Pw25EYpVxbBmnGUdw5b9ZqH1Bq+91lZacWJ2Ry8h13J5v8owXlhAnVYC0hZjQEFWaTrdcfI9/mABuMWc5xYrKuSYahS+0l1Kp7z+emGaarzUmkGToW6wAFUPEhHmyE3Kes2PTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:22b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 17:52:33 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:52:33 +0000
Content-Type: multipart/alternative;
 boundary="------------s4WZKhKViW0E4Ow3GPxKNFHd"
Message-ID: <244e4b29-9447-4cc0-a32c-5f31a77d5e22@windriver.com>
Date: Mon, 9 Nov 2026 12:52:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cargo-c: keep the build host triple out of cargo unit
 metadata
To: sunilkumar.dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alejandro@enedino.org,
        sundeep.kokkonda@windriver.com
References: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
 <20261105113205.1571267-2-sunilkumar.dora@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20261105113205.1571267-2-sunilkumar.dora@windriver.com>
X-ClientProxiedBy: YT4PR01CA0395.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: cc40a74f-742e-464c-9784-08df3e8a3b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925022911599003|260925021311599003|260925021911599003|261026121527099003|261028144727099003|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|13003099007|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: rkWk9KbRfTIVPPet8lLCvrGDbZaTt3LmxQe5JnIpA8sCm4ntIq2kjNuxW17OXE1z/HnXe9DqFRz7+NrvtSnzJuU1M1YJcn8iLrVziTbCHxiHT3V59LO0LxDpT1oEmDimMdpU5dEnIT25FfBjaokzt0uIDJ3F4UXTQgIcHnHOfN5OyRqOwbMmq2QheocY9h91KQq9w2CCHiJbd7omwViqc7wHgvOGIEY7EYTOhMW2lzKBLTWwS3+4VT6X4Zv7r/pRcd9Qe00kH66SM0QQ+p8k4OR5bQuYG32h/tlRLGy283KKP7c58w7Wl1W2itu/Wfaz1vLxwfi4ARX/eZc+0EY1mQibdZvSlP6Yl8q2ZmpkeDkNA4h502loJUF04p/hxJkmt34+B8DLnbpQpHaxXgfAAhVVK16EaxDzH48H7NUREzOCbm1FS064idlUfvaJOajipc6khEqSa96kkNtG0OdB0Tg47upIEFOXXYu7R+f3aERZS8JT7HB3xeWb1qdPKRdIHDSsRzJPM9QlpWHvrPQLGSCUh+wtrhxmgjcWFg/zDJWyUUdP+kCWTRDLQlz3KmU7Pi2HytTz7LQ+Bo2szabi1nmI4kMwTwPxP1f82iz+DjFIbgIlovthHiAHJMRDeenJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925022911599003)(260925021311599003)(260925021911599003)(261026121527099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(8096899003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alBKNVVCVFZ6MnlKTlBzK2dRQVh2SDVaU3hyZVR3dFNZWklYV0Q4U3BCem9N?=
 =?utf-8?B?VmpWa2NVc0FJK1VwSTE0N05sQ0U2SSsxditJVDJCWno0MzRISzhvQXhqQzQ5?=
 =?utf-8?B?cndzMDNyN1h1UFhDWHY0T3luTy9Qd1JQSHljZWIvdUdoQ3RSd1VrZTdueDcy?=
 =?utf-8?B?TTVHN05IZ1U1bFRLQVFvYWNxSXZYYkMwdHNHVk14K2Z2QjJlRVVBamc5VEtn?=
 =?utf-8?B?OFMvcGhlYlJ3dWl3T1k5ZXhTUWJ2MnY5Q2pFTll1OHBhb3hGbCtJTnFMY3dT?=
 =?utf-8?B?dEtPNXpWcklqbStuVm9YUklmSStnK3BNb3hZNytFU1JiMTlnR0hlSDl5SURs?=
 =?utf-8?B?bENtTWFIdXJLNWZvQUNKSzhxUnoyQnNTVHd0QTRYaTJQUjNHNW1nNmdGUVc2?=
 =?utf-8?B?aktDRFVFeEx6cDA4R3djUlllVjNWNDlNTDBUV1draFBYdjRVZ3RJekFZTC9r?=
 =?utf-8?B?WDVEUlczWnhwWkNMMFRNNmpjaFRsRVhRWkg5VTlOVlVWdzVSWDhYcGVFbHpJ?=
 =?utf-8?B?YXhIeW1RYUtuT1dNSE1yODZ1SXkxT1RpTXVHYU1sWUt0REVmWStMTkYvbVlr?=
 =?utf-8?B?c1BCdkV2VERyR1lvaEZZZklGWnQvRUgydFdFMjRKNjljN3ZZMlZKUkV0SW9j?=
 =?utf-8?B?Q0Y4endJelJHUWVrWk5pc1N1ZktBZ0hjQVd6My94MUk0RVhpQlhnTkNSU2Fo?=
 =?utf-8?B?RTZYUEZyZlhJcmpyS3kwSWhFZXFWaFdtSnNQdkk4cDEvNFloSHdEcjZKWWhs?=
 =?utf-8?B?UXdQOEZhV01WYlhXbktCa2ZrZ0RUQy96QnNXaVg3cUdhdE1Ma1A2TUM0K1pv?=
 =?utf-8?B?VUEyMEsyM21EV2ZUa2NZM1l2b2hQdTJGc1hERFJac2N4aklCSGJ3UHdCSnpU?=
 =?utf-8?B?T1hMcHpKMTY4R2wwY1lJYlB5WHN4VDRMZnVlY1VCdHE1R0ppbEZ6cDl6WnM2?=
 =?utf-8?B?WXdaRXVSTjAvT24xbXk2clhDMmN1SXhDcTBpcHc1ZERTdmsrUm5mMGZEaE10?=
 =?utf-8?B?VER4TXpjdDBuT2VnNW5BcS8wemtJczVzV2VNRzBlbmMxT2JnQ2trRzZFelBB?=
 =?utf-8?B?SnZiTnBEWEV6SHdieFpHSWdHbUc5T3RYVnBGRGZjZ0lQQ0ROUDNaZ0MrRXJK?=
 =?utf-8?B?MlhYRjRuZjVvVzQ4MGQraHpROGZ6WlpRNmlKMmlMaDN2K25hMmduRWVUMlRt?=
 =?utf-8?B?WG9ta3VIb1lVZjZxdjVLQVFLRzNUWTB4R3pEUm15NzZleFZ5Y1ZIQUxPNyth?=
 =?utf-8?B?NVEyaWRVVng5NDlrNWczU2dmS09hZG9MWm9OVGs2RnhNVkF6ZVArS0pqdFA0?=
 =?utf-8?B?VkJNMUg1YnIyd1N5cjVKZVNHWitJTVI3cmkvY0hNRHZvRy9ZZE5YTmlQMWxL?=
 =?utf-8?B?NzVxY3hiQ1BKdENQdzdDcTdvOXlvNHhRekFzck5PdWc4bEdnNVE0a09zYUNS?=
 =?utf-8?B?QjFoa3M2Y3pHZ0hkWFVkcUxwSHhveHU3V0JDUkozVUtaTnEzN00xNE8rWEZL?=
 =?utf-8?B?U0habC9GWlNEYzk2ek44aE93dTNEMFBJZ0NBeXZnU0N6c0FyNXJybXpPd0Z6?=
 =?utf-8?B?dmJnMW4rZmN5RFZibFpuZndYcnZIRGV0OWt2V0FnQlJ3ZTV2azhWSGF5ck5Z?=
 =?utf-8?B?c0N3SFNCSFEzWUlQbktrQ05kNlhUQjVLOVQ4cnJ4ZHhhSXZLWm5yWGRJWGlS?=
 =?utf-8?B?bGFsTHNSTHJLVHdZQ2lOY1U3Y1FTU3VQS3F4QzB4NDBBSzAvZ0Q5Tk04dzU0?=
 =?utf-8?B?ZWVlcmlzS3NnUWVhejFLeEh1d044TWZjWVRjU3UwU2pDVmxNbmRKbTZiTThq?=
 =?utf-8?B?Tkx5NTBJaHdqLzNoTThsTWdmNVY0M3hDM0FsWmxwVFptRkFHc1IzcHB6WHFT?=
 =?utf-8?B?d0FlNTVYaHJQdWJNYWtNOW1JcklPWlgvcGNCejVIS29SbFEwTnpmYVVYN0JQ?=
 =?utf-8?B?cmdWbldXV0wvUWk1cUEyWWs3cVlRV3pvYzV0d2kxam84MGs4VFR2eHo1dWlK?=
 =?utf-8?B?QUNQdGo4WklNL3ZuOTNmSU5STmlZcUVLVGNhamtucDFnNGRFZitKcHFxaWhv?=
 =?utf-8?B?QnVCcG5FQ0lDSGJIK1ZXdzBQa0lWcWY0RnhCZURWN1pkZ3FpSEo5eDUxTjN2?=
 =?utf-8?B?WXM4MG5EYWszdFNSNXNUa09Ib3ZtMmVUdDRRTmc1NHY3bTM4bkxnQXJDVU5C?=
 =?utf-8?B?SGt5dExodEhRL201VzZ3K1p1OWRMRDNJcmJ1ODRZTEFLNFRGTjMwK1gxcHYr?=
 =?utf-8?B?eTdtQUloMW54bStDaVUrdnFGL3kyZTRoV3VPL045SFpaQ3VXSEl1YmxIRlVX?=
 =?utf-8?B?SHJQenBjbGdZN3B1cFpldnY1V2pVQS9QbUtGSXV0S01uYmdOTzRBQjRockNF?=
 =?utf-8?Q?18EaH9GpysMf3jz8=3D?=
X-Exchange-RoutingPolicyChecked: MBtuvf263RoLk73tOEVe27FN2m0NyzNOmK+vnU5jNyI5iG7Iq7bQoPuUfDt4//4KDZkJ2r9UN5O2hlbT08Ay/XcqU/JrWuJhUgkpuQCIH/+iAnB1hLGVwmd1amWvfFDvDrzCIHVuP1tI+NS67chXAwH1wT1RgdhwyrcKXjk7vbOY4VcV20P89H2kgAUBfJYSQ1TDgWQMFf97H4IaIRAL9nfAizHe0zZT3mErkYH2VBKhT2chtHqFckuuwRSoTlqLCjTcO5g7TEQbwm7q03iMmXAcfTM9JWIs8i3cPimg/vayFfsQFPFP1Y7+Aeun4b9m0FuxqYdDEY6de23JE0olDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc40a74f-742e-464c-9784-08df3e8a3b06
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:52:32.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2n6sZLrWdhT21nvwAwLzCkZXU//AbyL1r8f87/iinD+oqph/xjVnjU9DpGDSWQzWDUR/1L1Py1x6k3G0b/lCaUE07Rob+pNbtGxxeVnvKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: SGOhj5R8Gf0C-UTFkGwaGIGgt9CCXeZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MSBTYWx0ZWRfX7k1UdLLD5nNX
 Gn7NFqvlVYmui7p9pAFg2E1LcEdF0hmUD0Dr/MopS/KM/Q7ZYoJnffG2qCQOEzBWWC5k6Fsrwb8
 kQseoYj/djXUsfd8b97ABaS9vT/+r5UIHTT0OrCKbfuC4NJ93i8I8ZHH2wIkzB6FEkK5PBfVh/7
 GXB9eb/u0ClbWFIbWl863sj4wMF/fchLe9p0iaXfK8sjrXSHiKwOyqkHz5pqDcTFfRJhqCNpCNS
 aNsWnCK1GZLz00EI2fVqWOXdLfCKjdmXAPxyUGvcGF8gBVtzIZ4YQd89psrnA0ZVbjiuBEkcIOM
 3spDitwZM1mZZ4+xKNSXL7SiWawbG4gRc3twMfD0vUCtF30eaIWolvAgE3HQaIOJLY9g9QE/2hf
 633qN81B3DlIAaHZv0C3HrlCn2H2ekQiuP36tQa6hxm5GXVYLGHE15/8zr9XWn2JrmIkl5EIOM5
 eeEg92f86t61D3EjiCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MSBTYWx0ZWRfX8Cm+zFHA4f65
 lUB1Gv4ctxYLgl/znrT1Jpk8VTCLhhdeVg57ZSM0HOK3IgmO99hl1kPvVQHoPkW1+Zy0MkPBnva
 8aeroVSWyLDWLKHRlvvnZiF4lcHX9Fh2GAOSHKmITbSoT5Aiadl7
X-Proofpoint-ORIG-GUID: TYpJS_f7RkdYhpHFVuGwIt8jBzT69wVq
X-Authority-Analysis: v=2.4 cv=G4mJgNk5 c=1 sm=1 tr=0 ts=6af20867 cx=c_pps
 a=8YD3JtO18OBpAIphJ6JiAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8 a=1Aat4jKu-a1Zm2WETycA:9
 a=QEXdDO2ut3YA:10 a=KDTxaR2oCFmIEBlUjqMA:9 a=wdf0LMfmW-KMtxP-:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 17:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249862

--------------s4WZKhKViW0E4Ow3GPxKNFHd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-05 06:32, sunilkumar.dora@windriver.com wrote:
> From: Sunil Dora<sunilkumar.dora@windriver.com>
>
> rust-source.inc carries 0004-cargo-omit-host-triple-from-unit-metadata-hash.patch
> so that cargo does not hash the "host:" line of rustc -vV into the unit
> metadata of build scripts and proc-macros. That line goes into both
> hashes of a host unit, so without the patch every target crate that has
> a build script or uses a proc-macro gets a different unit_id, and with
> that a different -C extra-filename and OUT_DIR path, on an x86_64 and
> on an aarch64 build host.
>
> The cargo-c copy of rust/files/0006-cargo-keep-host-deps-*.patch,
> later in this series, takes care of the -C metadata (symbol names) side;
> this one is still needed for the file names and OUT_DIR, which end up
> in some binaries as strings.
>
> cargo-c does not use that cargo binary. It links its own copy of the
> cargo crate (from crates.io), so recipes built with cargo-cbuild still
> have the problem. Carry the same patch here for that crate,
> only the paths are different.
>
> Drop this together with rust/files/0004-cargo-omit-host-triple-*.patch.


Huh?

That patch is still there.
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-from-unit-metadata-hash.patch

What do you mean or is this a comment that should be removed?

In general, this patch series is good but maybe you need to review the 
commit logs.

../Randy


>
> [YOCTO #16376]
>
> Signed-off-by: Sunil Dora<sunilkumar.dora@windriver.com>
> ---
>   ...-host-triple-from-unit-metadata-hash.patch | 64 +++++++++++++++++++
>   .../cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb  |  1 +
>   2 files changed, 65 insertions(+)
>   create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
>
> diff --git a/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
> new file mode 100644
> index 0000000000..339317d486
> --- /dev/null
> +++ b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
> @@ -0,0 +1,64 @@
> +From 5c4fd7d8b85f4de5be387777a782fc3ddd1227d8 Mon Sep 17 00:00:00 2001
> +From: Alejandro Enedino Hernandez Samaniego<alejandro@enedino.org>
> +Date: Tue, 15 Sep 2026 17:05:36 +0530
> +Subject: [PATCH] cargo: keep the build host triple out of unit metadata
> +
> +cargo hashes the "host:" line of "rustc -vV" into the metadata of host
> +units, that is build scripts and proc-macros. Every target crate that
> +depends on one picks that up through its own metadata, so the same crate
> +gets a different -C metadata and StableCrateId on an x86_64 and an aarch64
> +build host. Drop the host from the hash. The same class of problem is
> +reported upstream, framed as OS differences, in
> +https://github.com/rust-lang/cargo/issues/8140.
> +
> +Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
> +v5 series for openembedded-core:
> +https://lists.openembedded.org/g/openembedded-core/topic/120939810
> +
> +This is the patch carried in rust-source.inc for the cargo binary, applied
> +here to the cargo library crate that cargo-c links against, so that
> +recipes built through cargo-cbuild get the same behaviour.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego<alejandro@enedino.org>
> +Signed-off-by: Sunil Dora<sunilkumar.dora@windriver.com>
> +---
> +
> +diff --git a/src/compiler/build_runner/compilation_files.rs b/src/compiler/build_runner/compilation_files.rs
> +index 88cab85..9dbd203 100644
> +--- a/src/compiler/build_runner/compilation_files.rs
> ++++ b/src/compiler/build_runner/compilation_files.rs
> +@@ -877,7 +877,7 @@ fn has_remap_path_prefix(args: &[String]) -> bool {
> + }
> +
> + /// Hash the version of rustc being used during the build process.
> +-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, unit: &Unit) {
> ++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, _unit: &Unit) {
> +     let vers = &bcx.rustc().version;
> +     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
> +         // For stable, keep the artifacts separate. This helps if someone is
> +@@ -886,7 +886,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
> +         // omitted since rustc should produce the same output for each target
> +         // regardless of the host.
> +         for line in bcx.rustc().verbose_version.lines() {
> +-            if unit.kind.is_host() || !line.starts_with("host: ") {
> ++            if !line.starts_with("host: ") {
> +                 line.hash(hasher);
> +             }
> +         }
> +@@ -899,12 +899,6 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
> +     // This assumes that the first segment is the important bit ("nightly",
> +     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
> +     vers.pre.split('.').next().hash(hasher);
> +-    // Keep "host" since some people switch hosts to implicitly change
> +-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
> +-    // to consider hashing `unit.kind.short_name()` instead.
> +-    if unit.kind.is_host() {
> +-        bcx.rustc().host.hash(hasher);
> +-    }
> +     // None of the other lines are important. Currently they are:
> +     // binary: rustc  <-- or "rustdoc"
> +     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
> +--
> +2.43.0
> diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
> index 722a128d43..37d6a59aca 100644
> --- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
> +++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = " \
>   
>   SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c \
>              file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=../parking_lot_core-0.9.12/ \
> +file://0002-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=../cargo-0.100.0/ \
>   "
>   SRC_URI[cargo-c.sha256sum] = "5ff6e05531e58286d3c02ec0adb7f254e5d532a8d4b667f30b9942d802e1db25"
>   S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"


-- 
# Randy MacLeod
# Wind River Linux

--------------s4WZKhKViW0E4Ow3GPxKNFHd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-11-05 06:32,
      <a class="moz-txt-link-abbreviated" href="mailto:sunilkumar.dora@windriver.com">sunilkumar.dora@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261105113205.1571267-2-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>

rust-source.inc carries 0004-cargo-omit-host-triple-from-unit-metadata-hash.patch
so that cargo does not hash the &quot;host:&quot; line of rustc -vV into the unit
metadata of build scripts and proc-macros. That line goes into both
hashes of a host unit, so without the patch every target crate that has
a build script or uses a proc-macro gets a different unit_id, and with
that a different -C extra-filename and OUT_DIR path, on an x86_64 and
on an aarch64 build host.

The cargo-c copy of rust/files/0006-cargo-keep-host-deps-*.patch,
later in this series, takes care of the -C metadata (symbol names) side;
this one is still needed for the file names and OUT_DIR, which end up
in some binaries as strings.

cargo-c does not use that cargo binary. It links its own copy of the
cargo crate (from crates.io), so recipes built with cargo-cbuild still
have the problem. Carry the same patch here for that crate,
only the paths are different.

Drop this together with rust/files/0004-cargo-omit-host-triple-*.patch.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Huh?</p>
    That patch is still there.<br>
    &nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-from-unit-metadata-hash.patch">https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-from-unit-metadata-hash.patch</a><br>
    <br>
    What do you mean or is this a comment that should be removed?<br>
    <br>
    In general, this patch series is good but maybe you need to review
    the commit logs.<br>
    <br>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20261105113205.1571267-2-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">

[YOCTO #16376]

Signed-off-by: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>
---
 ...-host-triple-from-unit-metadata-hash.patch | 64 +++++++++++++++++++
 .../cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb  |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch

diff --git a/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 0000000000..339317d486
--- /dev/null
+++ b/meta/recipes-devtools/cargo-c/cargo-c/0002-cargo-omit-host-triple-from-unit-metadata-hash.patch
@@ -0,0 +1,64 @@
+From 5c4fd7d8b85f4de5be387777a782fc3ddd1227d8 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandro@enedino.org">&lt;alejandro@enedino.org&gt;</a>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] cargo: keep the build host triple out of unit metadata
+
+cargo hashes the &quot;host:&quot; line of &quot;rustc -vV&quot; into the metadata of host
+units, that is build scripts and proc-macros. Every target crate that
+depends on one picks that up through its own metadata, so the same crate
+gets a different -C metadata and StableCrateId on an x86_64 and an aarch64
+build host. Drop the host from the hash. The same class of problem is
+reported upstream, framed as OS differences, in
+https://github.com/rust-lang/cargo/issues/8140.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+This is the patch carried in rust-source.inc for the cargo binary, applied
+here to the cargo library crate that cargo-c links against, so that
+recipes built through cargo-cbuild get the same behaviour.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandro@enedino.org">&lt;alejandro@enedino.org&gt;</a>
+Signed-off-by: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>
+---
+
+diff --git a/src/compiler/build_runner/compilation_files.rs b/src/compiler/build_runner/compilation_files.rs
+index 88cab85..9dbd203 100644
+--- a/src/compiler/build_runner/compilation_files.rs
++++ b/src/compiler/build_runner/compilation_files.rs
+@@ -877,7 +877,7 @@ fn has_remap_path_prefix(args: &amp;[String]) -&gt; bool {
+ }
+ 
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, unit: &amp;Unit) {
++fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, _unit: &amp;Unit) {
+     let vers = &amp;bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+@@ -886,7 +886,7 @@ fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, uni
+         // omitted since rustc should produce the same output for each target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with(&quot;host: &quot;) {
++            if !line.starts_with(&quot;host: &quot;) {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@ fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, uni
+     // This assumes that the first segment is the important bit (&quot;nightly&quot;,
+     // &quot;beta&quot;, &quot;dev&quot;, etc.). Skip other parts like the `.3` in `-beta.3`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep &quot;host&quot; since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  &lt;-- or &quot;rustdoc&quot;
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
index 722a128d43..37d6a59aca 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
+++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = &quot; \
 
 SRC_URI = &quot;crate://crates.io/cargo-c/${PV};name=cargo-c \
            <a class="moz-txt-link-freetext" href="file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=../parking_lot_core-0.9.12/">file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=../parking_lot_core-0.9.12/</a> \
+           <a class="moz-txt-link-freetext" href="file://0002-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=../cargo-0.100.0/">file://0002-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=../cargo-0.100.0/</a> \
 &quot;
 SRC_URI[cargo-c.sha256sum] = &quot;5ff6e05531e58286d3c02ec0adb7f254e5d532a8d4b667f30b9942d802e1db25&quot;
 S = &quot;${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------s4WZKhKViW0E4Ow3GPxKNFHd--
