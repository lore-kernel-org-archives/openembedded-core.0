Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 24885 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 04:51:44 UTC
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
	by mail.openembedded.org (Postfix) with ESMTP id 69EB37C66C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 04:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wUrXW2SB69ERx3sY+CdOf1zMamYK91WOr6zJwefOgL0=;
	b=VTmuhrh5CRiixR8iScMUFPpeJ78QPtLu1tj+ckNXdggePvnKkssG74hAjgoa/1KLbUYM4dBbiReTrxB672ARa9y8XA0SzdTgE6AxlTpDilwHCgnXTX8FA1TbF0fNeo7qdrDeE2QVv0Xe16oOwFoJN6TRtjogHyJ/E6KrkQGNCtI=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB2607.namprd02.prod.outlook.com (10.168.205.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.19; Mon, 11 Mar 2019 21:19:39 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2]) by MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2%7]) with mapi id 15.20.1686.021;
	Mon, 11 Mar 2019 21:19:39 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [OE-Core][PATCH v2 3/3] devtool: provide support for
	devtool menuconfig command.
Thread-Index: AQHUtOei8G0M0tPNvUOboOoPJBE95aX8XxYAgArUn/A=
Date: Mon, 11 Mar 2019 21:19:39 +0000
Message-ID: <MWHPR02MB2576EB755ACF786037F36C47B0480@MWHPR02MB2576.namprd02.prod.outlook.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
	<1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
	<1832894.xLyTEtpz5K@localhost.localdomain>
In-Reply-To: <1832894.xLyTEtpz5K@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8d618fb-1ea4-4af3-1744-08d6a667454a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2607; 
x-ms-traffictypediagnostic: MWHPR02MB2607:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; MWHPR02MB2607;
	23:mvlSKyiO7+Mseq/JgKi3yiPuTjBskaUJeKkvi3tEj?=
	=?us-ascii?Q?bjwe4Jux7h+QEvsYNOuBuiqSugFRH94d4DWfeZaKJhe4szWwJM1vZO7tsX3H?=
	=?us-ascii?Q?VY31N5CA9nl1WCN4SCAX8LDxxxLn9AVOc3d591B9cCinEBcBo2TwEAx8JMjJ?=
	=?us-ascii?Q?Na1tcDCMSjVfXPz6l+jODiDZNVYw6kAoJbRvPeKs61WZnV//lHezW+JilItj?=
	=?us-ascii?Q?5QluRU36Lo68gAzjRcQGWgQmm7l4IJDz9Rz/jUzrra7eRUrh8ZGl7V+TXaVP?=
	=?us-ascii?Q?W9qDaxRVNa3BvfpjjqDpsCf1itoS3mE7Mkzq7/SMefPrdWycwTFTkduxXIpV?=
	=?us-ascii?Q?B3zJHSu750TcPUsSoVzZrepnq0rLlO5E7NyUm5Pp9X7Z8tLPJA8XUfNkfqUD?=
	=?us-ascii?Q?ZCV63OOfkxb6sn4Fzjgm1Dum8f3ubKSJnv89imwKFL0aMuILocgRsGnx0ZxU?=
	=?us-ascii?Q?eUglZICo0/SW8/kXDMjr9kAL1X0hWGeelVWk3I4qOm81BIO+QJByV0ctSP53?=
	=?us-ascii?Q?RsEsk2Y3EDk8gQdpE1NEZza3TW0Se7qFDA2HfDElE1xUjUomqfsfr1T5AruG?=
	=?us-ascii?Q?APhVgd8rNHXvsV4Ig3IMF/Iwh/gOkPYQ6WRZoajeSe+64UyZGHhOliOoPA4p?=
	=?us-ascii?Q?BE1wPN0UGoLmS0YlI+T+j8TkeGuKRltcWXRNS1hOzclWYqIqVdaK1G/GHeHZ?=
	=?us-ascii?Q?OzIw/mnySu5SrfbBjN0JoG5jZh9X1gQR435AVATEoBeXC7Y3d/HZmyama0t6?=
	=?us-ascii?Q?o4VTtpMo/oX7wpTuISqVDSi8VQX58HXYVOz/RrzCYJpuKSH09VnmVltqxmsc?=
	=?us-ascii?Q?bzYiLhQeVKbzKiOMtlBGGXRQ+zSTFCtbWDkosbE/KYpbq3KmcqOtDKve517S?=
	=?us-ascii?Q?Sm9hiSKwhy4yQkmS7+aq8BD5SbScbwvIWVPJyz5BkvvRGnVg5bOajprW4LqZ?=
	=?us-ascii?Q?hSnofb+2LJ4vljNtL1ORoeBoDj3/LDmVDNyIZ/9oftwBEw8RZoa0e0EyHDTr?=
	=?us-ascii?Q?JYlY6cUJZ5D6to6RX7JdMV+7D3i0DyMfptowDkMlzLyYaLRKKz1NJG9Zo309?=
	=?us-ascii?Q?HVQSvxPD+ZZrU5mJlBSY6bF98dY08Gj1J+cCSAn2iMM+IYvYXcMrPpXKHTqn?=
	=?us-ascii?Q?BViXlzD6WBHw2Zb64L0VCIMbQfiMXdw626h4MoP5IKclKFSNquJZloiDkdIx?=
	=?us-ascii?Q?66YZ02ZWr4Ig4biUgaH51uE5I1xRBQV9uJPGge0iKwr2bmy3b3ergooevemj?=
	=?us-ascii?Q?T169KpgnqVwXwFBvHc=3D?=
