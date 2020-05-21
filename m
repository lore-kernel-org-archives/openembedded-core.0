Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.web11.6707.1590070029692687446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 07:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=CXFoJUlH;
 spf=pass (domain: gmx.de, ip: 212.227.17.22, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1590070028;
	bh=vV35SuoAUiWa/zQ9ZTPEjhibhUyY5HffyqvQwpOCicQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=CXFoJUlHWWBikU+/fs1VfiMgDwvBMMql4CZcw1decShnUTpYJYEeEdTllw9GMP8gd
	 TCt7JsR54KjplzMWn4puFydV+HHiG297fq3Yu3WG7yiGJopY6Zhvyb6O66jXogqw0Y
	 62FemXz2AxWnxJfrj7rcg+6bgC5shUC5g7BUz9eI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.56.40]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1jY2Fe0W46-00Yfqw; Thu, 21
 May 2020 16:07:08 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Subject: [PATCH] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
Date: Thu, 21 May 2020 16:07:04 +0200
Message-Id: <20200521140704.2815-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:rOD/IbMihRGI79D8/hyVPlCUlicRgyT9W7novbMNJIG1Vsj8xDD
 UQJcSwFLOnHnHxD6TToNgUmAY6qLNoHzMViELN0qsJlrs60uYuGZHgzzn0KyPqAK9O0PXAa
 XYQQxHl+2aTcB2/UIj0oJ3OPLBi63QGaO5sSzBhkiiXR/1g/9Llbjcixd/Dfe/DwCUL783p
 nuJmRvVzB6P7NU0Hj5nCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e6ewBXVd7eE=:PCAwNN2fpY7ewVEqISimAD
 8w7hpuJv+/jmj7hoVoybwooxC24jRfLwPmeTa3W8YYe7pLopNmibYTAW5A6BuJbtu+RYhJGyK
 H/HZpsfyL52HkEFbuoXd19vZXh63tbu0FdiG6fG+4rLYK06mRYISxvo1Dm1wQ//txlsAUNtHz
 YFwDHlAttlQwGlrTA6eCX1EiCq5c2T7D/HXROSzwGlrPKKwAXur1hsXgjjRE5RRfLTZnvQLiE
 R2+Sx+JnTtl/MVNXe3dioloMs3YLH1it1yaqMylUxVogRCIKLTWsNGdOGcEoF7Ns1gW8xaIvx
 vrO9oElfdciz1VEkAxBy4JExfczj1L9JwyIFTMnMn57VjpzxL9DcrZNjl8/4RgAM9RN2bllsN
 YlfQmCUxXpfkCFm2fyub1ag/Ji5W13D+dPZb3OwnHcdusKATpwdhWojS6vkUbBXfXh0qjg+D4
 0PpLxFFkuZAYwDc2OFIQ7yxgmpLlRUDjP+rBgh40M7lhP7I/FILV0hCCTyFSWd6IpIkJdjpmn
 6uznA/CvjQpwDxsQo1xclkqd5bmQffX/j/o3R2SbyBVT0kgfHcc32chfK+1qEU7iUYrCMISTj
 dsdK8NZ095CFPyQ3bCNlppwmQ1Nm94wSqMmLq6N1ceoGsr01YYNy1FGb9VDNp6Dx8Ar5aGGrK
 Lpsg+jDdB/QtZfNHVEUcE2MlTDZSd0Z4NP0YD3sPwqqGMiaaGFwdnY62NgKvevVK7ftU6kZs6
 uXMn+/6RhLsPztqXzIECrUCZDdVsOZxNFAOuk0Pr6Vicex7c5SC8CDRV6MoqBWnrDDaL8JvSt
 glH2unrR/k5jyqf/8shJ36PCruK8lch0n5pP9eKSkrdNQXWX2X/Mzi+f24/wTRBzY9S+Phozm
 Sf9Q+LC2qezqB4v1/4kxxJ0A2BrdwlLeaGsJtOrHlsc5AkhV3mc8H154YthbUOyddsiM7FjB9
 WQT4ATDCtfmyo/7d/SsdZLeAma0AX/C5MrIIjzrzGZNFEkiKY/VkuDsDcKS0/z/AxyW7nhMJQ
 F98K5c4QkmURgQDPzgu/ybRsoXauANll9GSkXxM/zRLekV+m6FJOnbKcAb+MIFBptZodOPj0C
 JEXOkL8GrDjtLdF+7HhUO4GatuCL6vUKJ+Z9LFtcH324rCtxssdNJpoK+MFiX/86cs0zQTTxQ
 flF+7w9ny1d7eXjiGlD6NCPUI3xNOZUuHljERCweGwvXKi92C9Wc0eQGFZhG6gWWFTU64=
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon Moeller <dl9pf@gmx.de>

file-native when built on a Debian 10 host will embed a dependency to
'libbz2.so.1.0' (instead of 'libbz2.so.1'). This can cause issues
when sharing the sstate between hosts e.g.:

 recipe-sysroot-native/usr/lib/rpm/rpmdeps:
      error while loading shared libraries: libbz2.so.1.0: \
        cannot open shared object file: No such file or directory

To avoid this situation, let's add the bzip2-replacement-native to the
file recipe's DEPENDS_class-native .

Details in https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13915 .

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 meta/recipes-devtools/file/file_5.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtoo=
ls/file/file_5.38.bb
index 007db4790d..48cf8ab549 100644
=2D-- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -9,7 +9,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d=
9a72c502ecfdda1b"

 DEPENDS =3D "file-replacement-native"
-DEPENDS_class-native =3D ""
+DEPENDS_class-native =3D "bzip2-replacement-native"

 SRC_URI =3D "git://github.com/file/file.git"

=2D-
2.26.2

