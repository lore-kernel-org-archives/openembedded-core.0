Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9727.1629636311919225139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=dVgUV/uN;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38687bdd89=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17MCcdaL025959
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:45:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=dgybOBJHM7tgCYIRKtZjjO/P1Dz0Kp2d5Wh7TUeOEhs=;
 b=dVgUV/uNM7xdSbnKl8FpWZLHaxy6yQSCjie1LgHSfbJtl6H4LWnZSX5SnBg/2llnzIPe
 NCn0fowkMrNLbB3kBIaUneqHhpQ4z/3sVWlZZfMDTqB3zjMjbpM7fdf9mCSdXszzQYo4
 H3uWCV1KdfXy8Z6BBbYqUYH43kAird2n17L6Bb6lPUMSEKudXVn22KQTwXvtqioXusqS
 EqFrgyvAuIXEDosK7lG25TYEV/jSpK+qlChggublsRNE0QxpwZ85K1l/705+JEu3tk6h
 f9RlxmJcvaOc7vYlm5CdFe4K3fI/kezXYvtzI/zLTMg+rd5i7AJeeoobq39bm8sa8q3x kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ajvs5gmn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:45:10 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17MCjAqX006056
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:45:10 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ajvs5gmn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Aug 2021 05:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxZ0s3mMa8MkRQQpafgbyB8fBK3Jaq3RvMcBfARijFeyvtUfNx8PIBh35RbO4t0fSuWUfSQvkwYuc9WvdT7zz3LB8nC3isy2EL3lMq23fZJWxjyGSYcqKNIjjhwk9vb7h4SK6WtxXOndwk6zRbptS6t3vNofAXU2GUFytdCfcz2M5hEOl0wiOYrzfQeKMMTUu/gn2z9fVNOSg6jmItQeG9Js2f3VL7XptSTSE4q0tJGReS99czZrJpJZcLljTBqQBdzf5XYmwClBZz3CZuoGvKVXIWRRUS5HUXWALez06kMUA2WSct9OibMb9xljWvb86QwPR31SyozMmfiwfhiK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgybOBJHM7tgCYIRKtZjjO/P1Dz0Kp2d5Wh7TUeOEhs=;
 b=noYVM3ZU5jloxdFK9gQOXopO/5Hzm5gdlRPT+sPXluYpcp7OV/5s9g5LndsNtvQ7v/1kT1pgUUsWIQ2WNhuMl6Wo2V1k5hguRypLQlW3rtnR6w0OsDgXb1467aao5APbh+AXms8cRjws4R5oEAxozPKpVmz0gQlyATOTWU3uAbnkA29XmsqiWiFFI5nJuRQ1gxbb1goxE5mPJE1si2wcdZdIN62H+2yV0PxI2cpfSnXfEoxh1Q3IjQxXSaWNfEtaDW+tpD+8yEuaoc1NywJgkRMukFSWrnjDNhZ82AqavTE3oivVnmvdGH8X2oB2G12AANp07pPfJufCc5RN9e1URQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4155.namprd11.prod.outlook.com (2603:10b6:5:19a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Sun, 22 Aug
 2021 12:45:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4436.024; Sun, 22 Aug 2021
 12:45:06 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
        Trevor Gamblin <trevor.gamblin@windriver.com>,
        anbelski@linux.microsoft.com, Vinay Kumar <vinay.m.engg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org>
 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
Date: Sun, 22 Aug 2021 08:45:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:a03:3a0::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Sun, 22 Aug 2021 12:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e99f9fbc-2680-44a7-ae26-08d9656aab27
X-MS-TrafficTypeDiagnostic: DM6PR11MB4155:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4155925C1A9669346EAEEBCEF8C39@DM6PR11MB4155.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ch0ZbZArT+SKofwDDbnLdjCek+64OlVWqA5M9eau1cv6s4rE9Cy4Nx1hbysPamWKFYIq4Lg4zBzDiSG5+iVYD9HTgHpBpA81U989S9JWBqDkme1Qy+9OAh4tm+3Zz5vdARinnVMGURuKPwZUKnUDJZXjfDqaik+Adl/dMzplBVZP9C/xs+yd8MbnCTD9OyOy/XE09nxyHq8bcnBF4eRpuJOdw2FOgzbjlQQi9sHPjcyZ1+1Lv8MKYUaFOs72r7zGU7KlY5xCnncAbyvudkseNR5L+MHzzyFOxlPNKQPak59onzzQz0P+aYM5DjHaW5gDfoDFMXGxpFyJU1Db9bA6kzn7GC+QZdNO/3LpkuwKbiNpAwaOsW6VEYMtjh342mRi/GAee4OwQ7Xc4ZMiCSCC57I4PjQpVmAZmfKEtjZ4G79BfVjcMQrpcyVxTfTkOSFkBJ0+uzWfLjHSFzpvJRUlSqPiUBbGD8LbXGxQ2ENIxs9v2SYK8FPuSCEdk3OBgN0a3ZGUGgHSez3pws1ekN8/qvOCYC3+QmMsOvaHDzvMjMLbRsdP40L/QxBUgxYmlKJrcUdNLiru86JlXstuVGqRYffDDokbavSFws2XnG7GCQlATtkGrmC++4PAnS+mpa5UNQGESzHJ0PEZkXmkDV+ZH8GUqvLq/qGqKRwAi6NwIN6Lb55tPUB2FGKa+5qhMljB624Wj3jB1T9j69zGh+x4pdBKUwIlQEwV6W53mrY+JR+9FVJfxG8LDH24cNuZkaMrCBALlKYsKoZc8uXAmfn8kdRFpYXVudA9rAwQpc4zNnfg4M/OVIvji/Q39nyE6E60ujxrVyT/NT73Oa7SCuetjCsMA7XZwv4InkEhQTZ7HBA6LKYGFTUYOmg+V5ckZ9e+e5IigNTgHjVrRe6RDhaGJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39830400003)(366004)(346002)(396003)(4326008)(38350700002)(2616005)(8936002)(15650500001)(31696002)(86362001)(36756003)(8676002)(31686004)(2906002)(7416002)(956004)(38100700002)(16576012)(66476007)(66556008)(478600001)(53546011)(66946007)(966005)(26005)(186003)(54906003)(6486002)(110136005)(316002)(5660300002)(83380400001)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3lJalN4azJzR3MyU3hhM0xOblZMWTdQTURPWFNkS2tRK2FPQ0dxOFFWYmZH?=
 =?utf-8?B?djJ3aHpBZkN6MENkNHMwTXV5RWdpUjJlUFlVNzRYSk0yZlhtbnBGT0tFUVRx?=
 =?utf-8?B?V2tsNDkzbWV4M3ovRjVveUN0NUp6ejMyQlVmNEVVVlc4YmtYUFh0L0o2MkNZ?=
 =?utf-8?B?dTloaS9zRGgydXh5WklEdWZwc3dxNHhaTHkxSS9IL2tHS1lkVkUwOUNHWkty?=
 =?utf-8?B?TjhZSTdoWmlOd0VuWmtubldadndMQUVVNFdBZnlkVTd3STJiNU9pVjM4WmRW?=
 =?utf-8?B?OXdjUGExWmJsVnV4WVBpaDdoMW5rc041anhNd2JtNDdrcXdBTFVnci9RVkhZ?=
 =?utf-8?B?MmRBMkZHM2VBb29hOHpBOHRJUmhBSjA0MnBCdGxQYTV6Z0RNT3o2aGU2enBZ?=
 =?utf-8?B?RTM2WmhZOWlwOHYvN2tWekNDS2dSOWtvWHNzVSt6SHVsSEJZakZmYllRdWRQ?=
 =?utf-8?B?U3p1YVlhR3RVb1g1SURmUDErc0JOT2R3aWMvck05R0FzejV5RWZ2amJFWmtn?=
 =?utf-8?B?YUlTb1dDeGhmeW9Sc1p0Q3JFZmdTR01pbjRZaFJ1Rkp5RWgxM0pyaWFtWDF2?=
 =?utf-8?B?R0dMMlphTmhBRm9iaGlQVW0yTDVEMEkxMUdUZFdKeGljZjBrZkd5Nm1HV2Z6?=
 =?utf-8?B?N0YzajFLdXNnb3E4eHJyanE3T0hVaXlkenQwbVJndEhSUE5iMXVIM0Q2N0lS?=
 =?utf-8?B?cHJxallOL254MFpoamdqeGp3ajRBUmc2Y0RWQ2lyZk1mVHVKdHg0ZmJZRnFX?=
 =?utf-8?B?K1FjODZDb1QrMU9HbVlOMTZVcE5xdkF6cXg2VGhmTm1zYSs3dk41R2hBcUtm?=
 =?utf-8?B?OVJPMzV5YXI4ZGt3ZndPcGNhZHNpZ25pSHpvMmpOL0FiSWpLaVBreUhRaWVY?=
 =?utf-8?B?UkZjU3hFYWVBaDVmbVFIK1V2Z1dFdjViUDIydXhIZUhwa3pUNjAxbURPanVp?=
 =?utf-8?B?MDRZNGtJcHFzWS9hVDZJZ0JjQURyZ2M0a3h6MVVGY281UmMxNjJnekI1SHJ6?=
 =?utf-8?B?YlNFVGdtUmV0aWdOdTY0RnBJNkFlOWJCeVFCL3BMRmpJL292MEQwQ3ZKdXVK?=
 =?utf-8?B?cWlDTERNZG9Ka3lhRzNndllOVUcrdGptMzBQV05ZK0hXSVFIZUVvL1FZSU1x?=
 =?utf-8?B?R04wQ0JFN0E2NFZ3ZDZLNlVlRG1McEpXSlAyMVNwZWlXRHNjaUZ2ZHRUVWxG?=
 =?utf-8?B?allMKzVYamFoemRkdUY1NnlWMUczdXZ1YjlyK05YOWxlcWV5QUROQ3YxeWd1?=
 =?utf-8?B?Q0tab3FDcXBiRDR3WS9senFkNmgxQ1RSYjdtbXkzTUlpYWJKemZ0dlNBRHF6?=
 =?utf-8?B?KzVlTWJSWk03T3Vub2EyR1gxV1FZcktEWjYwWlVUdlNGWHdTUUxTby9HMXFU?=
 =?utf-8?B?ZEZQMm10WnFjN3FYRzAvZC9OMkdNaXI4Qyt2Z0VJWUhGTGJpQ2x6WENZZ0d3?=
 =?utf-8?B?ckZLQ0hBOC8rMEkzbFBxNG1TRXdKay9QSGNxUlc0K3p6L3ZkMEtYbnZXOHZY?=
 =?utf-8?B?WFhLQTl1NFpZekYwOEQ4dThsd21oaFJGVGlKNDFCcUVDMHd1TUVWNmpXRlNF?=
 =?utf-8?B?ZlFZU2NKb0ZIbTROTzRuV3k0bG4wWUVMZDRRUTRRL2NZTGo2RXZYeVExd0M0?=
 =?utf-8?B?U3JGbGg0d2xMc1BKbnhXQWY2TXArSE1qUks4K3FrY2JydnFxR1N5NVZrM2NJ?=
 =?utf-8?B?TGIxeThGc3ArMzk0cC92WXBiZHhFKy9KV3JyUk40NHo0UTRFQ21kbDhYOFNE?=
 =?utf-8?Q?7hWSoMx72IkFU1zHX/Zzio9Waf7GWopb+JfB3ck?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99f9fbc-2680-44a7-ae26-08d9656aab27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2021 12:45:06.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT4IzXDt4ZZPVfgJ+KsaVJ1eJa1+iVBp125bWBm4uQgG8O63Du0Keubn+/YFn2kHYt0AqZl7vkkK7xNuywZDw2LuFHzz73rqoOZUaZFVgY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4155
