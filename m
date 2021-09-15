Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.59])
 by mx.groups.io with SMTP id smtpd.web08.9804.1631720604079935815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=uoYN1Ts5;
 spf=pass (domain: kpit.com, ip: 40.107.138.59, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btRiaqiACp9u7meypU19+YUxE+8LXOH/p96QWWH2i+NHlLskJZlzDtafk25/rnxohPl6rVVO6dK0VB16IyjZrzeFnKnvjuv8ffGdJ2oxfuq8jyGIRl9UbFW8kinZpyN8yAW8Qo1vr13+D9kD+WeaDaytizFXV/2pLLYkEM2yFTvqwVhXM9TzQr0gP/bI1qzidGrYPapnFWWNiHApbXp5fjZMJ3WZQmRE1ipFkwfDVlIU7wCG40Nk4sTMPYWCvfDYRcdlNzYoKMh1op3UUj7LNxPYRreI+vJIUqo7ZSmf9XeSKPPE3sGvBLRN3ZZ1DSgOLIYWFrYrPaPbImhG/PYs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wKeV/s/x4P43xg5OZmckZ5g0OuOCP6D612Rpn2YoBtI=;
 b=F4iJKXycwmny6lO0uK+tRprqPa0vpasDdCnN+mmHGGqZbNK8D+YAti0Hs9xIVczzZ1eLw4oA2kgLwnIpDUhhv806UPYOH9xFk5+jp/3kw55ZuNwvGvRjDJ7TA9EVXdhrktooQ3sclPodp/D9F5NkT5Toz9gFe5+l3P7bO+N0hgYaFiT3v1c47VC2DzBbGpNRSjkugxH9S67jlRjsR7B9s4Gfp4aDchp8Bh8bfd2yNzB7mKuDY5JAPnPN+jEhPO86Uazz83wkgricfVyefkj3xznstLS6cNSUuA1nNTJqB+lv0h9yR41XEMqybet29rAyW43M3b6g+MdAFuv9ter3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKeV/s/x4P43xg5OZmckZ5g0OuOCP6D612Rpn2YoBtI=;
 b=uoYN1Ts5foOh49VFCF6g9HgWUmEkG+oyTBH0UejgeCKE0qkyZQx75goVhdpWav6IPmlhMvIF74wiCBYaFLEXU2QPIH0hZYsEumdMKIVH4nh9dvXt0ZWYrucAaUT8w0wJ85E3FsquCiUZUoSmsVN6VuASUSAvB694VlBQtAMUFTY=
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PN1PR0101MB2079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 15:43:12 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::836:67fc:4fb1:3e8b]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::836:67fc:4fb1:3e8b%8]) with mapi id 15.20.4523.015; Wed, 15 Sep 2021
 15:43:11 +0000
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
To: Steve Sakoman <steve@sakoman.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, Patches and
 discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper return value to avoid major issues and removing unnecessary code
Thread-Topic: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper return value
 to avoid major issues and removing unnecessary code
Thread-Index: AQHXpLo60Lr4p7zkEku8hXZoCN1vS6ulOvwAgAACJACAAAmNfw==
Date: Wed, 15 Sep 2021 15:43:10 +0000
Message-ID: 
 <PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9@PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM>
