Return-Path: <Emmanuel.VAUTRIN@cpexterne.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917A4C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 09:57:49 +0000 (UTC)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.82])
 by mx.groups.io with SMTP id smtpd.web11.4013.1678874263706113974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 02:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cpexterne.org header.s=selector2 header.b=HZXFcNaj;
 spf=pass (domain: cpexterne.org, ip: 40.107.12.82, mailfrom: emmanuel.vautrin@cpexterne.org)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUUNElG0HXV7V3Obpwz2JIKRn9lshMGaOvlXweiTlKiWA7BXoZolEB1pm9ZyNHS131Sf+Sl+MuoTAEJod5pTmt7VpD56Pqjy1oWZxKDvwwxslbrrDSKio+d5pcPlHzZnqu4avg63zPFbxvuT1z5RAw4CYhjvzLTrI5J5uBnHexcloWLyUbGsjhPNi0xAy7n+Wt7mUQhGkFFz33mjeQjhLZxkGwN2tI1pPo9N4BC7BHG3WnPwN7S9BcXdmvEPcdYH295NyU2b8cZKkB3kXNPnbGdGqzbS9uKXN34xaoRNCxUp7jvW15Xfz1VvQQfzJxIdIzu4Y5hSZT+y4PibKq56tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdZf6CSKXxcSpsD1fEF3wUmNAuzN34ockWCwIxF5Mqk=;
 b=HePmdi/ARJmoMQqJaBEaBDgGW/iUH32/sDJ3yY6Vh87lZxjvm3iWQF/mImuKI54MLb37QR9FqDA9I10G7j7VxqhBV0aWoVUvL7Sm7AVcVOT+MB6gCJ78TaAJxik/YoTlZ67k98owVUtRKezEMqkA+FL58lep18uS3r54Equ4dyTLSVEjJNo24FkwT4f3WAzZ2xukhirC7+/CXJzWvsEwzS/8ItDYvCJS+4uEYWjlf4uNb+hzrBgsjanyj6wy1szoRF1RWFWiZnDcQRwPQD4zgqDRtc498/BJiFQgMGuso61Auy7tpPYsCe1+M/V4HPzaTlAshVy6aARKSDA6w1g/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cpexterne.org; dmarc=pass action=none
 header.from=cpexterne.org; dkim=pass header.d=cpexterne.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cpexterne.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdZf6CSKXxcSpsD1fEF3wUmNAuzN34ockWCwIxF5Mqk=;
 b=HZXFcNajNOCHOvXGOS7hKh4Jlq/6z9NlGk7GA4vdRtPNB82rokqZ8QhfBC/E56co3ntUrXe2PZ2cc3hoHB7/8aJ/nYYnEruHsrIn2ZG5zZO1avIAACymElAhuSVdhYYlN5qySj9wfXn9dSm2x/hd9FJqUUhz/LDKNFsQqvjwULQ=
Received: from MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::7) by
 MRZP264MB1589.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Wed, 15 Mar 2023 09:57:40 +0000
Received: from MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d79:b93c:b64:95ed]) by MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d79:b93c:b64:95ed%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 09:57:39 +0000
From: "VAUTRIN Emmanuel (Canal Plus Prestataire)"
	<Emmanuel.VAUTRIN@cpexterne.org>
To: Steve Sakoman <steve@sakoman.com>
CC: "poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>, Khem Raj
	<raj.khem@gmail.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [poky] [meta-yocto][langdale][connman] Partial integration of
 CVE-2022-32293 fixes
Thread-Topic: [poky] [meta-yocto][langdale][connman] Partial integration of
 CVE-2022-32293 fixes
Thread-Index: AQHZVpibY64I3KYMn0mowgk+BFQDdK76hssAgAESZ0I=
Date: Wed, 15 Mar 2023 09:57:39 +0000
Message-ID: 
 <MRZP264MB154440CFE6C988CB0700C63793BF9@MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM>
References: 
 <MRZP264MB1544487A07884D37D9CFD78E93BE9@MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM>
 <CAOSpxdam2mGY6BgHwdSMOdPQVfMWJfD7i3zd3uhUUKMraFKUKw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdam2mGY6BgHwdSMOdPQVfMWJfD7i3zd3uhUUKMraFKUKw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cpexterne.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB1544:EE_|MRZP264MB1589:EE_
