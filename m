Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9B3C27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 00:47:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.384.1718153228647645812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 17:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68938acc5b=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C0Amfh023967
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 17:47:08 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2bcvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 17:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAZ4yIJzVopxPgGGxV0Zk+k9FHb7zk/V2Hj3vx27GRBtYrVLYtEfzl7FRza+j44iXaCH1I+KmKs0mBTE3VchOz1eiWz1q6iqk7X5KNHO089vjMwXoRNrrXUl9qy3rGmfyOmcnbs7QkL3tUGpuSJg8Y2AFH/H6b7sZ1FPyJJOxdK9AvyO3U4Ijz9HcrqWdQKnvgMyEUW/yleCOCRf6uB9r9qiHSxID5+N6bCOs/Zn4JDMvGhyX1J76zUu0ePKtnSHecjBhDyYh1ppg1rEKxOPZhZQOHIGfXZRQ43hH79zdcOhY4jh+kzeqSQI4/g2GkaHILfnv3f4tJEfNiFKweXEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bXAU7iss4i77coz1P9IngV5fE/fC8Do+fgkm8RpZwc=;
 b=e7I7cZAj4NrkUj4SXc4+7Z/QyN17KwzB6tA5Qf+fUE1DD55ma5mCSuwQrQUZv4+RI2t7bS8+4VT0PBK/0nOb4szEmGsyhtkmZNT2Br0AAiE5Oppqj8SnveLh5wWFC1wiO94uk3D675EwO7QlMh+b/oVS/FFTGtopgEixklwR5nt9PL4IOzJWj+au5ggqv/hU73A/n6OfkpdTltJ5c4Gwb4aR3ln8S+bMaMl3b/f05pxa1K21CFX4bLaQR0HSWxaYa3B2qEdb4u4uqqVTz5NII9KGdh4NBICZ1RMyyfC2OlX4if0LboxWZXAlrAbQ9Q7rr9WgEoumldo0NE66REt7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 00:47:04 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 00:47:03 +0000
Content-Type: multipart/alternative;
 boundary="------------JU7krRm3XEvkHxEsCbKlYfLq"
