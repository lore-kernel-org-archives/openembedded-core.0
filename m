Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1865.1629484929383429320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 11:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=DFr/QW/e;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=386697b4fd=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17KIIE3Q025912
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 18:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=8FZGWd2cghECDBEFaoVRymOQiRRoj6ivmIRY9Rrtdg4=;
 b=DFr/QW/ebWOfcIXaJ0GXHay812DQzUI/tznmdevArvZpC0Fz2T7P8+5ua0fpXN0H4WwF
 T3BcKDro+SGyfjQtsallem9y+f7IDZl3P/fCraFWAHpm1mG81/sik8P8p8If2fxbhLzh
 jVKTebDG4yRUlU69BC4I01MV6FlNOPY7vraIzEsRXjAccQyc7ObolPPWfzsq5OsoC7sF
 FwoMClHF/gTfj7uQiOFhXsZYBptAAAyniObA5HyIg8GbENU4a2NE/teWZE4mdrVzCi3b
 tbjX7WkNIaPGBl5TKK5l0APHhmfiU+2JDedlbVL7kcomJ9fXUQ0eGKf2nqXNVL4daJus FA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aj7ne8dy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 18:42:06 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17KIg6mw003862
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 18:42:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aj7ne8dy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Aug 2021 18:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3FIgd5FJD8YnhL5I5RLSiPGcQxCIuoLJIjtrsb73VQglFFaB+/yQJrZT7lKek7flLwNTzdEcV5LJ59MeaKENJA54UESF3zs0q5bH/f3Am4fRBMs1goGNPiRzrVJjzMWMYUO4vlR2ZWcxT6cf2sQuGvbEMHyp/BIj+1bS7oGz6By1gfvpSAW6YYtbwEeH/TrSa70wn5AdRbzdAR+CkrvqbbZd5CdJb0wTpPh8OeB93lbDuSEaPtJPR/2QQx5TtsMWIChlvdnNDqsUzgcn/KnCpGCCW+wcTOZFbwclp+VuG+6ndW6T2er7HU9V6sLjNHOBlVJhRN9vh3DjBOhOwQ0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FZGWd2cghECDBEFaoVRymOQiRRoj6ivmIRY9Rrtdg4=;
 b=NKouR7yzH+rOPjYD/iFTNm85Wg6yyZDKxnkovETcViudTMNonAnX0RZ+ubLI/gt4dF+M06/RypVhG4SmRX4jJEYBFdjHGxjrShTGuQ5jCe9GrLVNDRVUBjHT2Hu1TsKzBPhOcblIfF1vv+hKdL80ndjlDpiyb2l2bqU4QxxN4z7cmfhbnE+0O12UwWDrQKvnHan6znoiCxNQL/k/3hxAybKUc7Ap+oG+Oi4nhBjzML9ldfqEjvNgPuzgd640d0y/6Cw3d6D0QzguLmqapxYCnIkVvzYyIrTMZMw5DHH2xK/Jf5hJO5GFPQB/kOQWphF3GWuHNvNNcDsT0tWpgNQufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1785.namprd11.prod.outlook.com (2603:10b6:3:10d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.18; Fri, 20 Aug 2021 18:42:02 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4415.025; Fri, 20 Aug 2021
 18:42:02 +0000
Subject: Re: [OE-core] [hardknott][PATCH] go: upgrade 1.16.5 -> 1.16.7
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210820153947.8838-1-sakib.sajal@windriver.com>
 <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <c5b5762b-f46a-7e9f-98e7-652d68c40258@windriver.com>
Date: Fri, 20 Aug 2021 14:41:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
X-ClientProxiedBy: MN2PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:208:e8::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by MN2PR20CA0005.namprd20.prod.outlook.com (2603:10b6:208:e8::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 18:42:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c47f2c1-f590-4adf-b466-08d9640a3317
X-MS-TrafficTypeDiagnostic: DM5PR11MB1785:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1785C0D45DF931629023EF8FF2C19@DM5PR11MB1785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B8RdZL09st1lzOPb48To/FUkDifqT1qSUYCPvNPJ3u5u7omoz7J7vOjAo3gAZ/tPGWOlxlJiKN75tp3e16SV3aRpnpcilbG++V6nkkd/bx5tU4WBJ/zvf9R1FnG6TbTGjPbcyYp8h1kGo7i+5MYvLZnHtsF9UvpkMCdnI8tp0aC9CBqMYir8r+0cQsPnWEAY17moz4PSGUaabGY/4N4UoZmK3p00fltm10PtVyfNBJrGUaynES3lf9tv+30xh+ncNrCAe2M002+W1itdyq9Oyek4uCKiSamkFizmVejtlAizJ/yWkqOh5Cu1aEcY6KhvXhEovHRZdZ8gwnnQTHIZGHaBYsak6ZRXo2m1Yj8OguWV8rdKqQhBZ1E6t2WytBecTVxwSWrFryxhJUVI0lSbWlSkFRTRWYju3jhINE33Kev8Szk0S9Lpro8TsXwx4Hb2/wYRqBuLLjGN/VINZCiaVFZcyhHs+JKUrgyEu7KO2h0ThLus0IOlPxzTUr4S49hohpdA+N39wcZ4J0+KDXqgJlazao9JYZ5ItyjcanTpNoUAKdSUa72X6IiZwE1/arD9neaxAtRjKxSKBV0UqpZQQ8ZkaX48c1KYjzuPfqYvfr4QfL4ZKUADCAaXiUHmLo+Qosut55IxYxqiptF67wr6s7BK9OZNngeJQ017S1PNRFc2EhgG/fN7cIblYnskAe/EVBz64kjyPuEIPeGTRo5PqvznJnMVR6s91LvB7paH2QO7d8WJgDK+uio9WsQZO8bzL6T22yLkhxZyNvvfTl+QcJRn7XuSlTg5WA97iF0x2xdno8CTnKIZzxNsp1h1haeo5k/CiZaYjgRxjSGm5nlcaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(30864003)(53546011)(86362001)(2906002)(66946007)(186003)(26005)(316002)(6666004)(33964004)(16576012)(966005)(6916009)(31696002)(508600001)(38100700002)(31686004)(4326008)(38350700002)(5660300002)(52116002)(66476007)(83380400001)(2616005)(956004)(66556008)(36756003)(8936002)(44832011)(8676002)(166002)(6486002)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUoza1QxcWFGbDJqQzU2MS84UUV4NDVTQndyU3VsZ0p3eURBV2YyN1hwSGRv?=
 =?utf-8?B?dXJUSW1IcUNBQUZ2Sy9pNEcyaXhOQ3JkL0NlRkd4c0g5TmU4cm43K0JuK1ZG?=
 =?utf-8?B?dWpmNDVwcU93ZjJqcy9SYmw3YndzYXdSbkROeFcxMVN2aWRkSXd0RVJ4cmxC?=
 =?utf-8?B?TVNWQXB0UnpuVmJQek12WGRSSFVxZ0dDaEk0ZDM1RUp6eHUvMGFQTEtoNXFz?=
 =?utf-8?B?MDZndFVHZ1NOdFJ4Y1B6TDQwWnBhaGhpdVllWkYzVUJDcEhIbWcrL1hhUnZ5?=
 =?utf-8?B?ZnpFSU54MnE3MmNiYXNZQTRHZWhVOUltVUdNdHkxbmxDdXdUZjBqTkp3Zk4z?=
 =?utf-8?B?Zi9CYWRrY0tvVEJOVUpRT2JDeldZSzhwN3diaFBLVEgvQ21xMExBeis2cGFp?=
 =?utf-8?B?TjcwWjRiTlRkaVpOZ21vNEpkV2dxT0JIVU5VZEdhdTRDRHo4RDB1YURtZGNI?=
 =?utf-8?B?SlVIbEFJdkRETWFUQzNlMWsvTGdzK0UzYVBSMGtjMWJ1dHRvaFNWNThQWHVj?=
 =?utf-8?B?bW01MWJNSGNqTklnZzZRb2FDcUdMd1hNY081bG9xQVV6M09xOUlwekExb1RN?=
 =?utf-8?B?SG5GNDI4RGkrd3M2VUVSV3piaW9mK0IvUHBtZFZzYXZlOTJGS3h2Zy9HRVIv?=
 =?utf-8?B?NzVjRGkzVy93LzFtb2hOdzVpQ3NjeHd4aWZxamllbTcxVzhkeklkNWJpejVE?=
 =?utf-8?B?WHg2ZVI0cnFzUzIwTEN2c1Q2ZUFNYVRqdS9uY2ZQb0QrN3A2R21zdFVBVGNJ?=
 =?utf-8?B?VU5DSVYxNUkrNTVkb1JnQ0tsSWdPQlUrQ01yNUluVGRzSlhOejFIeFIzUTls?=
 =?utf-8?B?emQxUzhWajJJNWVyVUNRY24zUGVuM3lkRCtSSC9QN2NLaUtJZlhIRFFGemRM?=
 =?utf-8?B?NDE4RGFCcmlWblhSU0k0a3ZyTG41eDZvQVZzVkpTVXFNWXk0MXdjSTVndDVr?=
 =?utf-8?B?c3llcVNxTVpBK2pqa0d2TzFKM1gzQlJGc2twKzBNeHhXU3NtdFluUUl3bmVo?=
 =?utf-8?B?MkY5bzhhdnNreWNub1JLbVc3d09zbnhBK3NWdENPZmhjbGVlcm92SVNPdWhi?=
 =?utf-8?B?YlZmTG5KVzExaWZuVEd2V0JuRk1NL0VCZ0o2N1V5NVhyTmpVUktyY2xkRnRR?=
 =?utf-8?B?K0JUN1JaeGN0NFQzTjZvRUpXODQ3c2plam1ZVy80a3dyRHdGWCtEY0RhL3pV?=
 =?utf-8?B?aWJPRkxoanR0L0F5b2hsTWZ6aW5SZk9qZFgzY1RzemRqVzBoY1NReVNmRElE?=
 =?utf-8?B?c3p3T2lZcU9vODlZS3llU1lyTk92aDRvNldHZXliTzVQazVsdDByclVleUFr?=
 =?utf-8?B?cEFkb3M1aG5kSDMxYXhGeEdXajZNVDNXMmpWdDZnQ0tDdlVOM0VKS1grcjV6?=
 =?utf-8?B?eXhRZ3NabFcrVUFlS2RJWUpLUUQxU2hoeG1KVTNBdFkzSDVOQjRNK0RYVXFL?=
 =?utf-8?B?cWpUaER3SGlNWHdQY0s3YmxveE5sN1Y1aFZTN1FGUXVKS3hMU29JRFlXNWcx?=
 =?utf-8?B?OVl6NWpKdGJMVG41RGZkekU2Y1k3U3JHVHlPUkxxVjVuVVJ3NmFSNnZzSms3?=
 =?utf-8?B?TGhkUWxoTHhFMGNNNm9TVENiNC8yKzBLSmRVVGkxaHd6TTkycm9MR3NvWXp3?=
 =?utf-8?B?czZPKzl5Qkdja3U1Rk5vYWpwVElSMkVYaE15MTdoMUljZ29jVS9tQ09NWmpk?=
 =?utf-8?B?TlI4aWl0cDYzenFYNTdoV2VPK3ZyWmV6L0hOL2FPeTJKYktlcHZGd3U2a3VG?=
 =?utf-8?Q?GICrY4v/eiwZJdm6J13wVxJUI9+ksJQm/DZN0or?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c47f2c1-f590-4adf-b466-08d9640a3317
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 18:42:02.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1uX11RevfK5Jvi3iQs7FNIR24bQuJfZ4NeWf+QaqbVPO2v9A2YCIJL1EdwKd5iyzGcRXTQmlNbIKp2HvXwQ83a+nYOsv7g4EumnosCbSoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
X-Proofpoint-GUID: Hu4alyQ8xQIk-G3HROsK6ROByBfqFNZK
X-Proofpoint-ORIG-GUID: RUOt08JqwicZmOiAAHVudsEeyIYWGpDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-20_08,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108200104
Content-Type: multipart/alternative;
 boundary="------------13034C9DD29A8E9021B51553"
Content-Language: en-US

--------------13034C9DD29A8E9021B51553
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17KIIE3Q025912


On 2021-08-20 12:34 p.m., Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Maybe we should go straight to 1.17?
>
I was thinking the same, but stuck with 1.16 release for hardknott and=20
not bump the minor version.

I am working on upgrading the recipe on master branch to 1.17 though.

> Alex
>
> On Fri, 20 Aug 2021 at 17:39, Sakib Sajal <sakib.sajal@windriver.com=20
> <mailto:sakib.sajal@windriver.com>> wrote:
>
>     Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com
>     <mailto:sakib.sajal@windriver.com>>
>     ---
>     =C2=A0meta/recipes-devtools/go/{go-1.16.5.inc =3D> go-1.16.7.inc}=C2=
=A0 =C2=A0 =C2=A0| 4
>     ++--
>     =C2=A0...{go-binary-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxb=
l6j$>
>     =3D> go-binary-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIA=
EJj$>}
>     | 4 ++--
>     =C2=A0...o-cross-canadian_1.16.5.bb
>     <https://urldefense.com/v3/__http://o-cross-canadian_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bmvQ=
Hsj$>
>     =3D> go-cross-canadian_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_r=
maVW$>}
>     | 0
>     =C2=A0.../go/{go-cross_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>     =3D> go-cross_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>}=
=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>     =C2=A0.../go/{go-crosssdk_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$>
>     =3D> go-crosssdk_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$>=
}=C2=A0
>     =C2=A0 =C2=A0 =C2=A0| 0
>     =C2=A0.../go/{go-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>     =3D> go-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>}=
=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>     =C2=A0.../go/{go-runtime_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>     =3D> go-runtime_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>}=
=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0
>     =C2=A0meta/recipes-devtools/go/{go_1.16.5.bb
>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>     =3D> go_1.16.7.bb
>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>}=C2=A0
>     =C2=A0 =C2=A0 =C2=A0| 0
>     =C2=A08 files changed, 4 insertions(+), 4 deletions(-)
>     =C2=A0rename meta/recipes-devtools/go/{go-1.16.5.inc =3D> go-1.16.7.i=
nc}
>     (89%)
>     =C2=A0rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxb=
l6j$>
>     =3D> go-binary-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIA=
EJj$>}
>     (83%)
>     =C2=A0rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7=
bOan$>
>     =3D> go-cross-canadian_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_r=
maVW$>}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/go/{go-cross_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>     =3D> go-cross_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$>
>     =3D> go-crosssdk_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$>=
}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/go/{go-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>     =3D> go-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>     =3D> go-runtime_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/go/{go_1.16.5.bb
>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>     =3D> go_1.16.7.bb
>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>}
>     (100%)
>
>     diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
>     b/meta/recipes-devtools/go/go-1.16.7.inc
>     similarity index 89%
>     rename from meta/recipes-devtools/go/go-1.16.5.inc
>     rename to meta/recipes-devtools/go/go-1.16.7.inc
>     index b693315917..ed2d94671b 100644
>     --- a/meta/recipes-devtools/go/go-1.16.5.inc
>     +++ b/meta/recipes-devtools/go/go-1.16.7.inc
>     @@ -1,7 +1,7 @@
>     =C2=A0require go-common.inc
>
>     =C2=A0GO_BASEVERSION =3D "1.16"
>     -PV =3D "1.16.5"
>     +PV =3D "1.16.7"
>     =C2=A0FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSI=
ON}:"
>
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707"
>     @@ -18,4 +18,4 @@ SRC_URI +=3D "\
>     =C2=A0file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.pat=
ch \
>     =C2=A0file://0001-encoding-xml-handle-leading-trailing-or-double-colo=
n.patch
>     \
>     =C2=A0"
>     -SRC_URI[main.sha256sum] =3D
>     "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
>     +SRC_URI[main.sha256sum] =3D
>     "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
>     diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxb=
l6j$>
>     b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIA=
EJj$>
>     similarity index 83%
>     rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxb=
l6j$>
>     rename to meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIA=
EJj$>
>     index b3e2b6a60e..cb54c2868e 100644
>     --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxb=
l6j$>
>     +++ b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!Aj=
veYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIA=
EJj$>
>     @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707"
>     =C2=A0PROVIDES =3D "go-native"
>
>     =C2=A0SRC_URI =3D
>     "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.g=
z;name=3Dgo_${BUILD_GOTUPLE}
>     <https://urldefense.com/v3/__https://dl.google.com/go/go$*7BPV*7D.$*7=
BBUILD_GOOS*7D-$*7BBUILD_GOARCH*7D.tar.gz;name=3Dgo_$*7BBUILD_GOTUPLE*7D__;=
JSUlJSUlJSU!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK=
2uWXU7L9Uk9ZizkEmm$>"
>     -SRC_URI[go_linux_amd64.sha256sum] =3D
>     "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
>     -SRC_URI[go_linux_arm64.sha256sum] =3D
>     "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
>     +SRC_URI[go_linux_amd64.sha256sum] =3D
>     "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
>     +SRC_URI[go_linux_arm64.sha256sum] =3D
>     "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
>
>     =C2=A0UPSTREAM_CHECK_URI =3D "https://golang.org/dl/
>     <https://urldefense.com/v3/__https://golang.org/dl/__;!!AjveYdw8EvQ!P=
n4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9azqPqHh$>"
>     =C2=A0UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
>     diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7=
bOan$>
>     b/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_r=
maVW$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7=
bOan$>
>     rename to meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!A=
jveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_r=
maVW$>
>     diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>     b/meta/recipes-devtools/go/go-cross_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$>
>     rename to meta/recipes-devtools/go/go-cross_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8Ev=
Q!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$>
>     diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$>
>     b/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$>
>     rename to meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw=
8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$>
>     diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>     b/meta/recipes-devtools/go/go-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go-native_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$>
>     rename to meta/recipes-devtools/go/go-native_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8E=
vQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$>
>     diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>     b/meta/recipes-devtools/go/go-runtime_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$>
>     rename to meta/recipes-devtools/go/go-runtime_1.16.7.bb
>     <https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8=
EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$>
>     diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>     b/meta/recipes-devtools/go/go_1.16.7.bb
>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>
>     similarity index 100%
>     rename from meta/recipes-devtools/go/go_1.16.5.bb
>     <https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$>
>     rename to meta/recipes-devtools/go/go_1.16.7.bb
>     <https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4c=
cZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$>
>     --=20
>     2.32.0
>
>
>    =20
>

