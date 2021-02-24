Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.49])
 by mx.groups.io with SMTP id smtpd.web12.376.1614126705763148622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 16:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A7DSszvN;
 spf=pass (domain: windriver.com, ip: 40.107.92.49, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiENG5+L35eGO9Oc/9BJLSampU4oek4/6zU4mn0mBYlN+9zeZv10HMXfnMEiGEOMitUhLhwHYIr7UyrtvZ9IE8NF3GGQYOeVCFi1/Y2tC0e7aGWxWnFWSCdgXggzlxLji3oG0SBVZ7a29rt7Ex7bLhqy//oDy4QsMc4S7aSK2XEjKDB2fMKRWnCkO70E6sy4T7XbCPlZCJK5i3kYkxoTtwFyluz6TutSPaxLNiS6mE+AH85ylMM/LFRR+CS/vp8hO/6sNJ+PfZdA/WvxPFeHJ20i7XoP6gZR6a9Ht5vt51gv6BexrUW20FFpLobYd1IlH51sbmhuaHRS9TIdcJdl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuA9hcMIYvbVPHUCeBZEg/BJ/AYJgLdtRdy0yUQBPSs=;
 b=RHXuLSAxOoRCYKNkb+w/Hkqqt6y1ugh4RIkyzbiT761+yhwKsezoKjazKj822ObQ23ageYYhVpDxKQnEPEtjR9x+X3HzftRhZFtHNDNnzoynvN/aGrSw4ofnLQwk0SiS0DtMtayK7N96wKDevqMAHAOnTPjxxFwPBZZt4g1JvEBTrU/5vrwMzBvJGjGYcEo3K2yz8kbbAUB8JqxJCxKrtNrpaWDWTccb6ER8IsrpQ/Suak2RvsI+s4SpPUr6GiPw3+zw+Rd7tBTNXUJ4uk9KuRShm/irRcTaXsRamWHaCXKZBrSTSRJJOsrVzPuUh9/mx+4a8eghhE9YrYRNGjBW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuA9hcMIYvbVPHUCeBZEg/BJ/AYJgLdtRdy0yUQBPSs=;
 b=A7DSszvN95QPH/21TZDL5D8l07FJid1NGHzE17Py+gKrY+PTGC+nC6ccbTay0vSRQZGbgrzQPgGReBMPPLS+0WuFzhirwbDadSH02lwhYjx0hHiJImJJmnksb3eg3JSJuQjNw4LAzQbIZqqIk7xdhzKxmrPCWA5Uo02eey9hrDk=
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 00:31:43 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 00:31:43 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] mesa: Allow building the iris driver
Thread-Topic: [OE-core][PATCH] mesa: Allow building the iris driver
Thread-Index: AQHXBdRGYws5h6ejyEObq+r+fTEljapmel0Q
Date: Wed, 24 Feb 2021 00:31:43 +0000
Message-ID: 
 <PH0PR11MB517551B295DA5D06BAD7A144E59F9@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <1664CBDF366E1544.31496@lists.openembedded.org>