Message-ID: <643de14c-c65b-43f9-859b-4e9aa5c5be19@windriver.com>
Date: Wed, 12 Jun 2024 08:46:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: fix wrong path of tmp.mount
To: openembedded-core@lists.openembedded.org
References: <17D438C0652386E1.15404@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D438C0652386E1.15404@lists.openembedded.org>
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS7PR11MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f17b48a-20e6-4339-7a32-08dc8a792d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1c2R0xjUXpteUloYUd6dEI4d3lnSzlHR0N6WDVhRG96Nk5LZUN5Z25NS0JV?=
 =?utf-8?B?NTFlcTZnclQvNlM3LzY0czdLYVBFQkxkTkVaU1FxNENyb04yV3ZGTFIwYXk0?=
 =?utf-8?B?WVZCVjd3cG9pM2RzYnhsejVpR1dFait1YUhreGVkKzdwQ0JxTE50QXRRVnJw?=
 =?utf-8?B?RzRraVpTOEwvMUZKREl5anVkUVZGU0Yzclo4NDZINHRHMWxIRXN5Nys0Zndk?=
 =?utf-8?B?UFVFcWlXK016RHo1V0wyN2FPSTEyeW12OFB2MTU3bWhDN3IxQ3k4cW5zUnhp?=
 =?utf-8?B?Mnp3MTZkNitRekhXQmUrWFZJZkRTNFdPeDFpRzVQSWFyNjVGVXN1YW9LUDhK?=
 =?utf-8?B?bW5wdkI3TEROckFpb1oxcnlSVE5iM2R1QS9hNE1pbmxCY05JdzJVRG05dEgy?=
 =?utf-8?B?cytaRzMvbHFHc0JWQkMwNXh1Y0IwZlppbGpqRUttdzZEclZ5dmNTd09mYUdH?=
 =?utf-8?B?Q3VEbno4cVdDR1YrSUNHMFV0OFBtbFdGbUIrNDNTVDZPV0NyNlN4TnNZWUsx?=
 =?utf-8?B?WHB3ZC9PekNiUG1TbUViZ0JyNWdBdmExdXNlRGVSOWRqUTNaN0NnTHlBaExY?=
 =?utf-8?B?N0dKSmwrcXppOUxwMTB5UU44eUV5U2diMVdUblBqYUxSY1A1aHdodlFaRnY2?=
 =?utf-8?B?MFpKQU5xVnNtNWVNNFhnMmprMWo2VW8wWEh5VTFFVkV1MlJ1VTJaNDFXcTNW?=
 =?utf-8?B?MWdFejJKUnp0RjlwaVdWbHhpdWV2K3laOHZmR0Q5VFFTdVU4VzhBcVFIenFr?=
 =?utf-8?B?OTZEbmZTbzg2d01RTE9XcnFmL1MrdTArRGlyV2h0enVSdVlkdW1nVUdUU3di?=
 =?utf-8?B?T1YycEtoaklma0U0YVBwZWQyaU8wUHRUODhnT1pJZ0U3ek5Edm5LdVVsUVd6?=
 =?utf-8?B?c0lpOTIxcThoWnU5QXp3ck1CMU9EZXZpemN2bWZTZzhxY1EwOUsrYkVJQ0VZ?=
 =?utf-8?B?Qy8yZVJwVEJVSkwyN0piR0FkZHh4ajhZZmRaRVVLWW0wK05ob1RPQUhxZWZQ?=
 =?utf-8?B?NjdkN1hoR01RcjBpNCtpK1Q1ZTVMNEJxbXR2cmVzQW1CdnNHdGZQY1V4ZU8y?=
 =?utf-8?B?c1JBOFNsNUFzZzFBUE5sUUp5bDZxM2hoT3pmTzdWS0JrWVhjMWxWajllYks2?=
 =?utf-8?B?UGsvUU5BTHduVm1ZYlBhQitZN1pvb1dGZkxHYnF5aUd0UVpaQmMwVkdSaDJB?=
 =?utf-8?B?QThXSjliYVBndG53dVNzaWlzMnQ5dUgvcXhLekRLZlRacVAxWFBxbGRzRktS?=
 =?utf-8?B?WEdyeHRTbE1yOHFheDZ4eGRzbFBPZHl4SGsxVUEvVFJEMVlYTTFPMUgxVFQv?=
 =?utf-8?B?SS81QzVIdjV0QmtaZC8wZXdlbWhQd3BNcmMwQWxDR2daY0ZKNUhGSC9UR2ZS?=
 =?utf-8?B?cUVBUUZacEhIL3JYNS9kenAxNkpRbUF5Z3h6ZURsM3pPbDlsamp3VitwOVJt?=
 =?utf-8?B?SkdoTTEyR29PK1ZFc2dXYkhFeXh0MGxnV3ZOdFJtOVlrakFtMkdqcFdudi85?=
 =?utf-8?B?NkV1d0t1MW5OMHNqdzZuRU9PYkxuSW9Nd2Q0QWpJOHFZTm5YcDYreGpGZVJh?=
 =?utf-8?B?K2RDVXdVOG9NY2UvQ2VaUSszZmdScnpYQ3BtMU1naldDMnBCUUI2eWRNUTVa?=
 =?utf-8?B?OURSbEc3UUl3NlhtZDRlY0VNcE1VU3V5ZUJDZG56SUZGRmQwS3l5NU1hS1dp?=
 =?utf-8?B?d0s4NE5aMUtQbUEvUWRDQ3k3ZmhEZElDcTNTcXBvMTMrMU8rQ2FhMXVnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azVVTWVYL1VJU2RGb3dCWmlXYWJHWXo1b25mdzFPQWhSQmJSak4vaURhRTBQ?=
 =?utf-8?B?MUI1RGJHWklTdnphZXo2Ylh6dWtDTFAxTnArdFFDRm9kZC9YL202ZENQaUlP?=
 =?utf-8?B?MHhqY1lEN2dkekc3bTRWQjd2TXlSSkJWOWZ0dndoRWc1Sld3UjdTQ1E0YUdQ?=
 =?utf-8?B?MzZYRjdFZCt4aml0L2RRREx2VUtqMFkrOGVCc1VOUlYxQU1Gc3VOWEhxQmVh?=
 =?utf-8?B?TWtQL2VDOWlISmVuLzJub1hMMHllYlJVMU5IdDF3MktBZjRhdU5PTEhPdmtW?=
 =?utf-8?B?S2NmOXpyUmZWelpWOTN2QnFUK1RUK1BBU0IvTC9uOXFnRVNYeWlmWmZkV3g3?=
 =?utf-8?B?a1R1bS9ZWC9EWUxaTXBnWXhoaXN0ZnNobVI2N1R6RjZkRVFDU20xUE9zdjZa?=
 =?utf-8?B?ZEs4U2R5OVB0ak45blFvSko5SlNuTmg0amloODZta3JoNlE4SG9iQ2VJNmNY?=
 =?utf-8?B?elorUzVaM0hRUXZDbkZaR2dnbVVUT2NydVo4Z2Z0d0o4UWdGQ1FpcW1CdHBN?=
 =?utf-8?B?Wm9NNmttZGVIMzBzbWZwTnozUEpCVkh4S3pZdHYxSGZ0eTczNm5nc1ZkdVhp?=
 =?utf-8?B?dXlYZG5ZaTVzSEtTM1NJZ1dNRkRNZzZSclJRZ1BmVnhLc3cycVllQ1V5MTVE?=
 =?utf-8?B?WlMvMlp2cnRiNkdTTWZhVkl1NU5nRkJNZG9tWUNjcVZud0NrazJubVNaazJo?=
 =?utf-8?B?dkhKS005THp5Z2JBMnhLRkxzL3NHbTJkMDZwS2xyNXhOanRsejVubEdRZHhh?=
 =?utf-8?B?Q1NSYzIrTGlIVnhsRWtHWTBrZ1J6dDcxSngxZHJmWTNYbzAvMFNVb3JJeEQ5?=
 =?utf-8?B?SHljUVpzeFJjR0tIV2NOWmpBOEJtSFlXRWt1R21ZWGVzVFJUYzAyN1VadVQw?=
 =?utf-8?B?cjg0K1ZGRVdzdXU0SmxQdUJMZk02cHg2a2tTcjRxd1p0RUZldzMrSUxOVW1a?=
 =?utf-8?B?NFg5U3c0THFJZGNpUUZ5R3RoK2J2Tit4bmgwN1FLMTFoT1huVU5qSGk5dGU2?=
 =?utf-8?B?ZklyTW5oTlZKajNiN3JxYW9uL1UzejJFYXNsYjZFZ2dOblNwNUExM0NLT0hH?=
 =?utf-8?B?TEpuaS82RTVqQ0Y0WFlPWnpjSGNhSVdSVWd2RzBzL2IyZy81RDVMell1S1RR?=
 =?utf-8?B?c0phdUJKVWxZOGRpeUtvemVocVZxSDdaMUV2UlkxekdVSGh5Z25RZjNtTEpS?=
 =?utf-8?B?OXVwQzR3YTZMeCtlcnIwSTZwM1JVRUgxd0taWm56NE5QTjF4NjcwYmVFdFE4?=
 =?utf-8?B?UXd3eEkrQTcwbWc3UlZBMFRVcXR2NzlrVjdGR0NBR3h0ejRtK2FvSWY2U0t6?=
 =?utf-8?B?TUg3U3N5K2pXWkdoUkRQRHdOWHdTYW5YSmU5MDA3ZVZpWWFiVk9MYkVZeDVi?=
 =?utf-8?B?NnVlVjV2TzI5L2NXT21tMGxSekdMK25tdjBHc2xtZklHVC9CREptVUZoaktY?=
 =?utf-8?B?QTQveHlFWEFhaGdLRzZUOHUzMGczMUZHOU5udmdYZ210TStJcDQ0cmxXZjFP?=
 =?utf-8?B?SmptVmZ4U2lmWnVRbzBCVm1aVmlWbEpZYVp1UXBRSC9Cb0Y4YXcvUllWMmg5?=
 =?utf-8?B?bWRjdWNGak1ra2RPSzFIclJkeENUWHF1ZlM1T0F3L1l2Nk80YkJNZHJDamFn?=
 =?utf-8?B?Z3lOdHlRUG9Gc1kxUjJrci92UkRpK0hSYXEwV0lqS21aOUhZdWM2TkJUVG1w?=
 =?utf-8?B?ZjdmUjZuSHNmV1pnSjVGUHZmdXRvUUhsSDUwRVZ1WmtISmJGZjJBR2p0bGNq?=
 =?utf-8?B?ZStBMmlGY2IyZVR3YkpQb2xaVmNwNlc1VldPeHYzc1V1cFVlV2pYSUN1VlpD?=
 =?utf-8?B?SDMzVjBlUzBjYWJvQUR2UThaNFpZbjVKMW9UNUtxaUZwOFBoV2RMVlpySEtI?=
 =?utf-8?B?bmxkUDY4d0VpWWZhdWZXaDZwdW5OQmFieVo3V3NBZUc1b2VmWXlPR052Snc0?=
 =?utf-8?B?c05sOXZLUXpDRmlmZWxhOWhoRC9WYVlubnZVdmE3RTYyTGxIOVBZTzF1SWRx?=
 =?utf-8?B?blRIK2tmVWRnVzFVMy9KU2ZzSUFSalBwMU5LY2ptRzNFZFZQcHh6WkdLbkg0?=
 =?utf-8?B?TXUxWnhTTnUwYXFVbWRsUno1VEkxYnZyUi9ZeFZ4a2lBMUEvaGUxZXVua2VU?=
 =?utf-8?B?Z2Njb080Z2MxKzgyYnowLzdOWjNQRmdKQ1NUOWFSWGxEUWNVRTlyTWF2TGFz?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f17b48a-20e6-4339-7a32-08dc8a792d64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 00:47:03.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yegn+i+UJOY0qblUELbZQOcP01czVS4QDgi3Ua4Jg3BB/H0uAp1OPi1NUE5e+gkVbgl8HCXNLHWgc4ZvZHYOPiPqUFMO7662sbArcupQbU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
