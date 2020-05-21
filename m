Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web12.6752.1590070418290775149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 07:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=BlvMksCG;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1590070416;
	bh=XFinEMlod9FfhebACwOfWkfD5CpEvQa4vYFveBLrNL8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=BlvMksCGw4Mazih8jXPVCnOi1RllzXcBMi/JVWQ8MErntKVQYNlNWk9xEUS6+5wUx
	 vJ3JdrvP6dqT4PTtI55v63cPJVJ/2B5MkHmyCKTV2N2aW1QJHGUxBalPPtbpzF1KqE
	 hZZh0fY7z0sfzwQnVI//3M9IzN3JxnVbuOvs3NVA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.56.40]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1j1tAY1QTS-00ZyUV; Thu, 21
 May 2020 16:13:36 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Subject: [dunfell][PATCH] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
Date: Thu, 21 May 2020 16:13:16 +0200
Message-Id: <20200521141316.3974-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:9qSKw0pL77XQVhiLJcLjHeHeuMV4OddZcRbn1cEHKDxVPJKD5SO
 RBZacmBmw1ldePRY3OyXW/x2tXfKXLsjOgLK/Z7JMlVa4dUy3/lxP2TEaHdebRfIVm2oAkJ
 oczwBzC69GpxaDsZ0K8+mynFdzH8spIPzQNSfkv9gSPo2In7f27eteU3r3GMBevvezm69wM
 sSJ3Z8tsLqdlFW8RP8TVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rvu/+ihhggU=:m7gakEk9teMjHJ5NW1XvH8
 iqtiUhw/CDTdrPdHGOJ0Iaf1cuceI9yE/DWWfWuIMtss7mxAj7Wj0HSURsapVjIw+MJG+Vxmz
 XR641jgXPiGfMwk2ZgHVqOKuFSMQw+xJF30XKxUGAuSjG3lQM7Db3U4f+bpn+UfSAcbEAKtq+
 6yZkHQzfhU4taPy4SBT7s5ZS+c8AnzdSlrZfAT60QUq8DB/Dv8PBm9LnKddywFbrbGqUYR6Up
 3sGgtvr2GDWLa7WDpebOthOnpRFWm1JRx5Zbo39pxXhrzG0OPIaekQB/mHEVeeGx7g5OP4m5k
 SGGMsJdJct0JUUKvy0dyatX9AwZwYQP4gxDGdr+q4qz3SZFQwR8OSPThOZWg6cQ1yhr/k8ciD
 z39Yw38NKOzZ+gfQ/aC/rTQ6lhADBMXm0wcXr5PXmeoJ+4lED3QaGXKz9vQ1g/l9NeV1FGwVI
 Ko6eX/OEnaTkjziAacrUwzIaQNRR2Y7k0aW1VspF8WiUeMYEg9nldoxPQnAr44JvF+ESBF4EM
 aSGwpgCPqcud0wggP4DEkPbnd3NZ3jCRf3n9rJ8rdM4lfNHD1Vb+yycQ7A7G2aWDfm8D20iKn
 a5hweS83KdjmocU3CkMHqp4ouus370fMuLKfuhJmVFtlNOu4tXKn7E5jxYlnzedpg1DIBTkp0
 /Aharh3FJlDB6QdHJMkAw9MmUi5JlbIHCwRrVhsUqxinQVHwd+gZOVxuA4rPZ3z+Vqf+B47Sy
 XPQ6lp035zc1okdil0olb6eqcOaHzTRItI+iGZb3t+xq3l4d2fYPgvq4+857n7u+eY0K/uxuV
 mAoxtC0XqgEh/lCxFZSZppLP+91swQmeN17ZhxEVNhuQ3ll4XRv0RNNgLPySO+VkpmxBZk3Ci
 IF+fG4wnk4u09zFQh4lQJOiUkqY8vVubJtmpZqTjFXyza4pHE2QURVQY23PUFoiFu9ty9MxWf
 KAESXEXMcYmRhdl0LEzj5MESr/r5tSUcntftbkBbEepjJXtMeUdpmmTXkTBfgIeOvLaLR1OnZ
 gLxJRf7tzpB3rIMKcBXFSKXJE40Hluw/A2iCURw88Nlu+1AnNMCyWfsNvsA8Gl7ZWdL+t+eSh
 SCrz15I6RmtkYqsO39tQNckSMTKdmLqKgf6LTx2cIpwXo/I7h9CKTAEymEFD1gFoB7lwlMJAE
 oH85au4HaB6lUjIpgrbQeIOh7kM2nLgaArSgpWCMOK6/0VPsLZ6e0K6eSibQu+d+JDL8zg0sp
 /jq0dpvU+IZuYCRAQ
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
index b8f09107e8..bd33103b2e 100644
=2D-- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -9,7 +9,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d=
9a72c502ecfdda1b"

 DEPENDS =3D "zlib file-replacement-native"
-DEPENDS_class-native =3D "zlib-native"
+DEPENDS_class-native =3D "zlib-native bzip2-replacement-native"

 SRC_URI =3D "git://github.com/file/file.git"

=2D-
2.26.2

