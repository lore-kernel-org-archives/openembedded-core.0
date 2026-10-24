Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1852.1792822995997329520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZKqAdMaZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z4mi4uku;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a16c93e7f2-523c6fde-d2c1-4ed7-b8dd-30119833e29b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822995;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FV0OaDkFj4e/Tm6oPjmOjSeuDn8SIbVo4GL0koL58Pw=;
	b=ZKqAdMaZZYt9vCtRK/JpUyESPf+BgMTGC4R7Vhvw5lZZNI1yuyauVYkqeJJ7r2yA
	ACVg6JTkBkKX+jX8b92URTanRiYadhtKgOwbWkGbHyEfX3OCrFoVCVCC1oFlWnnnaOV
	/AS4Mat8CY4HREg+0fm7KV0OuGNsv0/s671l29UU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822995;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FV0OaDkFj4e/Tm6oPjmOjSeuDn8SIbVo4GL0koL58Pw=;
	b=Z4mi4ukucIt1atQd7ejHSnpA7cSAZCcVe2mNmA9L5uydJubevbTQK5KiiyX9jAMW
	5Y/UNTVZY7rFvrKhhAJcSgu5RBRBEB2SrTkA80FSluk1UJ7B6WiD8LBERWnJvO2w6Pv
	TtqgiCXUeBeFECrgHljZkWtGviQ1cUL5mdxf73yc=
Content-Type: multipart/mixed; boundary="===============2179955665883918898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.90.1 SUCCEEDED
Message-ID: <010101a16c93e7f2-523c6fde-d2c1-4ed7-b8dd-30119833e29b-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248572

--===============2179955665883918898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-networking* to *2.90.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.90.0-2.90.1.patch
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
From e360189c3286208bca0b98eb1ad91359109f3ba9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:09:33 +0000
Subject: [PATCH] glib-networking: upgrade 2.90.0 -> 2.90.1

2.90.1 - October 23, 2026
=========================
---
 .../{glib-networking_2.90.0.bb => glib-networking_2.90.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.90.0.bb => glib-networking_2.90.1.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.90.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
index 1850712690..ca701cc89a 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "83a75e3d9c36b66ee86d3281c2fc997816101968a5126ba322b2acb9a74dd8c0"
+SRC_URI[archive.sha256sum] = "ea95636590098355a05e3027579dba1a9a950b05e456b2488ea03d82e4b6c18a"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.47.1


--===============2179955665883918898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 976928 to 988864 (+1%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8844 to 8760 (-1%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 11195 to 11339 (+1%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kab: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kab: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kw: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-kw: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lo: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lo: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nb: PKGSIZE changed from 3456 to 8033 (+132%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pt: PKGSIZE changed from 8399 to 8521 (+1%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-uz: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-uz: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 358868 to 369024 (+3%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-ptest: FILELIST: added "/usr/libexec/installed-tests/glib-networking/files/ssl/server-with-invalid-purpose.conf /usr/libexec/installed-tests/glib-networking/files/server-with-invalid-purpose.pem"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 737581 to 745973 (+1%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-src: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-src: FILELIST: directory renamed /usr/src/debug/glib-networking/2.90.0/tls/tests -> /usr/src/debug/glib-networking/2.90.1/tls/tests, directory renamed /usr/src/debug/glib-networking/2.90.0/proxy/tests -> /usr/src/debug/glib-networking/2.90.1/proxy/tests, directory renamed /usr/src/debug/glib-networking/2.90.0/tls/base -> /usr/src/debug/glib-networking/2.90.1/tls/base, directory renamed /usr/src/debug/glib-networking/2.90.0/tls/gnutls -> /usr/src/debug/glib-networking/2.90.1/tls/gnutls, directory renamed /usr/src/debug/glib-networking/2.90.0/proxy/environment -> /usr/src/debug/glib-networking/2.90.1/proxy/environment, directory renamed /usr/src/debug/glib-networking/2.90.0/tls/tests/pkcs11 -> /usr/src/debug/glib-networking/2.90.1/tls/tests/pkcs11
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking/glib-networking: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking/glib-networking: PV changed from "2.90.0" to "2.90.1"
packages/x86-64-v3-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.90/glib-networking-2.90.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//glib-networking/2.90/glib-networking-2.90.1.tar.xz;name=archive file://run-ptest"
packages/x86-64-v3-poky-linux/glib-networking: PACKAGES: added "glib-networking-locale-nn"
packages/x86-64-v3-poky-linux/glib-networking: PKGV changed from 2.90.0 [default] to 2.90.1 [default]
packages/x86-64-v3-poky-linux/glib-networking: PV changed from "2.90.0" to "2.90.1"

--===============2179955665883918898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="glib-networking-changelog.txt"

2.90.1 - October 23, 2026
=========================

--===============2179955665883918898==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.90.0-2.90.1.patch"

RnJvbSBlMzYwMTg5YzMyODYyMDhiY2EwYjk4ZWIxYWQ5MTM1OTEwOWYzYmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6MDk6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi45MC4wIC0+IDIuOTAuMQoKMi45MC4xIC0gT2N0b2Jl
ciAyMywgMjAyNgo9PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLQogLi4uL3tnbGliLW5ldHdv
cmtpbmdfMi45MC4wLmJiID0+IGdsaWItbmV0d29ya2luZ18yLjkwLjEuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL3tnbGliLW5ldHdvcmtpbmdfMi45MC4wLmJi
ID0+IGdsaWItbmV0d29ya2luZ18yLjkwLjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjkwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuOTAuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGli
LW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuOTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjkwLjEuYmIKaW5kZXgg
MTg1MDcxMjY5MC4uY2E3MDFjYzg5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjkwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjkwLjEuYmIKQEAgLTEzLDcg
KzEzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1Mzgw
Y2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogU0VDVElPTiA9ICJsaWJzIgogREVQRU5EUyA9ICJn
bGliLTIuMC1uYXRpdmUgZ2xpYi0yLjAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjgzYTc1ZTNkOWMzNmI2NmVlODZkMzI4MWMyZmM5OTc4MTYxMDE5NjhhNTEyNmJhMzIyYjJhY2I5
YTc0ZGQ4YzAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlYTk1NjM2NTkwMDk4MzU1
YTA1ZTMwMjc1NzlkYmExYTlhOTUwYjA1ZTQ1NmIyNDg4ZWEwM2Q4MmU0YjZjMThhIgogCiAjIFVw
c3RyZWFtIG5vdGUgdGhhdCBmb3IgdGhlIG9wZW5zc2wgYmFja2VuZCwgaGFsZiB0aGUgdGVzdHMg
d2hlcmUgdGhpcyBiYWNrZW5kIGRvbid0IHJldHVybgogIyB0aGUgZXhwZWN0ZWQgZXJyb3IgY29k
ZSBvciBkb24ndCB3b3JrIGFzIGV4cGVjdGVkIHNvIGRlZmF1bHQgdG8gZ251dGxzCi0tIAoyLjQ3
LjEKCg==

--===============2179955665883918898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glib-networking/glib-networking-locale-nb: PKGSIZE changed from 3456 to 8033 (+132%)
packages/x86-64-v3-poky-linux/glib-networking/glib-networking-ptest: FILELIST: added "/usr/libexec/installed-tests/glib-networking/files/server-with-invalid-purpose.pem /usr/libexec/installed-tests/glib-networking/files/ssl/server-with-invalid-purpose.conf"
packages/x86-64-v3-poky-linux/glib-networking: PACKAGES: added "glib-networking-locale-nn"

--===============2179955665883918898==--
