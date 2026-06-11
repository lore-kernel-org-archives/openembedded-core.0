Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77293CDB469
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50618.1781195511185228388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P0X+5On0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cWKG1aNP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb78691bb-0ffea503-17ec-43c8-b79c-9f23b9bf96f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uDgNvIOjnFfsMdzYKzZfCD1uq0EvCdlD9Svpp7gmEFk=;
	b=P0X+5On0D/JkohKCVWluw0iFAQ1e1OMg+wmNAvNvnRWP3kBnayzY1To48rqK0UBl
	lyP6dmxHF2imuxOR60TuewKvQuPIf0a+LsSNXo+U8vfdNMw78i4gbaeEiospQD0NgPf
	oB61GYTPDOtlDEUxkBceHQKtNFn+DdckOSIyvZ+M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uDgNvIOjnFfsMdzYKzZfCD1uq0EvCdlD9Svpp7gmEFk=;
	b=cWKG1aNPNw4x+st8PEJrtFH1qPw73czQsURb6L75eLZ6pq0Ow1F220gv+r+BPOE4
	985HfSkruDmGhpKp4LjiEF0n+kmC2CGHheC5YFW/T10ZEQL4yOrlX2iFEDFdDiH63KP
	iO41fCtKtBiYjgFmXyBLkUt2zRsJkrInZpr2sPAA=
Content-Type: multipart/mixed; boundary="===============1007242777060539629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.4.4 SUCCEEDED
Message-ID: <0101019eb78691bb-0ffea503-17ec-43c8-b79c-9f23b9bf96f3-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238513

--===============1007242777060539629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.4.2-3.4.4.patch
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
From c958ec18facf154d2ff458c60f26b7a0918e81c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:40:57 +0000
Subject: [PATCH] rsync: upgrade 3.4.2 -> 3.4.4

