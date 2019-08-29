Return-Path: <JAEWON@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
	by mail.openembedded.org (Postfix) with ESMTP id 820E77F39B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 17:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TkKEj7ThPgF8ElFgjQRR8sAw63pKyxpUR8I6ssMyWR/Tnra0EZaM5kmw9LstCMLXlpduBKwUp3wOJobO8aASghKWtgr8ADQVx1dF2ikrCCMUsAwthqqHllLRTZQV+TsLKnj4xMOWwd4jAeqRolRvMhiiYV+Pjhi+qAlpoMCpv3wnN74yZmqaiY6zu+Ok/v7ddrVTLxVzFo9Q9uFLBnzFg745G9Xc6Lm2eT9uiQTUkpRXshoXmsO5EOZO9QtjpFKVbJZlJ2whtJUXh2erm/Yh+Q4pBE3f5JJz2HKfEdm+OfR9Zr+IqchVGvfvAtkbYq+mOIVE9IiytmDzAjPZkMRZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9GHzvKkdOu9QAWu9YmAo3sQ7GoaIbUnvMZarZgyFrOQ=;
	b=E0f9GWCiJuiqbklDujJFqwPBvUpQftMryllup+bJwV7AZjgMMIDRuM6/8D1CXvf9D8oOagiHrwZFFUvnZOOY1gpswRoMjDpESuH5/PTVQMCSZhz7qCITDvB9Tymf7I1GGvi77vgJcnnK8BHmAZ9tTHx/FsRTwmNu7+qA5+QGKkSOgmpQNt1/LnhTqm9VEEPFh9GXgbnfCs2/pCqO9UZ9PwVRlF1hUI9ux9egyze4fdtsdMutTU+Iar3SQLk21728IP+Fisv57nL6SrszbIZFA3Jxy24UyFYjzvz6GiebOXV1lqJpz+JkImOEa1K742jrCs00DdlHlfyKci1/Efn0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9GHzvKkdOu9QAWu9YmAo3sQ7GoaIbUnvMZarZgyFrOQ=;
	b=oe6OUJFsBCBmjG9uRd9tbC0OxMeCBK34V1SXtRfr8OVQ8uSSNUj7ggzqRy1cVPx6JbsJUf2ulRBQahAzxSPGmkTOzSTSIGg9NCgAweoIC/LLQAQhXgcc2UylifTX8Dw0YLT6Ot9Fxgcn7DELtsXidDTTk1uIHFLSau66AJngCMA=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB5382.namprd02.prod.outlook.com (20.177.228.216) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Thu, 29 Aug 2019 17:13:39 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::1921:73d8:4ab0:88d7]) by
	BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::1921:73d8:4ab0:88d7%7]) with mapi id 15.20.2199.021;
	Thu, 29 Aug 2019 17:13:39 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alejandro Enedino Hernandez
	Samaniego <alejandr@xilinx.com>, Manjukumar Harthikote Matha
	<MANJUKUM@xilinx.com>, Bruce Ashfield <brucea@xilinx.com>
Thread-Topic: [oe-core][master][PATCH] Introduce mechanism to keep nativesdk*
	sstate in esdk
