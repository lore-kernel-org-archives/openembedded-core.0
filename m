Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.50])
 by mx.groups.io with SMTP id smtpd.web11.5257.1617268775013681176
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 02:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=a/WWLM1o;
 spf=pass (domain: kpit.com, ip: 40.107.139.50, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKKccI3pE4oFfdk//hjNxHu0Ygp0Fn4nthM6yMkmJZY7GPEu7hfuIQ7IC+1u8u4NJ4PQm/ttUaTH7mvXjAxHlhh07ouWlTw7OhFEDRnCOt5sVAr6n2C0d989V5bSiRKRt8+V4mB0LVnuYuMMUvcM6yeWlqeKu84qsRy8Z8Z9aw+P0I/hv7qLYO/6ErEK7UtdBq/6gH4VJm6aFVhyhF/W8weA98TgYy6mX2IOBPKUSRwNmWYdJaaB12ZSHGCu2gWZJiIi5jTaEGYifkZNapI5L0SAEqTKvt9tFVGWRIXZDMhqduWieUZ+lCvguiqvVQLgoJrkQJdfAmgfmgoPJ7sS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oansMFt8UJ3irOIlV6xMf+kdH6bNHLsvO9XUFyGAVr4=;
 b=QafagI3bsR9GrU2YByix0pmEVe+QimYAHPtHeWNgardxPQwWWGg1nyDdfN72Lr3yFEeU1paK+lfGZmv7xKF+jzlXQhr0aYaCA5VXoPbTtdqs3OTA5rgGJTjHS8Mp1ukSjAGP4ncC5IY+qYIopLgIoDg/87OL2oEzWPMjZkjHY0JulInd0ZFcGzbVG/LJacYyapG7Rmhly6EaLnCrNwnYNwdaPGfTpKmAroYSHVFjN67MP6xzf3izoKfjsi/SgzuMkAlZOsnsYG+Kgjdq3Qp3DH5h2AL/G/3xSXGcvZZ2zegSUY5pAINuf575G5Qh+TKGiT6mQyyMn11eCMIfPv5pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oansMFt8UJ3irOIlV6xMf+kdH6bNHLsvO9XUFyGAVr4=;
 b=a/WWLM1oZx2a0lollj/F3JfCY8jKLj2jDHcylBsl/d75ne/C3rtxAvZMFj3+TloG8Lzv6sg+UZNh8XRJAFmPD1W/YSZaHGcoIeLnWcZ4KkhwaofXrWEs4gIrPKFYBLJGLG9Y+mOG6b2wWiWBFSvtRKj1fZVupS8OELZnHq9pC0M=
Received: from MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:66::18)
 by MAXPR01MB4423.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 09:19:23 +0000
Received: from MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3031:f4cd:426c:b785]) by MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3031:f4cd:426c:b785%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 09:19:22 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, Purushottam Choudhary
	<Purushottam.Choudhary@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14145
Thread-Topic: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14145
Thread-Index: AQHXJlJHl0euW9Ojg0OQJFbvctSch6qeYxwAgAD65d8=
Date: Thu, 1 Apr 2021 09:19:21 +0000
Message-ID: 
 <MAXPR01MB323006DB564C8E9D11E2F4A1997B9@MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210331172104.11877-1-Sana.Kazi@kpit.com>,<CAOSpxdZ=o+iNofgOJez9J0k1_fT3kHBaCTpoWCrJ_2sHnrpy3g@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZ=o+iNofgOJez9J0k1_fT3kHBaCTpoWCrJ_2sHnrpy3g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2401:4900:5020:ea34:c967:f6eb:e575:7c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 571faaf6-c348-4dfe-f583-08d8f4ef3ce4
