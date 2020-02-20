Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390040.outbound.protection.outlook.com [40.107.139.40])
	by mail.openembedded.org (Postfix) with ESMTP id C0A7C61299
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SI7LV3BRo42VleFJs4+90yRY55L1AqkIDl+4FRpSepLer4+I3KZHhLi2a50P2VUlMiQbczb8td8TuEQCH76KkV/qyf7Zjr2YNofKIre0onr0nInipMABPXORyCtdqiWhhF7NjByqje1of0IYOo/wdFnPx/Q8YXRWf9x4I8Iki5yYiRe/dxkdHQO9aoTEa8Zqo6tZi95+vwKfHgs7+E9eGX3K+9I8JnixaE5IVKDNHA3nQbW68bxj8/VOdysnpIkLBFGz/NSVEswbrM1U7V64oJNo8noPg/Mt4WcuzIVlSc5KZGff6g8xpHNZgC4VGIrdP55RuxUDRapEzocsqtiroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1KTtRdJiA81nxtqxCT1oPmwHWKMtOrd7nanf1emzji8=;
	b=JmXU0mMKd8VYGo4QBDxvys+QrVGpanmusVsrTKjofPcWqcnh3uu+ri1HMfilrYDnpihkygfc1QWsMdEcsmHLn/83SDCqparUhjY3okYljB29irgV+5n6C8QYuEDRUuaIdx00pfBCZBrMKysLAMnGwP/nj7M68shvYb5fMranswh5TelKOVcqp4qD4zU1T+qTFG+DZp4oJgEGfE61yzsfsW7gqKkROkk9n3f3gM4yFCrzrHUhHzs3jFyuSexXJxHSTX+A2EUHccGhd0BWYrHX1N7JMzct029qKuMbyLER5EiDgF3mfREw6P/7IQHeyEw86AldXuF/G7xPltFTQeinBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1KTtRdJiA81nxtqxCT1oPmwHWKMtOrd7nanf1emzji8=;
	b=LSJED/JLqdQuObejOBHUU+AUsa2uT1C7jd5ND/Ea2qyT7uDkyOeQd/EFLPN+w0GO599+CuN/lF9gJDEIkszrkQUa7XUAEHwyS7ym/3PasDMgT9monx6+b2hNW37di3Pki7o82dWRcrUGm1H5F8KxcmzIfGTbhlCQ/M7HgX29qsM=
