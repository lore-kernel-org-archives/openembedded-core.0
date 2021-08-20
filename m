Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2575.1629488188761143609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 12:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=kK/y/+mC;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3866a1384c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17KJJfMi000902
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 12:36:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IuS7mk8wga6ptwkeiJxWBH6CVHKrnC4nXLYiZAzixzI=;
 b=kK/y/+mCIu/BFtMfcZVJGFC3Ul452KyWC18D3oVG7DN9NbpUDL4uP4pIZb892AA1vGco
 9hNKwOXAyycFMJbDEvzvp6LM2Ezh8LbIf91YktbfHGgAK+RGyClhHazsJWwp4bXq+ute
 i/YzZEBNp1ihh+RXy42e+infKRFddO1HWZiL7UO3tI9/2Q2TGkWjF8pG2SiNB7WRb7c+
 aN5AL5Wc27BguOHv8BdNqO0s1HvaPj85QeL/TQf/JPXWbQU9RNRaRjBOVYOQgEOCGbac
 3v8hgmRpWA4kLn3ZCYe3t/CMS/naaZSAWz7Zxsl5PWK8yaN2PBA+ORCkpux125CnnXpq iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahp61h63s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 12:36:27 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17KJaRFx002974
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 12:36:27 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahp61h63q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Aug 2021 12:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqK92AMBQwL6gCR2yM6AVzfT5nJFe6Sa/qliigAmL62Nvzkelb1oogIGw6d5VB39JnILA/RA16lhj1GtWN53Q2rju0gvCy7e+NOINB0xtPQLwEjVLnJSGro73k7c7WExbgEfHzvPscgdIaICWyYsp7Av4TrgtCkgMcxwXqGxWm9PnpCaQfmZ8IgoOp/O/OmZ2iZT74T2hZMdeWrBCt9QjghymCuQwY8nS+qRXVGAJV/f5vEHSpl13icsaR0BnVRL4YxqFoBc+RwNbzEcdrh2sA50eRxzD0br6DUncfizD1tvWfEZ3KviWDs5Ab99idoojrBttkP9dFyggVzcXTxVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuS7mk8wga6ptwkeiJxWBH6CVHKrnC4nXLYiZAzixzI=;
 b=TazauLfV4AiAVHJR3x1a/5m5pFStcaALVLUKLQ0msh5e2SmKkoIm+oX7DNFY6r2VkYRE58/oVHvXTFRepYnzC/z01vNF3SK7TaVRT2vqeoVkvT2tNkQixZEsPs6ApZ9+8hyzB2tJpB2vFp4XzieInQZjsK3aMLsMlvK7VIiSW8trpOknaQS6riYJzH6aSatrp2xQjMmrYLfYvdHxiD6OkVyUD/sO9UsNk7C+ve/P2EVHYfC/I+cVN/aYHqSC6b+JzdnwqiRqK2Yx3UqtHYg61zcF9n0OBsDBCzo/zZoPAGXidLe95tANM/ua4CNu8dauFHFMRj6ryIzIIhodplItSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2604.namprd11.prod.outlook.com (2603:10b6:5:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 19:36:25 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 19:36:25 +0000
Subject: Re: [OE-core] [hardknott][PATCH] go: upgrade 1.16.5 -> 1.16.7
To: Sakib Sajal <sakib.sajal@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210820153947.8838-1-sakib.sajal@windriver.com>
 <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
 <c5b5762b-f46a-7e9f-98e7-652d68c40258@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c008c872-3a4e-686f-f1a6-119f3ad0cc1e@windriver.com>
Date: Fri, 20 Aug 2021 15:36:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c5b5762b-f46a-7e9f-98e7-652d68c40258@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend Transport; Fri, 20 Aug 2021 19:36:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7657b16-1d0b-4116-68b9-08d96411cbe9
X-MS-TrafficTypeDiagnostic: DM6PR11MB2604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2604B193515278A7013D4BD2F8C19@DM6PR11MB2604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zfFkjaakaAdX3AEDRE+A/wtcjG2IMIY3Y+ILDvFKWYsl8s/wCK8qyyJv7lkYGADwU0jJ/VWaCD/sCtnHHBj9GjCASrNtwjFEFdbX7FM7XsZr+Pzq8YHDgRzRQg58IC4LGYEIdIOKU4Wu5d4hDbxSg5CglzaVSHoUIkv02TxE5npqFuvqKVc2upx3seQCDkK+1vBNls/gIvbMVgaSqpuN3q/rfraFRxRpomXMyv/zQBnD/a9rf9P4yi2KEPTrM50vQ6DkaSAUTJ1gCZMPvCOulz4eYHLbDRMQSED5AoBfoMMnedQ8YmD8VRT9m0t41UfYdQ9HNB6gWU+yFegsY+k1E/Kk4gOKPAQqmWpzmR8oJP5TfqtG8YM9WaV0nTX9JhfsG1Wr4F48Hm17oxY0sF2UOed+bJrD0C73X67/WkCYE68fbAhU68U5bWZY/ny7aQtIZQc/YuKbaOAg7q1NgnFeXdPzOrpJrchIG06SQdHD/593qnbVmrxz5N8zNqRd32jjSK48sDqUQCncx8slRmqMQghc60/g7ny0hILFbUAXU7noKOsl7i/pRSWxSTuoMYMT7ZwUHjBSqrMAosP61Yhzo87RmJ6Cxt5gcwIpCrDOVrYNf0fuX4IKesnlhMU9sGm+x7scrWSCl5qYAsVcTzmfutSgyyi1WYGewWP38uRb7EKDqskab9560/lB28Cf4gSXokVeMY+cauPUHCrkIehVktEx4tHwbWkiA1LAMluXmLThJEsRxBeJZk5rge8MGhbgIIXP+ZaggX8kjKP5Sgu+chJBBDaIfRync6O7t48GD8Ph3Ws8ltXOTecMXRNDUREej+ZEFAKaICZZQpY3/JDnM8NP8B7iEET2Lz4rnLFi5sI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(52116002)(4326008)(5660300002)(66556008)(66946007)(316002)(2906002)(6486002)(16576012)(66476007)(26005)(8936002)(478600001)(186003)(956004)(2616005)(110136005)(30864003)(53546011)(966005)(6666004)(86362001)(36756003)(31696002)(38350700002)(38100700002)(83380400001)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enN0RXNVak9jVVZ3cm1yOVQxTnhENlRueExzeGNhMGI0V2Ryc3ViREJIQzMw?=
 =?utf-8?B?OXU0bjIzenUwVTNTVHhRL3lrRzhjQmloU1Y5a0I3UytwVzlHWjYyRVFJMEdD?=
 =?utf-8?B?MlZJbyszZUNIcVQrT040a1VFaEJCU3dBeUFKM3RzN2FrWkNDVHlZTDdqVUJD?=
 =?utf-8?B?bjBKdGd3SUx6My91djRCQmxVWDY1L3N6OGZMMEt4UlRNTW1UYmV4cmJmMGlI?=
 =?utf-8?B?elRhYmV3NFFCVVpLaloxMlZxTnUvaWd6bzcxbHQrcmRTWEdudzZhWkxoOTZE?=
 =?utf-8?B?L1J6Qk91WndWNUc4QVVvSjRpczk2anFwOG1XU3pzelB5UDRCQUpsM1lyc2hD?=
 =?utf-8?B?eW0reTNnYWdJR3JjS3hGTUdVUWttUTQxTjJXSExHRnNLVWw5bVVGbHR4L3Js?=
 =?utf-8?B?WDg5RkxjeGJYYnk2bXpXa1R4TzV1L0UvbHBvZGRNR3hwS3pkOThTKzdJcm94?=
 =?utf-8?B?bGdJc3Vrdit1RGEvZkRmbk1WR2tsdXdXWDZtMzY2NzQrNnNjckZVU1pjVy8y?=
 =?utf-8?B?aGZHUEhBZWM3cHFZNGtnTGNyUzBVdk0vV2pZUWl4T1hHbmIyZW40cEljMkpM?=
 =?utf-8?B?bEdLaXk5OUlHcVVBVXRlMkFJQzN1S2xjSTROZFp5Skx2S0llT1c0SlJhbk15?=
 =?utf-8?B?T3k2OFJaSUE5OTEzOUM4Q3ZjRTRhTlUxclJuUFZJRmI5MXlSek43M0dwSVJX?=
 =?utf-8?B?NFVCemFrNjFjTitDTWJ2MUdHMEZHUzJQSVZHdWdra1pVUDVEQ1lUSFFGbDgz?=
 =?utf-8?B?R3Z5YzI0WnI4cHlhV3poU3dIcFFLOVpGYjk5ZlU4Wm9KMjZmKy9DTTNVdWxP?=
 =?utf-8?B?RGNPbW0rSXQ0eGJPWEtFUnZ5cjlUK28vSXZmSTZSRjM2eml6SSs5dXhWd25n?=
 =?utf-8?B?OHdBMWpGZXZGbWtPcUxCRDRNS1BXNzQ3RGdmSUNRY0gwRVo0ZW5odG9DbDF4?=
 =?utf-8?B?RGlYbU90cGpzLzdpd2t0eUxHcTRnL0QxeHgxRU9DQTBLQkVxVEoyVzE0alpv?=
 =?utf-8?B?WERjYVJyOFIzUjd5dzlnb3FjMElYR3VCRGk3cWF3aWtaamJDbmJTbjQvYTJL?=
 =?utf-8?B?NmZOZElBeG0wbjVnWXhhTU00bXB3Z1NNclZud0Z6MkhFcWt2aUxPaG5OaTBD?=
 =?utf-8?B?SmY0VStDV3hXWXhzem1CR3AyZUNzWnNuY0VCVjBhMlJQakRwMXhlVUVsZEhK?=
 =?utf-8?B?b283SjFoc0FUbjkwRzJSQXFEa3VJN05mWlBhTmdsZzhXMWErN1p3RzJDK1c0?=
 =?utf-8?B?ZDNZZ3NiUlI0Wnd3WHR3cXdiZ1VwOVkrWWFhd0hJVkhHdFF1Vmh5YnRyeEZK?=
 =?utf-8?B?N0ovV3NGYitZTnVSN01BbTh3dnhCU1hESkRwcTFhZ2hZZzBXTkt2RHVESVNP?=
 =?utf-8?B?YjBsVE5uSWNwd3A3ZGdEY1pSSDladlYweXFNTU1yeGZzZDRTVDZzVW5MbW5y?=
 =?utf-8?B?S1VySUQwMTFOWWsxWXVucjgweVJNU0tGaFdyWmFNVVNLajJLSFRSRndNb1Jw?=
 =?utf-8?B?eHMwQWh4V2FPSTlDTmxTd3Frc2VCM1FkK2FlMy9uTnpRRElGaW4wenhhOE1V?=
 =?utf-8?B?MTZDNDhSWCtBelFqcmMzdzJ2bTVGTFhaWUdldDZXTFVHUkZRaWNSd0ExWVQ2?=
 =?utf-8?B?M0NKbnFOWE03NEJUcWtCb0cyODV4MmFUb0dZNithU2NDZFlGTFBlSkR0Wm9Q?=
 =?utf-8?B?RnljZ2NUaFlhY3NodDUrUk9RUko5azhMMGFLYmx0S3JONkV0ZEg1ZVoxa045?=
 =?utf-8?Q?k2+aT3RHxmt8wbAqXUEta9r2xMEL6ieXuNoHGB8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7657b16-1d0b-4116-68b9-08d96411cbe9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 19:36:25.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/X532eeeuai/8X7F5YKsA/0J65ibFJbS6t1EIP1vSH42bd6FLg9ItYO5QSJRVMlLQHZ1YQgwQD6SCXg1QJLzgwSyZEnIj3OzaAgCmUBD2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2604
X-Proofpoint-GUID: xAQQfqYmBTUReKN7yN38iNpQ5EIuuxqF
X-Proofpoint-ORIG-GUID: dJMtKcNjJ8j2-5x_6HfM_awCyPM6OFtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_08,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108200110
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17KJJfMi000902
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-08-20 2:41 p.m., Sakib Sajal wrote:
>=20
> On 2021-08-20 12:34 p.m., Alexander Kanavin wrote:
>>
>> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Maybe we should go straight to 1.17?

Sure for master but on hardknott probably not!!

That's not our typical approach for GAed releases so
unless there's a pressing need and community agreement
we should only upgrade to 1.16.7.

It may be a bit more work to backport CVEs and
some CVEs and especially bug fixes we may not get at all.


I'm NOT a Go user but here are the release notes for those
how are:
  https://golang.org/doc/go1.17

There are a few changes that seem like they could be a problem
but we haven't tested anything yet.

../Randy



>>
> I was thinking the same, but stuck with 1.16 release for hardknott and=20
> not bump the minor version.
>=20
> I am working on upgrading the recipe on master branch to 1.17 though.
>=20
>> Alex
>>
>> On Fri, 20 Aug 2021 at 17:39, Sakib Sajal <sakib.sajal@windriver.com=20
>> <mailto:sakib.sajal@windriver.com>> wrote:
>>
>>     Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com
>>     <mailto:sakib.sajal@windriver.com>>
>>     ---
>>     =C2=A0meta/recipes-devtools/go/{go-1.16.5.inc =3D> go-1.16.7.inc}=C2=
=A0 =C2=A0 =C2=A0| 4
>>     ++--
>>     =C2=A0...{go-binary-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxx=
bl6j$>
>>     =3D> go-binary-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVI=
AEJj$>}
>>     | 4 ++--
>>     =C2=A0...o-cross-canadian_1.16.5.bb
>>     <https://urldefense.com/v3/__http://o-cross-canadian_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bmv=
QHsj$>
>>     =3D> go-cross-canadian_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_=
rmaVW$>}
>>     | 0
>>     =C2=A0.../go/{go-cross_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>>     =3D> go-cross_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>}=
=20
>>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>>     =C2=A0.../go/{go-crosssdk_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$=
>
>>     =3D> go-crosssdk_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$=
>}=20
>>     =C2=A0 =C2=A0 =C2=A0| 0
>>     =C2=A0.../go/{go-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>>     =3D> go-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>}=
=20
>>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>>     =C2=A0.../go/{go-runtime_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>>     =3D> go-runtime_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>=
}=20
>>     =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>>     =C2=A0meta/recipes-devtools/go/{go_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>>     =3D> go_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>}=20
>>     =C2=A0 =C2=A0 =C2=A0| 0
>>     =C2=A08 files changed, 4 insertions(+), 4 deletions(-)
>>     =C2=A0rename meta/recipes-devtools/go/{go-1.16.5.inc =3D> go-1.16.7.=
inc}
>>     (89%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxx=
bl6j$>
>>     =3D> go-binary-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVI=
AEJj$>}
>>     (83%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo=
7bOan$>
>>     =3D> go-cross-canadian_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_=
rmaVW$>}
>>     (100%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-cross_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>>     =3D> go-cross_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>}
>>     (100%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$=
>
>>     =3D> go-crosssdk_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$=
>}
>>     (100%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>>     =3D> go-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>}
>>     (100%)
>>     =C2=A0rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>>     =3D> go-runtime_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>=
}
>>     (100%)
>>     =C2=A0rename meta/recipes-devtools/go/{go_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>>     =3D> go_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>}
>>     (100%)
>>
>>     diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
>>     b/meta/recipes-devtools/go/go-1.16.7.inc
>>     similarity index 89%
>>     rename from meta/recipes-devtools/go/go-1.16.5.inc
>>     rename to meta/recipes-devtools/go/go-1.16.7.inc
>>     index b693315917..ed2d94671b 100644
>>     --- a/meta/recipes-devtools/go/go-1.16.5.inc
>>     +++ b/meta/recipes-devtools/go/go-1.16.7.inc
>>     @@ -1,7 +1,7 @@
>>     =C2=A0require go-common.inc
>>
>>     =C2=A0GO_BASEVERSION =3D "1.16"
>>     -PV =3D "1.16.5"
>>     +PV =3D "1.16.7"
>>     =C2=A0FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERS=
ION}:"
>>
>>     =C2=A0LIC_FILES_CHKSUM =3D
>>     "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707"
>>     @@ -18,4 +18,4 @@ SRC_URI +=3D "\
>>     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>>     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.pat=
ch
>>     \
>>     =C2=A0"
>>     -SRC_URI[main.sha256sum] =3D
>>     "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
>>     +SRC_URI[main.sha256sum] =3D
>>     "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
>>     diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxx=
bl6j$>
>>     b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVI=
AEJj$>
>>     similarity index 83%
>>     rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxx=
bl6j$>
>>     rename to meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVI=
AEJj$>
>>     index b3e2b6a60e..cb54c2868e 100644
>>     --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxx=
bl6j$>
>>     +++ b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVI=
AEJj$>
>>     @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D
>>     "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707"
>>     =C2=A0PROVIDES =3D "go-native"
>>
>>     =C2=A0SRC_URI =3D
>>     "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.=
gz;name=3Dgo_${BUILD_GOTUPLE}
>>     <https://urldefense.com/v3/__https://dl.google.com/go/go$*7BPV*7D.$*=
7BBUILD_GOOS*7D-$*7BBUILD_GOARCH*7D.tar.gz;name=3Dgo_$*7BBUILD_GOTUPLE*7D__=
;JSUlJSUlJSU!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8ob=
K2uWXU7L9Uk9ZizkEmm$>"
>>     -SRC_URI[go_linux_amd64.sha256sum] =3D
>>     "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
>>     -SRC_URI[go_linux_arm64.sha256sum] =3D
>>     "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
>>     +SRC_URI[go_linux_amd64.sha256sum] =3D
>>     "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
>>     +SRC_URI[go_linux_arm64.sha256sum] =3D
>>     "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
>>
>>     =C2=A0UPSTREAM_CHECK_URI =3D "https://golang.org/dl/
>>     <https://urldefense.com/v3/__https://golang.org/dl/__;!!AjveYdw8EvQ!=
Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9azqPqHh$>"
>>     =C2=A0UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
>>     diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo=
7bOan$>
>>     b/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_=
rmaVW$>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo=
7bOan$>
>>     rename to meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!=
AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_=
rmaVW$>
>>     diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>>     b/meta/recipes-devtools/go/go-cross_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>>     rename to meta/recipes-devtools/go/go-cross_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>
>>     diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$=
>
>>     b/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$=
>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$=
>
>>     rename to meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYd=
w8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$=
>
>>     diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>>     b/meta/recipes-devtools/go/go-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go-native_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>>     rename to meta/recipes-devtools/go/go-native_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>
>>     diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>>     b/meta/recipes-devtools/go/go-runtime_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>>     rename to meta/recipes-devtools/go/go-runtime_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>
>>     diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>>     b/meta/recipes-devtools/go/go_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>
>>     similarity index 100%
>>     rename from meta/recipes-devtools/go/go_1.16.5.bb
>>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>>     rename to meta/recipes-devtools/go/go_1.16.7.bb
>>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4=
ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>
>>     --=20
>>     2.32.0
>>
>>
>>
>>
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