x-ms-traffictypediagnostic: MAXPR01MB4423:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MAXPR01MB442335B70FC194B016A37520997B9@MAXPR01MB4423.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:376;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SIQFH4b9rpFGSlMQiwUTALGkdLQI5cdAzt0RHonaEKon5pYExU7HuFSKZnYC9uuhV+LBBdvzduCVj0jy/yprm+VbITDCxsRUIWL0MKBsCqC0ZoAzH63OZaeZ+Q9Ap4GG9OGfcTfh1AsRyisqy8ZHbJi6GK+c9LrzR6Y5qMAGWegShshG6SE5C0C6a0QtnIULRWFHFj9DUXxxVTM+rMoQSMMHfXWx1Q1raSHrZRPFGKM/WZtpSXMo1ABDrheacuafCzhMLRpNI6Vds9uqKLxTyWD7oNO3PqDgZVt8WXiDmD5rQQwznAP9Hid/Nu+z24/VLoGZMeNeWOmFVKo0b/7ZjELo3zT1wmRRBrSiMp16gg2EOPQLqHbsi3+tGq+2EeeKVBzP6wbdKqWnQe+b4qPZYlu6iTLpApfBiY5Ktfz/X5msLWymiLliLjBhDSMTMRAHSjZQ1crmx/u+G9kzZxzeXO7m5BiqbpvLXGBDEYGEfWfttGOwctKnYlV2LnlDgUTYUXr7LNqeUQYrLJcIG0sXWS9ywsPtfQCTxna0l+44SE4IsFkMb11xFh33a5RgsphBuXvrUyIPuPvc13pnLjEoNPsurtoYSKzxWqq1EXSqz4c6vW1v+At1DZ/oUxDR/l0tIxLdvVd0/OGBsFAyTY5yXS9lRJ0sL+OAHX4MXdIfp9Jfc1SwkFWr+Li5TAimYsDRZLXznbnDQjWN2jZBHPITAJbj9bQTScGP6svOn6fadjix48f0yiMUXCOZFG1wkSnvIcWhSZje/shOkW+LxCpuvQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(99936003)(55016002)(107886003)(53546011)(33656002)(38100700001)(66946007)(71200400001)(9686003)(2906002)(83380400001)(5660300002)(966005)(6506007)(66574015)(76116006)(186003)(166002)(45080400002)(478600001)(4326008)(19627405001)(86362001)(8676002)(316002)(18265965003)(66476007)(6916009)(7696005)(91956017)(66446008)(8936002)(64756008)(54906003)(66556008)(66616009)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?UKfxgBxr5QJ+5M+svpsbqQR9vAJrJL2tZEl8SAQ1VdrnykI+F57RoLt2WL?=
 =?iso-8859-1?Q?AKto0ViRrYXz2pqRKoLIS18HTLEZFiM93CExUVdDUOTD5puceLSZrHyyUM?=
 =?iso-8859-1?Q?R7rnlZBuNYXfo6jGva/+97VFGowxKZ5aaRYSv43dmYUnBdWuU+WCUuSd2k?=
 =?iso-8859-1?Q?NeHrsmlTNSuAzovSGfQdxMvUMTbV3l/oOX5QDb5uIHP8vfLmw4A2Uct8f3?=
 =?iso-8859-1?Q?aITzJKIOoWRxqC4yCLY+Nttx3DDrMj+qqiFXpgzpHZs1eOOuZdOz9oJweQ?=
 =?iso-8859-1?Q?TqZrVl96dMLPgXNHptwtOmmPHJ6vCmiOacWm3+1rtpyMbjoSDQyuBM2+eI?=
 =?iso-8859-1?Q?mxa5DVEetSY0vG8MwwA/8Qj20kXjEuG2FZLVAxJsXZayOCtzl68XuDgWgb?=
 =?iso-8859-1?Q?ZBZ2KLawQD7+iT7Dfv10F8sJOKdez1mtNx310JfQUvdXgDACqUaEwwD9qe?=
 =?iso-8859-1?Q?KJ7pfJIoD4wzGiiCLaWuaQ2VB4s9ZWwfEdbzl6g0r5H0k4ztESMl7Tnvrl?=
 =?iso-8859-1?Q?WyLqO517uszJZoa9YvhJxlyD0pjDcGq6xgMJ2KI2fPJjQyqpwZ+icQ6EQe?=
 =?iso-8859-1?Q?Ku0NZjFdyNz5D6KJt5alN294cP9t2nqJIwDbLTfhAijYl17bUDkJxaSkF8?=
 =?iso-8859-1?Q?LVUPIZ3O+/HFSIhGZ5E2Bcfu57wI9csvF8LStm7P783OGHr0a5HL9lTSXi?=
 =?iso-8859-1?Q?E0hzGRiKfbSoOtlvtQPeGm5i7GpPVKeI72bTt7GDin2lcQPSz2qpkmiNEi?=
 =?iso-8859-1?Q?7Q8m01ouGmNKSAmwhiFzJSY4vOerpvLudx+8b3ymbOMgHVc7IfeB0jPVtD?=
 =?iso-8859-1?Q?gEMX+9MpZ6FNgN+VcKUgIllRCQhTGjzu1XCTBD4B1okxehcKLR4GNO0kTw?=
 =?iso-8859-1?Q?pnBCchmZnUeqIA9+Weap2oCfmPeG0nu2J0StmjwW018DtLvkO45a8eJcSW?=
 =?iso-8859-1?Q?YwJz0u+YXEN2D7sczMknNwqR9VPQ9jvyTLR3zLBUZ1xYiNZwyqtgKu9Ip5?=
 =?iso-8859-1?Q?Filai6Nl0ka6uQbs9D1K/9XeZ82QLwjxsJtt8qu0QcQ3ekRC2AcCvRjeim?=
 =?iso-8859-1?Q?Y7y0+faEkXPc/jwLm4gBJ6b8Q5pr24sYH4zXABGactVG6s64T64EWmgDVv?=
 =?iso-8859-1?Q?OvPs9ygata8USXqrscE+vCyvh0XYFMMnWrP+VlVbWEdyWW5Ehzco1qkEv6?=
 =?iso-8859-1?Q?hGWwxNW/CSA3uAYTy+boUneXh9qptLz3/P26b6ipvPVW1nnUQ+ZlrzajyS?=
 =?iso-8859-1?Q?xbFOdjQQ/XusGlr31pR5PLxK44jT0/aBDR/6Jn9tdSjqcPlXL4Drcka83k?=
 =?iso-8859-1?Q?RtiYw27CQ6k4QpLKysXIs0TbqXc/GXFOVnrIsd/Ik1odHCs9jSlr8FZenM?=
 =?iso-8859-1?Q?HY/pvXQAbdU5AaWmEClrBbWwpFZdYhcXaX3vWc1Oygc2G6yc4A9oipxbyd?=
 =?iso-8859-1?Q?tULCyUiGkRXc3TmL?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 571faaf6-c348-4dfe-f583-08d8f4ef3ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 09:19:21.8720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSAnd0bqAQoNwJhAPcgHamWcbOzCrcVCOYcmMsFdRlWDgSRIyIxqznhshrcTDIJl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4423
