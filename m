Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web08.8729.1632123960573911489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 00:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=eRFDXZJg;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkXIVyL4FZfNlDWR5auR4YE8aALbEgT0Kv6rr7GjAAD+MFpt5hW1Al3UWzbd4jJrVf+LbfaeH4UDuMpMdB+8bGRaSfpErRsNFORyk2ccz++CN79i/xKBO08kt70cFl5UQjUMO30XyMfpTpH+iutEE3K97OlpnZQOy7avVORuW42XS3J6XoaofBKfZVpUTJX04FnjLasvI72stb3qmHViq9ZKOhGylFa9rP3jqU1gKbhKR6c78MIfjR0KStk1fDxi8JMgdYJ++/Ud4Be5gi145oV+SIMWfXmT/5DZBmembFzrKZC5wRrWBxyA6I8caHoWQhtwaoo30oYmmjRF7+bpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v/hViakrxfwSlFW2riwpCp1jzVPvB45GavNx6QFaZKM=;
 b=HUCLM/q+amY/jxgsIK8K/R8ojwYlziCDvWnpAuOkY6uiWlhvMR1yRd6kQt/7zkBsh2alI/nTGa+MTz7wj1QfohZkwQ0CfM3FsrLPZY9/jH8Hbok1IAqek99jeQ5GYv/Q0Omly+m5KXaj5NVrwoU3g4jQC7emPpBNmZei52SHW9waEdDJwCiVfki6NhRC7fQl2mmIKA1uhLCi0RMJY4hALTnRTDynkGMlXuRIGsFxxxby+OmzhoSQ9y7YR5wNBOXvubylpG1SBT7Nkye8tMV/412dLM696UMcSd9yEbAdfyMrcGK8l5r/h1oZyvmvsO7rSoNtE08qiPjsukF25si5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/hViakrxfwSlFW2riwpCp1jzVPvB45GavNx6QFaZKM=;
 b=eRFDXZJgOOAnoVIKD+ecrbVROiMKhaJgwpbbF+VbptEI4AAOXNrpCOP8Pe82LiHZstVMOGfiMM6wetCgJf60HpCs5yYqCrZesb8tz0pU0nWoFhzt8MwhUYplXIunL+cPV11m1JGpkkFgNL9EeivTXVfe2j+UND7dY4ZdwZe+ZQ8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3523.eurprd04.prod.outlook.com
 (2603:10a6:208:1b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 07:45:57 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 07:45:57 +0000
Date: Mon, 20 Sep 2021 09:45:54 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
Message-ID: <20210920074554.42tmgvqdp2qjlxlc@fedora>
References: <16A633F8E639735E.6604@lists.openembedded.org>
 <38ae386328c67ce4e48930950b8131d7fe2e10f4.camel@linuxfoundation.org>
 <3a4c07ef7cfa4b918680ad8f560d2c29@axis.com>
 <da6e756775ab97030299f02ee5a9060ee18e8a0e.camel@linuxfoundation.org>
In-Reply-To: <da6e756775ab97030299f02ee5a9060ee18e8a0e.camel@linuxfoundation.org>
X-ClientProxiedBy: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR01CA0074.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 07:45:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c010738-d373-4b0f-375f-08d97c0aae6a
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3523:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3523CAE5B4097785C05CBB5FC2A09@AM0PR0402MB3523.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kCiMYE7GP+NlCtnJWwm3eDAvvwZCu4LEaZ9b0b0vD6ulgQjkUMc80fdY06kYUDIEAwonPcMgko576S5Bic6vizHblhQpSYTj6V10R+w8q+Jkl9VVbZwHbRomQJpnimO/tkmvAjok5I1gYnyldk12G1aGTlYmmF4A8s4WniPKGvEu4qwgOAucM4z+Be+87d1q/QkbIcyxldO7fI7Xo5qCE6CmiYHI8Xxxx96g4HsrHpUf9QDMJ9YiU/J6m70coqOvo56WUaN+hExOyHWT46rv/+VnB+tpIZ2jqrNGUcq7sg9C+FPUSaLfY3S+WfqpEdQEVmIOGSUKDihMqVO3VXEZk761tg3s5ZR9nlAqbPP/Rg5K8/Mo8OXL2V26LnmbfeTnuBXS9/gglMv2m2JreCPGewIzBy0y4Nr6XbD6egyGIFDC1CBE3eSH00IestBD7ZlfpPgZ+hpWZktBSIdkOvNpnx4z3/qrKC+naWQRxKO5FTk8d53MYNJiN4X9ocoeodi7lRClG+1r89lxkrM/UXh71xChOlYyNly/aTFlzGDfbDwVpxb0hTCWe+fmr/FHdKvsPplMUF4pf6NBTAwMZFfEjK5FdMjYCgFtJ5OQHlekSllkqEwhDd9BGrFqczleDn8etBXqjhoPxaH/rDySpHRoqAafP7D5aQxUAqkBmTAhFoLkhqjBbvMpFudTxwIOVEEg0ZkRT7Eh6P8Kq1zIcS1AEcII0x96eaLw2/32gpzyBk4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(5660300002)(1076003)(53546011)(52116002)(26005)(508600001)(956004)(9576002)(6916009)(83380400001)(33716001)(86362001)(38350700002)(38100700002)(66476007)(4326008)(66556008)(55016002)(8936002)(186003)(66946007)(6496006)(9686003)(316002)(8676002)(54906003)(44832011)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WvmXysx1caNq0kYy1y/vOugSrCQkQp2+VeRjqydVEfvKVSuxICfNSRAJarzD?=
 =?us-ascii?Q?i4Wf9nLnhSVfRyYWshnrhw/7EzHgep5iy0bzwKTgM6tpKPL8NTVc23tWmnUl?=
 =?us-ascii?Q?InssQlm91Me/qRVcQSIiCGXVy8yAoPwaVRUk+PY2GYRE5JaKbevyHpVDU94M?=
 =?us-ascii?Q?bqkym4O9rKAuNkQ9nfcZtw5tLs7Iha+8l4jw3xN+7t51KYGhaeyMSPJOdP0g?=
 =?us-ascii?Q?eJKxI/Wz0oA/gcMUpxUDK4eLJqlwN5+JNlCMEbtvXy/aAiKysVtevbVnXM9C?=
 =?us-ascii?Q?GSyHRFO+PnTe1CexZZr1VX/XBLNFigZ+StSw8o9B+7YvzGFe5bXOI9ulpPfG?=
 =?us-ascii?Q?5TINqJx7FlLtZtTx843us/G8Pd+OC2KXjqWGaIE/zc8faiGkiqsG2NwH55Ea?=
 =?us-ascii?Q?e/ljfn/eRaQ5UkX8XWLdUJz6C+IhHQ33u3jYp4Bv6Qh2XVZSkjgtAkFmQtZy?=
 =?us-ascii?Q?t7Z/WdHjqDeIikond0CwK5NDLhY5oObWYvGMFTuKzIW+joboOKAm3RRzlKYN?=
 =?us-ascii?Q?9xROwLdv1ybXAUGFuGt4A6JAgguqoWoae1eUOMHRATZqBWlUOITG1ylXa+Jl?=
 =?us-ascii?Q?2c2e0SRgx25FVQuvdpv6XY7Eik7LbtDERYAFBJcX1JgQEzdtJHfkbYjrCKeT?=
 =?us-ascii?Q?tFuEyCCsTPb5kwj9kz2GzMswYLm1wGu8mzWTumDTD5AsS0WLPkBSE/H/n1Db?=
 =?us-ascii?Q?tP7bm2HU0siizb4Lcrveu9f5O2jQPHZNaet7w8t8D8cIVfygu+2Y1ANdatuF?=
 =?us-ascii?Q?saXBB66O1dquxZB9Qu+lndaMZlWpag+CYe/wQunMPkrYapIWuKl/rn0DUBst?=
 =?us-ascii?Q?wvJqrTQl0Q1loJo1wy2TbaUCIlE6DmzaJI/zsNPzSD9toLRcrFKfgNbFRIwh?=
 =?us-ascii?Q?tn3fDvdW5GnD6F76oLS7uC9VnoKV/TYLc69x8Tem54tVM2TV0HgUWKCCXUIB?=
 =?us-ascii?Q?OvC3L7m7qbqaeyNlDVtug3cgNcbGqa+2BYOkYSTWUXFzb2T3ksvb2xCTVKzI?=
 =?us-ascii?Q?KvnvsOKcFOba0Udyd4nDBM8KDlMsnp5kfse0Oo3xp8/gew3FempimLADgpI5?=
 =?us-ascii?Q?ctpapjrOHIEJGNjvlsoVIx2KTrln5lRrmgNVOUcqE8t8QJ4fUim61uwMEe7h?=
 =?us-ascii?Q?ZRS7aCOWujcYRaY6y6P9hFWKX6QDm8Je0EZbTWsWkjKDxgavoLbN4BeCd3zi?=
 =?us-ascii?Q?CgL1KlaXYWiaI2idThmA1wF2QyCveuTuyY5d/okb1pI5aTd7byFGFqxLXegm?=
 =?us-ascii?Q?4qZDzzKXvoz5lj/cZIqEJmOTiUGxPDLoxXZCjhKVjBnLjiCe8u07qGcOIGEw?=
 =?us-ascii?Q?VQJGN9INV0xyDtfNdiZQ4J9n?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c010738-d373-4b0f-375f-08d97c0aae6a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 07:45:56.9208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rc8dPhXMsX+GPpjwOk2gZLd56k4815GM3Qqz2ME93H2ouFUfX6FAo3XV0Jf/2g/ArcLmxNrE/0yQQEqdzX+3SEqK7UAj1G7OdE+rAfDvBCt3wRSBXJXqAr6bWfb86NOq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3523
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Sun, Sep 19, 2021 at 07:36:56PM +0100, Richard Purdie wrote:
> On Sun, 2021-09-19 at 18:06 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > > Sent: den 19 september 2021 13:03
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursiv=
e
> > > do_build task dependencies
> > >=20
> > > On Sun, 2021-09-19 at 11:57 +0100, Richard Purdie via lists.openembed=
ded.org
> > > wrote:
> > > > This is a controversial change which removes the recursive dependen=
cies
> > > > from the do_build target of packaging tasks of recipes.
> > > >=20
> > > > Currently this means when you "bitbake <image>" or "bitbake <recipe=
>",
> > > > the packaging tasks run for all packaging backends enabled for all =
recipes
> > > > in the dependency chain. The same therefore then applies to images.
> > > >=20
> > > > We don't actually need that, it is a convinience thing. Removing it
> > > > massively simplifies the task graph and causes much fewer tasks to =
execute
> > > > in many common scenarios. It also means less sstate is fetched for
> > > > example when building an image.
> > > >=20
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > > =A0meta/classes/package_deb.bbclass | 2 --
> > > > =A0meta/classes/package_ipk.bbclass | 2 --
> > > > =A0meta/classes/package_rpm.bbclass | 2 --
> > > > =A03 files changed, 6 deletions(-)
> > > >=20
> > > > diff --git a/meta/classes/package_deb.bbclass
> > > > b/meta/classes/package_deb.bbclass
> > > > index eca43e17876..8f0eadbcd2e 100644
> > > > --- a/meta/classes/package_deb.bbclass
> > > > +++ b/meta/classes/package_deb.bbclass
> > > > @@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata
> > > > do_package
> > > >=20
> > > > =A0PACKAGEINDEXDEPS +=3D "dpkg-native:do_populate_sysroot"
> > > > =A0PACKAGEINDEXDEPS +=3D "apt-native:do_populate_sysroot"
> > > > -
> > > > -do_build[recrdeptask] +=3D "do_package_write_deb"
> > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > b/meta/classes/package_ipk.bbclass
> > > > index c3b53854e8b..756744279e1 100644
> > > > --- a/meta/classes/package_ipk.bbclass
> > > > +++ b/meta/classes/package_ipk.bbclass
> > > > @@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata
> > > > do_package
> > > >=20
> > > > =A0PACKAGEINDEXDEPS +=3D "opkg-utils-native:do_populate_sysroot"
> > > > =A0PACKAGEINDEXDEPS +=3D "opkg-native:do_populate_sysroot"
> > > > -
> > > > -do_build[recrdeptask] +=3D "do_package_write_ipk"
> > > > diff --git a/meta/classes/package_rpm.bbclass
> > > > b/meta/classes/package_rpm.bbclass
> > > > index 88d861c0e75..9f415b234de 100644
> > > > --- a/meta/classes/package_rpm.bbclass
> > > > +++ b/meta/classes/package_rpm.bbclass
> > > > @@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata
> > > > do_package
> > > >=20
> > > > =A0PACKAGEINDEXDEPS +=3D "rpm-native:do_populate_sysroot"
> > > > =A0PACKAGEINDEXDEPS +=3D "createrepo-c-native:do_populate_sysroot"
> > > > -
> > > > -do_build[recrdeptask] +=3D "do_package_write_rpm"
> > >=20
> > > Just to add a bit more context to this, the bigger impact will be on =
CI
> > > setups
> > > including our autobuilder since "bitbake XXX" will no longer do quite=
 what
> > > it
> > > did before. I'm starting to think we should move to the new behaviour=
 and
> > > apapt
> > > the CI targets as/where needed.
> > >=20
> > > I have a build running on the autobuilder to see what impact this has=
 on the
> > > automated tests. I'd welcome other people's thoughts on this.
> > >=20
> > > FWIW we have removed a lot of these recursive dependencies, this one =
is one
> > > of
> > > the few left on do_build but it has been left as it has the biggest u=
ser
> > > visible
> > > impact.
> > >=20
> > > Cheers,
> > >=20
> > > Richard
> >=20
> > You write that this is a controversial change with big user visible imp=
act.
> > At the same time you write that we do not need the removed dependencies=
.
> > What I don't see in your commit message, nor in the follow up mail, is =
_what_=20
> > the impact actually is. What will I no longer get when I run `bitbake
> > <image>`?
>=20
> For this change, "bitbake <image>" will no longer generate packages you'r=
e not
> using. So for example if ipk is you main format but you've enabled deb an=
d rpm
> as well, only the ipk will be generated after this whilst before, the oth=
ers
> would too. That may be a big deal for some CI systems, hopefully less so =
in real
> world use.
>=20

Does this mean that technically PACKAGE_CLASSES will basically only ever
make Bitbake use the first one in the list and do nothing with the
others?

Cheers,
Quentin
