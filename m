Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8DECD5BA2
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34815.1778851225744947672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=t8Q76PI1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZUjhweYq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e2bcb9f67-057fd322-4453-4a95-97b3-9de4f6dce295-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=82i6wnh9TXsxrCS8GHaG0cd8fdwSuKDH6H3s0hjfQJ8=;
	b=t8Q76PI1k8thkTdAVEgiKtk9pTQnXKc/Xnupg2+to6RgA/98lovUOU5c9IeW+Ju/
	tRirXp7gn5l7awEt2rIK+baVrGZchtn/cUngk3ot5lkQ1vDT9OJNhdLTpbj5pIPaiB5
	i55mLTN3NnWrKHEv5v3nifwqrx0p+rnzyNDoPVS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=82i6wnh9TXsxrCS8GHaG0cd8fdwSuKDH6H3s0hjfQJ8=;
	b=ZUjhweYqsq4BlheV6TjtkaRZC/qsLKpL3IUt8UNp5ldHbP6Yu/CSwLTnXv4tYXH7
	l9SwKIut0l1LSEZe4hK+RIbLdtSv21jjulVl1ORbw3yIlagsjfzNJFaRSW1Y38Bh3Sd
	Y0vj37B+BF85R4z2i+TzbYKoWV3bjg2zr+JHZBfg=
Content-Type: multipart/mixed; boundary="===============4240435678672958626=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] neard: upgrading to 0.20 FAILED
Message-ID: <0101019e2bcb9f67-057fd322-4453-4a95-97b3-9de4f6dce295-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237093

--===============4240435678672958626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *neard* to *0.20* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-neard-upgrade-0.19-0.20.patch
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
From d22c0e535657bd716fded863562da9caa27ebee5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 06:42:48 +0000
Subject: [PATCH] neard: upgrade 0.19 -> 0.20

---
 ...Add-header-dependency-to-nciattach.o.patch |  9 ++----
 .../Makefile.am-do-not-ship-version.h.patch   |  9 ++----
 .../Makefile.am-fix-parallel-issue.patch      | 30 -------------------
 .../neard/{neard_0.19.bb => neard_0.20.bb}    |  5 ++--
 4 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
 rename meta/recipes-connectivity/neard/{neard_0.19.bb => neard_0.20.bb} (93%)

diff --git a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
index d8e8a5e5da..8971ddacf4 100644
--- a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -1,4 +1,4 @@
-From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From 7d43398f67ae9eec7669b42a4f8b15e75947f783 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 17 Mar 2017 14:24:29 +0200
 Subject: [PATCH] Add header dependency to nciattach.o
@@ -19,10 +19,10 @@ Upstream-Status: Submitted [mailinglist]
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index fa552ee..acef6ba 100644
+index d865e84..1c81d58 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -253,6 +253,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+@@ -258,6 +258,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
  
  $(src_neard_OBJECTS) \
  $(tools_nfctool_nfctool_OBJECTS) \
@@ -30,6 +30,3 @@ index fa552ee..acef6ba 100644
  $(plugin_objects) \
  $(se_seeld_OBJECTS) \
  $(unit_test_ndef_parse_OBJECTS) \
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
index 16875e0543..272b84d2c6 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
@@ -1,4 +1,4 @@
-From bfd32d68cfc9f1e31dab88e07446d1c02bc80b5e Mon Sep 17 00:00:00 2001
+From b7b5e997f086f0436877a93348ba1dad2dbb3ce3 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 12 Feb 2015 00:39:29 -0800
 Subject: [PATCH] Makefile.am: do not ship version.h
