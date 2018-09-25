Return-Path: <prvs=8806058be4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8920560401
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 09:58:29 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8P9ooME019669; Tue, 25 Sep 2018 04:58:30 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam03-co1-obe.outbound.protection.outlook.com
	(mail-co1nam03lp0021.outbound.protection.outlook.com [216.32.181.21])
	by mx0a-00010702.pphosted.com with ESMTP id 2mnk6j0mu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 25 Sep 2018 04:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WBL/3vpXZjbTdpBosS1n0BlCD2ojKNroE0amoRq98UM=;
	b=aNPclj5YYCOwNv9XGgE6qPXTADSNiTJ47BTR7x/YlIpflaMtUy7GVmUDenp/gRRM7ELEl6K1uFdnJEjzoYBVoSUiAHg/32f6hUmOpUc7siDsWDtIWhV8Ab1Sh7YWJxgh4EaoxkJPNpTiuMc0sZGLKSkVeSA0Bke1v3hV/fzlo/U=
Received: from ionel-work (80.97.64.55) by
	DM5PR04MB0396.namprd04.prod.outlook.com (2603:10b6:3:9d::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1164.22; Tue, 25 Sep 2018 09:58:27 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
In-Reply-To: <87efdhj4am.fsf@ni.com>
References: <20180924132500.30363-1-adrian.ratiu@ni.com>
	<be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
	<871s9jj5yr.fsf@ni.com>
	<f23622c2b3d94603c6072c80e4958d0d291b06f9.camel@linuxfoundation.org>
	<87efdhj4am.fsf@ni.com>
Date: Tue, 25 Sep 2018 13:00:12 +0300
Message-ID: <87a7o5j3rn.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: DB6P18901CA0016.EURP189.PROD.OUTLOOK.COM
	(2603:10a6:4:16::26) To DM5PR04MB0396.namprd04.prod.outlook.com
	(2603:10b6:3:9d::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91727a6f-4595-4125-c488-08d622cd7112
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0396; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	3:J2FFWBwZP+kJRrOhc6H0RbxE88YRj8bWD23M9Isx0EmHmuhpWC+LluS6P5UzViEBAddhT6C9ZDyp1yhjkiTkOjMg8gwaD/Qb2CrnAR/5BL5MO10Gf8Eoa4EfW3Zn2yS8u6CcCSQHEAW3rSMmNcbL7yw+jRiVDWHNvzbfyjcO06fyJ5o92pksQS/8lNkxrcXs33+4Aw0rqX1JrebuyHhnsyG7FQXN4LdCeGxyQGY6Xz8UR1VHIcbXIY1sSDh9gOgx;
	25:ENrPkb1UvdvRBEZ5pkWHxiR0u3SQ1cz9vJcOHgcUb5VVnSDMvgEgY/xMeDuSFJBMwaPXcCGOX42IGUk1YBGjAJTZoaSwaE/Oj42IQwpWtXb1DIMPzMC8QxkVIln+wZ/KKVQMRIPwvPx7aRMttxZQDd/AMqPT/UW4CLN/mXddVWM35X+OOCCpOrajca2QGcmDEpgqh6HSBKEfbIWSST+4yo36LtcTi6+m+Yh7FGJvofbv2Nc8W3B7yF3A1GcROaJ666tcoqDGDiBAhs2Vi2KBJKnVU0FqgDZUV3AjW3M9jzSD83ssqu6o1fDSt+fEkDtId3HA9kkKj0FXYSWLooHxgQ==;
	31:g+EnLB12Cu7edkQub0IBpVb23an+CIxw/RsoFnXGSVw3PzY1pHxOyHCChlYDGnjwPRoM8mvexaOnrqFMvlMiQ3sERLU5K2e4jkFBK1utU5Mu2reUg4vCuKIwgHXRBgm/9oxONOGS0cvkW+Zw0xI0GvJqhsBOY5SgufJbnRrFH13ic4/ibl3HWQJvBUQEqTWjZ2jy1Y3/V+TEQo8iuxHGnKEaEGFeNUVDd4Ysz+r0vBg=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0396:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	20:KAjBccqaFP4TdWhQN2+S2ZjRQLUmTFxtGxxKvi3qFfa3gy1xpikJXAG77Jdaq+Y9f7bkvZK1BPglIjEEsNy9YL1LwSpb5nuZ0QYhRpsYdr+dGaAEG4g6Hpw+hH6dkj7fSdjfcu3I3uEfIY1z/wcYeKkhgxD0LkBDPiRBjQnkhC7nTWTEzdGIIPQZcV6kVEG79Dnu1RgNq1N5ea5tRRqC+jfL+REBoUR+S5Uwddp+/wBTqfaMhdqLmYiZE8Qj7XKebvGFNBczVkcfJX1Q6f5bCtfKgoj/JVpQxPGRINMHxGQcQ5JQ7Nac394ctP1d5dEsxxds+4y+PAyKWNbJGLCnOYjCDcbcGbgldbLz0lrtNepw65Bo5PlO0QCnumopMGLT3ZweGf02S4yhkTmHCVjVFeqpK+s4Za6L0e257Fq+pa46c6VHG7Tiy9z1kx9QaZ5caCc/k7nbr+UmMY1eziK91khdyKN0cIpShXmyvlFRXT+tO33sK1E+JRLlnT9o4pD72HJaEc/3XVek9JHRStWhLdapmL7tCDG+IqWLJN6giw+2ek3AwyBiJJ9V2gGxT2Ksb3AdxpeosL/k9jUvIQBZedbixHUt3aUij/n4wy/p0Ys=
X-Microsoft-Antispam-PRVS: <DM5PR04MB0396CF541F189C6971A63A25F6160@DM5PR04MB0396.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776)(158342451672863);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(3002001)(149066)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201708071742011)(7699051);
	SRVR:DM5PR04MB0396; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0396; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	4:6xM56ghWq1xj/2xdp285+0y+eNFHZtkPTkOd3+g82HS6Q4QllBMDQcmuPUw8fg2/hliK+LqynL6SGBeRT1+Afwb6RMMVMjyYHuk1+yEpNSn5WbM+Y9Vql+EM/PBCk9iv5v7E1CqC8kX33v7Rx2yNfSyxk+AHtwYXJ+AvTiu90Vyauz9riLOAMO+5l7+4dLpZQDwviDDLqLRQU7tvfJu0Pxn52bkKfBsyxrVwor5Ra7BCrBE+2sNawazc/CU5JizFHTmCNIP/MfTlvHNlFstOc6KhBYju01DiORmSVPZDWR59R1fpUkniHYL9TC2KeQFqgCZFEG84frfB7Ayx+BL5a5WjhdoOfG5JNN37a1H4UIA=
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(93886005)(7736002)(105586002)(50466002)(25786009)(106356001)(97736004)(6666003)(305945005)(2906002)(7110500001)(8936002)(81156014)(86362001)(478600001)(81166006)(48376002)(5660300001)(8676002)(6246003)(14444005)(47776003)(68736007)(53936002)(486006)(16586007)(36756003)(76176011)(229853002)(966005)(6116002)(3846002)(51416003)(6486002)(52116002)(66066001)(6496006)(386003)(6306002)(16526019)(15650500001)(186003)(26005)(2616005)(956004)(10710500007)(2420400007)(446003)(11346002)(316002)(476003)(107986001)(376185003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0396; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0396;
	23:vfd1Vf2EmOPRxo8Rzz+ROykUdYRnC4rUMtdQE+BQG?=
	=?us-ascii?Q?jesZ+TJaazhUpHk+W5LgCZTXLRaksQibsyTzD58UDi6svUZ/HS7NaLveV2cZ?=
	=?us-ascii?Q?hCD9mtu2fggV/H21Ej/jarkhjMdJkPnMze90bGrdHiAQZAlmSKltj9dj+W5M?=
	=?us-ascii?Q?5lBHiVuMNvAwX8MWPJpz/ifs051BPVkR9MUXTLSTTT2vjOMjNilFc9+/2LP4?=
	=?us-ascii?Q?oafgIZ0mDvE8fLiFfpKs3DnpVO8m06xxZyGDkaY9VHICyLonEYaBmjw1NYO9?=
	=?us-ascii?Q?DjWOUV/WNsEwgWHWPO3iTS15Kt2zRu6+G9WFg+Whyj9XSiCk+3WGzDhGKL4m?=
	=?us-ascii?Q?kKhy3Ijxhzf97H/05OB5BmkDfmAUGAp/CGIL6XO8yo0nhMNzkyf63QEVBfG8?=
	=?us-ascii?Q?dfIX69x8DU39CXST54nu/GZow1XZUoIfozf7UDVke5Kgdl8N1IEXTv23L739?=
	=?us-ascii?Q?seNf/6fkjkNuzOHXk34i1+Z2J4oRsGa7/nA/4fPMYwJ0jP3jVFoseRqg6R0l?=
	=?us-ascii?Q?3a3umokAUrBUcHmHVyZhmbr8fVSfyCe06yiHl7dIzTe3BgxgdXQxOUIkOpTr?=
	=?us-ascii?Q?qmFA+rpZp3BS9U14upo+sEMxWQ2IbXcv56kOZ0AjyhXgoU6aZ164Ytwphlom?=
	=?us-ascii?Q?BOfJFKxAj8ZBql/9e4no/Ih5bZ76d8qD9v8egA9FBb4vr1EHjykm9+fB81s7?=
	=?us-ascii?Q?kKMUmZYny3X/7Q21xnVxSxV/geuuFnSlBi/l7pC49+AFxZiBj7fq/FKkkylA?=
	=?us-ascii?Q?jeragF5wH2WDPfRVX1HxpYtg/jrA7Q2a3ZeAGD254USQxEhBz13dXwwBWnVj?=
	=?us-ascii?Q?WJeOPtc+ot7xN413SFrAEV98uYA2ejA+853KDEv0iD/Q7uCY99Y++kgd9t/R?=
	=?us-ascii?Q?0BxfsHh95ng2JePo2JvyhazZi3lPII39RWowOu9JLSW3iH5XVtc44oV3Nkwk?=
	=?us-ascii?Q?jRmhlTifOUQRSAxYAas3GubYpTTyuOM0ucpo2Hg3ybtoAEFvmKsj8PiFkYka?=
	=?us-ascii?Q?CUQQj0WXUe7L5TsMHV0eM1hMqTCQoPbjOOjANDrmTfvM+B+2EoHQ3jJfcBl2?=
	=?us-ascii?Q?Q4r7eFiiwM7QtfmzI8ndRM3auEE2yNsBkopYvznCuI/eeiWGLXqheG62FZsr?=
	=?us-ascii?Q?2CCVzE/fesdoppN8x7F/MRoz64prxSdnXrScJBHnHejICB2H1fdX+pGvWgn4?=
	=?us-ascii?Q?pHdLsyQPnfjGOD08ojb9KphDwB+fVQrQSHnfhPokQI0DqgHAw3CX62AAZl48?=
	=?us-ascii?Q?ISgFcMKoV+Fqkp5pA+g05uRCQdxS1dTm+LP3OP5J7/qWWS52TLDsxM6SadZ9?=
	=?us-ascii?Q?l+84i95nDDm4FzbBsl/U6RcxW9Mw5Xzg25bUdrGTuplkizLJvbr04ahxVEZp?=
	=?us-ascii?Q?IbjBA=3D=3D?=
X-Microsoft-Antispam-Message-Info: FHiVy4g1jLGNS1j+E1JCFXn0GACnEZdnQ74zlC4OrgsrJhMGmgWsCDxwpBySWpRJ/1WPeOk4sulB1xx18H4VjEnWjyOs5RftKaODRLaKa5ygSWLtb/I6pWkP0TCNQX4bNPn8UtDs+MlSVAbuknNDQIrVrFVoBx+TJcr6zxURNfPox5BAVd8K+uZCU6bJJ3a10GK5n6Ikwwl0oZip1ah26BgVVmRTbiQcTpZ7DkJIyooPPy0wGeEzKCVhdRlOvThDWI7nfzUoNGatVf0xkh3akqrZ99LeUSq3kCB9PcZdsGm1+s7latM4q+7nfiKobPUpFrZOTgUZn50sUiSt2VVCv+OUrFpS5GPUQxUoLbZHUXY=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	6:NWWNfcuFcMgXXU3J5NQf0usm+8I9mCLryVcVqjocFFk1UrlutCxKm+t/DY35IHYLC1c3W9y1qvv6pm6pVuwANRECN6lwj6YTS0lGjapkDlHL9m1Zb1ksCjUj9RKyTaxqR6MA+RffFoyNllPCFEuNuMvi/n8OhAG8IAeT0Bm5jYvk3GJ40IKXfShl9sziBF2+hROj0V5hiWYm3keJrYqijj1ov1g/qfif1RQU2FWRZ8NNtfYI1vUpQiYG1dAEvisq47j8s3TxK/p2pCHQlX00GHhnpEWMOicb/sgY+VlYIN9Rw/dky8OOTn45dWVwgE+X7LQk2+4jIYuo4WqNyq+hDy/PIzODNj/mlbbmIi7+G+COYF7Ql5bO7eMq8gkkYo0VMe3rR8oAYayFj0ro04mO5VCpU36JZvIxhbCsRoOxF1sUVJxReH4pRow/yG8zTb8P0L8XXvG6qmQCmqHFohTqHg==;
	5:vux/SjmQkkDLAO8buWbcUKvW6IeB+GtRkgaYhGpv1sw0YOe8LOkRbBkX7mJP53Z4h+RW2vvzvbnpLMF6CT7vavYt689aPp6hRlEx/0BDqI1qn880IjgEYR4bz6rNsoQDSjnYBU5ROzjdDYTho6tVVRKS7Bh9106N/vZ/1qQJ0oU=;
	7:o8ZKuqtzBNPuMHqQCyvJubGY934T4NlWg2Os4CPnvnsudTS2k1uIpr7glLRJFLRa+Xk1VfjpFH3Qa9OQI3fGCDQo5If3Ef2Gpa6i5Mn5ZRUXK1fC7Z7H4S6PNLT+bAXg+fO1MkvrMgrqGiD/SOnVtJM580KHppS7ZNLWaJqhB8isdGbWkBWiK5dR3eU/x3Z1rae2iOKQFzTfkKLui/4HMw1F2YAPWFfskrvQ/fia7xQJpuH1Pxf6j/PTOLozAi6k
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 09:58:27.2693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91727a6f-4595-4125-c488-08d622cd7112
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0396
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-25_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809250103
Subject: Re: [PATCH] rootfs: always update the opkg index
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2018 09:58:29 -0000
Content-Type: text/plain

On Tue, 25 Sep 2018, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> On Mon, 24 Sep 2018, richard.purdie@linuxfoundation.org wrote:
>> On Mon, 2018-09-24 at 18:00 +0300, Ioan-Adrian Ratiu wrote:
>>> > With master, a copy of the feed is constructed under WORKDIR which
>>> > is
>>> > then indexed since other image generation or package writes could
>>> > occur
>>> > and the index isn't static. I'm guessing it doesn't do this for
>>> > external feeds and assumes those feeds are static.
>>> 
>>> My description of the problem mirrors my understanding of the feed
>>> construction process which might be limited especially if it changed
>>> on master post-Sumo, but the answer is yes, external feeds are
>>> assumed static.
>>
>> Ok.
>>
>>> > I am wondering what happens if you put a remote (http://) url into
>>> > this
>>> > though? Does that still work or does it break?
>>> 
>>> It still works, we're using http paths all the time in our distro
>>> (public feed server is at http://download.ni.com/ni-linux-rt/)
>>
>> That is good to know and worth mentioning in the commit message as that
>> isn't clear.
>>
>>> > 
>>> > I'm also worried about what happens if the file:// path you point
>>> > at is
>>> > owned by another user and isn't writable.
>>> 
>>> Thanks for pointing this out. Looks like it enters an infinite loop:
>>> the
>>> do_rootfs task is stuck at 3% and a worker process pegs a core to
>>> 100%.
>>> 
>>> Without this change, do_rootfs gets stuck at 12%, worker pegging a
>>> core
>>> if the feed is owned by another user with no write permissions.
>>> 
>>> This was unexpected :) I'll roll up my sleeves and start digging.
>>> 
>>> Do you have any pointers about what might be happening?
>>
>> I was expecting it to error, not hang. If I had to totally guess, I'd
>> guess at the bb.utils.lockfile() hanging.
>
> I can't reproduce the hang anymore (with or without my change)... I
> tried re-using the sstate, clearing it, all combinations of calling
> bitbake packagegroups, package-index, image, etc and still no hang.
>
> I'm thinking the hang was caused by a build race I can't easily
> reproduce.
>
> Now I get "operation not permitted" errors every time like this one:
>
> Exception: subprocess.CalledProcessError: Command 'cd
> (...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/deploy-ipks; 
> find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C (...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/deploy-ipks
> -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C (...)/tmp-glibc/deploy/ipk' returned non-zero exit status 2.
>
> Subprocess output:
> tar: ./core2-64: Cannot utime: Operation not permitted
> tar: .: Cannot utime: Operation not permitted
> tar: Exiting with failure status due to previous errors
>
> ERROR: safemode-image-1.0-r0 do_package_write_ipk: Function failed:
> sstate_task_postfunc
> ERROR: Logfile of failure stored in:
> (...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/temp/log.do_package_write_ipk.21668
>
> Seeing that the hang is not related to this change, are you ok with
> integrating v2 in which I'll update the commit message to mention
> http:// URI's still work as expected?

Please ignore this message, I was misled by the bad naming (the
safemode-image is actually a package), the hang reproduces, I'm on it.

>
>>
>> Cheers,
>>
>> Richard