X-Groupsio-MsgNum: 150140
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_"

--_004_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_"

--_000_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I have verified the patch on dunfell branch and it builds successfully.
Please refer the attached do_patch log.

Thanks & Regards,

Sana Kazi
KPIT Technologies Limited


________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Wednesday, March 31, 2021 11:31 PM
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lis=
ts.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.=
Parrakat@kpit.com>; Purushottam Choudhary <Purushottam.Choudhary@kpit.com>;=
 Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-1414=
5

V2 also fails to build:

ERROR: openssh-8.2p1-r0 do_patch: Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/openssh=
/8.2p1-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2020-14145.patch
patching file sshconnect2.c
Hunk #1 FAILED at 102.
Hunk #2 FAILED at 119.
Hunk #3 FAILED at 159.
3 out of 3 hunks FAILED -- rejects in file sshconnect2.c
Patch CVE-2020-14145.patch does not apply (enforce with -f)

Before submitting please verify that your patches both apply to the
head of the dunfell branch, and build as well!

Steve


On Wed, Mar 31, 2021 at 7:21 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> (From OE-Core rev: 38482edf1a31ed0735b746cf0ab3e1adda4199d1)
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  .../openssh/openssh/CVE-2020-14145.patch      | 90 +++++++++++++++++++
>  .../openssh/openssh_8.2p1.bb                  |  1 +
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1=
4145.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> new file mode 100644
> index 0000000000..0046ee1a51
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> @@ -0,0 +1,90 @@
> +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 18 Sep 2020 05:23:03 +0000
> +Subject: [PATCH] upstream: tweak the client hostkey preference ordering
> + algorithm to
> +
> +prefer the default ordering if the user has a key that matches the
> +best-preference default algorithm.
> +
> +feedback and ok markus@
> +
> +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
> +
> +Upstream-Status: Backport
> +[https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2Fb3855ff053f5078ec3d3c653cd=
aedefaa5fc362d&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C4b74e63f0ba745d0=
e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375281050765=
88451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFEdHjP9Fp%2BlrVEtby1zBa5W%2BlrkVHH=
FVJgMOk%2BvDusY%3D&amp;reserved=3D0]
> +CVE: CVE-2020-14145
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
> + 1 file changed, 37 insertions(+), 2 deletions(-)
> +
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index 347e348c60..f64aae66af 100644
> +--- a/sshconnect2.c
> ++++ b/sshconnect2.c
> +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, =
struct ssh *ssh)
> +       return 0;
> + }
> +
> ++/* Returns the first item from a comma-separated algorithm list */
> ++static char *
> ++first_alg(const char *algs)
> ++{
> ++      char *ret, *cp;
> ++
> ++      ret =3D xstrdup(algs);
> ++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
> ++              *cp =3D '\0';
> ++      return ret;
> ++}
> ++
> + static char *
> + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
> + {
> +-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
> ++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =
=3D NULL;
> ++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D=
 NULL;
> +       size_t maxlen;
> +-      struct hostkeys *hostkeys;
> ++      struct hostkeys *hostkeys =3D NULL;
> +       int ktype;
> +       u_int i;
> +
> +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hos=
taddr, u_short port)
> +       for (i =3D 0; i < options.num_system_hostfiles; i++)
> +               load_hostkeys(hostkeys, hostname, options.system_hostfil=
es[i]);
> +
> ++      /*
> ++       * If a plain public key exists that matches the type of the bes=
t
> ++       * preference HostkeyAlgorithms, then use the whole list as is.
> ++       * Note that we ignore whether the best preference algorithm is =
a
> ++       * certificate type, as sshconnect.c will downgrade certs to
> ++       * plain keys if necessary.
> ++       */
> ++      best =3D first_alg(options.hostkeyalgorithms);
> ++      if (lookup_key_in_hostkeys_by_type(hostkeys,
> ++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
> ++              debug3("%s: have matching best-preference key type %s, "
> ++                  "using HostkeyAlgorithms verbatim", __func__, best);
> ++              ret =3D xstrdup(options.hostkeyalgorithms);
> ++              goto out;
> ++      }
> ++
> ++      /*
> ++       * Otherwise, prefer the host key algorithms that match known ke=
ys
> ++       * while keeping the ordering of HostkeyAlgorithms as much as po=
ssible.
> ++       */
> +       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
> +       maxlen =3D strlen(avail) + 1;
> +       first =3D xmalloc(maxlen);
> +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *host=
addr, u_short port)
> +       if (*first !=3D '\0')
> +               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
> +
> ++ out:
> ++      free(best);
> +       free(first);
> +       free(last);
> +       free(hostname);
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.2p1.bb
> index fe94f30503..17965557a7 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outloo=
k.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fporta=
ble%2Fopenssh-%24&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C4b74e63f0ba74=
5d0e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375281050=
76588451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dena%2BrAqlj%2BihIcDkex1Y%2Fd6v9=
GZZN%2BJOCwE34psSas8%3D&amp;reserved=3D0{PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.p=
atch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://CVE-2020-14145.patch \
>             "
>  SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
>  SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619e=
dff8bcebdff64e671"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
I have verified the patch on dunfell branch and it builds successfully.</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt;">Please refer the attached do_patch log.</sp=
an><br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><span style=3D"color:rgb(81,167,249)"></span></div>
<div></div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-si=
ze:11pt; font-family:Calibri,sans-serif; margin:0px">
<span style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; b=
ackground-color:white"><span style=3D"margin:0px; font-size:10pt; backgroun=
d-color:white"><font color=3D"#003366">Thanks &amp; Regards,</font></span><=
/span><span style=3D"margin:0px; font-size:12pt; font-family:Arial,sans-ser=
if; color:black; background-color:white"></span></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-col=
or:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><s=
pan style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; colo=
r:rgb(0,51,102); background-color:white">Sana Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-siz=
e:10pt">KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" c=
olor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Steve Sakoman &lt;st=
eve@sakoman.com&gt;<br>
<b>Sent:</b> Wednesday, March 31, 2021 11:31 PM<br>
<b>To:</b> Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;Openembedde=
d-core@lists.openembedded.org&gt;; Khem Raj &lt;raj.khem@gmail.com&gt;; Nis=
ha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Purushottam Choudhary &lt;Puru=
shottam.Choudhary@kpit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhanda=
ri@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-20=
20-14145</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
">
<div class=3D"PlainText">V2 also fails to build:<br>
<br>
ERROR: openssh-8.2p1-r0 do_patch: Command Error: 'quilt --quiltrc<br>
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/openssh=
/8.2p1-r0/recipe-sysroot-native/etc/quiltrc<br>
push' exited with 0&nbsp; Output:<br>
Applying patch CVE-2020-14145.patch<br>
patching file sshconnect2.c<br>
Hunk #1 FAILED at 102.<br>
Hunk #2 FAILED at 119.<br>
Hunk #3 FAILED at 159.<br>
3 out of 3 hunks FAILED -- rejects in file sshconnect2.c<br>
Patch CVE-2020-14145.patch does not apply (enforce with -f)<br>
<br>
Before submitting please verify that your patches both apply to the<br>
head of the dunfell branch, and build as well!<br>
<br>
Steve<br>
<br>
<br>
On Wed, Mar 31, 2021 at 7:21 AM Sana Kazi &lt;Sana.Kazi@kpit.com&gt; wrote=
:<br>
&gt;<br>
&gt; From: Lee Chee Yang &lt;chee.yang.lee@intel.com&gt;<br>
&gt;<br>
&gt; (From OE-Core rev: 38482edf1a31ed0735b746cf0ab3e1adda4199d1)<br>
&gt;<br>
&gt; Signed-off-by: Lee Chee Yang &lt;chee.yang.lee@intel.com&gt;<br>
&gt; Signed-off-by: Anuj Mittal &lt;anuj.mittal@intel.com&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&=
gt;<br>
&gt; Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2020-14145.patch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | 90 +++++++++++++++++++<br>
&gt;&nbsp; .../openssh/openssh_8.2p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 1 +<br>
&gt;&nbsp; 2 files changed, 91 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CV=
E-2020-14145.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145=
.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0046ee1a51<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<=
br>
&gt; @@ -0,0 +1,90 @@<br>
&gt; +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
&gt; +Date: Fri, 18 Sep 2020 05:23:03 +0000<br>
&gt; +Subject: [PATCH] upstream: tweak the client hostkey preference order=
ing<br>
&gt; + algorithm to<br>
&gt; +<br>
&gt; +prefer the default ordering if the user has a key that matches the<b=
r>
&gt; +best-preference default algorithm.<br>
&gt; +<br>
&gt; +feedback and ok markus@<br>
&gt; +<br>
&gt; +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fgithub.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2Fb3855ff053f5=
078ec3d3c653cdaedefaa5fc362d&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7C4b74e63f0ba745d0e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637528105076588451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFEdHjP9Fp%2B=
lrVEtby1zBa5W%2BlrkVHHFVJgMOk%2BvDusY%3D&amp;amp;reserved=3D0">https://apc0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenss=
h%2Fopenssh-portable%2Fcommit%2Fb3855ff053f5078ec3d3c653cdaedefaa5fc362d&am=
p;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C4b74e63f0ba745d0e18608d8f46f0=
bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637528105076588451%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DFEdHjP9Fp%2BlrVEtby1zBa5W%2BlrkVHHFVJgMOk%2=
BvDusY%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +CVE: CVE-2020-14145<br>
&gt; +Signed-off-by: Chee Yang Lee &lt;chee.yang.lee@intel.com&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---<br>
&gt; + 1 file changed, 37 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/sshconnect2.c b/sshconnect2.c<br>
&gt; +index 347e348c60..f64aae66af 100644<br>
&gt; +--- a/sshconnect2.c<br>
&gt; ++++ b/sshconnect2.c<br>
&gt; +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostke=
y, struct ssh *ssh)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/* Returns the first item from a comma-separated algorithm list */<=
br>
&gt; ++static char *<br>
&gt; ++first_alg(const char *algs)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *ret, *cp;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D xstrdup(algs);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((cp =3D strchr(ret, ',')) !=3D N=
ULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; *cp =3D '\0';<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static char *<br>
&gt; + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short po=
rt)<br>
&gt; + {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail, *avail, *first, *last,=
 *alg, *hostname, *ret;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail =3D NULL, *avail =3D NU=
LL, *first =3D NULL, *last =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *alg =3D NULL, *hostname =3D NU=
LL, *ret =3D NULL, *best =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t maxlen;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys =3D NULL;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ktype;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u_int i;<br>
&gt; +<br>
&gt; +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *=
hostaddr, u_short port)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; options.nu=
m_system_hostfiles; i++)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; load_hostkeys(hostkeys, hostname, options.system_hostfiles=
[i]);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If a plain public key exists=
 that matches the type of the best<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * preference HostkeyAlgorithms=
