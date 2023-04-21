Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D62C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 12:48:02 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10570.1682081278421486355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 05:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuNNww03P8FCVRkcXsqp+RsWujSb3U8/ee0etW78vavm5oGYdNdo72ld1TyVmoKoUAoL6aUEY8X8yI8wxYFCJ/g2j4ZrnDqfbkJRhUXsvwwHebrk+lI9KpgJcnB17EbGUKVi5iAjGxz3QmwlwDShw0ggunWTfKDu5A+qmzS3lqgnqw28WwcJ2J4xep/Emcy2yYN1QsbCRefNlZMqxq7OckPObsQuatQMZe5YZi/7z6NvFySZoPa2K06ol3OUiy8a+uzKyMxgZXqzMpDm6GmwsrAs7HQLJ9jDXIVhbLblUw52DTh1n/QrwDMamLn7vrbcbaWAt67iWdrWR3s1lJNdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HdIa2m5ThXTlcM9P1rJvzwO5Kfc51RgmEaWAiu0p8I=;
 b=LTIKOKFwmWuO2xVt4Yr3BcxEH7lloTH64tJLzMcLT8QRnxkLSUnNV0SyeavTiGZQKnwYmg/6Q/7DhDsfyE25xHSOy/hHCmtRrTFOahVIy3CLSOoWbbYnEeV80u8tvj/XuEQLzBihsvmlnhxbR8w5Uj+YFGAE1EgpubUyfbUiSASMKUylW7GlpKnD1hwf2pevRyX6lbVTyNpad1wufV6yhc0pbM4unV9taxpxdbYxNZF9HHHahQu9lg9aafpp9XQiuZm+12tf6I52ONlKkSonmLZoTrq3AoRfxhVMExaFNx61gqAaAn35GobVFlcmVWEjcmVOUpWiwQku/H4tFbIXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HdIa2m5ThXTlcM9P1rJvzwO5Kfc51RgmEaWAiu0p8I=;
 b=uMFxuQUh4hFJebCabg6V0IgXFHdVcT8s/AvQZUv3aHgyGdqgNw5h2fu/RzinZEvWMQ9t9JFCqEvNpIOkHy69S1rx9eGMkIEiPYd/J3e2g76ok/B7Hq/RnrL8SqASVAbodlLqc6XegQRQa6MxR7KVa51oEbPLVqSUCAx5bpY/8g0=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Nathan Rossi <nathan@nathanrossi.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Topic: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Index: AQHZdC0REvWm4ySVhUO4rhmfRk4UCq81pMeAgAAIOuqAAAlGIw==
Date: Fri, 21 Apr 2023 12:47:54 +0000
Message-ID: <DB4PR02MB10030AB1EDBA33EA8FC8E82DCE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230421084052.2675963-1-kubiznak@2n.com>
 <CA+aJhH16TxvXisfH=E4LMQJz3UzcqVdAcDpFCVxEZUe5HoKhAg@mail.gmail.com>
 <DB4PR02MB10030A06B7DBE76E6892847EBE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030A06B7DBE76E6892847EBE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DB9PR02MB9947:EE_
