Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED9EC54EFB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20321.1708018343587360683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WsjmQ2hq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YVmm88ZJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39be9-08fb9498-53f9-4d62-a4d1-949c4adb7b17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8LxXQSbkjyYS/9vsd078H/9GFuljU1YdFBcX1drRkmA=;
	b=WsjmQ2hqy5w86s2U/L23cIk++Ev6QHw4vBRhs3Cw5vxmTmwCp9BmwpvwQlTkP3i5
	2ubEvOUelt5ZZMLvFWpn1rTTZpWz2dbESaMsAsoxqNmGX6XErwf7L+Ac3PBxuOVYmfX
	vYuJkz9O8tyyHtlTr5wCz4sihEAw1kdfpLZqXQHg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8LxXQSbkjyYS/9vsd078H/9GFuljU1YdFBcX1drRkmA=;
	b=YVmm88ZJhWXKBY11zQj7EcckQe+5uM2XuXihXEHbVXDz5npngwhw9WEtcIdh+oFY
	k75MlNovEyr56CIvcbpXsJ9/2kYBuTHjj7EQZpdc5A25BFMxNnUgm9Jl2kJkHr+78XB
	atqTeFM78eHLZs89f7kukmjAIsciPCMnzZeTiHfY=
Content-Type: multipart/mixed; boundary="===============4485135466667567038=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.6p1 FAILED
Message-ID: <0101018dadd39be9-08fb9498-53f9-4d62-a4d1-949c4adb7b17-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195559

--===============4485135466667567038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.6p1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-openssh-upgrade-9.5p1-9.6p1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f26fbc3ee9cd4feabd898b8706b8952b8e0e3ac0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 05:49:38 +0000
Subject: [PATCH] openssh: upgrade 9.5p1 -> 9.6p1

---
 ...h-log-input-and-output-files-on-erro.patch | 10 +---
 ...tional-support-for-systemd-sd_notify.patch | 18 +++---
 .../add-test-support-for-busybox.patch        | 57 +++++++++++--------
 ...igned-overflow-in-pointer-arithmatic.patch |  6 +-
 .../{openssh_9.5p1.bb => openssh_9.6p1.bb}    |  2 +-
 5 files changed, 47 insertions(+), 46 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 2c14014fed..3f8b8b3b97 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From c521081ae72b2235fb74cca0dfef2d0e3df28ad4 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
@@ -35,14 +35,13 @@ return value: 1
 See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
 
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
 ---
  regress/banner.sh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
-
 diff --git a/regress/banner.sh b/regress/banner.sh
-index a84feb5a..de84957a 100644
+index a84feb5..de84957 100644
 --- a/regress/banner.sh
 +++ b/regress/banner.sh
 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
@@ -56,6 +55,3 @@ index a84feb5a..de84957a 100644
  done
  
  trace "test suppress banner (-q)"
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..afb48a7e15 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From 9ffd0580e773579d7a03da56c5b9cc36e3eb891c Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -9,16 +9,17 @@ patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  configure.ac | 24 ++++++++++++++++++++++++
  sshd.c       | 13 +++++++++++++
  2 files changed, 37 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 22fee70f..486c189f 100644
+index 379cd74..a7d0e92 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+@@ -4842,6 +4842,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
  
@@ -48,7 +49,7 @@ index 22fee70f..486c189f 100644
  # Looking for programs, paths and files
  
  PRIVSEP_PATH=/var/empty
-@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MSG"
+@@ -5650,6 +5673,7 @@ echo "                   libldns support: $LDNS_MSG"
  echo "  Solaris process contract support: $SPC_MSG"
  echo "           Solaris project support: $SP_MSG"
  echo "         Solaris privilege support: $SPP_MSG"
@@ -57,7 +58,7 @@ index 22fee70f..486c189f 100644
  echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
  echo "                  BSD Auth support: $BSD_AUTH_MSG"
 diff --git a/sshd.c b/sshd.c
-index 6321936c..859d6a0b 100644
+index 9cbe922..4b342c5 100644
 --- a/sshd.c
 +++ b/sshd.c
 @@ -88,6 +88,10 @@
@@ -71,7 +72,7 @@ index 6321936c..859d6a0b 100644
  #include "xmalloc.h"
  #include "ssh.h"
  #include "ssh2.h"
