Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0086.outbound.protection.outlook.com [104.47.2.86])
	by mail.openembedded.org (Postfix) with ESMTP id 72EEC74D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=clw0q91jBbdhLDSJ0GMUdCTzvdBy90GRNbWZKFP4tNg=;
	b=nzwo6jbF/x5tgHWA06Tiqw0Sqq5axzPMxFC3c+pzuD6uOxbgEz3Lf821sMaCsXmFludNmO3nl5UkPGSrMN/YpY1gh1bYrIdQIvibja7mRuxIJ+cZecRuI1HXFNliyP5OXdYwj9BIcMuvpT5H7Q1FQg/C2Qv4Tlg7xVC3jsi3edM=
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) by
	AM5PR0402MB2724.eurprd04.prod.outlook.com (10.175.40.146) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.653.12; Thu, 5 Apr 2018 13:13:21 +0000
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60]) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60%10]) with mapi id 15.20.0653.012;
	Thu, 5 Apr 2018 13:13:21 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] python3-native certificate failure
Thread-Index: AdPHknKk2Tme/Xf0REaBJpxIFGCIjQE4qTEAABp/NOA=
Date: Thu, 5 Apr 2018 13:13:21 +0000
Message-ID: <AM5PR0402MB28174F3544EE0337198FACA8E2BB0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<5910479d-230f-a502-d83e-53e3dc9cb2c1@gmail.com>
In-Reply-To: <5910479d-230f-a502-d83e-53e3dc9cb2c1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2724;
	7:N6wEHHyGY8WDrSr8pgkUQojbnXNSrdEvdO9+0BcxsO7MYu/gUsyKDZk4xhwlT5aoVpI4fpR3xM++pScHHxcRO991HQ8H+RBMvzUfls0z76zZ5DEZj5xgv3xnmA7ufu1IeiE/MnoMXRL/cv/ip2xkGFK8nG1MkuBcKFFXjNsyn+2FKKn2r6eqBHHJ5IipfaSITQ2UubKVZUNH/fuimiN+TpGludePdtpcok44kJYvQnfZiTYLCjVlQzgxlyxRclil
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e68fd2f1-1115-436d-c5b7-08d59af70166
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2724; 
x-ms-traffictypediagnostic: AM5PR0402MB2724:
x-microsoft-antispam-prvs: <AM5PR0402MB2724DA5BC1BD10136509B5E1E2BB0@AM5PR0402MB2724.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(185117386973197)(85827821059158)(264703809997249)(21532816269658);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231221)(944501327)(52105095)(10201501046)(6055026)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2724; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2724; 
x-forefront-prvs: 06339BAE63
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(366004)(376002)(396003)(39380400002)(39860400002)(13464003)(199004)(189003)(3846002)(53936002)(68736007)(6116002)(39060400002)(33656002)(99286004)(76176011)(6246003)(105586002)(14454004)(59450400001)(102836004)(6306002)(6436002)(6506007)(53546011)(3660700001)(9686003)(2906002)(106356001)(186003)(110136005)(7696005)(55016002)(478600001)(3280700002)(26005)(45080400002)(74316002)(97736004)(316002)(81166006)(8676002)(7736002)(8936002)(81156014)(305945005)(25786009)(5660300001)(229853002)(11346002)(66066001)(575784001)(86362001)(446003)(5250100002)(486006)(476003)(2501003)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2724;
	H:AM5PR0402MB2817.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: jpkssw0HVOFde+XSx06oveOY2fIIPOkK4pfCpsKipt2jOaQC3mz8+Uy2tW3obC9pSrrg3+DmF+1xkX6ZppQX+riAcl26X/d/I5eH6PKUBtstMMS4C7z6xStWY4amKijMCl0BdazM7FcakRIjQlK1z3Xe5rKVOyAwV7lnh4u9RDtJ5iFn29dp6kx+H09gk515XiZpet9IVK1YrUl1fis1+Y3X0mzJ7BTlD9zEpbRKY+ccJqLdp/fTkaMsVVOx24gs2CvpauspsEmZ4guBFbywghs9PwqKpQJkzV68sDPiOWVlv08ZS8bKsksHP1m0Mx+QdVk5e2/KjlHDHACkaMbDTZFswjvp+mg9GsMdWfFZRHUCHn8ZyLjEZsj1SVshQ09RXXci2nhQOY0cU14gYzpuWInqJKbD0HvWibcwBsukEh0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68fd2f1-1115-436d-c5b7-08d59af70166
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2018 13:13:21.2554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2724
Subject: Re: python3-native certificate failure
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
X-List-Received-Date: Thu, 05 Apr 2018 13:13:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

