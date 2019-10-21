Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720080.outbound.protection.outlook.com [40.107.72.80])
	by mail.openembedded.org (Postfix) with ESMTP id C52A17F4C7;
	Mon, 21 Oct 2019 13:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=HZopWZpZfIJSIOSo6+ka1QVR4Cz5c/kWQs5HwtcbAZT7ztV56g4nbGMaRFUuw7FRvx5XGvpiGDEhSqR9XXovmXG1E9fGnyAjp76y2N4BUOcRapc461Nl4HBUa2qz15zSHiqSI580aIuzxafU4xgflqITvTR8R56Vok99ukQM4d2Hrp0G1b/Hx0Y56D+xACb/yne/HcZhSmCaAhTNrDFz4MtStvZatejdr/vCB1qTBGLCM6HxYHguCNZVz3/Tz0kLyTtoqA/oBDtAFH+f4gWyY3cPPaUMP9jC975kgv38/BJwA20iIodjxBDDJ5LA7E74esgoacXqBMAPcI5oI/MeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WXUOOLY4RrIerUroWh4QO1jp1kWT+3FmlzCVKaN6HTw=;
	b=n0qftzZvKiKfmzqk8EfMYYA5JimMHK/CvdP5Q8TrAHHFl1Hv1H5NnjAQwcL9yqj8x8VWoZqpLBt+zVX+S4jU+FJMzvZU8nAvVOYkUXyrDhzTFZ1zwmUsk0oU6JazI0APJnsU2eEf2DO4SEm9D0BGm0LIUKA3ArsYgpvxzyRA1c9ZWDBVJuobeEW/06HkHEwcpbJGUQzyXIFOlEBANWslx/U1w8+auHZ2Xs4PxVLj9Gojmz7uUHd8qG9byfwPLhMRzgK2PymN5zhAn3Vc+sVTOk7iD4TwirKx5uyTO6aBfcbobIJ3kfDsMs5GnDdwE8fY5u0jrNrdJhBbe1AZ/7E2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WXUOOLY4RrIerUroWh4QO1jp1kWT+3FmlzCVKaN6HTw=;
	b=GzckmLRWWFFV24h5CRDTNHh9+nPifZAKxbxiyWmhrR2waP0oT4IEmyKhh2np1Dg/nK7JKQgKeiynBF3zBZSHBrSyC6CA3MVun4+N3HlU3YZXq0gaqTqVP8cNpgkG/188g7ALiWLutlJMi14lDh3W5wnXZ7M9+VYztuXMItnla7g=
Received: from BN6PR0101MB2914.prod.exchangelabs.com (10.174.88.139) by
	BN6PR0101MB2993.prod.exchangelabs.com (10.174.87.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.22; Mon, 21 Oct 2019 13:23:26 +0000
Received: from BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::8d2d:4a8a:9c10:b95f]) by BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::8d2d:4a8a:9c10:b95f%7]) with mapi id 15.20.2347.029;
	Mon, 21 Oct 2019 13:23:26 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Ext4 filesystem name does not exist
