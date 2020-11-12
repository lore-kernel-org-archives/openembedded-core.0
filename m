Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.70])
 by mx.groups.io with SMTP id smtpd.web09.1944.1605173611174684066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 01:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=gWn/Qg/S;
 spf=pass (domain: kpit.com, ip: 40.107.138.70, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7Ht0p9/NDJOUHgeEHHWx67ieie+bP1POrlSXsy4+tL4ewCftDngrK1isZuQ8vNOXadvTyAwVf34IyTJRpm6Fso2aAl+RRWY9X2gx6l1JhxxHPsr7Fd6UxbqWUmhgjMCuHv+vAL6qug99ZpbbE2BauCbBw5ZrQXqr5P/udX8H6VzITXk18dBGPQsGFiAkm8wGy3aBPxHfol2ZBmkJAvAWmMx4i7ghRcSuB+mNJiuceiOXMTHDKWiisUNLbggSwZZH2WCQDWYF0AF/YgkTX5cThgGIvvahBILqmKW33m2N7RjjA3tnkNMQJat6RIDcDRNQcAMgwy9v2iCWrXHXmyNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUjZIz7iIKy78ACurnYItRBveR5BV0Oz/u90tkGClGk=;
 b=k+zHY/YnPqgSz0LmlwQBQlYYwg2uoqOTLgiTfth7WlkgKNF01Z/vfOkjaByGXnkcLSxihkKJx92xb6xUvMxgXw9EFZb6tCBoufoKD4E+/1IJ0pOgCRsHSyC2IkJe8UqVm3wPu/BcE66HMLWI0igqyZsD4oRe4GAkRg1bkCd+Ev6aftEr48hcTSOFLq00yUPGkLXLG3kQhtqj2jg6o8Ihf4CRh+Ig/WsHgQJ4X6w4x+epeqK6q3bB0YRNDBaA1J4eTfmgYh64z67g1a2I2UT8zeMtBYEIOZwPnvklmSPqiJTrqsxdnWhF8KwGf1i1nClfUwqf+HGohALFXTH+oDqzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUjZIz7iIKy78ACurnYItRBveR5BV0Oz/u90tkGClGk=;
 b=gWn/Qg/SZgQqWJ54i9J/Qjjf8RtIgpjdDO0KzSlASK/+XJRIXbm5rGH6U0V7+PemooGLgX3QOaPlc0bK0+WTHTRpwHFPD+UJGIvzs6AMQMzDk4RZrn5sQttX+cfK5Ap8q0+A7uR+Bhv+A6i04Ov+mSchIUkkNG8xkxnh9otjuck=
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PNZPR01MB4303.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 09:33:19 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5%5]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 09:33:19 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: Re: [poky][master][PATCH] systemd: selinux hook handling to enumerate nexthop
Thread-Topic: [poky][master][PATCH] systemd: selinux hook handling to
 enumerate nexthop
Thread-Index: AQHWspYLFulx/cSO6k6ndoF5cbD6AKnER8Nn
Date: Thu, 12 Nov 2020 09:33:19 +0000
Message-ID: 
 <PNZPR01MB4224736DEB01CC746747D6D390E70@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
