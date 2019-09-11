Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780081.outbound.protection.outlook.com [40.107.78.81])
	by mail.openembedded.org (Postfix) with ESMTP id D0EE77E735;
	Wed, 11 Sep 2019 19:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jFpRjOY8Pkc1AHJHoksW6mejq2jEn2ldcCEx04WsKX8w34n5D8n3wl4k94AbOCC3+/Um2Kq3fn/b0o+kORnbVR/8kNnVwrU457PpipxFqJpgIB4vsZuW9KZRHpy1K+4REFzIKj2klK0c6LXytB4yFI1qbtX48KvUXRTsk7yU1Ecduxjsf9kudyDzgsyMSMkW8oZzwJGXIfJKrIf8SZpji9kBP2Xdw+B/ePfgdla+qWdEN7cfi2haMKvkwcXc44HICHTm4BWL6HYiiikEzBjL3rgKLuBUhOniPMxGJevSCr7z5yJqDqunIezXGEeToUWcvIkvnm3VHGRxAeOY8LRA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iFpbMIXDrl6QUlHcS3C3cQHuLUbIwncgQLyAXh9mSD8=;
	b=B9JCCVAh7XDdVZp1D1fdBCGBtUsZehs6dYHD3Guzsstl50HPriKkLTSvS83e+aJbgT4VVKExrW8GQQfjOxPCvYdmS4f4TIb8vJPF0Lmxf/XHiytIssDBykc5kPBoHzLkyXTwHejOwbRfbpG1jhyVaKgsHTKomdKcPQX4g/t65RV5RcGsf/rI7DH+GDW4yYQ1eUqpsvd7ivyPwC1MY0Vc6AOC4gFIl260Q3RUfk+cbrU75z3VFSHs5FXx3G7r7YZ0+/FWBc+rlfY+GbYo4vcb/Y/CqWNjQpXBciZBxweFZaHa/VFngsXgfnuttxu6orm5YzxuhqZcHmsIBDrTuM7oMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iFpbMIXDrl6QUlHcS3C3cQHuLUbIwncgQLyAXh9mSD8=;
	b=vfr6vXpec9w5cM+58tQNqrH0xghE9tX4zu0MFNLRIt2B2pX0poCUwp3wFx4LBAjlLqVATF4rEPeaqA4rM9VVTc/btvnR09ATbAfPBJiWdCcDwFxU6lh44oNwe2wXPrXtdZ9iImORzXTH6r/nNfKD1X9aubW8EXjdIjsUjJPofL4=
Received: from BN6PR0101MB2914.prod.exchangelabs.com (10.174.88.139) by
	BN6PR0101MB2881.prod.exchangelabs.com (10.174.86.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.18; Wed, 11 Sep 2019 19:43:18 +0000
Received: from BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::55ae:1d73:c222:271c]) by BN6PR0101MB2914.prod.exchangelabs.com
	([fe80::55ae:1d73:c222:271c%3]) with mapi id 15.20.2241.022;
	Wed, 11 Sep 2019 19:43:17 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: How to enable root logical volume in systemd-boot
Thread-Index: AdVo1g0Ey2JxhTvAR5ObltZu4MRyCQ==
Date: Wed, 11 Sep 2019 19:43:17 +0000
Message-ID: <BN6PR0101MB29146BD2B86D87C87925EDB48FB10@BN6PR0101MB2914.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eca3919b-90d9-4d33-2b1b-08d736f04b49
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7167020)(7193020);
	SRVR:BN6PR0101MB2881; 
x-ms-traffictypediagnostic: BN6PR0101MB2881:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR0101MB28813F2EF0136C3E3411A17C8FB10@BN6PR0101MB2881.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(366004)(376002)(396003)(189003)(199004)(504964003)(7736002)(81166006)(316002)(3846002)(81156014)(8936002)(55236004)(110136005)(74316002)(9326002)(8676002)(2906002)(6306002)(54896002)(256004)(14444005)(26005)(236005)(102836004)(55016002)(9686003)(53936002)(186003)(66066001)(478600001)(33656002)(486006)(66946007)(476003)(66556008)(76116006)(66476007)(6436002)(450100002)(66446008)(64756008)(2501003)(52536014)(606006)(99286004)(71200400001)(71190400001)(6506007)(14454004)(86362001)(5660300002)(7696005)(790700001)(6116002)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2881;
	H:BN6PR0101MB2914.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GqWqWJkONDgtgoDiQO67VR5aN/LczFZZd8J73947Q3s3E67P5uMH3PuAsguuzlCkl2Be5NSOFl4fPkgSnIX5PFUH39dpvwfK4Xwq8SMS6kRbwm6/4xAURmlvALct0zoB62kXdv+Ffm5R03PwmWyAzT/lPlK4z7HzfR77QyuCusx1bd1Y32mTrljtFOKQ3iBPhaVFIVYtR1pug7fyzzmD245IVML5GAbJsny18dXzRHQioCtEUbgyBCFH9xw6rJpLMq/O93LjCypASiH/6hjwedJg0bIxBI71rrdujpjtwLvL+w0fFbrrHd3+uAitvRa8XVEqsM87eRf+3d1LwR8C03eVl4FOeWR3fJY0XALby4v+Bp89AsVA2xgjhRZFuFjpOk4VtMuJhGRtzttlb8XW2wnt9+ebBzEj/MpXkTywVFE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca3919b-90d9-4d33-2b1b-08d736f04b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 19:43:17.8772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENC2XTTIXiKtE0dObPBOo+ROhsEtfuVxqFrdeUzbmi1CUgSO/bsOcm8QgFMkNir3cwniTN7hCj3yjJLoXJjtNBnc2LSQ01pPweDNwAmZHkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2881