Received: from BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM (20.179.241.20) by
	BMXPR01MB0776.INDPRD01.PROD.OUTLOOK.COM (10.174.215.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.29; Thu, 20 Feb 2020 10:58:35 +0000
Received: from BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM
	([fe80::30be:cdb:77d4:e997]) by BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM
	([fe80::30be:cdb:77d4:e997%3]) with mapi id 15.20.2729.033;
	Thu, 20 Feb 2020 10:58:35 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [meta-oe][sumo][PATCH] strongswan: avoid charon crash
Thread-Index: AQHV59yVDqc/JLwWPkey2u5fgWf2WQ==
Date: Thu, 20 Feb 2020 10:58:35 +0000
Message-ID: <BMXPR01MB322365CCA17BB28E2A8A6A5B87130@BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-originating-ip: [115.110.145.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99956694-f5da-4baa-9ec8-08d7b5f3d552
x-ms-traffictypediagnostic: BMXPR01MB0776:|BMXPR01MB0776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BMXPR01MB0776875E34B53D356C666DD087130@BMXPR01MB0776.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(189003)(199004)(54906003)(33656002)(316002)(110136005)(26005)(478600001)(6506007)(19627405001)(9686003)(71200400001)(66574012)(7696005)(2906002)(55016002)(5660300002)(52536014)(66946007)(76116006)(66446008)(64756008)(66476007)(66556008)(107886003)(81166006)(186003)(86362001)(4326008)(81156014)(8936002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB0776;
	H:BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jSEKlkSfFGW1y6T6UdQJ0Uai3kW1G3zMGRQNkXnKpIT52QLsJNHRI/CIWLBJsuvNZteNG+25o2w2i103lRlq0TQSzjHf/SilE+2A7Rv70xKblHJSEXJSTzRUTPs7es4YkaxiQol1OsUpNE2/Z1y15XbFT/ZyEu+2yAi2lk2DqTZf0U1fRbqiM6/0Nn1DVOwk6V94S0Ky36Vy2P4elcJv3KBwiAeurQiuUJrPBbNwvni/3Af6UOog+5Ec9tTUlOdDTnyZX20Q22nHzktQlYBz75DoJcX8l4VTC5DAsunjPclcX/YrJHU73eAsbHrYsbwEclgSzj+EmTRyoSn7YqPKcuhTaKnSl59/BNfrnvYuHg1Bb/n0v9RsZkWy2UTOz0KY704G41b6DLPPN5RGlL9W40f/0jpErHo3M1dCjs1LApL1m9e4YYp4XWdtLT8OICli
x-ms-exchange-antispam-messagedata: P6+l3DY6nYDirUjPH+yGeAZnSpOXof7sZWE9OGacu/p64YBtwMOXoRZGR0GnMEB27ocZONHx+XdDeUZWyNm33GOinkX2QH0qJ2z9+/imJ3aiK+1M9V3ouUhZhIaHJsp9mEJKnEceY62MeooKy7IaGw==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99956694-f5da-4baa-9ec8-08d7b5f3d552
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 10:58:35.2808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DDAuX1LxXK2WSLBLMODBXFyxUtQMaASDRR/3SWMAy7uFlXZWcDS2yk6gn48tniOSbahLaIDQ+n9PC6hafRKiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0776
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Rahul Taya <Rahul.Taya@kpit.com>,
	Aditya Tayade <Aditya.Tayade@kpit.com>,
	Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: [meta-oe][sumo][PATCH] strongswan: avoid charon crash
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
X-List-Received-Date: Thu, 20 Feb 2020 10:58:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB322365CCA17BB28E2A8A6A5B87130BMXPR01MB3223INDP_"

--_000_BMXPR01MB322365CCA17BB28E2A8A6A5B87130BMXPR01MB3223INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Anuj Chougule <Anuj.Chougule@kpit.com>

This is a possible fix to charon that crashed early due to invalid
memory access.
Important frames from Backtraces :
8  0x00007f607246e160 in memcpy (__len=3D1704, __src=3D<optimized out>, __d=
est=3D<optimized out>)
    at /usr/include/bits/string_fortified.h:34
No locals.
9  memcpy_noop (n=3D1704, src=3D<optimized out>, dst=3D<optimized out>)
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/utils/utils/memory.h:47
        n =3D 1704
        src =3D <optimized out>
        dst =3D <optimized out>
10 chunk_create_clone (ptr=3D<optimized out>, chunk=3D...)
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/utils/chunk.c:48
        clone =3D <optimized out>
11 0x00007f606ebae810 in load_from_blob (blob=3D..., type=3Dtype@entry=3DCR=
ED_PRIVATE_KEY, subtype=3Dsubtype@entry=3D1,
    subject=3Dsubject@entry=3D0x0, flags=3Dflags@entry=3DX509_NONE)
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/plugins/pem/pem_builder.c:399
        x =3D <optimized out>
        cred =3D 0x0
---Type <return> to continue, or q <return> to quit---
        pgp =3D false
12 0x00007f606ebaf0e4 in load_from_file (flags=3DX509_NONE, subject=3D0x0, =
subtype=3D1, type=3DCRED_PRIVATE_KEY,
    file=3D0x7f6069d21a20 "/var/opt/public/sps/sps_necema/data/public/IPsec=
/secureboot_on/IPsec-internal_key.pem")
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/plugins/pem/pem_builder.c:452
        cred =3D <optimized out>
        chunk =3D 0x7f6054005430
13 pem_load (type=3DCRED_PRIVATE_KEY, subtype=3D1, args=3D<optimized out>)
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/plugins/pem/pem_builder.c:498
        file =3D 0x7f6069d21a20 "/var/opt/public/sps/sps_necema/data/public=
/IPsec/secureboot_on/IPsec-internal_key.pem"
        pem =3D <optimized out>
        subject =3D 0x0
        flags =3D 0

Problem lies in frame 12 & 11.
(gdb) f 12
12 0x00007f606ebaf0e4 in load_from_file (flags=3DX509_NONE, subject=3D0x0, =
subtype=3D1, type=3DCRED_PRIVATE_KEY,
    file=3D0x7f6069d21a20 "/var/opt/public/sps/sps_necema/data/public/IPsec=
/secureboot_on/IPsec-internal_key.pem")
    at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswa=
n/plugins/pem/pem_builder.c:452
452     in /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstron=
gswan/plugins/pem/pem_builder.c
(gdb) info locals
cred =3D <optimized out>
chunk =3D 0x7f6054005430
(gdb) print *chunk
$21 =3D {ptr =3D 0x7f60728b7000 <error: Cannot access memory at address 0x7=
f60728b7000>, len =3D 1704}
(gdb) f 11
11 0x00007f606ebae810 in load_from_blob (blob=3D..., type=3Dtype@entry=3DCR=
ED_PRIVATE_KEY, subtype=3Dsubtype@entry=3D1, subject=3Dsubject@entry=3D0x0,
    flags=3Dflags@entry=3DX509_NONE) at /usr/src/debug/strongswan/5.7.2-r0/=
strongswan-5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:399
399     in /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/src/libstron=
gswan/plugins/pem/pem_builder.c
(gdb) info args
blob =3D {ptr =3D 0x7f60728b7000 <error: Cannot access memory at address 0x=
7f60728b7000>, len =3D 140052215328768}
type =3D CRED_PRIVATE_KEY
subtype =3D 1
subject =3D 0x0
flags =3D X509_NONE
(gdb) print blob
$22 =3D {ptr =3D 0x7f60728b7000 <error: Cannot access memory at address 0x7=
f60728b7000>, len =3D 140052215328768}

Source code snippet :
static void *load_from_file(char *file, credential_type_t type, int subtype=
,
                                        identification_t *subject, x509_fla=
g_t flags)
{
        void *cred;
        chunk_t *chunk;

        chunk =3D chunk_map(file, FALSE);
        if (!chunk)
        {
                DBG1(DBG_LIB, "  opening '%s' failed: %s", file, strerror(e=
rrno));
                return NULL;
        }
        cred =3D load_from_blob(*chunk, type, subtype, subject, flags);
        chunk_unmap(chunk);
        return cred;
}

Local variable chunk is an uninitialised pointer in load_from_file()
(frame 12 above) which is expected to get initialised through
chunk_map() & then passed to load_from_blob() as a parameter.
But somehow, the chunk pointer has not got initialised &
got passed as it is to load_from_blob() in frame 11 above.
As this contains a garbage address, when method load_from_blob()
tried cloning the memory regions through chunk_clone() ->
chunk_create_clone() -> memcpy() -> memcpy_noop(), it crashed with
SIGBUS (frames 10, 9, 8).
It could also be that chunk_map() has a bug which does not memmap()
the full or correct areas.

Upstream-Status: Pending
Tested By: Anuj Chougule <Anuj.Chougule@kpit.com>
Signed-off-by: Anuj Chougule <Anuj.Chougule@kpit.com>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../strongswan/files/fix-charon-crash.patch        | 23 ++++++++++++++++++=
++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-support/strongswan/files/fix-charon-crash.patch

diff --git a/recipes-support/strongswan/files/fix-charon-crash.patch b/reci=
pes-support/strongswan/files/fix-charon-crash.patch
new file mode 100644
index 0000000..95e71a2
--- /dev/null
+++ b/recipes-support/strongswan/files/fix-charon-crash.patch
@@ -0,0 +1,23 @@
+strongswan: avoid charon crash
+
+Variable chunk is an uninitialised pointer,which
+is expected to get initialised through method chunk_map()
+& then passed to load_from_blob() as a parameter.
+But somehow, if the chunk pointer did not get initialised & gets
+passed as it is to load_from_blob(), it may lead crash as this
+contains a garbage address.
+
+Signed-off-by: Anuj Chougule <Anuj.Chougule@kpit.com>
+Upstream-Status: Pending
+
+--- a/src/libstrongswan/plugins/pem/pem_builder.c
++++ b/src/libstrongswan/plugins/pem/pem_builder.c
+@@ -441,7 +441,7 @@ static void *load_from_file(char *file, credential_typ=
e_t type, int subtype,
+                                                       identification_t *s=
ubject, x509_flag_t flags)
+ {
+       void *cred;
+-      chunk_t *chunk;
++      chunk_t *chunk =3D NULL;
+
+       chunk =3D chunk_map(file, FALSE);
+       if (!chunk)
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

--_000_BMXPR01MB322365CCA17BB28E2A8A6A5B87130BMXPR01MB3223INDP_
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
<span>From: Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
</span>
<div><br>
</div>
<div>This is a possible fix to charon that crashed early due to invalid<br>
</div>
<div>memory access.<br>
</div>
<div>Important frames from Backtraces :<br>
</div>
<div>8 &nbsp;0x00007f607246e160 in memcpy (__len=3D1704, __src=3D&lt;optimi=
zed out&gt;, __dest=3D&lt;optimized out&gt;)<br>
</div>
<div>&nbsp; &nbsp; at /usr/include/bits/string_fortified.h:34<br>
</div>
<div>No locals.<br>
</div>
<div>9 &nbsp;memcpy_noop (n=3D1704, src=3D&lt;optimized out&gt;, dst=3D&lt;=
optimized out&gt;)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/utils/utils/memory.h:47<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; n =3D 1704<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; src =3D &lt;optimized out&gt;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; dst =3D &lt;optimized out&gt;<br>
</div>
<div>10 chunk_create_clone (ptr=3D&lt;optimized out&gt;, chunk=3D...)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/utils/chunk.c:48<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; clone =3D &lt;optimized out&gt;<br>
</div>
<div>11 0x00007f606ebae810 in load_from_blob (blob=3D..., type=3Dtype@entry=
=3DCRED_PRIVATE_KEY, subtype=3Dsubtype@entry=3D1,<br>
</div>
<div>&nbsp; &nbsp; subject=3Dsubject@entry=3D0x0, flags=3Dflags@entry=3DX50=
9_NONE)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/plugins/pem/pem_builder.c:399<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; x =3D &lt;optimized out&gt;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; cred =3D 0x0<br>
</div>
<div>---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; pgp =3D false<br>
</div>
<div>12 0x00007f606ebaf0e4 in load_from_file (flags=3DX509_NONE, subject=3D=
0x0, subtype=3D1, type=3DCRED_PRIVATE_KEY,<br>
</div>
<div>&nbsp; &nbsp; file=3D0x7f6069d21a20 &quot;/var/opt/public/sps/sps_nece=
ma/data/public/IPsec/secureboot_on/IPsec-internal_key.pem&quot;)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/plugins/pem/pem_builder.c:452<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; cred =3D &lt;optimized out&gt;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; chunk =3D 0x7f6054005430<br>
</div>
<div>13 pem_load (type=3DCRED_PRIVATE_KEY, subtype=3D1, args=3D&lt;optimize=
d out&gt;)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/plugins/pem/pem_builder.c:498<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; file =3D 0x7f6069d21a20 &quot;/var/opt/pub=
lic/sps/sps_necema/data/public/IPsec/secureboot_on/IPsec-internal_key.pem&q=
uot;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; pem =3D &lt;optimized out&gt;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; subject =3D 0x0<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; flags =3D 0<br>
</div>
<div><br>
</div>
<div>Problem lies in frame 12 &amp; 11.<br>
</div>
<div>(gdb) f 12<br>
</div>
<div>12 0x00007f606ebaf0e4 in load_from_file (flags=3DX509_NONE, subject=3D=
0x0, subtype=3D1, type=3DCRED_PRIVATE_KEY,<br>
</div>
<div>&nbsp; &nbsp; file=3D0x7f6069d21a20 &quot;/var/opt/public/sps/sps_nece=
ma/data/public/IPsec/secureboot_on/IPsec-internal_key.pem&quot;)<br>
</div>
<div>&nbsp; &nbsp; at /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7.2/s=
rc/libstrongswan/plugins/pem/pem_builder.c:452<br>
</div>
<div>452 &nbsp; &nbsp; in /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7=
.2/src/libstrongswan/plugins/pem/pem_builder.c<br>
</div>
<div>(gdb) info locals<br>
</div>
<div>cred =3D &lt;optimized out&gt;<br>
</div>
<div>chunk =3D 0x7f6054005430<br>
</div>
<div>(gdb) print *chunk<br>
</div>
<div>$21 =3D {ptr =3D 0x7f60728b7000 &lt;error: Cannot access memory at add=
ress 0x7f60728b7000&gt;, len =3D 1704}<br>
</div>
<div>(gdb) f 11<br>
</div>
<div>11 0x00007f606ebae810 in load_from_blob (blob=3D..., type=3Dtype@entry=
=3DCRED_PRIVATE_KEY, subtype=3Dsubtype@entry=3D1, subject=3Dsubject@entry=
=3D0x0,<br>
</div>
<div>&nbsp; &nbsp; flags=3Dflags@entry=3DX509_NONE) at /usr/src/debug/stron=
gswan/5.7.2-r0/strongswan-5.7.2/src/libstrongswan/plugins/pem/pem_builder.c=
:399<br>
</div>
<div>399 &nbsp; &nbsp; in /usr/src/debug/strongswan/5.7.2-r0/strongswan-5.7=
.2/src/libstrongswan/plugins/pem/pem_builder.c<br>
</div>
<div>(gdb) info args<br>
</div>
<div>blob =3D {ptr =3D 0x7f60728b7000 &lt;error: Cannot access memory at ad=
dress 0x7f60728b7000&gt;, len =3D 140052215328768}<br>
</div>
<div>type =3D CRED_PRIVATE_KEY<br>
</div>
<div>subtype =3D 1<br>
</div>
<div>subject =3D 0x0<br>
</div>
<div>flags =3D X509_NONE<br>
</div>
<div>(gdb) print blob<br>
</div>
<div>$22 =3D {ptr =3D 0x7f60728b7000 &lt;error: Cannot access memory at add=
ress 0x7f60728b7000&gt;, len =3D 140052215328768}<br>
</div>
<div><br>
</div>
<div>Source code snippet :<br>
</div>
<div>static void *load_from_file(char *file, credential_type_t type, int su=
btype,<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ident=
ification_t *subject, x509_flag_t flags)<br>
</div>
<div>{<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; void *cred;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; chunk_t *chunk;<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; chunk =3D chunk_map(file, FALSE);<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (!chunk)<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DBG1(DBG_LIB, =
&quot; &nbsp;opening '%s' failed: %s&quot;, file, strerror(errno));<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return NULL;<b=
r>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; cred =3D load_from_blob(*chunk, type, subt=
ype, subject, flags);<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; chunk_unmap(chunk);<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return cred;<br>
</div>
<div>}<br>
</div>
<div><br>
</div>
<div>Local variable chunk is an uninitialised pointer in load_from_file()<b=
r>
</div>
<div>(frame 12 above) which is expected to get initialised through<br>
</div>
<div>chunk_map() &amp; then passed to load_from_blob() as a parameter.<br>
</div>
<div>But somehow, the chunk pointer has not got initialised &amp;<br>
</div>
<div>got passed as it is to load_from_blob() in frame 11 above.<br>
</div>
<div>As this contains a garbage address, when method load_from_blob()<br>
</div>
<div>tried cloning the memory regions through chunk_clone() -&gt;<br>
</div>
<div>chunk_create_clone() -&gt; memcpy() -&gt; memcpy_noop(), it crashed wi=
th<br>
</div>
<div>SIGBUS (frames 10, 9, 8).<br>
</div>
<div>It could also be that chunk_map() has a bug which does not memmap()<br=
>
</div>
<div>the full or correct areas.<br>
</div>
<div><br>
</div>
<div>Upstream-Status: Pending<br>
</div>
<div>Tested By: Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
</div>
<div>Signed-off-by: Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
</div>
<div>Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
</div>
<div>---<br>
</div>
<div>&nbsp;.../strongswan/files/fix-charon-crash.patch &nbsp; &nbsp; &nbsp;=
 &nbsp;| 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
</div>
<div>&nbsp;1 file changed, 23 insertions(&#43;)<br>
</div>
<div>&nbsp;create mode 100644 recipes-support/strongswan/files/fix-charon-c=
rash.patch<br>
</div>
<div><br>
</div>
<div>diff --git a/recipes-support/strongswan/files/fix-charon-crash.patch b=
/recipes-support/strongswan/files/fix-charon-crash.patch<br>
</div>
<div>new file mode 100644<br>
</div>
<div>index 0000000..95e71a2<br>
</div>
<div>--- /dev/null<br>
</div>
<div>&#43;&#43;&#43; b/recipes-support/strongswan/files/fix-charon-crash.pa=
tch<br>
</div>
<div>@@ -0,0 &#43;1,23 @@<br>
</div>
<div>&#43;strongswan: avoid charon crash<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;Variable chunk is an uninitialised pointer,which<br>
</div>
<div>&#43;is expected to get initialised through method chunk_map()<br>
</div>
<div>&#43;&amp; then passed to load_from_blob() as a parameter.<br>
</div>
<div>&#43;But somehow, if the chunk pointer did not get initialised &amp; g=
ets<br>
</div>
<div>&#43;passed as it is to load_from_blob(), it may lead crash as this<br=
>
</div>
<div>&#43;contains a garbage address.<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;Signed-off-by: Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
</div>
<div>&#43;Upstream-Status: Pending<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;--- a/src/libstrongswan/plugins/pem/pem_builder.c<br>
</div>
<div>&#43;&#43;&#43;&#43; b/src/libstrongswan/plugins/pem/pem_builder.c<br>
</div>
<div>&#43;@@ -441,7 &#43;441,7 @@ static void *load_from_file(char *file, c=
redential_type_t type, int subtype,<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; identification_t *subject=
, x509_flag_t flags)<br>
</div>
<div>&#43; {<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; void *cred;<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp;chunk_t *chunk;<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp;chunk_t *chunk =3D NULL;<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; chunk =3D chunk_map(file, FALSE);<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; if (!chunk)<br>
</div>
<div>--<br>
</div>
<div>2.7.4<br>
</div>
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

--_000_BMXPR01MB322365CCA17BB28E2A8A6A5B87130BMXPR01MB3223INDP_--
