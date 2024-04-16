Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C619C05024
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13601.1713248040263053685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DLPmqkyb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UFWacnU2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a80ec-d1c3a7de-85b5-40dc-8c6c-833ff169b532-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XAMGu0KFh0X8m3NxHPiU0/YcfoKoncBzwL4IerlJ3ZY=;
	b=DLPmqkybW2rJZ7hTfnb9stsdmSpV5w55CIXJlbg8D/5QrB2VfkN8Foe9n5KP3PVi
	fCzQz9AQdvKi5Dk+TINXD6SMsEbr4HUaHO79a8xKsq0D9s4dL0dpHyYBxewbKXvPYsm
	wjXrYwK7UmUTuoWRht9JTgXrZDACBqeUPkfDLb84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XAMGu0KFh0X8m3NxHPiU0/YcfoKoncBzwL4IerlJ3ZY=;
	b=UFWacnU21Sglw3somRCvfnaOAN4dASzbQm4qenXpRUn2di2gE3xjOcyn2Ht9it0O
	m+LOOwBvPBlVFb9xESNv7k8VYthuJtBMu1EjTRfdbSRHnHh9/DpWy7iWfPdcKzVhwyQ
	0pSVwvvh0ds3cFUYSyYKWPaI3+gOYHiaQSJfT9mM=
Content-Type: multipart/mixed; boundary="===============7390711315580548026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 46.0 SUCCEEDED
Message-ID: <0101018ee58a80ec-d1c3a7de-85b5-40dc-8c6c-833ff169b532-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198343

--===============7390711315580548026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *adwaita-icon-theme* to *46.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-adwaita-icon-theme-upgrade-45.0-46.0.patch
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
From 0a39c27217b22b41f6fdc6c9cc6bf2959d672b1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:20:09 +0000
Subject: [PATCH] adwaita-icon-theme: upgrade 45.0 -> 46.0

