Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 5669 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Nov 2015 09:36:02 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0116.outbound.protection.outlook.com [207.46.100.116])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE3D602C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 09:36:02 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1368.namprd03.prod.outlook.com (10.163.34.154) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Tue, 17 Nov 2015 08:01:32 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0325.019; Tue, 17 Nov 2015 08:01:32 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Different behaviors of sysvinit and systemd on FSL
	p4080ds(ppce500mc core)
Thread-Index: AdEhDeGjcrloGbunSsW639kNI2pbFQ==
Date: Tue, 17 Nov 2015 08:01:31 +0000
Message-ID: <BN3PR03MB1367021AFF01ACA6656F24E0E41D0@BN3PR03MB1367.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@freescale.com; 
x-originating-ip: [123.151.195.51]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1368;
	5:xcPgSTuoEEeWUIYMGt4zpne85FEja8F8b12rNBhDfYRLrjFB2/tpcR34c5SA+ZuIlDbTUguoarU14hmnO2ecOiYVgXLvT0Ju77/Ys8ayan2PGIrQ8ymEzNfOqzRGg1IACgRNC/5V+FITIjr4PaArFw==;
	24:QPLW+kwyOBjak3zNcW2ZLMIk9XztjY+BFHL+xFoI4xqHNwsndof744osgh3tFwjgFrSpnP70gmgnlYvAyt38/7O2pADTdBLt2B5bMP7KgeA=;
	20:E7nvF0TlOHkTbcJxGK9xZDDs4KufbrnLVhuFPjvsYVG7x2/TUWbDA47IuAWtZvGXSbpQR9DPu3oYItoq+mZWfQ==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1368;