-@@ -310,6 +314,10 @@ static void
+@@ -308,6 +312,10 @@ static void
  sighup_restart(void)
  {
  	logit("Received SIGHUP; restarting.");
@@ -82,7 +83,7 @@ index 6321936c..859d6a0b 100644
  	if (options.pid_file != NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)
  			}
  		}
  
@@ -94,6 +95,3 @@ index 6321936c..859d6a0b 100644
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
  		    &newsock, config_s);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
index b8402a4dee..29ad05aa73 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -1,4 +1,7 @@
-Adjust test cases to work with busybox.
+From 76face71784f7ad1c290bedd68ec334f0107186a Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Thu, 24 Apr 2014 18:00:22 +0200
+Subject: [PATCH] Adjust test cases to work with busybox.
 
 - Replace dd parameter "obs" with "bs".
 - Replace "head -<num>" with "head -n <num>".
@@ -6,11 +9,17 @@ Adjust test cases to work with busybox.
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
-Index: openssh-7.6p1/regress/cipher-speed.sh
-===================================================================
---- openssh-7.6p1.orig/regress/cipher-speed.sh
-+++ openssh-7.6p1/regress/cipher-speed.sh
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
+---
+ regress/cipher-speed.sh | 2 +-
+ regress/key-options.sh  | 2 +-
+ regress/transfer.sh     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/regress/cipher-speed.sh b/regress/cipher-speed.sh
+index 1340bd1..8770757 100644
+--- a/regress/cipher-speed.sh
++++ b/regress/cipher-speed.sh
+@@ -27,7 +27,7 @@ for c in `${SSH} -Q cipher`; do n=0; for m in `${SSH} -Q mac`; do
  		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
  			-F $OBJ/ssh_proxy -m $m -c $c somehost \
@@ -19,24 +28,11 @@ Index: openssh-7.6p1/regress/cipher-speed.sh
  		< ${DATA} ) 2>&1 | getbytes
  
  		if [ $? -ne 0 ]; then
-Index: openssh-7.6p1/regress/transfer.sh
-===================================================================
---- openssh-7.6p1.orig/regress/transfer.sh
-+++ openssh-7.6p1/regress/transfer.sh
-@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted
- for s in 10 100 1k 32k 64k 128k 256k; do
- 	trace "dd-size ${s}"
- 	rm -f ${COPY}
--	dd if=$DATA obs=${s} 2> /dev/null | \
-+	dd if=$DATA bs=${s} 2> /dev/null | \
- 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
- 	if [ $? -ne 0 ]; then
- 		fail "ssh cat $DATA failed"
-Index: openssh-7.6p1/regress/key-options.sh
-===================================================================
---- openssh-7.6p1.orig/regress/key-options.sh
-+++ openssh-7.6p1/regress/key-options.sh
-@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
+diff --git a/regress/key-options.sh b/regress/key-options.sh
+index 2f3d66e..7f8166d 100644
+--- a/regress/key-options.sh
++++ b/regress/key-options.sh
+@@ -90,7 +90,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
  	fi
  
  	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