But I am not using an SDK, I'm doing a straight bitbake. Using the native P=
ython3 urllib.request.urlopen (via inherit python3native) from do_compile I=
 see the certificate error. My original email duplicated the issue manually=
 using -c devshell.

Tom

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: Wednesday, April 4, 2018 7:29 PM
To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-core] python3-native certificate failure

On 4/4/18 1:09 PM, Tom Hochstein wrote:
> I am trying to download a URL from a source package using=20
> python3-native, but it is failing with a certificate failure. I added=20
> DEPENDS on ca-certificates-native and python3-certifi-native, but it=20
> doesn't seem to help. A colleague with a corresponding SDK took the
> aarch64 sysroot certificates and dropped them in x86_64 sysroot and=20
> the problem was fixed.
>=20
> =A0

you might try adding nativesdk-ca-certificates to TOOLCHAIN_HOST_TASK and r=
egenerate SDK

>=20
> Tom
>=20
> =A0
>=20
> r60874@tx30imx-01:~/rocko/build-xwayland$ bitbake imx-gpu-sdk -c=20
> devshell
>=20
> root@tx30imx-01:~/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-lin
> ux/imx-gpu-sdk/5.0.2-r0/git#
> python3
>=20
> Python 3.5.3 (default, Mar=A0 6 2018, 14:15:44)
>=20
> [GCC 5.4.0 20160609] on linux
>=20
> Type "help", "copyright", "credits" or "license" for more information.
>=20
>>>> import urllib.request
>=20
>>>>
> urllib.request.urlretrieve("https://emea01.safelinks.protection.outloo
> k.com/?url=3Dhttps%3A%2F%2Fsourceforge.net%2Fprojects%2Ftclap%2Ffiles%2F
> tclap-1.2.2.tar.gz&data=3D02%7C01%7Ctom.hochstein%40nxp.com%7Ca40b2e05d7
> aa43d50fc108d59a8c3bf6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6584849450785202&sdata=3D2BmKu3tXThT6%2FsHG0CzQJNPvXQ3gq2GJpahu2t8PNCY%3
> D&reserved=3D0",
> "~")
>=20
> Traceback (most recent call last):
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 1254, in do_open
>=20
> =A0=A0=A0 h.request(req.get_method(), req.selector, req.data, headers)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 1107, in request
>=20
> =A0=A0=A0 self._send_request(method, url, body, headers)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 1152, in _send_request
>=20
> =A0=A0=A0 self.endheaders(body)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 1103, in endheaders
>=20
> =A0=A0=A0 self._send_output(message_body)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 934, in _send_output
>=20
> =A0=A0=A0 self.send(msg)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 877, in send
>=20
> =A0=A0=A0 self.connect()
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/clien
> t.py",
> line 1261, in connect
>=20
> =A0=A0=A0 server_hostname=3Dserver_hostname)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 385, in wrap_socket
>=20
> =A0=A0=A0 _context=3Dself)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 760, in __init__
>=20
> =A0=A0=A0 self.do_handshake()
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 996, in do_handshake
>=20
> =A0=A0=A0 self._sslobj.do_handshake()
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 641, in do_handshake
>=20
> =A0=A0=A0 self._sslobj.do_handshake()
>=20
> ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify=20
> failed
> (_ssl.c:720)
>=20
> =A0
>=20
> During handling of the above exception, another exception occurred:
>=20
> =A0
>=20
> Traceback (most recent call last):
>=20
> =A0 File "<stdin>", line 1, in <module>
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 188, in urlretrieve
>=20
> =A0=A0=A0 with contextlib.closing(urlopen(url, data)) as fp:
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 163, in urlopen
>=20
> =A0=A0=A0 return opener.open(url, data, timeout)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 466, in open
>=20
> =A0=A0=A0 response =3D self._open(req, data)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 484, in _open
>=20
> =A0=A0=A0 '_open', req)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 444, in _call_chain
>=20
> =A0=A0=A0 result =3D func(*args)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 1297, in https_open
>=20
> =A0=A0=A0 context=3Dself._context, check_hostname=3Dself._check_hostname)
>=20
> =A0 File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/i
> mx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/req
> uest.py",
> line 1256, in do_open
>=20
> =A0=A0=A0 raise URLError(err)
>=20
> urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]=20
> certificate verify failed (_ssl.c:720)>
>=20
>=20


