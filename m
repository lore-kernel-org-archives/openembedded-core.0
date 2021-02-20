Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web12.9438.1613842192034486557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 09:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=lRN5ywTH;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613842189;
	bh=/7E4aZ8Z+IKlm0UzWobFVxe5dv4IxN4OvPl0T0lrEzY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=lRN5ywTH7QBD88vKcuUpVqcfKwOPkGkBaCM90aJoPnai+I5Eb3VzcqkibFR2YIm6B
	 pyk+mGdQSBGIemc249oWAyxTS4JORJJ9jJue+1xunLjYHhgdzlGKHk0NsNXaNMC99b
	 /p842/7P228yP/oI2yRdslfuX/I68+m7zG0BwGro=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWASe-1lKehz2nus-00XafX; Sat, 20
 Feb 2021 18:29:49 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [PATCH 1/3] core: rpm: Do use source_date_epoch also for fakeStat
Date: Sat, 20 Feb 2021 18:29:32 +0100
Message-Id: <20210220172934.6428-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:OzJqxpgZj8f/QpYjE9Owx2ygyQyt1b08gMl0P+UJNAGmGfvUjL/
 MKdxJm2bD0eoK0CPQpIyaJJfqcxMakhwkMHUuXP033Z0vl+rXyS1n3tJlGx/mcUv7bj3N68
 wcpqcOtvNjjs+MQ20bKdXs0A11PDMehmg03ioxcZnG5Aql17NLNbrQTQk4xUmC8iDXhXC4M
 B+zWhhJLjObLNCDnVKm1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7qJdY9G7LrU=:0zBioBu7jt9aJaNg7FJw8k
 ocDAKtyltzypiVdPRJvPKnjK7lYdbbPjuAZMgPO73nnNDjOYggBqZArZZw6fTk8GMIzID9Jli
 GSfNejgncT1ckltLxjDdsVdXfZ/60GyfRtRlZ8vHu/9I+A09fUyUpa76xgO+7buh0mhLpF6Uh
 Vda/eMONXEPbkbw51TKBf7eitUWZOQQCqj80aXVImumIiZdtj+xmEKbRW4QlC+HszNXbKwOs8
 BPsAXtA7xD+A5vfUTh0N0TDygVLS2mdqJX7INZXWoRCUt4QWNCXTfe3N5aUcZ8GgILoea+YL9
 EJ2CybrxuLl7g22QNSMNjXLv//TOdHPPbw88vWvhqejY+q2nJ6UGMWFkkVQ9Uvf8NlhKk2Y/X
 zNZazja7EHFlRweJM5hN4kXKQaNRaS6wKWjHGVeiFRtZGIvcvr7nKsk637M+1VJzxKSfHARae
 wGjurEWCrhAepou19Z/ASVmW459kWYMc7GUZ8pTou+ZDig5oKyQpyLLfJ8Wl6UDCjlp5cMK1J
 8rDeKv3MwCAu6XDTvPq22/SqpSBXJoQGiPS+GZMxH4SSroRGyJuHrOWe3rGglmwasyUxwt44B
 6ot7LUZsT/TZ9tkWPL7ZBlWLRBTJxtp0E0rbMWQDi7sB2GDullNBz9EX/JTapzsL1gJG0m2dy
 RR4fUqF1fPiOPwkmjfoMc9lgoDIbKFxKSSrfbGj/+e+xZIcoO2qw+rjjC3d1sUdw9wnGwlgA1
 6qgbxfZEt/QEllubQDTi1LXqYP28P7yFKNBtQriaSpNN5I0c6cuHYpD5S8JQbI6E6Q5D0dBWG
 viVO734syBH+IjgdPo+Whl10+exZdtUPIvQxw0K5sbAEWiSM5ouQ8/ibA9Wez4MyKoOU3OsWV
 abQQf74SOZ6FpwBLhoPg==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

This makes sure that if we enforce SOURCE_DATE_EPOCH
we do also set this for entries returned by the fakeStat
function of rpm.

Upstream status: pending

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
=2D--
 ...-the-timestamps-returned-by-fakeStat.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.1.2.bb     |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Also-clamp-the-ti=
mestamps-returned-by-fakeStat.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Also-clamp-the-timestamp=
s-returned-by-fakeStat.patch b/meta/recipes-devtools/rpm/files/0001-Also-c=
lamp-the-timestamps-returned-by-fakeStat.patch
new file mode 100644
index 0000000000..d5c3536856
=2D-- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Also-clamp-the-timestamps-retur=
ned-by-fakeStat.patch
@@ -0,0 +1,46 @@
+From b79d505fc408a41616d51329895a27c99cbbaeaf Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jan-Simon=3D20M=3DC3=3DB6ller?=3D <jsmoeller@linuxfound=
ation.org>
+Date: Thu, 18 Feb 2021 16:26:58 +0100
+Subject: [PATCH] Also clamp the timestamps returned by fakeStat
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Use the source_data_epoch also for the fakeStat supplied entries.
+
+Upstream status: pending
+
+Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
+---
+ build/files.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/build/files.c b/build/files.c
+index 47625905c..75ec0792f 100644
+--- a/build/files.c
++++ b/build/files.c
+@@ -1304,6 +1304,24 @@ static rpmRC recurseDir(FileList fl, const char * =
diskPath);
+ static struct stat * fakeStat(FileEntry cur, struct stat * statp)
+ {
+     time_t now =3D time(NULL);
++    time_t source_date_epoch =3D 0;
++    char *srcdate =3D getenv("SOURCE_DATE_EPOCH");
++
++    /* Limit the maximum date to SOURCE_DATE_EPOCH if defined
++     * similar to the tar --clamp-mtime option
++     * https://reproducible-builds.org/specs/source-date-epoch/
++     */
++    if (srcdate && rpmExpandNumeric("%{?clamp_mtime_to_source_date_epoch=
}")) {
++       char *endptr;
++       errno =3D 0;
++       source_date_epoch =3D strtol(srcdate, &endptr, 10);
++       if (srcdate =3D=3D endptr || *endptr || errno !=3D 0) {
++           rpmlog(RPMLOG_ERR, _("unable to parse %s=3D%s\n"), "SOURCE_DA=
TE_EPOCH", srcdate);
++       } else {
++       now =3D source_date_epoch;
++       }
++    }
++
+
+     if (cur->devtype) {
+ 	statp->st_rdev =3D ((cur->devmajor & 0xff) << 8) | (cur->devminor & 0xf=
f);
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb b/meta/recipes-devt=
ools/rpm/rpm_4.16.1.2.bb
index 9195d66dd1..a5c7a0f071 100644
=2D-- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
@@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/rp=
m;branch=3Drpm-4.16.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets=
-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N3=
2.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://0001-Also-clamp-the-timestamps-returned-by-fakeStat.pat=
ch \
            "

 PE =3D "1"
=2D-
2.26.2

