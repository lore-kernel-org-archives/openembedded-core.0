Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 115428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Mar 2019 18:54:45 UTC
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390054.outbound.protection.outlook.com [40.107.139.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7607C866
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aczkLn8S1JoVxn2s/tO9hq0fDlJ7y3b9fsIgi0mseVY=;
	b=J9MwtK4f/6WobjoRzMiwCdLXlByn2cId3vfapV8XUX2jRV1BcKceqlZ21nWMR5jz/rplMlRUPQSMabFpZTEyR3zHCiqRGfYG66I4pN0Pbu+d7s7Xza43guUsBFk6QaICQk1xrFIJo+dE6a41u38R4AjORtTYqHHRUWIp/BCyl80=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB0919.INDPRD01.PROD.OUTLOOK.COM (10.174.217.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.15; Mon, 4 Mar 2019 18:21:16 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6]) by BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6%6]) with mapi id 15.20.1665.019;
	Mon, 4 Mar 2019 18:21:16 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [poky][meta][sumo][PATCH] lighttpd: added ptest
Thread-Index: AQHU0rcNLBsHqaED8kO+dXlHzZZT6A==
Date: Mon, 4 Mar 2019 18:21:15 +0000
Message-ID: <1551723659-4522-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0025.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:c::11) To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [43.241.126.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6007c5f5-0ec8-4fa4-bd15-08d6a0ce3035
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BMXPR01MB0919; 
x-ms-traffictypediagnostic: BMXPR01MB0919:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; BMXPR01MB0919;
	23:hCynbtEXVh51uCY/Oz1GW3x5kOk9mq+EvZlfx4q?=
	=?iso-8859-1?Q?lhfyEMLCrMf3eA38KD0IT+zClw0NIwOh0UBSuTCCq/UuoZsIghNLYCVOCJ?=
	=?iso-8859-1?Q?5P9wLCWmEk7fsy9kyZDyej2QyJpxVagcDctgCpHI3McM3P/3tPaMFaKRQE?=
	=?iso-8859-1?Q?7GZ6OrK5xu8gsYmyfCTFY+UqUeFUWjqJuJVivntJRiiymlS7nlGvdr16zP?=
	=?iso-8859-1?Q?7Pxdqe75I151yH2mW1PuSJLp9kzlKq7aKiE1NxI3UstkgTGXxFjOmKwVKq?=
	=?iso-8859-1?Q?+UuKz1bN3Y8A9jtQmrQFu11ESSYK1/Np754cM0R7TIcvAm+tNG8zjI1yES?=
	=?iso-8859-1?Q?S4HwqjJ+LpMe3bSOb4zD1sAnlWF5PMyVVA8vTWnFxwEUojb4nsTdocBGI7?=
	=?iso-8859-1?Q?V0aDqMXTaGcxzal7QE12hKD9OP0RSRrFaCVyjrKMUGBlA0/J31N8slvMhA?=
	=?iso-8859-1?Q?aehLLU6NsV/5/usVMrZQuyYPaQow9d27/TSai1Y2wNDW2prbpPKIKE1iWe?=
	=?iso-8859-1?Q?UlxNSFOTBEBJn7iscuvJUswErJUA9c4pqr+7m1pCu/pMXMWQFnIvSWmNez?=
	=?iso-8859-1?Q?uHl9J8dbDvmGcN92RRNuQLgusTTKk1uT9DC+GD2/bI9BPTVe3KHkRTa6eP?=
	=?iso-8859-1?Q?Ky39lx+5s7jOblYWxV74aFpkjQ4qv6yLJA9FszsuXCMb4vWgiE/LSN3XXg?=
	=?iso-8859-1?Q?RFb7iTwgFyQIIYYvmOtk60q7vaMzo2Ugq5IPJALqESQsllRMDma4tfea9Q?=
	=?iso-8859-1?Q?nVJ6SKMYBK1VUY4dRE7VRRTIpYZWjF8oEhrh3aNhUSHXVtcxyv95gggJV6?=
	=?iso-8859-1?Q?L5ffTV88ZSZqyFlIUOxUFSlgul5jpVvP//Jb7ADBZGsJbcWFgyewq2Sb94?=
	=?iso-8859-1?Q?aGK+YCK8pEQhIYzT0CLf0wUmwD8EhiXxNI6lrW2AWGL5zgFw4ALoy92wLj?=
	=?iso-8859-1?Q?ALCI5DdZPdfpSsXvS4rix08n1AGiCsktOrr/eE5FXsetMjdpH/vS2oNipC?=
	=?iso-8859-1?Q?e7+JuAbKmBmW/B4s3HcgKNX7I5Pv9ix0mhdm6XeotVHJnctDF3rOXw8VBc?=
	=?iso-8859-1?Q?ibwINwJVd4wWwk9PoZ8nhb3i1K89Q4wvVjJdUPdfyC5aR/PSILPn/Rg9ic?=
	=?iso-8859-1?Q?Cq3Hpfj5p4Em1kLMmdPxLVuPov95rBjojTNJYH0UBv5PjIBlXMXmCJ/3Ov?=
	=?iso-8859-1?Q?xm/BvK7BmrIrVUSUYsEUME+dqnWPhIM1QBpcCAbWXFkrNYN3u/J5MhZGcF?=
	=?iso-8859-1?Q?eVWCg6JFSZbst3vu+UYdAHZamfh+gcY2CUprIBaH+nuWzizUMhndgxLDqu?=
	=?iso-8859-1?Q?NcryV+EznON8AvTL2JSPZmd?=
x-microsoft-antispam-prvs: <BMXPR01MB0919B177880D061CF3AA0BA891710@BMXPR01MB0919.INDPRD01.PROD.OUTLOOK.COM>
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(136003)(366004)(396003)(376002)(189003)(199004)(6486002)(478600001)(7736002)(25786009)(6916009)(386003)(4326008)(2616005)(6116002)(6506007)(99286004)(486006)(97736004)(53936002)(6512007)(6436002)(2501003)(476003)(71190400001)(71200400001)(3846002)(72206003)(6306002)(102836004)(5640700003)(81156014)(81166006)(186003)(50226002)(26005)(107886003)(5660300002)(8676002)(66574012)(52116002)(66066001)(68736007)(2906002)(2351001)(86362001)(105586002)(305945005)(316002)(14454004)(14444005)(106356001)(8936002)(256004)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB0919;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bi19JN7+H+vTSE+7B4yvCh3YyjZBCMnQ9nx8IYRUIuVpdsPDyBrX9pIz0VpACfLSv3+ut6gcwvlLtfyVPmHvOA5GwW1wmSTIPQkfGUbhX1s+bH5P9WBHdlyyxFKDZIKrxhNlST2HhB+bvuTs3X81vzqRLUR0IDUOq1O9W9rJ57temvWmNZHIifQ/H1jHEmlyQtL51WFC7FNSaRbtXfCOaj73K9nyUTqeGWitwjqMDogYooA7+wNkupVJkfXoDtI2PvJ9D9X+sXuvIroc7yuGvfxn9wSHuAnAcoJySqgeT/xaXuTJqh1VLJ8xZBA650vMHN8+R8X+un65DdkLzuVzSsoMMFYZyqND4LEEWYla7PlWfx4M3Rf6KEwKibZhHzpEy+TgcBkAtbsGnsvxS+or5rkai1mVb/fp0SJz6OvFyiM=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6007c5f5-0ec8-4fa4-bd15-08d6a0ce3035
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2019 18:21:15.6693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0919
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [poky][meta][sumo][PATCH] lighttpd: added ptest
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
X-List-Received-Date: Mon, 04 Mar 2019 18:54:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reused lighttpd internal tests and did minimal patching to fix paths.

Upstream-Status: Pending

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
 ...-use-standard-sbin-and-lib-path-for-ptest.patch | 37 ++++++++++++
 meta/recipes-extended/lighttpd/lighttpd/run-ptest  |  4 ++
 meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb  | 66 ++++++++++++++++++=
+++-
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0002-use-standa=
rd-sbin-and-lib-path-for-ptest.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/run-ptest

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0002-use-standard-sbin=
-and-lib-path-for-ptest.patch b/meta/recipes-extended/lighttpd/lighttpd/000=
2-use-standard-sbin-and-lib-path-for-ptest.patch
new file mode 100644
index 0000000..cd4b2b3
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0002-use-standard-sbin-and-li=
b-path-for-ptest.patch
@@ -0,0 +1,37 @@
+lighttpd-ptest: use standard installation path
+
+ptest should do testing against installed library or executable
+at standard installation path, hence using standard installation
+path for MODULES_PATH and LIGHTTPD_PATH variables.
+
+Upsteam-Status: Pending
+
+Signed-off-by: Aditya Tayade <aditya.tayade@kpit.com>
+
+diff --git a/tests/LightyTest.pm b/tests/LightyTest.pm
+index 74caea1..2de02d0 100644
+--- a/tests/LightyTest.pm
++++ b/tests/LightyTest.pm
+@@ -65,19 +65,10 @@ sub new {
+ $lpath =3D (defined $ENV{'srcdir'} ? $ENV{'srcdir'} : '.');
+ $self->{SRCDIR} =3D abs_path($lpath);
+
++$self->{SBINDIR} =3D '/usr/sbin';
++$self->{MODULES_PATH} =3D '/usr/lib';
+
+-if (mtime($self->{BASEDIR}.'/src/lighttpd') > mtime($self->{BASEDIR}.'/bu=
ild/lighttpd')) {
+-$self->{BINDIR} =3D $self->{BASEDIR}.'/src';
+-if (mtime($self->{BASEDIR}.'/src/.libs')) {
+-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/src/.libs';
+-} else {
+-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/src';
+-}
+-} else {
+-$self->{BINDIR} =3D $self->{BASEDIR}.'/build';
+-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/build';
+-}
+-$self->{LIGHTTPD_PATH} =3D $self->{BINDIR}.'/lighttpd';
++$self->{LIGHTTPD_PATH} =3D $self->{SBINDIR}.'/lighttpd';
+ $self->{PORT} =3D 2048;
+
+ my ($name, $aliases, $addrtype, $net) =3D gethostbyaddr(inet_aton("127.0.=
0.1"), AF_INET);
diff --git a/meta/recipes-extended/lighttpd/lighttpd/run-ptest b/meta/recip=
es-extended/lighttpd/lighttpd/run-ptest
new file mode 100644
index 0000000..b6781c0
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/bash
+
+make -C tests -k check-TESTS
+make -C src -k runtest-TESTS
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.48.bb
index 3c4444c..6a9677e 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
@@ -9,6 +9,42 @@ SECTION =3D "net"
 RDEPENDS_${PN} =3D "lighttpd-module-dirlisting \
                   lighttpd-module-indexfile \
                   lighttpd-module-staticfile"
+
+RDEPENDS_${PN}-ptest +=3D "bash \
+                         ${PN} \
+                         ${PN}-module-compress \
+                         ${PN}-module-simple-vhost \
+                         ${PN}-module-rewrite \
+                         ${PN}-module-cgi \
+                         ${PN}-module-evhost \
+                         ${PN}-module-redirect \
+                         ${PN}-module-fastcgi \
+                         ${PN}-module-setenv \
+                         ${PN}-module-extforward \
+                         ${PN}-module-secdownload \
+                         ${PN}-module-auth \
+                         ${PN}-module-authn-file \
+                         ${PN}-module-status \
+                         ${PN}-module-expire \
+                         ${PN}-module-userdir \
+                         ${PN}-module-ssi \
+                         ${PN}-module-proxy \
+                         perl-module-tap-base \
+                         perl-module-tap-parser-sourcehandler-executable \
+                         perl-module-tap-formatter-file \
+                         perl-module-tap-formatter-file-session \
+                         perl-module-tap-formatter-base \
+                         perl-module-tap-formatter-session \
+                         perl-module-tap-formatter-console-session \
+                         perl-module-tap-parser-scheduler \
+                         perl-module-tap-parser \
+                         perl-module-io-socket \
+                         perl-module-test-more \
+                         perl-module-test-harness \
+                         perl-module-tap-object \
+                         perl-module-tap-formatter-console \
+                        "
+
 RRECOMMENDS_${PN} =3D "lighttpd-module-access \
                      lighttpd-module-accesslog"

@@ -18,6 +54,8 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releas=
es-1.4.x/lighttpd-${PV}.t
         file://lighttpd \
         file://lighttpd.service \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.p=
atch \
+        file://run-ptest \
+        file://0002-use-standard-sbin-and-lib-path-for-ptest.patch \
         "

 SRC_URI[md5sum] =3D "1e3a9eb5078f481e3a8a1d0aaac8c3c8"
@@ -49,7 +87,7 @@ PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua5.1"

 EXTRA_OECONF +=3D "--enable-lfs"

-inherit autotools pkgconfig update-rc.d gettext systemd
+inherit autotools pkgconfig update-rc.d gettext systemd ptest

 INITSCRIPT_NAME =3D "lighttpd"
 INITSCRIPT_PARAMS =3D "defaults 70"
@@ -73,6 +111,32 @@ do_install_append() {
 ln -sf ${localstatedir}/tmp ${D}/www/var
 }

+do_install_ptest() {
+    t=3D"${D}${PTEST_PATH}"
+    for i in tests src
+    do
+        cp -r "${S}/${i}" "${t}"
+        cp -r "${B}/${i}"/* "${t}/${i}"
+        rm -rf "${t}/${i}"/*.lo "${t}/${i}"/*.la "${t}/${i}"/*.c "${t}/${i=
}"/*.o "${t}/${i}"/*.h
+    done
+
+    install -D "${B}/${TARGET_PREFIX}libtool" "${t}/${TARGET_PREFIX}libtoo=
l"
+
+    # Remove build host references...
+    find "${t}" -name "Makefile" | xargs \
+    sed -i -e "s/^srcdir =3D \(.*\)/srcdir =3D ./" \
+           -e "s/^Makefile/_Makefile/" \
+           -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
+           -e "s/^abs_builddir =3D \(.*\)/abs_builddir =3D ./" \
+           -e "s/^abs_srcdir =3D \(.*\)/abs_srcdir =3D ./" \
+           -e "s/^top_srcdir =3D \(.*\)/abs_srcdir =3D ../" \
+           -e "s,${TARGET_PREFIX}gcc,gcc,g" \
+           -e "s/^abs_top_srcdir =3D \(.*\)/abs_top_srcdir =3D ./" \
+           -e "s,${S},,g" \
+           -e "s,${B},,g" \
+           -e "s,${STAGING_DIR_NATIVE},,g"
+}
+
 FILES_${PN} +=3D "${sysconfdir} /www"

 CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"
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

