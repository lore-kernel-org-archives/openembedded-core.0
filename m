Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800052.outbound.protection.outlook.com [40.107.80.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE7C7F879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 23:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jGCF0p2sZxKqO5R1eGmWDIUBPuN88Evid88BOnzEBxL1upRmN20sxqTp08NlOdgQ730F+vm9DwUfr7idDmM/udSaUW7E013Kp/qFk7CZT0BXjmA/YJ8cERJEkuDF7eo7n6YHMO52lqJBQ+iEH6MoCtxcnGXqIZfMCK5LdVkuemibopA2EO2+q/hAlyUOQTc+p2I+2FYuRMn7xe8DWDl+cWlfVQIKDHpb0udrDupo9NfwlRylI/y0Op92mvllat5gJ4+PdFi40d61TDF0utdeKAeADAFRsdpeheUjI7t9NyIAazHs6id6WAGJtXVOqWY9+/2Qtawvc0oF6JCPrbKlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/dqZbKz8WLoGC26H8oHbzvlmhaY8r1CLkJJzCBP0FZs=;
	b=cUNYz6Ycj0OZgCUFdoOz5fNc0d5JSIdXgZolwKoRZTgYiFGPeqikMLIRWZeM6Bjopoy0YcQoIGslOEd9Uhp8vlS8+CYB0JGt25d1V/dbNYorNiNbj3Ti/Ri1HIuXF3tJCyH9lLij73S3xcC+zeJ8f/DuaGZ1BmYzP73ohwEUQc449RSIUxiOkzzE5J+7tnBbBojMHeRYmpI01vZUVo4xm1af/1Vmk4uxlAO4LMhs+v7LRq3SZQngzegMn/wWclM0Bgi6RmN8IyQqvQwy9ZrCKFc3LX0v0YAC4ux/oUX6eF9McmEWbWS9C4m31xC3WYYIoUdKWylACwM34WJfM9lHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/dqZbKz8WLoGC26H8oHbzvlmhaY8r1CLkJJzCBP0FZs=;
	b=aY/A0XUlM7LpLNYBdt0iX9d+7f1skaKx/OaS8q1py7wXDwgvfDPsbXbDjG3EjGSq1T4ka/QQyveKsjMPg52lt1bhpzCNtv3i3uVN3GTp1pccSfjvn7i4X0FbL2clTZeIt1R0j/8hhg0FazlbLN0ItF0Z6q269yDwOFzfKKZBUvo=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB2318.namprd02.prod.outlook.com (10.168.244.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.25; Tue, 29 Oct 2019 23:03:35 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1805:e930:4d76:7501]) by
	MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1805:e930:4d76:7501%8]) with mapi id 15.20.2387.027;
	Tue, 29 Oct 2019 23:03:35 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [OE-Core][master][PATCH v4 0/3] Devtool: provide easy
	means of
Thread-Index: AQHU9W75PqNqHCNIg02/KZwXpjSFU6aMzmaAgOadvACAAAJ8wA==
Date: Tue, 29 Oct 2019 23:03:35 +0000
Message-ID: <MWHPR02MB25762722E4CF0B6245DFF65AB0610@MWHPR02MB2576.namprd02.prod.outlook.com>
References: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
	<3400718.qmR8kntanE@localhost.localdomain> <2766841.sOFMSHKMPR@shodan>
In-Reply-To: <2766841.sOFMSHKMPR@shodan>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c85f8a2f-e332-41df-d0c0-08d75cc43a3a
x-ms-traffictypediagnostic: MWHPR02MB2318:
x-microsoft-antispam-prvs: <MWHPR02MB23182128B118379CB55E906CB0610@MWHPR02MB2318.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(13464003)(43544003)(189003)(199004)(71190400001)(3846002)(76116006)(4326008)(305945005)(66476007)(256004)(66556008)(186003)(6436002)(8936002)(66446008)(64756008)(14444005)(498600001)(71200400001)(66066001)(6246003)(14454004)(66946007)(9686003)(86362001)(476003)(6116002)(74316002)(52536014)(2906002)(446003)(8676002)(81166006)(11346002)(81156014)(76176011)(7696005)(53546011)(102836004)(486006)(33656002)(6916009)(7736002)(55016002)(5660300002)(25786009)(99286004)(26005)(229853002)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2318;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D27cMEQdqB0EXiT7DYKf3Nguwj8nZDJMCkWyd+fUcu8cYsH4mJj8MWsvBvNEjdYZMmuSHaCY2CRfj5T/AQ6pMt0Rf3GQn2mgDudahH92RocaAOttsckUuDocQKTrxkhD1P3sUNT15oj9fjGTNN2G1MHUPAm2La2QootazCY0mIhXBwlEE+2K08gUz7LDaML/76kPLWoUZLB5Yqh4RzfpgIyLiU5J/WYJLJrvPlMAZzKanHoFxCIDgxJswLUFr6zJskRqe1Bia816sNf1dUdcVmhVNS2AEugdL0vSNhLsE/NWuP+u0U3eI7GB5TK2U/hEyddFMigj6mkg5BFQ5XJWTR2mI5jtlfEa9wyhY0uBzb4hCPGENupkZTA7ISL/0qjuIsffWDJruwvlLNTiDumhmN86KaLFDzgpocH6ZfSuxRaHz/Ml3GaqDiKE6mCqoM83
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85f8a2f-e332-41df-d0c0-08d75cc43a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 23:03:35.5143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6SUs/DiHHij4SpF2y6u5O2Yfdt9T1yXS8FTVEd+3UHddX+QGOD90zqbLb0udvON5wQCEmBFXeBdg4C7o0LilQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2318
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH v4 0/3] Devtool: provide easy means of
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
X-List-Received-Date: Tue, 29 Oct 2019 23:03:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Paul