---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index e6d3578e85..ede0238b2e 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
+From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,7 +50,7 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index b948f16..afca81d 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -63,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index ccad28a..bbb09ba 100644
+index 229a889..aa158ad 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index fd96b873c8..a8fee5ba0a 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
+From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 80e9d72..a7d313c 100644
+index 0ba2d5c..b9c5438 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index fb195b1e68..914b50a7b7 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
+From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c2fe775..80e9d72 100644
+index 79060b3..0ba2d5c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
+@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.4.bb
index 5fe1bc2c2b..fa9a61778f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
+SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============1007242777060539629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.4.2.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.4.4.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/x86-64-v3-poky-linux/rsync: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1381616 to 1435976 (+4%)
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGSIZE changed from 300234 to 300231 (-0%)
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: FILELIST: directory renamed /usr/src/debug/rsync/3.4.2/lib -> /usr/src/debug/rsync/3.4.4/lib, removed "/usr/src/debug/rsync/3.4.2/rsync.c /usr/src/debug/rsync/3.4.2/token.c /usr/src/debug/rsync/3.4.2/compat.c /usr/src/debug/rsync/3.4.2/socket.c /usr/src/debug/rsync/3.4.2/help-rsync.h /usr/src/debug/rsync/3.4.2/options.c /usr/src/debug/rsync/3.4.2/authenticate.c /usr/src/debug/rsync/3.4.2/byteorder.h /usr/src/debug/rsync/3.4.2/checksum.c /usr/src/debug/rsync/3.4.2/backup.c /usr/src/debug/rsync/3.4.2/connection.c /usr/src/debug/rsync/3.4.2/cleanup.c /usr/src/debug/rsync/3.4.2/receiver.c /usr/src/debug/rsync/3.4.2/main.c /usr/src/debug/rsync/3.4.2/pipe.c /usr/src/debug/rsync/3.4.2/acls.c /usr/src/debug/rsync/3.4.2/help-rsyncd.h /usr/src/debug/rsync/3.4.2/clientserver.c /usr/src/debug/rsync/3.4.2/generator.c /usr/src/debug/rsync/3.4.2/progress.c /usr/src/debug/rsync/3.4.2/exclude.c /usr/src/debug/rsync/3.4.2/inums.h /usr/src/debug/rsync/3.4.
 2/delete.c /usr/src/debug/rsync/3.4.2/proto.h /usr/src/debug/rsync/3.4.2/rsync.h /usr/src/debug/rsync/3.4.2/io.h /usr/src/debug/rsync/3.4.2/clientname.c /usr/src/debug/rsync/3.4.2/syscall.c /usr/src/debug/rsync/3.4.2/usage.c /usr/src/debug/rsync/3.4.2/util2.c /usr/src/debug/rsync/3.4.2/util1.c /usr/src/debug/rsync/3.4.2/uidlist.c /usr/src/debug/rsync/3.4.2/chmod.c /usr/src/debug/rsync/3.4.2/flist.c /usr/src/debug/rsync/3.4.2/batch.c /usr/src/debug/rsync/3.4.2/hlink.c /usr/src/debug/rsync/3.4.2/log.c /usr/src/debug/rsync/3.4.2/match.c /usr/src/debug/rsync/3.4.2/daemon-parm.h /usr/src/debug/rsync/3.4.2/access.c /usr/src/debug/rsync/3.4.2/params.c /usr/src/debug/rsync/3.4.2/xattrs.c /usr/src/debug/rsync/3.4.2/fileio.c /usr/src/debug/rsync/3.4.2/io.c /usr/src/debug/rsync/3.4.2/ifuncs.h /usr/src/debug/rsync/3.4.2/itypes.h /usr/src/debug/rsync/3.4.2/hashtable.c /usr/src/debug/rsync/3.4.2/loadparm.c /usr/src/debug/rsync/3.4.2/sender.c", added "/usr/src/debug/rsync/3.4.4/compat.c /usr/src/d
 ebug/rsync/3.4.4/socket.c /usr/src/debug/rsync/3.4.4/help-rsync.h /usr/src/debug/rsync/3.4.4/options.c /usr/src/debug/rsync/3.4.4/authenticate.c /usr/src/debug/rsync/3.4.4/byteorder.h /usr/src/debug/rsync/3.4.4/backup.c /usr/src/debug/rsync/3.4.4/connection.c /usr/src/debug/rsync/3.4.4/cleanup.c /usr/src/debug/rsync/3.4.4/receiver.c /usr/src/debug/rsync/3.4.4/usage.c /usr/src/debug/rsync/3.4.4/checksum.c /usr/src/debug/rsync/3.4.4/main.c /usr/src/debug/rsync/3.4.4/pipe.c /usr/src/debug/rsync/3.4.4/acls.c /usr/src/debug/rsync/3.4.4/help-rsyncd.h /usr/src/debug/rsync/3.4.4/clientserver.c /usr/src/debug/rsync/3.4.4/generator.c /usr/src/debug/rsync/3.4.4/progress.c /usr/src/debug/rsync/3.4.4/exclude.c /usr/src/debug/rsync/3.4.4/inums.h /usr/src/debug/rsync/3.4.4/delete.c /usr/src/debug/rsync/3.4.4/log.c /usr/src/debug/rsync/3.4.4/proto.h /usr/src/debug/rsync/3.4.4/rsync.h /usr/src/debug/rsync/3.4.4/clientname.c /usr/src/debug/rsync/3.4.4/syscall.c /usr/src/debug/rsync/3.4.4/util1.c /usr
 /src/debug/rsync/3.4.4/util2.c /usr/src/debug/rsync/3.4.4/chmod.c /usr/src/debug/rsync/3.4.4/flist.c /usr/src/debug/rsync/3.4.4/batch.c /usr/src/debug/rsync/3.4.4/hlink.c /usr/src/debug/rsync/3.4.4/match.c /usr/src/debug/rsync/3.4.4/rsync.c /usr/src/debug/rsync/3.4.4/token.c /usr/src/debug/rsync/3.4.4/uidlist.c /usr/src/debug/rsync/3.4.4/daemon-parm.h /usr/src/debug/rsync/3.4.4/fileio.c /usr/src/debug/rsync/3.4.4/android.c /usr/src/debug/rsync/3.4.4/ifuncs.h /usr/src/debug/rsync/3.4.4/io.c /usr/src/debug/rsync/3.4.4/itypes.h /usr/src/debug/rsync/3.4.4/access.c /usr/src/debug/rsync/3.4.4/params.c /usr/src/debug/rsync/3.4.4/xattrs.c /usr/src/debug/rsync/3.4.4/io.h /usr/src/debug/rsync/3.4.4/hashtable.c /usr/src/debug/rsync/3.4.4/loadparm.c /usr/src/debug/rsync/3.4.4/sender.c"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1244830 to 1309251 (+5%)
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PV changed from "3.4.2" to "3.4.4"
packages/x86-64-v3-poky-linux/rsync/rsync: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 530434 to 550914 (+4%)