In-Reply-To: <1664CBDF366E1544.31496@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b499e6c-b3ae-4848-3f75-08d8d85b8f75
x-ms-traffictypediagnostic: PH0PR11MB5048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PH0PR11MB5048B6DFF685A6EBA7764439E59F9@PH0PR11MB5048.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pf8VCMVlOSqwIcQHPuBXhxfXL270+iTqTVBhparSoBa2K94UCr3APuorvZ2PxLZ+ZUGP4d3Hskc13WYWWdIDGLjw6KchlZytOTMT6ZmPYpdGCbtF+YgENBopU5qLWv2WYOOLVa2Z/QRlcxCKvttFfYv3YcbYJ8nDBrXpX+SSc5bgh+gp+JXXSflnes4pRhqeVNZ13BRdtibAJx8RkmiuRmo5DlqJjVoCNYKMZBJRLHoHRYt0jpTMmID7uL9gR9l6e+h3kUbB5ouMe7nTjI5HwIDcabUX8Tcg/zAs56oTrCQkg9o0VPjZhJhEycHngeihQs4CCgHL2XGI9ZSRRIUnELyM6DXyqWw5pnM2AZx4LtMWbY68Je8eW45cgJ30TgscQ0wDthxNoiXvnouWPfP3GRenQoHt31PuAv4vMGxnL5ppK0LdYoIv5poGyUWXeFJ1XT7Kg4ri/C73OMvgJZJV4pxZXpzAUh8bUQ5Hrq1pWXjBt8/Z7WLTFlus3nZSQbA3xHGx0OpKpisxNhpXTswEBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(316002)(53546011)(110136005)(8676002)(7696005)(55016002)(26005)(5660300002)(64756008)(76116006)(9686003)(71200400001)(6506007)(478600001)(52536014)(8936002)(66556008)(2906002)(33656002)(66446008)(86362001)(66476007)(83380400001)(66946007)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?MHvvQpikavezEuSwT5Bv515MhJGM79tGXSzZuaAPPr6W6AXfk1rf6Ez+PQgE?=
 =?us-ascii?Q?QJnG6E4YFuU41b/yMowJ3YmwEhCJsSf/N4HiVuMjBf+ZJ0KrcVwUfD9enloA?=
 =?us-ascii?Q?c1FCwNxWuW6wRtsIgdmUGLj1cvgIDCO7mfdpeclveVnsGvGIkYKU50NYc91Q?=
 =?us-ascii?Q?DkQzWsIUUEV9QOa8c9yGQf7nk/5nvDuwquuxPYqLr7LUg+QFyBreObS5JwMJ?=
 =?us-ascii?Q?PXj7Uphp66nXIbgb4xXzF32mZ/FsYePeY9ibBvku2xlELzJ2fFERLrHTc/a4?=
 =?us-ascii?Q?Edi+c+7IK8gJJrAY/P/vrI7dG/GyvrQbZLOZYHAbC/LztnUj97JCDqib1qtu?=
 =?us-ascii?Q?F2TehNjGVb8VkHivQDs7fNyKIXGbi6bNZlsnVSXPmXWPAlYMI1NZ8DT/huh3?=
 =?us-ascii?Q?bTGfp0VUMPzvA5JojWfQg1RkfF4VlDUNu1DvE6exLesImWfR03XcZHzYAXWK?=
 =?us-ascii?Q?O898qMXaaJbSxto/8L5l9zMmkrbsSz5/r0AvBXPfQHEFoQtxA3B2m6BjF1As?=
 =?us-ascii?Q?FLhSM1zZDwLiDggbZ768YEBwMqrAqTJVwvlvwUkoVjs3e+N2KYd8BuQfNwGM?=
 =?us-ascii?Q?5v1xdCUZgpTC7fVWSn3jpn9955GByQHTeDR52EFCkyPL6eQUt+vQt3QwAPZp?=
 =?us-ascii?Q?KZVNx1fkBe/nfbxRzuFSTnJVRq2B5d9OjLjldvhKxkY+RahGie6K1NL0f1vY?=
 =?us-ascii?Q?8GYn4n6BqayUiGvNFPjBvo2RGZn0wVzwQ/JA8xbViw8GaPHcbT+FRwrJl5wR?=
 =?us-ascii?Q?eI5SQK33fTdCzjIdEMGIs6dfX1USZNbcYvn6qB6Yds6eriaTwUxyjJz4gK9V?=
 =?us-ascii?Q?4DvT2/V7O3kAy5wcMBZb8n4RM8V6JEfJ1gCDCeDOV/ZdLhu3V2fqFRPqqAnl?=
 =?us-ascii?Q?nVSB1asC0sfW3ET5icnw5AZBBDNcN1bpi5JlIGVbXis6hI244GYS3jVpEC2m?=
 =?us-ascii?Q?naVoTzRJpKSJ2cQz1IQ1/ELEn+x3TRLIEGw4fERhBuZ7l69Q6V2yL2f7j6Lu?=
 =?us-ascii?Q?QijUW1GtYZo90hN6eM9gCH9a1nrE2QXMyKeoUmYlmpqXrUtgMOFe9l/x0+qf?=
 =?us-ascii?Q?nnxMIx21hf+MvP9d4MqQ+UPxQ9gZY8bxfx4cXIUyNcjlrwoESIoh4EYmiKaJ?=
 =?us-ascii?Q?hjf3xlMlObzH0jN5pe/kNZ0ylIeWCSyolMzS9c0pm7sqdxFIjbaKyW0oezsC?=
 =?us-ascii?Q?Vqn2HvTwm2+AlIBza1t10JypFYcoU50ObfwJ6Zy2Ci31BXn9Nd2z1WLKQP8m?=
 =?us-ascii?Q?o5ARI5GV3a7rFkiEzM869rxyjKGeoJKhF8ohTQypui+AdqpGq7b/ZeEPPeEq?=
 =?us-ascii?Q?QM0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b499e6c-b3ae-4848-3f75-08d8d85b8f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 00:31:43.0636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrKA7BZrOR+IwIPCaxNs969CwrO2fAKjuUOMDjKwl8ZyXFkgzYtVBgUOl/8f46UQjl0oDpymh+WojwX+gHy6+jzQX0sHUWEYDTukvmssxDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Iris driver supports Broadwell and newer (Gen8+) for very low CPU overhead.

With this patch, user can add PACKAGECONFIG_append =3D " iris" in their bba=
ppend file.

And then iris will be added in build options, like "-Dgallium-drivers=3Dswr=
ast,virgl,iris".
You can check mesa/2_20.3.2-r0/build/meson-logs/meson-log.txt for this.

The driver can be found in build directory: mesa/2_20.3.2-r0/image/usr/lib6=
4/dri/iris_dri.so


Thanks,
Yongxin

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yongxin Liu
> Sent: Thursday, February 18, 2021 16:56
> To: openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: [OE-core][PATCH] mesa: Allow building the iris driver
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index cb075a8b89..72e22d654e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -168,6 +168,9 @@ GALLIUMDRIVERS_append
> =3D"${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
>  PACKAGECONFIG[panfrost] =3D ""
>  GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'panfros=
t',
> ',panfrost', '', d)}"
>=20
> +PACKAGECONFIG[iris] =3D ""
> +GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'iris',
> ',iris', '', d)}"
> +
>  OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium',
> 'classic', d)}"
>  PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone"
>=20
> --
> 2.14.5

