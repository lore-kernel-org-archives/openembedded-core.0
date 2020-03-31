Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.75])
 by mx.groups.io with SMTP id smtpd.web11.4649.1585642169493157422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 01:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z4q/nBux;
 spf=pass (domain: windriver.com, ip: 40.107.220.75, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmdX95zjzXm46leojZBo54jppIZj+kqVwdTExuelR1fEy6E9zLGQ+frFs1E64f2Fhkw0Ctx79skFIrHkKrvzngX/oFGxSBfB+oMDWdbDINV20MFmoSy+e5CoS4RxbnQEkXvHhwYP7QB0UHJ0pf+KZlqdNs74Upclt+fSl+cVFXUj39LBVVkUNHuAjjh/99lLmjYh+eeQxn3/cObD2viQVLP1ZY639tDPoXfRZSkf4mfrV4/dNgO7W7lJ+VCz+d/gAQby2QW/ITo/VTym7Lb/mTf8iDrrzmfGuy5YOUTGIaGjmnzp/cJygBIafBKTt99up714+kO9qHMA3tHSzf8v6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJU/XbeYAZqGVnLLC4JwJArSX/xstFYH+YMcC9cSn9Y=;
 b=aTWT7bxmQcJDIOIhp4IvEA8SiMxIIaNelN37i0IX0NDAVLJy1ObucLTVjLhViy6ASetr9GXl7m25evlT9uJQQmieajbndhfjareOOP2j8arEdUQ9CZ7BnMZYzCtOQ+inkFz+cFQ0EKTCTvWJNFv+Zx6TSgoKXJmXzsltMc8A3LY7CCyHSmc3xHv5aezTcLaCLHfQfY4uSEHUySpJKoYZetJFWJOf4JfiTa3SXEf/6XUFg26ySPYLY4mawQnNuN8iDdNiq4Ur1fQD75k0AuLcBrMgwj157O+mo0Pd9pNMGhmO8GxjZAWvQ/6x84lJZb13OJlv8g+2y9QqiitPVeN4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJU/XbeYAZqGVnLLC4JwJArSX/xstFYH+YMcC9cSn9Y=;
 b=Z4q/nBux3tpHdsbN+IiP7sTo6WRpYShxxRYTfEiASeCppPbyOdawaEx+gqw7fEo16lC7yn1TSz1Tie9WRZgYBvz5i6/cBUz7mqAR1igz2C5LPUIteSe9p4eKRVHyGZzNurhSqzR5bpVcI8w2Pq2cvduJsvJro/cNFp8okn/Amhc=
Received: from DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24)
 by DM6PR11MB4475.namprd11.prod.outlook.com (2603:10b6:5:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 08:09:27 +0000
Received: from DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22]) by DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:09:27 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
Thread-Topic: [OE-core] [PATCH] netbase: use git fetcher
Thread-Index: AQHV+3SzML6UFHNE/UmXYBZPqj4N1qhicGmb
Date: Tue, 31 Mar 2020 08:09:27 +0000
Message-ID: 
 <DM6PR11MB3817014DAF407990BD362E19F1C80@DM6PR11MB3817.namprd11.prod.outlook.com>
References: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Mingli.Yu@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2477d6e1-3776-46ed-1d7c-08d7d54ad513
x-ms-traffictypediagnostic: DM6PR11MB4475:
x-microsoft-antispam-prvs: 
 <DM6PR11MB44757E21B160B617C7BDDB03F1C80@DM6PR11MB4475.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3817.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(376002)(346002)(396003)(136003)(39850400004)(81166006)(81156014)(71200400001)(26005)(2906002)(33656002)(186003)(9686003)(66946007)(66446008)(316002)(86362001)(52536014)(966005)(66556008)(64756008)(66476007)(8676002)(6506007)(8936002)(5660300002)(478600001)(7696005)(91956017)(55016002)(76116006)(19627405001)(6916009);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1hxWh4tIjdGwI6hK8ILPH4mPma8Z5ReLYarj6GJyb/HIfH2R0Kz/8Y8kv87RkGWZOZZfe1CWM2A4DrvJ06mkChyIqBFSF0bV81BC8iFTiu2HOHW5whmyMDW+1nULP6EDH9bAAb96f5pJ0P3cPW9c2Aps1TGknEOxLswth7dh65ctQ1bNSzCNv/oob3kS0UrhQC2Ujvl6n9PmJSH9cHyNzDKe0Gh8loYPPQ9cg0ZBT9js4zWGy3mLG6gfoxpst/wpDxVCsVWWYUZ+bZQeyapdtKQgrBEf+IET+gRCTMNzEF0X0P13I/V1mfBmyQV831FaUc5VvEHro47DDoAh5ZtSObUWA560xv2HgQ5H26C4NfRVTkZjMpN0tVruOmH3haicEQWvFf5azCI4E3J7svFWSIW2EijQu2AXv4lCDhDVNQQeK1JvhL6Vtg8+64iSeAccOIi4JepzCMi5pvTlT2okQBwNYPbQccBUdhcUCstRbsy2gFiiadzUJgF/9f/ZLz6nL9bXy14UjVQzXWlr9hBkNQ==