---
 .../{adwaita-icon-theme_45.0.bb => adwaita-icon-theme_46.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_45.0.bb => adwaita-icon-theme_46.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
index 0bd98288f6..2f3e4e7b85 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
+SRC_URI[archive.sha256sum] = "4bcb539bd75d64da385d6fa08cbaa9ddeaceb6ac8e82b85ba6c41117bf5ba64e"
 
 DEPENDS += "librsvg-native"
 
-- 
2.42.0


--===============7390711315580548026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-adwaita-icon-theme-upgrade-45.0-46.0.patch"

RnJvbSAwYTM5YzI3MjE3YjIyYjQxZjZmZGM2YzljYzZiZjI5NTlkNjcyYjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6MjA6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
ZHdhaXRhLWljb24tdGhlbWU6IHVwZ3JhZGUgNDUuMCAtPiA0Ni4wCgotLS0KIC4uLi97YWR3YWl0
YS1pY29uLXRoZW1lXzQ1LjAuYmIgPT4gYWR3YWl0YS1pY29uLXRoZW1lXzQ2LjAuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS97YWR3YWl0YS1pY29uLXRoZW1lXzQ1LjAuYmIgPT4g
YWR3YWl0YS1pY29uLXRoZW1lXzQ2LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNvbi10aGVtZV80NS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdub21lL2dub21lL2Fkd2FpdGEtaWNvbi10aGVtZV80Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS9hZHdhaXRhLWljb24tdGhl
bWVfNDUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNv
bi10aGVtZV80Ni4wLmJiCmluZGV4IDBiZDk4Mjg4ZjYuLjJmM2U0ZTdiODUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS9hZHdhaXRhLWljb24tdGhlbWVfNDUuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ25vbWUvZ25vbWUvYWR3YWl0YS1pY29uLXRoZW1lXzQ2LjAuYmIKQEAg
LTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yzg0
Y2FjODhlNDZmYzA3NjQ3ZWEwN2U2YzI0ZWViN2MgXAogCiBpbmhlcml0IGdub21lYmFzZSBhbGxh
cmNoIGd0ay1pY29uLWNhY2hlCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjI0NDJi
ZmIwNmY0ZTZjYzk1YmY2ZTI2ODJmZGZmOThmYTVlZGRjNjg4NzUxYjlkNjIxNWM2MjNjYjRlNDJm
ZjEiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI0YmNiNTM5YmQ3NWQ2NGRhMzg1ZDZm
YTA4Y2JhYTlkZGVhY2ViNmFjOGU4MmI4NWJhNmM0MTExN2JmNWJhNjRlIgogCiBERVBFTkRTICs9
ICJsaWJyc3ZnLW5hdGl2ZSIKIAotLSAKMi40Mi4wCgo=

--===============7390711315580548026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGSIZE changed from 32964576 to 10504544 (-68%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: FILELIST: removed "/usr/share/icons/Adwaita/cursors/3ecb610c1bf2410f44200f48c40d3599 /usr/share/icons/Adwaita/cursors/6407b0e94181790501fd1e167b474872 /usr/share/icons/Adwaita/cursors/hand /usr/share/icons/Adwaita/cursors/pointer-move /usr/share/icons/Adwaita/cursors/pencil /usr/share/icons/Adwaita/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408 /usr/share/icons/Adwaita/cursors/bottom_tee /usr/share/icons/Adwaita/cursors/d9ce0ab605698f320427677b458ad60b /usr/share/icons/Adwaita/cursors/dnd-no-drop /usr/share/icons/Adwaita/cursors/pirate /usr/share/icons/Adwaita/cursors/plus /usr/share/icons/Adwaita/cursors/2870a09082c103050810ffdffffe0204 /usr/share/icons/Adwaita/cursors/right_tee /usr/share/icons/Adwaita/cursors/right_ptr /usr/share/icons/Adwaita/cursors/4498f0e0c1937ffe01fd06f973665830 /usr/share/icons/Adwaita/cursors/9081237383d90e509aa00f00170e968f /usr/share/icons/Adwaita/cursors/top_tee /usr/share/icons/Adwaita/cur
 sors/draft_large /usr/share/icons/Adwaita/cursors/028006030e0e7ebffc7f7070c0600140 /usr/share/icons/Adwaita/cursors/X_cursor /usr/share/icons/Adwaita/cursors/e29285e634086352946a0e7090d73106 /usr/share/icons/Adwaita/cursors/link /usr/share/icons/Adwaita/cursors/3085a0e285430894940527032f8b26df /usr/share/icons/Adwaita/cursors/08e8e1c95fe2fc01f976f1e063a24ccd /usr/share/icons/Adwaita/cursors/size_hor /usr/share/icons/Adwaita/cursors/size_ver /usr/share/icons/Adwaita/cursors/icon /usr/share/icons/Adwaita/cursors/dnd-ask /usr/share/icons/Adwaita/cursors/dnd-copy /usr/share/icons/Adwaita/cursors/dnd-move /usr/share/icons/Adwaita/cursors/dnd-none /usr/share/icons/Adwaita/cursors/left_tee /usr/share/icons/Adwaita/cursors/ll_angle /usr/share/icons/Adwaita/cursors/crossed_circle /usr/share/icons/Adwaita/cursors/lr_angle /usr/share/icons/Adwaita/cursors/openhand /usr/share/icons/Adwaita/cursors/ul_angle /usr/share/icons/Adwaita/cursors/ur_angle /usr/share/icons/Adwaita/cursors/640fb0e7419579
 1501fd1ed57b41487f /usr/share/icons/Adwaita/cursors/dnd-link /usr/share/icons/Adwaita/cursors/sb_up_arrow /usr/share/icons/Adwaita/cursors/sb_down_arrow /usr/share/icons/Adwaita/cursors/sb_left_arrow /usr/share/icons/Adwaita/cursors/dot_box_mask /usr/share/icons/Adwaita/cursors/size_all /usr/share/icons/Adwaita/cursors/draped_box /usr/share/icons/Adwaita/cursors/00008160000006810000408080010102 /usr/share/icons/Adwaita/cursors/draft_small /usr/share/icons/Adwaita/cursors/left_ptr_watch /usr/share/icons/Adwaita/cursors/dotbox /usr/share/icons/Adwaita/cursors/c7088f0f3e6c8088236ef8e1e3e70000 /usr/share/icons/Adwaita/cursors/1081e37283d90000800003c07f3ef6bf /usr/share/icons/Adwaita/cursors/fcf1c3c7cd4491d801f1e1c78f100000 /usr/share/icons/Adwaita/cursors/size_bdiag /usr/share/icons/Adwaita/cursors/03b6e0fcb3499374a867c041f52298f0 /usr/share/icons/Adwaita/cursors/h_double_arrow /usr/share/icons/Adwaita/cursors/v_double_arrow /usr/share/icons/Adwaita/cursors/size_fdiag /usr/share/icons/A
 dwaita/cursors/double_arrow /usr/share/icons/Adwaita/cursors/left_ptr_help /usr/share/icons/Adwaita/cursors/9d800788f1b08800ae810202380a0822 /usr/share/icons/Adwaita/cursors/target /usr/share/icons/Adwaita/cursors/14fef782d02440884392942c11205230 /usr/share/icons/Adwaita/cursors/sb_right_arrow"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: removed "/usr/share/icons/Adwaita/symbolic/devices/input-keyboard.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: removed "/usr/share/icons/Adwaita/.icon-theme.cache", added "/usr/share/icons/Adwaita/16x16/mimetypes/application-x-sharedlib.png"
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/cursors/arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/arrow changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed symlink target from None to nwse-resize
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed symlink target from None to sw-resize
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed symlink target from None to se-resize
  /usr/share/icons/Adwaita/cursors/bottom_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_side changed symlink target from None to s-resize
  /usr/share/icons/Adwaita/cursors/cross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/cross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/cross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/cross_reverse changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/cross_reverse changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/cross_reverse changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/diamond_cross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/diamond_cross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/diamond_cross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed symlink target from None to nesw-resize
  /usr/share/icons/Adwaita/cursors/fleur changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/fleur changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/fleur changed symlink target from None to move
  /usr/share/icons/Adwaita/cursors/hand1 changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/hand1 changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/hand1 changed symlink target from None to grab
  /usr/share/icons/Adwaita/cursors/hand2 changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/hand2 changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/hand2 changed symlink target from None to pointer
  /usr/share/icons/Adwaita/cursors/left_ptr changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/left_ptr changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/left_ptr changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/left_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/left_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/left_side changed symlink target from None to w-resize
  /usr/share/icons/Adwaita/cursors/question_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/question_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/question_arrow changed symlink target from None to help
  /usr/share/icons/Adwaita/cursors/right_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/right_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/right_side changed symlink target from None to e-resize
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed symlink target from None to ew-resize
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed symlink target from None to ns-resize
  /usr/share/icons/Adwaita/cursors/tcross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/tcross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/tcross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/top_left_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_left_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_left_corner changed symlink target from None to nw-resize
  /usr/share/icons/Adwaita/cursors/top_right_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_right_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_right_corner changed symlink target from None to ne-resize
  /usr/share/icons/Adwaita/cursors/top_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_side changed symlink target from None to n-resize
  /usr/share/icons/Adwaita/cursors/watch changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/watch changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/watch changed symlink target from None to wait
  /usr/share/icons/Adwaita/cursors/xterm changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/xterm changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/xterm changed symlink target from None to text
  /usr/share/icons/Adwaita/16x16/mimetypes/application-x-sharedlib.png was added
  /usr/share/icons/Adwaita/cursors/00008160000006810000408080010102 was removed
  /usr/share/icons/Adwaita/cursors/028006030e0e7ebffc7f7070c0600140 was removed
  /usr/share/icons/Adwaita/cursors/03b6e0fcb3499374a867c041f52298f0 was removed
  /usr/share/icons/Adwaita/cursors/08e8e1c95fe2fc01f976f1e063a24ccd was removed
  /usr/share/icons/Adwaita/cursors/1081e37283d90000800003c07f3ef6bf was removed
  /usr/share/icons/Adwaita/cursors/14fef782d02440884392942c11205230 was removed
  /usr/share/icons/Adwaita/cursors/2870a09082c103050810ffdffffe0204 was removed
  /usr/share/icons/Adwaita/cursors/3085a0e285430894940527032f8b26df was removed
  /usr/share/icons/Adwaita/cursors/3ecb610c1bf2410f44200f48c40d3599 was removed
  /usr/share/icons/Adwaita/cursors/4498f0e0c1937ffe01fd06f973665830 was removed
  /usr/share/icons/Adwaita/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408 was removed
  /usr/share/icons/Adwaita/cursors/6407b0e94181790501fd1e167b474872 was removed
  /usr/share/icons/Adwaita/cursors/640fb0e74195791501fd1ed57b41487f was removed
  /usr/share/icons/Adwaita/cursors/9081237383d90e509aa00f00170e968f was removed
  /usr/share/icons/Adwaita/cursors/9d800788f1b08800ae810202380a0822 was removed
  /usr/share/icons/Adwaita/cursors/bottom_tee was removed
  /usr/share/icons/Adwaita/cursors/c7088f0f3e6c8088236ef8e1e3e70000 was removed
  /usr/share/icons/Adwaita/cursors/crossed_circle was removed
  /usr/share/icons/Adwaita/cursors/d9ce0ab605698f320427677b458ad60b was removed
  /usr/share/icons/Adwaita/cursors/dnd-ask was removed
  /usr/share/icons/Adwaita/cursors/dnd-copy was removed
  /usr/share/icons/Adwaita/cursors/dnd-link was removed
  /usr/share/icons/Adwaita/cursors/dnd-move was removed
  /usr/share/icons/Adwaita/cursors/dnd-no-drop was removed
  /usr/share/icons/Adwaita/cursors/dnd-none was removed
  /usr/share/icons/Adwaita/cursors/dotbox was removed
  /usr/share/icons/Adwaita/cursors/dot_box_mask was removed
  /usr/share/icons/Adwaita/cursors/double_arrow was removed
  /usr/share/icons/Adwaita/cursors/draft_large was removed
  /usr/share/icons/Adwaita/cursors/draft_small was removed
  /usr/share/icons/Adwaita/cursors/draped_box was removed
  /usr/share/icons/Adwaita/cursors/e29285e634086352946a0e7090d73106 was removed
  /usr/share/icons/Adwaita/cursors/fcf1c3c7cd4491d801f1e1c78f100000 was removed
  /usr/share/icons/Adwaita/cursors/hand was removed
  /usr/share/icons/Adwaita/cursors/h_double_arrow was removed
  /usr/share/icons/Adwaita/cursors/icon was removed
  /usr/share/icons/Adwaita/cursors/left_ptr_help was removed
  /usr/share/icons/Adwaita/cursors/left_ptr_watch was removed
  /usr/share/icons/Adwaita/cursors/left_tee was removed
  /usr/share/icons/Adwaita/cursors/link was removed
  /usr/share/icons/Adwaita/cursors/ll_angle was removed
  /usr/share/icons/Adwaita/cursors/lr_angle was removed
  /usr/share/icons/Adwaita/cursors/openhand was removed
  /usr/share/icons/Adwaita/cursors/pencil was removed
  /usr/share/icons/Adwaita/cursors/pirate was removed
  /usr/share/icons/Adwaita/cursors/plus was removed
  /usr/share/icons/Adwaita/cursors/pointer-move was removed
  /usr/share/icons/Adwaita/cursors/right_ptr was removed
  /usr/share/icons/Adwaita/cursors/right_tee was removed
  /usr/share/icons/Adwaita/cursors/sb_down_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_left_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_right_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_up_arrow was removed
  /usr/share/icons/Adwaita/cursors/size_all was removed
  /usr/share/icons/Adwaita/cursors/size_bdiag was removed
  /usr/share/icons/Adwaita/cursors/size_fdiag was removed
  /usr/share/icons/Adwaita/cursors/size_hor was removed
  /usr/share/icons/Adwaita/cursors/size_ver was removed
  /usr/share/icons/Adwaita/cursors/target was removed
  /usr/share/icons/Adwaita/cursors/top_tee was removed
  /usr/share/icons/Adwaita/cursors/ul_angle was removed
  /usr/share/icons/Adwaita/cursors/ur_angle was removed
  /usr/share/icons/Adwaita/cursors/v_double_arrow was removed
  /usr/share/icons/Adwaita/cursors/X_cursor was removed
  /usr/share/icons/Adwaita/.icon-theme.cache was removed
  /usr/share/icons/Adwaita/symbolic/devices/input-keyboard.svg was removed

--===============7390711315580548026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: FILELIST: removed "/usr/share/icons/Adwaita/cursors/draft_small /usr/share/icons/Adwaita/cursors/draped_box /usr/share/icons/Adwaita/cursors/6407b0e94181790501fd1e167b474872 /usr/share/icons/Adwaita/cursors/right_ptr /usr/share/icons/Adwaita/cursors/size_hor /usr/share/icons/Adwaita/cursors/028006030e0e7ebffc7f7070c0600140 /usr/share/icons/Adwaita/cursors/size_ver /usr/share/icons/Adwaita/cursors/left_ptr_help /usr/share/icons/Adwaita/cursors/draft_large /usr/share/icons/Adwaita/cursors/sb_up_arrow /usr/share/icons/Adwaita/cursors/fcf1c3c7cd4491d801f1e1c78f100000 /usr/share/icons/Adwaita/cursors/08e8e1c95fe2fc01f976f1e063a24ccd /usr/share/icons/Adwaita/cursors/pirate /usr/share/icons/Adwaita/cursors/right_tee /usr/share/icons/Adwaita/cursors/h_double_arrow /usr/share/icons/Adwaita/cursors/v_double_arrow /usr/share/icons/Adwaita/cursors/dot_box_mask /usr/share/icons/Adwaita/cursors/size_bdiag /usr/share/icons/Adwai
 ta/cursors/size_fdiag /usr/share/icons/Adwaita/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408 /usr/share/icons/Adwaita/cursors/2870a09082c103050810ffdffffe0204 /usr/share/icons/Adwaita/cursors/dnd-ask /usr/share/icons/Adwaita/cursors/crossed_circle /usr/share/icons/Adwaita/cursors/640fb0e74195791501fd1ed57b41487f /usr/share/icons/Adwaita/cursors/e29285e634086352946a0e7090d73106 /usr/share/icons/Adwaita/cursors/link /usr/share/icons/Adwaita/cursors/plus /usr/share/icons/Adwaita/cursors/c7088f0f3e6c8088236ef8e1e3e70000 /usr/share/icons/Adwaita/cursors/sb_right_arrow /usr/share/icons/Adwaita/cursors/dotbox /usr/share/icons/Adwaita/cursors/sb_down_arrow /usr/share/icons/Adwaita/cursors/sb_left_arrow /usr/share/icons/Adwaita/cursors/top_tee /usr/share/icons/Adwaita/cursors/4498f0e0c1937ffe01fd06f973665830 /usr/share/icons/Adwaita/cursors/3ecb610c1bf2410f44200f48c40d3599 /usr/share/icons/Adwaita/cursors/double_arrow /usr/share/icons/Adwaita/cursors/9d800788f1b08800ae810202380a0822 /usr/share/ic
 ons/Adwaita/cursors/left_ptr_watch /usr/share/icons/Adwaita/cursors/dnd-no-drop /usr/share/icons/Adwaita/cursors/bottom_tee /usr/share/icons/Adwaita/cursors/hand /usr/share/icons/Adwaita/cursors/size_all /usr/share/icons/Adwaita/cursors/3085a0e285430894940527032f8b26df /usr/share/icons/Adwaita/cursors/1081e37283d90000800003c07f3ef6bf /usr/share/icons/Adwaita/cursors/00008160000006810000408080010102 /usr/share/icons/Adwaita/cursors/dnd-link /usr/share/icons/Adwaita/cursors/dnd-move /usr/share/icons/Adwaita/cursors/dnd-none /usr/share/icons/Adwaita/cursors/left_tee /usr/share/icons/Adwaita/cursors/ll_angle /usr/share/icons/Adwaita/cursors/lr_angle /usr/share/icons/Adwaita/cursors/target /usr/share/icons/Adwaita/cursors/pencil /usr/share/icons/Adwaita/cursors/openhand /usr/share/icons/Adwaita/cursors/ul_angle /usr/share/icons/Adwaita/cursors/ur_angle /usr/share/icons/Adwaita/cursors/14fef782d02440884392942c11205230 /usr/share/icons/Adwaita/cursors/d9ce0ab605698f320427677b458ad60b /usr/
 share/icons/Adwaita/cursors/dnd-copy /usr/share/icons/Adwaita/cursors/icon /usr/share/icons/Adwaita/cursors/pointer-move /usr/share/icons/Adwaita/cursors/9081237383d90e509aa00f00170e968f /usr/share/icons/Adwaita/cursors/03b6e0fcb3499374a867c041f52298f0 /usr/share/icons/Adwaita/cursors/X_cursor"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGSIZE changed from 32964576 to 10504544 (-68%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: removed "/usr/share/icons/Adwaita/symbolic/devices/input-keyboard.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGSIZE changed from 749541 to 732624 (-2%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: removed "/usr/share/icons/Adwaita/.icon-theme.cache", added "/usr/share/icons/Adwaita/16x16/mimetypes/application-x-sharedlib.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 498575 to 499086 (+0%)
packages/all-poky-linux/adwaita-icon-theme: PV changed from "45.0" to "46.0"
packages/all-poky-linux/adwaita-icon-theme: PKGV changed from 45.0 [default] to 46.0 [default]
packages/all-poky-linux/adwaita-icon-theme: SRC_URI changed from "https://download.gnome.org/sources//adwaita-icon-theme/45/adwaita-icon-theme-45.0.tar.xz;name=archive" to "https://download.gnome.org/sources//adwaita-icon-theme/46/adwaita-icon-theme-46.0.tar.xz;name=archive"
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/cursors/arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/arrow changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bd_double_arrow changed symlink target from None to nwse-resize
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_left_corner changed symlink target from None to sw-resize
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_right_corner changed symlink target from None to se-resize
  /usr/share/icons/Adwaita/cursors/bottom_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/bottom_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/bottom_side changed symlink target from None to s-resize
  /usr/share/icons/Adwaita/cursors/cross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/cross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/cross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/cross_reverse changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/cross_reverse changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/cross_reverse changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/diamond_cross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/diamond_cross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/diamond_cross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/fd_double_arrow changed symlink target from None to nesw-resize
  /usr/share/icons/Adwaita/cursors/fleur changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/fleur changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/fleur changed symlink target from None to move
  /usr/share/icons/Adwaita/cursors/hand1 changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/hand1 changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/hand1 changed symlink target from None to grab
  /usr/share/icons/Adwaita/cursors/hand2 changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/hand2 changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/hand2 changed symlink target from None to pointer
  /usr/share/icons/Adwaita/cursors/left_ptr changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/left_ptr changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/left_ptr changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/left_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/left_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/left_side changed symlink target from None to w-resize
  /usr/share/icons/Adwaita/cursors/question_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/question_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/question_arrow changed symlink target from None to help
  /usr/share/icons/Adwaita/cursors/right_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/right_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/right_side changed symlink target from None to e-resize
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/sb_h_double_arrow changed symlink target from None to ew-resize
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/sb_v_double_arrow changed symlink target from None to ns-resize
  /usr/share/icons/Adwaita/cursors/tcross changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/tcross changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/tcross changed symlink target from None to crosshair
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_left_arrow changed symlink target from None to default
  /usr/share/icons/Adwaita/cursors/top_left_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_left_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_left_corner changed symlink target from None to nw-resize
  /usr/share/icons/Adwaita/cursors/top_right_corner changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_right_corner changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_right_corner changed symlink target from None to ne-resize
  /usr/share/icons/Adwaita/cursors/top_side changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/top_side changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/top_side changed symlink target from None to n-resize
  /usr/share/icons/Adwaita/cursors/watch changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/watch changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/watch changed symlink target from None to wait
  /usr/share/icons/Adwaita/cursors/xterm changed type from file to symlink
  /usr/share/icons/Adwaita/cursors/xterm changed permissions from rw-r--r-- to rwxrwxrwx
  /usr/share/icons/Adwaita/cursors/xterm changed symlink target from None to text
  /usr/share/icons/Adwaita/16x16/mimetypes/application-x-sharedlib.png was added
  /usr/share/icons/Adwaita/cursors/00008160000006810000408080010102 was removed
  /usr/share/icons/Adwaita/cursors/028006030e0e7ebffc7f7070c0600140 was removed
  /usr/share/icons/Adwaita/cursors/03b6e0fcb3499374a867c041f52298f0 was removed
  /usr/share/icons/Adwaita/cursors/08e8e1c95fe2fc01f976f1e063a24ccd was removed
  /usr/share/icons/Adwaita/cursors/1081e37283d90000800003c07f3ef6bf was removed
  /usr/share/icons/Adwaita/cursors/14fef782d02440884392942c11205230 was removed
  /usr/share/icons/Adwaita/cursors/2870a09082c103050810ffdffffe0204 was removed
  /usr/share/icons/Adwaita/cursors/3085a0e285430894940527032f8b26df was removed
  /usr/share/icons/Adwaita/cursors/3ecb610c1bf2410f44200f48c40d3599 was removed
  /usr/share/icons/Adwaita/cursors/4498f0e0c1937ffe01fd06f973665830 was removed
  /usr/share/icons/Adwaita/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408 was removed
  /usr/share/icons/Adwaita/cursors/6407b0e94181790501fd1e167b474872 was removed
  /usr/share/icons/Adwaita/cursors/640fb0e74195791501fd1ed57b41487f was removed
  /usr/share/icons/Adwaita/cursors/9081237383d90e509aa00f00170e968f was removed
  /usr/share/icons/Adwaita/cursors/9d800788f1b08800ae810202380a0822 was removed
  /usr/share/icons/Adwaita/cursors/bottom_tee was removed
  /usr/share/icons/Adwaita/cursors/c7088f0f3e6c8088236ef8e1e3e70000 was removed
  /usr/share/icons/Adwaita/cursors/crossed_circle was removed
  /usr/share/icons/Adwaita/cursors/d9ce0ab605698f320427677b458ad60b was removed
  /usr/share/icons/Adwaita/cursors/dnd-ask was removed
  /usr/share/icons/Adwaita/cursors/dnd-copy was removed
  /usr/share/icons/Adwaita/cursors/dnd-link was removed
  /usr/share/icons/Adwaita/cursors/dnd-move was removed
  /usr/share/icons/Adwaita/cursors/dnd-no-drop was removed
  /usr/share/icons/Adwaita/cursors/dnd-none was removed
  /usr/share/icons/Adwaita/cursors/dotbox was removed
  /usr/share/icons/Adwaita/cursors/dot_box_mask was removed
  /usr/share/icons/Adwaita/cursors/double_arrow was removed
  /usr/share/icons/Adwaita/cursors/draft_large was removed
  /usr/share/icons/Adwaita/cursors/draft_small was removed
  /usr/share/icons/Adwaita/cursors/draped_box was removed
  /usr/share/icons/Adwaita/cursors/e29285e634086352946a0e7090d73106 was removed
  /usr/share/icons/Adwaita/cursors/fcf1c3c7cd4491d801f1e1c78f100000 was removed
  /usr/share/icons/Adwaita/cursors/hand was removed
  /usr/share/icons/Adwaita/cursors/h_double_arrow was removed
  /usr/share/icons/Adwaita/cursors/icon was removed
  /usr/share/icons/Adwaita/cursors/left_ptr_help was removed
  /usr/share/icons/Adwaita/cursors/left_ptr_watch was removed
  /usr/share/icons/Adwaita/cursors/left_tee was removed
  /usr/share/icons/Adwaita/cursors/link was removed
  /usr/share/icons/Adwaita/cursors/ll_angle was removed
  /usr/share/icons/Adwaita/cursors/lr_angle was removed
  /usr/share/icons/Adwaita/cursors/openhand was removed
  /usr/share/icons/Adwaita/cursors/pencil was removed
  /usr/share/icons/Adwaita/cursors/pirate was removed
  /usr/share/icons/Adwaita/cursors/plus was removed
  /usr/share/icons/Adwaita/cursors/pointer-move was removed
  /usr/share/icons/Adwaita/cursors/right_ptr was removed
  /usr/share/icons/Adwaita/cursors/right_tee was removed
  /usr/share/icons/Adwaita/cursors/sb_down_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_left_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_right_arrow was removed
  /usr/share/icons/Adwaita/cursors/sb_up_arrow was removed
  /usr/share/icons/Adwaita/cursors/size_all was removed
  /usr/share/icons/Adwaita/cursors/size_bdiag was removed
  /usr/share/icons/Adwaita/cursors/size_fdiag was removed
  /usr/share/icons/Adwaita/cursors/size_hor was removed
  /usr/share/icons/Adwaita/cursors/size_ver was removed
  /usr/share/icons/Adwaita/cursors/target was removed
  /usr/share/icons/Adwaita/cursors/top_tee was removed
  /usr/share/icons/Adwaita/cursors/ul_angle was removed
  /usr/share/icons/Adwaita/cursors/ur_angle was removed
  /usr/share/icons/Adwaita/cursors/v_double_arrow was removed
  /usr/share/icons/Adwaita/cursors/X_cursor was removed
  /usr/share/icons/Adwaita/.icon-theme.cache was removed
  /usr/share/icons/Adwaita/symbolic/devices/input-keyboard.svg was removed

--===============7390711315580548026==--