Thread-Index: AdWIDVkTsL1UE6iPQ9GeZbQhPOw2Xw==
Date: Mon, 21 Oct 2019 13:23:26 +0000
Message-ID: <BN6PR0101MB2914D42404393531264E9DB18F690@BN6PR0101MB2914.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a37d8a64-3adc-4ca7-b506-08d75629db34
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR0101MB2993:
x-microsoft-antispam-prvs: <BN6PR0101MB2993E3D68FA661FC756F7CB38F690@BN6PR0101MB2993.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(26005)(102836004)(486006)(5660300002)(186003)(6506007)(7696005)(66476007)(66556008)(99286004)(76116006)(71200400001)(71190400001)(55236004)(64756008)(66446008)(66066001)(52536014)(2906002)(476003)(55016002)(6306002)(54896002)(9686003)(86362001)(33656002)(66946007)(74316002)(7736002)(6116002)(236005)(110136005)(790700001)(3846002)(316002)(8676002)(6436002)(25786009)(478600001)(606006)(14454004)(8936002)(81166006)(9326002)(81156014)(2501003)(256004)(14444005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2993;
	H:BN6PR0101MB2914.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kegtSVX6i7ML1PRGd5ZMfQMk3s/wVLFHcQ6T6vkQpKV/0cLtqC2f5iwLiwmavltmOxzlkiI4WDz7Ww6GyPNaw49n0fgF50IytBNP5SvTGQYosrFPu2YSOlMhECVaMR9JP32B7uEg2u3k5H3+cId2vyafnnkEZZIP4l3A2PSAqAIvM2LfL9mKBtObFhlOJNuffIdxft042mqIhsr926mDfdm1IxP31h0hnu/t/R4Ud01NZ7eGApE4hmERYFI24gWLuGMTRZud/Gwq+hVUVdbyLLbfFGvf1JU2vI+fZEYdox2jvKQGyws9f68+/ULuVCc9NtgS0qg7b/eyKz8lwEolKm8iWZCeTrwOXzdKT9Z3g9wOqtSzAvS9s1+xz1XpsOa+jjFfP2S11746d+eOE7XciJOQsbm25aog8RKldKwBflg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37d8a64-3adc-4ca7-b506-08d75629db34
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:23:26.6077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4N/PZqNI9CdCLPje7FQEizOmxm2Xy581j/czBcZynkwmKrZlv/hiawJvD2UvQGkWxcySrS7Iwbiez3dDhDHXrbjbgnxZLmsoEoJFWnkem30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2993
Subject: Ext4 filesystem name does not exist
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
X-List-Received-Date: Mon, 21 Oct 2019 13:23:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR0101MB2914D42404393531264E9DB18F690BN6PR0101MB2914_"

--_000_BN6PR0101MB2914D42404393531264E9DB18F690BN6PR0101MB2914_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I have been doing builds using a Docker setup on a VMware ESXi 6.5 virtual =
machine running Ubuntu 18.04 for the past year.  I have been asked to move =
to building on a VM in Azure.  I created a VM in Azure using the Ubuntu 18.=
04 image from Canonical.  When I try to do the same build in Azure, I get t=
he following error messages:

=3D=3D=3D Start ERROR messages =3D=3D=3D
ERROR: docker-base-image-1.0-r0 do_image_wic: Function failed: do_image_wic=
 (log file is located at /home/blah/build-0.0.13/tmp-glibc/work/intel_corei=
7_64-oe-linux/foo/1.0-r0/temp/log.do_image_wic.44033)
ERROR: Logfile of failure stored in: /home/blah/build-0.0.13/tmp-glibc/work=
/intel_corei7_64-oe-linux/foo/1.0-r0/temp/log.do_image_wic.44033
| OSError: [Errno 22] Invalid argument
| wic.filemap.Error: cannot get block size for '/home/blah/build-0.0.13/tmp=
-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/deploy-foo-image-complete/f=
oo-intel-corei7-64-0.0.13/tmp.wic.5lmon88k/boot.img': [Errno 22] Invalid ar=
gument
| ERROR: Function failed: do_image_wic (log file is located at /home/blah/b=
uild-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/temp/log.do_=
image_wic.44033)
ERROR: Task (/home/blah/meta-stryker/common/recipes-common/images/foo.bb:do=
_image_wic) failed with exit code '1'
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
ERROR:   Ext4 filesystem name (/home/blah/build-0.0.13/tmp-glibc/deploy/ima=
ges/intel-corei7-64/foo-intel-corei7-64-0.0.13.rootfs.ext4) does not exist.
=3D=3D=3D End ERROR messages =3D=3D=3D

The log.do_image_wic.44033 has the following stack trace.

=3D=3D=3D Start log.do_image_wic.44033 stack trace =3D=3D=3D
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_image_wic
INFO: Creating image(s)...

WARNING: overhead-factor was specified, but size was not, so bitbake variab=
les will be used for the size. In this case both IMAGE_OVERHEAD_FACTOR and =
--overhead-factor will be applied
Traceback (most recent call last):
  File "/home/blah/oe-core/scripts/lib/wic/filemap.py", line 97, in __init_=
_
    self.block_size =3D get_block_size(self._f_image)
  File "/home/bruce/oe-core/scripts/lib/wic/filemap.py", line 40, in get_bl=
ock_size
    binary_data =3D fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
OSError: [Errno 22] Invalid argument

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/blah/oe-core/scripts/wic", line 534, in <module>
    sys.exit(main(sys.argv[1:]))
  File "/home/blah/oe-core/scripts/wic", line 529, in main
    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcomma=
nds)
  File "/home/blah/oe-core/scripts/lib/wic/help.py", line 98, in invoke_sub=
command
    subcmd[0](args, usage)
  File "/home/blah/oe-core/scripts/wic", line 234, in wic_create_subcommand
    native_sysroot, options)
  File "/home/blah/oe-core/scripts/lib/wic/engine.py", line 202, in wic_cre=
ate
    plugin.do_create()
  File "/home/blah/oe-core/scripts/lib/wic/plugins/imager/direct.py", line =
101, in do_create
    self.assemble()
  File "/home/blah/oe-core/scripts/lib/wic/plugins/imager/direct.py", line =