@@ -45,3 +41,16 @@ Index: openssh-7.6p1/regress/key-options.sh
  	verbose "key option $from"
  	r=`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
  	if [ "$r" = "true" ]; then
+diff --git a/regress/transfer.sh b/regress/transfer.sh
+index cf174a0..41cfdc7 100644
+--- a/regress/transfer.sh
++++ b/regress/transfer.sh
+@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted copy"
+ for s in 10 100 1k 32k 64k 128k 256k; do
+ 	trace "dd-size ${s}"
+ 	rm -f ${COPY}
+-	dd if=$DATA obs=${s} 2> /dev/null | \
++	dd if=$DATA bs=${s} 2> /dev/null | \
+ 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
+ 	if [ $? -ne 0 ]; then
+ 		fail "ssh cat $DATA failed"
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
index 20036da931..b6a8e3c267 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 5f333ee093a808d91fb819f9525e721229411828 Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 24 Aug 2016 03:15:43 +0000
 Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
@@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
 
 Complete the fix
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  openbsd-compat/strlcat.c | 10 +++++++---
  openbsd-compat/strlcpy.c |  8 ++++++--
@@ -106,6 +107,3 @@ index 7ad3573..7040f1f 100644
 +	return (size_t)((uintptr_t)cp - (uintptr_t)str);
  }
  #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 0312d5bd66..6366cefdf9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
+SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.42.0


--===============4485135466667567038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-9.5p1-9.6p1.patch"

RnJvbSBmMjZmYmMzZWU5Y2Q0ZmVhYmQ4OThiODcwNmI4OTUyYjhlMGUzYWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDU6NDk6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDkuNXAxIC0+IDkuNnAxCgotLS0KIC4uLmgtbG9nLWlucHV0LWFuZC1v
dXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8IDEwICstLS0KIC4uLnRpb25hbC1zdXBwb3J0LWZv
ci1zeXN0ZW1kLXNkX25vdGlmeS5wYXRjaCB8IDE4ICsrKy0tLQogLi4uL2FkZC10ZXN0LXN1cHBv
cnQtZm9yLWJ1c3lib3gucGF0Y2ggICAgICAgIHwgNTcgKysrKysrKysrKystLS0tLS0tLQogLi4u
aWduZWQtb3ZlcmZsb3ctaW4tcG9pbnRlci1hcml0aG1hdGljLnBhdGNoIHwgIDYgKy0KIC4uLi97
b3BlbnNzaF85LjVwMS5iYiA9PiBvcGVuc3NoXzkuNnAxLmJifSAgICB8ICAyICstCiA1IGZpbGVz
IGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC97b3BlbnNzaF85LjVwMS5iYiA9PiBvcGVuc3No
XzkuNnAxLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRw
dXQtZmlsZXMtb24tZXJyby5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmls
ZXMtb24tZXJyby5wYXRjaAppbmRleCAyYzE0MDE0ZmVkLi4zZjhiOGIzYjk3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3Mt
YmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJh
bm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmNWE0ZGFjYzk4N2NhNTQ4ZmM4NjU3N2MyZGJhMTIxYzg2ZGEzYzM0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNTIxMDgxYWU3MmIyMjM1ZmI3NGNjYTBkZmVm
MmQwZTNkZjI4YWQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWlra28gUmFwZWxp
IDxtaWtrby5yYXBlbGlAbGluYXJvLm9yZz4KIERhdGU6IE1vbiwgMTEgU2VwIDIwMjMgMDk6NTU6
MjEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVncmVzcy9iYW5uZXIuc2g6IGxvZyBpbnB1dCBh
bmQgb3V0cHV0IGZpbGVzIG9uIGVycm9yCkBAIC0zNSwxNCArMzUsMTMgQEAgcmV0dXJuIHZhbHVl
OiAxCiBTZWU6IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTUxNzgKIAogU2lnbmVkLW9mZi1ieTogTWlra28gUmFwZWxpIDxtaWtrby5yYXBlbGlAbGlu
YXJvLm9yZz4KKwogLS0tCiAgcmVncmVzcy9iYW5uZXIuc2ggfCA0ICsrKy0KICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKLVVwc3RyZWFtLVN0YXR1czog
RGVuaWVkIFtodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzaC9vcGVuc3NoLXBvcnRhYmxlL3B1bGwv
NDM3XQotCiBkaWZmIC0tZ2l0IGEvcmVncmVzcy9iYW5uZXIuc2ggYi9yZWdyZXNzL2Jhbm5lci5z
aAotaW5kZXggYTg0ZmViNWEuLmRlODQ5NTdhIDEwMDY0NAoraW5kZXggYTg0ZmViNS4uZGU4NDk1
NyAxMDA2NDQKIC0tLSBhL3JlZ3Jlc3MvYmFubmVyLnNoCiArKysgYi9yZWdyZXNzL2Jhbm5lci5z
aAogQEAgLTMyLDcgKzMyLDkgQEAgZm9yIHMgaW4gMCAxMCAxMDAgMTAwMCAxMDAwMCAxMDAwMDAg
OyBkbwpAQCAtNTYsNiArNTUsMyBAQCBpbmRleCBhODRmZWI1YS4uZGU4NDk1N2EgMTAwNjQ0CiAg
ZG9uZQogIAogIHRyYWNlICJ0ZXN0IHN1cHByZXNzIGJhbm5lciAoLXEpIgotLS0gCi0yLjM0LjEK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gv
MDAwMS1zeXN0ZW1kLUFkZC1vcHRpb25hbC1zdXBwb3J0LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtc3lz
dGVtZC1BZGQtb3B0aW9uYWwtc3VwcG9ydC1mb3Itc3lzdGVtZC1zZF9ub3RpZnkucGF0Y2gKaW5k
ZXggYWNkYThmMWNlOS4uYWZiNDhhN2UxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1zeXN0ZW1kLUFkZC1vcHRpb25hbC1zdXBwb3J0
LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXN5c3RlbWQtQWRkLW9wdGlvbmFsLXN1cHBvcnQtZm9y
LXN5c3RlbWQtc2Rfbm90aWZ5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZTE4NzQzNTkx
MWNkZTZjYzNjZWY2OTgyYTUwODI2MTA3NGYxZTU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA5ZmZkMDU4MGU3NzM1NzlkN2EwM2RhNTZjNWI5Y2MzNmUzZWI4OTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTWF0dCBKb2xseSA8TWF0dC5Kb2xseUBmb290Y2xhbi5uaW5q
YT4KIERhdGU6IFRodSwgMiBGZWIgMjAyMyAyMTowNTo0MCArMTEwMAogU3ViamVjdDogW1BBVENI
XSBzeXN0ZW1kOiBBZGQgb3B0aW9uYWwgc3VwcG9ydCBmb3Igc3lzdGVtZCBgc2Rfbm90aWZ5YApA
QCAtOSwxNiArOSwxNyBAQCBwYXRjaCBiYXNlZCBvbiBKYWt1YiBKZWxlbidzIDxqamVsZW5AcmVk
aGF0LmNvbT4gb3JpZ2luYWwgcGF0Y2gKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRw
czovL2dpdGh1Yi5jb20vb3BlbnNzaC9vcGVuc3NoLXBvcnRhYmxlL3B1bGwvMzc1L2NvbW1pdHMv
YmUxODc0MzU5MTFjZGU2Y2MzY2VmNjk4MmE1MDgyNjEwNzRmMWU1Nl0KIAogU2lnbmVkLW9mZi1i
eTogWGlhbmd5dSBDaGVuIDx4aWFuZ3l1LmNoZW5Ad2luZHJpdmVyLmNvbT4KKwogLS0tCiAgY29u
ZmlndXJlLmFjIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAgc3NoZC5jICAgICAgIHwg
MTMgKysrKysrKysrKysrKwogIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAyMmZlZTcwZi4u
NDg2YzE4OWYgMTAwNjQ0CitpbmRleCAzNzljZDc0Li5hN2QwZTkyIDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC00ODM1LDYgKzQ4MzUsMjkgQEAgQUNf
U1VCU1QoW0dTU0xJQlNdKQorQEAgLTQ4NDIsNiArNDg0MiwyOSBAQCBBQ19TVUJTVChbR1NTTElC
U10pCiAgQUNfU1VCU1QoW0s1TElCU10pCiAgQUNfU1VCU1QoW0NIQU5ORUxMSUJTXSkKICAKQEAg
LTQ4LDcgKzQ5LDcgQEAgaW5kZXggMjJmZWU3MGYuLjQ4NmMxODlmIDEwMDY0NAogICMgTG9va2lu
ZyBmb3IgcHJvZ3JhbXMsIHBhdGhzIGFuZCBmaWxlcwogIAogIFBSSVZTRVBfUEFUSD0vdmFyL2Vt
cHR5Ci1AQCAtNTYzNCw2ICs1NjU3LDcgQEAgZWNobyAiICAgICAgICAgICAgICAgICAgIGxpYmxk
bnMgc3VwcG9ydDogJExETlNfTVNHIgorQEAgLTU2NTAsNiArNTY3Myw3IEBAIGVjaG8gIiAgICAg
ICAgICAgICAgICAgICBsaWJsZG5zIHN1cHBvcnQ6ICRMRE5TX01TRyIKICBlY2hvICIgIFNvbGFy
aXMgcHJvY2VzcyBjb250cmFjdCBzdXBwb3J0OiAkU1BDX01TRyIKICBlY2hvICIgICAgICAgICAg
IFNvbGFyaXMgcHJvamVjdCBzdXBwb3J0OiAkU1BfTVNHIgogIGVjaG8gIiAgICAgICAgIFNvbGFy
aXMgcHJpdmlsZWdlIHN1cHBvcnQ6ICRTUFBfTVNHIgpAQCAtNTcsNyArNTgsNyBAQCBpbmRleCAy
MmZlZTcwZi4uNDg2YzE4OWYgMTAwNjQ0CiAgZWNobyAiICAgICAgICAgICBUcmFuc2xhdGUgdjQg
aW4gdjYgaGFjazogJElQVjRfSU42X0hBQ0tfTVNHIgogIGVjaG8gIiAgICAgICAgICAgICAgICAg
IEJTRCBBdXRoIHN1cHBvcnQ6ICRCU0RfQVVUSF9NU0ciCiBkaWZmIC0tZ2l0IGEvc3NoZC5jIGIv
c3NoZC5jCi1pbmRleCA2MzIxOTM2Yy4uODU5ZDZhMGIgMTAwNjQ0CitpbmRleCA5Y2JlOTIyLi40
YjM0MmM1IDEwMDY0NAogLS0tIGEvc3NoZC5jCiArKysgYi9zc2hkLmMKIEBAIC04OCw2ICs4OCwx
MCBAQApAQCAtNzEsNyArNzIsNyBAQCBpbmRleCA2MzIxOTM2Yy4uODU5ZDZhMGIgMTAwNjQ0CiAg
I2luY2x1ZGUgInhtYWxsb2MuaCIKICAjaW5jbHVkZSAic3NoLmgiCiAgI2luY2x1ZGUgInNzaDIu
aCIKLUBAIC0zMTAsNiArMzE0LDEwIEBAIHN0YXRpYyB2b2lkCitAQCAtMzA4LDYgKzMxMiwxMCBA
QCBzdGF0aWMgdm9pZAogIHNpZ2h1cF9yZXN0YXJ0KHZvaWQpCiAgewogIAlsb2dpdCgiUmVjZWl2
ZWQgU0lHSFVQOyByZXN0YXJ0aW5nLiIpOwpAQCAtODIsNyArODMsNyBAQCBpbmRleCA2MzIxOTM2
Yy4uODU5ZDZhMGIgMTAwNjQ0CiAgCWlmIChvcHRpb25zLnBpZF9maWxlICE9IE5VTEwpCiAgCQl1
bmxpbmsob3B0aW9ucy5waWRfZmlsZSk7CiAgCXBsYXRmb3JtX3ByZV9yZXN0YXJ0KCk7Ci1AQCAt
MjA4Niw2ICsyMDk0LDExIEBAIG1haW4oaW50IGFjLCBjaGFyICoqYXYpCitAQCAtMjA5Myw2ICsy
MTAxLDExIEBAIG1haW4oaW50IGFjLCBjaGFyICoqYXYpCiAgCQkJfQogIAkJfQogIApAQCAtOTQs
NiArOTUsMyBAQCBpbmRleCA2MzIxOTM2Yy4uODU5ZDZhMGIgMTAwNjQ0CiAgCQkvKiBBY2NlcHQg
YSBjb25uZWN0aW9uIGFuZCByZXR1cm4gaW4gYSBmb3JrZWQgY2hpbGQgKi8KICAJCXNlcnZlcl9h
Y2NlcHRfbG9vcCgmc29ja19pbiwgJnNvY2tfb3V0LAogIAkJICAgICZuZXdzb2NrLCBjb25maWdf
cyk7Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBwb3J0LWZvci1idXN5Ym94LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvYWRkLXRlc3Qtc3VwcG9ydC1m
b3ItYnVzeWJveC5wYXRjaAppbmRleCBiODQwMmE0ZGVlLi4yOWFkMDVhYTczIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9hZGQtdGVzdC1zdXBw
b3J0LWZvci1idXN5Ym94LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzaC9vcGVuc3NoL2FkZC10ZXN0LXN1cHBvcnQtZm9yLWJ1c3lib3gucGF0Y2gKQEAgLTEsNCAr
MSw3IEBACi1BZGp1c3QgdGVzdCBjYXNlcyB0byB3b3JrIHdpdGggYnVzeWJveC4KK0Zyb20gNzZm
YWNlNzE3ODRmN2FkMWMyOTBiZWRkNjhlYzMzNGYwMTA3MTg2YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206ICJNYXhpbiBCLiBKb2huIiA8bWF4aW4uam9obkBlbmVhLmNvbT4KK0RhdGU6
IFRodSwgMjQgQXByIDIwMTQgMTg6MDA6MjIgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gQWRqdXN0
IHRlc3QgY2FzZXMgdG8gd29yayB3aXRoIGJ1c3lib3guCiAKIC0gUmVwbGFjZSBkZCBwYXJhbWV0
ZXIgIm9icyIgd2l0aCAiYnMiLgogLSBSZXBsYWNlICJoZWFkIC08bnVtPiIgd2l0aCAiaGVhZCAt
biA8bnVtPiIuCkBAIC02LDExICs5LDE3IEBAIEFkanVzdCB0ZXN0IGNhc2VzIHRvIHdvcmsgd2l0
aCBidXN5Ym94LgogU2lnbmVkLW9mZi1ieTogTWF4aW4gQi4gSm9obiA8bWF4aW4uam9obkBlbmVh
LmNvbT4KIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCi1JbmRleDogb3BlbnNzaC03LjZwMS9y
ZWdyZXNzL2NpcGhlci1zcGVlZC5zaAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG9wZW5zc2gtNy42cDEub3Jp
Zy9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAotKysrIG9wZW5zc2gtNy42cDEvcmVncmVzcy9jaXBo
ZXItc3BlZWQuc2gKLUBAIC0xNyw3ICsxNyw3IEBAIGZvciBjIGluIGAke1NTSH0gLVEgY2lwaGVy
YDsgZG8gbj0wOyBmb3IKKy0tLQorIHJlZ3Jlc3MvY2lwaGVyLXNwZWVkLnNoIHwgMiArLQorIHJl
Z3Jlc3Mva2V5LW9wdGlvbnMuc2ggIHwgMiArLQorIHJlZ3Jlc3MvdHJhbnNmZXIuc2ggICAgIHwg
MiArLQorIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQor
CitkaWZmIC0tZ2l0IGEvcmVncmVzcy9jaXBoZXItc3BlZWQuc2ggYi9yZWdyZXNzL2NpcGhlci1z
cGVlZC5zaAoraW5kZXggMTM0MGJkMS4uODc3MDc1NyAxMDA2NDQKKy0tLSBhL3JlZ3Jlc3MvY2lw
aGVyLXNwZWVkLnNoCisrKysgYi9yZWdyZXNzL2NpcGhlci1zcGVlZC5zaAorQEAgLTI3LDcgKzI3
LDcgQEAgZm9yIGMgaW4gYCR7U1NIfSAtUSBjaXBoZXJgOyBkbyBuPTA7IGZvciBtIGluIGAke1NT
SH0gLVEgbWFjYDsgZG8KICAJCXByaW50ZiAiJS02MHMiICIkYy8kbToiCiAgCQkoICR7U1NIfSAt
byAnY29tcHJlc3Npb24gbm8nIFwKICAJCQktRiAkT0JKL3NzaF9wcm94eSAtbSAkbSAtYyAkYyBz
b21laG9zdCBcCkBAIC0xOSwyNCArMjgsMTEgQEAgSW5kZXg6IG9wZW5zc2gtNy42cDEvcmVncmVz
cy9jaXBoZXItc3BlZWQuc2gKICAJCTwgJHtEQVRBfSApIDI+JjEgfCBnZXRieXRlcwogIAogIAkJ
aWYgWyAkPyAtbmUgMCBdOyB0aGVuCi1JbmRleDogb3BlbnNzaC03LjZwMS9yZWdyZXNzL3RyYW5z
ZmVyLnNoCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0gb3BlbnNzaC03LjZwMS5vcmlnL3JlZ3Jlc3MvdHJhbnNm
ZXIuc2gKLSsrKyBvcGVuc3NoLTcuNnAxL3JlZ3Jlc3MvdHJhbnNmZXIuc2gKLUBAIC0xMyw3ICsx
Myw3IEBAIGNtcCAke0RBVEF9ICR7Q09QWX0JCXx8IGZhaWwgImNvcnJ1cHRlZAotIGZvciBzIGlu
IDEwIDEwMCAxayAzMmsgNjRrIDEyOGsgMjU2azsgZG8KLSAJdHJhY2UgImRkLXNpemUgJHtzfSIK
LSAJcm0gLWYgJHtDT1BZfQotLQlkZCBpZj0kREFUQSBvYnM9JHtzfSAyPiAvZGV2L251bGwgfCBc
Ci0rCWRkIGlmPSREQVRBIGJzPSR7c30gMj4gL2Rldi9udWxsIHwgXAotIAkJJHtTU0h9IC1xIC1G
ICRPQkovc3NoX3Byb3h5IHNvbWVob3N0ICJjYXQgPiAke0NPUFl9IgotIAlpZiBbICQ/IC1uZSAw
IF07IHRoZW4KLSAJCWZhaWwgInNzaCBjYXQgJERBVEEgZmFpbGVkIgotSW5kZXg6IG9wZW5zc2gt
Ny42cDEvcmVncmVzcy9rZXktb3B0aW9ucy5zaAotPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG9wZW5zc2gtNy42
cDEub3JpZy9yZWdyZXNzL2tleS1vcHRpb25zLnNoCi0rKysgb3BlbnNzaC03LjZwMS9yZWdyZXNz
L2tleS1vcHRpb25zLnNoCi1AQCAtNDcsNyArNDcsNyBAQCBmb3IgZiBpbiAxMjcuMC4wLjEgJzEy
Ny4wLjAuMFwvOCc7IGRvCitkaWZmIC0tZ2l0IGEvcmVncmVzcy9rZXktb3B0aW9ucy5zaCBiL3Jl
Z3Jlc3Mva2V5LW9wdGlvbnMuc2gKK2luZGV4IDJmM2Q2NmUuLjdmODE2NmQgMTAwNjQ0CistLS0g
YS9yZWdyZXNzL2tleS1vcHRpb25zLnNoCisrKysgYi9yZWdyZXNzL2tleS1vcHRpb25zLnNoCitA
QCAtOTAsNyArOTAsNyBAQCBmb3IgZiBpbiAxMjcuMC4wLjEgJzEyNy4wLjAuMFwvOCc7IGRvCiAg
CWZpCiAgCiAgCXNlZCAncy8uKi9mcm9tPSInIiRmIiciICYvJyAkb3JpZ2tleXMgPiRhdXRoa2V5
cwpAQCAtNDUsMyArNDEsMTYgQEAgSW5kZXg6IG9wZW5zc2gtNy42cDEvcmVncmVzcy9rZXktb3B0
aW9ucy5zaAogIAl2ZXJib3NlICJrZXkgb3B0aW9uICRmcm9tIgogIAlyPWAke1NTSH0gLXEgLUYg
JE9CSi9zc2hfcHJveHkgc29tZWhvc3QgJ2VjaG8gdHJ1ZSdgCiAgCWlmIFsgIiRyIiA9ICJ0cnVl
IiBdOyB0aGVuCitkaWZmIC0tZ2l0IGEvcmVncmVzcy90cmFuc2Zlci5zaCBiL3JlZ3Jlc3MvdHJh
bnNmZXIuc2gKK2luZGV4IGNmMTc0YTAuLjQxY2ZkYzcgMTAwNjQ0CistLS0gYS9yZWdyZXNzL3Ry
YW5zZmVyLnNoCisrKysgYi9yZWdyZXNzL3RyYW5zZmVyLnNoCitAQCAtMTMsNyArMTMsNyBAQCBj
bXAgJHtEQVRBfSAke0NPUFl9CQl8fCBmYWlsICJjb3JydXB0ZWQgY29weSIKKyBmb3IgcyBpbiAx
MCAxMDAgMWsgMzJrIDY0ayAxMjhrIDI1Nms7IGRvCisgCXRyYWNlICJkZC1zaXplICR7c30iCisg
CXJtIC1mICR7Q09QWX0KKy0JZGQgaWY9JERBVEEgb2JzPSR7c30gMj4gL2Rldi9udWxsIHwgXAor
KwlkZCBpZj0kREFUQSBicz0ke3N9IDI+IC9kZXYvbnVsbCB8IFwKKyAJCSR7U1NIfSAtcSAtRiAk
T0JKL3NzaF9wcm94eSBzb21laG9zdCAiY2F0ID4gJHtDT1BZfSIKKyAJaWYgWyAkPyAtbmUgMCBd
OyB0aGVuCisgCQlmYWlsICJzc2ggY2F0ICREQVRBIGZhaWxlZCIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2ZpeC1wb3RlbnRpYWwtc2lnbmVk
LW92ZXJmbG93LWluLXBvaW50ZXItYXJpdGhtYXRpYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL2ZpeC1wb3RlbnRpYWwtc2lnbmVkLW92ZXJmbG93LWlu
LXBvaW50ZXItYXJpdGhtYXRpYy5wYXRjaAppbmRleCAyMDAzNmRhOTMxLi5iNmE4ZTNjMjY3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9maXgt
cG90ZW50aWFsLXNpZ25lZC1vdmVyZmxvdy1pbi1wb2ludGVyLWFyaXRobWF0aWMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvZml4LXBvdGVudGlh
bC1zaWduZWQtb3ZlcmZsb3ctaW4tcG9pbnRlci1hcml0aG1hdGljLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAzMzI4ZTk4YmNiZjI5MzBjZDdlZWEzZTZjOTJhZDVkY2JkZjQ3OTRmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1ZjMzM2VlMDkzYTgwOGQ5MWZiODE5Zjk1MjVlNzIx
MjI5NDExODI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogWXVhbmppZSBIdWFuZyA8
eXVhbmppZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyNCBBdWcgMjAxNiAwMzox
NTo0MyArMDAwMAogU3ViamVjdDogW1BBVENIXSBGaXggcG90ZW50aWFsIHNpZ25lZCBvdmVyZmxv
dyBpbiBwb2ludGVyIGFyaXRobWF0aWMKQEAgLTE0LDYgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTog
WXVhbmppZSBIdWFuZyA8eXVhbmppZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogCiBDb21wbGV0ZSB0
aGUgZml4CiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CisKIC0tLQogIG9wZW5ic2QtY29tcGF0L3N0cmxjYXQuYyB8IDEwICsrKysrKystLS0KICBv
cGVuYnNkLWNvbXBhdC9zdHJsY3B5LmMgfCAgOCArKysrKystLQpAQCAtMTA2LDYgKzEwNywzIEBA
IGluZGV4IDdhZDM1NzMuLjcwNDBmMWYgMTAwNjQ0CiArCXJldHVybiAoc2l6ZV90KSgodWludHB0
cl90KWNwIC0gKHVpbnRwdHJfdClzdHIpOwogIH0KICAjZW5kaWYKLS0tIAotMi4xNy4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzkuNXAx
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS42cDEuYmIK
c2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2hfOS41cDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzkuNnAxLmJiCmluZGV4IDAzMTJkNWJkNjYuLjYzNjZjZWZk
ZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3No
XzkuNXAxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3No
XzkuNnAxLmJiCkBAIC0yOCw3ICsyOCw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5vcGVuYnNk
Lm9yZy9wdWIvT3BlbkJTRC9PcGVuU1NIL3BvcnRhYmxlL29wZW5zc2gtJHtQVn0udGFyCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0
LWZpbGVzLW9uLWVycm8ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1zeXN0ZW1kLUFk
ZC1vcHRpb25hbC1zdXBwb3J0LWZvci1zeXN0ZW1kLXNkX25vdGlmeS5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMDI2ZTdiNzliYTdmYjU0MGY3NTE4MmFmOTZk
YzhhOGYxZGIzOTVmOTIyYmJjOWY2Y2E2MDM2NzI2ODYwODZiIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjkxMDIxMWMwNzI1NWE4YzVhZDY1NDM5MWI0MGVlNTk4MDA3MTBkZDgxMTlkZDUzNjJkZTA5
Mzg1YWE3YTc3N2MiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMjc2OF0gPSAibm90LWFwcGxpY2Fi
bGUtY29uZmlnOiBUaGlzIENWRSBpcyBzcGVjaWZpYyB0byBPcGVuU1NIIHdpdGggdGhlIHBhbSBv
cGllIHdoaWNoIHdlIGRvbid0IGJ1aWxkL3VzZSBoZXJlLiIKIAotLSAKMi40Mi4wCgo=

--===============4485135466667567038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1859 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6b2f0b4aebbba9f28e298e6582332a47dd0f7795"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6b2f0b4aebbba9f28e298e6582332a47dd0f7795"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 323 Local 312 Mirrors 0 Missed 11 Current 437 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 449 of 760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_recipe_qa_setscene)
NOTE: recipe openssh-9.6p1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssh-9.6p1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1469 of 2106 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_fetch)
NOTE: recipe openssh-9.6p1-r0: task do_fetch: Started
NOTE: recipe openssh-9.6p1-r0: task do_fetch: Succeeded
NOTE: Running task 2085 of 2106 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_unpack)
NOTE: Running task 2086 of 2106 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-9.6p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssh-9.6p1-r0: task do_unpack: Started
NOTE: recipe openssh-9.6p1-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2106 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch)
NOTE: Running task 2088 of 2106 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_collect_spdx_deps)
NOTE: recipe openssh-9.6p1-r0: task do_patch: Started
NOTE: recipe openssh-9.6p1-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssh-9.6p1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssh-9.6p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssh-9.6p1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2088 tasks of which 2083 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215054918.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215054918.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: openssh-9.6p1-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: openssh-9.6p1-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/9.6p1/temp/log.do_patch.563394
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_9.6p1.bb:do_patch) failed with exit code '1'

--===============4485135466667567038==--

