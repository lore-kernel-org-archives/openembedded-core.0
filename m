Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A45FC19777
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.42640.1738416060597163915
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OI3QTKMF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FZ6aCfyc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194c1abf60e-77a330a7-f761-4930-a0fc-e0d1f56e4241-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xhFaA7VKWibABvD5qP7WA0ktZfcy/FegBkdAHxMFKZo=;
	b=OI3QTKMFizSyNw7mN/FoPvKS2A185uYLWo3/fIjwk4hzJ2fiFQEcI4vXS6qAwVYK
	zCQVUpcy2um+3b0jL5Puav4VKZ3x9uXIZQnL9NlSGhh6yDh+tX5Vmz2L6XRRq4mFQVw
	B2uO9zlZFWvyAP6o6+RwdBeXk/7OC+zehi8+19zk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xhFaA7VKWibABvD5qP7WA0ktZfcy/FegBkdAHxMFKZo=;
	b=FZ6aCfyc4H6dcjG5lFvWvbVHDFxxwQccDH+2L73gah6SrGWsYmg9GXyXTguMDxWI
	R105WCgMDthzKfzw91ykf4K1evXa/tZZJRBbY+JM0FM2dXnFdEQoUTcGihfUFr+/jTu
	lJqwoPWlcyKaqV+VPjFMGoCNMqsbAvvVuSmYwoLQ=
Content-Type: multipart/mixed; boundary="===============3336928935363246035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.33 SUCCEEDED
Message-ID: <01010194c1abf60e-77a330a7-f761-4930-a0fc-e0d1f56e4241-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210564

--===============3336928935363246035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mc* to *4.8.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mc-upgrade-4.8.32-4.8.33.patch
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
From bb8c32b8dfb793ae7c39ed8a1daca6a881b351e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 10:06:28 +0000
Subject: [PATCH] mc: upgrade 4.8.32 -> 4.8.33

---
 meta/recipes-extended/mc/files/nomandate.patch          | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.32.bb => mc_4.8.33.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.32.bb => mc_4.8.33.bb} (97%)

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index 92fa443865..297d2c7bd1 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,4 +1,4 @@
-From 78c5fd90a052f95157b3914c708a08b2eeab0154 Mon Sep 17 00:00:00 2001
+From 75b0c46bce7438fd4d4cf3d18c2d83f874793111 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 4 Feb 2020 18:12:15 +0000
 Subject: [PATCH] mc: Fix manpage date indeterminism
@@ -20,7 +20,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
-index 96f9f10..d734c5d 100644
+index ede02e4..19300eb 100644
 --- a/doc/man/date-of-man-include.am
 +++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-extended/mc/mc_4.8.32.bb b/meta/recipes-extended/mc/mc_4.8.33.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.32.bb
rename to meta/recipes-extended/mc/mc_4.8.33.bb
index 97d4cc0b01..ec50cfc7ce 100644
--- a/meta/recipes-extended/mc/mc_4.8.32.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "51a039ebd15d5e442312a7053a4ca28276b7f241050b7714d5bae5362ecd3319"
+SRC_URI[sha256sum] = "a3ceb0af84226fedfe5f339464ff2849c3f6bf0321b72027c47b2c10e66a6dba"
 
 inherit autotools gettext pkgconfig
 
-- 
2.44.1