References: <20210908140219.19249-1-ranjitsinhrathod1991@gmail.com>
 <CAOSpxdbipM+VBMEFfyF4aS-AnpMJEEKsDUb9zTRhCLdTqM40Yg@mail.gmail.com>
 <CANNYZj_M-k-F4eB6GOxaaNext05h4FGLaT59G92N6YMDXrb=nw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_M-k-F4eB6GOxaaNext05h4FGLaT59G92N6YMDXrb=nw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d0e2ad8a-2e7e-866d-fb10-75e60cff8577
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf6bdb8b-cd6f-46de-f350-08d9785f862d
x-ms-traffictypediagnostic: PN1PR0101MB2079:
x-microsoft-antispam-prvs: 
 <PN1PR0101MB2079D1AFE5ABF41D2FB3EF558FDB9@PN1PR0101MB2079.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k/M7UCc0Z6SA4/gvuFLMCzXkU5ev+ivUxjjUw7E2MI/p/9AZHWCiSs7i24wklzu/JZtXySj/PoHA/utypw1ZIzmwEZgRcLTl5v3rPeXE9bBdFiAwqMqpJosDssuFz6tCDoKj3NIi8eJ/ERrt42hsGQ8lUr35n7+Pnm8PO2CODF2Jl+GiS4AbOD4hf+LbgCp/VmKj0jYbwIzqMIKRlaQPuiGG15D6isigKdQt19axhFGvNSirRWAIo4cXhNz7Q0fD9LcLb8uSeVCvFd5Mos77QpPB0Fjq9MSuMhzVdOb6KQ8nPR2sHf3QM9JTJO5FPn3oLlrrQ7oKHCOyEn6zoO2gdkhE0ISqToSX1zV+VIGVaWIyPAwM9LotF2AlS7krvdCyY9BwnmEer4Q09x+/RknUPcmWx4p+4cN4V4flAoZyqprphlhtJB9p2MrUrWWdBdbYMIPbW3d6BO/TAaiJiHWJwryiAXxM1OXMHTp+qL5ZosY/Lo64EbB/9sY844x6KZiF804xvM6LhJIF9W0TjFyBidllFGRxw8PwXiuVrLrV21NEfcTNEJj48FrHgEa/AxEQiz+V+roYNDU4zWTndLLAKJ3ugCkQxpy9OIbWAsRfHuRcb+fcCWHs3Kjf1H8tWNNYroKs8MU6T7ZGgDCPK7RpT8+UyzxpDHzLlD/NNxT4qkVRwbhR0YU0S8UlqfbbFwbr7CIPxvGeCiK7lhOHAab2PPUA83YocngvfKp1gGrFe9NO/6waJMou9gned6NmFPDBW04M/aYcwjutwd/gtKr9mmDi7jDxWsWhojdLICWodhIErhmWuBrm4A3vZXCPMn3MQLlKPlARq1qvwt59plyfhw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(66946007)(122000001)(26005)(38100700002)(76116006)(186003)(38070700005)(19627405001)(166002)(66556008)(66446008)(66616009)(66476007)(64756008)(71200400001)(7066003)(110136005)(33656002)(5660300002)(66574015)(53546011)(316002)(6506007)(45080400002)(86362001)(55016002)(52536014)(83380400001)(7696005)(54906003)(2906002)(8936002)(4326008)(8676002)(9686003)(478600001)(99936003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9oqxzygyH1QS9A6lIGPP/Ym8ZTBzph7ZBLAT9eBmyHQLZHSFLc3QFc4Qbomg?=
 =?us-ascii?Q?9IGh7O2Izdo/kOeiceYT88T9kyPiv/2L4GF6O6CZT2/GKBDHtipo6SuJcGGA?=
 =?us-ascii?Q?aetYc3dWgOHqj20Uz/7cca2tEqaM98Q/ufYdPtXH+DeYglcDx3gbW6KqK3se?=
 =?us-ascii?Q?ce0IH1NIPwTaZ6ohrQUjc6r3psh/ojOGpueF3Prv+2ze/A5uOwcKAhfUXhw2?=
 =?us-ascii?Q?BDgdVwsH5BCfRKfF3OReodX1bTwcqW7yZI/o7NlJRJRyausnYma1qFa49jdY?=
 =?us-ascii?Q?aKIThJjwW/6SPP3ZT6jywStGR0HA74ZEWhzKiFbIfKX1VO67DtvpoIpwnIAY?=
 =?us-ascii?Q?wEA+BnsYjWfzmL5RgWMyMJY0GWb+Q2JcfXp1P7fYsEwZRQroJlgeHcupWgcj?=
 =?us-ascii?Q?QPc/S6yg4J2YYWNqi12tkB8rQZ4FKfJY7q41U7BCXhau/TX3oEC6jKvgxz/g?=
 =?us-ascii?Q?Cacg7ETMFJj6El5By/dqhOBtTEVoxplSaHMHcaRRLqfs9ibbwd6yoXz1zUyI?=
 =?us-ascii?Q?RGjD4NZ1UUYO+Wp8QcGV6o+cABeZ8UIsU4PbKLHOIYX0FxvMHHqGZabvbexV?=
 =?us-ascii?Q?860Ur6U15WjOMrioZFOITQ9Eq5UHmHoN5eree7YVmEEz0/lyrhaCPasv9UZd?=
 =?us-ascii?Q?UJe65HYxzbwXsx7Bd4dLEyfTzvC6At7e8FGhsKHAGS13mI4DagY6uCNumNdQ?=
 =?us-ascii?Q?DZ93z8KZQlDaoDo5Q4xBHLQnF33mpd7GkkIKKBYi7nY4lWsU5ZoghlnmkHQc?=
 =?us-ascii?Q?4R+l/C8YY5OXhjmRq73/Vnz8QPDmcKwB9G4xw5PtWcgFuGhEdTWi410A9H+/?=
 =?us-ascii?Q?GVNz/rigjfMB0ojG14FpGwO0rETo3yPOfIs257hONxhCqylYbCSj8copAkkq?=
 =?us-ascii?Q?k+J5K0ENOnR/mvYV0Iw3Suz6PedYfQsynplEruVMMiwOqij+90WagV/rd93E?=
 =?us-ascii?Q?mtL801iyZ9S0fa+Y8PwhBOuCKS6k10BYpymaI0wqiVE42BVqrRrDGlGSAc6H?=
 =?us-ascii?Q?iSXAIxju+Yo3g8U+93fNn0jG8qOTjjluOeDRToSWNqxqTOLfm7VXr37mR6oC?=
 =?us-ascii?Q?SOXmsHJtUY2B6GMEW6rhbsK+UE+9gHr+QxDH+2teRgg/JEZy+xmw/3xLyI/V?=
 =?us-ascii?Q?lzTaX6TH647988Ww7dI8FlrjrJ7SsOuyskQ3eGHivvQQXNHq7mRZY6fe9pyd?=
 =?us-ascii?Q?fUt0KEO1wO4AMowjmdoIwF8gfnL1CSNujvs7PQbsdoozcqtC2NrmrG9kwqGD?=
 =?us-ascii?Q?gsuoijFL67XwWDMzEQCnWft4f5zcGDOwN66o4z0axRgtqd2PIjqu6VE2R5OJ?=
 =?us-ascii?Q?hD4DqgFKTqrUxh9fGqcP25Ew?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6bdb8b-cd6f-46de-f350-08d9785f862d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 15:43:10.8671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DgnPsq+EI91p/Vx0vUx1ExblZ8eox7afgaG0PDGeAEkYDPKFnZg4okaWZpi2DezEwLFPsq7StsWP/sqYpfxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB2079
X-Groupsio-MsgNum: 156067
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_";
	type="multipart/alternative"

--_004_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_"

--_000_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

If you wanted to take changes only for the 0001-rpm-rpmio.c-restrict-virtua=
l-memory-usage-if-limit-s.patch then you can cherry-pick it from master as =
I have submitted it for master and it is available on master branch now. Be=
low is the link.
poky - Poky Build Tool and Metadata (yoctoproject.org)<https://git.yoctopro=
ject.org/cgit/cgit.cgi/poky/commit/?id=3D9886ef691aa117d67e4342c6a5e3f79f6a=
05f8d5>

Do you still want me to send v2 patch here?


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:05fb0115-01bd-4421-ae2f-587c78415386]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org>
Sent: Wednesday, September 15, 2021 8:36 PM
To: Steve Sakoman <steve@sakoman.com>
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>; Patches and discuss=
ions about the oe-core layer <openembedded-core@lists.openembedded.org>; Ra=
njitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper return val=
ue to avoid major issues and removing unnecessary code

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.
At this point I have to note that I am removing the patch altogether with t=
he upcoming upgrade of rpm to 4.17, as I'm also switching the compression f=
ormat to zstd, and the patch is generally difficult to maintain and rebase.=
 If you care about xz compression, please do work with upstream to get it m=
