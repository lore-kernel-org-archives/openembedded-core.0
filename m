Return-Path: <mvader@victronenergy.com>
X-Greylist: delayed 3552 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 May 2016 11:28:26 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0125.outbound.protection.outlook.com [157.56.112.125])
	by mail.openembedded.org (Postfix) with ESMTP id 74F286B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=47/bqh42Zy1B3WWJ518bHB1fpfdj7mAWuNoe/h5rclc=;
	b=AWpgWF8p0ab2X2bIUg1zA368g7kC/E/JxRW4wWJ4kA0b0+t7h8+zHa9T84+404UJMM7qgJDUAOY909N2w3T5PTskCcp6bpkbLY6aoxquw5Wy5G5qMZmgfsCLhW15zp3dKT0t3qEfPW2rb3hHdAPzQ6v8LAvibhaQWjYx3Au2Yrs=
Received: from DB5PR07MB1431.eurprd07.prod.outlook.com (10.166.4.17) by
	DB5PR07MB1432.eurprd07.prod.outlook.com (10.166.4.18) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Mon, 23 May 2016 08:58:10 +0000
Received: from DB5PR07MB1431.eurprd07.prod.outlook.com ([10.166.4.17]) by
	DB5PR07MB1431.eurprd07.prod.outlook.com ([10.166.4.17]) with mapi id
	15.01.0497.019; Mon, 23 May 2016 08:58:10 +0000
From: Matthijs Vader <mvader@victronenergy.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: wic wks: data partition only mounted on second boot?
Thread-Index: AdG0z+bhJeMhTGUwS9ql4pikgxt6oA==
Date: Mon, 23 May 2016 08:58:10 +0000
Message-ID: <DB5PR07MB14316CF3421C68D679BBC7B3C54E0@DB5PR07MB1431.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=victronenergy.com;
x-originating-ip: [84.53.67.98]
x-ms-office365-filtering-correlation-id: e3e58402-18df-45de-6a1f-08d382e85df8
x-microsoft-exchange-diagnostics: 1; DB5PR07MB1432;
	5:SR+fIaGZLETgISjefiAXLlHVMRgf+Pl6KBHC5gjz4wRz5FqpH23DovnlPz55GCqgqfUhs4eJ8ckxaQ2RXmlXF3IRPbhMC4lb6C09K6qXgfm2+SW8oItK4g3Ra2SRHWcKcVQOymwOvWeMqulPyPTrfw==;
	24:41kXt023PJpEdtzGg9q0Zt1wfLoLOEjEXPXpvKSVBvXwP6+Zbbq0r8agzy32KgEqZqHMGAOhHN1ICh8zqRrDxFeoXMtPuP/yWTjYZzTpO9M=;
	7:RKOxKlkG6zoipRPVXQcBwKG+vZ3+dYSoBvJCxicKtchL/+A1Gfu7vigv+m+A5f4dvODyAnHsCfAlF7B6mdY6mSjDoSjDtjtTSYDY3tLapd0hAQM5nkKxhQGj2eaKXh7P6G/vbVYWM51YRUItCtTAPgLca3NPjzA6Dnc4dI+4QQ+GSJjSAwGH1hv/fzbenvQP
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR07MB1432;
x-microsoft-antispam-prvs: <DB5PR07MB1432198770501A02891B05FAC54E0@DB5PR07MB1432.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041072)(6043046);
	SRVR:DB5PR07MB1432; BCL:0; PCL:0; RULEID:; SRVR:DB5PR07MB1432; 
x-forefront-prvs: 0951AB0A30
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(5004730100002)(107886002)(110136002)(5002640100001)(54356999)(86362001)(11100500001)(77096005)(5008740100001)(2351001)(74316001)(229853001)(50986999)(2900100001)(15975445007)(2501003)(9326002)(66066001)(189998001)(3280700002)(3660700001)(9686002)(2906002)(19300405004)(76576001)(6116002)(1220700001)(790700001)(3846002)(122556002)(92566002)(8676002)(19609705001)(19580395003)(19580405001)(81166006)(8936002)(450100001)(5003600100002)(87936001)(10400500002)(16236675004)(586003)(575784001)(33656002)(19625215002)(102836003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1432;
	H:DB5PR07MB1431.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2016 08:58:10.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1432
Subject: wic wks: data partition only mounted on second boot?
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
X-List-Received-Date: Mon, 23 May 2016 11:28:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB5PR07MB14316CF3421C68D679BBC7B3C54E0DB5PR07MB1431eurp_"

--_000_DB5PR07MB14316CF3421C68D679BBC7B3C54E0DB5PR07MB1431eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have my wks file like this:


part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvfat --la=
bel boot --active --align 4 --size 16
part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root --alig=
n 4
part /data --ondisk mmcblk0 --size 100M --fstype=3Dext4 --label data --alig=
n 4


It creates the /data partition, and adds it to the .wic file, all fine. But=
 on
the first boot it is not auto-mounted. From the boot log:


[    1.898069] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mo=
de. Opts: (null)
[    1.906798] VFS: Mounted root (ext4 filesystem) readonly on device 179:2=
.
[    1.919446] devtmpfs: mounted
[    1.923113] Freeing unused kernel memory: 264K (c069e000 - c06e0000)
version 2.88 booting
Starting udev
[    2.535288] udevd[657]: starting version 182


And some extra info:


root@beaglebone:~# mount
/dev/root on / type ext4 (rw,relatime,data=3Dordered)
devtmpfs on /dev type devtmpfs (rw,relatime,size=3D243816k,nr_inodes=3D6095=
4,mode=3D755)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=3D5,mode=3D620)

