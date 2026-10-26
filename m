Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36782.1792991666856256932
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 22:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=af+gMpgB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rNIA56LX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a176a19ea6-dbbe6256-c42b-40ab-87fc-b47e439b60cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792991666;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=10vBx2nze0a8Hz46eIKNRc0XwQYOn52QuvIZzu8Jns4=;
	b=af+gMpgB12EL87wk/wE2gUkAOjr5/D7zHmL1uDyAUfQhvRvoMkviifPL4KLhzvC6
	f0l30/e8BifnDvrdkJNuEZXazHOP5GZBts6NPQXHxJ/EsdEvUEkXhH5eft2qYYEpyJt
	P+oje48XX3mXAHbZssz6Kh4wf06PyU8fEckXUGWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792991666;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=10vBx2nze0a8Hz46eIKNRc0XwQYOn52QuvIZzu8Jns4=;
	b=rNIA56LXSO045GKXo8iRiOjHtF09PQFxXwqeWezxYrY2vbfgy48xTY1fCC4nSXL/
	/8YTgn4nUV4FEO3BroWX0KoKTo4wEf662Dg4D3s9lEZtEs/AFt4Q4y+FS2dat8wZm+a
	DD6UVuSNLkzHPBCDCSfvAX2xc02nAauuFfCfyMCc=
Content-Type: multipart/mixed; boundary="===============0756784457436627621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.8.1 SUCCEEDED
Message-ID: <010101a176a19ea6-dbbe6256-c42b-40ab-87fc-b47e439b60cc-000000@us-west-2.amazonses.com>
Date: Mon, 26 Oct 2026 05:14:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.26-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 05:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248631

--===============0756784457436627621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsoup* to *3.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.8.0-3.8.1.patch
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
From aa4fa4e67f3bb772227c1d586f9d90890f5fdbdf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 26 Oct 2026 05:14:22 +0000
Subject: [PATCH] libsoup: upgrade 3.8.0 -> 3.8.1