--------------13034C9DD29A8E9021B51553
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-08-20 12:34 p.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div>Maybe we should go straight to 1.17?</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I was thinking the same, but stuck with 1.16 release for
      hardknott and not bump the minor version. <br>
    </p>
    <p>I am working on upgrading the recipe on master branch to 1.17
      though.</p>
    <blockquote type="cite" cite="mid:CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, 20 Aug 2021 at
            17:39, Sakib Sajal &lt;<a href="mailto:sakib.sajal@windriver.com" moz-do-not-send="true">sakib.sajal@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Signed-off-by: Sakib Sajal &lt;<a href="mailto:sakib.sajal@windriver.com" target="_blank" moz-do-not-send="true">sakib.sajal@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/recipes-devtools/go/{go-1.16.5.inc =&gt;
            go-1.16.7.inc}&nbsp; &nbsp; &nbsp;| 4 ++--<br>
            &nbsp;...{<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxbl6j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIAEJj$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-binary-native_1.16.7.bb</a>} | 4 ++--<br>
            &nbsp;...<a href="https://urldefense.com/v3/__http://o-cross-canadian_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bmvQHsj$" rel="noreferrer" target="_blank" moz-do-not-send="true">o-cross-canadian_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_rmaVW$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-cross-canadian_1.16.7.bb</a>} | 0<br>
            &nbsp;.../go/{<a href="https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-cross_1.16.7.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 0<br>
            &nbsp;.../go/{<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-crosssdk_1.16.7.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp;| 0<br>
            &nbsp;.../go/{<a href="https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-native_1.16.7.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 0<br>
            &nbsp;.../go/{<a href="https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-runtime_1.16.7.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 0<br>
            &nbsp;meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go_1.16.7.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp;| 0<br>
            &nbsp;8 files changed, 4 insertions(+), 4 deletions(-)<br>
            &nbsp;rename meta/recipes-devtools/go/{go-1.16.5.inc =&gt;
            go-1.16.7.inc} (89%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxbl6j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIAEJj$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-binary-native_1.16.7.bb</a>} (83%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7bOan$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross-canadian_1.16.5.bb</a>
            =&gt; <a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_rmaVW$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-cross-canadian_1.16.7.bb</a>} (100%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-cross_1.16.7.bb</a>} (100%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-crosssdk_1.16.7.bb</a>} (100%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-native_1.16.7.bb</a>} (100%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go-runtime_1.16.7.bb</a>} (100%)<br>
            &nbsp;rename meta/recipes-devtools/go/{<a href="https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.5.bb</a>
            =&gt;
            <a href="https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$" rel="noreferrer" target="_blank" moz-do-not-send="true">
              go_1.16.7.bb</a>} (100%)<br>
            <br>
            diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
            b/meta/recipes-devtools/go/go-1.16.7.inc<br>
            similarity index 89%<br>
            rename from meta/recipes-devtools/go/go-1.16.5.inc<br>
            rename to meta/recipes-devtools/go/go-1.16.7.inc<br>
            index b693315917..ed2d94671b 100644<br>
            --- a/meta/recipes-devtools/go/go-1.16.5.inc<br>
            +++ b/meta/recipes-devtools/go/go-1.16.7.inc<br>
            @@ -1,7 +1,7 @@<br>
            &nbsp;require go-common.inc<br>
            <br>
            &nbsp;GO_BASEVERSION = &quot;1.16&quot;<br>
            -PV = &quot;1.16.5&quot;<br>
            +PV = &quot;1.16.7&quot;<br>
            &nbsp;FILESEXTRAPATHS_prepend :=
            &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&quot;<br>
            <br>
            &nbsp;LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a><br>
            @@ -18,4 +18,4 @@ SRC_URI += &quot;\<br>
            &nbsp; &nbsp;
            &nbsp;<a class="moz-txt-link-freetext" href="file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch</a>
            \<br>
            &nbsp; &nbsp;
            &nbsp;<a class="moz-txt-link-freetext" href="file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch">file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch</a>
            \<br>
            &nbsp;&quot;<br>
            -SRC_URI[main.sha256sum] =
            &quot;7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80&quot;<br>
            +SRC_URI[main.sha256sum] =
            &quot;1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac&quot;<br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxbl6j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIAEJj$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.7.bb</a><br>
            similarity index 83%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxbl6j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIAEJj$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.7.bb</a><br>
            index b3e2b6a60e..cb54c2868e 100644<br>
            --- a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yxxbl6j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.5.bb</a><br>
            +++ b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-binary-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZVIAEJj$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-binary-native_1.16.7.bb</a><br>
            @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a><br>
            &nbsp;PROVIDES = &quot;go-native&quot;<br>
            <br>
            &nbsp;SRC_URI = &quot;<a href="https://urldefense.com/v3/__https://dl.google.com/go/go$*7BPV*7D.$*7BBUILD_GOOS*7D-$*7BBUILD_GOARCH*7D.tar.gz;name=go_$*7BBUILD_GOTUPLE*7D__;JSUlJSUlJSU!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZizkEmm$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}</a>&quot;<br>
            -SRC_URI[go_linux_amd64.sha256sum] =
            &quot;b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061&quot;<br>
            -SRC_URI[go_linux_arm64.sha256sum] =
            &quot;d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799&quot;<br>
            +SRC_URI[go_linux_amd64.sha256sum] =
            &quot;7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04&quot;<br>
            +SRC_URI[go_linux_arm64.sha256sum] =
            &quot;63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac&quot;<br>
            <br>
            &nbsp;UPSTREAM_CHECK_URI = &quot;<a href="https://urldefense.com/v3/__https://golang.org/dl/__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9azqPqHh$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://golang.org/dl/</a>&quot;<br>
            &nbsp;UPSTREAM_CHECK_REGEX =
            &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&quot;<br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7bOan$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross-canadian_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_rmaVW$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross-canadian_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9Yo7bOan$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross-canadian_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross-canadian_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9e_rmaVW$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross-canadian_1.16.7.bb</a><br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9bhmEOpX$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-cross_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9R1Erx_j$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-cross_1.16.7.bb</a><br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9eOmsav9$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-crosssdk_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9ZRIB_dW$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-crosssdk_1.16.7.bb</a><br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-native_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9SDVKZE4$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-native_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9WpFrFnY$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-native_1.16.7.bb</a><br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-runtime_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9VEZqcQn$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go-runtime_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W5tpCfB$" rel="noreferrer" target="_blank" moz-do-not-send="true">go-runtime_1.16.7.bb</a><br>
            diff --git a/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.5.bb</a>
            b/meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.7.bb</a><br>
            similarity index 100%<br>
            rename from meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go_1.16.5.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9cvmwbDh$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.5.bb</a><br>
            rename to meta/recipes-devtools/go/<a href="https://urldefense.com/v3/__http://go_1.16.7.bb__;!!AjveYdw8EvQ!Pn4ccZa3TzbStkzS6S3eldqUxVZwt7ML-rEICZ5iIdJdkI8obK2uWXU7L9Uk9W96iZWm$" rel="noreferrer" target="_blank" moz-do-not-send="true">go_1.16.7.bb</a><br>
            -- <br>
            2.32.0<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------13034C9DD29A8E9021B51553--
