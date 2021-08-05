Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2469.1628122419956847372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 17:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=b9mGh4YV;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3851ff85d9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1750BuMv026772;
	Thu, 5 Aug 2021 00:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6XS7Z4l895jU0qRAA810QA2yYcy1sYACJezA2rqCr44=;
 b=b9mGh4YVzpvofWj8lX60i4wKTZBRKcNHYP1BkQV2MDvRSa0XPRJUtaxhur7nMqS4kxTh
 qxlLeQPvRqnh3o6GQrXSXkq6fNbKxJpslV5gpIy1fujcdVbrYrRYPUJkFdkBBvLpcnfI
 cUnbEk7EvO2UVeFJKc4pUR5erGXR2ao7JFE5xmJEILtM52MtZ46QO1eTNUt1lQEl3q01
 eLRKGscuMlDRLfrAXviWfkSUOjJ//Vuy6Ftqhg6SWHzTBqRwmPWozK8uZ8DMCwZKt150
 +2T2vetLc9AeT3X28NXFqETJw9lKfcrCUAz39sdfHAgmtABxlCkL+JAsQjPm5Y7TgJSh zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718au6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Aug 2021 00:13:38 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1750DcOa029246;
	Thu, 5 Aug 2021 00:13:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718au5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Aug 2021 00:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSyS4Fs6c4L1GLHT/957SN/o3iT58Kw7BHh9BFLwpPuOS8b5GBOmTrn8EYO3oFAmolal6EiVSHsPtthU4VlXgft//Cn8B9rPNNJvByjDX9xcWEtyIDRxtRfgmHoA3oW8Vyv2MhJz4vMZyGz1lwjIXKn75RNvreCcJJ3i5Z8cf7RZwFk7dniESy3Yo2iacSx4I6JLjJYiM7jgg3C+J2DXBHkU1MOv8IQqo1iUgmxGHOiMa3sa/lLQLscBqEASgVXTprZbF/UcwXBuhSnytNGxiidQUPe6U5nPetisdOwqIt4CHQkC67n23hMux4Y0Rr6Ve0oZIdAm6WUr9h9mBYmxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XS7Z4l895jU0qRAA810QA2yYcy1sYACJezA2rqCr44=;
 b=ZbqMKk+POycIbXElsyMAdK/dNC2I5SuwElmTzmE1AbHxHJZfFfV1Iv/kxHlq37FIRXsYtLovuLutiO66uO54nOWPfT4N43uvQH9hwSWg+yGjbmJNV4PgMGIJztkQY0oNPV3eJBuJDMID+t+ikCe/gfXjdt/Z7LYVu9cLT18PW17W3teK/KVx4UBQI2pOmuZZ//Q1OBkGO9m7mmZtmtp6Ji6yIGtT8amUUDINps3t3MudQAOKH4HbHVWnyWuKwpBGyML1dG+xG0Tno/jdg84x7pX1c7vylDf4DPrrBkpJ486y3FdWtB6YDwMwlxxrgVjov4eO5JwJ5oJda8ve9zv8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 00:13:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 00:13:36 +0000
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
To: Tony Battersby <tonyb@cybernetics.com>,
        openembedded-core@lists.openembedded.org,
        openembedded-devel@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