x-ms-office365-filtering-correlation-id: 106862dd-59fe-4f39-5aea-08db253bb69b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FEAwDKhOz/cWT/1cz4A96+dJq/Dmajlk5WRcwj3R09edQSQb1q2Wbg1ee3f9YrVX5OhfIEzp1h2dBo7GGu8OiZ66Pvy8EZEo/F63PVgVrCri8ckZ9YbB0GDGWBbk0ST84SrWxmPVjEEuqeMnzXYZTcSfwkZowA7X1tDOhA4mvcn5wxuu8QzMYDyqjqx8YZouy8KjU+zsfjKyRojHydP2hPDJNqCRLoZLu5n8Uur2scR1xSCCXT1r6G99URQ1Ejwfna1Y6R60fHQzGuT60PCNW+UHT5beY+3ZoteIw4swxeO/+i1Jt85t64OySOgfDs/JixU/iS4BjmqCmvuY4z/jMHXJMiX+KlYtydZFtgVvcCe9hkAjVeE5zGkhMcJyfin2P99b5HQIazxuM5rOZHwuguY4MRBx/+rjEYt3grqNA/FGnX9Q38JZa3LvX/XX0YhmFwLhGIEyVZiFjaSoh2B9sCQG6wuaxaYbOkx/m3r6xdusQ7+TW1iS2WHitGfWwpIhjUhdY1VPt5ADTtGW9YUQuggIk5tlGLqfphN1R+tRNUiwK+hlIDSvbCvJdeVKeqiGnJLBsnFY1LaHoukkM7dgB3XDOsnAMwET5FuUkmPZULekOYg4AZYnQFRF3zmewHQ5xUJDcAlVvvZpoMxfp7Ea16wxwppUzERhK3NrpTK+g8S4D42sDcXg61J4KKa/Rx03uFb0oPyfjOT8Usnr0GAlxQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199018)(122000001)(55016003)(6506007)(9686003)(26005)(76116006)(8676002)(91956017)(2906002)(54906003)(316002)(41300700001)(186003)(66476007)(66556008)(64756008)(66446008)(4326008)(66946007)(6916009)(4744005)(71200400001)(7696005)(8936002)(52536014)(478600001)(5660300002)(38100700002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oYvUog7UqQgEMkeTpc/j1vkS7I1n0N/RxyXIzbwDEbhcUW/HpWJlcGW00F?=
 =?iso-8859-1?Q?ZGTVMZjMPrhyMGE9YY/EMwd5yyihGZqWPAerFUhPm1o1ptYXrtVWifM4Z8?=
 =?iso-8859-1?Q?6EKmhiAnWGFpmyUq/ar+dCDT4o5td7JkrhWIygp4pW6/5OJYfzSLublgtz?=
 =?iso-8859-1?Q?0xfJVhmNYzCwQ+W2zq7veu3DwDwbpLimnyjZmI/miX8Bw7XlbSTItOj/MG?=
 =?iso-8859-1?Q?7w84V3jI+ZZY3Vt1WKr6QZRl7EyzVYdI7EvNpD/7i/0hCzHm4jW1fhkCwR?=
 =?iso-8859-1?Q?VfSS7BS4EkOKfBii+WXTfATXC/+U8/7lLNTocL7lrTlGYbRFCF/ehrtkXf?=
 =?iso-8859-1?Q?9s5y9XGgxpSdtBt+GGrULIwpKo7K1meHJbQ9aym4CAvhbx1s+1Lx8qMHRr?=
 =?iso-8859-1?Q?lWKhVBOmNGkTV+bGc6J2NvqRB3fc97A1lXCwVRYM6YeR4kwBOkN0yLwMw0?=
 =?iso-8859-1?Q?sxfrLACw6KaYAkVCH7nKEEr0CmuvG+YemcjG7JKtkIcjeFmyUWU83aJc9E?=
 =?iso-8859-1?Q?GXnk+WRwdMpdoxkNZ7ZsX5jHWnH/vUb7R+wyIxNd3mmu19maAjVNI5Hbo5?=
 =?iso-8859-1?Q?kDddFJDO6RAx5ddxqf5Z47H+wLoa65T1EWofkzro28O/f2KDWYixNu5LR0?=
 =?iso-8859-1?Q?P99TN+qXeG8IpEww1XymSry8k3cwPGOrzQuYzNfj65L8oxBkkupp645+tk?=
 =?iso-8859-1?Q?9b8qcgmtS4JV+XPyW5V6tEU4nC6MdZ7piiiDidG1icFSpLtopqrucTSTh1?=
 =?iso-8859-1?Q?fm1kaBeCjdX0wHJ7Bs97pQ8FWsqWIxF7kJjkuemdqsotgWtGI3u49hVsIR?=
 =?iso-8859-1?Q?CHqnLPRjK9DqCK3DxtaY4NprMPOsQPQ8jbSeA1hFvOJmWNqVajR9uRuB7t?=
 =?iso-8859-1?Q?FOI711X2TdgAdSIqyOCPlQHu5oALjSbNOK9ORHh1VyBD1SZQb3xgpReuKr?=
 =?iso-8859-1?Q?ZOYxC0tpShHWYRKTXERt4LaFRAaEzADGJKdM4nrZX1+YCRbNavTsdZX8+l?=
 =?iso-8859-1?Q?PzAoWFW5AOvwwQ0IFrPSMU90YheFnZow5WcARHYQW5X3j8T3QGALEqA3MQ?=
 =?iso-8859-1?Q?+dvsQoUZFsrbKXetCAP2zCB/0KM64Oem82+qnux8uzFjKMOIT+Ye3jlKXt?=
 =?iso-8859-1?Q?JiOc4aOkfqGa+2cgaispe9svyQt4cWfD7ZK6o7bLnNVgXObTeX3/pagp8U?=
 =?iso-8859-1?Q?w4dk5aRGmtCaNt9N07M65Rgb8Xwb+Wc9vMRnoK0y+h2f/qQPnNZ7dmfiKy?=
 =?iso-8859-1?Q?CkWmDDd1hQdT3CtfnhGfxVRBKYIypkYruerJzNmyVJRm6zPq+va0YHIzIM?=
 =?iso-8859-1?Q?wxPqAPI5CZKURfX1ikMqTMZiZ98jW0swKUx9sdQikpuQFyUTiqK7mrK7Cl?=
 =?iso-8859-1?Q?1RbVJ9BGEpkIbqM09cnY4OsYVYgR0XcjesW81y576C2if8kNJH9mDwCtDz?=
 =?iso-8859-1?Q?klbP6ciY9yUUXmBqqgjIh1ga2wFhY5pBxLUOVRL68a/UXFyHng7dqvclnO?=
 =?iso-8859-1?Q?ec6Jv8GFuhG9uQV1vu3vkuV62wfsaac9cTus7lEjPG0GEZD4wv1i3DHeBc?=
 =?iso-8859-1?Q?ThKsIp92iqa3NBFTjfcTxfi67LUgUJcE3G+FRnf+Y6LKaH+PcMXIh8R3ez?=
 =?iso-8859-1?Q?jkQXbApvWrYodqV3twzlFBJVW+hYPKRirSsHQLawgda/kBSVeHxP0hLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cpexterne.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 106862dd-59fe-4f39-5aea-08db253bb69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 09:57:39.9521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf5c5de1-6a54-4091-a72f-90e32801628c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DpTpDc3wp028XAERD/ucZMw/O3RvhBFNyZlFF6Q8KB2PSaFXMOpjod4WE14iZ7+fSvnOqxs35qIcJlicxunFeSTFOmau6Jp6Lm8ay7y3bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1589
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 09:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178531

Thank you Steve for the answer.=0A=
> Thanks for bringing this to my attention.=0A=
=0A=
> In the future please send this sort of thing to the openembedded-core=0A=
> mailing list.=A0 It would also be good to copy the author of the patch=0A=
> you are commenting on. (I've cc'd=A0 the openembedded-core list as wel=0A=
> as Khem)=0A=
I shall confess it was complicated to choose the relevant group. So, does=
=0A=
openembedded-core correspond to all sources in yocto/meta?=0A=
=0A=
> Would you be willing to send a patch to the openembedded-core list=0A=
> that implements this regression fix?=0A=
Allright, I can do that, even if with my professional email the tabs are=0A=
automatically formatted as spaces, what corrupts the patches.=0A=
=0A=
> Thanks!=0A=
=0A=
> Steve=0A=
B.R.=0A=
=0A=
Emmanuel=