x-ms-office365-filtering-correlation-id: ad21ec58-e3e1-40c5-ebbc-08db4266a056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlfDTKmMsKe64kAXyKxeQRAUBLN+xHSfFgJJjpsVpyN+Vhf7y5JwRGckTsV7M6I7BGaG2YWvhwm7XzbOSQ8hTq0DHXidojQrBHPoAA7M3myEH/94IrRCLEAlRvf2IpI6QfXWYnGPuLz81wlW+SnTLrnaD/QuUP7ouoOjnCNwMR2tsH9t6NI8cDL2QmX7eEBxXwKly8Oe8JmEOvwOTZj/+Yl6c8dU2FD3uMgLLHecfFjgZOCD7k2b78QrDatflC5vcToNMdXb1udN/zi4LN+qRAqEDKkiyEnZM47QYFCsEFWx8a0duQNZRYD82XNSMVATbDUtwItLFP/R2v9aa5RY1ontMbwBvZSQoje/gB6mFAJxlRNLn/GS0NKm+AmYTFbMKjDo/+zwD1RYDvN7YrBIlzE2PfLu+yZGyZm6eVLizLWZKPZuMo5ini4JdqzK2MsPXGP3EudHHte2Z/Q6TuTf2ohOTw6/nTJWDq2TfhPXR3rl5ArpXv1rbVXKsSrEKW0yP2QhubzWeZnirsDJkSPYFruRO4qhkfd8OenIW/uECWGsJzqLOWTDufWlAdIeEp3anr+VzajpQNNmTqv6lxU6rEYeWbUdlsKCCuSykx+eM+8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(966005)(316002)(66476007)(66446008)(66556008)(71200400001)(76116006)(91956017)(64756008)(66946007)(4326008)(6916009)(66899021)(86362001)(478600001)(55016003)(7696005)(5660300002)(52536014)(8676002)(2940100002)(8936002)(122000001)(83380400001)(2906002)(38100700002)(41300700001)(38070700005)(33656002)(6506007)(9686003)(26005)(186003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?S7j616W2Ah5eZhevL6FvhBUP4aMaU5WlZVFwfVTVYLMvAq5vUoUuWZoGUz?=
 =?iso-8859-2?Q?L5BiJQ5j+1H/md3gYQrNJSYugJtb/DvO88q8LMHPses0VS+VbfT/0IDnLi?=
 =?iso-8859-2?Q?g9ZZlwtLLG6G1yr8b5s47Z+501tMNx2drOaZhqTs3lnP42NeBuM8xJIDs8?=
 =?iso-8859-2?Q?I23Gz7mYBetwDrGDEweGnIEy6B7hmlQuQ71pAl+OJrGuXLDlPUAnDeGLKo?=
 =?iso-8859-2?Q?YYb6R8+qplLBYr/L1H1KFr9mB/6fFbuc2MeHM9gC67w62vqktZuELqdhlP?=
 =?iso-8859-2?Q?fcQUriA7A1Rjdyyv1/h6pz5HzcAzQ75phHWzIk5K1nvqlTxlmsBlpLJh4H?=
 =?iso-8859-2?Q?/1i/BsOI6LRvCugM8fAo3RoNU2uYzY5jkraP6OothN6a3l2o1nYIn5NY1Y?=
 =?iso-8859-2?Q?wBCUieZvkDX0J74W8GVh2Ho8k84ZD7J+180+663rw9fIVwZV4b8NLUf7gC?=
 =?iso-8859-2?Q?gEUQGG9mNky8/S9gHMr0/wnm+p4/syt53arVouJYUb+6XCAOVoRFxugjYW?=
 =?iso-8859-2?Q?sgGkW8K6MDAiAUdHmjQQY+N6DYxVRCV38O5PhIp5hX85BUHOCpiWJXOB+P?=
 =?iso-8859-2?Q?W3GQTzBZxbyR7jnbPlI7722LUkC1FRNb23jSuzwl0MNen4KhPT148mSBZW?=
 =?iso-8859-2?Q?OHqoKTGK0+yuHVj/P4wnWRWpCo8LQHcvCoQcUmFhAMZtcrrjfl4pW3ZbIG?=
 =?iso-8859-2?Q?1NjDHFd1dUBQGwODn0DD08sq1IBnmJiauq+nbBr9qzDZmHvHCaWZ01E4rN?=
 =?iso-8859-2?Q?aZYDpOTD81R6FFeAyn7Pq6Os93hLHFP8pe7jcnVwIYnF1PEzon8siYxHIh?=
 =?iso-8859-2?Q?tjEs+hNHb7SZispiyai3s+ey+kALo72xngYRl/9WL6yxYi/xc80e8gcjJx?=
 =?iso-8859-2?Q?7qQUu/3nCWcFhiojmEl9zQ246g+a1mEMhw0Z3qObTivUIeZke13U1isI8z?=
 =?iso-8859-2?Q?PGizf5Sbv23RhI7Em1ur3jClkBugxf3oP8MwguwpshUeyGvg2eL3t1uEQN?=
 =?iso-8859-2?Q?wpFpBqz4E/OMwohO3U13lc6zInJbXwkV85gF6E7kgWI4wpSfNPJbWDe0fu?=
 =?iso-8859-2?Q?l1Ruuji5MbNcRk4QY23SeDydgthoHtsGBz2nE0lYetgbmHxZvBLPsaB9sa?=
 =?iso-8859-2?Q?/NnZN3OMafhfhS13QIBM2D5DVBgDgccuWqk9VZ48FiL3jePxpMfMOZl/xo?=
 =?iso-8859-2?Q?BU36vTDF1uRCTIMk3CbT6SO/a7NuBZ3h2zTwa92K3/9oAzoMzSemceVtem?=
 =?iso-8859-2?Q?Bqlx1yIYAsdsbZXj0Xa2HwMf51NFOs/xb3JT9XcABSRhSnqhqd6QeV08KZ?=
 =?iso-8859-2?Q?innhiaHHHBh0FRhvdac/M8W9K7WNpYqYPlJDM7ZyphPiXgQNrF7nX/Xcxx?=
 =?iso-8859-2?Q?EABYHb5kw0zUnkRgbU5joMrQi7iTAJHsLnqCAjPGCOoJ4tNtFL+6wV85A1?=
 =?iso-8859-2?Q?HHq3JZW+egjF/hh991ULwfoiR+K460gaa+6FMXoprfJzM4M+g8DONllUK2?=
 =?iso-8859-2?Q?cQjAaiQEdrixChMGDl9XuAEgXj34VROtwK5ieBgiALKCB5OeijenHL8b+b?=
 =?iso-8859-2?Q?AfVn4CBHXz9v76ePxV3/UL8WNqNc6wER45r1pjyNgQFX6zpUcmzUihErUW?=
 =?iso-8859-2?Q?cAWg0QRXpQgZo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad21ec58-e3e1-40c5-ebbc-08db4266a056
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 12:47:54.6788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZM3ACiQUWlO5EHlK1Q98gaylBhuw0WzRzCyMmHoDlN3N/xo/95/5qmh9XXRCccf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 12:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180285

> kernel-devicetree.bbclass does the same translation dtb->dts

I mean dts->dtb, of course. The point is dtb's are expected on the input.

Petr

________________________________________
From: Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>
Sent: Friday, April 21, 2023 2:30 PM
To: Nathan Rossi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts=
 files to build

Hi Nathan,

Thank you for great suggestions. All of them are valid and I will update th=
e patch once we discuss the .dtb -> .dts mapping.

> I am also curious why you need to handle this mapping of .dtb -> .dts.
> Do you have an example recipe that is using this class in this way?
> Because the ".dtb" in KERNEL_DEVICETREE is specifically because the
> KERNEL_DEVICETREE variable is pointing at kernel makefile targets.

I don't have an example of a particular recipe, but how about EXTERNAL_KERN=
EL_DEVICETREE variable, used in kernel-fitimage.bbclass? Albeit I don't use=
 this variable in my recipes, I believe it could be used for both classes n=
ow with simple assignment DT_FILES =3D EXTERNAL_KERNEL_DEVICETREE.

And if for whatever reason someone uses a custom variable (like me), they w=
ould still expect dtb's rather than dts's. I didn't find any example of usi=
ng lists of dts files. Contrary, kernel-devicetree.bbclass does the same tr=
anslation dtb->dts and it even warns about dts being provided (see normaliz=
e_dtb()). I didn't want to be that strict here (if someone has a list of dt=
s files, while not to use it directly) but in general, I expect a list of d=
tb files will be much more common.

Kind Regards,
Petr

________________________________________
From: Nathan Rossi <nathan@nathanrossi.com>
Sent: Friday, April 21, 2023 1:44 PM
To: Petr Kubiz=F2=E1k - 2N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts=
 files to build

On Fri, 21 Apr 2023 at 18:41, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
>
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>
> Since many machine configs contain a list of dtb files
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.
>
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..8f348f1370 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
>
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files to build. If=
 empty, all dts files are built."

Worth noting in the doc string that DT_FILES paths are relative to
DT_FILES_PATH.

> +DT_FILES ?=3D ""
>
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
>
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES")

If this populates the variable dtfiles with DT_FILES already split it
can fall back to os.listdir if empty, this avoids the need for the "if
filter..." logic within the loop:

dtfiles =3D d.getVar("DT_FILES").split()
dtfiles =3D [<renaming for dtb> for dtfiles in dtfiles]
for dts in dtfiles or os.listdir(listpath):

> +    filter =3D [ re.sub("dtbo?", "dts", dtfile) for dtfile in dtfiles.sp=
lit() ]

This regex is a bit problematic, it will substitute any part of the
filename and not just the extension suffix. E.g. "test-dtbo.dts" ->
"test-dts.dts". The expression might need to be something similar to
"\.dtbo?$".

I am also curious why you need to handle this mapping of .dtb -> .dts.
Do you have an example recipe that is using this class in this way?
Because the ".dtb" in KERNEL_DEVICETREE is specifically because the
KERNEL_DEVICETREE variable is pointing at kernel makefile targets.

Regards,
Nathan

>      listpath =3D d.getVar("DT_FILES_PATH")
>      for dts in os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
> @@ -134,6 +139,9 @@ python devicetree_do_compile() {
>                  continue # skip non-.dts files and non-overlay files
>          except:
>              continue # skip if can't determine if overlay
> +        if filter:
> +            if not(dts in filter):
> +                continue # skip if dts not in defined filter
>          devicetree_compile(dtspath, includes, d)
>  }
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180281): https://lists.openembedded.org/g/openembedde=
d-core/message/180281
> Mute This Topic: https://lists.openembedded.org/mt/98406619/3616963
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [na=
than@nathanrossi.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

