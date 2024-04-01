Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C88CD13A6
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2002.1711994602378901014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cMfRGjdo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Kve2GrC0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad47f95-05c7acdb-ed4a-4781-a1fa-3881d1ed33bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JEb4rhlgiBn0TlCwwG+tdG7CXH2lLepidpeXd2agmRA=;
	b=cMfRGjdoHnveLOcZFfqDpTS263Qg6NztQqoMoTY97qhrYXTcQ7tpWV7Iy/a/SD3/
	tEPx7oE8Kd3epMiuOkn9MbW5qnWi1w6drD5NKc3TmNErRr8EB8g2+0v3QZ4mXLQJXJL
	7aV05Cyplv4YwoaX5UYqo2sTlAK294/MxU8U8oeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JEb4rhlgiBn0TlCwwG+tdG7CXH2lLepidpeXd2agmRA=;
	b=Kve2GrC0HXXIOSLmXw5gGu/EePcxI8GoYLRvXzFZx76Yv6EHv19kDTtGV8XSdyGU
	KWcs2/bV0/WAaDRmZpp42ajN5C91xkj3mfgmS03PwK0C2W1xflQhc9qCKQ9h9F/TAl5
	pDBGUBY3tazi/2dtWHTJ4pHCiFIDqcoC960qWCSs=
Content-Type: multipart/mixed; boundary="===============7462396596854465996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.48.1 SUCCEEDED
Message-ID: <0101018e9ad47f95-05c7acdb-ed4a-4781-a1fa-3881d1ed33bb-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197739

--===============7462396596854465996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.48.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.46.0-3.48.1.patch
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
From 1408ebdf1b292af71e6a33b455354f84a0bed8b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:03:47 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.46.0 -> 3.48.1

---
 ...{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
index 73a393051a..4754e41c04 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "426008b2dad548c9af1c7b03b59df0440fde5c33f38fb5406b103a43d653cafc"
+SRC_URI[sha256sum] = "3a0a2c0c0f25931b5840649c54834b9e58a63148d37fa9f6308887b7027e15c2"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.42.0


--===============7462396596854465996==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.46.0-3.48.1.patch"

RnJvbSAxNDA4ZWJkZjFiMjkyYWY3MWU2YTMzYjQ1NTM1NGY4NGEwYmVkOGI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOTowMzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnb2JqZWN0OiB1cGdyYWRlIDMuNDYuMCAtPiAzLjQ4LjEKCi0tLQogLi4ue3B5dGhv
bjMtcHlnb2JqZWN0XzMuNDYuMC5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjQ4LjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdvYmplY3RfMy40Ni4w
LmJiID0+IHB5dGhvbjMtcHlnb2JqZWN0XzMuNDguMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDYuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy40OC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWdvYmplY3RfMy40Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDguMS5iYgppbmRleCA3M2EzOTMw
NTFhLi40NzU0ZTQxYzA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnb2JqZWN0XzMuNDYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDguMS5iYgpAQCAtMTksNyArMTksNyBAQCBERVBF
TkRTICs9ICJweXRob24zIGdsaWItMi4wIgogU1JDTkFNRT0icHlnb2JqZWN0IgogCiBTUkNfVVJJ
ID0gImh0dHA6Ly9mdHAuZ25vbWUub3JnL3B1Yi9HTk9NRS9zb3VyY2VzLyR7U1JDTkFNRX0vJHtA
Z25vbWVfdmVyZGlyKCIke1BWfSIpfS8ke1NSQ05BTUV9LSR7UFZ9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0MjYwMDhiMmRhZDU0OGM5YWYxYzdiMDNiNTlkZjA0NDBmZGU1YzMzZjM4
ZmI1NDA2YjEwM2E0M2Q2NTNjYWZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhMGEyYzBjMGYy
NTkzMWI1ODQwNjQ5YzU0ODM0YjllNThhNjMxNDhkMzdmYTlmNjMwODg4N2I3MDI3ZTE1YzIiCiAK
IFMgPSAiJHtXT1JLRElSfS8ke1NSQ05BTUV9LSR7UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============7462396596854465996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info", added "/usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info moved to /usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info

--===============7462396596854465996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pygobject: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.46/pygobject-3.46.0.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.48/pygobject-3.48.1.tar.xz"
packages/core2-64-poky-linux/python3-pygobject: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1359536 to 1378008 (+1%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 925592 to 939776 (+2%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: removed "/usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.46.0/gi/gimodule.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygpointer.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.46.0/gi/gimodule.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygflags.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygflags.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygspawn.c /usr/src/debug/
 python3-pygobject/3.46.0/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-hashtable.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-hashtable.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-repository.c /usr/src/deb
 ug/python3-pygobject/3.46.0/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct-marshal.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygenum.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct-marshal.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygenum.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-object.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-object.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygparamspec.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygparamspec.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptioncontext.h /usr/src/deb
 ug/python3-pygobject/3.46.0/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-array.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-enum-marshal.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-enum-marshal.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-array.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptioncontext.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-list.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-list.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-property.c /usr/src/
 debug/python3-pygobject/3.46.0/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.46.0/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-marshal-cleanup.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptiongroup.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptiongroup.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-boxed.h", added "/usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.48.1/gi/gimodule.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygpointer.c /
 usr/src/debug/python3-pygobject/3.48.1/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.48.1/gi/gimodule.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygflags.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygflags.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygobject.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/
 3.48.1/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-hashtable.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-hashtable.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct-marshal.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygenum.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct-marshal.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygenum.c /usr/src/debug/pyt
 hon3-pygobject/3.48.1/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-object.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-object.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygparamspec.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygparamspec.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptioncontext.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-array.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-enum-marshal.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-enum-marshal.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-array.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-argument.c /usr/src/debug/python
 3-pygobject/3.48.1/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptioncontext.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-list.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-list.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.48.1/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.48.1/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-marshal-cleanup.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptiongroup.h /usr
 /src/debug/python3-pygobject/3.48.1/gi/pygoptiongroup.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-boxed.h"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1066816 to 1077887 (+1%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info", added "/usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
Changes to packages/core2-64-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info moved to /usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info

--===============7462396596854465996==--