References: <1604486040-26986-1-git-send-email-purushottam.choudhary@kpit.com>
In-Reply-To: 
 <1604486040-26986-1-git-send-email-purushottam.choudhary@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [103.51.148.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6913bb4e-8cc7-42e6-6303-08d886edfdeb
x-ms-traffictypediagnostic: PNZPR01MB4303:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PNZPR01MB4303DBA38185A811BEEF7A7C90E70@PNZPR01MB4303.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nDW6jASKZ6kBsPyC1S4PsOz4rFjuOIAGOVBSZzYdkheeaDdS+Fwli/Q4DAp62fmfvwW9+sIHKkIjg5X8FoUIK3/nTejRBDEMamWz1nIGjDplqy41/Ru2ueELZfOnYGW/MAxkI3WRMjLpFbz1nTcprX6A8FYogdyWbiS8Z5qW+DZcpdsOvRt+3nVc4u/Ektbo4dQhjinZVdRBt08iUmBPypAzXUsnD4vnfaFlknCBzq4l2C/VnRHGD/8L3dg+lDPFP4nsd1t6pejfA6xWUicb/Xabt187z29zd+/wQJt3Nm4ymCLs5Qz4+gfwr5wBxi2F/czQ8tYsvGAn8kBuq96b2h+eNK88ESOWSo5k1RoDQ+pPf2LAW5okYqOv64TBYpwrXKZam5bytbYfB4MkpALQPyhZa+0IUSLr/GXrrplXGyI2BQq1v7OPabtbdtfIlMnJk6S/bocPtI2/erMjkByEgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(9686003)(53546011)(316002)(18265965003)(66574015)(110136005)(54906003)(52536014)(26005)(5660300002)(478600001)(86362001)(55016002)(186003)(66476007)(64756008)(66446008)(76116006)(91956017)(7696005)(66946007)(66556008)(8676002)(83380400001)(4326008)(8936002)(71200400001)(33656002)(19627405001)(107886003)(2906002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 yNIRfGzq3MT4PbV9LsTJV4FjrCXHNBaZ5aTMZQzMXd0BDOhsDGGNdeO1Sif+IOE9SBPV1W6OG7tFCobMRp83tV122ulVRnnhQh1LcUQ7NsKHXQjgahnrhNZFTXxQ/QFdx8dwnBhifEMxiqvuVLvVXy5RuXkvJGkEBXbazhec+iuImbfpIYxLt8YcXJ2eCfrnYTsuYr/i5qp7069zFowV3gEb3YRuLZxGPzNVzvBtdSB3TlAlO0FZ7D4DrI33X0iudrlIuhFbL0tTVhvapEhTwo0xcHMTAubm8w6bN0uqgP3d42CwI4PTR62+MlKynNrgHUlbPEhRFN2YudFfyxhVqEBtxURp35qFApIUoPkY2xH/02IfLiM3BS2f+dHRvC8mOLvmlzFB4fLUb0sqXW5iThwiDlg+hu/EUouNRrpUiIitW3Gy+F40rrjxm5I4I0BNFjki8GkP1k557yXp687KdAEybakNFl6QtjKPD6+6vRxzXaHVbsU305fGetA+JvCZgUdO1ZUWhzPULL6Yn5n/ftLQQk6Q1p8GrOSvZtkyZWvvTikrBoZtDv3xgAFhZ/Kd3WBOxdI0AVlbp7nNQWynlIooDEidyvafLJZfdPTYZ7sR0ILxvxI6jw2nnkfcaFMC0TaeSdlFsZDXoFfTWrkKVA==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6913bb4e-8cc7-42e6-6303-08d886edfdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 09:33:19.6277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhiPu5yqKFoRrjmfSQWkgkVgOd12sOKR6b5pY0wico7m5phKU1DuJPlWBIlgFYHdjPCPJ43iSE4wu1VZcK7bWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4303
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB4224736DEB01CC746747D6D390E70PNZPR01MB4224INDP_"

--_000_PNZPR01MB4224736DEB01CC746747D6D390E70PNZPR01MB4224INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Openembedded/Khem,

Is there any update on this patch?

Could you please let me know?

Thanks & Regards,
Purushottam

________________________________
From: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Sent: Wednesday, November 4, 2020 4:04 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Anuj Chougule <Anuj.Chougule@=
kpit.com>; Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [poky][master][PATCH] systemd: selinux hook handling to enumerate =
nexthop

When selinux is enabled, the call of
manager_rtnl_enumerate_nexthop() fails.
This fix is to facilitate selinux hook handling
for enumerating nexthop.

In manager_rtnl_enumerate_nexthop() there is a check
if "Not supported" is returned by the send_netlink() call.
This check expects that -EOPNOTSUPP is returned,
the selinux hook seems to return -EINVAL instead.
This happens in kernel older than 5.3
(more specificallytorvalds/linux@65ee00a) as it does not support
nexthop handling through netlink.
And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP
returns -EINVAL.

Thus adding a call in the manager_rtnl_enumerate_nexthop for the
extra return -EINVAL.

Note: systemd version is different in yocto project (v246.6) and
systemd master(v247) and In systemd verison(246.6)
mac_selinux_enforcing() function is not declared and defined.

Signed-off-by: Purushottam choudhary <purushottam.choudhary@kpit.com>
---
 ...elinux-hook-handling-to-enumerate-nexthop.patch | 46 ++++++++++++++++++=
++++
 meta/recipes-core/systemd/systemd_246.6.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/selinux-hook-handling=
-to-enumerate-nexthop.patch

diff --git a/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enu=
merate-nexthop.patch b/meta/recipes-core/systemd/systemd/selinux-hook-handl=
ing-to-enumerate-nexthop.patch
new file mode 100644
index 0000000..b1c92ed
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-=
nexthop.patch
@@ -0,0 +1,46 @@
+From 92b555aaabf710e0a672a7244e8c0e3963075133 Mon Sep 17 00:00:00 2001
+From: Purushottam choudhary <purushottam.choudhary@kpit.com>
+Date: Wed, 28 Oct 2020 22:11:49 +0530
+Subject: [PATCH] network: selinux hook handling to enumerate nexthop
+
+When selinux is enabled, the call of
+manager_rtnl_enumerate_nexthop() fails.
+
+This fix is to facilitate selinux hook handling for enumerating
+nexthop.
+
+In manager_rtnl_enumerate_nexthop() there is a check
+if "Not supported" is returned by the send_netlink() call.
+
+This check expects that -EOPNOTSUPP is returned,
+the selinux hook seems to return -EINVAL instead.
+
+This happens in kernel older than 5.3
+(more specificallytorvalds/linux@65ee00a) as it does not support
+nexthop handling through netlink.
+
+And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP
+returns -EINVAL.
+
+Thus adding a call in the manager_rtnl_enumerate_nexthop for the
+extra return -EINVAL.
+
+Upstream-Status: Backport
+https://github.com/systemd/systemd/commit/92b555aaabf710e0a672a7244e8c0e39=
63075133
+---
+ src/network/networkd-manager.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager=
.c
+index a6c1a39..2a9be85 100644
+--- a/src/network/networkd-manager.c
++++ b/src/network/networkd-manager.c
+@@ -2121,7 +2121,7 @@ int manager_rtnl_enumerate_nexthop(Manager *m) {
+
+         r =3D sd_netlink_call(m->rtnl, req, 0, &reply);
+         if (r < 0) {
+-                if (r =3D=3D -EOPNOTSUPP) {
++                if (r =3D=3D -EOPNOTSUPP || r =3D=3D -EINVAL) {
+                         log_debug("Nexthop are not supported by the kerne=
l. Ignoring.");
+                         return 0;
+                 }
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core=
/systemd/systemd_246.6.bb
index 9215adf..78990f4 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -21,6 +21,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash=
.patch \
+           file://selinux-hook-handling-to-enumerate-nexthop.patch \
            "

 # patches needed by musl
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PNZPR01MB4224736DEB01CC746747D6D390E70PNZPR01MB4224INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Openembedded/Khem,<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
Is there any update on this patch?<br>
<br>
Could you please let me know?<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>Thanks &amp; Regards,</div>
<div>Purushottam<br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Purushottam Choudha=
ry &lt;purushottam.choudhary@kpit.com&gt;<br>
<b>Sent:</b> Wednesday, November 4, 2020 4:04 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Anuj Chougule &l=
t;Anuj.Chougule@kpit.com&gt;; Aditya Tayade &lt;Aditya.Tayade@kpit.com&gt;<=
br>
<b>Subject:</b> [poky][master][PATCH] systemd: selinux hook handling to enu=
merate nexthop</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">When selinux is enabled, the call of<br>
manager_rtnl_enumerate_nexthop() fails.<br>
This fix is to facilitate selinux hook handling<br>
for enumerating nexthop.<br>
<br>
In manager_rtnl_enumerate_nexthop() there is a check<br>
if &quot;Not supported&quot; is returned by the send_netlink() call.<br>
This check expects that -EOPNOTSUPP is returned,<br>
the selinux hook seems to return -EINVAL instead.<br>
This happens in kernel older than 5.3<br>
(more specificallytorvalds/linux@65ee00a) as it does not support<br>
nexthop handling through netlink.<br>
And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP<br>
returns -EINVAL.<br>
<br>
Thus adding a call in the manager_rtnl_enumerate_nexthop for the<br>
extra return -EINVAL.<br>
<br>
Note: systemd version is different in yocto project (v246.6) and<br>
systemd master(v247) and In systemd verison(246.6)<br>
mac_selinux_enforcing() function is not declared and defined.<br>
<br>
Signed-off-by: Purushottam choudhary &lt;purushottam.choudhary@kpit.com&gt;=
<br>
---<br>
&nbsp;...elinux-hook-handling-to-enumerate-nexthop.patch | 46 +++++++++++++=
+++++++++<br>
&nbsp;meta/recipes-core/systemd/systemd_246.6.bb&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 47 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-core/systemd/systemd/selinux-hook-han=
dling-to-enumerate-nexthop.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enu=
merate-nexthop.patch b/meta/recipes-core/systemd/systemd/selinux-hook-handl=
ing-to-enumerate-nexthop.patch<br>
new file mode 100644<br>
index 0000000..b1c92ed<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-=
nexthop.patch<br>
@@ -0,0 +1,46 @@<br>
+From 92b555aaabf710e0a672a7244e8c0e3963075133 Mon Sep 17 00:00:00 2001<br>
+From: Purushottam choudhary &lt;purushottam.choudhary@kpit.com&gt;<br>
+Date: Wed, 28 Oct 2020 22:11:49 +0530<br>
+Subject: [PATCH] network: selinux hook handling to enumerate nexthop<br>
+<br>
+When selinux is enabled, the call of<br>
+manager_rtnl_enumerate_nexthop() fails.<br>
+<br>
+This fix is to facilitate selinux hook handling for enumerating<br>
+nexthop.<br>
+<br>
+In manager_rtnl_enumerate_nexthop() there is a check<br>
+if &quot;Not supported&quot; is returned by the send_netlink() call.<br>
+<br>
+This check expects that -EOPNOTSUPP is returned,<br>
+the selinux hook seems to return -EINVAL instead.<br>
+<br>
+This happens in kernel older than 5.3<br>
+(more specificallytorvalds/linux@65ee00a) as it does not support<br>
+nexthop handling through netlink.<br>
+<br>
+And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP<br>
+returns -EINVAL.<br>
+<br>
+Thus adding a call in the manager_rtnl_enumerate_nexthop for the<br>
+extra return -EINVAL.<br>
+<br>
+Upstream-Status: Backport<br>
+https://github.com/systemd/systemd/commit/92b555aaabf710e0a672a7244e8c0e39=
63075133<br>
+---<br>
+ src/network/networkd-manager.c | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager=
.c<br>
+index a6c1a39..2a9be85 100644<br>
+--- a/src/network/networkd-manager.c<br>
++++ b/src/network/networkd-manager.c<br>
+@@ -2121,7 +2121,7 @@ int manager_rtnl_enumerate_nexthop(Manager *m) {<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D sd_netlink_call(m-&=
gt;rtnl, req, 0, &amp;reply);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r &lt; 0) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (r =3D=3D -EOPNOTSUPP) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (r =3D=3D -EOPNOTSUPP || r =3D=3D -EINVAL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_=
debug(&quot;Nexthop are not supported by the kernel. Ignoring.&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retu=
rn 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core=
/systemd/systemd_246.6.bb<br>
index 9215adf..78990f4 100644<br>
--- a/meta/recipes-core/systemd/systemd_246.6.bb<br>
+++ b/meta/recipes-core/systemd/systemd_246.6.bb<br>
@@ -21,6 +21,7 @@ SRC_URI +=3D &quot;<a href=3D""></a>file://touchscreen.ru=
les \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch"=
>
file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0003-implment-systemd-sysv-install-for-OE.patch">file://0003-imp=
lment-systemd-sysv-install-for-OE.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch">
file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch</a> \=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://selinux-hook-handling-to-enumerate-nexthop.patch">file://selinux-hook-=
handling-to-enumerate-nexthop.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;# patches needed by musl<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PNZPR01MB4224736DEB01CC746747D6D390E70PNZPR01MB4224INDP_--
