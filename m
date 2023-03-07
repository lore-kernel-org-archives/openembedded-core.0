Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12F9C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:46:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10844.1678182384350111197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCohb8zkyENBlGE8wmN+sR8my50vFJCedp4pRtmiPOXbSUdXB3X3V+R3BBWJAHLSarHbtonHkQos+lOoNPUDDjozy5J/IC3h58lChEY6nr3RrxFcrzNGMLn8McNucMCgDAwP0BwuxbLJCvWEQ1HvU43KBztzqdbSzIkDTjpZfpB9V4wYqvaPP1X72m69trmTCdnlAW86h8LayPyxCCDX01kydH5u6QsPtTBVIZCwblWPv8/LLzEmkhdhsHsLTXymrwZrFyev61GQRbc+nD7DpN5eG5xVayf5LcUxOkZf6piduJgDsGivJt42dgoBH89/jNSKu2D2+F3CyJd2sW2Kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs4tdsqdI6HIuVIWdY1AZOGEjdkLboNKZ+4IeP/G/Q4=;
 b=YUJkl1AyO5cErfFrIZn0xFU/8qqT9em/Kfwb5yPr3NjbolpWVDapx5BfKIStvHFSm3TRDFs8VdkrD00+W3zyayF2PfcnNbauEbomv0Wraz35FoCMWESjT4Ja6qf2bCOzQFHzDSMoE2rlTNiKtC9VUfVJnzRbShHwmkw8/zIle4wM8qt6S+VnvyltlKdMCjrWFGJzUZ2IR0w9TElI0X3fso8Zj/wvn4GmC0WAhM4IetwIoCBWnMXUwqWExppgQoieRYZ6NjDIvhqFSbHMMHP6TWnU1y078pAA45/66U+6zRJCtaTDuzaz4+/0mhtAnMwh6p5+uZ+z+TNYfw2pF36lDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs4tdsqdI6HIuVIWdY1AZOGEjdkLboNKZ+4IeP/G/Q4=;
 b=KSZX49j+GmvSzLoTAC43kzkc1FaMWmM3M9JuMnDQz5WZt56oPWEmCXXOhj/uYvze4WuH7v5gbtkB61f8AwoVvRXlj4dYPqqs3kPEihca7XdUJLvp4vl26W9Jfo401Cz59IdHBMJmSZ40TDWWOX5g0L4k4OfmtHVlp8GXY/ldz3o=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] graphene: remove introspection from
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] graphene: remove introspection from
 PACKAGECONFIG
Thread-Index: AQHZQqQ/T48fyHDsPUmIa0YsbTnmUq7vJuRigAADEICAAAOLVw==
Date: Tue, 7 Mar 2023 09:46:19 +0000
Message-ID: <DB4PR02MB10030912A46A13228FF23FA6CE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <17448D1AD5EE07BA.28744@lists.openembedded.org>
 <DB4PR02MB10030B5C7A26DB7E9DA54B42AE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <CANNYZj-CuEp++Fvvt7s7mTd5R3uABk4wv9sYJGcMpe7Gm3EGsw@mail.gmail.com>