--===============1007242777060539629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.4.2-3.4.4.patch"

RnJvbSBjOTU4ZWMxOGZhY2YxNTRkMmZmNDU4YzYwZjI2YjdhMDkxOGU4MWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6NDA6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjQuMiAtPiAzLjQuNAoKLS0tCiAuLi4tQWRkLW1pc3NpbmctcHJvdG90
eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggfCA4ICsrKystLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoICAgICAgICAgfCA0ICsr
LS0KIC4uLi9yc3luYy9maWxlcy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoICAgICAgICAgICAg
ICAgICB8IDYgKysrLS0tCiAuLi4vcnN5bmMve3JzeW5jXzMuNC4yLmJiID0+IHJzeW5jXzMuNC40
LmJifSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy97
cnN5bmNfMy40LjIuYmIgPT4gcnN5bmNfMy40LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBl
cy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xh
cmF0aW9ucy5wYXRjaAppbmRleCBlNmQzNTc4ZTg1Li5lZGUwMjM4YjJlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5
cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMvZmlsZXMvMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9u
LWRlY2xhcmF0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDZjYmU1YjcwYjVjYmY5
ODFjZjY5MzEzN2FjMDgxY2FjYmJiMmUyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YzA1Y2MxMTNmOTI1YmRhNjQ1YzhlNTFiODNlOWRjMzBiMDU0M2JhZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24s
IDI5IEF1ZyAyMDIyIDE5OjUzOjI4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5n
IHByb3RvdHlwZXMgdG8gZnVuY3Rpb24gZGVjbGFyYXRpb25zCkBAIC01MCw3ICs1MCw3IEBAIGlu
ZGV4IDI0ZGU2NGYuLmE3ODc0ODggMTAwNjQ0CiAgCWlmIChwYXJ0aWFsX3N0cmluZ19idWYpIHsK
ICAJCWlmIChwYXJ0aWFsX3N0cmluZ19sZW4pCiBkaWZmIC0tZ2l0IGEvbG9nLmMgYi9sb2cuYwot
aW5kZXggZTRiYTFjYy4uODQ4MmI3MSAxMDA2NDQKK2luZGV4IGI5NDhmMTYuLmFmY2E4MWQgMTAw
NjQ0CiAtLS0gYS9sb2cuYwogKysrIGIvbG9nLmMKIEBAIC0xMzEsNyArMTMxLDcgQEAgc3RhdGlj
IHZvaWQgbG9naXQoaW50IHByaW9yaXR5LCBjb25zdCBjaGFyICpidWYpCkBAIC02MywxMSArNjMs
MTEgQEAgaW5kZXggZTRiYTFjYy4uODQ4MmI3MSAxMDA2NDQKICAJaW50IG9wdGlvbnMgPSBMT0df
UElEOwogIAogZGlmZiAtLWdpdCBhL21haW4uYyBiL21haW4uYwotaW5kZXggY2NhZDI4YS4uYmJi
MDliYSAxMDA2NDQKK2luZGV4IDIyOWE4ODkuLmFhMTU4YWQgMTAwNjQ0CiAtLS0gYS9tYWluLmMK
ICsrKyBiL21haW4uYwogQEAgLTI0Niw3ICsyNDYsNyBAQCB2b2lkIHJlYWRfZGVsX3N0YXRzKGlu
dCBmKQotIAlzdGF0cy5kZWxldGVkX2ZpbGVzICs9IHN0YXRzLmRlbGV0ZWRfc3BlY2lhbHMgPSBy
ZWFkX3ZhcmludChmKTsKKyAJc3RhdHMuZGVsZXRlZF9maWxlcyArPSBzdGF0cy5kZWxldGVkX3Nw
ZWNpYWxzID0gcmVhZF92YXJpbnRfYm91bmRlZChmLCAwLCBNQVhfV0lSRV9ERUxfU1RBVCwgImRl
bGV0ZWRfc3BlY2lhbHMiKTsKICB9CiAgCiAtc3RhdGljIHZvaWQgYmVjb21lX2NvcHlfYXNfdXNl
cigpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJt
aXNtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlzbS5w
YXRjaAppbmRleCBmZDk2Yjg3M2M4Li5hOGZlZTViYTBhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGI4MTBkNzhhOTMyN2I1YjMxM2ViYzBhYTFhMGIxNTVkZTdjMTBhZmQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDMyODUyMDI4ZTk1Y2RmNzhkMDlmMWJkODY3ZjNiNDZiNDcyOGY5
ZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFN1biwgMjEgRmViIDIwMjEgMDk6
NDU6NDggKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcnN5bmM6IEZpeCBhIGZpbGUgc29ydGluZyBk
ZXRlcm1pbmlzbSBpc3N1ZQpAQCAtMjUsNyArMjUsNyBAQCBodHRwczovL2dpdGh1Yi5jb20vV2F5
bmVEL3JzeW5jL2NvbW1pdC9kMzA4NWY3YWRkMzhhNWNmODMzYTBiMzFjYjA2MzdmZjQ2YzgwZjhk
CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZp
bGUuaW4gYi9NYWtlZmlsZS5pbgotaW5kZXggODBlOWQ3Mi4uYTdkMzEzYyAxMDA2NDQKK2luZGV4
IDBiYTJkNWMuLmI5YzU0MzggMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZp
bGUuaW4KIEBAIC0yNyw2ICsyNywxMSBAQCBNS0RJUl9QPUBNS0RJUl9QQApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVpbGQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWls
ZC5wYXRjaAppbmRleCBmYjE5NWIxZTY4Li45MTRiNTBhN2I3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvbWFrZWZpbGUtbm8tcmVidWlsZC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDYwOGY1ZWJiMjZlMmU0NzQ4NjdiZWM2YzNkNjdk
ZmQwYTc2NjNmMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTBlZjVjY2Q5MTQ5Y2Vl
MjdiYWUyOWU3NjdmZjFjMmU3NmJkYzg3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDEyIEFwciAy
MDE2IDE1OjUxOjU0ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJzeW5jOiByZW1vdmUgdXBzdHJl
YW0ncyByZWJ1aWxkIGxvZ2ljCkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNTQgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRl
eCBjMmZlNzc1Li44MGU5ZDcyIDEwMDY0NAoraW5kZXggNzkwNjBiMy4uMGJhMmQ1YyAxMDA2NDQK
IC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTE4NSw2MCArMTg1LDYg
QEAgY29uZjogY29uZmlndXJlLnNoIGNvbmZpZy5oLmluCitAQCAtMjAwLDYwICsyMDAsNiBAQCBj
b25mOiBjb25maWd1cmUuc2ggY29uZmlnLmguaW4KICAuUEhPTlk6IGdlbgogIGdlbjogY29uZiBw
cm90by5oIG1hbiBnaXQtdmVyc2lvbi5oCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMvcnN5bmNfMy40LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMv
cnN5bmNfMy40LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy40LjQuYmIKaW5kZXggNWZlMWJjMmMyYi4uZmE5YTYxNzc4
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNC4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjQuNC5iYgpAQCAtMTYs
NyArMTYsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQuc2FtYmEub3JnL3B1Yi8ke0JQ
Tn0vc3JjLyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9kZXRlcm1pc20ucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0
aW9uLWRlY2xhcmF0aW9ucy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmZjEwYWEyYzE1MWNkNGIyZGJiZTYxMzUxMjZkYmM4NTQwNDYxMTNkMmRmYjQ5NTcyYTM0
ODIzMzI2N2ViMzE1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkODhjZjgyZmE2NTNkYTMyMzE0
ZmIyMjkxMzY0MDdjNWM5MGY4MGQxNzU4ZDhmNGIwOTE3Njc4NzdkOGZhOTYiCiAKICMgT3V0LW9m
LXRyZWUgYnVpbGRzIGRvbid0IGluc3RhbGwgdGhlIGRvY3VtZW50YXRpb24gY3VycmVudGx5CiAj
IGh0dHBzOi8vZ2l0aHViLmNvbS9Sc3luY1Byb2plY3QvcnN5bmMvaXNzdWVzLzg0NgotLSAKMi40
Ny4xCgo=

--===============1007242777060539629==--