Yes, I am in process of sending oeself test patches for devtool reset --rem=
ove-source command as commented In the other patch. I will also add the oes=
elftest for devtool kernel and send them out.=20

Thanks,
Chandana

> -----Original Message-----
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> Sent: Tuesday, October 29, 2019 3:52 PM
> To: Chandana Kalluri <ckalluri@xilinx.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [OE-Core][master][PATCH v4 0/3] Devtool: provide e=
asy
> means of
>=20
> Hi Chandana
>=20
> Having added quite a bit to devtool relating to the kernel, we really oug=
ht to
> extend our oe-selftest tests to cover the new functionality. Would you be=
 able
> to take care of that?
>=20
> Thanks
> Paul
>=20
> On Wednesday, 5 June 2019 5:07:55 PM NZDT Paul Eggleton wrote:
> > Hi Chandana
> >
> > My apologies for the delay in reviewing this - other work got in the wa=
y of
> OE-Core contributions but that should be dealt with now.
> >
> > On Thursday, 18 April 2019 10:42:56 AM NZST Sai Hari Chandana Kalluri
> wrote:
> > > This patch series provides support for the user to run menuconfig
> > > command in the devtool flow. This would allow the user to modify the
> > > current configurations and generate a config fragment to update the
> > > recipe using devtool finish. Devtool menuconfig command will work on =
all
> packages that contain menuconfig as a task.
> > >
> > > 1. The implementation checks if devtool menuconfig command is called
> > > for a valid package.
> > > 2. It checks for oe-local-files dir within source and creates one if
> > > needed, this directory is needed to store the final generated config
> > > fragment so that devtool finish can update the recipe.
> > > 3. Menuconfig command is called for users to make necessary changes.
> > > After saving the changes, diffconfig command is run to generate the
> fragment.
> > >
> > > Currently, when the user runs devtool modify command, it checks out
> > > the entire source tree which is a bit of an over head in time and
> > > space. This patch series also provides a way to create a copy(hard
> > > links) of the kernel source, if present, from work-shared to workspac=
e to be
> more efficient .
> > >
> > > Also, if the kernel source is not present in the staging kernel dir
> > > and the user fetches the source tree in workspace using devtool
> > > modify, then this patch series creates a copy of source from
> > > workspace to work-shared. This is necessary for packages that may use=
 the
> kernel source.
> >
> > Looking over the patches again, we're close but the following need to b=
e
> corrected:
> >
> > 1) The devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_file=
s
> test in oe-selftest fails:
> >
> > ---------------- snip ----------------
> > INFO: Adding local source files to srctree...
> > Traceback (most recent call last):
> >   File "/data/poky/scripts/devtool", line 334, in <module>
> >     ret =3D main()
> >   File "/data/poky/scripts/devtool", line 321, in main
> >     ret =3D args.func(args, config, basepath, workspace)
> >   File "/data/poky/scripts/lib/devtool/standard.py", line 845, in modif=
y
> >     initial_rev, _ =3D _extract_source(srctree, args.keep_temp, args.br=
anch,
> False, config, basepath, workspace, args.fixed_setup, rd, tinfoil,
> no_overrides=3Dargs.no_overrides)
> >   File "/data/poky/scripts/lib/devtool/standard.py", line 657, in
> _extract_source
> >     symblink_oelocal_files_srctree(d,srctree)
> >   File "/data/poky/scripts/lib/devtool/standard.py", line 485, in
> symblink_oelocal_files_srctree
> >     oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=3Dd)
> > NameError: name 'oe' is not defined
> > ---------------- snip ----------------
> >
> > Probably just a missing import.
> >
> > 2) Please change "symblink" to "symlink"
> >
> > 3) Indentation is very inconsistent in the added code. Please use four =
spaces
> everywhere.
> >
> > I would also like to see oe-selftest tests covering this functionality,=
 but I
> won't require them to ack these patches (especially given the delays on m=
y
> part).
> >
> > Thanks
> > Paul
> >
> >
>=20
>=20
> --
>=20
> Paul Eggleton
> Intel System Software Products
>=20