X-Proofpoint-ORIG-GUID: PYlJCXgO4hgltfknvvECsUfkINaqvLii
X-Proofpoint-GUID: PYlJCXgO4hgltfknvvECsUfkINaqvLii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 00:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200552

--------------JU7krRm3XEvkHxEsCbKlYfLq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 5/30/24 17:02, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> According to meson.build, tmp.mount is installed under
> "prefixdir/'lib/systemd/system'", but for 64bit system, rootlibdir is
> /usr/lib64/systemd/system, this make tmp.mount not removed, and /tmp
> still mounted as tmpfs filesystem. Fixed by using rootlibexecdir, which
> is /usr/lib/systemd/system.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_255.6.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core/systemd/systemd_255.6.bb
> index 62842d43c8..15b631fc07 100644
> --- a/meta/recipes-core/systemd/systemd_255.6.bb
> +++ b/meta/recipes-core/systemd/systemd_255.6.bb
> @@ -320,8 +320,8 @@ do_install() {
>   	# if the user requests /tmp be on persistent storage (i.e. not volatile)
>   	# then don't use a tmpfs for /tmp
>   	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
> -		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
> -		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
> +		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
> +		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
>   	fi
>   
>   	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200014):https://lists.openembedded.org/g/openembedded-core/message/200014
> Mute This Topic:https://lists.openembedded.org/mt/106385193/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------JU7krRm3XEvkHxEsCbKlYfLq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 5/30/24 17:02, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D438C0652386E1.15404@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

According to meson.build, tmp.mount is installed under
&quot;prefixdir/'lib/systemd/system'&quot;, but for 64bit system, rootlibdir is
/usr/lib64/systemd/system, this make tmp.mount not removed, and /tmp
still mounted as tmpfs filesystem. Fixed by using rootlibexecdir, which
is /usr/lib/systemd/system.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core/systemd/systemd_255.6.bb
index 62842d43c8..15b631fc07 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -320,8 +320,8 @@ do_install() {
 	# if the user requests /tmp be on persistent storage (i.e. not volatile)
 	# then don't use a tmpfs for /tmp
 	if [ &quot;${VOLATILE_TMP_DIR}&quot; != &quot;yes&quot; ]; then
-		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
+		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
+		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
 	fi
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200014): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200014">https://lists.openembedded.org/g/openembedded-core/message/200014</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106385193/3616873">https://lists.openembedded.org/mt/106385193/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------JU7krRm3XEvkHxEsCbKlYfLq--

