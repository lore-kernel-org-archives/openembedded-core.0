Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6588.1630420533656084343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 07:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mu9Q2lBS;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4877c2efeb=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17VCk40U010693
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 07:35:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4wmWuwNltBGA28WDKISg3GJYbqFTYQNJCp/WxiVKmPw=;
 b=mu9Q2lBSynP0J7KqGbh/i5gqe+2vAajpI0cFw4b7r0T34mskysSJyZ9dvcoZ3Bg7loJt
 5KvA89msh5pYo7TKAcWYZztoDlJdvtObG2JuiWslNkp1PoGMdemf1HAXf2cbRvKWEJ73
 SdkULIEcNYyL0xP3647q3I1vuOCAxsKloPAMDliNEAyn5/tCPmPG+douB4ITSuA5MmJ7
 4oQXY52vf3bbUbZ0xjxOp+MbyDFeVioiWzkGOgOs5l4xfDSWXFBXjLI8ajcYKFj+wEXx
 VdNFKiPTmT2TDvO4E7XLwl3+4I1ka/bkut1PhWzvicCzS9RKV3JdlSN/JfK+uZX9qWzE 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3asbdjrcxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 07:35:33 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17VEZWPM007658
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 07:35:32 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3asbdjrcxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Aug 2021 07:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWvPD0YONmxUmIcpUI4vYnDSeojXhZmfCf6aU56D2rYAu/QyNz5dDKA2Z3N3C/1uSIuU+7BRHPBkcLnymle2zMXTXZcwPkcyKef4rkyqV9CRdHm14ryaC9Oo/vu575lV9gn8ZutytdBc01hvHERgtqneJRN362UPJTGXtYWyFRYqidCDy87+uHr2Z+NAaUc2UwYIY27DRVEoeVEI9+NL+JUCxtWetkIVPtoizwM5cQfD4+cXoIX4+TawQwnxjqbtfYZPFCN8gLK62nXcuWNPYE5ChuP654N+n3nRvgBn/o1JK6gFUs6cwKeHgR2BNn38NLbBqzwxGW88IVbrbujGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wmWuwNltBGA28WDKISg3GJYbqFTYQNJCp/WxiVKmPw=;
 b=X1iSipuejCIzw+f186vWWpo/igJEnaRQaV5NzJn53dnzUhOqURmm6JAoahoBou6qzDahGLb1niyOkko46PdZp4us6Qi47jJ6UNEVRydNUqNrFWo+RBL4eZb/JxI5iPQRuo35Ym/Fy7FbTItKOQBXDYNS+YqPKU2eBxZmsi9mgR0p+o9EGPFpDORSJjyOeGfBoz00O6YSff2opS/4sJM7GOQR8nR6pgLDEP4V+wPc8KhK31tHc2D0bKylnCeU03d3D2OIqFDnmPYDywUwf/JMuDjif9H2qG1rNp9ColmJVMqtmw4hg8BLGnXLWiw6wOQbIXJOK8lpZ/60MpQBdb+JYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1999.namprd11.prod.outlook.com (2603:10b6:300:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Tue, 31 Aug
 2021 14:35:30 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fde2:338b:6ec:71ea%7]) with mapi id 15.20.4478.019; Tue, 31 Aug 2021
 14:35:29 +0000
Subject: Re: [OE-core] [PATCH 2/2] quilt: Only package guard for the target
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210827215743.2027466-1-saul.wold@windriver.com>
 <20210827215743.2027466-2-saul.wold@windriver.com>
 <ec56dc17f8303ccc907d859014d88c1b808c7e47.camel@linuxfoundation.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <3401b75b-e098-40bd-7c07-b4a928a83c0d@windriver.com>