Thread-Index: AQHU6OgD2JhQnI36fUOvfpDbvD40gqcTSFbQ
Date: Thu, 29 Aug 2019 17:13:39 +0000
Message-ID: <BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42935f54-231e-4fa5-a5d4-08d72ca43c7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB5382; 
x-ms-traffictypediagnostic: BYAPR02MB5382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5382022B1280CACC5CBD0831AFA20@BYAPR02MB5382.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(13464003)(189003)(199004)(2501003)(102836004)(26005)(186003)(14444005)(256004)(2906002)(229853002)(8676002)(81166006)(81156014)(52536014)(25786009)(3846002)(7736002)(478600001)(6636002)(316002)(8936002)(110136005)(6436002)(66066001)(71200400001)(305945005)(55016002)(5660300002)(486006)(11346002)(6246003)(446003)(53936002)(476003)(66446008)(71190400001)(86362001)(53546011)(6506007)(66946007)(76116006)(9686003)(76176011)(66556008)(64756008)(66476007)(99286004)(74316002)(14454004)(33656002)(6116002)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5382;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9LBbuzg0Oivm5s233xQ42yJvAShpwkJJfXZhFzUj6r7QQZ16fxj8hDAfPYirlLNsorE6p+/5uBUzR5A3QTosqJXtKSnM/tvd9c61tj8E50hfSXOZjHSvhuRc91xVnVnuaQOd7hV/rL+EmOODTIVnK5q9DtyjUXl+3tTyYnQ5hwZcDkR41BPrGnp78j4T23VQIAAA70phNDhTYLhPVM1gbT3DUqRPyxlztAx2HeD+21J2fwIfHJwR4txUaT4vOIlfAMlSA6nKWC4FD01n0qHtohaXzkEJXFV/WVyvnM2NvUHpceR++VjRA5LDS6gR+VNXv795q120IEkJB4W9pEUrToQi/AoFwGW59Zdc2mGG+PLBPGGcRophIaC7jY/aNXBrRdzvwkHTxAcTPNJF4NmSj9WI6eXQyxkJ0IkocTe8klo=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42935f54-231e-4fa5-a5d4-08d72ca43c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 17:13:39.5025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YyHrhG5vQOBDgmz0NxTCEYCQeC+nJGyqfdLxCaNcemVHSJL7jFbh+M5sikgNzCm620VNj9SDompuH2aF7hEHGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5382
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
X-List-Received-Date: Thu, 29 Aug 2019 17:13:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Jaewon Lee <jaewon.lee@xilinx.com>
> Sent: Monday, April 1, 2019 5:07 PM
> To: openembedded-core@lists.openembedded.org; Alejandro Enedino
> Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar Harthikote
> Matha <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> Cc: Jaewon Lee <JAEWON@xilinx.com>
> Subject: [oe-core][master][PATCH] Introduce mechanism to keep nativesdk*
> sstate in esdk
>=20
> Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all nativesdk*
> sstate into esdk Currently locked-sigs.inc is generated during
> do_sdk_depends which doesn't pull in nativesdk packages. Generating
> another locked-sigs.inc in do_populate_sdk_ext and pruning it to only
> nativesdk* packages by using a modified version of the already existing
> function prune_locked_sigs and merging it with the current locked-sigs.in=
c
> Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the logic surrounding
> setting tasklist file to not prune esdk sstate during creation
>=20
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 28
> +++++++++++++++++++++++++++-
>  meta/lib/oe/copy_buildsystem.py       |  8 ++++++--
>  2 files changed, 33 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index 40b0375..d98b0e5 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -20,6 +20,7 @@ SDK_EXT_task-populate-sdk-ext =3D "-ext"
>  SDK_EXT_TYPE ?=3D "full"
>  SDK_INCLUDE_PKGDATA ?=3D "0"
>  SDK_INCLUDE_TOOLCHAIN ?=3D "${@'1' if d.getVar('SDK_EXT_TYPE') =3D=3D 'f=
ull'
> else '0'}"
> +SDK_INCLUDE_NATIVESDK ?=3D "0"
>=20
>  SDK_RECRDEP_TASKS ?=3D ""
>=20
> @@ -401,9 +402,27 @@ python copy_buildsystem () {
>      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
>      sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
> +    #nativesdk-only sigfile to merge into locked-sigs.inc
> +    sdk_include_nativesdk =3D (d.getVar("SDK_INCLUDE_NATIVESDK") =3D=3D =
'1')
> +    nativesigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
> +    nativesigfile_pruned =3D d.getVar('WORKDIR') + '/locked-
> sigs_nativesdk_pruned.inc'
> +
> +    if sdk_include_nativesdk:
> +        oe.copy_buildsystem.prune_lockedsigs([],
> +    	                                     excluded_targets.split(),
> +    	                                     nativesigfile,
> +                                             True,
> +                                             nativesigfile_pruned)
> +
> +        oe.copy_buildsystem.merge_lockedsigs([],
> +    	                                     sigfile,
> +    	                                     nativesigfile_pruned,
> +    	                                     sigfile)
> +
>      oe.copy_buildsystem.prune_lockedsigs([],
>                                           excluded_targets.split(),
>                                           sigfile,
> +                                         False,
>                                           lockedsigs_pruned)
>=20
>      sstate_out =3D baseoutpath + '/sstate-cache'
> @@ -414,7 +433,7 @@ python copy_buildsystem () {
>=20
>      sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D =
'1')
>      sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
> -    if sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivativ=
e:
> +    if (sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or derivati=
ve) and
> not sdk_include_nativesdk:
>          # Create the filtered task list used to generate the sstate cach=
e shipped
> with the SDK
>          tasklistfn =3D d.getVar('WORKDIR') + '/tasklist.txt'
>          create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpa=
th) @@ -
> 658,9 +677,16 @@ fakeroot python do_populate_sdk_ext() {
>      d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
>      # ESDKs have a libc from the buildtools so ensure we don't ship ling=
uas
> twice
>      d.delVar('SDKIMAGE_LINGUAS')
> +    if d.getVar("SDK_INCLUDE_NATIVESDK") =3D=3D '1':
> +        generate_nativesdk_lockedsigs(d)
>      populate_sdk_common(d)
>  }
>=20
> +def generate_nativesdk_lockedsigs(d):
> +    import oe.copy_buildsystem
> +    sigfile =3D d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
> +    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
> +
>  def get_ext_sdk_depends(d):
>      # Note: the deps varflag is a list not a string, so we need to speci=
fy
> expand=3DFalse
>      deps =3D d.getVarFlag('do_image_complete', 'deps', False) diff --git
> a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
> index 7cb784c..5bc728e 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -168,7 +168,7 @@ def generate_locked_sigs(sigfile, d):
>      tasks =3D ['%s.%s' % (v[2], v[1]) for v in depd.values()]
>      bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
>=20
> -def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs,
> pruned_output):
> +def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs,
> onlynative, pruned_output):
>      with open(lockedsigs, 'r') as infile:
>          bb.utils.mkdirhier(os.path.dirname(pruned_output))
>          with open(pruned_output, 'w') as f:
> @@ -178,7 +178,11 @@ def prune_lockedsigs(excluded_tasks,
> excluded_targets, lockedsigs, pruned_output
>                      if line.endswith('\\\n'):
>                          splitval =3D line.strip().split(':')
>                          if not splitval[1] in excluded_tasks and not spl=
itval[0] in
> excluded_targets:
> -                            f.write(line)
> +                            if onlynative:
> +                                if 'nativesdk' in splitval[0]:
> +                                    f.write(line)
> +                            else:
> +                                f.write(line)
>                      else:
>                          f.write(line)
>                          invalue =3D False
> --
> 2.7.4


