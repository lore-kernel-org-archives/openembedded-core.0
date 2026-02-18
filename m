Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BECC531F2
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1397.1771440108104830528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1ErG0H9S;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rYJoL0oH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720f0d63-15862410-e834-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xd8U+YXPNgUz/f3CGzNjnjwYErCpBUShrTY0/BnisZw=;
	b=1ErG0H9SOtQP7C4Pccr/KnOcXBMKJWml+0HeFmhuxPugxEAIcih7ZGH+53MLFHDK
	ofNzYOcZWf7+JJypQ9c/SK7qMKqTmujBcztq6wz95EkZ2aX+LUEry7/6cnSVsb4D5mQ
	Zrd68ruuxJI3GUir6gpsYOslKoLDncmwBrRGteas=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xd8U+YXPNgUz/f3CGzNjnjwYErCpBUShrTY0/BnisZw=;
	b=rYJoL0oHMmT0LOcsHZe6VapWzTn3lFPmZqM60yBRZz1ZOEHZJTolXwhi5VWqCBKP
	p3AjhElhTPlZOjstLvuk35yNf0EJ5VFNQname+nj8wgKwoe2foPBC2WdSBf2z6sJtLV
	vZRKmGsgDLTa2v+FEvhnmuLbjD/CS0nU0MEBspfk=
Content-Type: multipart/mixed; boundary="===============3173507061559146512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED
Message-ID: <0101019c720f0d63-15862410-e834-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231409

--===============3173507061559146512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.26.1-0.26.2.patch
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
From 7989a9c0715e3d49a9e19644f2c85d498a44c137 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:35:41 +0000
Subject: [PATCH] p11-kit: upgrade 0.26.1 -> 0.26.2

---
 .../p11-kit/{p11-kit_0.26.1.bb => p11-kit_0.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.1.bb => p11-kit_0.26.2.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
index 44ad776d59..fa41b45feb 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "49ccc27a1e433d6128d40a43c7ecc4624b0dbfde"
+SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.47.1


--===============3173507061559146512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.7", added "/usr/lib/libp11-kit.so.0.4.8"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.7 to libp11-kit.so.0.4.8
  /usr/lib/libp11-kit.so.0.4.7 moved to /usr/lib/libp11-kit.so.0.4.8

--===============3173507061559146512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/p11-kit: SRC_URI changed from "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.1" to "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.2"
packages/x86-64-v3-poky-linux/p11-kit: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 16268856 to 16270496 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: FILELIST: removed "/usr/lib/.debug/libp11-kit.so.0.4.7", added "/usr/lib/.debug/libp11-kit.so.0.4.8"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 2027135 to 2027147 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: FILELIST: directory renamed /usr/src/debug/p11-kit/0.26.1/common -> /usr/src/debug/p11-kit/0.26.2/common, directory renamed /usr/src/debug/p11-kit/0.26.1/p11-kit -> /usr/src/debug/p11-kit/0.26.2/p11-kit, directory renamed /usr/src/debug/p11-kit/0.26.1/trust -> /usr/src/debug/p11-kit/0.26.2/trust
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGV changed from 0.26.1 [default] to 0.26.2 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PV changed from "0.26.1" to "0.26.2"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.7", added "/usr/lib/libp11-kit.so.0.4.8"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.7 to libp11-kit.so.0.4.8
  /usr/lib/libp11-kit.so.0.4.7 moved to /usr/lib/libp11-kit.so.0.4.8

--===============3173507061559146512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.26.1-0.26.2.patch"

RnJvbSA3OTg5YTljMDcxNWUzZDQ5YTllMTk2NDRmMmM4NWQ0OThhNDRjMTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6MzU6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjYuMSAtPiAwLjI2LjIKCi0tLQogLi4uL3AxMS1raXQve3AxMS1r
aXRfMC4yNi4xLmJiID0+IHAxMS1raXRfMC4yNi4yLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvcDExLWtpdC97cDExLWtpdF8wLjI2LjEuYmIgPT4gcDExLWtpdF8wLjI2
LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9w
MTEta2l0XzAuMjYuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8w
LjI2LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuMi5iYgppbmRleCA0NGFkNzc2ZDU5Li5mYTQxYjQ1
ZmViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4y
Ni4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2LjIu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUzphcHBlbmQgPSAiJHtAJyBnbGliLTIuMCcgaWYg
ZC5nZXRWYXIoJ0dUS0RPQ19FTkFCTEVEJykgPT0gJ1RydWUnIGVsc2UgJycKIAogU1JDX1VSSSA9
ICJnaXRzbTovL2dpdGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI0OWNjYzI3YTFl
NDMzZDYxMjhkNDBhNDNjN2VjYzQ2MjRiMGRiZmRlIgorU1JDUkVWID0gIjhlNmU0ZTZkNjRkOWZl
OTFjNjJiMDA1MmMxMDViMmI3MmQ0YzI0ZWYiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNL
QUdFQ09ORklHW21hbnBhZ2VzXSA9ICItRG1hbj10cnVlLC1EbWFuPWZhbHNlLGxpYnhzbHQtbmF0
aXZlIgotLSAKMi40Ny4xCgo=

--===============3173507061559146512==--