Date: Tue, 31 Aug 2021 07:35:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ec56dc17f8303ccc907d859014d88c1b808c7e47.camel@linuxfoundation.org>
X-ClientProxiedBy: CO2PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:102:1::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from [10.23.90.211] (71.238.119.71) by CO2PR04CA0063.namprd04.prod.outlook.com (2603:10b6:102:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 14:35:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bde8dcc-2ae8-4d51-d953-08d96c8c9499
X-MS-TrafficTypeDiagnostic: MWHPR11MB1999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19995B35FFFFA135EE0FBCFAEECC9@MWHPR11MB1999.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dVIAB441YBDAljhZntIWHhGhz8WMNNUVf8z2Ufp7LfeAdTHBVWaCDCRmBPGzGlN2rzaut5YXz3Ot/mXI+dIxhZOorM4Rz8L1Q5Ks9+/SDJSZRF2tWkmuKl/KYowOJLqqlMoCsTkUeQ0h8k5RHdGRHH7jrBSlUfgJqESdaPbheHbFTa7n3Jq8+QNLYxpcFy5wdalG/7jOiTH10nFUzJm33MieClghXt2a3Unhd0efxE6XtZDIN2LMWgp9XfabhGtHcmdSPu/siwNLWhsi05bHm40unH16ifi6ffL+GsDvVqRSobHPIOx+RCs/+n+driaIdgpB047h2QaOiuL+AVtH9gIgd2EjSg9WlfgY66lLDZA/bgJt1w43t8NJ11uvK+irOqzZpJZrb0eTUhoO3MlMONe+b3N9WG6j+D8Q9rIv7Z1uusU85sKzaJiSAUtjk3obmBaeTAda6hmWNVdyKnOePVaUyB2KVpMSR44R7X8e2TXTV0J6ecMzNUg2Q5nXjsOL1t7lNdmo0RNB4yjBDyqPr9OHgRTHYULAvmApbYwtDRsLzBIGo/VcE5aMaAygGm0RJ+a/pZkjvWj78Ao0nMJFMGw1k9Aur0lVO9AnHkwFV1eJ39MeN0J+c0mZdieH4rwrXJopT+s8kEda1nKiNmuwsetVE7M0vJqlgqxiCWVfZY7HpxTEnAGczKhMMcYky0+IMY0l9aQoo6ezlBqU+LrghRGviKqkJoBok84btl9ovSAHtQ8V7Ov6Nq05QstlrhEmB1tz4kQIiGZqkC9slch/gw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(8676002)(31696002)(186003)(5660300002)(2906002)(26005)(8936002)(4326008)(53546011)(38350700002)(36756003)(83380400001)(316002)(6666004)(6486002)(478600001)(31686004)(16576012)(66946007)(86362001)(66556008)(956004)(38100700002)(2616005)(66476007)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VCtVbFI2cnNOQzE3ZnlKdjhCTlkxamgrNnErNUVLL1NVVFRRQnpoZ2VFbmRX?=
 =?utf-8?B?NnNScmdZU0hnRnJrOWIxeW42VWhjNHFyd0thNk1qemdabVU3OW16YmRJdlF6?=
 =?utf-8?B?MVR2dnRiUStjRTZQOXBNaC8xTG9ucEpDLzZBMm96K3J2Y1ZremovRE1aeXhS?=
 =?utf-8?B?OXZIWllRMG1XMnl5TjBqWjdURHRpR0VWTHY3bTZrVG52OGhXYWZRTFZqNlFC?=
 =?utf-8?B?bTB4aGpnbVBOcHVLbWRhSnVmTFJPQlJyR3NEYXNjckU0ZTBhRFFFOUI3Qkh5?=
 =?utf-8?B?SDh0TGx6Q1lHM0N0Nk9CS2YrLzlCVC82Ri9ZUkxSa1dBZGJJNmhPYjZGbzVu?=
 =?utf-8?B?UmNqWGxxQlRubHEwa1FyamVoQTVId2k5ZTFHZ05TMEQyWjNybS84d0NyWkdr?=
 =?utf-8?B?amZ0WURZRGlYQ2x1Wk1CaXNJZlhqTDdFU0dCaUNJZUY5YUcyMCs2TWxwWTFw?=
 =?utf-8?B?bXYrNWZRcGg1VFZuVERtbWpVaDltZVNpd3BKaHA4Z0l4alV6NGJsV1dXanZ1?=
 =?utf-8?B?QTdtNUg5Z0Z1aGtKcXpRcU40ZCsvbXhlemNWZmxSalFuOGtCNEVJRGRub3pN?=
 =?utf-8?B?WVlXa2g5eExzcElqVXV3UUZleW9kWEhqQjZVNmtSMWZLNXRVa3QvaTN6eE50?=
 =?utf-8?B?Q0pGRHBVdG91SVFkNndXUE0raGVuZXduS0FXMzdrMW5kWkhsQ2VCMEYyV2Nh?=
 =?utf-8?B?SmVQdC82Mmtwcnc0QlNmYWNPT05PMVRvVk1JbCs5VXZKNUN6Rk40WGc3cDlV?=
 =?utf-8?B?aGpPZTNNTmFCbDlnMFZHOC9mSkpPMWsxUXBGOVh3U1U2MUVlZFJmUjVHM05S?=
 =?utf-8?B?UVMyeWVqT0dXbHljbE8zSmNFNzBtKzlJMDZYSWpDcUhYZ29UWFV6WVB1S0tj?=
 =?utf-8?B?dnhQbFhLdWc3dWNFUEZDcjBJK1VjdlJBOXZpSllvTHdScDJsNmM0dTYxOEJa?=
 =?utf-8?B?NjFzSHI3YmNycERzVFNvSTlXWVBZa0VEQU5LZm9qbFErVjh1VTV5VDVkb0xv?=
 =?utf-8?B?aVdLM21ZK1NjWWdXTW1aNTF6QlltZi9HWldqS1Z2VDdWaWRCQkJiMm9CZ1Fn?=
 =?utf-8?B?RVFGbC84WVZNd3pMTDFEZ2dSK3BDaGFrek52TzNndWRVeTJHQkMrM2dZVFZ2?=
 =?utf-8?B?aVZvWEoxSXdZLzJPeUo5UkwzZkMzQ2pEaEc0VVZlV21SdEc1UEZsZWd0enB0?=
 =?utf-8?B?YnBjSWtjeGs2NzVNamRHREhWK1UvamxRNW9rRVUzYzdPZGJJVSt5SENYSDBO?=
 =?utf-8?B?K21nZDJZa2xaOEU0RmpVMHlRT0tIek8vQ3laQlBKcWQvNEUraFRHcWptTGsx?=
 =?utf-8?B?TFhtVkhDVlhqUkVyTXVON2JtSXk2WHVIQ0F6ckhKODh6ZlhISXhudGxJSU5t?=
 =?utf-8?B?UllwdGY2eHp3aVlaTVVGZ0lYWlJpWlpWdHNzczY4VXBUWFlGL3lNVFpSb3N3?=
 =?utf-8?B?N3hCUUxjd1FMSXUvQUV5ZWYxbC9Oc0tML3ExUC92WFlOc0dqNHR6Sk0xQ1FL?=
 =?utf-8?B?cUlpTzMrSEJRWm5WaC9zYTlkbXFtWlB4WUxxWVVVSFR4ZmxpQlVxdWpTWDFn?=
 =?utf-8?B?Zk9XV2ZJdm9tN2FTNG5sSmFIL2RJdnRYMTZmT21ZTkd1M1hJemJ4S3JiL0Y4?=
 =?utf-8?B?ZDhGbWExbmpWaUM5ZURkcnhnSFFsUjI5bWZQU1pzUXNGdHhqUnpVVEdUc0xo?=
 =?utf-8?B?eEp4QTh2NU5aQ3FrSW9jdGZKNDRRZEdQYkVULy9lL1c2WFM4cXhaOUowUjJr?=
 =?utf-8?Q?LWmd5ZQfuqO4hoNx+nQO5VQ/gJ9FyDw9xCB+Trm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde8dcc-2ae8-4d51-d953-08d96c8c9499
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 14:35:29.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53iONIuVSTCE7pPntmfpFucanbXTasfLhJ5yUYZv54OG46e/dayMysqW5Nt2fpVuXCh0hvyUHnKD27wyvtWqFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1999
X-Proofpoint-ORIG-GUID: Gg8kJvqx0EJDSWMLz5QGETa6l18B03YF
X-Proofpoint-GUID: 3MJLUElsDK60ULyUtJ0vIHU8znHbiGsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_07,2021-08-31_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108310079
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/30/21 1:19 PM, Richard Purdie wrote:
> On Fri, 2021-08-27 at 14:57 -0700, Saul Wold wrote:
>> The guard binary and documentaiton should only be be packaged for the
>> target class.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/recipes-devtools/quilt/quilt.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
>> index f85de384d2..41d30e89aa 100644
>> --- a/meta/recipes-devtools/quilt/quilt.inc
>> +++ b/meta/recipes-devtools/quilt/quilt.inc
>> @@ -73,7 +73,7 @@ do_install_ptest() {
>>   	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
>>   }
>>   
>> -PACKAGES += "guards guards-doc"
>> +PACKAGES:append:class-target += "guards guards-doc"
>>   
>>   FILES:${PN} = "${sysconfdir} ${datadir}/quilt \
>>                  ${bindir}/quilt ${libdir}/quilt"
> 
> Again, why?
> 
I was doing some testing with the create_spdx code and found a condition 
when I had built quilt (in this case) and then cleaned the quilt-native, 
when I rebuilt quilt-native I got the following error:

ERROR: quilt-native-0.66-r0 do_create_spdx: Recipe quilt-native is 
trying to create package guards which was already written by recipe 
quilt. This will cause corruption, please resolve this and only provide 
the package from one recipe or the other or only build one of the recipes.

> This should be fine/ignored for native/cross and applicable to nativesdk?
> 
Maybe the issue is actually in the create_spdx()  code,

Sau!

> Cheers,
> 
> Richard
> 

-- 
Sau!