x-ms-exchange-antispam-messagedata: 
 29Dg9xfpeb2fZBHn6OBja5Z8GcYnq/JdRCO2cNsfHe6tNogIsABiCauCwbR9J1lmd4RGHna7r31FlA5TAuTiX8nh8X6ulgUJ+GnodK//J7ciGv5C1wnozsSllFcXtw5sIU2vNZCF4rpdevbiwQvcjQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2477d6e1-3776-46ed-1d7c-08d7d54ad513
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 08:09:27.4331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/9aCgsiv/Cgt8iARCEKVHrnM+P4NwHNWI2hklRkjFApF6jfgndWGb+U+YFY8GTeYFdSoQo0/vO5ueiBtBDrkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4475
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3817014DAF407990BD362E19F1C80DM6PR11MB3817namp_"

--_000_DM6PR11MB3817014DAF407990BD362E19F1C80DM6PR11MB3817namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ping.

Thanks,
Mingli
________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of mingli.yu@windriver.com <mingli=
.yu@windriver.com>
Sent: Monday, March 16, 2020 17:24
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [PATCH] netbase: use git fetcher

From: Mingli Yu <mingli.yu@windriver.com>

Use git repo as the the previous URL only stores
the latest source file and fails to locate the
source tar file if we don't upgrade timely.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/n=
etbase/netbase_6.1.bb
index bc0049c..c13685e 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -6,10 +6,10 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee7687=
da3d8748ab"
 PE =3D "1"

-SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI =3D "git://salsa.debian.org/md/netbase.git;protocol=3Dhttps"
+SRCREV =3D "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"

-SRC_URI[md5sum] =3D "e5871a3a5c8390557b8033cf19316a55"
-SRC_URI[sha256sum] =3D "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb8=
23c903e9b035d8"
+S =3D "${WORKDIR}/git"

 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_000_DM6PR11MB3817014DAF407990BD362E19F1C80DM6PR11MB3817namp_
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
Ping.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mingli<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openembedded-core-b=
ounces@lists.openembedded.org &lt;openembedded-core-bounces@lists.openembed=
ded.org&gt; on behalf of mingli.yu@windriver.com &lt;mingli.yu@windriver.co=
m&gt;<br>
<b>Sent:</b> Monday, March 16, 2020 17:24<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] netbase: use git fetcher</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br=
>
<br>
Use git repo as the the previous URL only stores<br>
the latest source file and fails to locate the<br>
source tar file if we don't upgrade timely.<br>
<br>
Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
---<br>
&nbsp;meta/recipes-core/netbase/netbase_6.1.bb | 6 &#43;&#43;&#43;---<br>
&nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/n=
etbase/netbase_6.1.bb<br>
index bc0049c..c13685e 100644<br>
--- a/meta/recipes-core/netbase/netbase_6.1.bb<br>
&#43;&#43;&#43; b/meta/recipes-core/netbase/netbase_6.1.bb<br>
@@ -6,10 &#43;6,10 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://debian/copyright;md5=3D3=
dd6192d306f582dee7687da3d8748ab">file://debian/copyright;md5=3D3dd6192d306f=
582dee7687da3d8748ab</a>&quot;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz&quot;=
<br>
&#43;SRC_URI =3D &quot;git://salsa.debian.org/md/netbase.git;protocol=3Dhtt=
ps&quot;<br>
&#43;SRCREV =3D &quot;0fc1e4ce39328f7388badace0aaf7b7294d5ed61&quot;<br>
&nbsp;<br>
-SRC_URI[md5sum] =3D &quot;e5871a3a5c8390557b8033cf19316a55&quot;<br>
-SRC_URI[sha256sum] =3D &quot;084d743bd84d4d9380bac4c71c51e57406dce44f5a692=
89bb823c903e9b035d8&quot;<br>
&#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/n/netbase/&quot;<b=
r>
&nbsp;do_install () {<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR11MB3817014DAF407990BD362E19F1C80DM6PR11MB3817namp_--
