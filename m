Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7547DCA1016
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.89998.1756850186586502230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OPmHqWHR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TBcdal2L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e6705-08d1d845-b024-4b09-a70e-749cd83f1e32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/d/12L73wh7eio+1LNRUBMtDsteGDFO0mXiho8RZoks=;
	b=OPmHqWHR6xILZua32x0nz6GGLmrQVSVGv8KvSrFiedwPGZwQWLVySsgKJav1m7wz
	7HrA2ZgUB8g56GVclqWT2aVv5CWAcXIknrdZoXYRG4Qf1u0xDuabxDBKpbk4WGk/zwa
	s1vS4FObTBA8uJxvLGrL68rhSjhMqImkp18lOYVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/d/12L73wh7eio+1LNRUBMtDsteGDFO0mXiho8RZoks=;
	b=TBcdal2LvQz5RCbAT+GWDOZcN1h/WLLDt8a2OfUaoSLrK5GxDFQB1PsHzyR6P5Q5
	KFHX+3ShBIGIXRjJJbgV/2lcYBW4GSkXL47NGXG99iU88bC288JxQHts5ubGsBujxLB
	a+InPKM5Tnn+Sduo3VcWehlkOVljAznJZ7SH5oAE=
Content-Type: multipart/mixed; boundary="===============2016343367471015826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.18 SUCCEEDED
Message-ID: <010101990c6e6705-08d1d845-b024-4b09-a70e-749cd83f1e32-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222765

--===============2016343367471015826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.17-2.18.patch
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
From 31fa109966997ed54b93f830627f2018a829c535 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 16:47:47 +0000
Subject: [PATCH] ofono: upgrade 2.17 -> 2.18

---
 .../recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.17.bb b/meta/recipes-connectivity/ofono/ofono_2.18.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.17.bb
rename to meta/recipes-connectivity/ofono/ofono_2.18.bb
index 36bbe9439a..e2666b3e7e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
+SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============2016343367471015826==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.17-2.18.patch"

RnJvbSAzMWZhMTA5OTY2OTk3ZWQ1NGI5M2Y4MzA2MjdmMjAxOGE4MjljNTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNjo0Nzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuMTcgLT4gMi4xOAoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMTcuYmIgPT4gb2Zvbm9fMi4xOC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjE3LmJiID0+IG9mb25vXzIuMTguYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE3
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9u
by9vZm9ub18yLjE4LmJiCmluZGV4IDM2YmJlOTQzOWEuLmUyNjY2YjNlN2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTguYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIHVkZXYgbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvIGVsbCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3Jr
LyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vb2Zvbm8gXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzBiYjUwOTk3ZDNhNzY1N2VkZjEzMzM1NTY3
N2Y4ZTA0YjIxNThiY2IwMzExMThhNjdiMjk2MTA3ZjZlYTczZSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmNzRjM2JiYTdlYmFjNDg4ZmVkN2JjZmE2MTEzYjBlMzllNzIzZDJlMWEyNGI1M2Y3OWM5
ZjE4YTFjODVkZDAwIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQg
c3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjQ3LjEKCg==

--===============2016343367471015826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.17.tar.xz file://ofono" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.18.tar.xz file://ofono"
packages/x86-64-v3-poky-linux/ofono: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 7301440 to 7311272 (+0%)
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-dbg: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-dev: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-dev: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-doc: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-doc: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-locale: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-locale: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-src: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-src: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-staticdev: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono-tests: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono-tests: PV changed from "2.17" to "2.18"
packages/x86-64-v3-poky-linux/ofono/ofono: PKGSIZE changed from 2288391 to 2292855 (+0%)
packages/x86-64-v3-poky-linux/ofono/ofono: PKGV changed from 2.17 [default] to 2.18 [default]
packages/x86-64-v3-poky-linux/ofono/ofono: PV changed from "2.17" to "2.18"

--===============2016343367471015826==--

