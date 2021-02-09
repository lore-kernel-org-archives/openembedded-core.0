Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web09.13333.1612889624840987485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=H+3HaW3v;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=76746431c9=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 119GXGpn011716;
	Tue, 9 Feb 2021 10:53:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=to : cc : references :
 from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=bZjDa+27Dkmgy5aTy/h9+L6AjeOp7hhSmUiCmlo3yMM=;
 b=H+3HaW3vgq3Bg/KFfgJPmfqQO6O8Tn7fIVZ63zIkjXlu9QWgF6ctNr/L66nW4eNkbUvD
 rGad49shshsRZu9n3ZNZe4v9Zi3cOpcsAolLPWZOdu7ai6ZdLBZ53j0pdXg3qB2uPEBV
 Oj6CbsyZeWrAkq6MnLevClx81E8CR/oMZBBuqb1BeTwOhIWozisJN1hHQSAJUuaD87GO
 L6CrQIf2P6g8ZaawXyMw7IBFXbLxqgBoNM0aZjTInPYyFEU3sDeGKiaPnxf/KqwBjc/V
 3qJwmyNVr5NhY6EiGJPi/ZwgnGNFAaPdpeT/FU4l2z0XMxjqSF/KX0wQ+ggbXbOD4+a9 rQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-00010702.pphosted.com with ESMTP id 36hsgw5w2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Feb 2021 10:53:43 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ2O1bM/He0nidm4CAhrPs/yLvdhRWb6u5OLrYKVNWgc0piWytfxMcw9UEfPyE+79i48qkswOu0/ax2Tep2qGZTMxi5VsEcnUqG3KC4qqF6Q58wwLg1CfU2TYizk+FkFZUifAFR1mQ7LV/ZXl+DVGNI8pbkTe+s7FkkcIvFTIdMlMvjPZxK26h6UhTh55FOZ+UtnxwR88Uf2YnuelgTuU9fjS5G0Jtz2aYQ1Pdfkikq1GaD4BnKH8durh2RbQqfg8G0Qv8FfZSP/0SBE3E8XX/67Dsewr7e6vFiXA7TsY9hGE0Aq55kAOI55pR4lBnpYwZuiix/c+LInxtdjMJREvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZjDa+27Dkmgy5aTy/h9+L6AjeOp7hhSmUiCmlo3yMM=;
 b=mkR68C/7bSW+fDznVK3fUw9+UI5Af8+KvSxUpRBJYE0YK76hK1E+EzKzQgwAoHrFvRrbTmStjAvUq2ofLK/23QECKJdR5HEuKAsS8xZ9MBwBF86WGLufMYmKL1X14F5SHSZFWQNH1iuSDpmaQ61r3iGAeHfq186GAwONNChqtxY8vOURuv7OWz/kIFx40HLPBOEAy6B6oA63IKWFoAbdsT4igqHxaadUqKjMkYT2QEula7z+G5fh+e6P8HB0lZAeNfR9YKbryinfXrpX61M2LaKzUukGaSR2PQblZN8MkzBeq5qjR88IA7Exb00IJYockGq32fpj3yx6jbtVsOXYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZjDa+27Dkmgy5aTy/h9+L6AjeOp7hhSmUiCmlo3yMM=;
 b=qBFnVZtCKheVZnPBqRA9Q6PcJ5rr/0oj91KF+xy0gXiCpVGgCcQt5cWV2TYw5JllCOTKLAiohjnb+20HOaF4RzH6xg5VQjYw1Yk77U/GghWIIh63P88lAAw78g9LcASthiVHnLE+lIBp8ok2sCnUr7bDcmgdhlQ7MFDSjkM/RdA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM5PR0401MB3576.namprd04.prod.outlook.com (2603:10b6:4:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 9 Feb
 2021 16:53:41 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b8:7cc:802e:d31]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b8:7cc:802e:d31%4]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 16:53:41 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210209143439.1807422-1-richard.purdie@linuxfoundation.org>
 <CAGgRHJpP0B8RUnDwT5vyTApstFggmQPfXWd5xuF8iKUsX4i-Sw@mail.gmail.com>
 <12e761e8a4cc8f4e5f319bbee76748b6916aef1b.camel@linuxfoundation.org>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <3371a98f-b9f9-fe6d-944d-6fd52aba8bf0@ni.com>
