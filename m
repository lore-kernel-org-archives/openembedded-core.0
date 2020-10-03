Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web11.10556.1601742871361339069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2020 09:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=fc4O4cV6;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1601742869;
	bh=FRZ+uTYGodWzHGGIkjtRZngFI1jdxjwBKrvEuzoEBpw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=fc4O4cV6apl1zrZkrAiHH1jXFqKOUSLvt2sohvyE9UQ1iKHMxC1cFyVqNRdOHDVtF
	 0PSQ+a8sDkvZWrYPaeXl3TijqbSJtQQRpskXjK0IYlSUwdPRss8JBBLW3PFhoqxbky
	 jurwcbXZy+07r5nQT6czTZIhmLK3feTWTDbiSYDA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDnC-1kFMZX0q1W-00CjaH; Sat, 03
 Oct 2020 18:34:29 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>
Subject: [PATCH] rm_work: Allow pseudo directory to be in the excludes
Date: Sat,  3 Oct 2020 18:34:17 +0200
Message-Id: <20201003163417.67950-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:i9v4rbQYI3BpyjaF0cE91OQ9W3tWbVpDgH+7T4SXsNQk30zKwp3
 3JSrJx/3S0THLFOcwRLN+2pbEjlWE3dQl/oiRY5RbIOc0ozu25ERjD4PlMBC8eroFeuiG4b
 2RG7w6NGsIKpE0M0VAFjGZ7bltQbKJ6nQqdJlVlU4alEjWo1msjz/nWekkTpx2C/njXsPmT
 fyQgOS0FWDx6z2BdnBC/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PKt8R9cdRDc=:8aN/v5/MwsK+tlwBGrjm5D
 B61Ow15dKM+jB6xOwjl14MkjDR6aDz/HXHN3/V8baIgiA/32bveRCMBmrk4LOMy5Si4KhsIZl
 0RNGCpGHZRHwi6RiUkruWNrsZXjjbSG6tXHM6O6BskKvDbK3414bOkzA/w771L/AiFlDIjo+D
 Z3TDJxsQhvouM2ifl2gOVSIpNf2dbSor4JuyZXDLZb8bhKA1onq5HKUgeZ+wL9QwlC32FDyvK
 ABjA11SeGvjX3yIj2M6w/ko/HuDIOQ5L/3yLW3HdOIiMfc5YPI2YXzCrl1oH4MUwPJmpWYDQg
 ncN/DSsWkr1hYVSucuJH+MbB6HJt1UflsW8JsZlRZgiz0KzvLkOGTeB0Afls+UKJXu6PkXNsR
 obaP4XLRzmpUlLqv+I2NB9AOBFcmhfA5LUqREFPq/y39E5Vfnu14EvipBktKo4B4tFqCqB8GC
 xTdiCHHMfqnDC2jL8i5YBXGiT6sjb1N1VUTr60rDqRE7zZ1NWs7KTbUSDuYxfnWaWqQ34Kkl0
 MLFktk13gC3wD07ZPZoB70bt1FHs8Zu0HKTUQh2c2CpEZ8MEyx7IJ3Gu8/XV5pkMx3ntgqkrd
 BfOnOcXE73TxqASBnQFAiYHQtGavzEzRiNEZ6m10olet0fKdZJgGsQFaFr3mnBgbWn4NmJlKD
 BwEgt0MpzNwv8287/MVL08Y9nd8iiEtKsqG8PtNeXllu80PoIaqgWQlLL8IoWn1QKv+GDTRhz
 ioR4cog7W/nHWZgjMeh1swjHtL3ynrIV0mVKaoSv9/YBO7KnhzIBMZiTWhoGqbKR8t5q9Qp+o
 k1iA7RLJ9PBbH8qkiWEDx8kkYIE/SAKtxOhCuSFUNb+52oHw+22l4k5R1IaYJ8gBaSR4mXJOf
 RCIYPNyMSCuoDjHXVIwnT7vd3LMSV8Qm0w2U3SyhsQ3tdbtwYSkxJyzbZxl0FtSIe6YBXQyn3
 zgx1AUfrClHvqhL2yosax9mjieWiq/SUreZgEoZCizmCvzmyzqn6HW/rbEND2kl39PAp4dJAo
 g34U9wHBU4XC+OdUfvug+wDV9wSnZj+NLSPdID939kFmJCSdsDecxmLwmmON5x37K4f+vdgOe
 Z/FAMBJPb2oDNrSHuLZgMb9cs1qC/vcQYtYu4t/PaM3/c/kLWN4ANUsjPnhFKhuY+3ZXyWbja
 4WYpjI0Ii3/8yFkR1Ndo49TAJK8m+AYj5vIAnaC5xmo9piJ/VHbtv1xBeoBiw+j7/xKjp9+nX
 luQWj3VfLPmRw6K1P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>

While debugging the pseudo issues, rm_work was always removing the pseudo =
folder
even when it was in the RM_WORK_EXCLUDE_ITEMS variable.

This patch puts the pseudo case within the conditional.

Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
=2D--
 meta/classes/rm_work.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 01c2ab1c78..0e52fb6ae6 100644
=2D-- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -99,10 +99,12 @@ do_rm_work () {
     do
         # Retain only logs and other files in temp, safely ignore
         # failures of removing pseudo folers on NFS2/3 server.
-        if [ $dir =3D 'pseudo' ]; then
-            rm -rf $dir 2> /dev/null || true
-        elif ! echo "$excludes" | grep -q -w "$dir"; then
-            rm -rf $dir
+        if ! echo "$excludes" | grep -q -w "$dir"; then
+            if [ $dir =3D 'pseudo' ]; then
+                rm -rf $dir 2> /dev/null || true
+            else
+                rm -rf $dir
+            fi
         fi
     done
 }
=2D-
2.26.2