@@ -10,11 +10,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- Makefile.am |    4 ++--
+ Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3334790..69cd58f 100644
+index 592fb7c..d865e84 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -10,11 +10,11 @@ pkginclude_HEADERS = include/types.h include/log.h include/plugin.h \
@@ -31,6 +31,3 @@ index 3334790..69cd58f 100644
  			$(noinst_HEADERS), include/near/$(notdir $(file)))
  
  gdbus_sources = gdbus/gdbus.h gdbus/mainloop.c gdbus/watch.c \
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
deleted file mode 100644
index aeb33a5bdc..0000000000
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 15 Jan 2015 18:12:07 -0800
-Subject: [PATCH] Makefile.am: fix parallel issue
-
-There might be no src dir if src/builtin.h runs earlier, create it to
-fix the race issue:
-
-src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
-/bin/sh: src/builtin.h: No such file or directory
-
-Upstream-Status: Backport [d39f8c0eee659743b4425d395c2f7ab1949e9c71]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: neard-0.16/Makefile.am
-===================================================================
---- neard-0.16.orig/Makefile.am
-+++ neard-0.16/Makefile.am
-@@ -244,6 +244,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(di
- src/plugin.$(OBJEXT): src/builtin.h
- 
- src/builtin.h: src/genbuiltin $(builtin_sources)
-+	$(AM_V_at)$(MKDIR_P) src
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
- 
- se/plugin.$(OBJEXT): se/builtin.h
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.20.bb
similarity index 93%
rename from meta/recipes-connectivity/neard/neard_0.19.bb
rename to meta/recipes-connectivity/neard/neard_0.20.bb
index c1149e7631..a583da827f 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.20.bb
@@ -10,12 +10,11 @@ DEPENDS = "dbus glib-2.0 libnl autoconf-archive-native"
 
 SRC_URI = "git://github.com/linux-nfc/neard;protocol=https;branch=master \
            file://neard.in \
-           file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
-          "
+           "
 
-SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
+SRCREV = "7118668bc92fe15a8ff5e4067abd5e1622524f03"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.47.1


--===============4240435678672958626==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-neard-upgrade-0.19-0.20.patch"

RnJvbSBkMjJjMGU1MzU2NTdiZDcxNmZkZWQ4NjM1NjJkYTljYWEyN2ViZWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDY6NDI6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZWFyZDogdXBncmFkZSAwLjE5IC0+IDAuMjAKCi0tLQogLi4uQWRkLWhlYWRlci1kZXBlbmRlbmN5
LXRvLW5jaWF0dGFjaC5vLnBhdGNoIHwgIDkgKystLS0tCiAuLi4vTWFrZWZpbGUuYW0tZG8tbm90
LXNoaXAtdmVyc2lvbi5oLnBhdGNoICAgfCAgOSArKy0tLS0KIC4uLi9NYWtlZmlsZS5hbS1maXgt
cGFyYWxsZWwtaXNzdWUucGF0Y2ggICAgICB8IDMwIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9u
ZWFyZC97bmVhcmRfMC4xOS5iYiA9PiBuZWFyZF8wLjIwLmJifSAgICB8ICA1ICsrLS0KIDQgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFt
LWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmVhcmQve25lYXJkXzAuMTkuYmIgPT4gbmVhcmRfMC4yMC5iYn0gKDkzJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkLzAwMDEtQWRkLWhlYWRl
ci1kZXBlbmRlbmN5LXRvLW5jaWF0dGFjaC5vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZWFyZC9uZWFyZC8wMDAxLUFkZC1oZWFkZXItZGVwZW5kZW5jeS10by1uY2lhdHRhY2gu
by5wYXRjaAppbmRleCBkOGU4YTVlNWRhLi44OTcxZGRhY2Y0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkLzAwMDEtQWRkLWhlYWRlci1kZXBlbmRlbmN5
LXRvLW5jaWF0dGFjaC5vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVh
cmQvbmVhcmQvMDAwMS1BZGQtaGVhZGVyLWRlcGVuZGVuY3ktdG8tbmNpYXR0YWNoLm8ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGFmZmFhMjAyMWE1NGMzMDM1M2U0ZTFmZWUwOWMxM2E0ZGUy
MTk2YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdkNDMzOThmNjdhZTllZWM3NjY5
YjQyYTRmOGIxNWU3NTk0N2Y3ODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNz
aSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxNyBNYXIg
MjAxNyAxNDoyNDoyOSArMDIwMAogU3ViamVjdDogW1BBVENIXSBBZGQgaGVhZGVyIGRlcGVuZGVu
Y3kgdG8gbmNpYXR0YWNoLm8KQEAgLTE5LDEwICsxOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbbWFpbGluZ2xpc3RdCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAK
IGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBmYTU1MmVlLi5h
Y2VmNmJhIDEwMDY0NAoraW5kZXggZDg2NWU4NC4uMWM4MWQ1OCAxMDA2NDQKIC0tLSBhL01ha2Vm
aWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTI1Myw2ICsyNTMsNyBAQCBzZS9idWlsdGlu
Lmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zZV9zb3VyY2VzKQorQEAgLTI1OCw2ICsyNTgs
NyBAQCBzZS9idWlsdGluLmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zZV9zb3VyY2VzKQog
IAogICQoc3JjX25lYXJkX09CSkVDVFMpIFwKICAkKHRvb2xzX25mY3Rvb2xfbmZjdG9vbF9PQkpF
Q1RTKSBcCkBAIC0zMCw2ICszMCwzIEBAIGluZGV4IGZhNTUyZWUuLmFjZWY2YmEgMTAwNjQ0CiAg
JChwbHVnaW5fb2JqZWN0cykgXAogICQoc2Vfc2VlbGRfT0JKRUNUUykgXAogICQodW5pdF90ZXN0
X25kZWZfcGFyc2VfT0JKRUNUUykgXAotLS0gCi0yLjExLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZC9NYWtlZmlsZS5hbS1kby1ub3Qtc2hpcC12
ZXJzaW9uLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01h
a2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaAppbmRleCAxNjg3NWUwNTQzLi4y
NzJiODRkMmM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25l
YXJkL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZl
cnNpb24uaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmZkMzJkNjhjZmM5ZjFlMzFkYWI4
OGUwNzQ0NmQxYzAyYmM4MGI1ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjdiNWU5
OTdmMDg2ZjA0MzY4NzdhOTMzNDhiYTFkYWQyZGJiM2NlMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAxMiBGZWIgMjAxNSAwMDozOToyOSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBNYWtlZmls
ZS5hbTogZG8gbm90IHNoaXAgdmVyc2lvbi5oCkBAIC0xMCwxMSArMTAsMTEgQEAgVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFu
Z0B3aW5kcml2ZXIuY29tPgogLS0tCi0gTWFrZWZpbGUuYW0gfCAgICA0ICsrLS0KKyBNYWtlZmls
ZS5hbSB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCAz
MzM0NzkwLi42OWNkNThmIDEwMDY0NAoraW5kZXggNTkyZmI3Yy4uZDg2NWU4NCAxMDA2NDQKIC0t
LSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTEwLDExICsxMCwxMSBAQCBw
a2dpbmNsdWRlX0hFQURFUlMgPSBpbmNsdWRlL3R5cGVzLmggaW5jbHVkZS9sb2cuaCBpbmNsdWRl
L3BsdWdpbi5oIFwKQEAgLTMxLDYgKzMxLDMgQEAgaW5kZXggMzMzNDc5MC4uNjljZDU4ZiAxMDA2
NDQKICAJCQkkKG5vaW5zdF9IRUFERVJTKSwgaW5jbHVkZS9uZWFyLyQobm90ZGlyICQoZmlsZSkp
KQogIAogIGdkYnVzX3NvdXJjZXMgPSBnZGJ1cy9nZGJ1cy5oIGdkYnVzL21haW5sb29wLmMgZ2Ri
dXMvd2F0Y2guYyBcCi0tLSAKLTEuNy45LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9uZWFyZC9uZWFyZC9NYWtlZmlsZS5hbS1maXgtcGFyYWxsZWwtaXNzdWUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkL01ha2VmaWxlLmFtLWZp
eC1wYXJhbGxlbC1pc3N1ZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWVi
MzNhNWJkYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJk
L25lYXJkL01ha2VmaWxlLmFtLWZpeC1wYXJhbGxlbC1pc3N1ZS5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDMwICswLDAgQEAKLUZyb20gNDNhY2M1NmQ1NTA2YzdlMzE4ZjcxN2ZiMzYzNGJjMTZl
MzQzODkxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJvYmVydCBZYW5nIDxsaWV6
aGkueWFuZ0B3aW5kcml2ZXIuY29tPgotRGF0ZTogVGh1LCAxNSBKYW4gMjAxNSAxODoxMjowNyAt
MDgwMAotU3ViamVjdDogW1BBVENIXSBNYWtlZmlsZS5hbTogZml4IHBhcmFsbGVsIGlzc3VlCi0K
LVRoZXJlIG1pZ2h0IGJlIG5vIHNyYyBkaXIgaWYgc3JjL2J1aWx0aW4uaCBydW5zIGVhcmxpZXIs
IGNyZWF0ZSBpdCB0bwotZml4IHRoZSByYWNlIGlzc3VlOgotCi1zcmMvZ2VuYnVpbHRpbiBuZmN0
eXBlMSBuZmN0eXBlMiBuZmN0eXBlMyBuZmN0eXBlNCBwMnAgPiBzcmMvYnVpbHRpbi5oCi0vYmlu
L3NoOiBzcmMvYnVpbHRpbi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ci0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2QzOWY4YzBlZWU2NTk3NDNiNDQyNWQzOTVjMmY3YWIxOTQ5ZTlj
NzFdCi0KLVNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIu
Y29tPgotLS0tCi0gTWFrZWZpbGUuYW0gfCAgICAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKLQotSW5kZXg6IG5lYXJkLTAuMTYvTWFrZWZpbGUuYW0KLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBuZWFyZC0wLjE2Lm9yaWcvTWFrZWZpbGUuYW0KLSsrKyBuZWFyZC0wLjE2L01ha2VmaWxlLmFt
Ci1AQCAtMjQ0LDYgKzI0NCw3IEBAIFNFRF9QUk9DRVNTID0gJChBTV9WX0dFTikkKE1LRElSX1Ap
ICQoZGkKLSBzcmMvcGx1Z2luLiQoT0JKRVhUKTogc3JjL2J1aWx0aW4uaAotIAotIHNyYy9idWls
dGluLmg6IHNyYy9nZW5idWlsdGluICQoYnVpbHRpbl9zb3VyY2VzKQotKwkkKEFNX1ZfYXQpJChN
S0RJUl9QKSBzcmMKLSAJJChBTV9WX0dFTikkKHNyY2Rpcikvc3JjL2dlbmJ1aWx0aW4gJChidWls
dGluX21vZHVsZXMpID4gJEAKLSAKLSBzZS9wbHVnaW4uJChPQkpFWFQpOiBzZS9idWlsdGluLmgK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4xOS5i
YiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4yMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJk
L25lYXJkXzAuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQv
bmVhcmRfMC4yMC5iYgppbmRleCBjMTE0OWU3NjMxLi5hNTgzZGE4MjdmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkXzAuMTkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjIwLmJiCkBAIC0xMCwxMiArMTAsMTEg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIGxpYm5sIGF1dG9jb25mLWFyY2hpdmUtbmF0aXZl
IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGludXgtbmZjL25lYXJkO3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vbmVhcmQuaW4gXAotICAg
ICAgICAgICBmaWxlOi8vTWFrZWZpbGUuYW0tZml4LXBhcmFsbGVsLWlzc3VlLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovL01ha2VmaWxlLmFtLWRvLW5vdC1zaGlwLXZlcnNpb24uaC5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1oZWFkZXItZGVwZW5kZW5jeS10by1uY2lhdHRh
Y2guby5wYXRjaCBcCi0gICAgICAgICAgIgorICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJhMWRj
OGE3NWNiYTk5OTcyOGUxNTRhMGY4MTFhYjlkZDUwYzgwOWY3IgorU1JDUkVWID0gIjcxMTg2Njhi
YzkyZmUxNWE4ZmY1ZTQwNjdhYmQ1ZTE2MjI1MjRmMDMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBr
Z2NvbmZpZyBzeXN0ZW1kIHVwZGF0ZS1yYy5kCiAKLS0gCjIuNDcuMQoK

--===============4240435678672958626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4559d599a35839db3510eec46717408ee691de98"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4559d599a35839db3510eec46717408ee691de98"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 337 Local 323 Mirrors 0 Missed 14 Current 656 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 874 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_create_spdx_setscene)
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 942 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 947 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_spdx_setscene)
NOTE: Running task 1413 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe neard-0.20-r0: task do_recipe_qa: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 955 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 963 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 964 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe neard-0.20-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_recipe_qa unihash changed to 1bb5c0ff674e02c51c318b350cb27db6aebe702522c8d5b3fab78101dbb72eea
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1572 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 982 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: recipe neard-0.20-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe neard-0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1573 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 984 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 985 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe neard-0.20-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2344 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_create_recipe_spdx)
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe neard-0.20-r0: task do_unpack: Succeeded
NOTE: Running task 2363 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_patch)
NOTE: recipe neard-0.20-r0: task do_patch: Started
NOTE: recipe neard-0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe neard-0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe neard-0.20-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 2365 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic)
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Started
NOTE: recipe neard-0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_deploy_source_date_epoch unihash changed to 7782d7f416f40304c7cd4d2394a0ddd45260ac1ee9ce677b141fc8e7c034d020
NOTE: Setscene tasks completed
NOTE: Running task 2366 of 2378 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure)
NOTE: recipe neard-0.20-r0: task do_configure: Started
NOTE: recipe neard-0.20-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_populate_lic unihash changed to 87ef655b9a11ac009f3ace839c086d3984b1b3510ea7f401a17d8f9823a4265c
NOTE: recipe neard-0.20-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2366 tasks of which 2357 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515064225.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515064225.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.4183703
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: neard-0.20-r0 do_configure: QA Issue: neard: configure was passed unrecognised options: --with-systemduserunitdir [unknown-configure-option]
ERROR: neard-0.20-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/neard/0.20/temp/log.do_configure.4183703
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/neard/neard_0.20.bb:do_configure) failed with exit code '1'

--===============4240435678672958626==--