x-microsoft-antispam-prvs: <BN3PR03MB13688176970744571A73CE5AE41D0@BN3PR03MB1368.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(108003899814671);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:BN3PR03MB1368; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1368; 
x-forefront-prvs: 07630F72AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(53754006)(199003)(189002)(99286002)(102836002)(33656002)(77096005)(5003600100002)(86362001)(15975445007)(106356001)(105586002)(5002640100001)(11100500001)(5004730100002)(92566002)(5007970100001)(87936001)(74316001)(16236675004)(2900100001)(54356999)(10400500002)(50986999)(19625215002)(189998001)(101416001)(81156007)(97736004)(107886002)(19580395003)(5001920100001)(450100001)(76576001)(5001960100002)(110136002)(19300405004)(5008740100001)(586003)(40100003)(66066001)(229853001)(122556002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1368;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2015 08:01:31.9587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1368
Subject: Different behaviors of sysvinit and systemd on FSL p4080ds(ppce500mc core)
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
X-List-Received-Date: Tue, 17 Nov 2015 09:36:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN3PR03MB1367021AFF01ACA6656F24E0E41D0BN3PR03MB1367namp_"

--_000_BN3PR03MB1367021AFF01ACA6656F24E0E41D0BN3PR03MB1367namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I use jethro of poky + jethro of meta-fsl-ppc layer to build the images (uI=
mage, dtb and core-image-minimal rootfs) for FSL p4080ds board(ppce500mc), =
the boot process works well. The default init manager is sysvinit.

If I add below two lines in local.conf to switch to systemd as the init man=
ager and build new core-image-minimal rootfs, the boot process will hang.
DISTRO_FEATURES_append =3D " systemd"
VIRTUAL-RUNTIME_init_manager =3D "systemd"

The following call trace appears during the systemd rootfs boot up.
...
VFS: Mounted root (ext2 filesystem) on device 1:0.
devtmpfs: mounted
Freeing unused kernel memory: 272K (c085d000 - c08a1000)
init[1]: unhandled signal 4 at 204ea61c nip 204ea61c lr 203bfe24 code 30001
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000004

CPU: 0 PID: 1 Comm: init Not tainted 3.12.37-rt51 #1
Call Trace:
[e80a3d00] [c0006fd4] show_stack+0x34/0x170 (unreliable)
[e80a3d40] [c06837c4] dump_stack+0x78/0xa0
[e80a3d50] [c06818d4] panic+0xd8/0x204
[e80a3da0] [c0030b94] do_exit+0x8f4/0x900
[e80a3e00] [c0031a60] do_group_exit+0x40/0xb0
[e80a3e20] [c00406e4] get_signal_to_deliver+0x254/0x520
[e80a3e70] [c0007b60] do_signal+0x40/0x1f0
[e80a3f30] [c0007e28] do_notify_resume+0x68/0x80
[e80a3f40] [c00109ec] do_user_signal+0x74/0xc4
--- Exception: 700 at 0x204ea61c
    LR =3D 0x203bfe24
Rebooting in 180 seconds..

Does somebody know what is the reason and how to resolve the issue?


Best Regards,

Zhenhua

--_000_BN3PR03MB1367021AFF01ACA6656F24E0E41D0BN3PR03MB1367namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I use jethro of poky &#43; jethro of meta-fsl-ppc la=
yer to build the images (uImage, dtb and core-image-minimal rootfs) for FSL=
 p4080ds board(ppce500mc), the boot process works well. The default init ma=
nager is sysvinit.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I add below two lines in local.conf to switch to =
systemd as the init manager and build new core-image-minimal rootfs, the bo=
ot process will hang.
<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; systemd&quot;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following call trace appears during the systemd =
rootfs boot up.
<o:p></o:p></p>
<p class=3D"MsoNormal">&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal">VFS: Mounted root (ext2 filesystem) on device 1:0.<o=
:p></o:p></p>
<p class=3D"MsoNormal">devtmpfs: mounted<o:p></o:p></p>
<p class=3D"MsoNormal">Freeing unused kernel memory: 272K (c085d000 - c08a1=
000)<o:p></o:p></p>
<p class=3D"MsoNormal">init[1]: unhandled signal 4 at 204ea61c nip 204ea61c=
 lr 203bfe24 code 30001<o:p></o:p></p>
<p class=3D"MsoNormal">Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x00000004<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">CPU: 0 PID: 1 Comm: init Not tainted 3.12.37-rt51 #1=
<o:p></o:p></p>
<p class=3D"MsoNormal">Call Trace:<o:p></o:p></p>
<p class=3D"MsoNormal">[e80a3d00] [c0006fd4] show_stack&#43;0x34/0x170 (unr=
eliable)<o:p></o:p></p>
<p class=3D"MsoNormal">[e80a3d40] [c06837c4] dump_stack&#43;0x78/0xa0<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[e80a3d50] [c06818d4] panic&#43;0xd8/0x204<o:p></o:p=
></p>
<p class=3D"MsoNormal">[e80a3da0] [c0030b94] do_exit&#43;0x8f4/0x900<o:p></=
o:p></p>
<p class=3D"MsoNormal">[e80a3e00] [c0031a60] do_group_exit&#43;0x40/0xb0<o:=
p></o:p></p>
<p class=3D"MsoNormal">[e80a3e20] [c00406e4] get_signal_to_deliver&#43;0x25=
4/0x520<o:p></o:p></p>
<p class=3D"MsoNormal">[e80a3e70] [c0007b60] do_signal&#43;0x40/0x1f0<o:p><=
/o:p></p>
<p class=3D"MsoNormal">[e80a3f30] [c0007e28] do_notify_resume&#43;0x68/0x80=
<o:p></o:p></p>
<p class=3D"MsoNormal">[e80a3f40] [c00109ec] do_user_signal&#43;0x74/0xc4<o=
:p></o:p></p>
<p class=3D"MsoNormal">--- Exception: 700 at 0x204ea61c<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; LR =3D 0x203bfe24<o:p></o:p></p>
<p class=3D"MsoNormal">Rebooting in 180 seconds..<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does somebody know what is the reason and how to res=
olve the issue?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhenhua <o:p></o:p></p>
</div>
</body>
</html>

--_000_BN3PR03MB1367021AFF01ACA6656F24E0E41D0BN3PR03MB1367namp_--
