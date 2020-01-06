Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 839C37FA13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 11:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=K7kEXQUXIw0yNgoDxp6LD2YUuIP7dKxUBcZhgik4J7N1TupQzpFkt4yYUNtGJcSZWUCRu4cM2oL4m3NMzHAWehBquuwvvyrqcuNd5uov3ZyQ3nExO+C1Y/aswrGyJV/76oiym+npKohcAsK2gVjbMQVP7G2C8YuULBQcmrDQE+G9YHBQiFkihulmA/oZ8uD3kMCMV44450+I+k4CP8jR5gepgjxdRuXdl4LT7I2BTZXOdkG/LxjKmYWEc6LeIDUAIwJzs7SNh/6hebOV4wIVKXs3aRu9c32iiJzPkJEeQt+rilccnQJmRzEcxo4IhKCUHiZDjlvzpbEB0cEM0OeiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OVimpmFnWD6dh0ZVmfmb5C4rWoOEKc3Cu4z7i0zfm4c=;
	b=RqBtOvKSrJ4RS0v/ecE7B+W4wgGDczbAfzRLPQNKHmHfpaXyaGRtB+qgeNDpI8TcC0hqept6Y2tEUDa+s6MsAAYyXrZ32nj41KTXI7ijU6PPAtwP9RVfwhqy2+C7k7y3OczlmSC4AhKFUAFohFdOYDkLzAoeCIkR2byWNaZZ5wC1NBf4vxcdeRQ6bE/TKc9Ai0CmlPQKD77/0XiTVsAHUQKpqheIIBAwaHb9QUzG98FPjLYNsmR5lMOQCM8oAudjs9ui5OybFj5EH8At3WwMlPuEjwVhNF/8F0mgvRJW34yGT259keLdTV02OJiawki81J1xiJYKPYVHDx67QoROZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OVimpmFnWD6dh0ZVmfmb5C4rWoOEKc3Cu4z7i0zfm4c=;
	b=E1TtLxZQ8frby5+AE7yICoKLykY059DQG1pL0DQh1ndbDSx3RU4+6Q7X/nWsDrdL50Q7v/FKXIACW+MI/Dth9xkptKPSDfu/aWHC90j4tJUmfrQVSUsxF1eb8KfA9b/Wei+kJIQeREMDy9kqBC8+hzTOdYFmcsUQFFbaY9xPdzk=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.62.146) by
	BYAPR02MB4919.namprd02.prod.outlook.com (52.135.241.212) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.10; Mon, 6 Jan 2020 11:00:00 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1899:3979:6040:ab99]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1899:3979:6040:ab99%4]) with mapi id 15.20.2602.015;
	Mon, 6 Jan 2020 11:00:00 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [zeus 00/29] Patch review