218, in assemble
    self._image.assemble()
  File "/home/blah/oe-core/scripts/lib/wic/plugins/imager/direct.py", line =
605, in assemble
    sparse_copy(source, self.path, seek=3Dpart.start * self.sector_size)
  File "/home/blah/oe-core/scripts/lib/wic/filemap.py", line 552, in sparse=
_copy
    fmap =3D api(src_fname)
  File "/home/blah/oe-core/scripts/lib/wic/filemap.py", line 534, in filema=
p
    return FilemapFiemap(image, log)
  File "/home/blah/oe-core/scripts/lib/wic/filemap.py", line 352, in __init=
__
    _FilemapBase.__init__(self, image, log)
  File "/home/blah/oe-core/scripts/lib/wic/filemap.py", line 100, in __init=
__
    % (self._image_path, err))
wic.filemap.Error: cannot get block size for '/home/blah/build-0.0.13/tmp-g=
libc/work/intel_corei7_64-oe-linux/foo/1.0-r0/deploy-foo-image-complete/foo=
-intel-corei7-64-0.0.13/tmp.wic.5lmon88k/boot.img': [Errno 22] Invalid argu=
ment
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_image_wic (log file is located at /home/blah/bui=
ld-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/temp/log.do_im=
age_wic.44033)
=3D=3D=3D End log.do_image_wic.44033 stack trace =3D=3D=3D

For some reason, it looks like it appears on the Azure VM the build is look=
ing for boot.img in a temporary directory, .../tmp-glibc/work/intel_corei7_=
64-oe-linux/foo/1.0-r0/deploy-foo-complete/foo-intel-corei7-64-0.0.13/tmp.w=
ic.5lmon88k.  The tmp.wic.5lmon88k does not exist.  However, in the .../foo=
-intel-corei7-64-0.0.13 there is a boot.img file.

So, I'm very confused as to why my build works on my VMware ESXi 6.5 VM but=
 not on the Azure VM.  I'm using docker-ce 18.09.1 on my VMware ESXi 6.5 VM=
.  I am using docker-ce 19.03.3 on my Azure VM.  The Dockerfile and all of =
the files I'm copying into the Docker image are the same.  I've done side b=
y side builds.  So, I'm very confident I'm downloading the same OpenEmbedde=
d GIT repos.  I'm guessing I'm missing something somewhere, but I do not kn=
ow where.

If anyone can help me understand this, and give me guidance on how to fix t=
his, it would be greatly appreciated.

Thank you

Lewis Muhlenkamp

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BN6PR0101MB2914D42404393531264E9DB18F690BN6PR0101MB2914_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have been doing builds using a Docker setup on a V=
Mware ESXi 6.5 virtual machine running Ubuntu 18.04 for the past year.&nbsp=
; I have been asked to move to building on a VM in Azure.&nbsp; I created a=
 VM in Azure using the Ubuntu 18.04 image from
 Canonical.&nbsp; When I try to do the same build in Azure, I get the follo=
wing error messages:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start ERROR messages =3D=3D=3D<o:p></o:p><=
/p>
<p class=3D"MsoNormal">ERROR: docker-base-image-1.0-r0 do_image_wic: Functi=
on failed: do_image_wic (log file is located at /home/blah/build-0.0.13/tmp=
-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/temp/log.do_image_wic.44033=
)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /home/blah/buil=
d-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/temp/log.do_ima=
ge_wic.44033<o:p></o:p></p>
<p class=3D"MsoNormal">| OSError: [Errno 22] Invalid argument<o:p></o:p></p=
>
<p class=3D"MsoNormal">| wic.filemap.Error: cannot get block size for '/hom=
e/blah/build-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/depl=
oy-foo-image-complete/foo-intel-corei7-64-0.0.13/tmp.wic.5lmon88k/boot.img'=
: [Errno 22] Invalid argument<o:p></o:p></p>
<p class=3D"MsoNormal">| ERROR: Function failed: do_image_wic (log file is =
located at /home/blah/build-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/=
foo/1.0-r0/temp/log.do_image_wic.44033)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task (/home/blah/meta-stryker/common/recipes-=
common/images/foo.bb:do_image_wic) failed with exit code '1'<o:p></o:p></p>
<p class=3D"MsoNormal">Summary: There was 1 ERROR message shown, returning =
a non-zero exit code.<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp; Ext4 filesystem name (/home/blah/=
build-0.0.13/tmp-glibc/deploy/images/intel-corei7-64/foo-intel-corei7-64-0.=
0.13.rootfs.ext4) does not exist.<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End ERROR messages =3D=3D=3D<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The log.do_image_wic.44033 has the following stack t=
race.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start log.do_image_wic.44033 stack trace =
=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">DEBUG: Python function extend_recipe_sysroot finishe=
d<o:p></o:p></p>
<p class=3D"MsoNormal">DEBUG: Executing shell function do_image_wic<o:p></o=
:p></p>
<p class=3D"MsoNormal">INFO: Creating image(s)...<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WARNING: overhead-factor was specified, but size was=
 not, so bitbake variables will be used for the size. In this case both IMA=