Changes in libsoup from 3.8.0 to 3.8.1:
---
 .../libsoup/{libsoup_3.8.0.bb => libsoup_3.8.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.8.0.bb => libsoup_3.8.1.bb} (97%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
similarity index 97%
rename from meta/recipes-support/libsoup/libsoup_3.8.0.bb
rename to meta/recipes-support/libsoup/libsoup_3.8.1.bb
index 1ca40423f0..3d20b09e5c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 inherit gettext gnomebase upstream-version-is-even gobject-introspection gi-docgen vala ptest-gnome
 
-SRC_URI[archive.sha256sum] = "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08e149211103df6d638a2238"
+SRC_URI[archive.sha256sum] = "5013dcef9136f6f861e6529fca578af50c1f52a39219027fb5aff652d1371a04"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.1


--===============0756784457436627621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsoup: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.8/libsoup-3.8.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//libsoup/3.8/libsoup-3.8.1.tar.xz;name=archive file://run-ptest"
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 8207064 to 8233120 (+0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: FILELIST: removed "/usr/lib/.debug/libsoup-3.0.so.0.8.0", added "/usr/lib/.debug/libsoup-3.0.so.0.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PKGSIZE changed from 1113129 to 1113185 (+0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-doc: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kab: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kab: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kk: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kk: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kw: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kw: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PKGSIZE changed from 4319 to 4599 (+6%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-ptest: PKGSIZE changed from 3378273 to 3391987 (+0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-ptest: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-ptest: FILELIST: added "/usr/libexec/installed-tests/libsoup-3.0/compressed-data/multiframe.zst"
packages/x86-64-v3-poky-linux/libsoup/libsoup-ptest: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 2876188 to 2892364 (+1%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: FILELIST: directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/server -> /usr/src/debug/libsoup/3.8.1/libsoup/server, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/hsts -> /usr/src/debug/libsoup/3.8.1/libsoup/hsts, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/websocket -> /usr/src/debug/libsoup/3.8.1/libsoup/websocket, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/cookies -> /usr/src/debug/libsoup/3.8.1/libsoup/cookies, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/server/http2 -> /usr/src/debug/libsoup/3.8.1/libsoup/server/http2, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/server/http1 -> /usr/src/debug/libsoup/3.8.1/libsoup/server/http1, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/content-sniffer -> /usr/src/debug/libsoup/3.8.1/libsoup/content-sniffer, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/http2 -> /usr/src/debug/libsoup/3.8.1/libsoup/http2, directory ren
 amed /usr/src/debug/libsoup/3.8.0/tests -> /usr/src/debug/libsoup/3.8.1/tests, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/auth -> /usr/src/debug/libsoup/3.8.1/libsoup/auth, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/http1 -> /usr/src/debug/libsoup/3.8.1/libsoup/http1, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/content-decoder -> /usr/src/debug/libsoup/3.8.1/libsoup/content-decoder, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup -> /usr/src/debug/libsoup/3.8.1/libsoup, directory renamed /usr/src/debug/libsoup/3.8.0/libsoup/cache -> /usr/src/debug/libsoup/3.8.1/libsoup/cache
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.8.0" to "3.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup: PKGSIZE changed from 743688 to 747784 (+1%)
packages/x86-64-v3-poky-linux/libsoup/libsoup: PKGV changed from 3.8.0 [default] to 3.8.1 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup: FILELIST: removed "/usr/lib/libsoup-3.0.so.0.8.0", added "/usr/lib/libsoup-3.0.so.0.8.1"
packages/x86-64-v3-poky-linux/libsoup/libsoup: PV changed from "3.8.0" to "3.8.1"
Changes to packages/x86-64-v3-poky-linux/libsoup (sysroot):
  /usr/lib/libsoup-3.0.so.0 changed symlink target from libsoup-3.0.so.0.8.0 to libsoup-3.0.so.0.8.1
  /usr/lib/libsoup-3.0.so.0.8.0 moved to /usr/lib/libsoup-3.0.so.0.8.1

--===============0756784457436627621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libsoup-changelog.txt"

Changes in libsoup from 3.8.0 to 3.8.1:

--===============0756784457436627621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libsoup/libsoup-ptest: FILELIST: added "/usr/libexec/installed-tests/libsoup-3.0/compressed-data/multiframe.zst"
packages/x86-64-v3-poky-linux/libsoup/libsoup: FILELIST: removed "/usr/lib/libsoup-3.0.so.0.8.0", added "/usr/lib/libsoup-3.0.so.0.8.1"
Changes to packages/x86-64-v3-poky-linux/libsoup (sysroot):
  /usr/lib/libsoup-3.0.so.0 changed symlink target from libsoup-3.0.so.0.8.0 to libsoup-3.0.so.0.8.1
  /usr/lib/libsoup-3.0.so.0.8.0 moved to /usr/lib/libsoup-3.0.so.0.8.1

--===============0756784457436627621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.8.0-3.8.1.patch"

RnJvbSBhYTRmYTRlNjdmM2JiNzcyMjI3YzFkNTg2ZjlkOTA4OTBmNWZkYmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjYgT2N0IDIwMjYgMDU6MTQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb3VwOiB1cGdyYWRlIDMuOC4wIC0+IDMuOC4xCgpDaGFuZ2VzIGluIGxpYnNvdXAgZnJvbSAz
LjguMCB0byAzLjguMToKLS0tCiAuLi4vbGlic291cC97bGlic291cF8zLjguMC5iYiA9PiBsaWJz
b3VwXzMuOC4xLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJz
b3VwL3tsaWJzb3VwXzMuOC4wLmJiID0+IGxpYnNvdXBfMy44LjEuYmJ9ICg5NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuOC4wLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuOC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8z
LjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMu
OC4xLmJiCmluZGV4IDFjYTQwNDIzZjAuLjNkMjBiMDllNWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy44LjEuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5E
UyA9ICJnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgbGlieG1sMiBzcWxpdGUzIGxpYnBzbCBuZ2h0
dHAyIgogCiBpbmhlcml0IGdldHRleHQgZ25vbWViYXNlIHVwc3RyZWFtLXZlcnNpb24taXMtZXZl
biBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZhbGEgcHRlc3QtZ25vbWUKIAotU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYmJmMDhmYTNlMDNhODhjMzFhM2QyN2EwZDg3Y2I0
MjJlOTQ5MGYyZDA4ZTE0OTIxMTEwM2RmNmQ2MzhhMjIzOCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjUwMTNkY2VmOTEzNmY2Zjg2MWU2NTI5ZmNhNTc4YWY1MGMxZjUyYTM5MjE5MDI3
ZmI1YWZmNjUyZDEzNzFhMDQiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKLS0g
CjIuNDcuMQoK

--===============0756784457436627621==--