root@beaglebone:~# cat /etc/fstab
# stock fstab - you probably want to override this with a machine specific =
one

/dev/root            /                    auto       defaults              =
1  1
proc                 /proc                proc       defaults              =
0  0
devpts               /dev/pts             devpts     mode=3D0620,gid=3D5   =
    0  0
tmpfs                /run                 tmpfs      mode=3D0755,nodev,nosu=
id,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              =
0  0
/dev/mmcblk0p3  /data   ext4    defaults        0       0


Now, if I just reboot the device, the extra image is mounted during startup=
:


[    1.897948] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mo=
de. Opts: (null)
[    1.906674] VFS: Mounted root (ext4 filesystem) readonly on device 179:2=
.
[    1.919137] devtmpfs: mounted
[    1.922811] Freeing unused kernel memory: 264K (c069e000 - c06e0000)
version 2.88 booting
[    2.925735] EXT4-fs (mmcblk0p3): mounted filesystem with ordered data mo=
de. Opts: (null)
Starting udev
udev: Not using udev cache because of changes detected in the following fil=
es:
udev:     /proc/version /proc/cmdline /proc/devices
udev:     lib/udev/rules.d/* etc/udev/rules.d/*
udev: The udev cache will be regenerated. To identify the detected changes,
udev: compare the cached sysconf at   /etc/udev/cache.data
udev: against the current sysconf at  /dev/shm/udev.cache
[    3.193848] udevd[664]: starting version 182


And also mount shows it mounted:


root@beaglebone:~# mount
/dev/root on / type ext4 (rw,relatime,data=3Dordered)
devtmpfs on /dev type devtmpfs (rw,relatime,size=3D243816k,nr_inodes=3D6095=
4,mode=3D755)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
/dev/mmcblk0p3 on /data type ext4 (rw,relatime,data=3Dordered)
devpts on /dev/pts type devpts (rw,relatime,gid=3D5,mode=3D620)


Any ideas how to make it boot during the first boot as well?

Thanks, Matthijs

--_000_DB5PR07MB14316CF3421C68D679BBC7B3C54E0DB5PR07MB1431eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have my wks file like this:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">part /boot --source bootimg-partition --ondisk mmcbl=
k0 --fstype=3Dvfat --label boot --active --align 4 --size 16<o:p></o:p></p>
<p class=3D"MsoNormal">part / --source rootfs --ondisk mmcblk0 --fstype=3De=
xt4 --label root --align 4<o:p></o:p></p>
<p class=3D"MsoNormal">part /data --ondisk mmcblk0 --size 100M --fstype=3De=
xt4 --label data --align 4<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It creates the /data partition, and adds it to the .=
wic file, all fine. But on<o:p></o:p></p>
<p class=3D"MsoNormal">the first boot it is not auto-mounted. From the boot=
 log:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.898069] EXT4-fs (mmcblk0p2): m=
ounted filesystem with ordered data mode. Opts: (null)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.906798] VFS: Mounted root (ext=
4 filesystem) readonly on device 179:2.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.919446] devtmpfs: mounted<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.923113] Freeing unused kernel =
memory: 264K (c069e000 - c06e0000)<o:p></o:p></p>
<p class=3D"MsoNormal">version 2.88 booting<o:p></o:p></p>
<p class=3D"MsoNormal">Starting udev<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 2.535288] udevd[657]: starting v=
ersion 182<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And some extra info:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@beaglebone:~# mount<o:p></o:p></p>
<p class=3D"MsoNormal">/dev/root on / type ext4 (rw,relatime,data=3Dordered=
)<o:p></o:p></p>
<p class=3D"MsoNormal">devtmpfs on /dev type devtmpfs (rw,relatime,size=3D2=
43816k,nr_inodes=3D60954,mode=3D755)<o:p></o:p></p>
<p class=3D"MsoNormal">proc on /proc type proc (rw,relatime)<o:p></o:p></p>
<p class=3D"MsoNormal">sysfs on /sys type sysfs (rw,relatime)<o:p></o:p></p=
>
<p class=3D"MsoNormal">debugfs on /sys/kernel/debug type debugfs (rw,relati=
me)<o:p></o:p></p>
<p class=3D"MsoNormal">tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755=
)<o:p></o:p></p>
<p class=3D"MsoNormal">tmpfs on /var/volatile type tmpfs (rw,relatime)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">devpts on /dev/pts type devpts (rw,relatime,gid=3D5,=
mode=3D620)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@beaglebone:~# cat /etc/fstab<o:p></o:p></p>
<p class=3D"MsoNormal"># stock fstab - you probably want to override this w=
ith a machine specific one<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/dev/root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; auto&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 1<o:p></o:p></p>
<p class=3D"MsoNormal">proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/proc&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 0<o:p></o:p></p>
<p class=3D"MsoNormal">devpts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devpts&nbsp;&nbsp;&nbsp;&nbsp;=
 mode=3D0620,gid=3D5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 0<o:p></o:=
p></p>
<p class=3D"MsoNormal">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /run&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode=3D0755,nodev,nosuid,strictatime 0&nbsp;=
 0<o:p></o:p></p>
<p class=3D"MsoNormal">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/var/volatile&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&=
nbsp; 0<o:p></o:p></p>
<p class=3D"MsoNormal">/dev/mmcblk0p3&nbsp; /data&nbsp;&nbsp; ext4&nbsp;&nb=
sp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Now, if I just reboot the device, the extra image is=
 mounted during startup:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.897948] EXT4-fs (mmcblk0p2): m=
ounted filesystem with ordered data mode. Opts: (null)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.906674] VFS: Mounted root (ext=
4 filesystem) readonly on device 179:2.<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.919137] devtmpfs: mounted<o:p>=
</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 1.922811] Freeing unused kernel =
memory: 264K (c069e000 - c06e0000)<o:p></o:p></p>
<p class=3D"MsoNormal">version 2.88 booting<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 2.925735] EXT4-fs (mmcblk0p3): m=
ounted filesystem with ordered data mode. Opts: (null)<o:p></o:p></p>
<p class=3D"MsoNormal">Starting udev<o:p></o:p></p>
<p class=3D"MsoNormal">udev: Not using udev cache because of changes detect=
ed in the following files:<o:p></o:p></p>
<p class=3D"MsoNormal">udev:&nbsp;&nbsp;&nbsp;&nbsp; /proc/version /proc/cm=
dline /proc/devices<o:p></o:p></p>
<p class=3D"MsoNormal">udev:&nbsp;&nbsp;&nbsp;&nbsp; lib/udev/rules.d/* etc=
/udev/rules.d/*<o:p></o:p></p>
<p class=3D"MsoNormal">udev: The udev cache will be regenerated. To identif=
y the detected changes,<o:p></o:p></p>
<p class=3D"MsoNormal">udev: compare the cached sysconf at&nbsp;&nbsp; /etc=
/udev/cache.data<o:p></o:p></p>
<p class=3D"MsoNormal">udev: against the current sysconf at&nbsp; /dev/shm/=
udev.cache<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp;&nbsp; 3.193848] udevd[664]: starting v=
ersion 182<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And also mount shows it mounted:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@beaglebone:~# mount<o:p></o:p></p>
<p class=3D"MsoNormal">/dev/root on / type ext4 (rw,relatime,data=3Dordered=
)<o:p></o:p></p>
<p class=3D"MsoNormal">devtmpfs on /dev type devtmpfs (rw,relatime,size=3D2=
43816k,nr_inodes=3D60954,mode=3D755)<o:p></o:p></p>
<p class=3D"MsoNormal">proc on /proc type proc (rw,relatime)<o:p></o:p></p>
<p class=3D"MsoNormal">sysfs on /sys type sysfs (rw,relatime)<o:p></o:p></p=
>
<p class=3D"MsoNormal">debugfs on /sys/kernel/debug type debugfs (rw,relati=
me)<o:p></o:p></p>
<p class=3D"MsoNormal">tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755=
)<o:p></o:p></p>
<p class=3D"MsoNormal">tmpfs on /var/volatile type tmpfs (rw,relatime)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">/dev/mmcblk0p3 on /data type ext4 (rw,relatime,data=
=3Dordered)<o:p></o:p></p>
<p class=3D"MsoNormal">devpts on /dev/pts type devpts (rw,relatime,gid=3D5,=
mode=3D620)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any ideas how to make it boot during the first boot =
as well?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks, Matthijs<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB5PR07MB14316CF3421C68D679BBC7B3C54E0DB5PR07MB1431eurp_--