Thread-Index: AQHVwxvDslWa3CfYEEWQUmAjDVlDGqfdek6A
Date: Mon, 6 Jan 2020 10:59:59 +0000
Message-ID: <BYAPR02MB600535C30EFB39703779DA49B93C0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <cover.1578155074.git.akuster808@gmail.com>
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [124.123.105.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50df4f38-f12d-40c7-efc7-08d79297932f
x-ms-traffictypediagnostic: BYAPR02MB4919:
x-microsoft-antispam-prvs: <BYAPR02MB4919AEAE05F1C7FC69137F86B93C0@BYAPR02MB4919.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(13464003)(33656002)(478600001)(8676002)(66446008)(66946007)(76116006)(53546011)(6506007)(64756008)(66556008)(66476007)(186003)(26005)(71200400001)(110136005)(316002)(7696005)(8936002)(2906002)(966005)(86362001)(5660300002)(52536014)(55016002)(9686003)(4001150100001)(81166006)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4919;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R10dYDgxfkQt+eZ0fgt6b8SfunWDW226HQzJPgfUi7F8+4aHjm6FYKANsFUrOevm5jYmZT9Obr9qK9R0CqiX4D4/6vsxfJ27YVbKXMdQ+UWjY7hJFZHAWP09tucFE1WnA4dcshIhOBybfMBLt94JjH5a/xvXKbA7eTO34CyVuej3boYEdULmL0LhsWKWBy/snNJkZnZXHvRGYSl9FFssl4tAmMJ7Hp5ZdTV1vbdMXRF4F5CS3wONYEortm3cUZbbCbHWemuiphaKEQ8jGIyPvSzrzyk/YSVregt8Mf0XVZtIXTvRqJhTfkEYghLsZSk4t0Bxp/AIxaxTzKjaXEfdt/psM2cDWNosvj9tO8lpP0m511wksNs106tvjUtuD1nJp/1mwJHAsDcBSvo9s2Bzy7HsERtYu8x9cy/BXo5CS2AKKkYXNq602UWQUjs1jhscY+p2an2NjJkXqPtdHcfUx5TNuBJdA4jrqyKJcO+TDskUqSR5uTC35vUv0MtNdJkmjWMiE/4aYp3WfBI3UfRGyuQeM2aSV9G1dM/PgkzJs0U=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50df4f38-f12d-40c7-efc7-08d79297932f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 10:59:59.5798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wok6fhl+mhy7HjO/g5UI1GAhk5g/G1rsQiPN5FZIcGGaFrBv9na1P3Rc9NrbNmLpMgN8Wf5PE8hbRXzNSFuoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4919
Subject: Re: [zeus 00/29] Patch review
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
X-List-Received-Date: Mon, 06 Jan 2020 11:00:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Armin
> Kuster
> Sent: Saturday, January 4, 2020 8:26 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [zeus 00/29] Patch review
>=20
> Here is the next set for zeus.
>=20
> Please have comments back by Monday.
>=20

Can you please backport the MB upgrade patch and a72-a53-tune if possible?=
=20
I have sent those patches requesting a backport to Zeus

Thanks,
Manju

> The following changes since commit
> 754d0ae5a960056468cdf50e5965a4c22515f8f9:
>=20
>   lttng-modules: fix NULL pointer deference error when testing rpc_task_r=
unning
> (2019-12-31 10:36:32 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut
>   http://cgit.openembedded.org/openembedded-core-
> contrib/log/?h=3Dstable/zeus-nut
>=20
> Adrian Bunk (2):
>   systemd: Upgrade 243 -> 243.2
>   python3: Upgrade 3.7.5 -> 3.7.6
>=20
> Bruce Ashfield (11):
>   linux-yocto/5.2: update to v5.2.21
>   linux-yocto/5.2: update to v5.2.22
>   linux-yocto/5.2: update to v5.2.23
>   linux-yocto/4.19: update to v4.19.84
>   linux-yocto/5.2: update to v5.2.24
>   linux-yocto/4.19: update to v4.19.87
>   linux-yocto/5.2: update to v5.2.25
>   linux-yocto/5.2: update to v5.2.26
>   linux-yocto/5.2: update to v5.2.27
>   linux-yocto/4.19/5.2/-dev: fix gcc10 build
>   linux-yocto/5.2: update to v5.2.28
>=20
> Joshua Watt (1):
>   python3: RDEPEND on libgcc
>=20
> Khem Raj (1):
>   valgrind: Fix build with -fno-common
>=20
> Martin Jansa (1):
>   sstate.bbclass: Fix for consistent whitespace
>=20
> Richard Purdie (6):
>   sstate: Add ability to hide summary output for sstate
>   sstate: Stop overwriting SSTATE_PKG
>   sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
>   sstate: Ensure target sstate directory exists if unihash changes
>   sstate: Ensure mkdir happens before mktemp
>   python3: Update to apply libgcc fix to libpython, glibc only
>=20
> Robert Yang (1):
>   pseudo: Make realpath() remove trailing slashes
>=20
> Ross Burton (3):
>   podfix: class to remove Pod::Man versions from manpages
>   reproducible_build_simple: inherit podfix
>   podfix: only alter normal files
>=20
> Tim Orling (1):
>   liberror-perl: update 0.17027 -> 0.17028
>=20
> Vasyl Gomonovych (1):
>   kernel: Make symbol link to vmlinux.64 in boot directory
>=20
> Yanfei Xu (1):
>   libsdl2: fix failure appeared in bitbake libsdl2-native
>=20
>  meta/classes/kernel.bbclass                   |  3 +
>  meta/classes/podfix.bbclass                   | 35 ++++++++++++
>  .../classes/reproducible_build_simple.bbclass |  1 +
>  meta/classes/sstate.bbclass                   | 51 +++++++++--------
>  ...temd-boot_243.bb =3D> systemd-boot_243.2.bb} |  0  ...temd-conf_243.b=
b =3D>
> systemd-conf_243.2.bb} |  0
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  .../{systemd_243.bb =3D> systemd_243.2.bb}      |  0
>  ...rl_0.17027.bb =3D> liberror-perl_0.17028.bb} |  6 +-  ...1-realpath.c=
-Remove-
> trailing-slashes.patch | 57 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  .../{python3_3.7.5.bb =3D> python3_3.7.6.bb}    |  6 +-
>  .../valgrind/valgrind/s390x_vec_op_t.patch    | 19 +++++++
>  .../valgrind/valgrind_3.15.0.bb               |  1 +
>  .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
>  .../linux/linux-yocto-rt_4.19.bb              |  6 +-
>  .../linux/linux-yocto-rt_5.2.bb               |  6 +-
>  .../linux/linux-yocto-tiny_4.19.bb            |  8 +--
>  .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++----  meta/recipes=
-
> kernel/linux/linux-yocto_5.2.bb  | 22 +++----
>  21 files changed, 187 insertions(+), 68 deletions(-)  create mode 100644
> meta/classes/podfix.bbclass  rename meta/recipes-core/systemd/{systemd-
> boot_243.bb =3D> systemd-boot_243.2.bb} (100%)  rename meta/recipes-
> core/systemd/{systemd-conf_243.bb =3D> systemd-conf_243.2.bb} (100%)
> rename meta/recipes-core/systemd/{systemd_243.bb =3D> systemd_243.2.bb}
> (100%)  rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb =3D>
> liberror-perl_0.17028.bb} (85%)  create mode 100644 meta/recipes-
> devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
>  rename meta/recipes-devtools/python/{python3_3.7.5.bb =3D>
> python3_3.7.6.bb} (98%)  create mode 100644 meta/recipes-
> devtools/valgrind/valgrind/s390x_vec_op_t.patch
>=20
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