--===============3336928935363246035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mc: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc: SRC_URI changed from "http://ftp.midnight-commander.org/mc-4.8.32.tar.bz2 file://nomandate.patch" to "http://ftp.midnight-commander.org/mc-4.8.33.tar.bz2 file://nomandate.patch"
packages/core2-64-poky-linux/mc/mc-dbg: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-dbg: PKGSIZE changed from 3974008 to 3971496 (-0%)
packages/core2-64-poky-linux/mc/mc-dbg: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-dev: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-dev: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-doc: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-doc: PKGSIZE changed from 1082312 to 1083697 (+0%)
packages/core2-64-poky-linux/mc/mc-doc: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-helpers-perl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-helpers-perl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-helpers: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-helpers: PKGSIZE changed from 105889 to 120975 (+14%)
packages/core2-64-poky-linux/mc/mc-helpers: FILELIST: added "/usr/libexec/mc/extfs.d/torrent"
packages/core2-64-poky-linux/mc/mc-helpers: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-af: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-af: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ar: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ar: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-az: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-az: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-be: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-be: PKGSIZE changed from 115320 to 115203 (-0%)
packages/core2-64-poky-linux/mc/mc-locale-be: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-bg: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-bg: PKGSIZE changed from 104895 to 104075 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-bg: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-br: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-br: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ca: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ca: PKGSIZE changed from 95498 to 95566 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-ca: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-cs: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-cs: PKGSIZE changed from 90154 to 89750 (-0%)
packages/core2-64-poky-linux/mc/mc-locale-cs: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-da: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-da: PKGSIZE changed from 83689 to 83083 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-da: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-de-ch: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-de-ch: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-de: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-de: PKGSIZE changed from 89675 to 91043 (+2%)
packages/core2-64-poky-linux/mc/mc-locale-de: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-el: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-el: PKGSIZE changed from 54858 to 54245 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-el: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PKGSIZE changed from 85718 to 85268 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-en-gb: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-eo: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-eo: PKGSIZE changed from 89592 to 88429 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-eo: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-es: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-es: PKGSIZE changed from 90912 to 90890 (-0%)
packages/core2-64-poky-linux/mc/mc-locale-es: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-et: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-et: PKGSIZE changed from 88901 to 88921 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-et: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-eu: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-eu: PKGSIZE changed from 77564 to 77036 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-eu: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-fa: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-fa: PKGSIZE changed from 17599 to 17320 (-2%)
packages/core2-64-poky-linux/mc/mc-locale-fa: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-fi: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-fi: PKGSIZE changed from 41528 to 41187 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-fi: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-fr-ca: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-fr-ca: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-fr: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-fr: PKGSIZE changed from 96253 to 96944 (+1%)
packages/core2-64-poky-linux/mc/mc-locale-fr: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ga: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ga: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-gl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-gl: PKGSIZE changed from 79852 to 79297 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-gl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-he: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-he: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-hr: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-hr: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-hu: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-hu: PKGSIZE changed from 74333 to 73771 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-hu: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ia: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ia: PKGSIZE changed from 27075 to 26744 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ia: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-id: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-id: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ie: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ie: PKGSIZE changed from 18924 to 18792 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ie: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-it: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-it: PKGSIZE changed from 84466 to 90348 (+7%)
packages/core2-64-poky-linux/mc/mc-locale-it: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ja: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ja: PKGSIZE changed from 37542 to 37042 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ja: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ka: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ka: PKGSIZE changed from 65740 to 65005 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ka: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-kk: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-kk: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ko: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ko: PKGSIZE changed from 90218 to 89350 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ko: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-kw: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-kw: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-lt: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-lt: PKGSIZE changed from 46746 to 46437 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-lt: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-lv: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-lv: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-mn: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-mn: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-nb: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-nb: PKGSIZE changed from 88142 to 88115 (-0%)
packages/core2-64-poky-linux/mc/mc-locale-nb: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-nl-be: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-nl-be: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-nl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-nl: PKGSIZE changed from 84131 to 83535 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-nl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-pl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-pl: PKGSIZE changed from 93576 to 93585 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-pl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PKGSIZE changed from 98564 to 98818 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-pt-br: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-pt: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-pt: PKGSIZE changed from 92576 to 92072 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-pt: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ro: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ro: PKGSIZE changed from 87947 to 87331 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-ro: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ru: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ru: PKGSIZE changed from 116030 to 116081 (+0%)
packages/core2-64-poky-linux/mc/mc-locale-ru: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-sk: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-sk: PKGSIZE changed from 78911 to 78308 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-sk: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-sl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-sl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-sr: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-sr: PKGSIZE changed from 92594 to 91900 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-sr: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-sv: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-sv: PKGSIZE changed from 77593 to 77051 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-sv: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-szl: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-szl: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-ta: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-ta: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-te: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-te: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-tr: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-tr: PKGSIZE changed from 79601 to 79043 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-tr: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-uk: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-uk: PKGSIZE changed from 109505 to 108754 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-uk: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-uz: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-uz: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-vi: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-vi: PKGSIZE changed from 23130 to 22996 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-vi: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-wa: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-wa: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PKGSIZE changed from 73245 to 72739 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-zh-cn: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PKGSIZE changed from 47576 to 47265 (-1%)
packages/core2-64-poky-linux/mc/mc-locale-zh-tw: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-shell: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-shell: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-src: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-src: PKGSIZE changed from 3967839 to 3978427 (+0%)
packages/core2-64-poky-linux/mc/mc-src: FILELIST: directory renamed /usr/src/debug/mc/4.8.32/lib/search -> /usr/src/debug/mc/4.8.33/lib/search, directory renamed /usr/src/debug/mc/4.8.32/src/editor -> /usr/src/debug/mc/4.8.33/src/editor, directory renamed /usr/src/debug/mc/4.8.32/lib/tty -> /usr/src/debug/mc/4.8.33/lib/tty, directory renamed /usr/src/debug/mc/4.8.32/lib/skin -> /usr/src/debug/mc/4.8.33/lib/skin, directory renamed /usr/src/debug/mc/4.8.32/lib/filehighlight -> /usr/src/debug/mc/4.8.33/lib/filehighlight, directory renamed /usr/src/debug/mc/4.8.32/src -> /usr/src/debug/mc/4.8.33/src, directory renamed /usr/src/debug/mc/4.8.32/lib/mcconfig -> /usr/src/debug/mc/4.8.33/lib/mcconfig, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/extfs -> /usr/src/debug/mc/4.8.33/src/vfs/extfs, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/tar -> /usr/src/debug/mc/4.8.33/src/vfs/tar, directory renamed /usr/src/debug/mc/4.8.32/lib/vfs -> /usr/src/debug/mc/4.8.33/lib/vfs, directory re
 named /usr/src/debug/mc/4.8.32/lib/strutil -> /usr/src/debug/mc/4.8.33/lib/strutil, directory renamed /usr/src/debug/mc/4.8.32/src/viewer -> /usr/src/debug/mc/4.8.33/src/viewer, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/ftpfs -> /usr/src/debug/mc/4.8.33/src/vfs/ftpfs, directory renamed /usr/src/debug/mc/4.8.32/src/vfs -> /usr/src/debug/mc/4.8.33/src/vfs, directory renamed /usr/src/debug/mc/4.8.32/lib/widget -> /usr/src/debug/mc/4.8.33/lib/widget, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/cpio -> /usr/src/debug/mc/4.8.33/src/vfs/cpio, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/shell -> /usr/src/debug/mc/4.8.33/src/vfs/shell, directory renamed /usr/src/debug/mc/4.8.32/src/subshell -> /usr/src/debug/mc/4.8.33/src/subshell, directory renamed /usr/src/debug/mc/4.8.32/src/consaver -> /usr/src/debug/mc/4.8.33/src/consaver, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/sfs -> /usr/src/debug/mc/4.8.33/src/vfs/sfs, directory renamed /usr/src/debug/mc/4.8.32/src/
 diffviewer -> /usr/src/debug/mc/4.8.33/src/diffviewer, directory renamed /usr/src/debug/mc/4.8.32/src/vfs/local -> /usr/src/debug/mc/4.8.33/src/vfs/local, directory renamed /usr/src/debug/mc/4.8.32/lib/event -> /usr/src/debug/mc/4.8.33/lib/event, removed "/usr/src/debug/mc/4.8.32/src/filemanager/cd.h /usr/src/debug/mc/4.8.32/src/filemanager/panelize.h /usr/src/debug/mc/4.8.32/src/filemanager/ext.c /usr/src/debug/mc/4.8.32/src/filemanager/info.c /usr/src/debug/mc/4.8.32/lib/keybind.h /usr/src/debug/mc/4.8.32/lib/glibcompat.c /usr/src/debug/mc/4.8.32/src/filemanager/ext.h /usr/src/debug/mc/4.8.32/src/filemanager/treestore.c /usr/src/debug/mc/4.8.32/src/filemanager/cd.c /usr/src/debug/mc/4.8.32/src/filemanager/panelize.c /usr/src/debug/mc/4.8.32/lib/glibcompat.h /usr/src/debug/mc/4.8.32/lib/keybind.c /usr/src/debug/mc/4.8.32/src/filemanager/info.h /usr/src/debug/mc/4.8.32/src/filemanager/treestore.h /usr/src/debug/mc/4.8.32/src/filemanager/find.c /usr/src/debug/mc/4.8.32/lib/timefmt.h 
 /usr/src/debug/mc/4.8.32/lib/strutil.h /usr/src/debug/mc/4.8.32/lib/util.h /usr/src/debug/mc/4.8.32/src/filemanager/layout.h /usr/src/debug/mc/4.8.32/src/filemanager/ioblksize.h /usr/src/debug/mc/4.8.32/lib/timefmt.c /usr/src/debug/mc/4.8.32/src/filemanager/layout.c /usr/src/debug/mc/4.8.32/lib/util.c /usr/src/debug/mc/4.8.32/src/filemanager/achown.c /usr/src/debug/mc/4.8.32/src/filemanager/command.c /usr/src/debug/mc/4.8.32/src/filemanager/cmd.c /usr/src/debug/mc/4.8.32/src/filemanager/file.h /usr/src/debug/mc/4.8.32/src/filemanager/filegui.c /usr/src/debug/mc/4.8.32/lib/charsets.h /usr/src/debug/mc/4.8.32/lib/serialize.c /usr/src/debug/mc/4.8.32/lib/skin.h /usr/src/debug/mc/4.8.32/src/filemanager/filenot.c /usr/src/debug/mc/4.8.32/src/filemanager/cmd.h /usr/src/debug/mc/4.8.32/src/filemanager/chown.c /usr/src/debug/mc/4.8.32/src/filemanager/command.h /usr/src/debug/mc/4.8.32/lib/serialize.h /usr/src/debug/mc/4.8.32/lib/charsets.c /usr/src/debug/mc/4.8.32/lib/event-types.h /usr/src
 /debug/mc/4.8.32/src/filemanager/file.c /usr/src/debug/mc/4.8.32/src/filemanager/filegui.h /usr/src/debug/mc/4.8.32/src/filemanager/filenot.h /usr/src/debug/mc/4.8.32/src/filemanager/fileopctx.h /usr/src/debug/mc/4.8.32/lib/global.c /usr/src/debug/mc/4.8.32/src/filemanager/hotlist.c /usr/src/debug/mc/4.8.32/src/filemanager/fileopctx.c /usr/src/debug/mc/4.8.32/lib/search.h /usr/src/debug/mc/4.8.32/lib/widget.h /usr/src/debug/mc/4.8.32/lib/global.h /usr/src/debug/mc/4.8.32/lib/event.h /usr/src/debug/mc/4.8.32/src/filemanager/boxes.c /usr/src/debug/mc/4.8.32/lib/file-entry.h /usr/src/debug/mc/4.8.32/src/filemanager/boxes.h /usr/src/debug/mc/4.8.32/src/filemanager/chmod.c /usr/src/debug/mc/4.8.32/src/filemanager/dir.h /usr/src/debug/mc/4.8.32/lib/filehighlight.h /usr/src/debug/mc/4.8.32/lib/mcconfig.h /usr/src/debug/mc/4.8.32/lib/hook.c /usr/src/debug/mc/4.8.32/lib/lock.c /usr/src/debug/mc/4.8.32/src/filemanager/mountlist.c /usr/src/debug/mc/4.8.32/src/filemanager/panel.c /usr/src/debug
 /mc/4.8.32/src/filemanager/mountlist.h /usr/src/debug/mc/4.8.32/src/filemanager/panel.h /usr/src/debug/mc/4.8.32/src/filemanager/dir.c /usr/src/debug/mc/4.8.32/lib/hook.h /usr/src/debug/mc/4.8.32/lib/lock.h /usr/src/debug/mc/4.8.32/lib/shell.h /usr/src/debug/mc/4.8.32/src/filemanager/hotlist.h /usr/src/debug/mc/4.8.32/lib/shell.c /usr/src/debug/mc/4.8.32/src/filemanager/filemanager.c /usr/src/debug/mc/4.8.32/src/filemanager/tree.c /usr/src/debug/mc/4.8.32/src/filemanager/filemanager.h /usr/src/debug/mc/4.8.32/lib/utilunix.c /usr/src/debug/mc/4.8.32/src/filemanager/tree.h", added "/usr/src/debug/mc/4.8.33/src/filemanager/cd.h /usr/src/debug/mc/4.8.33/src/filemanager/panelize.h /usr/src/debug/mc/4.8.33/src/filemanager/ext.c /usr/src/debug/mc/4.8.33/src/filemanager/info.c /usr/src/debug/mc/4.8.33/lib/keybind.h /usr/src/debug/mc/4.8.33/lib/glibcompat.c /usr/src/debug/mc/4.8.33/src/filemanager/ext.h /usr/src/debug/mc/4.8.33/src/filemanager/treestore.c /usr/src/debug/mc/4.8.33/src/fileman
 ager/cd.c /usr/src/debug/mc/4.8.33/src/filemanager/panelize.c /usr/src/debug/mc/4.8.33/lib/glibcompat.h /usr/src/debug/mc/4.8.33/lib/keybind.c /usr/src/debug/mc/4.8.33/src/filemanager/info.h /usr/src/debug/mc/4.8.33/src/filemanager/treestore.h /usr/src/debug/mc/4.8.33/src/filemanager/find.c /usr/src/debug/mc/4.8.33/lib/timefmt.h /usr/src/debug/mc/4.8.33/lib/strutil.h /usr/src/debug/mc/4.8.33/lib/util.h /usr/src/debug/mc/4.8.33/src/filemanager/layout.h /usr/src/debug/mc/4.8.33/src/filemanager/ioblksize.h /usr/src/debug/mc/4.8.33/lib/timefmt.c /usr/src/debug/mc/4.8.33/src/filemanager/layout.c /usr/src/debug/mc/4.8.33/lib/util.c /usr/src/debug/mc/4.8.33/src/filemanager/achown.c /usr/src/debug/mc/4.8.33/src/filemanager/command.c /usr/src/debug/mc/4.8.33/src/filemanager/cmd.c /usr/src/debug/mc/4.8.33/lib/idx.h /usr/src/debug/mc/4.8.33/src/filemanager/file.h /usr/src/debug/mc/4.8.33/lib/charsets.h /usr/src/debug/mc/4.8.33/lib/serialize.c /usr/src/debug/mc/4.8.33/lib/skin.h /usr/src/debug/
 mc/4.8.33/src/filemanager/filegui.c /usr/src/debug/mc/4.8.33/src/filemanager/cmd.h /usr/src/debug/mc/4.8.33/src/filemanager/chown.c /usr/src/debug/mc/4.8.33/src/filemanager/command.h /usr/src/debug/mc/4.8.33/lib/serialize.h /usr/src/debug/mc/4.8.33/lib/charsets.c /usr/src/debug/mc/4.8.33/lib/event-types.h /usr/src/debug/mc/4.8.33/src/filemanager/file.c /usr/src/debug/mc/4.8.33/src/filemanager/filegui.h /usr/src/debug/mc/4.8.33/src/filemanager/filenot.h /usr/src/debug/mc/4.8.33/src/filemanager/hotlist.c /usr/src/debug/mc/4.8.33/lib/global.c /usr/src/debug/mc/4.8.33/lib/search.h /usr/src/debug/mc/4.8.33/lib/widget.h /usr/src/debug/mc/4.8.33/lib/global.h /usr/src/debug/mc/4.8.33/lib/event.h /usr/src/debug/mc/4.8.33/src/filemanager/boxes.c /usr/src/debug/mc/4.8.33/lib/file-entry.h /usr/src/debug/mc/4.8.33/src/filemanager/boxes.h /usr/src/debug/mc/4.8.33/src/filemanager/chmod.c /usr/src/debug/mc/4.8.33/src/filemanager/dir.h /usr/src/debug/mc/4.8.33/lib/filehighlight.h /usr/src/debug/mc/4
 .8.33/lib/mcconfig.h /usr/src/debug/mc/4.8.33/lib/hook.c /usr/src/debug/mc/4.8.33/lib/lock.c /usr/src/debug/mc/4.8.33/src/filemanager/mountlist.c /usr/src/debug/mc/4.8.33/src/filemanager/panel.c /usr/src/debug/mc/4.8.33/src/filemanager/mountlist.h /usr/src/debug/mc/4.8.33/src/filemanager/panel.h /usr/src/debug/mc/4.8.33/src/filemanager/dir.c /usr/src/debug/mc/4.8.33/lib/hook.h /usr/src/debug/mc/4.8.33/lib/lock.h /usr/src/debug/mc/4.8.33/src/filemanager/filenot.c /usr/src/debug/mc/4.8.33/lib/shell.h /usr/src/debug/mc/4.8.33/src/filemanager/hotlist.h /usr/src/debug/mc/4.8.33/lib/shell.c /usr/src/debug/mc/4.8.33/src/filemanager/filemanager.c /usr/src/debug/mc/4.8.33/src/filemanager/tree.c /usr/src/debug/mc/4.8.33/src/filemanager/filemanager.h /usr/src/debug/mc/4.8.33/lib/utilunix.c /usr/src/debug/mc/4.8.33/src/filemanager/tree.h"
