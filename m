Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAEC7D39B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 05:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=T13Gl/Jjbhn1lgIHUbuS6KNE2sx/xxwLSShVacrIM35iigeHQGCBbzL70LIxO1IU4XBayBlwvE2bqdf2sUSXx6pvipB8m7XoS9RwkRbv5M83RX5oFlwV8Y9GWCNkMALx0sXLpKQVd5tDW5Tq2PzVFXQdskB/GAmHgNuSqZYwi1Waz3/7HBCP1va0/3g8F7Q0LKAiydYVUWIGKj7yO96hWbS7otgyPaWuiegcJZgv1WPUfP56FA1Eam/zWZZg2HSnFIBcmFF0ZuTHtSeLlHwQa/rdWWJgUjFl5/QAJAFGoLSmHd0aQcb/M7X6zlWY+Qx/37K6P0h3olSnQhBIT2ICmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=neX03DP41ndb4evp3y8IueuxmykZJR/ViP4YxL78fyY=;
	b=L43Z3k6Xtb1e7sPoXtm31FE0xfTSVf5P3ThFg/bLk5Mh/MWVxffhBFOFW/spbglpfS1VdfXt+dGXSp2RWFz5HtVIh9ugvrYyiEey0ZPlMRxO+IgtXmoSuVMVNDx1XNsWSymF7qZXg2WpRZzAxupZZ0CJtrlh4Vdh1T4PXmKlnN/si9jpmAsQW6Ywhf6BjzKpt4ssM2PL4dQNiTzNLghEJMvOwa+Epwp5xYxebR2eXouCHAwWa1l/U/XTiiqxSM5Hz87QkpBiTZNveOhiQyCItWnvwu/x4bwaAa34ueDlJHSS2s8IVj7XafrX9QEq3xhra4Iykd3WTDHkFXN2OQKtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=neX03DP41ndb4evp3y8IueuxmykZJR/ViP4YxL78fyY=;
	b=XMlJpangsCOuh2/jZkC5zSQlRVgJvNS88+UXGcZG7hm1HAl5HObtma0v8vYWnFkFQlx1mKptPqzFTrLDEecq8jLw2KZz++WRIfpqSNOLAOGQyIMj7M969MMGauQW1wunu6PwS89L/AsMiFWI6EVkyAte2uEBVfsp9WyqfbrUgTw=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYASPR01MB0050.namprd02.prod.outlook.com (20.178.52.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.14; Thu, 5 Sep 2019 05:46:18 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::ed32:4eaf:4874:18c2]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::ed32:4eaf:4874:18c2%6]) with mapi id 15.20.2220.022;
	Thu, 5 Sep 2019 05:46:17 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alejandro Enedino Hernandez
	Samaniego <alejandr@xilinx.com>, Bruce Ashfield <brucea@xilinx.com>
Thread-Topic: [oe-core][master][PATCH] Introduce mechanism to keep nativesdk*
	sstate in esdk
Thread-Index: AQHU6OgD/RNvjQb+Q0+hcaZyh3IuiKcTSGOAgApAG3A=
Date: Thu, 5 Sep 2019 05:46:17 +0000
Message-ID: <BYAPR02MB60052395D5A173F3FD7A4F5DB9BB0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
	<BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e23f8c2-c5e2-4bb6-77ec-08d731c45f64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYASPR01MB0050; 