Date: Tue, 9 Feb 2021 10:53:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <12e761e8a4cc8f4e5f319bbee76748b6916aef1b.camel@linuxfoundation.org>
X-Originating-IP: [65.36.69.14]
X-ClientProxiedBy: SN7PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:806:127::13) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SN7PR04CA0218.namprd04.prod.outlook.com (2603:10b6:806:127::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend Transport; Tue, 9 Feb 2021 16:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 530b0ad3-428c-4587-66e5-08d8cd1b4118
X-MS-TrafficTypeDiagnostic: DM5PR0401MB3576:
X-Microsoft-Antispam-PRVS: 
	<DM5PR0401MB35768BB1324CCA3E0167508BFE8E9@DM5PR0401MB3576.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SyZF1QjZevfPqhmgENo8NH01YmOqC4jzN2Wceq2f9aTslVasD41BMgy5Prj/5qz8HxSoip8mfIRRk8eXja0PhP9fB9b9AALZ6Q7h4G7NLhFuGwCOUH5+EDihUJmlkKwl4pXapW9B1G6bPQjwjeNsod9+jF1q9HWldZvLBi4SKkV39auHxgYOeUcm5qgw4VABMJVEhb46SEz1YcXUQszj8/0YB6UPJ9HqDgtPxiaIFO9Ojc0cdZ6RSv/FJwXWtbJQCUphcenh0+JV+I+SWyW8h2BxG44vFxbuywCk96/54+ktoXyIVOY88rjdD1Gpl/cm3gMoIKBA7WaPhJgfz6XScRnWObm2HPfsGUTAW/Bq7Zz/AxuAM4lA2YmR3y+Jj+GajehEV8xkNgSeoc/ct7zVuiXdJdCDuKAR9V3lOjN/BBOu82UIVGpmmT+bJDJU7pJvYYVE+I3sZLHLV8Ppd1oB7MBHzYL/1NOGJ/5gAf7pVPl3Jv9bCaVrt5ubDF2IhewvqFSjFWtjIOu9bCr5YQ/zeRbFyn9+Vi/vMwZJX8dNGv07vnWCiH9wryXpbZEvAU6NQEgHMIrHBVQXbmoU92yb5EEHV7HsNfYIXlMilrVqA5o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(26005)(53546011)(316002)(36756003)(186003)(2616005)(44832011)(16526019)(16576012)(956004)(31696002)(4744005)(6916009)(86362001)(31686004)(5660300002)(66556008)(66476007)(8936002)(2906002)(52116002)(36916002)(8676002)(478600001)(4326008)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHVWRnhDVDdPWGV3MW81RmNOZFNHbDZsNTZtdTZWR3JCSmZPdTRtZk9NOUdH?=
 =?utf-8?B?YjR0TDdDT3pnODBUcnoydGM1akNtT1dRblVoOFFKQ3AxNGdwMUkwcHRtQ3Iz?=
 =?utf-8?B?Y1JhZ2xKcGJZcjF1REpDNDc3VGt6TXFKUTdjK3VlaWhNWWE2KzkvWnFnbGhy?=
 =?utf-8?B?cGhZRVlabys1YTZ1U054YkNEaDhnaHhRWnI3dlp2UWhacXpuUFlSUXp5Nyti?=
 =?utf-8?B?dFA1RlRpeHFVUnUrMHgzU3JDS3Q1cGQwSDMzM3RnRkZLdjU3cnBqc1pnT3B1?=
 =?utf-8?B?QXVCQlk1ZjZNcVMvTGNLUXkraVlQbk9CandwZVgzU1JyendMcDFOY21QVlhp?=
 =?utf-8?B?ZjYyNDhiWVljM0FIV29abzVQWE9XaEhvOWpNMy9zRHhDZWxuZ1Y4WEQ1SlBo?=
 =?utf-8?B?S00rRktwMWZMT3Y1bUluY3ZBSTE5dDlGdTZOd3lucnhKQkdZMDJvbWxPbGda?=
 =?utf-8?B?aml3VHhXdDVHTDRRWmpJcHVtSDFiQ3h3YjBFSTE1dENUWWgwL3BsenlUUjRH?=
 =?utf-8?B?OEprcmZhWW40enc4SWN1anhnWlZkQ0tmWWFSYkduV29reGxYS1dLb2FFVzBy?=
 =?utf-8?B?UW5sLzRIRTUwY3l0VWxSdDdMM05VQStVa2N1eHF4R1VhKzNJNlBTdVFxNjI4?=
 =?utf-8?B?QnI3VDNtZ3d3RktUT0laaEZtV3VqZjJiaUF5cGVyMzl6amVLbG9WMWNLY3RJ?=
 =?utf-8?B?TWtxS1FzQUFSVzU3b3R3L1BFNlY3NmhReTEvMUkyQUtvYW9seDRRR0YycEgy?=
 =?utf-8?B?OUxoK0QycHhWdFBKUUZQZDMvczJtTXpxOFBuTG9sWjE1akY2WjVJUUVjZzg1?=
 =?utf-8?B?TUg0TitOaHV1WVVmZ3BxakNhdGE1MHFtM3EzRzl3bGhpclhDWGphN0o3d2la?=
 =?utf-8?B?UlFtenNIR28xQlFzMmQzajlHYmpJWUZvZkczUmVFUUsyVmlvT2RFTkl1VEZz?=
 =?utf-8?B?M1ZXVTVGWEpsd3ZZNlk2RmpxYTdmZEhWcEo4aStaQ3NNbDU3cXd1L01KWUE4?=
 =?utf-8?B?RFlocllFa3NRSnZ2Vm4xaUtZcGkvTC9JQUpRb1orb25ZWG92Tk85ODhaclJp?=
 =?utf-8?B?Ukdyb0hNRU0rWXBpNDlWWVhRQzU1bzR4dFV3ZnhNRFJkWjNKcnZUeVAvVlA4?=
 =?utf-8?B?U3U1QkdCYmhjbnFyZHNiVnc5VlZ2Y1p6dVVZMWZHdGFmaUs2N05iVnBmRUtC?=
 =?utf-8?B?eHg1SzllRzdYOG4xbVpYcmQrMUg5QnRUc3VzbWFVKzAwRHFEM3pud1ZVS2ps?=
 =?utf-8?B?V0tGOE1ZZXNmaCthNnVockRWTHZDemtKUTEzUVBRbXhmYnh1bWlwZ2JwTWdD?=
 =?utf-8?B?YmNNUHVqKy9YaFBYbzE2RmlJRThqdU9CT1lnR0RJTXlIUnVvMmR3RU1YV1hw?=
 =?utf-8?B?MVFNeTBPNTlQWkVpb2g0VCtjN25zVG5mRlBkclRMTnhxQUw0UVRZOVhxd1VI?=
 =?utf-8?B?OGczaUdhU1RmOHJyaGt3THlDSVdZbUgvSjRMaXphT1R3aFU3OGEyUHdNVTNx?=
 =?utf-8?B?WStvVWRhRVI0QjR0Z25hYzN1VStqVk5IelM0b1h6MHJxRzYwWlQzMTkyZWRU?=
 =?utf-8?B?QldtT3dwUzR0L0ptNWs0cVRraWJwNnNaSUEvMGppaUhPRkdqZUV2NzVrM2RB?=
 =?utf-8?B?TFBVZkxRYW4xSDVFT1d4YlVmeVJTTFBZZEJBQzd0RTZoZHhBRU1TOFk0Z0k2?=
 =?utf-8?B?QVFNbGpONHE0M3ZXSWV1L0VjaVYwZTZJc2xCTUVxNkc0VVNUREVwWmhSdmd3?=
 =?utf-8?Q?cDJvzOoVPrhYRKiWzy3K5Be8jKKaT4482qfolZj?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530b0ad3-428c-4587-66e5-08d8cd1b4118
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:53:41.4583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuRLp6969KMX3+/OCVvojSVB+yEy3M6l2J7peWQs9X1ZGw3U7B/OiWaXTJse7JxtY2aSYrCNRcOYmYeafWCaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3576
Subject: Re: [OE-core] [PATCH] opkg: Fix patch glitches
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-09_05:2021-02-09,2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=863 priorityscore=1501 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Richard,

On 2/9/21 9:23 AM, Richard Purdie wrote:
> Well spotted. I somehow grabbed a half complete version, trying to
> juggle too many things at once I think. I've fixed it on the branch,
> third time lucky :/.

The new patch on master-next looks good. Could you submit it to the 
opkg-devel ML, so that I can pull it from there?

Thanks!

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