X-Proofpoint-ORIG-GUID: tgukpoGHBB7TsAlLmYNzBIwI2nhJShCR
X-Proofpoint-GUID: WqoJ9mK9WPUIOv620Gx7qnpRHY0vQ1r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-21_11,2021-08-20_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108220088
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17MCcdaL025959
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-08-22 7:19 a.m., Richard Purdie wrote:
> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
>> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
>> With a patch from Richard, and the http_proxy check removed,
>> $ git diff | grep "^[+-]"
>>  =C2=A0--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>>  =C2=A0+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>>  =C2=A0-http_proxy =3D "http://example.com/"
>>  =C2=A0+http_proxy =3D ""
>>  =20
>> we have fixed the oe-selftest that was failing.
>>  =C2=A0Any volunteers to stub out the http[s]_proxy code in cargo ?
>> I've written up a commit log that could use some review and pushed an =
update
>> to:
>>    =20
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacle=
od/rust-redo-aug-17-2021-a
>>
>=20
>=20
> I'm not sure you need to change cargo, I think if you remove the bit in=
 the
> bbclass that injects http_proxy, the tests are ok. That will perhaps br=
eak
> anyone using proxies but for now, I think that is a reasonable step of =
getting
> this moved forward?

That's what I hoped for as well but not what my testing showed.

I removed (commented out actually) the http_proxy injection here:
=20
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmacle=
od/rust-redo-aug-17-2021-a&id=3Da4808f787caf8d0b44cf3946cf204164f24f91d4

but the test still fails unless I mangle the test:

    meta/lib/oeqa/selftest/cases/sstatetests.py


    -http_proxy =3D "http://example.com/"


    +http_proxy =3D ""

../Randy

>=20
> I think there is one selftest issue left which is a multilib one.
>=20
> Cheers,
>=20
> Richard
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