In-Reply-To: <CANNYZj-CuEp++Fvvt7s7mTd5R3uABk4wv9sYJGcMpe7Gm3EGsw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|GV1PR02MB8260:EE_
x-ms-office365-filtering-correlation-id: ea97dbd8-6c12-42cc-eca9-08db1ef0cdf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: veyxr/Xg3UPmeoCLurdul0ety/Eo+hFvT4BIBytznUg4BZqVzwZOnsd2p1zD+qTwb26IADCgZlvRf3KnPfcZ4PcYhg5H9I5PXT+rIvSQrDKgdkqHavl6JELpqv2t2zbtjH/+VghDhmjdSJtTPWEfgrgxKA/x5VIjPvjn+rYfjJfCOGKi+tOLEBVyTXIPYwsZmPBQ4nkMxakmgeL79rOkvgCv1axLNhP5jCxreicxA3j4en6or7aJvIzImDPrb8fonQzfhuh2SSHfVLRebl6Tt/7BfL6WTqqNYRoaqJdBW6+LMuBJUt3yvltymzeRKc2PMzA3qcP/WYXYTa8My76daus8oAzxaPoFu+EdomVMvzWNpjfMyQDlzkGhK0mlEwnhEOlmhHGvVP8Kk7kiC/qws+zTauHWyHB712ixW/y1YbgQY3MJhoboAww+r01zyIVM18nz4i8DB7zrEIxrAoWHB/jQNLQCFNJLjD1W0yuqI/wJsR9vPTmq3TqPygPT0acJyjvtp57qQJn8gkV1bZTcGaTK+RzERcjHc643LNc8ebtWAlgWUXF05EtnGXlblY5lP/UhNDltDoCJKGB1RxEVguYIhPK2f3ti/sHYKxG+HqifSvz2BFCLVKzO30bd7Vwq461usRf9VrDOgB0EyVvOqV1EiB9FAdMdj/BzFq/n07/WkWSKpOiQZOqRHBWJ4W2X
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(2906002)(38070700005)(5660300002)(38100700002)(52536014)(66899018)(122000001)(8936002)(41300700001)(9686003)(26005)(186003)(91956017)(6916009)(71200400001)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(53546011)(86362001)(8676002)(316002)(478600001)(83380400001)(7696005)(6506007)(966005)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?ej2G2phZ6X0EKTvaW7rASm7PF2cu6jBOPb2fyzCsuqtOAY0VULiExSoeZq?=
 =?iso-8859-2?Q?2fMFmZ+lv2oV9/vNuD2t7EjZ2Qj1L0aWWP00r8jgUiDVaNEKmFB9XdTIZy?=
 =?iso-8859-2?Q?uCbDAIwE5290PlSo4Px1pcoMelqgcmtlhT4Tv5gbZ1YoNHUNH1YUh9AB7J?=
 =?iso-8859-2?Q?oHDBNwDDstC8YbUnmJPN4EsvJmEbsxq9z+s5/q2pwV8coNojgKdejISlNZ?=
 =?iso-8859-2?Q?E2khr+8LCjycvwXXKV1wb7tFKuvpisNWVMM2lsKenfnx2KFjgS1D/9LBZ0?=
 =?iso-8859-2?Q?rO13Stnym5Pgw8dlirmOVYJlTXb6rMla9giF+ESbiRdBK0ZIim+TYx/nOP?=
 =?iso-8859-2?Q?yeIYmfMWEBE5BLpinRkEVgppXVk+fzvkr37Y8s0ZkUsW2dZoqnr4eXuoh6?=
 =?iso-8859-2?Q?iM4Z0jqZ7UxLF2WPKT10J6PZRpXZgTmKSdYyV8lo3LMuwd23JD/bH2AdLP?=
 =?iso-8859-2?Q?z+kUf8KNNeKXg/LU1uzxrxdzI1u/mpCNoA5wtExco26PcPaHuHsIj/9rMa?=
 =?iso-8859-2?Q?/+Jn0QNvebEdfgrHAZzLOSptdCxiRjkove1YHd8mW/ZD7ea4MjdutDYdo7?=
 =?iso-8859-2?Q?xZTNAEbYAig9rsfJ/ygyx8t9m27HQc64ardRKrIZMxDc2E+WinzbikMbJ9?=
 =?iso-8859-2?Q?5gSLI/VkRoRrByMXGOfFX+ux6cyYe/4eUUuIkqzD4vlQnexruL11dtN1pg?=
 =?iso-8859-2?Q?TCq8HtTVtwU8vJL010J2hBAc3tsZ+NLpUoCXZmCxWWq9L/U+GOVHfjwa/R?=
 =?iso-8859-2?Q?DakcZ1e54/zMCpEmBNZd9NrMhJ1iIqL93IkQMEL5rffd6YXjK67POyJaS9?=
 =?iso-8859-2?Q?0SsAQlTSeJZXNlkYIQ/L4PDXKmcEuD+q12H4mSGgLb293PAUIImBtNXV5I?=
 =?iso-8859-2?Q?tWH6hTQMkgf+mIn1yboCFWY0dTNb7MTvhnpjlbebIQZ+9llKM2G3LyPNfw?=
 =?iso-8859-2?Q?PcFxZbfwJ95tnq689YUhc9B48RYTgyuO761qgJNZs2CJmjHzoA3S3bm+3Q?=
 =?iso-8859-2?Q?G0kR3/o9eZiMbO4PhM/r0QRM/2V2oRdqvh/SkTw+5Axor7NV5nVOOZ8Gah?=
 =?iso-8859-2?Q?T5xuiZySc46sGMPsL3V8QUqwosZ+5h5D3v9867R7QJs93QNbv1CMN0ypKm?=
 =?iso-8859-2?Q?hQz4QZOfNzYc4baHVs1CXsFgvEUN5b5V4QDI6uuOpUGScehgXENOB4oOIH?=
 =?iso-8859-2?Q?SMAAnJhZuJjAsMw7Xnp0phWGzNBLG6I0sAx04nhO+YnHP+ww8nL8ac6i9Y?=
 =?iso-8859-2?Q?/4z4EeAteANBRMCmrVSKlgcPP77Soxn1FZxUdi4n9pyu5KMFNeI615qup0?=
 =?iso-8859-2?Q?HSIJ2TR916cnZSHQ62XhPKRGmAid05D40+z+kr5GYwTYN6t3JHuA6lMTCm?=
 =?iso-8859-2?Q?dPo8RDWUU3CsQmDGoufFbYBx+zRFTcBbka93Ik5iAoNGSzMGVvzPoyRNM8?=
 =?iso-8859-2?Q?xuDw1u6ddB4EPz5tgVr4cJWmYHxLnTjZgJCF3rEfSpXIjZhRAT/1CZ1AS8?=
 =?iso-8859-2?Q?zMBo+wJY3A+9VLru0zc3h6IMs9dEmn30LNqW5OvQIBAWgyOFpIIHwioKeZ?=
 =?iso-8859-2?Q?/gBDbWt0Uk02qvgtdcGQq7dlkk9hPMWlnymPJMnC6OMTj8Gss+/R0oLi6L?=
 =?iso-8859-2?Q?0MsYTnqUrNLK0=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea97dbd8-6c12-42cc-eca9-08db1ef0cdf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 09:46:19.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTEy5WFH3Wsn6/I8DcN9XI8wovOnECFuTDlTghGeh1jOTcbiBVZ90Nkh2sVJ/bVS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8260
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178098