x-ms-traffictypediagnostic: BYASPR01MB0050:|BYASPR01MB0050:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYASPR01MB0050B275D4FE40B964A1E603B9BB0@BYASPR01MB0050.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(199004)(189003)(13464003)(186003)(102836004)(7736002)(14454004)(81156014)(8676002)(81166006)(99286004)(11346002)(6506007)(2501003)(66446008)(64756008)(66556008)(66476007)(66946007)(53546011)(14444005)(256004)(74316002)(8936002)(305945005)(6636002)(478600001)(486006)(446003)(966005)(476003)(26005)(7696005)(229853002)(76176011)(6116002)(3846002)(9686003)(2906002)(33656002)(55016002)(316002)(110136005)(86362001)(71200400001)(66066001)(71190400001)(53936002)(6306002)(6436002)(25786009)(6246003)(76116006)(52536014)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB0050;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KPtoVjFNEGTfPFMsl5rEOdZDh7g6Rw1IrcAJ+8hUK1RFSHAng/ru+PbU62xyj9986e2IBTgCd4Y/zb9g5pI85bce8qCzu9ghIs241NFOt4pg7eYiAwJsd1rIHMUKTTa8J+YLDtYKAtHVkkxerBkYJDbS3CloQNCdibCc3vIWu4Jwps/ysVnhPpecBA24IM5qyLCbmV+y+JMV6ybpf9Wi/vogy3ofB8rGsPe745fehbDc9DNp2s+S3g6q5VjBFHYcb42hCaNXLEAuyPS21Z8Jfbp0W5Bnn3jTID0VlkMYTKHzcxuXhbVgT32R88OgabIK8gfPuUQ7OlZsQeOWFMOhSZtom08aikjPu+B2YnBLenbAQvmfcRXvpsmzf5LuCLY2LtjkTy7DGuYg70McHl0FsJJfbe+Zx0cd7n+lyyhVMg8=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e23f8c2-c5e2-4bb6-77ec-08d731c45f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 05:46:17.7876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eo+g5PeGBNBNGsJ5A2Vv9IKul0wCohU8BSUEbDqpXDlX9p+yYXN5TPZFZ4FcIw85IN5BgUcbHRNXWOx2EPQzOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0050
Subject: Re: [master][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Thu, 05 Sep 2019 05:46:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> -----Original Message-----
> From: Jaewon Lee
> Sent: Thursday, August 29, 2019 10:14 AM
> To: Jaewon Lee <JAEWON@xilinx.com>; openembedded-
> core@lists.openembedded.org; Alejandro Enedino Hernandez Samaniego
> <alejandr@xilinx.com>; Manjukumar Harthikote Matha
> <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> Subject: RE: [oe-core][master][PATCH] Introduce mechanism to keep natives=
dk*
> sstate in esdk
>=20
> ping

Can you please review, this is related to=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13261

Thanks,
Manju

>=20
> > -----Original Message-----
> > From: Jaewon Lee <jaewon.lee@xilinx.com>
> > Sent: Monday, April 1, 2019 5:07 PM
> > To: openembedded-core@lists.openembedded.org; Alejandro Enedino
> > Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar Harthikote Matha
> > <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> > Cc: Jaewon Lee <JAEWON@xilinx.com>
> > Subject: [oe-core][master][PATCH] Introduce mechanism to keep
> > nativesdk* sstate in esdk
> >
> > Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all nativesdk*
> > sstate into esdk Currently locked-sigs.inc is generated during
> > do_sdk_depends which doesn't pull in nativesdk packages. Generating
> > another locked-sigs.inc in do_populate_sdk_ext and pruning it to only
> > nativesdk* packages by using a modified version of the already
> > existing function prune_locked_sigs and merging it with the current
> > locked-sigs.inc Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the
> > logic surrounding setting tasklist file to not prune esdk sstate
> > during creation
> >
> > Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> > ---
> >  meta/classes/populate_sdk_ext.bbclass | 28
> > +++++++++++++++++++++++++++-
> >  meta/lib/oe/copy_buildsystem.py       |  8 ++++++--
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/populate_sdk_ext.bbclass
> > b/meta/classes/populate_sdk_ext.bbclass
> > index 40b0375..d98b0e5 100644
> > --- a/meta/classes/populate_sdk_ext.bbclass
> > +++ b/meta/classes/populate_sdk_ext.bbclass
> > @@ -20,6 +20,7 @@ SDK_EXT_task-populate-sdk-ext =3D "-ext"
> >  SDK_EXT_TYPE ?=3D "full"
> >  SDK_INCLUDE_PKGDATA ?=3D "0"
> >  SDK_INCLUDE_TOOLCHAIN ?=3D "${@'1' if d.getVar('SDK_EXT_TYPE') =3D=3D =
'full'
> > else '0'}"
> > +SDK_INCLUDE_NATIVESDK ?=3D "0"
> >
> >  SDK_RECRDEP_TASKS ?=3D ""
> >
> > @@ -401,9 +402,27 @@ python copy_buildsystem () {
> >      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue=
)
> >      sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
> >      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
> > +    #nativesdk-only sigfile to merge into locked-sigs.inc
> > +    sdk_include_nativesdk =3D (d.getVar("SDK_INCLUDE_NATIVESDK") =3D=
=3D '1')
> > +    nativesigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.in=
c'
> > +    nativesigfile_pruned =3D d.getVar('WORKDIR') + '/locked-
> > sigs_nativesdk_pruned.inc'
> > +
> > +    if sdk_include_nativesdk:
> > +        oe.copy_buildsystem.prune_lockedsigs([],
> > +    	                                     excluded_targets.split(),
> > +    	                                     nativesigfile,
> > +                                             True,
> > +                                             nativesigfile_pruned)
> > +
> > +        oe.copy_buildsystem.merge_lockedsigs([],
> > +    	                                     sigfile,
> > +    	                                     nativesigfile_pruned,
> > +    	                                     sigfile)
> > +
> >      oe.copy_buildsystem.prune_lockedsigs([],
> >                                           excluded_targets.split(),
> >                                           sigfile,
> > +                                         False,
> >                                           lockedsigs_pruned)
> >
> >      sstate_out =3D baseoutpath + '/sstate-cache'
> > @@ -414,7 +433,7 @@ python copy_buildsystem () {
> >
> >      sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=
=3D '1')
> >      sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
> > -    if sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivat=
ive:
> > +    if (sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or
> > + derivative) and
> > not sdk_include_nativesdk:
> >          # Create the filtered task list used to generate the sstate
> > cache shipped with the SDK
> >          tasklistfn =3D d.getVar('WORKDIR') + '/tasklist.txt'
> >          create_filtered_tasklist(d, baseoutpath, tasklistfn,
> > conf_initpath) @@ -
> > 658,9 +677,16 @@ fakeroot python do_populate_sdk_ext() {
> >      d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
> >      # ESDKs have a libc from the buildtools so ensure we don't ship
> > linguas twice
> >      d.delVar('SDKIMAGE_LINGUAS')
> > +    if d.getVar("SDK_INCLUDE_NATIVESDK") =3D=3D '1':
> > +        generate_nativesdk_lockedsigs(d)
> >      populate_sdk_common(d)
> >  }
> >
> > +def generate_nativesdk_lockedsigs(d):
> > +    import oe.copy_buildsystem
> > +    sigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
> > +    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
> > +
> >  def get_ext_sdk_depends(d):
> >      # Note: the deps varflag is a list not a string, so we need to
> > specify expand=3DFalse
> >      deps =3D d.getVarFlag('do_image_complete', 'deps', False) diff
> > --git a/meta/lib/oe/copy_buildsystem.py
> > b/meta/lib/oe/copy_buildsystem.py index 7cb784c..5bc728e 100644
> > --- a/meta/lib/oe/copy_buildsystem.py
> > +++ b/meta/lib/oe/copy_buildsystem.py
> > @@ -168,7 +168,7 @@ def generate_locked_sigs(sigfile, d):
> >      tasks =3D ['%s.%s' % (v[2], v[1]) for v in depd.values()]
> >      bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
> >
> > -def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs,
> > pruned_output):
> > +def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs,
> > onlynative, pruned_output):
> >      with open(lockedsigs, 'r') as infile:
> >          bb.utils.mkdirhier(os.path.dirname(pruned_output))
> >          with open(pruned_output, 'w') as f:
> > @@ -178,7 +178,11 @@ def prune_lockedsigs(excluded_tasks,
> > excluded_targets, lockedsigs, pruned_output
> >                      if line.endswith('\\\n'):
> >                          splitval =3D line.strip().split(':')
> >                          if not splitval[1] in excluded_tasks and not
> > splitval[0] in
> > excluded_targets:
> > -                            f.write(line)
> > +                            if onlynative:
> > +                                if 'nativesdk' in splitval[0]:
> > +                                    f.write(line)
> > +                            else:
> > +                                f.write(line)
> >                      else:
> >                          f.write(line)
> >                          invalue =3D False
> > --
> > 2.7.4