Subject: How to enable root logical volume in systemd-boot
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
X-List-Received-Date: Wed, 11 Sep 2019 19:43:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR0101MB29146BD2B86D87C87925EDB48FB10BN6PR0101MB2914_"

--_000_BN6PR0101MB29146BD2B86D87C87925EDB48FB10BN6PR0101MB2914_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

First, I was using 2.6.  I tried under 2.7 and got the same issue.

I need to have the root filesystem be a logical volume.

I updated my core-image-minimal-initramfs.bbappend to include the following=
:

PACKAGE_INSTALL_append =3D " lvm2"


The gets the lvm2 commands into the initramfs.  I can now run pvcreate, vgc=
reate and lvcreate in my custom initrdscripts/files/init-install-efi.sh scr=
ipt.

rootfs=3D/dev/sda2
pvcreate $rootfs
vgcreate vg_root $rootfs
rootfs=3D/dev/vg_root/lv_root
lvcreate -n lv_root -l 95%VG vg_root
mkfs.ext4 -F -O 64bit $rootfs

All of the above run successfully.

I then try to update the loader file with the UUID of the logical volume

SYSTEMDBOOT_CFGS=3D"/boot/loader/entries/boot.conf"
rootuuid=3D$(blkid -o value -s UUID ${rootfs})
sed -i "s@options *@options root=3DUUID=3D$rootuuid rw rootwait quiet @" $S=
YSTEMDBOOT_CFGS

These too are successful.  At least the appropriate changes are made.  Unfo=
rtunately I do not think I am putting in all of the appropriate changes.

When I boot, the system hangs waiting for root device.  I do not see any me=
ssages in the boot output showing anything is trying to start any LVM servi=
ces or run any LVM commands.  So, I am guessing I am missing items in the o=
ptions line.

I've tried manually editing the boot command when booting, but nothing has =
worked.  I've tried adding lvm to the line, changing the root entry, etc.  =
The boot always hangs waiting for the root device.

I did not find anything useful online.  So, asking here.  If there is somet=
hing online that would help, please point me in the right direction.

If there is nothing, can anyone here help me get my openembedded linux OS t=
o boot off of a root logical volume?

Thank you in advance

Lewis Muhlenkamp

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BN6PR0101MB29146BD2B86D87C87925EDB48FB10BN6PR0101MB2914_
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
<p class=3D"MsoNormal">First, I was using 2.6.&nbsp; I tried under 2.7 and =
got the same issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I need to have the root filesystem be a logical volu=
me.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I updated my core-image-minimal-initramfs.bbappend t=
o include the following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PACKAGE_INSTALL_append =3D &#8220; lvm2&#8221;<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The gets the lvm2 commands into the initramfs.&nbsp;=
 I can now run pvcreate, vgcreate and lvcreate in my custom initrdscripts/f=
iles/init-install-efi.sh script.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">rootfs=3D/dev/sda2<o:p></o:p></p>
<p class=3D"MsoNormal">pvcreate $rootfs<o:p></o:p></p>
<p class=3D"MsoNormal">vgcreate vg_root $rootfs<o:p></o:p></p>
<p class=3D"MsoNormal">rootfs=3D/dev/vg_root/lv_root<o:p></o:p></p>
<p class=3D"MsoNormal">lvcreate -n lv_root -l 95%VG vg_root<o:p></o:p></p>
<p class=3D"MsoNormal">mkfs.ext4 -F -O 64bit $rootfs<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">All of the above run successfully.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I then try to update the loader file with the UUID o=
f the logical volume<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">SYSTEMDBOOT_CFGS=3D&#8221;/boot/loader/entries/boot.=
conf&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">rootuuid=3D$(blkid -o value -s UUID ${rootfs})<o:p><=
/o:p></p>
<p class=3D"MsoNormal">sed -i &#8220;s@options *@options root=3DUUID=3D$roo=
tuuid rw rootwait quiet @&#8221; $SYSTEMDBOOT_CFGS<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These too are successful.&nbsp; At least the appropr=
iate changes are made.&nbsp; Unfortunately I do not think I am putting in a=
ll of the appropriate changes.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I boot, the system hangs waiting for root devic=
e.&nbsp; I do not see any messages in the boot output showing anything is t=
rying to start any LVM services or run any LVM commands.&nbsp; So, I am gue=
ssing I am missing items in the options line.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve tried manually editing the boot command w=
hen booting, but nothing has worked.&nbsp; I&#8217;ve tried adding lvm to t=
he line, changing the root entry, etc.&nbsp; The boot always hangs waiting =
for the root device.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I did not find anything useful online.&nbsp; So, ask=
ing here.&nbsp; If there is something online that would help, please point =
me in the right direction.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If there is nothing, can anyone here help me get my =
openembedded linux OS to boot off of a root logical volume?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you in advance<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Lewis Muhlenkamp<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a>
</body>
</html>

--_000_BN6PR0101MB29146BD2B86D87C87925EDB48FB10BN6PR0101MB2914_--