I see, sorry. I expected some kind of "merged" response in this thread.

Cheers,
Petr

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, March 7, 2023 10:31 AM
To: Petr Kubiz=F2=E1k - 2N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] graphene: remove introspection from PACKAGECO=
NFIG

Has been merged long time ago. Pls rebase to master, then ask.

Alex

On Tue, 7 Mar 2023 at 10:23, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
>
> Could anyone have a look at this patch, please?
>
> Thank you,
> Petr
>
> ________________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>
> Sent: Friday, February 17, 2023 8:47 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Petr Kubiz=F2=E1k - 2N
> Subject: [OE-core][PATCH] graphene: remove introspection from PACKAGECONF=
IG
>
> Assignment of "introspection" as default PACKAGECONFIG value does not
> reflect gobject-introspection being globally enabled or disabled.
> As a result, graphene compilation used to fail when g-i was disabled.
>
> Use standard means to enable or disable introspection based on machine
> and distro features, as implemented by gobject-introspection class.
>
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
> index 75c8258d99..120ee80b17 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -9,14 +9,15 @@ inherit gnomebase gobject-introspection gtk-doc
>
>  SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
>
> -# gtk4 & mutter 41.0 requires graphene build with introspection
>  # Disable neon support by default on ARM-32 platforms because of the
>  # following upstream bug: https://github.com/ebassi/graphene/issues/215
> -PACKAGECONFIG ?=3D "introspection ${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', 'neon', '', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'ne=
on', '', d)}"
>
> -PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
>  PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
>
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
>
>  EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178095): https://lists.openembedded.org/g/openembedde=
d-core/message/178095
> Mute This Topic: https://lists.openembedded.org/mt/97024165/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

