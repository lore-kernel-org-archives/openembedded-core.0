Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.5359.1623396757162488090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 00:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NhdvPz1U;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=179608fda6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B7EMEP027000
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 07:32:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 393vxfr7fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 07:32:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B7WZNa026379
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 07:32:35 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 393vxfr7ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jun 2021 07:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neTuFOa1GXm7YflHKIYOuyxG3Q90bHb0tirxuRbMH1lLXhDmIjlDHbhRwcmPS3eQ76BGSQxwMcseAdGjTixCc77wCxGqLE9+ULlIziFQYR3HTSBgPaZ4XRs+yZUVJ2fR+upgaS6ujgErGHwjPVPNTQMkRz4Cj6scIPlW8XR5VdhBvy6So/+mVwb8C1B8/D3H8VcsYtoqVl00YEHbD2/29W6RywBxJHegezMLG1C96v5jrcEXBMb02uBpZcFkfxphd99lsQCq6a+MmD3rtk+/iUsexX08OTKIzmov+7cmYnVFYsGYxRY3xoBHnS1va+ewnWIroBnZWptwO0/b3KP7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae4q8QLGSKWfVmABN4BrElpF8IL5wkKc+VdDblosz3E=;
 b=QP3/6WzwTXk0v8dCqf62FSWrc7c1do9/U/UShL5B97vVTmUAFr++rgBbwGQf3WTivEFgbSulmfrE2myxDvrinX8sPr3RY+qEU7f24Lf0HtkIkV5kFWMtvFt7PJAZhUBkHoZvjPbbgt1COAO9mkVCxPEeufRs2LnaCaN4yLVfRVQnGGlH+Kez6PRUeu+z1dUlzSDsT2S7n+Cns293m3EpJCD0ukQflY7y33NkTO9ztpvw2K3ujMJjE4tYoIML+og+Y3kXkDC41oJUOaEVJjwW7yPn5eOz2fL/MHLdpGJuWAUxnmE0C4rA9abIa9ph74R3PjTJRo+jXPzsmilwf40+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae4q8QLGSKWfVmABN4BrElpF8IL5wkKc+VdDblosz3E=;
 b=NhdvPz1UF29t0vshLKJrsUGMRo2RdkPvVSbZwspDvYH359wzFfIvkw7yKnUiipi8qGUhYMQ1y7Cl0RClR6zcEAHNfoIiGJI1axKLxTvpWnePyIiPYP8Q3U0uFUgDuIF5nSBMRZfqK7lgdXMoZ1e+Ak4MyRFtiF7eMVxoQgJlbVs=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2111.namprd11.prod.outlook.com (2603:10b6:301:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 07:32:32 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:32:32 +0000
Subject: Re: [oe-core][PATCH 4/4] alsa-state: run alsactl store in pkg_postinst
To: hongxu <hongxu.jia@windriver.com>,
        openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
 <20200925070535.59518-5-hongxu.jia@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <632c8074-7490-80e1-4672-8ebec6450aa6@windriver.com>
Date: Fri, 11 Jun 2021 15:39:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925070535.59518-5-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0003.apcprd03.prod.outlook.com
 (2603:1096:202::13) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR0302CA0003.apcprd03.prod.outlook.com (2603:1096:202::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 07:32:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44ccca2a-d114-4910-9718-08d92cab135a
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2111BB58BD48B9C43E8B8492F1349@MWHPR1101MB2111.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WvnbYXD7T9yoRb2iDuCkt7zYeaXgn3uLEIu5aDHJnsVoTxpK6jdLvDJj8v3knxc26NbGWJXJ0p6vlh145spPYXSFsXNh7pEwgRWg2kExllUfyhlAa+OZ/WkxLXun3xMgkzzPKIW+YbHB/i+26vfwBcw5Xx4EdvBDKK4rrU49ErjcSORzbDRqcFH7WogqkDqBDwLdIqipXrP69kRF1fbXR5DY3qo1VTL3elEB+p4v6vfFOwmqX+TUNFjLQ/uuswg1SD58QIgabQclFXm0494vKUUvFlJcRraeM5l9otTwvFrBjGNLPMJRvNScsslBix4FxMahObEmfaBT6JZi84mg3eBGjwJ4vWM2QbqksoYgS2/GS87p74bmcKnObWleXMHtV/mDfkP3DICaApWni0ACU3e3HoJleFzu64Ng9LffHlgFVC0UXbOINX37SHz0LHmm1TDfzlRkAKXD1IqVnE3J77vXIoatvT2JqmwKK1D2BJKdtdbgt5zPXRuo9ScvLh6kfpvcouhIY5nmMUg1vN/nlT4Vh/tlezF3Nw8yMR4Nj1d0zXg7CvYUxtCJvssSaYgWUfAzHXTPiF8JAzev+IwJy9BYDOwiUjHE3KlXKnN2xpFuh7O0VfMPP2c4cx7Jqfa+kotwaH8A02krjIuN5G1xkw8GI3/6vWbW1qGmFXXw3uMxHjPUtc+7a1b9NQ7siO5gf/rdpG4v03KeG67Z/0zu6gLFO+TCm4fAHxxicHoVPdW56C6UfoX4PWgJZfs41N5jqH02ogi6RhidZzGyXZbr9sLZ1jcqDJeCh0zI6DHSWXQPMMuftAkbEunjOVRtUV0c+QwvbR2Q2DG8Z6hwdGokvGX8EUkx1O+NHzs4QLeoChEiKy4JwM/lwFim3butv50e2P6MgGxKTyDMkSe5sbVjVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(53546011)(36756003)(31686004)(478600001)(52116002)(6666004)(2906002)(8936002)(6706004)(16576012)(5660300002)(966005)(83380400001)(316002)(26005)(31696002)(186003)(38350700002)(8676002)(38100700002)(6486002)(66946007)(2616005)(66556008)(86362001)(66476007)(16526019)(956004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXFVWDg5Q0MxU2hBZi9SMTNTVkEwem90OFVxbE0zeFBpV1M1U04ybFVHcitR?=
 =?utf-8?B?aDlFNlBISjlZeUJqeDhja25TUWNHT1FQN1JxRDRoajFKV3lQakg2NTU0cmxn?=
 =?utf-8?B?YkVBbkNlMjQzQjFWZmgzZVgvenovMFRocU5yV1ZqT1pYRW44T004Q1F6U01Y?=
 =?utf-8?B?U1BIWTBpc2ZIU1ZISlJtRkhlUTRDQ3paT3JtRW1zTW1WU3Vyc2lGci84OUNJ?=
 =?utf-8?B?OXdpZ1ZxTTltYXRHb3pPa0pwa2VodTZucDNFYTZsU2lLSFBlRGhFb2VsOW04?=
 =?utf-8?B?ZjRsa0JTWHIyWmVuWEphb3YrV0duWFRWT0YrTEJvaXk5ODhudFdEdzBudThZ?=
 =?utf-8?B?aDVpT2loK21DQWROSGcrZkNWTUZ2cHZjR1B6WnFzbTIwbStkR2hNR2hydUVO?=
 =?utf-8?B?cjc0a2ZieEpyOHJ5Qms1NmRUbUZmcGJLVHpFc2EwdU9zcy9TZ2Z0eXV3M3J2?=
 =?utf-8?B?UFJpbG9mK2tRcVVUTHYyMmkwMkg4c1lLbVJxM2YwVHJsa2E2b2tkamJwUlBG?=
 =?utf-8?B?VW04VE9VTzdSSHQrNjl5RUFvK3dLRFhWMkxVV1NiaXZtTEZtZlN1YnlRL05M?=
 =?utf-8?B?QWo1ejY5cURqNktZZitsZnNPSHgvb3FITHpwczBUay82NFpOMjRtaXJ5S2pD?=
 =?utf-8?B?UXZCZU5VM0hveW1MZkZGRHdUN2xDYkhFYmUzdHR6d2s1anN1cWxFMDc5NUtt?=
 =?utf-8?B?MmZKZGpHcUpaMkRncERHTDY3cnFINUExTnE5K0d5b3lMN3FldzdtaDEyU0xT?=
 =?utf-8?B?aW1tK0toM2xscVFONFBtOWRkbG1ZK1dFc0Q4TXVTekN4SnZSWGRWV1lCVi9Z?=
 =?utf-8?B?eUZ0d2VIdUk3cTc3TElMVUcrbko3YWR6TDBnVTEwL09QMVozQVg3NGhkenlJ?=
 =?utf-8?B?K3lFRHBRdE5zZGtWTWp2SFdFYkRONE5yd0NpN2Z1QnBpbVVRM1Y0M093SjIy?=
 =?utf-8?B?RG5ydk5vNDN0N1ZtcjROa0VQYm1VTkRsYjFHOVB6ckF0VUJpVW5qVll5eVNp?=
 =?utf-8?B?L1B1eDc3VHBBTjhtcWtBNytGK3hnSGdnZ01wRm5Od1ZvQk16VWtJY3ozNThH?=
 =?utf-8?B?QmQ2clZBOVNTSStYWTJnZmYweEg1bG93STlxbHZKaDVWRk9UQmdqcHZRVEs0?=
 =?utf-8?B?YytZUGdZZndXaDFDdysrMTRNZ3NHTnJiSWtNZE9PdnhJNS9CcExvandBNjJl?=
 =?utf-8?B?aUlJNm1YVjViVEZvNnR3Z2ZkZnlkaUV5TFhxVE55UDQ5QXRPVkY1MUNwaXFh?=
 =?utf-8?B?QWhFLzBFOUlMMDNUbUVuKzRjNlhQb3F0NnMrcm8xZkxuZW1DUlloU25udjNH?=
 =?utf-8?B?d2QrSG9XejZNNGdWb2IrOXpqTk9tQ05nc3JhYW9BNU1DdDRHWUVlSm93L1Y3?=
 =?utf-8?B?bGJ6d1l5ZEpIblMvRXl2ZXBHbWdKWm5vVm5MNXpLcVlEZFRzMi9xSU8xUTNH?=
 =?utf-8?B?NHE5YlNHVlh6MkZxaFRiSGQ5ckVsbmJ5WFBZcURqdENuYWxTelJ5QnY2UHhm?=
 =?utf-8?B?UFd2YnArS3hwRGRpZ1V2L0ZrNmc1RkhpTTdXMUp6dFMybWlGb1ZBSWNGWmpx?=
 =?utf-8?B?d2xVOWpNK2tlSVRVQmR3MHpnM0o0cXRKYzlnVExEQVdMUitEM0FhVitZTHM1?=
 =?utf-8?B?Y3BYMzJJTGdlalVyNDJkcmM5TVljR0x5UXQ1UUZiK0xIVm01bHhWS2xZcCtN?=
 =?utf-8?B?NDFvQVMzK2Y3UnB2WVhXLzBhVzU5UVErMkJabVJsQTZvckVkcXBUU0M4Um82?=
 =?utf-8?Q?Gefjg3bcWWdB+leZMerL4RKq0poctbdMJqm/RDl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ccca2a-d114-4910-9718-08d92cab135a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:32:32.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPTOTQDuOdJXidKU3HNxth1HbdiDYcuBnk07bQ3N+dOpouPR7G1p9u78+95w2rw6oUQfAJe4c1sW5eSQKSAyDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2111
X-Proofpoint-GUID: 0m2lJkYqDxtIogR3lyQgAbDtfdx_kr_6
X-Proofpoint-ORIG-GUID: l0h7kjMCHiSPU-vN31ONhqslWntXYxLb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-11_01:2021-06-11,2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 9/25/20 3:05 PM, hongxu wrote:
> Since the pkg_postinst is prior than alsa-state-init, it needs
> to run store first. On raspberry pi 4 boards, it failed to
> online install alsa-state
> 
> [raspberry pi 4]
> root@bcm-2xxx-rpi4:~# # dnf install alsa-state
> No state is present for card Headphones
> alsa-lib ../../../alsa-lib-1.2.3.2/src/ucm/main.c:983:(snd_use_case_mgr_open)
> error: failed to import hw:0 use case configuration -2
> Found hardware: "bcm2835_headpho" "Broadcom Mixer" "" "" ""
> Hardware is initialized using a generic method
> No state is present for card Headphones
> %post(alsa-state-0.2.0-r5.0.cortexa72): waitpid(823) rc 823 status 6300
> warning: %post(alsa-state-0.2.0-r5.0.cortexa72) scriptlet failed, exit status 99
> 
> Error in POSTIN scriptlet in rpm package alsa-state
> [raspberry pi 4]
> 
> No regression on qemuxxx bsp
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-bsp/alsa-state/alsa-state.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
> index cec2272c80..98a9381b4c 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
> @@ -62,7 +62,7 @@ pkg_postinst_${PN}() {
>   	then
>   		if test -x ${sbindir}/alsactl
>   		then
> -			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
> +			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state store
>   		fi
>   	fi
>   }
> 
> 
> 
> 
> 
