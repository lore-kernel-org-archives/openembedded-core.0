Return-Path: <prvs=67453030ef=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id CD7E678C3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 17:06:55 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6QH5xJf032421; Thu, 26 Jul 2018 12:06:55 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam05-co1-obe.outbound.protection.outlook.com
	(mail-co1nam05lp0081.outbound.protection.outlook.com [216.32.181.81])
	by mx0b-00010702.pphosted.com with ESMTP id 2kewd5uddc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 26 Jul 2018 12:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ho8vbRPhg8MQH5Jc2ddrABHU155AY+DQ9zpHg40QVos=;
	b=TZHYPp9FA+vZ8SpdVVlkSL9d/YFi6YEyCvIARHOJbiS2zT06X82X05VgQrEdaMvIs9IJr2OqTTnmhlMEoBHqR7JW115bP7V0E5ODlVCvZdSBJ6a3dePp8Z+zoucNHwB589gTIC1Kfaeq/E8fM1HmzM5Z0a2QCiagaNk0CvX9HFk=
Received: from adiPC (188.27.131.70) by
	MWHPR04MB0398.namprd04.prod.outlook.com (2603:10b6:300:70::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.20; Thu, 26 Jul 2018 17:06:51 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQfwS7VFTYwR+LfiSV1xGfmdSVY8fuNJ0+Kkdfi3g8nbMw@mail.gmail.com>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
	<CA+chaQfwS7VFTYwR+LfiSV1xGfmdSVY8fuNJ0+Kkdfi3g8nbMw@mail.gmail.com>
Date: Thu, 26 Jul 2018 20:06:30 +0300
Message-ID: <87sh46c4fd.fsf@adiPC.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-Originating-IP: [188.27.131.70]
X-ClientProxiedBy: VI1P189CA0003.EURP189.PROD.OUTLOOK.COM
	(2603:10a6:802:2a::16) To MWHPR04MB0398.namprd04.prod.outlook.com
	(2603:10b6:300:70::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca543a8-3ed9-416d-28e6-08d5f31a2eda
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600073)(711020)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0398; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	3:uSHBc4LXRk+JWIuSOiWaajMrNyIWRQ+BYJzUe4pf9uIum2LdXkkQfcFDC6zaEFv7oVeae2Mp0rkR7A9G8AvEtfn3eUaNdDHlbeHdFOcR7IAZHwxO5R9qBxfMR27GYXXq58QiH2uenVWBIDurTzZAxyAbRuLWTX+vffJLd2Z9BtsrgByOAnKfuK2yMSGne/c9whWPrvBttTGWPxSmvn2Iulp1N6dK1lL8NZJzLL58lSfa4/zw3m9NWbq/sOVlTzoL;
	25:IEGKpnoLYwG6RIGUNK/K9cDVnQE7h9MPUKZL86pQyxGs3zKlSbnsMTnnKJjRi4akljAFBs+muU0uY/uD+Pe3L4Q9/+SicyRsMx6CIWP+5cAk+0QIgdyc2F1QB2PyGpODuQu1TItrbYfg8CxWBp1krTRHbw7zil4NK/UeBSrmIvXvnR9DAnAGNy2h+EhTSFfQaog1i9aW+BmswUzB29cz68kP+VJBtrZGw3B5j+bM41waeCtCy1xuPWDomY4YSsNl8fSllhtI4muOfLjCUa1wuArDFHKmh222atfUT7/EfniBwatrqdoxprC4jQ0s4HcxYJb/dFdPAyrBSONekm/t9g==;
	31:AcqpAlBOIGCjA8a5pt3iN06hbIQEmJQDUTOznTZ47wnAjwYIAVbxkFzBieynTTQWtFymF2hMSCUptcjC6Fw4y+OfJ4bc4cMM4cbPS2wOSilzjkdXUkMn+iZRtJtD1n2xr3/LhVGAuwH8xD/JQphu+IdW4MUhhGq77MM6r6GBF99MEHqxpP5YUFlZH5slNXVEPhVcdH4Opr1VjUOZXLLWnRiq5tFJI23FsEbvLKznXNE=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0398:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	20:E1mEP5QEF+2ISWLLKvzLyazpuAaKWh6LdEf3y8pCX6qdtBCrEcjyuu35Qfm5tDjL9hEsy3MDDfwySHhp+CqAd01hCBBs8z7Mpfqfpgt4tZxcvzA5sHOE62tI+QPDDq/kugXwAv0Q4yJT6MTPaIZyY8PEBAWh6aJCZoDtLigwQ+Dypc33IJHIn2FxDOo3/Pn2xiPtVF7iKvq1AZ97LIVf6mOh9TX7m8P5zZdRrL9xApaciO4xogF1JunWMKbWXmf9gESRY1gOlZ3Fu1EQRkcuISm6+jHHcQJvJjul6TwwpMCD9wex9nWJ809JidaynIwxVepACwP9LoNheFAmrlvHTovQgkDSprtRFRmkjJsA5fwHKZut4KdYm0HkbeqvC86ANN9TuuaD73rUkg7QVWM3Jt+OiQjaCTLMRQE7U70X+KJMOa+jiRUDuI3lnxo7EFP/JBfkGHuEnRJghL/sDvVS4/oab1BJr5rxLW6MYXj4i1G9I0L4roTlwBUxUg2sMEng/VUPabTRvJX9m/JWn432rzBP9M3oVM8FOfNSmztj5LjfYHuxN1ECldVY2/p8RUKl4wYreayF5jg3QfgmikZJeQtlTqENybsCxCmkJn1dqa4=
X-Microsoft-Antispam-PRVS: <MWHPR04MB0398201CC4083891EDE05CD7F62B0@MWHPR04MB0398.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0398; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0398; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	4:AtjyhvpxcOnidKIB/EZMs+RLai14bX9lryNcqXALs9hqPwus9a1TsJD+We7JPWbn7HZ/UpnSuekdADdczCOVQ180lCp/2g5M16aZ9hI+zjxZZIdyD8RbCCq23SxmEP5E0NFEFuiEWI76dr4wMI562Idz6UCYCwBPTm5BFC/w8gnmTm42xV0maWKvcfs4HzvmnWWB1xTvnWi27e9LrkN6tXYNnL84gAch29+Z61VCdVLv3cy+l6O7jV+OMMRKh8zd05HiPWfcRmGNWREcOdBrvOORR4hLfxSsPinRdiFFy0n13TsmgyEsUtUvue1lMxQiudcALeil3gcJqr5OVyM8QGMJyUhgNA9CuAHdIzmnpyY=
X-Forefront-PRVS: 07459438AA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(136003)(366004)(39860400002)(189003)(199004)(53546011)(476003)(6486002)(486006)(16526019)(6916009)(186003)(33896004)(7736002)(305945005)(386003)(97736004)(11346002)(446003)(956004)(6666003)(6116002)(3846002)(86362001)(2906002)(81156014)(81166006)(8676002)(229853002)(47776003)(66066001)(5660300001)(8936002)(14444005)(51416003)(105586002)(48376002)(6246003)(6496006)(68736007)(50466002)(52116002)(478600001)(26005)(9686003)(316002)(76176011)(16586007)(106356001)(25786009)(53936002)(4326008)(39060400002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0398; H:adiPC; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0398;
	23:ZPSmUnmCPPw/qILgBDdXmimDuwM/iEt83QlrWPw2q?=
	=?us-ascii?Q?mEEgbu/xCQT9now6siMne7JdbKoJW4i1gryEmsueRBOCdHiVW+Dz7TXdU9gb?=
	=?us-ascii?Q?+9MSqQsRAucxT97ohnM2pb1bAxSbbSVmsVO8L7u8wsUGKDMxBHRc/Nig4k7N?=
	=?us-ascii?Q?qIzOySreSuspxT7rG0nVTgW3V4CMKZSKIxSDpJyse1vMyQCqAPgqE7hgnwZQ?=
	=?us-ascii?Q?UKv+XccK+OwXy67lilb/WfRnx3Tf2wsWe5bH2syJV2dbo9/GrR5/lfrUt4zP?=
	=?us-ascii?Q?FIkyQYNHD+SWIESgTHyCaPOOULLkNhY8BMvjv5s0Qg5YLtYEA4GMFmBjzU/Y?=
	=?us-ascii?Q?7dy35g8s/i0c85RaRqehkybsMtqgefcxjxL2NvKPIhgGlva90+fOsJ2tEqzg?=
	=?us-ascii?Q?v5bnioKyN3TI1mXBwwhMEYidK5dMS+vOBY9Wt17zSgeRDObcEie+AntY+EGQ?=
	=?us-ascii?Q?uUjPmmJJ+yPHn+j2xOFiobLr+BR3sAfQHvcpdW7zcOVYWkDZ1NmfSOfQ/RsU?=
	=?us-ascii?Q?t4+SVUqi10RMYkSpI5u2Tkln/YQ1eaVpe+HJQwSHoHu7HYr+/ZpAY30BoOi2?=
	=?us-ascii?Q?GTnnS9dBDuhboKWvSL7tGdbTNQyRiuIaZSbMCu20ID/3x1b13xnmCMZGdvJ+?=
	=?us-ascii?Q?DBreUK/6r6Ex3tqoR5CRlqJFX//lGj3Ahd9tmnkNGIjsD8ORboIQB3FRytkp?=
	=?us-ascii?Q?IIyXBThssDwT8ID4u5t0xXvauJTi5Lj9Y41LfJdZjkFLoEyw2ga5ecA9ZXOz?=
	=?us-ascii?Q?zE1oCWzeNNuZpjwbHi20ZEsodZn74XDksF+rlTLJQmAK3vDxaHL2sLmpzl6L?=
	=?us-ascii?Q?7uvuzGwtm0kmSTGr1zDAzYvRhcIsMx0ZJSwayPY+EJfyDkg8FO1ca0vhEH1N?=
	=?us-ascii?Q?qAs+83LJSmMIdhcGQRtdGYP9AxZLLf1aouLX1aiQWVkvl2bY/HEaRoLngRSD?=
	=?us-ascii?Q?tusDJ6wejL0rcQjlAoaut2yPha1XnUgV/+BOnWi6pvKKJM8fB31GdjDSxCzu?=
	=?us-ascii?Q?C9wRY/YQbG/O5dc+vzW9sck3wM8hhE5xieaXbJm/+JpduOG5wnyTh8dJ16AW?=
	=?us-ascii?Q?GVilyXaFdA7C+d4TtZ+TiBS1EWJSNBfzjfdBQsET/ZNngMk8w7pX/S590Jw/?=
	=?us-ascii?Q?+UXo5DQ0OfEM0CIckVkqNzm/1zs+1dhltruFslmVFgitkLTicN4PS1FCrUdH?=
	=?us-ascii?Q?9P1hDGbgLxTcEhrE+KiqYsPf/jzuYPC/BOJ2AviaV+VqJtssb3Bvwl6OA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: byj1SHni4fyVO3DpX8dDtqzAKUJwNVLKf/I/jZPwHz8ga2UdjFV2+901KZI9G2b4DllRiqqSz70RzFbF3pPdYc1FQQlQrTAKapgZApzL1uWG7I0j8DV+0cmuNC21TkwUWxVW7cclT8z0kJaA+BgjZRVRQ6jsE84dR5RfHHd8T6HFoucFSu43oEA+Vhs8yyCm1MjYQufr8NdURosw0BVxbq8++Hebv4qliMF5ZT6pcPSPrBthT3maTBxv4mkyjCGlX8m03dq2jUChZbhXcdpKrGkR1zEV/VaM0/FSCnpp4IYfbuzKrIFvrG1/bA47q4cEn40SW3mtnLNDCQspgqSaisdaJVMauukTQm2u3alJU0I=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	6:h9iL2XpD+w1bF6f6w7uOK6alxVUy+SCP/FZOp/pw8Y/QylvY4Rhg94YyEnsm8qksWF4CED3kkKGOZY9QmEw/oPnUfGfr5TycVoIHKD611Ncs/0W801UzbRmr4JwPj3w2YPTc5Ch1jljfLJnRz8mn69AakDCX2WM4qkBOKo321kWkCxkbg511JcSw5ht6RhbBdfHhZizN5AVPmmQZbTZScW5+3Owfok72y9O8akZcDW3HQNJwdOqxVdFSclVG7rXHPXWT4Ll7sLJDvx4R3OdYR3BBU3DEVR8ddzsfJP+6IV43LHiAPVVUF23OpoGzQSFAYaVRjKIYeTTRVP3cgsRbwBp7YF9IrspofulV3gZc+ksh4bVZxlGuDsn8uf0ouB8djVnju+lNDaUMrorpFzHANSobkc9+NclvBQTR7x13FQhWqAWJ+n5VS5U+6JLfYrz0XFU38TTcMxMRw/GNuUXzrg==;
	5:pi8WhXJEYQL6SYVErZq2yEvA72jA4WzL2Qv4frqNr2CCiuNOZaUnaq58gSVQLzWQMi70FO9QDFc8FDcbLIBAgUsbFKK8W7S8Dd0TuQ0JAExdQR+Zts4DoO5WmVw3aGGxtDEvnoisvAx79IR5XCA45NZmHeeCx/ng2U96JX0N3sM=;
	7:axuhFoB2Z1xgtqKVyP/LHt1oIE1H18ZZw86Er4uWtMFU9gzwutfq1cNtKIo5UzsVR0Su/abSGukrwzkdpHOb6mQ9HsM7e2Mwd6M2B2xTjfDZCUKokvNxkRjIdT6HVCqIKAj9QUqSYzAtA7mWZYpwHZEgGUMfa1CwHH/7jHdhAKv76DicVa1kj83FnQWYyhyg+Rc5qG1rM3o7ZF1GxuQyBz/OsBmRXsDUlygupkdApSEetP8a1isF3hQhEWl3b+AV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2018 17:06:51.4479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca543a8-3ed9-416d-28e6-08d5f31a2eda
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0398
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807260175
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 17:06:56 -0000
Content-Type: text/plain

Thank you Martin! The different behaviours between combinations of
appends and overrides has always been confusing to me.

On Thu, 26 Jul 2018, Martin Jansa <martin.jansa@gmail.com> wrote:
> I went ahead and sent v2 with the fix as I had it locally already anyway.
>
> To illustrate what was wrong with using the override, see following output
> from bitbake -e:
>
> env.util-linux.append+override:ALTERNATIVE_util-linux="dmesg kill more
> mkswap blockdev pivot_root switch_root hexdump last lastb logger mesg
> renice wall unshare setsid chrt flock utmpdump eject nologin taskset
> fallocate"
> env.util-linux.before:ALTERNATIVE_util-linux="dmesg kill more mkswap
> blockdev pivot_root switch_root hexdump last lastb logger mesg renice wall
> fallocate unshare setsid chrt flock utmpdump eject nologin taskset"
> env.util-linux.override:ALTERNATIVE_util-linux=" fallocate"
>
> # $ALTERNATIVE_util-linux [2 operations]
> #   rename from ALTERNATIVE_${PN} data.py:116 [expandKeys]
> #     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
> lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
> nologin taskset"
> #   override[class-target]:rename from ALTERNATIVE_${PN}_class-target
> data_smart.py:641 [renameVar]
> #     " fallocate"
> # pre-expansion value:
> #   " fallocate"
> ALTERNATIVE_util-linux=" fallocate"
>
> # $ALTERNATIVE_util-linux_class-target
> #   rename from ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
> #     " fallocate"
> ALTERNATIVE_util-linux_class-target=" fallocate"
>
> # $ALTERNATIVE [19 operations]
> #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:63
> #     [doc] "Lists commands in a package that need an alternative binary
> naming scheme."
> #   override[util-linux-hwclock]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:245
> #     "hwclock"
> #   override[util-linux-fdisk]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:248
> #     "fdisk"
> #   override[util-linux-fstrim]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:251
> #     "fstrim"
> #   override[util-linux-agetty]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:254
> #     "getty"
> #   override[util-linux-mount]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:258
> #     "mount"
> #   override[util-linux-umount]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:261
> #     "umount"
> #   override[util-linux-readprofile]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:264
> #     "readprofile"
> #   override[util-linux-losetup]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:267
> #     "losetup"
> #   override[util-linux-swaponoff]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:270
> #     "swapoff swapon"
> #   override[util-linux-fsck]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:274
> #     "fsck"
> #   override[util-linux-blkid]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:277
> #     "blkid"
> #   override[util-linux-rfkill]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:280
> #     "rfkill"
> #   override[util-linux-getopt]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:283
> #     "getopt"
> #   override[util-linux-sulogin]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:286
> #     "sulogin"
> #   override[util-linux-mountpoint]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:289
> #     "mountpoint"
> #   override[util-linux]:rename from ALTERNATIVE_${PN} data.py:116
> [expandKeys]
> #     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
> lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
> nologin taskset"
> #   override[util-linux_class-target]:rename from
> ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
> #     " fallocate"
> #   override[util-linux-doc]:rename from ALTERNATIVE_${PN}-doc data.py:116
> [expandKeys]
> #     "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8
> utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3
> eject.1 logger.1"
> # pre-expansion value:
> #   "None"
>
> On Thu, Jul 26, 2018 at 4:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> This probably doesn't do what you're expecting it to do, use
>> ALTERNATIVE_${PN}_append_class-target = " fallocate"
>>
>> You can check with bitbake -e to see what's the difference between these 2.
>>
>> On Thu, Jul 26, 2018 at 3:56 PM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> wrote:
>>
>>> Because the util-linux_2.32.bb recipe explicitely disables fallocate
>>> for nativesdk triggering build warnings:
>>>
>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:
>>> alternative target (sdk/usr/bin/fallocate or
>>> sdk/usr/bin/fallocate.util-linux)
>>> does not exist, skipping...
>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
>>> alternative provide sdk/usr/bin/fallocate:
>>> sdk/usr/bin/fallocate.util-linux
>>> does not exist
>>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
>>> alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate
>>>
>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>> ---
>>>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>>> b/meta/recipes-core/util-linux/util-linux.inc
>>> index ed5c618750..504f3c5b61 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -206,8 +206,9 @@ do_install_append_class-native () {
>>>  ALTERNATIVE_PRIORITY = "80"
>>>
>>>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
>>> switch_root"
>>> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
>>> fallocate unshare"
>>> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
>>>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
>>> +ALTERNATIVE_${PN}_class-target += "fallocate"
>>>
>>>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>>>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
>>> --
>>> 2.18.0
>>>
>>>