Date: Wed, 4 Aug 2021 20:13:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:33f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12 via Frontend Transport; Thu, 5 Aug 2021 00:13:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc01d96e-ba30-439a-8dbd-08d957a5de53
X-MS-TrafficTypeDiagnostic: DM6PR11MB4724:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4724014E29BB27283766B673F8F29@DM6PR11MB4724.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tm4rTBx3yAhnAivJYw2FfzIY02eN+OuEtDMcKRE7NHVGkDXgLz18tIg4bSMEji9mPRScojeTAbB//5+ILZ+spUkjOh3bv0yORzAyDwn+Xu5vkBmyoHVJC6NLTIzN9gamdIufqxJW4mLKCVVO5ZyQbxS9xc3s144rpBaljr8nf4NUEvJhSDwxG4p3XOz29lW7isYa0LIoOIsQ2Li/GM04+5zgKwHhqsmiFXoCcKVf+oZgbajUmJIcEnR7CpKmoUr0WKGDcFASnF5PHGMF+Zw8kE3vjSp1u7QltVQAYqXy58qwcbMZadPSo5zgwZUfhoXOE6CkNVd4jRB4ZeFZyBFAEdDC9LmL7hpN5IdJgTPkIYucSXWjX5eYRCEyGGxszlf1v7RA0dnC1WbZEK5MA7/RQzLkIF7i7Mg6Mtzl54K9u6KO8DWb9Obe5jjnp0k1d//yREvmTb7N7GkN0R3g7I74slpOTsOhEKX20CsuobynbqoMJIPudWIq8DriOBMNbB3rA/nl5rnEDx9Lk3XUd1Zg51mXM8wTnFpXv2br3lbsMZMaSWfMhnDdYDs90u0Q8NTYirb3mb962ZMdhTCK75T0i5nbtoRkghn9AxHfcS6opV8CXJ7NQRTSE6342spOToJlD9B9ZacFH1UTQlVfqsHAp3he7jfzybqya/urFwUeXxo2I+bpJpCFb8ZnBJUJd52DN6/PCIa+2WFKzwglyo7521CVrogOLXpxKYCjNQ7QJ7VssxNEjTiyTnst9PlZv55mBbFUFZokiN6eTkZ8PtdGYOjq06RIlS8o5IH+1sjpEG0axpfknso1zCKyYyeQQGPGs4mWs3F9RHekp/Y7140yCXoOLETVmLwS8i6JkDvrsISl4NBUBajwKX/1t96i3qQwqsV5c40BSqnyEmLTFavPKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(38100700002)(8936002)(31686004)(6666004)(38350700002)(52116002)(6486002)(966005)(66476007)(53546011)(26005)(8676002)(66556008)(66946007)(110136005)(83380400001)(316002)(36756003)(508600001)(956004)(186003)(16576012)(5660300002)(86362001)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTlRdEN0Ukl1dFU1eUJqRHJFcEZGYllnWTFZVHhsV3MyQTRkQ3ltUTZYb2ha?=
 =?utf-8?B?SDcrNzNhUmIvVXN2VC9VM2FjcU1WTDlUaVpCZFlJKzBnd1cwR3pCRUpRMzJU?=
 =?utf-8?B?N29qWm5pcGI5V25UT21VRys2SCs0SUFEMDFnNUtwMEFpbFpEazdTYlAxR3d0?=
 =?utf-8?B?dkRZRFUxdnJFQWVFTWFhQjc0R2VaS1ljZ3pyTmk0eExMOXFwd2ZvMDZKTUpB?=
 =?utf-8?B?cjhmTFEvb1czUEtiM0dnYXVxVnliVWtydVJwZjNrU0FobGhJVXVSS3dWaW1G?=
 =?utf-8?B?L2dnVkNvVDJ2NUhvcWVIQWkrR2ZzMklZeldIKytOODJjMXllWkNlS3o2UFJr?=
 =?utf-8?B?U0x6RndMR2dMalRDOC9LbzhhUytkdTR6S3g3Zmc1VmNKWWxkT1ZDVVgzSC90?=
 =?utf-8?B?Mi9vYllETVRRZUh0MjBpUDFyY3prd2w2Y3NuMk00aVhFcjlMc0xrYXFEWkZR?=
 =?utf-8?B?YUtOT0dPYWlMV3QrOTZteW5QbW5DQWlHcmd5Tzh1MVFlK1p1YW5WTVpMcXIv?=
 =?utf-8?B?L2lCQ05FMTF5clM0Q0RCWE1oUlNFZ1ZUVDA2bVBrOWxCRzJmR0UxRkp4R1FG?=
 =?utf-8?B?bytvejh3a20vQjhrN2VDa0UveCtydFhqYXdlT1pMc2VMS0gxK0dia3p1R2NY?=
 =?utf-8?B?R2hNY2E4d09mQktacVJRTDdENnlEUHpSQkIwQkFFWjBuajF5T3A3VzBzb1Fp?=
 =?utf-8?B?WTUzakkzbXgzNUUwZ2xEdzkwV2lYeXZTRHMrY2pRUFp5VXJ2MlpoRERWT3ZL?=
 =?utf-8?B?a0FGalk5Qm52ejdJRWljdWVIQ3V5RjcwUnFtWGFJNGNVSmFBbWpHYTlGd01a?=
 =?utf-8?B?Z3pCUzRqY0orNXFDZFJTcytmdUgyc2ZocDl1QXVmb3llYXNlekFpS3F2MzQv?=
 =?utf-8?B?V2I4Nm4vMzY5YkhkK1pxRUFBb1ZOYzI2YlFPQ0tHNGk0eFBHMitnbFA1alZH?=
 =?utf-8?B?c2FSNTVkSTcybVlTZXFQTldCS1V4a2I2K1IvWXlqbytSeTdiQXdVSXFpcUU5?=
 =?utf-8?B?cXNYM0JBck4yazNKNjJxbGxnNzVLanJmYzVjeDYxOGZReURBd0p3SHN0Nng4?=
 =?utf-8?B?d2hGNmY5dll1NlByaEVBaUp0SHpadmNHOWY3KzJtR1UyTVIvWDRST014YUxF?=
 =?utf-8?B?YTVmSXd0RmlrQXdVNGl2ZnQ2Y1VLd1dXV0VJenBQN1IydUNwajhkMFhsWEYr?=
 =?utf-8?B?ZmF2d3QzM05tODl6OUhaam5wYXhoMVZ2OC9TYktFWTdPQm44YlJyc0NqK3FQ?=
 =?utf-8?B?WlVVblpLOUU1U3pMZVVRUzkyWkVvVHQySk9PRkFZcnRMM293SEJGdUdXWHVU?=
 =?utf-8?B?RVVZRDdNQnBVQXF6RE8xYnJNOHkyanZQREZ4WjMzUkFNbzdvV0NnU2xEODNG?=
 =?utf-8?B?YkZrb1dQcWplTGtacGZNajliNFcyaGF3SDV3MGtnK3RneERuRDdGbFlmempq?=
 =?utf-8?B?V0NrNSsybFJ3T2ZaaVpQTUkwem8zZjRiYmxWSDdjdG9NRUpxRG9RaitHL0Zw?=
 =?utf-8?B?RWI2dkR5MjFCYXZ1NytkdkhNd0daSFcxcTVPc0NtTWEzTTlySTlmTWw1d1px?=
 =?utf-8?B?ai9aVllQTDVIU3Yvc0F1TGNoRnJPMW1EVkkrUXJVOXJVS0VKWTUyKzU3dFMy?=
 =?utf-8?B?VU1yQ3o4MGw3VkFqNTV1VFJ3MDAzci9QaGJiOFhIanRBTThHeEY1aXplNERK?=
 =?utf-8?B?SGpUajJKMjBjZG5rSkRpNDVXaGl6MCt2WFRyV3JwUXo5dHpad3p0cEVidFpr?=
 =?utf-8?Q?vLqaVJq6kTx82kiVE+/KsfHH7+5/xcj7yQkqs7u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc01d96e-ba30-439a-8dbd-08d957a5de53
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 00:13:36.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9z1q7icNTMCQs8xsbm/N7EFq7y2JkzDKWqqap71zCafH8axZkoMN13Zd4Q48VJGloZnHNX9Rq/WF8T1qD5biDHrlXgoqsUYkgBzv+CVAXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
X-Proofpoint-ORIG-GUID: VwP3LyqIG8skmxHNcXM7FYNXst_wh1TE
X-Proofpoint-GUID: njELKjm_hl-qU0hZKXdOSZQRy_ertmCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_08,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050000
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1750BuMv026772
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-07-27 9:34 a.m., Tony Battersby wrote:
> Currently, enabling Link Time Optimization via:
>=20
> require conf/distro/include/lto.inc
> DISTRO_FEATURES_append =3D " lto"
>=20
> makes the build non-reproducible (as in
> https://reproducible-builds.org/).=C2=A0 This patch set fixes some of th=
e
> problems, but is not yet a complete solution.
>=20
> This patch set addresses the following bugs:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490
>=20
> openembedded-core patches
> 1/4: lto.inc: disable LTO for grub
> 2/4: gcc: Backport patch to make LTO builds more reproducible
> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
>=20
> openembedded-devel patches
> 4/4: net-snmp: fix QA Issue after LDFLAGS change
>=20
> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
> TARGET_CFLAGS).=C2=A0 This could possibly be done differently, such as b=
y
> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.=C2=A0 Let me=
 know