x-microsoft-antispam-prvs: <MWHPR02MB260795BCDEC26D7489E9621BB0480@MWHPR02MB2607.namprd02.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(396003)(366004)(376002)(39860400002)(13464003)(189003)(199004)(81166006)(81156014)(26005)(8676002)(8936002)(305945005)(11346002)(446003)(476003)(106356001)(105586002)(14454004)(68736007)(7736002)(478600001)(6916009)(53936002)(52536013)(6436002)(186003)(5660300002)(9686003)(486006)(316002)(55016002)(74316002)(6246003)(33656002)(229853002)(71200400001)(71190400001)(2906002)(4326008)(66066001)(99286004)(14444005)(53546011)(86362001)(256004)(102836004)(25786009)(97736004)(76176011)(6506007)(6116002)(3846002)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2607;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 27/5mfsid/aditxVxZ3O5R6YL4K6DqcIklrbc7TmTx+bs8NZ3e9ClxAq8oKV88eaH0pk6PTpD23B7YA/hTaZl300E0NW0r1GtyrCQtkC3hxk0/u6Tank3yVCmtkjxQ0gqMhDmQig/qw8HOkcfsdEBQ7Ice2CSZrrXj7QcnqAboFuh/S5LKEkm9IUX3ccDEnrKCQ6d7c+YNbAnOE+iqJa5uQUBMZM6/QOkkg2p6BkMtJq21toLx+0evAoSmojBddEYFgMO/CNf2vXUypqkbE3KL+NDYZHLEavZjuZXuKYENuwQiSQHO5Eb40/0UFWlRY6UIznVTogd2de3f/jRsrOQlKoIUlnRGNfYX5BYNf/v75ZwNN1KgL3qRsS5/oI2flo+XyODmxFT4OmIXew2SgQBzFeQwyHl9ZWgwVxwgRHg8Y=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d618fb-1ea4-4af3-1744-08d6a667454a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 21:19:39.2798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2607
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Tue, 12 Mar 2019 04:51:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


-----Original Message-----
From: Paul Eggleton <paul.eggleton@linux.intel.com>=20
Sent: Monday, March 4, 2019 3:46 PM
To: Chandana Kalluri <ckalluri@xilinx.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [OE-Core][PATCH v2 3/3] devtool: provide support for=
 devtool menuconfig command.

On Saturday, 26 January 2019 8:53:02 AM NZDT Sai Hari Chandana Kalluri wrot=
e:
> +def menuconfig(args, config, basepath, workspace):
> +    """Entry point for the devtool 'menuconfig' subcommand"""
> +
> +    rd =3D ""=20
> +    kconfigpath =3D ""
> +    pn_src =3D ""
> +    localfilesdir =3D ""
> +    workspace_dir =3D ""
> +    tinfoil =3D setup_tinfoil(basepath=3Dbasepath)
> +    try:
> +      rd =3D parse_recipe(config, tinfoil, args.component, appends=3DTru=
e, filter_workspace=3DFalse)
> +      if not rd:
> +         return 1
> +
> +      pn =3D  rd.getVar('PN', True)
> +      if pn not in workspace:
> +         raise DevtoolError("Run devtool modify before calling menuconfi=
g for %s" %pn)

Strictly speaking we have check_workspace_recipe() for this. It could be th=
at we should extend the message printed by that to be a bit more friendly a=
nd suggest devtool add/modify/upgrade first, but I'd like to be consistent.

>...
> +      #add check to see if oe_local_files exists or not
> +      localfilesdir =3D os.path.join(pn_src,'oe-local-files')=20
> +      if not os.path.exists(localfilesdir):
> +          bb.utils.mkdirhier(localfilesdir)
> +          #Add gitignore to ensure source tree is clean
> +          gitignorefile =3D os.path.join(localfilesdir,'.gitignore')
> +          with open(gitignorefile, 'w') as f:
> +                  f.write('# Ignore local files, by default. Remove this=
 file if you want to commit the directory to Git\n')
> +                  f.write('*\n')

We should already be handling this in devtool-source.bbclass, but I'm guess=
ing the hardlinking you're adding bypasses that, so we likely need to handl=
e that separately during devtool modify rather than here (preferably withou=
t duplicating code).

This check for oe_local_files is specific for all other packages except lin=
ux-yocto. This is needed if the package uses make menuconfig to generate cf=
g and for devtool finish to pick up the cfg fragment.=20
For linux-yocto, after the hardlinking is done, the check for oe-local-file=
s is taken care for within devtool modify( this is in PATCH 1/3 ).=20

The above check for oe-local-files for all packages could be handled within=
 devtool modify and can be done in two ways:
1. Either all packages(even the ones that do not run menuconfig command) ha=
ve an empty oe-local-files dir as a part of workspace/source OR
2. have a check within modify to see if it runs menuconfig task and create =
the oe-local-files.=20

What would you recommend ?

> +    parser_menuconfig =3D subparsers.add_parser('menuconfig',help=3D'all=
ows altering the system component configuration', description=3D'launches t=
he make menuconfig command, allows user to make changes to configuration. c=
reates a config fragment', group=3D'advanced')=20
> +    parser_menuconfig.add_argument('component', help=3D'compenent to alt=
er config')

To be consistent with other subcommands and a bit more readable this should=
 be something like:

    parser_menuconfig =3D subparsers.add_parser('menuconfig', help=3D'Alter=
 build-time configuration for a recipe', description=3D'Launches the "make =
menuconfig" command (for recipes where do_menuconfig is available), allowin=
g you to make changes to the build-time configuration. Creates a config fra=
gment corresponding to changes made.', group=3D'advanced')=20
    parser_menuconfig.add_argument('recipename', help=3D'Recipe to reconfig=
ure')

Additionally, I would really like to see some oe-selftest tests for this al=
ong with the changes.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre



