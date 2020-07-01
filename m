Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web10.146.1593618615266530497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 08:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=k0DgmjFL;
 spf=pass (domain: siemens.com, ip: 40.107.7.50, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTybduuS02RLAYb6FCNpWdosWWs4DGRN6LwvJ1srn7AQ5+/lpp5/dMHwTM423EKRztkAw8HzmjPhfZ7UcAhtMLgNfRoBuIoW5ySQIoRpBbXRYXp/Pi+6uzKM3lIF2Tzynimvd78azpu5IcMn+MUDTZNbyH7dwdh6vlPLGSmysQleknoBRTK+TdI6DsO77XwWtRxFoHUh/W1SgaC4xcEpX0eGZddf5brTlP8p5lgo9PVnynxU/BthwpzVCBV6amLvmqbTR2nQBNkalCWY8w6tKDS8p/QKdTgBDN+xkR6KM7f3MtY4m32wc+HAFAsA9uvhtupuUY3OAEIeX2gSiCFiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzgGUa+zr8vZTjO/CnjBjySLWrf3d5MUn97aILiLwqg=;
 b=GxqHkhx3vKEUAZoyMBV15PP0CvnnXsTuVOMeVgX0GiN3QHbLuy4P1wp6OTMEQevwUdQQLO0+/KSIrfPvum/fqZzieUKmZUeV8C/7y5zkDTF8Vr7TViA30hLoc9ZDp0rY2JYhHIkIFU6gktidabQeX4ZW6VaeiQu5Xm5GZdJIMhx3gm1JkKzrLfKPecWp3lMxkVN1a8e23hT/jXvDWqiX7ENh+KpZfdBMRSn7mi/MwUg3VGGb0thIYDjzvqlQeiuBx0OgfedoEsLfCEUwrZZ7+TwWJMl4eI58ybSU9sUyMzTF5rCiyISIN3XJ872gB7udUY6I/d8JcMgFdw5T2r1/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzgGUa+zr8vZTjO/CnjBjySLWrf3d5MUn97aILiLwqg=;
 b=k0DgmjFLmu8rkDrXHzeFQDdLtOQ2asvXM1dOftNp9x/3oONl/Xso2/GZNgs96zGVSn4KF5sIHDwjtxnRkDTcUr7OEGgygUw5a/y5XxyvFso61sKxdr3poV0n03qXoHF9vDwnU4P1I6VJM+VZfd9fh/knOLzsMKluY0Z1KaWOfpM=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB2745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 15:50:12 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2da7:ce5f:277:bf9c]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2da7:ce5f:277:bf9c%9]) with mapi id 15.20.3153.023; Wed, 1 Jul 2020
 15:50:12 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: upgrade 1.31.1 -> 1.32.0
Thread-Topic: [OE-core] [PATCH] busybox: upgrade 1.31.1 -> 1.32.0
Thread-Index: AQHWT3c0FDk7xVqYlkSB4oDw0T3mlKjy3vYQ
Date: Wed, 1 Jul 2020 15:50:12 +0000
Message-ID: 
 <DB8PR10MB397713E1586AFD370CB8ED97926C0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 33f4aa72-72e8-4f48-bfd0-08d81dd670e6
x-ms-traffictypediagnostic: DB8PR10MB2745:
x-microsoft-antispam-prvs: 
 <DB8PR10MB2745B793873E47E1F521A547926C0@DB8PR10MB2745.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OCjEVB5yn+FpN/Poz0ERpiHUkdJ1xV2yL2Uw34e7BV1fzBxAOh5Xevrv+jiZ61uwCqW9A7/l5pENtO+CWF0A/3V1TJVzvJ25Q+xYKwThsyLsAJDm7NoN83eLCT/fTOt6WHgkjsbZT6SDgNpDdewrV1KMgZqc9H4XhxrMTCQbNgNBJGeLctDWL6/+RoU4gKMlv+/9lzSw8KX2HiXUmcY7iJQdka+SPavt91DfVCGoOvbcJCzRHnMAcDV8me5pv7ePbtdj7g9xxQuN+UDhLK57dFbDjkt9405wH6iuR19zl/JltCtc4aTqpr2I4ja5krmCC1SWSmfGv23n39GTZv9txywcte1DlgUAHDryGLlU12u1PCyYH1tOz+zTGEH+85K3mUOFDZ8u1Qee5bUy/j+gOw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(83080400001)(8936002)(478600001)(8676002)(316002)(86362001)(53546011)(55236004)(7696005)(110136005)(45080400002)(6506007)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(83380400001)(2906002)(30864003)(9686003)(186003)(33656002)(26005)(55016002)(52536014)(71200400001)(76116006)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 B49LqKiBYMQUo3vlXV41cLa4hb3p3fclvvGACnyK+K4jYFlG9DVyi5vmJcQUtdkE14PMYLwtTVOnXKPbvXssu86vxQskX3JS2R0j4oABiiKz3a8cjkrP4/wrNwJPQEGGcbLDhobonfNcZdEit1/MasjYUocSUW7LIngxS8pHg2QCkwv+lNC78J9Po0M4dn479gpM//wpopnokdfFYmwoSVAmIw5g8P6ELfT0ORD+ooNOKdBsV4hkRX6PWxLszao7c/hxmfzU2M4beYtxGumNaOyUcgqSm0G3K+dv6WhC4m3veLU9dMYd3uifr2AYmuWlKDhg7flqbZl2KAtjhlLIPtCo6I/SKz4Fyyo60QSewLD8UtjZOLDoB2I9tGbzH2RPoGwFRGOAXg30CvnybYia2PjyQUtthZGwNydPa6WARYaTluz21Mb4kfDyEaH5giHkHGOQ40/fWNQfl3Xf5StTcxgVqRM24gBwpxWLmOSswwYHUlxLyp/0QiEOfNef1gs/
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f4aa72-72e8-4f48-bfd0-08d81dd670e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 15:50:12.5868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymVBhqKJ1gMO+gGhq5w2Un732l0hJjOGAc8yVaYGp2ukPmRR8SvHA+D2x5hYlOkvG2Q0xhZCjoQMbA8t0eLKqZWMCA5mt8xwbAXGS0IAlAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB2745
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Wang,

Sorry, but why did you change tabs->spaces in  the indent level in " busybo=
x-udhcpc-no_deconfig.patch"? No it's completely unreadable.

Andrej

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Wang Mingyu
Sent: Wednesday, July 1, 2020 9:02 AM
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] busybox: upgrade 1.31.1 -> 1.32.0

refresh patch:busybox-udhcpc-no_deconfig.patch

0001-Remove-stime-function-calls.patch
0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
0001-time-Use-64-prefix-syscall-if-we-have-to.patch
0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
removed since they are included in 1.32.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-Remove-stime-function-calls.patch    |  85 -------------
 ...rappers-around-clock_gettime-closes-.patch | 120 ------------------  ..=
.-Use-64-prefix-syscall-if-we-have-to.patch |  43 -------  ...-Use-64-prefi=
x-syscall-if-we-have-to.patch |  46 -------  .../busybox/busybox-udhcpc-no_=
deconfig.patch  |  75 +++++------
 .../{busybox_1.31.1.bb =3D> busybox_1.32.0.bb}  |   9 +-
 6 files changed, 41 insertions(+), 337 deletions(-)  delete mode 100644 me=
ta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-w=
rappers-around-clock_gettime-closes-.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-pref=
ix-syscall-if-we-have-to.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0003-runsv-Use-64-pre=
fix-syscall-if-we-have-to.patch
 rename meta/recipes-core/busybox/{busybox_1.31.1.bb =3D> busybox_1.32.0.bb=
} (79%)

diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-c=
alls.patch b/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-c=
alls.patch
deleted file mode 100644
index 9b9432844c..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.pa=
tch
+++ /dev/null
@@ -1,85 +0,0 @@
-From d3539be8f27b8cbfdfee460fe08299158f08bcd9 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Nov 2019 13:06:40 +0100
-Subject: [PATCH] Remove stime() function calls
-
-stime() has been deprecated in glibc 2.31 and replaced with -clock_settime=
(). Let's replace the stime() function calls with
-clock_settime() in preperation.
-
-function                                             old     new   delta
-rdate_main                                           197     224     +27
-clock_settime                                          -      27     +27
-date_main                                            926     941     +15
-stime                                                 37       -     -37
---------------------------------------------------------------------------=
----
-(add/remove: 2/2 grow/shrink: 2/0 up/down: 69/-37)             Total: 32 b=
ytes
-
-Upstream-Status: Backport [https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.busybox.net%2Fbusybox%2Fcommit%2F%3Fid%3Dd3539be8f=
27b8cbfdfee460fe08299158f08bcd9&amp;data=3D02%7C01%7Candrej.valek%40siemens=
.com%7C6bcbe021a12a49fb883f08d81d8e55f8%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C637291844451070373&amp;sdata=3DLZritMYTkbkXPtUsjxZAW09dosuphwWIdl=
fK62sjWyw%3D&amp;reserved=3D0]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- coreutils/date.c         | 6 +++++-
- libbb/missing_syscalls.c | 8 --------
- util-linux/rdate.c       | 8 ++++++--
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -279,6 +279,9 @@ int date_main(int argc UNUSED_PARAM, cha
- 		time(&ts.tv_sec);
- #endif
- 	}
-+#if !ENABLE_FEATURE_DATE_NANO
-+	ts.tv_nsec =3D 0;
-+#endif
- 	localtime_r(&ts.tv_sec, &tm_time);
-=20
- 	/* If date string is given, update tm_time, and maybe set date */
-@@ -301,9 +304,10 @@ int date_main(int argc UNUSED_PARAM, cha
- 		if (date_str[0] !=3D '@')
- 			tm_time.tm_isdst =3D -1;
- 		ts.tv_sec =3D validate_tm_time(date_str, &tm_time);
-+		ts.tv_nsec =3D 0;
-=20
- 		/* if setting time, set it */
--		if ((opt & OPT_SET) && stime(&ts.tv_sec) < 0) {
-+		if ((opt & OPT_SET) && clock_settime(CLOCK_REALTIME, &ts) < 0) {
- 			bb_perror_msg("can't set date");
- 		}
- 	}
---- a/libbb/missing_syscalls.c
-+++ b/libbb/missing_syscalls.c
-@@ -15,14 +15,6 @@ pid_t getsid(pid_t pid)
- 	return syscall(__NR_getsid, pid);
- }
-
--int stime(const time_t *t)
--{
--	struct timeval tv;
--	tv.tv_sec =3D *t;
--	tv.tv_usec =3D 0;
--	return settimeofday(&tv, NULL);
--}
--
- int sethostname(const char *name, size_t len)
- {
- 	return syscall(__NR_sethostname, name, len);
---- a/util-linux/rdate.c
-+++ b/util-linux/rdate.c
-@@ -95,9 +95,13 @@ int rdate_main(int argc UNUSED_PARAM, ch
- 	if (!(flags & 2)) { /* no -p (-s may be present) */
- 		if (time(NULL) =3D=3D remote_time)
- 			bb_error_msg("current time matches remote time");
--		else
--			if (stime(&remote_time) < 0)
-+		else {
-+			struct timespec ts;
-+			ts.tv_sec =3D remote_time;
-+			ts.tv_nsec =3D 0;
-+			if (clock_settime(CLOCK_REALTIME, &ts) < 0)
- 				bb_perror_msg_and_die("can't set time of day");
-+		}
- 	}
-=20
- 	if (flags !=3D 1) /* not lone -s */
diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers=
-around-clock_gettime-closes-.patch b/meta/recipes-core/busybox/busybox/000=
1-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
deleted file mode 100644
index 0c7f9b8132..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around=
-clock_gettime-closes-.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From be5a505d771a77c640acc35ceaa470c80e62f954 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 24 Oct 2019 16:26:55 +0200
-Subject: [PATCH] Remove syscall wrappers around clock_gettime, closes 1209=
1
-
-12091 "Direct use of __NR_clock_gettime is not time64-safe".
-
-function                                             old     new   delta
-runsv_main                                          1698    1712     +14
-startservice                                         378     383      +5
-get_mono                                              31      25      -6
-date_main                                            932     926      -6
-gettimeofday_ns                                       17       -     -17
---------------------------------------------------------------------------=
----
-(add/remove: 0/1 grow/shrink: 2/2 up/down: 19/-29)            Total: -10 b=
ytes
-
-Upstream-Status: Backport [https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.busybox.net%2Fbusybox%2Fcommit%2F%3Fid%3Dbe5a505d7=
71a77c640acc35ceaa470c80e62f954&amp;data=3D02%7C01%7Candrej.valek%40siemens=
.com%7C6bcbe021a12a49fb883f08d81d8e55f8%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C637291844451080363&amp;sdata=3Dlj1D%2FOl6ZR5E6f5MCPgP5Es4Ko6e8WNn=
v4j4xQx3nfg%3D&amp;reserved=3D0]
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- Makefile.flags   |  6 ++++--
- coreutils/date.c | 16 +++-------------
- libbb/time.c     | 11 +----------
- runit/runsv.c    | 11 +----------
- 4 files changed, 9 insertions(+), 35 deletions(-)
-
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -129,10 +129,12 @@ endif
- # fall back to using a temp file:
- CRYPT_AVAILABLE :=3D $(shell echo 'int main(void){return 0;}' >crypttest.=
c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c >/dev/null 2>&1 && echo=
 "y"; rm crypttest.c)
- ifeq ($(CRYPT_AVAILABLE),y)
--LDLIBS +=3D m crypt
-+LDLIBS +=3D m rt crypt
- else
--LDLIBS +=3D m
-+LDLIBS +=3D m rt
- endif
-+# libm may be needed for dc, awk, ntpd # librt may be needed for=20
-+clock_gettime()
-
- # libpam may use libpthread, libdl and/or libaudit.
- # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -33,10 +33,9 @@
- //config:	Enable option (-I) to output an ISO-8601 compliant
- //config:	date/time string.
- //config:
--//config:# defaults to "no": stat's nanosecond field is a bit non-portabl=
e
- //config:config FEATURE_DATE_NANO
- //config:	bool "Support %[num]N nanosecond format specifier"
--//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_=
gettime64)
-+//config:	default n # stat's nanosecond field is a bit non-portable
- //config:	depends on DATE
- //config:	select PLATFORM_LINUX
- //config:	help
-@@ -271,17 +270,8 @@ int date_main(int argc UNUSED_PARAM, cha
- 		 */
- #endif
- 	} else {
--#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
--		/* libc has incredibly messy way of doing this,
--		 * typically requiring -lrt. We just skip all this mess */
--		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
--#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE =3D=3D 64
--		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
--		 * This simplifies the code for us as we don't need to convert
--		 * between 64-bit and 32-bit. We also don't have a way to
--		 * report overflow errors here.
--		 */
--		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
-+#if ENABLE_FEATURE_DATE_NANO
-+		clock_gettime(CLOCK_REALTIME, &ts);
- #else
- 		time(&ts.tv_sec);
- #endif
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -253,18 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
- #define CLOCK_MONOTONIC 1
- #endif
-
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
-- 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
--#elif __TIMESIZE =3D=3D 64
--	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	if (clock_gettime(CLOCK_MONOTONIC, ts))
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void)
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -51,18 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAG
- #if ENABLE_MONOTONIC_SYSCALL
- #include <sys/syscall.h>
-
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
--	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
--#elif __TIMESIZE =3D=3D 64
--	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	clock_gettime(CLOCK_REALTIME, ts);
- }
- #else
- static void gettimeofday_ns(struct timespec *ts) diff --git a/meta/recipe=
s-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch =
b/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-h=
ave-to.patch
deleted file mode 100644
index 58a6c0d8a0..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-=
we-have-to.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 902d3992922fc8db8495d5fb30a4581711b60c62 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:50 -0700
-Subject: [PATCH] time: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If -the =
architecture doesn't have the non-suffixed syscall and is using a -64-bit t=
ime_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel -=
headers.
-
-If an architecture only supports the suffixed syscalls, but is still -usin=
g a 32-bit time_t report a compilation error. This avoids us have to -deal =
with converting between 64-bit and 32-bit values. There are -currently no a=
rchitectures where this is the case.
-
-Upstream-Status: Backport [https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.busybox.net%2Fbusybox%2Fcommit%2F%3Fid%3D902d39929=
22fc8db8495d5fb30a4581711b60c62&amp;data=3D02%7C01%7Candrej.valek%40siemens=
.com%7C6bcbe021a12a49fb883f08d81d8e55f8%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C637291844451080363&amp;sdata=3DeKROGzCqNMc89uwrL%2B9qmDKoHAaUCxDn=
p5lBXgkPahw%3D&amp;reserved=3D0]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- libbb/time.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -257,7 +257,14 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
-  * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
--	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
-+#if defined(__NR_clock_gettime)
-+ 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts)) #elif=20
-+__TIMESIZE =3D=3D 64
-+	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts)) #else # error=20
-+"We currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void) diff --git a/meta/recipes=
-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch =
b/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-=
have-to.patch
deleted file mode 100644
index 4760570441..0000000000
--- a/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if=
-we-have-to.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8c7419649d6e6fda8fa7d0e863084c78ac728628 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 28 Aug 2019 10:54:15 -0700
-Subject: [PATCH 3/3] runsv: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If -the =
architecture doesn't have the non-suffixed syscall and is using a -64-bit t=
ime_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel -=
headers.
-
-If an architecture only supports the suffixed syscalls, but is still -usin=
g a 32-bit time_t report a compilation error. This avoids us have to -deal =
with converting between 64-bit and 32-bit values. There are -currently no a=
rchitectures where this is the case.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Backport [https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.busybox.net%2Fbusybox%2Fcommit%2F%3Fid%3Dad27d44eb=
e950335616f37e36863469dc181b455&amp;data=3D02%7C01%7Candrej.valek%40siemens=
.com%7C6bcbe021a12a49fb883f08d81d8e55f8%7C38ae3bcd95794fd4addab42e1495d55a%=
7C1%7C0%7C637291844451080363&amp;sdata=3DNvFi6Ae7LpsKbGFCo%2Bg19jPB%2Bp5WTy=
1Ro8812zQl7x4%3D&amp;reserved=3D0]
----
- runit/runsv.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/runit/runsv.c b/runit/runsv.c -index ccc762d78..737909b0e 100=
644
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -55,7 +55,14 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
-+#if defined(__NR_clock_gettime)
- 	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
-+#elif __TIMESIZE =3D=3D 64
-+	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts); #else # error "We=20
-+currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- }
- #else
- static void gettimeofday_ns(struct timespec *ts)
---
-2.22.0
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.p=
atch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 2a0a40c512..89e1020f13 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -28,14 +28,14 @@ Fixed options -b, -a and -P.
=20
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++-----=
-
- 1 file changed, 21 insertions(+), 8 deletions(-)
+ networking/udhcp/dhcpc.c | 34 +++++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 9 deletions(-)
=20
-Index: busybox-1.31.0/networking/udhcp/dhcpc.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- busybox-1.31.0.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.31.0/networking/udhcp/dhcpc.c
-@@ -48,6 +48,8 @@
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c index=20
+102178a..8210322 100644
+--- a/networking/udhcp/dhcpc.c
++++ b/networking/udhcp/dhcpc.c
+@@ -48,6 +48,8 @@ struct tpacket_auxdata {
  };
  #endif
 =20
@@ -44,7 +44,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
 =20
  /* "struct client_data_t client_data" is in bb_common_bufsiz1 */
 =20
-@@ -103,8 +105,10 @@
+@@ -103,8 +105,10 @@ enum {
  	OPT_x =3D 1 << 18,
  	OPT_f =3D 1 << 19,
  	OPT_B =3D 1 << 20,
@@ -55,27 +55,27 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1124,7 +1128,8 @@
+@@ -1084,7 +1088,8 @@ static void perform_renew(void)
  		client_data.state =3D RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
 -		udhcp_run_script(NULL, "deconfig");
-+		if (allow_deconfig)
-+			udhcp_run_script(NULL, "deconfig");
++               if (allow_deconfig)
++                       udhcp_run_script(NULL, "deconfig");
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -1160,7 +1165,8 @@
+@@ -1120,7 +1125,8 @@ static void perform_release(uint32_t server_addr,=20
+uint32_t requested_ip)
   * Users requested to be notified in all cases, even if not in one
   * of the states above.
   */
 -	udhcp_run_script(NULL, "deconfig");
-+	if (allow_deconfig)
-+		udhcp_run_script(NULL, "deconfig");
++       if (allow_deconfig)
++               udhcp_run_script(NULL, "deconfig");
 =20
  	change_listen_mode(LISTEN_NONE);
  	client_data.state =3D RELEASED;
-@@ -1278,7 +1284,7 @@
+@@ -1238,7 +1244,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  	/* Parse command line */
  	opt =3D getopt32long(argv, "^"
  		/* O,x: list; -T,-t,-A take numeric param */ @@ -84,60 +84,63 @@ Index:=
 busybox-1.31.0/networking/udhcp/dhcpc.c
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1389,6 +1395,10 @@
+@@ -1349,6 +1355,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  		logmode |=3D LOGMODE_SYSLOG;
  	}
 =20
-+	if (opt & OPT_D) {
-+		allow_deconfig =3D 0;
-+	}
++       if (opt & OPT_D) {
++               allow_deconfig =3D 0;
++       }
 +
  	/* Create pidfile */
  	write_pidfile(client_data.pidfile);
  	/* Goes to stdout (unless NOMMU) and possibly syslog */ -@@ -1397,7 +140=
7,8 @@
+@@ -1357,7 +1367,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  	srand(monotonic_us());
 =20
  	client_data.state =3D INIT_SELECTING;
 -	udhcp_run_script(NULL, "deconfig");
-+	if (allow_deconfig)
-+		udhcp_run_script(NULL, "deconfig");
++       if (allow_deconfig)
++               udhcp_run_script(NULL, "deconfig");
  	change_listen_mode(LISTEN_RAW);
  	packet_num =3D 0;
  	timeout =3D 0;
-@@ -1570,7 +1581,8 @@
+@@ -1530,7 +1541,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  				}
  				/* Timed out, enter init state */
- 				bb_info_msg("lease lost, entering init state");
+ 				bb_simple_info_msg("lease lost, entering init state");
 -				udhcp_run_script(NULL, "deconfig");
-+				if (allow_deconfig)
-+					udhcp_run_script(NULL, "deconfig");
++                               if (allow_deconfig)
++                                       udhcp_run_script(NULL,=20
++ "deconfig");
  				client_data.state =3D INIT_SELECTING;
  				client_data.first_secs =3D 0; /* make secs field count from 0 */
  				/*timeout =3D 0; - already is */
-@@ -1762,8 +1774,10 @@
+@@ -1722,8 +1734,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  							"(got ARP reply), declining");
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
 =20
 -						if (client_data.state !=3D REQUESTING)
 -							udhcp_run_script(NULL, "deconfig");
-+						if (client_data.state !=3D REQUESTING) {
-+							if (allow_deconfig)
-+								udhcp_run_script(NULL, "deconfig");
-+						}
++                                                if (client_data.state !=
=3D REQUESTING) {
++                                                        if (allow_deconfi=
g)
++                                                                udhcp_run=
_script(NULL, "deconfig");
++                                                }
  						change_listen_mode(LISTEN_RAW);
  						client_data.state =3D INIT_SELECTING;
  						client_data.first_secs =3D 0; /* make secs field count from 0 */ -@=
@ -1832,8 +1846,10 @@
+@@ -1792,8 +1806,10 @@ int udhcpc_main(int argc UNUSED_PARAM, char=20
+**argv)
  				/* return to init state */
  				bb_info_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
 -				if (client_data.state !=3D REQUESTING)
 -					udhcp_run_script(NULL, "deconfig");
-+				if (client_data.state !=3D REQUESTING) {
-+					if (allow_deconfig)
-+						udhcp_run_script(NULL, "deconfig");
-+				}
++                                if (client_data.state !=3D REQUESTING) {
++                                        if (allow_deconfig)
++                                                udhcp_run_script(NULL, "d=
econfig");
++                                }
  				change_listen_mode(LISTEN_RAW);
  				sleep(3); /* avoid excessive network traffic */
  				client_data.state =3D INIT_SELECTING;
+--
+2.17.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.32.0.bb
similarity index 79%
rename from meta/recipes-core/busybox/busybox_1.31.1.bb
rename to meta/recipes-core/busybox/busybox_1.32.0.bb
index 2bb1d59ba7..0dfdfdb549 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
@@ -42,14 +42,9 @@ SRC_URI =3D "https://eur01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fbusybox.net%2Fdownloads%2Fbusybox-%24&amp;data=3D0=
2%7C01%7Candrej.valek%40siemens.com%7C6bcbe021a12a49fb883f08d81d8e55f8%7C38=
ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637291844451080363&amp;sdata=3D%2B=
WaiH9tRn8RwGqLgpsUAKRUYlEXQlxUGdID2L2Tux64%3D&amp;reserved=3D0{PV}.tar.bz2;=
name=3Dtarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-https://eur01.safelinks.protection.ou=
tlook.com/?url=3Dhttp%3A%2F%2Fwww.example.org-for-wget-test-cases.patch%2F&=
amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7C6bcbe021a12a49fb883f08d81=
d8e55f8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637291844451080363&amp=
;sdata=3DLIGyOWr4fLVhvntBsEZgLjpoMgwLi%2BfwC4TyEFZrk%2F4%3D&amp;reserved=3D=
0 \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
-           file://0001-date-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0001-time-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0001-Remove-syscall-wrappers-around-clock_gettime-closes=
-.patch \
-           file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-n=
e.patch \  "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "
=20
-SRC_URI[tarball.md5sum] =3D "70913edaf2263a157393af07565c17f0"
-SRC_URI[tarball.sha256sum] =3D "d0f940a72f648943c1f2211e0e3117387c31d76513=
7d92bd8284a3fb9752a998"
+SRC_URI[tarball.md5sum] =3D "9576986f1a960da471d03b72a62f13c7"
+SRC_URI[tarball.sha256sum] =3D "c35d87f1d04b2b153d33c275c2632e40d388a88f19=
a9e71727e0bbbff51fe689"
--
2.17.1