erged there.

Alex

On Wed, 15 Sept 2021 at 16:59, Steve Sakoman <steve@sakoman.com<mailto:stev=
e@sakoman.com>> wrote:
On Wed, Sep 8, 2021 at 4:02 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com<mailto:ranjitsinhrathod1991@gmail.com>> wro=
te:
>
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranjitsinh.rat=
hod@kpit.com>>
>
> Change in 2 patch as below to avoid critical issues
> 1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> Handled return values of getrlimit() and lzma_cputhreads() functions
> to avoid unexpected behaviours like devide by zero and potential read
> of uninitialized variable 'virtual_memory'
> Upstream-Status: Pending [merge of multithreading patches to upstream]

This does look like a good fix.  Are these changes to the patch from upstre=
am?

Once upstream has accepted the change we should change the status from
"pending", but for now this is ok.

> 2) CVE-2021-3421.patch
> Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as
> it is not needed during backporting of original patch.
> Upstream-Status: Backport [https://github.com/rpm-software-management/rpm=
/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21<https://apc01.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Frpm-software-managem=
ent%2Frpm%2Fcommit%2Fd6a86b5e69e46cc283b1e06c92343319beb42e21&data=3D04%7C0=
1%7Cranjitsinh.rathod%40kpit.com%7Cdfd54731b1a240ea64ed08d9785a7618%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637673152237746428%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&sdata=3DBFoFI3j9RjhqXQi1tSqfoVoS2strOChMcswosTH59Fs%3D&reserved=3D0>]

Removing these unused definitions doesn't really seem like a critical
issue. I'd prefer to leave the CVE patch in its original form.

Could you submit a V2 with this change?

Thanks!

Steve

> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranji=
tsinh.rathod@kpit.com>>
> ---
>  ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-------
>  .../rpm/files/CVE-2021-3421.patch             | 32 +++----------------
>  2 files changed, 19 insertions(+), 38 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-vi=
rtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-=
rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> index 6454785254..dc3f74fecd 100644
> --- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-m=
emory-usage-if-limit-s.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-m=
emory-usage-if-limit-s.patch
> @@ -11,36 +11,39 @@ CPU thread.
>  Upstream-Status: Pending [merge of multithreading patches to upstream]
>
>  Signed-off-by: Peter Bergin <peter@berginkonsult.se<mailto:peter@bergink=
onsult.se>>
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranj=
itsinh.rathod@kpit.com>>
>  ---
> - rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
> - 1 file changed, 34 insertions(+)
> + rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 36 insertions(+)
>
>  diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
>  index e051c98..b3c56b6 100644
>  --- a/rpmio/rpmio.c
>  +++ b/rpmio/rpmio.c
> -@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode, in=
t fd, int xz)
> +@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode, in=
t fd, int xz)
>                 }
>   #endif
>
> -+              struct rlimit virtual_memory;
> -+              getrlimit(RLIMIT_AS, &virtual_memory);
> -+              if (virtual_memory.rlim_cur !=3D RLIM_INFINITY) {
> ++              struct rlimit virtual_memory =3D {RLIM_INFINITY , RLIM_IN=
FINITY};
> ++              int status =3D getrlimit(RLIMIT_AS, &virtual_memory);
> ++              if ((status !=3D -1) && (virtual_memory.rlim_cur !=3D RLI=
M_INFINITY)) {
>  +                      const uint64_t virtual_memlimit =3D virtual_memor=
y.rlim_cur;
> ++                      uint32_t threads_max =3D lzma_cputhreads();
>  +                      const uint64_t virtual_memlimit_per_cpu_thread =
=3D
> -+                              virtual_memlimit / lzma_cputhreads();
> -+                      uint64_t memory_usage_virt;
> ++                              virtual_memlimit / ((threads_max =3D=3D 0=
) ? 1 : threads_max);
>  +                      rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restric=
ted to %lu and "
>  +                             "per CPU thread %lu\n", virtual_memlimit, =
virtual_memlimit_per_cpu_thread);
> ++                      uint64_t memory_usage_virt;
>  +                      /* keep reducing the number of compression thread=
s until memory
>  +                         usage falls below the limit per CPU thread*/
>  +                      while ((memory_usage_virt =3D lzma_stream_encoder=
_mt_memusage(&mt_options)) >
>  +                             virtual_memlimit_per_cpu_thread) {
> -+                              /* If number of threads goes down to zero=
 lzma_stream_encoder will
> -+                               * will return UINT64_MAX. We must check =
here to avoid an infinite loop.
> ++                              /* If number of threads goes down to zero=
 or in case of any other error
> ++                               * lzma_stream_encoder_mt_memusage will r=
eturn UINT64_MAX. We must check
> ++                               * for both the cases here to avoid an in=
finite loop.
>  +                               * If we get into situation that one thre=
ad requires more virtual memory
>  +                               * than available we set one thread, prin=
t error message and try anyway. */
> -+                              if (--mt_options.threads =3D=3D 0) {
> ++                              if ((--mt_options.threads =3D=3D 0) || (m=
emory_usage_virt =3D=3D UINT64_MAX)) {
>  +                                      mt_options.threads =3D 1;
>  +                                      rpmlog(RPMLOG_WARNING,
>  +                                             "XZ: Could not adjust numb=
er of threads to get below "
> diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/meta/r=
ecipes-devtools/rpm/files/CVE-2021-3421.patch
> index b1a05b6863..d2ad5eabac 100644
> --- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> +++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> @@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271
>  Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21<https://apc01.safelinks.p=
rotection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Frpm-software-manage=
ment%2Frpm%2Fcommit%2Fd6a86b5e69e46cc283b1e06c92343319beb42e21&data=3D04%7C=
01%7Cranjitsinh.rathod%40kpit.com%7Cdfd54731b1a240ea64ed08d9785a7618%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C637673152237746428%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&sdata=3DBFoFI3j9RjhqXQi1tSqfoVoS2strOChMcswosTH59Fs%3D&reserved=3D0>]
>  CVE: CVE-2021-3421
>  Signed-off-by: Minjae Kim <flowergom@gmail.com<mailto:flowergom@gmail.co=
m>>
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com<mailto:ranj=
itsinh.rathod@kpit.com>>
>  ---
> - lib/package.c | 115 ++++++++++++++++++++++++--------------------------
> - lib/rpmtag.h  |   4 ++
> - 2 files changed, 58 insertions(+), 61 deletions(-)
> + lib/package.c | 113 ++++++++++++++++++++++++--------------------------
> + 1 file changed, 52 insertions(+), 61 deletions(-)
>
>  diff --git a/lib/package.c b/lib/package.c
>  index 081123d84e..7c26ea323f 100644
>  --- a/lib/package.c
>  +++ b/lib/package.c
> -@@ -20,76 +20,68 @@
> +@@ -20,76 +20,67 @@
>
>   #include "debug.h"
>
> @@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644
>  +    { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },
>  +    /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* long obsolete, dont=
 use */
>  +    { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },
> -+    { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 },
> -+    { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATURELENGTH, 1 },
>  +    { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },
>  +    { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },
>  +    { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },
> @@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644
>    * Translate and merge legacy signature tags into header.
>    * @param h           header (dest)
>    * @param sigh                signature header (src)
> ++ * @return            failing tag number, 0 on success
>    */
>   static
>  -void headerMergeLegacySigs(Header h, Header sigh)
> @@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644
>             applyRetrofits(h);
>
>             /* Bump reference count for return. */
> -diff --git a/lib/rpmtag.h b/lib/rpmtag.h
> -index 8c718b31b5..d562572c6f 100644
> ---- a/lib/rpmtag.h
> -+++ b/lib/rpmtag.h
> -@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
> -     RPMTAG_LONGARCHIVESIZE    =3D RPMTAG_SIG_BASE+15,   /* l */
> -     /* RPMTAG_SIG_BASE+16 reserved */
> -     RPMTAG_SHA256HEADER               =3D RPMTAG_SIG_BASE+17,   /* s */
> -+    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
> -+    /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNATURELENGTH */
> -
> -     RPMTAG_NAME               =3D 1000, /* s */
> - #define       RPMTAG_N        RPMTAG_NAME     /* s */
> -@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
> -     RPMSIGTAG_LONGSIZE        =3D RPMTAG_LONGSIGSIZE,   /*!< internal H=
eader+Payload size (64bit) in bytes. */
> -     RPMSIGTAG_LONGARCHIVESIZE =3D RPMTAG_LONGARCHIVESIZE, /*!< internal=
 uncompressed payload size (64bit) in bytes. */
> -     RPMSIGTAG_SHA256  =3D RPMTAG_SHA256HEADER,
> -+    RPMSIGTAG_FILESIGNATURES            =3D RPMTAG_SIG_BASE + 18,
> -+    RPMSIGTAG_FILESIGNATURELENGTH       =3D RPMTAG_SIG_BASE + 19,
> - } rpmSigTag;
> -
>
>  --
>  2.17.1
> --
> 2.17.1
>
>
>
>



This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If you wanted to take changes only for the&nbsp;<span style=3D"font-family:=
&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe=
 UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&=
quot;, sans-serif;font-size:15px;background-color:rgb(255, 255, 255);displa=
y:inline !important">0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limi=
t-s.patch
 then you can cherry-pick it from master as I have submitted it for master =
and it is available on master branch now. Below is the link.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D988=
6ef691aa117d67e4342c6a5e3f79f6a05f8d5" id=3D"LPlnk405977">poky - Poky Build=
 Tool and Metadata (yoctoproject.org)</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Do you still want me to send v2 patch here?</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important"><br>
</span></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:16px; background-color:rgb(255,255,255); displa=
y:inline!important">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<span style=3D"color:rgb(89,89,89); font-family:&quot;Work Sans&quot;; font=
-size:10pt">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt; font-size:11pt; font-family:Calibri,sans-s=
erif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,255,2=
55)">
<span lang=3D"EN-IN" style=3D"margin:0px; font-family:&quot;Work Sans Mediu=
m&quot;; color:rgb(89,89,89)"><b>Ranjitsinh Rathod</b></span><span lang=3D"=
EN-IN" style=3D"margin:0px; font-size:14pt; font-family:&quot;Work Sans&quo=
t;; color:rgb(0,137,207)"><br>
</span><span lang=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family=
:&quot;Work Sans&quot;; color:rgb(127,127,127)">Technical Leader |&nbsp;&nb=
sp;| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span lang=3D"EN-IN" style=3D"margin:0px; font-size:14pt; fo=
nt-family:&quot;Work Sans&quot;; color:rgb(176,255,69)">___________________=
_______________________<br>
</span></sup></b><span style=3D"margin:0px; color:rgb(31,73,125)"><a href=
=3D"http://www.kpit.com/" target=3D"_blank" rel=3D"noopener noreferrer" sty=
le=3D"margin:0px"><span lang=3D"EN-IN" style=3D"margin:0px; font-size:12pt;=
 font-family:&quot;Work Sans Medium&quot;; color:gray">KPIT</span></a></spa=
n><span style=3D"margin:0px; font-family:&quot;Work Sans&quot;; color:gray"=
><span>&nbsp;</span></span><span lang=3D"EN-IN" style=3D"margin:0px; font-s=
ize:12pt; font-family:&quot;Work Sans&quot;; color:gray">|</span><span lang=
=3D"EN-IN" style=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&=
quot;; color:gray"><span>&nbsp;</span></span><span style=3D"margin:0px; col=
or:rgb(31,73,125)"><a href=3D"http://www.kpit.com/linkedin" target=3D"_blan=
k" rel=3D"noopener noreferrer" style=3D"margin:0px"><span lang=3D"EN-IN" st=
yle=3D"margin:0px; font-size:9pt; font-family:&quot;Work Sans&quot;; color:=
gray">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px; font-size:9pt; =
font-family:&quot;Work Sans&quot;; color:rgb(89,89,89)"></span><span style=
=3D"margin:0px; font-size:12pt; font-family:&quot;Times New Roman&quot;,ser=
if"></span></p>
<p style=3D"margin:0in; font-size:11pt; font-family:Calibri,sans-serif; col=
or:rgb(32,31,30); text-align:start; background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" target=3D"_blank" rel=3D"noope=
ner noreferrer" style=3D"margin:0px"><span style=3D"margin:0px; color:rgb(3=
1,73,125)"><img class=3D"EmojiInsert" width=3D"621" height=3D"120" style=3D=
"margin:0px; width:6.4687in; height:1.25in" data-outlook-trace=3D"F:1|T:1" =
src=3D"cid:05fb0115-01bd-4421-ae2f-587c78415386"></span></a></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Alexander Kanavin via lists.openembedded.org
 &lt;alex.kanavin=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, September 15, 2021 8:36 PM<br>
<b>To:</b> Steve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> Ranjitsinh Rathod &lt;ranjitsinhrathod1991@gmail.com&gt;; Patche=
s and discussions about the oe-core layer &lt;openembedded-core@lists.opene=
mbedded.org&gt;; Ranjitsinh Rathod &lt;Ranjitsinh.Rathod@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper ret=
urn value to avoid major issues and removing unnecessary code</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"background-color:#F7F4A9"><span style=3D"font-size:12pt; font=
-weight:bold; font-family:'Cambria','times new roman','garamond',serif; col=
or:#ff0000">Caution:
<span style=3D"font-size:8 pt; font-weight:normal; font-family:'times new r=
oman',serif; color:#ff0000">
This email originated from outside of the KPIT. Do not click links or open =
attachments unless you recognize the sender and know the content is safe.
</span></span></div>
<div>
<div dir=3D"ltr">
<div>At this point I have to note that I am removing the patch altogether w=
ith the upcoming upgrade of rpm to 4.17, as I'm also switching the compress=
ion format to zstd, and the patch is generally difficult to maintain and re=
base. If you care about xz compression,
 please do work with upstream to get it merged there.</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Wed, 15 Sept 2021 at 16:59, Stev=
e Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt=
; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
On Wed, Sep 8, 2021 at 4:02 AM Ranjitsinh Rathod<br>
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com" target=3D"_blank">ran=
jitsinhrathod1991@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.c=
om" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;<br>
&gt; Change in 2 patch as below to avoid critical issues<br>
&gt; 1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch<br>
&gt; Handled return values of getrlimit() and lzma_cputhreads() functions<b=
r>
&gt; to avoid unexpected behaviours like devide by zero and potential read<=
br>
&gt; of uninitialized variable 'virtual_memory'<br>
&gt; Upstream-Status: Pending [merge of multithreading patches to upstream]=
<br>
<br>
This does look like a good fix.&nbsp; Are these changes to the patch from u=
pstream?<br>
<br>
Once upstream has accepted the change we should change the status from<br>
&quot;pending&quot;, but for now this is ok.<br>
<br>
&gt; 2) CVE-2021-3421.patch<br>
&gt; Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as<=
br>
&gt; it is not needed during backporting of original patch.<br>
&gt; Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Frpm-software-management%2F=
rpm%2Fcommit%2Fd6a86b5e69e46cc283b1e06c92343319beb42e21&amp;data=3D04%7C01%=
7Cranjitsinh.rathod%40kpit.com%7Cdfd54731b1a240ea64ed08d9785a7618%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637673152237746428%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;sdata=3DBFoFI3j9RjhqXQi1tSqfoVoS2strOChMcswosTH59Fs%3D&amp;reserved=
=3D0" originalsrc=3D"https://github.com/rpm-software-management/rpm/commit/=
d6a86b5e69e46cc283b1e06c92343319beb42e21" shash=3D"PqMzOJLRo4kY7xLvF7pmr7Om=
OngDS594/B/xTnaAd2ENQ/bsPYWdhdMZHiUFHPuwqp4hhn8gNhgsitLlq+HaXs4eOFKRaN7U/KN=
snNP8l5VUqqXg5/1Qr0o60fNF443zR0vV9+nEeMg03U9CvDbHQLsoF232zRziSglZnGl5Mcc=3D=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-mana=
gement/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21</a>]<br>
<br>
Removing these unused definitions doesn't really seem like a critical<br>
issue. I'd prefer to leave the CVE patch in its original form.<br>
<br>
Could you submit a V2 with this change?<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rath=
od@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-----=
--<br>
&gt;&nbsp; .../rpm/files/CVE-2021-3421.patch&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| 32 +++----------------<br>
&gt;&nbsp; 2 files changed, 19 insertions(+), 38 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict=
-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/00=
01-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch<br>
&gt; index 6454785254..dc3f74fecd 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtua=
l-memory-usage-if-limit-s.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtua=
l-memory-usage-if-limit-s.patch<br>
&gt; @@ -11,36 +11,39 @@ CPU thread.<br>
&gt;&nbsp; Upstream-Status: Pending [merge of multithreading patches to ups=
tream]<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginko=
nsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;&nbsp; ---<br>
&gt; - rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++<br>
&gt; - 1 file changed, 34 insertions(+)<br>
&gt; + rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++<br>
&gt; + 1 file changed, 36 insertions(+)<br>
&gt;<br>
&gt;&nbsp; diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c<br>
&gt;&nbsp; index e051c98..b3c56b6 100644<br>
&gt;&nbsp; --- a/rpmio/rpmio.c<br>
&gt;&nbsp; +++ b/rpmio/rpmio.c<br>
&gt; -@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode,=
 int fd, int xz)<br>