, then use the whole list as is.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Note that we ignore whether =
the best preference algorithm is a<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * certificate type, as sshconn=
ect.c will downgrade certs to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * plain keys if necessary.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; best =3D first_alg(options.hostkeyal=
gorithms);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lookup_key_in_hostkeys_by_type(h=
ostkeys,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sshkey_type_=
plain(sshkey_type_from_name(best)), NULL)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; debug3(&quot;%s: have matching best-preference key type %s, &qu=
ot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;using HostkeyAlgorithms verbatim&=
quot;, __func__, best);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; ret =3D xstrdup(options.hostkeyalgorithms);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; goto out;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Otherwise, prefer the host k=
ey algorithms that match known keys<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * while keeping the ordering o=
f HostkeyAlgorithms as much as possible.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oavail =3D avail =3D xstrdup(op=
tions.hostkeyalgorithms);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxlen =3D strlen(avail) + 1;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D xmalloc(maxlen);<br>
&gt; +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *h=
ostaddr, u_short port)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*first !=3D '\0')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; debug3(&quot;%s: prefer hostkeyalgs: %s&quot;, __func__, f=
irst);<br>
&gt; +<br>
&gt; ++ out:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(best);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(first);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(last);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(hostname);<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/met=
a/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; index fe94f30503..17965557a7 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; @@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.sa=
felinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2F=
OpenBSD%2FOpenSSH%2Fportable%2Fopenssh-%24&amp;amp;data=3D04%7C01%7CSana.Ka=
zi%40kpit.com%7C4b74e63f0ba745d0e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637528105076588451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3Dena%2BrAqlj%2BihIcDkex1Y%2Fd6v9GZZN%2BJOCwE34psSas8%3D&amp;amp;reserved=
=
=3D0{PV}.tar<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://fix-potential-signed-overflow-in-pointer-arithmatic.pa=
tch">
file://fix-potential-signed-overflow-in-pointer-arithmatic.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://sshd_check_keys">file://sshd_check_keys</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://add-test-support-for-busybox.patch">file://add-test-su=
pport-for-busybox.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=
=3D"file://CVE-2020-14145.patch">file://CVE-2020-14145.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &quot;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;3076e6413e8dbe56d33848c1054ac091&quot=
;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;43925151e6cf6cee1450190c0e9af4dc36=
b41c12737619edff8bcebdff64e671&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_--