packages/core2-64-poky-linux/mc/mc-src: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc-staticdev: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc-staticdev: PKGV changed from 4.8.32 [default] to 4.8.33 [default]
packages/core2-64-poky-linux/mc/mc: PV changed from "4.8.32" to "4.8.33"
packages/core2-64-poky-linux/mc/mc: PKGSIZE changed from 3719431 to 3728578 (+0%)
packages/core2-64-poky-linux/mc/mc: FILELIST: added "/etc/mc/mc.vim.keymap"
packages/core2-64-poky-linux/mc/mc: PKGV changed from 4.8.32 [default] to 4.8.33 [default]

--===============3336928935363246035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mc/mc-helpers: PKGSIZE changed from 105889 to 120975 (+14%)
packages/core2-64-poky-linux/mc/mc-helpers: FILELIST: added "/usr/libexec/mc/extfs.d/torrent"
packages/core2-64-poky-linux/mc/mc: FILELIST: added "/etc/mc/mc.vim.keymap"

--===============3336928935363246035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.32-4.8.33.patch"

RnJvbSBiYjhjMzJiOGRmYjc5M2FlN2MzOWVkOGExZGFjYTZhODgxYjM1MWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMDowNjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1j
OiB1cGdyYWRlIDQuOC4zMiAtPiA0LjguMzMKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21j
L2ZpbGVzL25vbWFuZGF0ZS5wYXRjaCAgICAgICAgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL21jL3ttY180LjguMzIuYmIgPT4gbWNfNC44LjMzLmJifSB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tYy97bWNfNC44LjMyLmJiID0+IG1jXzQuOC4zMy5iYn0gKDk3JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvZmlsZXMvbm9tYW5kYXRlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzL25vbWFuZGF0ZS5wYXRjaAppbmRleCA5
MmZhNDQzODY1Li4yOTdkMmM3YmQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bWMvZmlsZXMvbm9tYW5kYXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9m
aWxlcy9ub21hbmRhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc4YzVmZDkwYTA1MmY5
NTE1N2IzOTE0YzcwOGEwOGIyZWVhYjAxNTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDc1YjBjNDZiY2U3NDM4ZmQ0ZDRjZjNkMThjMmQ4M2Y4NzQ3OTMxMTEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgNCBGZWIgMjAyMCAxODoxMjoxNSArMDAwMAogU3ViamVj
dDogW1BBVENIXSBtYzogRml4IG1hbnBhZ2UgZGF0ZSBpbmRldGVybWluaXNtCkBAIC0yMCw3ICsy
MCw3IEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZG9jL21hbi9kYXRlLW9mLW1hbi1pbmNsdWRlLmFtIGIv
ZG9jL21hbi9kYXRlLW9mLW1hbi1pbmNsdWRlLmFtCi1pbmRleCA5NmY5ZjEwLi5kNzM0YzVkIDEw
MDY0NAoraW5kZXggZWRlMDJlNC4uMTkzMDBlYiAxMDA2NDQKIC0tLSBhL2RvYy9tYW4vZGF0ZS1v
Zi1tYW4taW5jbHVkZS5hbQogKysrIGIvZG9jL21hbi9kYXRlLW9mLW1hbi1pbmNsdWRlLmFtCiBA
QCAtMSw1ICsxLDUgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9tY180
LjguMzIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjMzLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9tY180Ljgu
MzIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9tY180LjguMzMuYmIKaW5k
ZXggOTdkNGNjMGIwMS4uZWM1MGNmYzdjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL21jL21jXzQuOC4zMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44
LjMzLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFJSRUNPTU1FTkRTOiR7UE59ID0gIm5jdXJzZXMtdGVy
bWluZm8iCiBTUkNfVVJJID0gImh0dHA6Ly9mdHAubWlkbmlnaHQtY29tbWFuZGVyLm9yZy8ke0JQ
Tn0tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9ub21hbmRhdGUucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFhMDM5ZWJkMTVkNWU0NDIzMTJh
NzA1M2E0Y2EyODI3NmI3ZjI0MTA1MGI3NzE0ZDViYWU1MzYyZWNkMzMxOSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJhM2NlYjBhZjg0MjI2ZmVkZmU1ZjMzOTQ2NGZmMjg0OWMzZjZiZjAzMjFiNzIw
MjdjNDdiMmMxMGU2NmE2ZGJhIgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHBrZ2NvbmZp
ZwogCi0tIAoyLjQ0LjEKCg==

--===============3336928935363246035==--