> if there is a better/preferred way to do it.
>=20
> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
> included a patch to fix that.=C2=A0 Other packages might have been broke=
n as
> well, although I haven't found any others.
>=20
> With all these patches, there are still many shared libraries in /lib
> and /usr/lib that are still not reproducible with LTO enabled because
> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
> patch 3 when linking shared libraries.=C2=A0 /usr/lib/libbz2.so.1.0.6 fr=
om
> the libbz2 package from the bzip2 recipe is a good example.=C2=A0 I do n=
ot
> have a patch for that problem.=C2=A0 I will leave that to someone else.
>=20
> So this is what we need to achieve reproducible LTO builds:
> *) This patch set
> *) A fix for libtool
> *) Add LTO to reproducible builds testing if appropriate (e.g.
> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
> *) Fixes for individual packages, if needed
> *) Once everything works, update the documentation again (I previously
> requested a documentation change for this bug, which will eventually
> show up at
> http://docs.yoctoproject.org/test-manual/reproducible-builds.html).

This is certainly a few steps in the right direction with a good outline
of what's next.

I suspect that Richard has been busy with other things like overrides
and the update to glibc-2.34.

Do you have any suggestions or questions about what we should do
with this patch series Richard?

../Randy


>=20
> Tony Battersby
> Cybernetics
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
