Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7248.1628687665545550958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 06:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Rk96vSGf;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857057f33=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17BCxeCL031757
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 06:14:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=gB7bgyxcchnV0zXe5hiqKiZd0RoldQGN/eAxL106Aw0=;
 b=Rk96vSGfy54ZIKlTvBtTa3fDwF+dwX/b1JOYR6qOLIW6evStvACKA3YrGIVbxuxaFkWX
 302zyD+KKHPjVUj6yPb6mTlLWE7rnBMq04CNBpf4WoiI6zZbLnj2JRTIgJNbSOfm8K2n
 tzRXhZQALY4JQrnKyarmCJSQhUqNXq7OhWerSdAx9XbzI3u+5C0rckMxR89fAmRdfeDN
 lZEjvyjGHPd4pQuvo7OE0LzpRO0er98UNS3MbRZ4pFz50wUSWoYkEF1cGMqZ9nT0ZbGj
 vR64tlZr529GaGMN4+Bs46iRqzaYwtoD8axU21bfWmuld6oDh1R65QqAUMSDlAAVrV46 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acanf85qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 06:14:24 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BDEOL0032553
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 06:14:24 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acanf85qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Aug 2021 06:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUVRrW8lcbDm1aw+3Dz/PnqxgnQnbUmxI/9F+FPLhB1qstRnJet98RWG1eiF+PZify7+oDneC/xMB1oiBssF0tyRJZhH3drhqVzSND/b29iDsL6IfhX65WCbNZg9KApAQTgDRosfKckqFB7rw9VIYyeJrjUKsd8QjdyaW2Xw/eFYxJB8ddkvqyDjLfY2JHWEO33aBuFpUnTJI1ct0AB9vcWlEC9FIpFEdp4eCr6rlhW/AlfTYnUxzEO2e8vECCrxvkJIZZHpJiDRoSPlCPChBOeNa5qcZ2ZbOqEN5zHMvf9oQrCYguzjNLDtijXPuAUmO/xa3fJdEWcIINDARZYIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB7bgyxcchnV0zXe5hiqKiZd0RoldQGN/eAxL106Aw0=;
 b=IT7S00liToX53P1/1B2yDZXYmZI1InXe1A/VYe292rWvBKzkjYazYP3zyn7ItSmwp987m6fY44kDWciegr7dbwC53M9fltrmYVqcprWyCajIJKVHRvjeNAvqi0IB5Tx+3PHSTbigTHZmXpF23cB6QMKis92f6gh4Yz7Yw1Z4VcGn1NgDGl2P7KwCqsdYGrJmu1tCYsiVUcxkwCnqKRkzDXRarrb7SfXDIGDdCM5j9hw7geTOa9uNLLwR4HiLnLbUmL8fmjxS+Aq860mVUex1q++tpzBGMOpUfiRzxb78Hzg2oMSq1b39hseA29Owv2+K6O/IhSN0PChzYAhyOpSvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: pbarker.dev; dkim=none (message not signed)
 header.d=none;pbarker.dev; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2539.namprd11.prod.outlook.com (2603:10b6:5:bf::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 13:14:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 13:14:19 +0000
Subject: Re: [v3] [RFC] Merge meta-rust to oe-core
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, steven@stevenwalter.org,
        johan.anderholm@gmail.com, derek@asterius.io, cardoe@cardoe.com,
        dev@codyps.com, tylerwhall@gmail.com, Khem Raj <raj.khem@gmail.com>,
        Vinay Kumar <vinay.kumar@blackfigtech.com>,
        "Wold, Saul" <saul.wold@windriver.com>,
        Martin Jansa
 <martin.jansa@gmail.com>, paul@pbarker.dev
References: <38fa346a-0a95-2d6a-e842-c7b0e9fd8ff4@windriver.com>
Message-ID: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
Date: Wed, 11 Aug 2021 09:14:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <38fa346a-0a95-2d6a-e842-c7b0e9fd8ff4@windriver.com>
X-ClientProxiedBy: CY5P221CA0072.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:4::41) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by CY5P221CA0072.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 13:14:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 367dbc5a-a99a-4554-100a-08d95cc9ed7c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB25394DF9369F0791A8731739F8F89@DM6PR11MB2539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q/FcQaj3g2FxUDvIrPyxbfLQzKWZEtlKqQg5A8YtQtDC1iatSF7YnCN5UOpGFl5xQzRjz71JF0qIgWocpWNtL7g9DzfZPyWpJixFbKu6t6AWMibgk7d133FaEdvhG8MEiu5PnlxabpnYXEIr8EEGGP7qYvMW7uplomkt6EHbB6DRDasxT68RaBSuckSMk1OGC9NHHJbz+WpRtSMje2SOuoZ5LTYZ9bEVPGFt22BaJ9tWMPiNbfvjxSwS7Kf8E2/Qzgnn5Qw8ydozl/gBvN2SiHEmIuz1HmULZxEbebQ9n3U9qoW7kXZr0ZOS/JtOZucSaLdrzgJyEoPAxE3IZnzn81BNV/MKQt09uo9+wtrqb6H14LPMaDWE2i0JpUsu1v+MVcS5di0T1dI8+QncPRn6+Gmo8wjywC7p1cLYhVm3MfG0PJggYB+dj7d5rgXb2W751tcXhxaYd3KB0qikluTQZxFTsTt9HvlIYRferdLdkNn59LfnwkuzMxZoZjLywhLwHSr7tzel6LdipCj0N9mwQlwZLnCdIQkzZ+mcWCuQEk/S6vuzDYNgqyGlaCkOMBRp5EJTqJhpybbNwiMnybsQW5eoG+GI5PtHdAMWL4ln2r5VzQngDizmxS+p/purO7txK8FTXH7AbSql8F7Meen6SmlfZ/ccKj6fCjuN6i3fTvfLSRe0onq9q84rv891n9SMRQm+BU6RAyEK+LnwHVWrastxTHJzp3ylewuocsanOpmoPgTN7Ipe9W6sNZ5YLeJfdxOu6h8tL4VvBsv23AwNKoXiHtihDKG6lBKfMzVd34bTCFNWgRFx9l4QoaBXbkBzUPL2h+IRdY3KRqBo0ex2jXy0QOhx4epSCyWQlKxM/oMWkRVl5coYv4AK4YJFm1U2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6916009)(316002)(956004)(38100700002)(38350700002)(36756003)(54906003)(52116002)(26005)(16576012)(2616005)(53546011)(6486002)(31686004)(31696002)(6666004)(8936002)(7416002)(966005)(186003)(66476007)(5660300002)(66556008)(66946007)(30864003)(8676002)(4326008)(86362001)(2906002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHdFcnVCTkk5ZHdYampWcTFjUmkwL1N1RTB1M0ZsVTZ0SjEwTGVuL3VjRG8r?=
 =?utf-8?B?b3ZuZjh4Z3pIaGU2Vzd3TjBhdXhyOWlqbmh0aHFzZ1ZnVWEzNVdoVzMzckNK?=
 =?utf-8?B?RndqSnRrdmF6dlp4aWhPK2NkRWptVDdNNXJ4REpGa2liWk12c0N5a3Jid2Vq?=
 =?utf-8?B?Vy9LTGZoYmJQRGtqRnp1N1JOc096WjdRL2VzMEJCelZnZThQVHhWakFTOUtL?=
 =?utf-8?B?ZENXWXBHSk16blRieWc0ZDFHVVpoZWVyVnZyL0tmcUVJS2g0OTF6N2h5Y1Qv?=
 =?utf-8?B?clJ5L0lQRzQrY1VySkFueUQyZUpEQnk2S0thTENNZVlqWkU2dHpzZEd2d3FR?=
 =?utf-8?B?TUdjWTh1VWFLdkMxL3FieWFWdnlOcW1aeUFiamdjaWJORE1oNmJoOHhuZWVN?=
 =?utf-8?B?bkZPVUl3aEhUOUw4enhDdEtKa2dLZDlnSXk5QlRLcVVqZWRTM3NxcVZVM3o5?=
 =?utf-8?B?bUlaN1V6ejFhcFJwcU9UeTY0eHlqaDkxeHc4Ynk1RXF4d1pOaWt0bGtLOG9l?=
 =?utf-8?B?ZVRIV3BlSlduWFgyczE1aCs5enhWc2VSM1Q2dklLeFI4QUJYcEM2TFJubzF6?=
 =?utf-8?B?b0xrNlc2bTBZTktWN0VjLzZBWkxxZmNnbGhVV0c2SUdGR0xMa3h4Q2poOUFV?=
 =?utf-8?B?TldmeTlmUmZ6VTQ1UHhra1p0UWthQkpJUzdnRzJwUUZXQ1FmOHZxcDdCV0pP?=
 =?utf-8?B?cWY0WERVd2lxb1QwNS9ESDViUFZ6ODdIRHdqZ3Z1OFRSdmkveS9rZmxXd3I2?=
 =?utf-8?B?VjJkdEFhVzM4LzNOZTdWa21VRGMzZWl5WWtySkpMSWJJaHRnTU9vNElGdjZo?=
 =?utf-8?B?OGt5cjZEcUFxcEFFajV0c1BSLzBXVmJXeEh1SG5JUE9aVWN3WFdoNE95LzY0?=
 =?utf-8?B?V3BSbiszeWRtRW15ZTE1QXArekxXZkdkaVkzMW5heHVYT21hK2U2T2FsU0hF?=
 =?utf-8?B?NzluWmFvMFZ4UkZaZnJNUkwwdDdCS1FwRmhqaWx5Qk01TS9SSmo5WSsyWkdW?=
 =?utf-8?B?dWtWSWFZY0F0V3ZMeWVXNmhTa3RVTmsrbzB0eklyS0NaZFA1U0Jtb3BJMnpy?=
 =?utf-8?B?SzJoVi84dXljZXZ4UFY3Mk8zVkJONmlaZXVrTFFKY2NrcVhwekV3L3M4aVIx?=
 =?utf-8?B?b1F0UXlYVFhjK09sclp0UnpsaFRyUEpJZXNuR0ZPdy95K2E2NXpHVUYrRHE3?=
 =?utf-8?B?RHZpTXloSnc5Y1pzbjUxTjBZaE5yMHJyc0NDcVJ1ekozTHZjSUMrM2t2UmhX?=
 =?utf-8?B?UVFsMkplWDFVSW9RSlRNQ2JWa1habnRlcjFlYitkWWxHTzZtYzgrelVRRnkv?=
 =?utf-8?B?QzUvTVAveDNzNDBZSFRoK29oRWxZLzcwMFBIY1c4cEJoeFhUcytNT2Juc3VP?=
 =?utf-8?B?UjVTTWd3alBKbHhOV1FTOE9xVXNVSkRxWmthejdCeEVxS1hLLzI0cFM2NnNY?=
 =?utf-8?B?U216a1pybU5OU3Rpa1gzL3NrMFJQK05EeWlWbUVQSHMyMkt1LzhVSUg0RG5Z?=
 =?utf-8?B?NXl5T3BFUUNDTE1jZ1NzSVJZMzY1UVNja0dvS0d4L0M5K1U0UTFmT2JMTkhs?=
 =?utf-8?B?YVEwNDdGZXBEVGZBMlFIZEhTSGV6QmNNWVQ1WjBGWjh6a0tTQnIxOHdwOU8w?=
 =?utf-8?B?cnhDb1B3bGlXUHdOeCswakIyQ05xYlFrc0ZITDNYQnJuSmZjSmlnOGx1aENv?=
 =?utf-8?B?V2tvbjl2TjFwNTBjN1V1TCt0Q2FLemZXODFaVHBZSks2SlA1T0s5aW5KOWJR?=
 =?utf-8?Q?OEHDZSU8B9sdHH+bMOD74uQmEhJEDyTsA5hkVWs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367dbc5a-a99a-4554-100a-08d95cc9ed7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 13:14:19.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QeY/1KooCqaVLMAaHLkBh41EBAX1v4zhDSOrFRB7BTpGqiPI9UBcFahTTfbt7bfNKfMxligeU0Ov92gQSD1ERGR2xd5FkgU6qxM4bzrWmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2539
X-Proofpoint-ORIG-GUID: 4obQ2K13ZRTWcSsac3UYtLLhKtx1Sy9Z
X-Proofpoint-GUID: i7McwQNx4mmL0prvQSkZGGj39zapGfig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-11_04,2021-08-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110090
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17BCxeCL031757
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-08-10 8:22 p.m., Randy MacLeod wrote:
>=20
> I started working on the merge of meta-rust to oe-core again.
>=20
> CCing widely at the beginning this time.
> Please reply to me privately if you want to be dropped.
>=20
> I really need other people to sign up as [co-]maintainers!
>=20
> I pushed what I did today to:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleo=
d/rust-redo-aug-10-2021-a=20
>=20
>=20
> $ git log --stat below.
>=20
> I've only started but so far, what I see is that, as expected,=20
> rust-hello-world works for
> qemux86-64, qemuarm and likely other targets. I'm doing a buildall-qemu=
=20
> overnight.
>=20
> The oe-selftests that we had problems with before are still a problem:
>=20
> oe-selftest still has at least three tests failing:
>=20
> 1.
> oe-selftest -r distrodata.Distrodata.test_maintainers
>  =C2=A0 This is due having two versions of cargo and rust.
>=20
>  =C2=A0 --> I'll remove 1.51 unless people object.
>=20
> 2.
> oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
>=20
> I've just started to look at these test failures.
> $ bitbake-dump-sigs shows a diff like:
>=20
>  =C2=A0List of dependencies for variable BASEDEPENDS is set()
>  =C2=A0List of dependencies for variable BUILD_AR is {'BUILD_PREFIX'}
> -List of dependencies for variable BUILD_AS is {'BUILD_PREFIX',=20
> 'BUILD_AS_ARCH'}
> +List of dependencies for variable BUILD_AS is {'BUILD_AS_ARCH',=20
> 'BUILD_PREFIX'}
>  =C2=A0List of dependencies for variable BUILD_AS_ARCH is set()
> -List of dependencies for variable BUILD_CC is {'BUILD_PREFIX',=20
> 'BUILD_CC_ARCH'}
> -List of dependencies for variable BUILD_CCLD is {'BUILD_PREFIX',=20
> 'BUILD_CC_ARCH'}
> +List of dependencies for variable BUILD_CC is {'BUILD_CC_ARCH',=20
> 'BUILD_PREFIX'}
> +List of dependencies for variable BUILD_CCLD is {'BUILD_CC_ARCH',=20
> 'BUILD_PREFIX'}
>  =C2=A0List of dependencies for variable BUILD_CC_ARCH is set()
>=20
> Tips welcome!
>=20
>=20
> Btw, I know that the rust community is working on reproducibility:
>  =C2=A0=C2=A0 https://github.com/rust-lang/rust/labels/A-reproducibilit=
y
> This diffsigs problem may be related but I haven't looked at the issue=20
> long enough yet to tell.
>=20
>=20
> 4.
> I'll run a test on the autobuilder to see if the debian build from Feb=20
> is still a problem:
>  =C2=A0 rust-native doesn't build on debian8:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/s=
teps/13/logs/stdio=20
>=20
>=20
>=20
> I'll run buildall-qemu rust-hello-world overnight.

Results below.

Vinay or I will look into glibc/qemuppc64
if no one else is working on that.

The musl build failures are all alike with the error shown below.
Has anyone see that before?

../Randy


BUILDALL-QEMU LOG FOR rust-hello-world

START TIME: 2021-08-10_17:23:20

HOSTNAME: ala-lpggp3

HOST OS: Ubuntu 18.04.3 LTS

HOST KERNEL: 5.4.0-80-generic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

BUILD RESULTS:

[glibc]

PASS: qemuriscv32

PASS: qemuarmv5

PASS: qemumips

PASS: qemux86-64

PASS: qemuarm64

PASS: qemumips64

PASS: qemuarm

PASS: qemuppc

PASS: qemuriscv64

FAIL: qemuppc64

PASS: qemux86

[musl]

FAIL: qemuriscv32

FAIL: qemuarmv5

FAIL: qemumips

PASS: qemux86-64

PASS: qemuarm64

FAIL: qemumips64

FAIL: qemuarm

FAIL: qemuppc

FAIL: qemuriscv64

FAIL: qemuppc64

FAIL: qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

PASSED: 12

FAILED: 10



---

Typical musl build failure log:

Sstate summary: Wanted 62 Local 0 Network 0 Missed 62 Current 142 (0%=20
match, 69% complete)=20


NOTE: Executing Tasks=20
=20


ERROR: rust-cross-arm-1.54.0-r0 do_prepare_recipe_sysroot: Error=20
executing a python function in exec_python_func() autogenerated:=20


=20
=20


The stack trace of python calls that resulted in this exception/failure=20
was:=20


File: 'exec_python_func() autogenerated', lineno: 2, function: <module>=20
=20


      0001:=20
=20


  *** 0002:extend_recipe_sysroot(d)=20
=20


      0003:=20


File:=20
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/sta=
ging.bbclass',=20
lineno: 582, function: extend_recipe_sysroot=20


      0578:                    if "/bin/" in l or "/sbin/" in l:=20


      0579:                        # defer /*bin/* files until last in=20
case they need libs=20


      0580:                        binfiles[l] =3D (targetdir, dest)=20
=20


      0581:                    else:=20
=20


  *** 0582:                        staging_copyfile(l, targetdir, dest,=20
postinsts, seendirs)=20


      0583:=20


      0584:    # Handle deferred binfiles=20
=20


      0585:    for l in binfiles:=20


      0586:        (targetdir, dest) =3D binfiles[l]=20
=20


File:=20
'/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/classes/sta=
ging.bbclass',=20
lineno: 149, function: staging_copyfile=20


      0145:    if os.path.islink(c):=20
=20


      0146:        linkto =3D os.readlink(c)=20
=20


      0147:        if os.path.lexists(dest):=20


      0148:            if not os.path.islink(dest):=20
=20


  *** 0149:                raise OSError(errno.EEXIST, "Link %s already=20
exists as a file" % dest, dest)=20


      0150:            if os.readlink(dest) =3D=3D linkto:=20
=20


      0151:                return dest=20
=20


      0152:            raise OSError(errno.EEXIST, "Link %s already=20
exists to a different location? (%s vs %s)" % (dest, os.readlink(dest),=20
linkto), dest)

      0153:        os.symlink(linkto, dest)=20
=20


Exception: FileExistsError: [Errno 17] Link=20
/ala-lpggp31/rmacleod/src/distro/yocto/b/rust-aug-10-master-redo-a/tmp/wo=
rk/x86_64-linux/rust-cross-arm/1.54.0-r0/recipe-sysroot/usr/include/c++/1=
1.2.0/arm-poky-linux'

=20
=20


ERROR: Logfile of failure stored in:=20
/ala-lpggp31/rmacleod/src/distro/yocto/b/rust-aug-10-master-redo-a/tmp/wo=
rk/x86_64-linux/rust-cross-arm/1.54.0-r0/temp/log.do_prepare_recipe_sysro=
ot.73161=20


ERROR: Task=20
(/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/recipes-dev=
tools/rust/rust-cross_1.54.0.bb:do_prepare_recipe_sysroot)=20
failed with exit code '1'

NOTE: Tasks Summary: Attempted 755 tasks of which 645 didn't need to be=20
rerun and 1 failed.=20


=20
=20


Summary: 1 task failed:=20
=20


=20
/ala-lpggp31/rmacleod/src/distro/yocto/poky-contrib.git/meta/recipes-devt=
ools/rust/rust-cross_1.54.0.bb:do_prepare_recipe_sysroot=20
=20


Summary: There was 1 ERROR message shown, returning a non-zero exit=20
code.

>=20
> Thanks,
>=20
> ../Randy
>=20
>=20
> $ git log --stat origin/master..HEAD
> commit 725c11999a38244cc28e1d1fe17a7e05c5bdb7a3
> Author: Randy MacLeod <randy.macleod@windriver.com>
> Date:=C2=A0=C2=A0 Wed Feb 24 20:48:23 2021
>=20
>  =C2=A0=C2=A0=C2=A0 maintainers: Add myself as maintainer for rust pkgs
>  =C2=A0=C2=A0=C2=A0 I'm willing to do the rust package maintenance but
>  =C2=A0=C2=A0=C2=A0 if anyone else wants to sign up, that would be welc=
ome.
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriv=
er.com>
>=20
>  =C2=A0meta/conf/distro/include/maintainers.inc | 10 ++++++++++
>  =C2=A01 file changed, 10 insertions(+)
>=20
> commit a658c5c7fac6160f7720bbf30ae35ccc143fcb57
> Author: Randy MacLeod <randy.macleod@windriver.com>
> Date:=C2=A0=C2=A0 Wed Feb 24 20:48:22 2021
>=20
>  =C2=A0=C2=A0=C2=A0 cargo/rust/rustfmt: exclude from world
>  =C2=A0=C2=A0=C2=A0 cargo, rust, and rustfmt can't be built for the tar=
gets yet
>  =C2=A0=C2=A0=C2=A0 so exclude them from world builds.
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriv=
er.com>
>=20
>  =C2=A0meta/recipes-devtools/cargo/cargo.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
>  =C2=A0meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 2 +-
>  =C2=A02 files changed, 2 insertions(+), 1 deletion(-)
>=20
> commit 8860562733d7cce3cede27fc611f984a2d9351d6
> Author: Randy MacLeod <randy.macleod@windriver.com>
> Date:=C2=A0=C2=A0 Wed Feb 24 20:48:20 2021
>=20
>  =C2=A0=C2=A0=C2=A0 rust: update the README to conform to being in oe-c=
ore
>  =C2=A0=C2=A0=C2=A0 Provide the full link to the meta-rust issue since
>  =C2=A0=C2=A0=C2=A0 the README is no longer part of meta-rust.
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriv=
er.com>
>=20
>  =C2=A0meta/recipes-devtools/rust/README-rust.md | 25 +++++++----------=
--------
>  =C2=A01 file changed, 7 insertions(+), 18 deletions(-)
>=20
> commit 7398219dcfffe746038d36bbbaacbd52265a3fc7
> Author: Randy MacLeod <randy.macleod@windriver.com>
> Date:=C2=A0=C2=A0 Wed Feb 24 20:48:18 2021
>=20
>  =C2=A0=C2=A0=C2=A0 rust: mv README.md to recipes-devtools/rust/README-=
rust.md
>  =C2=A0=C2=A0=C2=A0 Import the meta-rust/README.md but relocate and ren=
ame it.
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriv=
er.com>
>=20
>  =C2=A0meta/recipes-devtools/rust/README-rust.md | 69=20
> +++++++++++++++++++++++++++++++
>  =C2=A01 file changed, 69 insertions(+)
>=20
> commit 80586a849e1c725310f58ed9705febf97bc00bda
> Author: Randy MacLeod <Randy.MacLeod@windriver.com>
> Date:=C2=A0=C2=A0 Tue Aug 10 13:52:19 2021
>=20
>  =C2=A0=C2=A0=C2=A0 rust: initial merge of most of meta-rust
>  =C2=A0=C2=A0=C2=A0 In the meta-rust repo at commit:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 448047c Upgrade to 1.54.0 (#359)
>  =C2=A0=C2=A0=C2=A0 Make the required directories:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir ../oe-core/meta/recipes-devtools/=
rust
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir ../oe-core/meta/recipes-devtools/=
cargo
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir ../oe-core/meta/recipes-example
>  =C2=A0=C2=A0=C2=A0 and then:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp recipes-devtools/rust/* ../oe-core/m=
eta/recipes-devtools/rust
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp recipes-devtools/cargo/* ../oe-core/=
meta/recipes-devtools/cargo
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp lib/crate.py ../oe-core/meta/lib
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp recipes-example/* ../oe-core/meta/re=
cipes-example
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp conf/distro/include/rust_* ../oe-cor=
e/meta/conf/distro/include/
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp classes/* ../oe-core/meta/classes/
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp recipes-core/packagegroups/packagegr=
oup-rust-cross-canadian.bb=20
> ../oe-core/meta/recipes-core/packagegroups
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriv=
er.com>
>=20
>  =C2=A0meta/classes/cargo.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 89 ++
>  =C2=A0meta/classes/cargo_common.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
29 +++
>  =C2=A0meta/classes/crate-fetch.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 13 +
>  =C2=A0meta/classes/rust-bin.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 149 ++++
>  =C2=A0meta/classes/rust-common.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 174 ++++
>  =C2=A0meta/classes/rust.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 +
>  =C2=A0meta/conf/distro/include/rust_security_flags.inc=C2=A0=C2=A0 |=C2=
=A0=C2=A0 7 +
>  =C2=A0meta/conf/distro/include/rust_versions.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +
>  =C2=A0meta/lib/crate.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 149 ++++
>  =C2=A0.../packagegroup-rust-cross-canadian.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +
>  =C2=A0.../cargo/cargo-1.51.0/0001-Disable-http2.patch=C2=A0=C2=A0=C2=A0=
 |=C2=A0 28 +
>  =C2=A0.../cargo/cargo-1.51.0/riscv-march.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 73 ++
>  =C2=A0.../cargo/cargo-1.51.0/rv64gc.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 37 +
>  =C2=A0.../cargo/cargo-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 74 ++
>  =C2=A0.../cargo/cargo-cross-canadian_1.51.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0.../cargo/cargo-cross-canadian_1.54.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0meta/recipes-devtools/cargo/cargo.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 50 ++
>  =C2=A0meta/recipes-devtools/cargo/cargo_1.51.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
>  =C2=A0meta/recipes-devtools/cargo/cargo_1.54.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>  =C2=A0meta/recipes-devtools/rust/files/riscv-march.patch |=C2=A0 73 ++
>  =C2=A0meta/recipes-devtools/rust/files/rv64gc.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 37 +
>  =C2=A0...001-Add-base-definitions-for-riscv64-musl.patch | 904=20
> ++++++++++++++++++++
>  =C2=A0...-linux-musl-mod.rs-add-riscv64-to-b64-set.patch |=C2=A0 29 +
>  =C2=A0...3-FIXUP-Correct-definitions-to-match-musl.patch | 740=20
> +++++++++++++++++
>  =C2=A0...pdate-1.51.0-checksums-for-modified-files.patch |=C2=A0 21 +
>  =C2=A0.../0004-Update-checksums-for-modified-files.patch |=C2=A0 21 +
>  =C2=A0...-definitions-for-riscv64-musl-libc-0.2.93.patch | 905=20
> +++++++++++++++++++++
>  =C2=A0...-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch |=C2=A0 31 +
>  =C2=A0...ect-definitions-to-match-musl-libc-0.2.93.patch | 741=20
> +++++++++++++++++
>  =C2=A0...ksums-for-modified-files-for-rust-1.54.0-.patch |=C2=A0 23 +
>  =C2=A0meta/recipes-devtools/rust/libstd-rs.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 +
>  =C2=A0meta/recipes-devtools/rust/libstd-rs_1.51.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 12 +
>  =C2=A0meta/recipes-devtools/rust/libstd-rs_1.54.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +
>  =C2=A0meta/recipes-devtools/rust/rust-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 346 ++++++++
>  =C2=A0.../rust/rust-cross-canadian-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 ++
>  =C2=A0meta/recipes-devtools/rust/rust-cross-canadian.inc |=C2=A0 78 ++
>  =C2=A0.../rust/rust-cross-canadian_1.51.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0.../rust/rust-cross-canadian_1.54.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0meta/recipes-devtools/rust/rust-cross.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 71 ++
>  =C2=A0meta/recipes-devtools/rust/rust-cross_1.51.0.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +
>  =C2=A0meta/recipes-devtools/rust/rust-cross_1.54.0.bb=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +
>  =C2=A0meta/recipes-devtools/rust/rust-llvm.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 63 ++
>  =C2=A0.../rust-llvm/0001-nfc-Fix-missing-include.patch=C2=A0=C2=A0 |=C2=
=A0 26 +
>  =C2=A0.../0002-llvm-allow-env-override-of-exe-path.patch |=C2=A0 32 +
>  =C2=A0meta/recipes-devtools/rust/rust-llvm_1.51.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 7 +
>  =C2=A0meta/recipes-devtools/rust/rust-llvm_1.54.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 5 +
>  =C2=A0.../recipes-devtools/rust/rust-snapshot-1.51.0.inc |=C2=A0 18 +
>  =C2=A0.../recipes-devtools/rust/rust-snapshot-1.54.0.inc |=C2=A0 18 +
>  =C2=A0meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
>  =C2=A0meta/recipes-devtools/rust/rust-source-1.51.0.inc=C2=A0 |=C2=A0=C2=
=A0 3 +
>  =C2=A0meta/recipes-devtools/rust/rust-source-1.54.0.inc=C2=A0 |=C2=A0=C2=
=A0 3 +
>  =C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
>  =C2=A0meta/recipes-devtools/rust/rust-target.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
>  =C2=A0.../rust/rust-tools-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 38 +
>  =C2=A0.../rust/rust-tools-cross-canadian_1.51.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0.../rust/rust-tools-cross-canadian_1.54.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>  =C2=A0meta/recipes-devtools/rust/rust.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 193 +++++
>  =C2=A0...t-Fix-dash-vs-underscore-mismatches-in-op.patch |=C2=A0 75 ++
>  =C2=A0meta/recipes-devtools/rust/rust_1.51.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
>  =C2=A0meta/recipes-devtools/rust/rust_1.54.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
>  =C2=A0.../rust-hello-world/0001-enable-LTO.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23 +
>  =C2=A0.../rust-hello-world/rust-hello-world_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 17 +
>  =C2=A0meta/recipes-example/rustfmt/rustfmt_1.4.2.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 171 ++++
>  =C2=A063 files changed, 5977 insertions(+)
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