GE_OVERHEAD_FACTOR and --overhead-factor will be applied<o:p></o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/filemap.py&quot;, line 97, in __init__<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.block_size =3D get_block_siz=
e(self._f_image)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/bruce/oe-core/scripts/lib/wi=
c/filemap.py&quot;, line 40, in get_block_size<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; binary_data =3D fcntl.ioctl(file_=
obj, 2, struct.pack('I', 0))<o:p></o:p></p>
<p class=3D"MsoNormal">OSError: [Errno 22] Invalid argument<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">During handling of the above exception, another exce=
ption occurred:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/wic&quo=
t;, line 534, in &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; sys.exit(main(sys.argv[1:]))<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/wic&quo=
t;, line 529, in main<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return hlp.invoke_subcommand(args=
, parser, hlp.wic_help_usage, subcommands)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/help.py&quot;, line 98, in invoke_subcommand<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; subcmd[0](args, usage)<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/wic&quo=
t;, line 234, in wic_create_subcommand<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; native_sysroot, options)<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/engine.py&quot;, line 202, in wic_create<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; plugin.do_create()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/plugins/imager/direct.py&quot;, line 101, in do_create<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self.assemble()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/plugins/imager/direct.py&quot;, line 218, in assemble<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; self._image.assemble()<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/plugins/imager/direct.py&quot;, line 605, in assemble<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; sparse_copy(source, self.path, se=
ek=3Dpart.start * self.sector_size)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/filemap.py&quot;, line 552, in sparse_copy<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; fmap =3D api(src_fname)<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/filemap.py&quot;, line 534, in filemap<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; return FilemapFiemap(image, log)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/filemap.py&quot;, line 352, in __init__<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; _FilemapBase.__init__(self, image=
, log)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/blah/oe-core/scripts/lib/wic=
/filemap.py&quot;, line 100, in __init__<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; % (self._image_path, err))<o:p></=
o:p></p>
<p class=3D"MsoNormal">wic.filemap.Error: cannot get block size for '/home/=
blah/build-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/deploy=
-foo-image-complete/foo-intel-corei7-64-0.0.13/tmp.wic.5lmon88k/boot.img': =
[Errno 22] Invalid argument<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: exit code 1 from a shell command.<o:p></o:p=
></p>
<p class=3D"MsoNormal">ERROR: Function failed: do_image_wic (log file is lo=
cated at /home/blah/build-0.0.13/tmp-glibc/work/intel_corei7_64-oe-linux/fo=
o/1.0-r0/temp/log.do_image_wic.44033)<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End log.do_image_wic.44033 stack trace =3D=
=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For some reason, it looks like it appears on the Azu=
re VM the build is looking for boot.img in a temporary directory, &#8230;/t=
mp-glibc/work/intel_corei7_64-oe-linux/foo/1.0-r0/deploy-foo-complete/foo-i=
ntel-corei7-64-0.0.13/tmp.wic.5lmon88k.&nbsp;
 The tmp.wic.5lmon88k does not exist.&nbsp; However, in the &#8230;/foo-int=
el-corei7-64-0.0.13 there is a boot.img file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So, I&#8217;m very confused as to why my build works=
 on my VMware ESXi 6.5 VM but not on the Azure VM.&nbsp; I&#8217;m using do=
cker-ce 18.09.1 on my VMware ESXi 6.5 VM.&nbsp; I am using docker-ce 19.03.=
3 on my Azure VM.&nbsp; The Dockerfile and all of the files I&#8217;m
 copying into the Docker image are the same.&nbsp; I&#8217;ve done side by =
side builds.&nbsp; So, I&#8217;m very confident I&#8217;m downloading the s=
ame OpenEmbedded GIT repos.&nbsp; I&#8217;m guessing I&#8217;m missing some=
thing somewhere, but I do not know where.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If anyone can help me understand this, and give me g=
uidance on how to fix this, it would be greatly appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Lewis Muhlenkamp<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a>
</body>
</html>

--_000_BN6PR0101MB2914D42404393531264E9DB18F690BN6PR0101MB2914_--
