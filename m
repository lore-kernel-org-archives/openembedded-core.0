Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.61711.1629322840513488543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 14:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p2uYuk7d;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38649dca2f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17IKqVAC006353
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 21:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=NVxVQp7FARcIEIidRzbS3Olb62OCz48FcOsMclOinPI=;
 b=p2uYuk7dz1aqa8915Q162N8x1/zzFTAyVyl/tBcmqNQl3MgFjW0n3RS3UpyvcBKfvtid
 bJyi0r7ABPocnbNxAvyad8JjY5x1owy9HBLxh2BLSI2ohnV27aGkmGPElcwrNgeQ+8ls
 DbPX4b1JOkAFOnu+hDWpBxHfPtFVRyOue+3MYzLObvkU/0IVNKcpmHA9HJlPFLGz1DmK
 +mhPf7MkMQMTGNdRMkaFZIvaN7t0tVVun5oVzA4iwRSIFBvkS95eOT7CwZnws3sEhXeT
 rc2LePzNpMbkt/1sFTuD5v/Qjez73eZ5W6aHhwumW1s/xKhhkyWu2BWAuRp4jrQyikkK IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3agn2mguv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 21:40:38 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17ILecWE002031
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 21:40:38 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 3agn2mguux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Aug 2021 21:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDoprVKjFaSvN7h+n/9WyM/VbMYIdb+74+2udRF0y3diaFmmy8RnAlw7N/wtkPZr6eqMFhqwgFRQ8TFDvx8g63/V9YbM+QjuL5jVgHikpGolL5S2rFphBuwOwT5MQf83LuSqZd+eeBKABdXfmGiDz8O7K9KK8cFJ7KY6YECaraNauhxwtDlXad7JS/O+mH5M5DxuYGRk+1CoRqGhbfBeqEACVi51cFfzdkAPDwRI1C0mFwhIU/xScJqjOOI+vPWFn16PfeZT91NuvMwjiKbneu5pWs5vTYQNeCz2C6kMQ20AIW3D4viGropXvEORFHxk+JZ3CUvn/ZSyayPlhV2E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVxVQp7FARcIEIidRzbS3Olb62OCz48FcOsMclOinPI=;
 b=nBP0LSWGqZquw0WMA+CG/K2bUSKs8h01R6PShnT1GGGoBBLiXV1J1R/FfVWUARL2UdrcmfiVh5A5EayZGhxqlWkqj0IqpeT/Jj2WlpkwGEcdJv0lexFRR2ACCS8fFIwLqCt8j1LrjWU1BfBzzE3Gc2ZAjRrkVOghLGXDRXLZrnEz8rJR2k/tcjVByvdd/GWIeANd4fz9A7o9tGQBCq7bE9gdpeu1ii4u14CleGR5ZFWO/RQfYTrvyalBhPpJM1feXbwxCCYU+O76Rs+B/OQZJMlyiOrWuDHy+tZe52mCwC1o6sW8LPf2rnTHtDYUiD8JcknWd3TOT4yU7R9iCy2bGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1580.namprd11.prod.outlook.com (2603:10b6:4:10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16; Wed, 18 Aug 2021 21:25:45 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 21:25:45 +0000
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Subject: update glibc to HEAD of release/2.34/master to include fix for CVE-2021-38604?
Message-ID: <536e91b5-6c16-aeb2-f534-edde8601ac84@windriver.com>
Date: Wed, 18 Aug 2021 17:25:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-ClientProxiedBy: BLAPR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:208:32a::14) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by BLAPR03CA0099.namprd03.prod.outlook.com (2603:10b6:208:32a::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 21:25:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9faee8a-c626-420f-08b8-08d9628ebd8a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1580:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1580921BCC80B50F79FE8DADF2FF9@DM5PR11MB1580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qk1WydfzpgCmdMG7jEkWaq+txdmAV/dx8kLbI1VAqYsVeS3+6G7Bsx8ediw1oj+xZEEHob4jnOX3Iu7XJGqplR5e5m4j09P4nI3ySITb7c78UIQYrcRrZuAfZHF+eHwAwITNUxz7eZ2ZG/DAGkV1bBAa1V+Vr5Y/6gCI8W45EgK0hMiJlW7hRpClQU7bI7LuELzdPqTAlGp7N97UpnznJDinjl8N3KqF2Sbefld2nZhJQYySF9d+9t+0mMK4ecQGidaFQX55SFrEFYtu7N/dTEzgEauPdhi42eR5B81ybtLxRy2HeCUsGEshup8XXo/dfAEm3Knk+yh+bBUFjizG5BzCzoW/2kuRSd4i9QU2cWCsim0UOaljkjhanBqatiRmuKoQhkvkbjN33VmKlJny5Qh2qeIJa2iz8u1cSQ8DaIOVo4Zwpy9OD9uNfo4hYtzzzh8b52DKBW+d/frraHWMuVyMwbiujIwJEBQuodaEan7jAZZtiYpg/xTHrsWhh7SKyH+G948+THS00bMwq4iryWMuccLP5abCKlfz6HgFIFXM2Jnqi74gn+r+DahSrdQI1YLItU81ZWvgUqxnq23i4/SBK4vPEZewAXGV4d3dY9BFJYKaqqBmsTNMEZCQwyteHe6Xmn9UzHDbWaTXxLLpkOayb/YfH/i1QuR8DWxzIXGPA6alLV/anMA7BAcqdHyVHiMuzjyH6fF8S4kXQC1Si7kzpYyRDg7/8qOFHUxeX8LA9o0Gkfn07TMHRewc683NDUnWRJqnOHCmJzAWpHX70A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(66556008)(26005)(15650500001)(31696002)(66476007)(66946007)(2616005)(186003)(86362001)(8676002)(36756003)(6486002)(38100700002)(2906002)(5660300002)(31686004)(956004)(6916009)(4744005)(52116002)(316002)(16576012)(4326008)(44832011)(38350700002)(83380400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDV0MExCdTdYdjkrUHc5cDRUZkJQaXNkVGFwZEpQL2cwKytPTkY0S3RLS1lK?=
 =?utf-8?B?NkE3NGJsSHJTTFNEdWZ3dDFSUjdsU0tKQnFlZlltcVoxcE9LVG9XSElyekY1?=
 =?utf-8?B?eHNGenNSYzhnd25jTnRxRUx6aXhsNFFvdE9qNmJMQVQ5WjZZNzcwMndyY1Y0?=
 =?utf-8?B?S1pOMWlkRG5TR0VTUDIyK1RxTmpMOHgxcGxQQWYzSm9OUi9sK3FheW1mUkpS?=
 =?utf-8?B?eUNTYkRXYldWWlFuT0JnNCsyV1V6MHRXS1NLSFM3K29uZGQzejJNVFhJRkJN?=
 =?utf-8?B?L1YrNjBhSG1OT0pnMWlNUzhVNzdxZ2M0NU1BZVlCam9EMVZJUkNDR1E0UTk2?=
 =?utf-8?B?K09ScXZlOFBtc3Y4QmVFelFKUzdLQUc4aGlleTdiVC80dWVkM1ZmU2hOYWpM?=
 =?utf-8?B?YUtSNllhM3QvNFUrZWdNY2NVaC9haTY2cytVKzlkUGlCVDlBS3JuTkhodzdJ?=
 =?utf-8?B?bG9YTmxYTUN2bE5Fd2hUdVQrVEV1aDQ0WFlWZlhvdUkwTjl2ZGE0Y2RuQUU0?=
 =?utf-8?B?RDlrYlRzK0FZd1pwQ0F5TU5Id1B6dTVLdHFSdW1vTnRVRG9IYmpoRmxDbEZw?=
 =?utf-8?B?TFNVVjNZY1ZDTXpUSFJMYURIUUtxOXpaQ04wTXRtNVl0TzhJditWMi84cllv?=
 =?utf-8?B?RnJDN0FzZ2hTMXF5bS9CUGdWK1l5Y2pSbVZWcWk2a0M4UldPUFBLaFVaNFli?=
 =?utf-8?B?ZnpLaGQzSi9mSXYrVHZnQTlFL2x6UldoOVhacWcwYks3WDNIMzZiOEJEeEpP?=
 =?utf-8?B?NHpzQm1wbTZDaWZCS1RLMS9ma05BdHBaeVcyeWVJcmw0OFFXdjc3MGtqb2F1?=
 =?utf-8?B?YmcwekcvNTFZK3Ivd2NmcVN6TUdLUUh2SnB0YVkvY3ZCOFRocEFsMkwwaDBY?=
 =?utf-8?B?QUoyYU5VL3hLdFhOODZnQjYweTFmR3BkSlo2WDdHYjNyOCtWaWYrVWkwdlNB?=
 =?utf-8?B?eEVaZkZwSU92UGFObUNLendpQittOFNkTWNyQ3hsVHh0amlkVmNsYkJHZjk2?=
 =?utf-8?B?T21rTnRUOExZeVdpc0diaWFRM2phcWpyWElTTkV0eTNoZmk2VXZBaUpqb2RI?=
 =?utf-8?B?bFlVUGM5MEV6MnhjLzVWQS9DSi81NjRzTWgwb1JsWWN1aEJFYUdyazkxd0tv?=
 =?utf-8?B?VFh2b2JGb08yU01FK1gvRnU5czhsOUV2ZHhaWUNlZUJwalZvSXJ3SlMxWUhC?=
 =?utf-8?B?MnZzNThLV1JGZkNFRXlDSDBsY2M3NjVOcDYvd2RIT2F3b2pWWjVNS2JHWklz?=
 =?utf-8?B?UzBIbGxzZXlmVGxyU0VEcXoweUc4cTZLeW8wOVV0eVUrRmdRZGhqUVRKTmhn?=
 =?utf-8?B?VHpKcWpmMVJFcW1VcGVVdTVBTGpjSG9hYWo5SlovMi9MWnMvNVg0WUsvZjJ5?=
 =?utf-8?B?eUZsdWlac1pxQVZFZ3h5MVdZMjZmS0YzUEJQVUtIQU1ENnRTeFZvY0oxL1FJ?=
 =?utf-8?B?MjBqdGhKN3JOY1M1dUh5dEpWL0hLOWlaVVc1WFQ4ckx5RDdja0tod0xDRnU3?=
 =?utf-8?B?OGhXOUlkMHhOWStxbWZZV0JhMGtrdDlFQmdXVm1WY0syL2xFZHpPSHQ2U0dY?=
 =?utf-8?B?ZUp6QU9KZ1FmNmhxbERwRGQwTE5CR2o2RUYxbjA4QVl3c1hHU0VRdXYxdmpq?=
 =?utf-8?B?ZjZFMnc5T3lobE52SVdzd3FyTm9NVGxtcUExMFdBZUNkWWU5alIwc0loUGNZ?=
 =?utf-8?B?dWRrN1p6TjROSS9pbko4RXZ2Y1VQc0RWOHFMWEhCemxwQnlEMGN3dHdxL1Rp?=
 =?utf-8?Q?VSizYjzf1HbZCynnKoQ/oLTvr0basQSqFoZd0Jf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9faee8a-c626-420f-08b8-08d9628ebd8a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 21:25:45.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWcTGJhyJec1IbvVrgPaQBQ0Ip8OlERPkZGqDlLitOpOPfm+lCaIn6N7hQWgGqaGkyJdhkHGgmodrop3PePFBff5dbN4Yw/YQW3GZVEH3yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1580
X-Proofpoint-GUID: 7Nx2xbp4Fr7_U_d_aUYIWokPCH3C-aO_
X-Proofpoint-ORIG-GUID: j67I-XlPqC74fvDZrLV3-nG9l-kSm-ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_07,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=919
 priorityscore=1501 spamscore=0 clxscore=1011 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180133
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

I was going to apply the commit

glibc is currently at ae37d06c7d127817ba43850f0f898b793d42aea7, 8 
commits behind origin/release/2.34/master as shown below.

Those commits also contain the fix for CVE-2021-38604. Should I go ahead 
and update:

./glibc-version.inc:SRCREV_glibc ?= 
"ae37d06c7d127817ba43850f0f898b793d42aea7"

or is there work in progress to do this?

glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug 28213)
7947430322 librt: fix NULL pointer dereference (bug 28213)
31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=64 
(bug 28182)
9995d0588f iconv_charmap: Close output file when done
7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
3a48da47a9 gconv_parseconfdir: Fix memory leak
0b03996304 ldconfig: avoid leak on empty paths in config file


Sakib Sajal