&gt; +@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode,=
 int fd, int xz)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt;&nbsp; &nbsp;#endif<br>
&gt;<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct rlimit virtu=
al_memory;<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; getrlimit(RLIMIT_AS=
, &amp;virtual_memory);<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (virtual_memory.=
rlim_cur !=3D RLIM_INFINITY) {<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct rlimit virtu=
al_memory =3D {RLIM_INFINITY , RLIM_INFINITY};<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int status =3D getr=
limit(RLIMIT_AS, &amp;virtual_memory);<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ((status !=3D -1=
) &amp;&amp; (virtual_memory.rlim_cur !=3D RLIM_INFINITY)) {<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; const uint64_t virtual_memlimit =3D virtual_memory.rlim_cur;<=
br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; uint32_t threads_max =3D lzma_cputhreads();<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; const uint64_t virtual_memlimit_per_cpu_thread =3D<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; virtual_memlimit / lzma_cputhreads();<=
br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; uint64_t memory_usage_virt;<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; virtual_memlimit / ((threads_max =3D=
=3D 0) ? 1 : threads_max);<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; rpmlog(RPMLOG_NOTICE, &quot;XZ: virtual memory restricted to =
%lu and &quot;<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;per CPU thread %lu\n&quot;, =
virtual_memlimit, virtual_memlimit_per_cpu_thread);<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; uint64_t memory_usage_virt;<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; /* keep reducing the number of compression threads until memo=
ry<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;usage falls below the limit per CPU thread*/<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; while ((memory_usage_virt =3D lzma_stream_encoder_mt_memusage=
(&amp;mt_options)) &gt;<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;virtual_memlimit_per_cpu_thread) {=
<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* If number of threads goes down to z=
ero lzma_stream_encoder will<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* will return UINT64_MAX. We mus=
t check here to avoid an infinite loop.<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* If number of threads goes down to z=
ero or in case of any other error<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* lzma_stream_encoder_mt_memusag=
e will return UINT64_MAX. We must check<br>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* for both the cases here to avo=
id an infinite loop.<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* If we get into situation =
that one thread requires more virtual memory<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* than available we set one=
 thread, print error message and try anyway. */<br>
&gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (--mt_options.threads =3D=3D 0) {<b=
r>
&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ((--mt_options.threads =3D=3D 0) ||=
 (memory_usage_virt =3D=3D UINT64_MAX)) {<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mt_op=
tions.threads =3D 1;<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpmlo=
g(RPMLOG_WARNING,<br>
&gt;&nbsp; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;XZ: Could not adjust number of threads to get b=
elow &quot;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/met=
a/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; index b1a05b6863..d2ad5eabac 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; @@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271<br>
&gt;&nbsp; Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Frpm-software-managem=
ent%2Frpm%2Fcommit%2Fd6a86b5e69e46cc283b1e06c92343319beb42e21&amp;data=3D04=
%7C01%7Cranjitsinh.rathod%40kpit.com%7Cdfd54731b1a240ea64ed08d9785a7618%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637673152237746428%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DBFoFI3j9RjhqXQi1tSqfoVoS2strOChMcswosTH59Fs%3D&amp;res=
erved=3D0" originalsrc=3D"https://github.com/rpm-software-management/rpm/co=
mmit/d6a86b5e69e46cc283b1e06c92343319beb42e21" shash=3D"PqMzOJLRo4kY7xLvF7p=
mr7OmOngDS594/B/xTnaAd2ENQ/bsPYWdhdMZHiUFHPuwqp4hhn8gNhgsitLlq+HaXs4eOFKRaN=
7U/KNsnNP8l5VUqqXg5/1Qr0o60fNF443zR0vV9+nEeMg03U9CvDbHQLsoF232zRziSglZnGl5M=
cc=3D" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software=
-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21</a>]<br>
&gt;&nbsp; CVE: CVE-2021-3421<br>
&gt;&nbsp; Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.=
com" target=3D"_blank">flowergom@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;&nbsp; ---<br>
&gt; - lib/package.c | 115 ++++++++++++++++++++++++------------------------=
--<br>
&gt; - lib/rpmtag.h&nbsp; |&nbsp; &nbsp;4 ++<br>
&gt; - 2 files changed, 58 insertions(+), 61 deletions(-)<br>
&gt; + lib/package.c | 113 ++++++++++++++++++++++++------------------------=
--<br>
&gt; + 1 file changed, 52 insertions(+), 61 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/lib/package.c b/lib/package.c<br>
&gt;&nbsp; index 081123d84e..7c26ea323f 100644<br>
&gt;&nbsp; --- a/lib/package.c<br>
&gt;&nbsp; +++ b/lib/package.c<br>
&gt; -@@ -20,76 +20,68 @@<br>
&gt; +@@ -20,76 +20,67 @@<br>
&gt;<br>
&gt;&nbsp; &nbsp;#include &quot;debug.h&quot;<br>
&gt;<br>
&gt; @@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;&nbsp; +&nbsp; &nbsp; { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },<br>
&gt;&nbsp; +&nbsp; &nbsp; /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* l=
ong obsolete, dont use */<br>
&gt;&nbsp; +&nbsp; &nbsp; { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },=
<br>
&gt; -+&nbsp; &nbsp; { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 }=
,<br>
&gt; -+&nbsp; &nbsp; { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATUREL=
ENGTH, 1 },<br>
&gt;&nbsp; +&nbsp; &nbsp; { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },<br>
&gt;&nbsp; +&nbsp; &nbsp; { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },<br>
&gt;&nbsp; +&nbsp; &nbsp; { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },<br>
&gt; @@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;&nbsp; &nbsp; * Translate and merge legacy signature tags into header.<=
br>
&gt;&nbsp; &nbsp; * @param h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;header=
 (dest)<br>
&gt;&nbsp; &nbsp; * @param sigh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; signature header (src)<br>
&gt; ++ * @return&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; failing tag numb=
er, 0 on success<br>
&gt;&nbsp; &nbsp; */<br>
&gt;&nbsp; &nbsp;static<br>
&gt;&nbsp; -void headerMergeLegacySigs(Header h, Header sigh)<br>
&gt; @@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;applyRetrofits(h);<br>
&gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Bump reference count=
 for return. */<br>
&gt; -diff --git a/lib/rpmtag.h b/lib/rpmtag.h<br>
&gt; -index 8c718b31b5..d562572c6f 100644<br>
&gt; ---- a/lib/rpmtag.h<br>
&gt; -+++ b/lib/rpmtag.h<br>
&gt; -@@ -65,6 +65,8 @@ typedef enum rpmTag_e {<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMTAG_LONGARCHIVESIZE&nbsp; &nbsp; =3D RPMTAG_SI=
G_BASE+15,&nbsp; &nbsp;/* l */<br>
&gt; -&nbsp; &nbsp; &nbsp;/* RPMTAG_SIG_BASE+16 reserved */<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMTAG_SHA256HEADER&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;=3D RPMTAG_SIG_BASE+17,&nbsp; &nbsp;/* s */<br>
&gt; -+&nbsp; &nbsp; /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNA=
TURES */<br>
&gt; -+&nbsp; &nbsp; /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNA=
TURELENGTH */<br>
&gt; -<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMTAG_NAME&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;=3D 1000, /* s */<br>
&gt; - #define&nbsp; &nbsp; &nbsp; &nbsp;RPMTAG_N&nbsp; &nbsp; &nbsp; &nbsp=
; RPMTAG_NAME&nbsp; &nbsp; &nbsp;/* s */<br>
&gt; -@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMSIGTAG_LONGSIZE&nbsp; &nbsp; &nbsp; &nbsp; =3D=
 RPMTAG_LONGSIGSIZE,&nbsp; &nbsp;/*!&lt; internal Header+Payload size (64bi=
t) in bytes. */<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMSIGTAG_LONGARCHIVESIZE =3D RPMTAG_LONGARCHIVES=
IZE, /*!&lt; internal uncompressed payload size (64bit) in bytes. */<br>
&gt; -&nbsp; &nbsp; &nbsp;RPMSIGTAG_SHA256&nbsp; =3D RPMTAG_SHA256HEADER,<b=
r>
&gt; -+&nbsp; &nbsp; RPMSIGTAG_FILESIGNATURES&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D RPMTAG_SIG_BASE + 18,<br>
&gt; -+&nbsp; &nbsp; RPMSIGTAG_FILESIGNATURELENGTH&nbsp; &nbsp; &nbsp; &nbs=
p;=3D RPMTAG_SIG_BASE + 19,<br>
&gt; - } rpmSigTag;<br>
&gt; -<br>
&gt;<br>
&gt;&nbsp; --<br>
&gt;&nbsp; 2.17.1<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_--

--_004_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_
Content-Type: image/png; name="Outlook-mo3huikm.png"
Content-Description: Outlook-mo3huikm.png
Content-Disposition: inline; filename="Outlook-mo3huikm.png"; size=22485;
	creation-date="Wed, 15 Sep 2021 15:43:10 GMT";
	modification-date="Wed, 15 Sep 2021 15:43:10 GMT"
Content-ID: <05fb0115-01bd-4421-ae2f-587c78415386>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_004_PNZPR01MB52788C6BD6CD6C47A9982CBA8FDB9PNZPR01MB5278INDP_--