--_004_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_
Content-Type: application/octet-stream; name="log.do_patch"
Content-Description: log.do_patch
Content-Disposition: attachment; filename="log.do_patch"; size=16090;
	creation-date="Thu, 01 Apr 2021 09:18:37 GMT";
	modification-date="Thu, 01 Apr 2021 09:18:58 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsndmlydHVhbDpuYXRpdmU6L2hvbWUva3BpdC91
cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaC9wYXRjaF8yLjcuNi5iYjpk
b19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcXVpbHQvcXVpbHQtbmF0aXZlXzAuNjYuYmI6ZG9fcG9wdWxhdGVfc3lzcm9v
dCddCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFs
cmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFsncGF0Y2gtbmF0aXZlJywgJ3F1aWx0LW5hdGl2ZScs
ICdhdXRvY29uZi1uYXRpdmUnLCAnbGlidG9vbC1uYXRpdmUnLCAnYXR0ci1uYXRpdmUnLCAnZ251
LWNvbmZpZy1uYXRpdmUnLCAnYXV0b21ha2UtbmF0aXZlJywgJ200LW5hdGl2ZScsICd0ZXhpbmZv
LWR1bW15LW5hdGl2ZScsICdnZXR0ZXh0LW1pbmltYWwtbmF0aXZlJ10KREVCVUc6IFB5dGhvbiBm
dW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBw
eXRob24gZnVuY3Rpb24gZG9fcGF0Y2gKREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24g
cGF0Y2hfZG9fcGF0Y2gKREVCVUc6IFNlYXJjaGluZyBmb3Igc3NoZF9jb25maWcgaW4gcGF0aHM6
CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gtOC4ycDEvcG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3Bva3kKICAgIC9ob21lL2tw
aXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMv
cG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJl
YW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9xZW11eDg2
LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL2ZpbGVzL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9xZW11YWxsCiAg
ICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2gvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9xZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vw
c3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4y
cDEveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bv
a3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3g4Ni02NAogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoLTguMnAxLwogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLwogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy8KREVCVUc6IFNlYXJjaGlu
ZyBmb3Igc3NoX2NvbmZpZyBpbiBwYXRoczoKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9wb2t5CiAgICAv
aG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvcG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bv
a3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdXg4
Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9r
eS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdXg4Ni02NAogICAg
L2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoLTguMnAxL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9xZW11YWxsCiAgICAvaG9tZS9r
cGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVz
L3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJl
YW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC94ODYtNjQK
ICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvZmlsZXMveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvCiAgICAvaG9tZS9rcGl0L3Vw
c3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvCiAg
ICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL2ZpbGVzLwpERUJVRzogU2VhcmNoaW5nIGZvciBpbml0IGluIHBhdGhzOgogICAgL2hvbWUv
a3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVu
c3NoLTguMnAxL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFt
L3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3Bva3kKICAgIC9o
b21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
b3BlbnNzaC04LjJwMS9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcWVtdXg4Ni02NAogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9m
aWxlcy9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdWFsbAogICAgL2hvbWUva3Bp
dC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3No
L3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3g4Ni02NAog
ICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzaC9vcGVuc3NoL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy94ODYtNjQKICAgIC9ob21lL2twaXQvdXBz
dHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJw
MS8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvCkRFQlVHOiBTZWFyY2hpbmcgZm9yIHNzaGQu
c29ja2V0IGluIHBhdGhzOgogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3Bva3kKICAgIC9ob21lL2twaXQv
dXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9w
b2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL2ZpbGVzL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9xZW11eDg2LTY0CiAgICAv
aG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2gvcWVtdXg4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0
L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gt
OC4ycDEvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJl
YW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdWFsbAog
ICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzaC9vcGVuc3NoLTguMnAxL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3g4Ni02NAogICAgL2hvbWUv
a3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxl
cy94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9r
eS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8KICAgIC9ob21lL2tw
aXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMv
CkRFQlVHOiBTZWFyY2hpbmcgZm9yIHNzaGRALnNlcnZpY2UgaW4gcGF0aHM6CiAgICAvaG9tZS9r
cGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5z
c2gtOC4ycDEvcG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0v
cG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcG9reQogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoLTguMnAxL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9xZW11eDg2LTY0CiAgICAvaG9t
ZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2Zp
bGVzL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9xZW11YWxsCiAgICAvaG9tZS9rcGl0
L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gv
cWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzaC9maWxlcy9xZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEveDg2LTY0CiAg
ICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2gveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0
cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAx
LwogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoLwogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy8KREVCVUc6IFNlYXJjaGluZyBmb3Igc3NoZGdl
bmtleXMuc2VydmljZSBpbiBwYXRoczoKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9wb2t5CiAgICAvaG9t
ZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2gvcG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdXg4Ni02
NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdXg4Ni02NAogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoLTguMnAxL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9xZW11YWxsCiAgICAvaG9tZS9rcGl0
L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3Fl
bXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0v
cG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC94ODYtNjQKICAg
IC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvZmlsZXMveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvCiAgICAvaG9tZS9rcGl0L3Vwc3Ry
ZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvCiAgICAv
aG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L2ZpbGVzLwpERUJVRzogU2VhcmNoaW5nIGZvciB2b2xhdGlsZXMuOTlfc3NoZCBpbiBwYXRoczoK
ICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC04LjJwMS9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcG9reQogICAgL2hvbWUva3Bp
dC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9w
b2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdXg4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVh
bS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3FlbXV4ODYt
NjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvZmlsZXMvcWVtdXg4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3FlbXVhbGwKICAg
IC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC9xZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBz
dHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJw
MS94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9r
eS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMveDg2LTY0CiAgICAvaG9t
ZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2gtOC4ycDEvCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzLwpERUJVRzogU2VhcmNoaW5n
IGZvciBydW4tcHRlc3QgaW4gcGF0aHM6CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcG9reQogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcG9reQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3FlbXV4ODYt
NjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3FlbXV4ODYtNjQKICAgIC9o
b21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
b3BlbnNzaC04LjJwMS9xZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcWVtdWFsbAogICAgL2hvbWUva3Bp
dC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9x
ZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEveDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFt
L3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gveDg2LTY0CiAg
ICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL2ZpbGVzL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxLwogICAgL2hvbWUva3BpdC91cHN0
cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLwogICAg
L2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9maWxlcy8KREVCVUc6IFNlYXJjaGluZyBmb3IgZml4LXBvdGVudGlhbC1zaWduZWQtb3ZlcmZs
b3ctaW4tcG9pbnRlci1hcml0aG1hdGljLnBhdGNoIGluIHBhdGhzOgogICAgL2hvbWUva3BpdC91
cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTgu
MnAxL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3Bva3kKICAgIC9ob21lL2tw
aXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNz
aC04LjJwMS9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcWVtdXg4Ni02NAogICAgL2hvbWUva3Bp
dC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9x
ZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0
cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3FlbXVh
bGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvZmlsZXMvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3g4Ni02NAogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0v
cG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS8KICAg
IC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvCkRFQlVHOiBTZWFyY2hpbmcgZm9yIHNzaGRfY2hlY2tf
a2V5cyBpbiBwYXRoczoKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9wb2t5CiAgICAvaG9tZS9rcGl0L3Vw
c3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcG9r
eQogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9maWxlcy9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdXg4Ni02NAogICAgL2hv
bWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoL3FlbXV4ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdXg4Ni02NAogICAgL2hvbWUva3BpdC91
cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTgu
MnAxL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9xZW11YWxsCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFt
L3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3FlbXVhbGwKICAg
IC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC04LjJwMS94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC94ODYtNjQKICAgIC9ob21lL2tw
aXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMv
eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvCiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvCiAgICAvaG9tZS9rcGl0
L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzLwpE
RUJVRzogU2VhcmNoaW5nIGZvciBhZGQtdGVzdC1zdXBwb3J0LWZvci1idXN5Ym94LnBhdGNoIGlu
IHBhdGhzOgogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0v
cG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9wb2t5CiAgICAv
aG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L2ZpbGVzL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0
L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gv
cWVtdXg4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9maWxlcy9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFt
L3Bva3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVt
dWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoL3FlbXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvcWVtdWFsbAogICAgL2hvbWUv
a3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVu
c3NoLTguMnAxL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0
cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy94ODYtNjQK
ICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC04LjJwMS8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8KICAgIC9ob21lL2twaXQvdXBzdHJl
YW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvCkRFQlVHOiBT
ZWFyY2hpbmcgZm9yIENWRS0yMDIwLTE0MTQ1LnBhdGNoIGluIHBhdGhzOgogICAgL2hvbWUva3Bp
dC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3No
LTguMnAxL3Bva3kKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9wb2t5CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bv
a3kvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL2ZpbGVzL3Bva3kKICAgIC9ob21l
L2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3Bl
bnNzaC04LjJwMS9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvcWVtdXg4Ni02NAogICAgL2hvbWUv
a3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxl
cy9xZW11eDg2LTY0CiAgICAvaG9tZS9rcGl0L3Vwc3RyZWFtL3Bva3kvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gtOC4ycDEvcWVtdWFsbAogICAgL2hvbWUva3BpdC91
cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3Fl
bXVhbGwKICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2gvZmlsZXMvcWVtdWFsbAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLTguMnAxL3g4Ni02NAogICAg
L2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoL3g4Ni02NAogICAgL2hvbWUva3BpdC91cHN0cmVhbS9wb2t5L21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9maWxlcy94ODYtNjQKICAgIC9ob21lL2twaXQvdXBzdHJl
YW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC04LjJwMS8K
ICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC8KICAgIC9ob21lL2twaXQvdXBzdHJlYW0vcG9reS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvZmlsZXMvCk5PVEU6IEFwcGx5aW5nIHBhdGNoICdmaXgtcG90
ZW50aWFsLXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2gnICguLi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9maXgtcG90ZW50aWFsLXNp
Z25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2gpCk5PVEU6IEFwcGx5aW5n
IHBhdGNoICdhZGQtdGVzdC1zdXBwb3J0LWZvci1idXN5Ym94LnBhdGNoJyAoLi4vbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvYWRkLXRlc3Qtc3VwcG9ydC1mb3ItYnVz
eWJveC5wYXRjaCkKTk9URTogQXBwbHlpbmcgcGF0Y2ggJ0NWRS0yMDIwLTE0MTQ1LnBhdGNoJyAo
Li4vbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvQ1ZFLTIwMjAtMTQx
NDUucGF0Y2gpCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gcGF0Y2hfZG9fcGF0Y2ggZmluaXNoZWQK
REVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19wYXRjaCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5n
IHB5dGhvbiBmdW5jdGlvbiBkb19xYV9wYXRjaApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3Fh
X3BhdGNoIGZpbmlzaGVkCg==

--_004_MAXPR01MB323006DB564C8E9D11E2F4A1997B9MAXPR01MB3230INDP_--
