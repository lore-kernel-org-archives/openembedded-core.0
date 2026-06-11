Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2739BCD98E0
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50602.1781195492842290978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e3fhka0L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PCNN4hlH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb7867d90-27d83979-fff7-413b-8116-bd09f90c0555-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195505;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xgy0zHFtoUfcDvxXW09jdSVI3Fn8OpMRpbVKdAX0ZAo=;
	b=e3fhka0L1d5pmRQd23fsURk4AjjZZAAFqqR+Ljqyv6s34qTGF6gcTDc7Qs50uEA2
	cdAD8jup38wWLjiXd83tNTJFnjjI92hzGfeoBNCfnsTdMj9lrD6nu4R463y09iZihxW
	GUjzUxFjgFzIR7+JH5GONZy2zrTVUulzRnQE3E/A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195505;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xgy0zHFtoUfcDvxXW09jdSVI3Fn8OpMRpbVKdAX0ZAo=;
	b=PCNN4hlHmJAWkhLqyvPaEIjSPjThs5s/YkcNWzYRcDjI6lgUxLD4FDqLnrTsybfq
	jm+fm78i0IBTYy9+h3q5aKa7xYJWipKNhzXPGVJdVgkB+fH0humzMUam8paBJ68kCwM
	bhcFiKmBpEHF+LmNluSwF7mzGkwT0rW9suLNXj6A=
Content-Type: multipart/mixed; boundary="===============6332866329503004046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.20.0 SUCCEEDED
Message-ID: <0101019eb7867d90-27d83979-fff7-413b-8116-bd09f90c0555-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238495

--===============6332866329503004046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-meson-python* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-meson-python-upgrade-0.19.0-0.20.0.patch
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
From f5d359ef2774474da66fe8f74cc86419da948c7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:45:29 +0000
Subject: [PATCH] python3-meson-python: upgrade 0.19.0 -> 0.20.0

---
 ...n3-meson-python_0.19.0.bb => python3-meson-python_0.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.19.0.bb => python3-meson-python_0.20.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
index 530edc9b12..19902f6e4c 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553"
+SRC_URI[sha256sum] = "6d9726ae6cd37e22f210c74b364b30180a68c20442e97ff09f3c566a414af738"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.47.1


--===============6332866329503004046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-meson-python: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.19.0.tar.gz;downloadfilename=meson_python-0.19.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.20.0.tar.gz;downloadfilename=meson_python-0.20.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.19.0" to "0.20.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info/licenses/LICENSES, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 230104 to 233297 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info

--===============6332866329503004046==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.19.0-0.20.0.patch"

RnJvbSBmNWQzNTllZjI3NzQ0NzRkYTY2ZmU4Zjc0Y2M4NjQxOWRhOTQ4YzdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6NDU6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1lc29uLXB5dGhvbjogdXBncmFkZSAwLjE5LjAgLT4gMC4yMC4wCgotLS0KIC4uLm4z
LW1lc29uLXB5dGhvbl8wLjE5LjAuYmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24tcHl0aG9u
XzAuMTkuMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjIwLjAuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhv
bl8wLjE5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24t
cHl0aG9uXzAuMjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMTkuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8w
LjIwLjAuYmIKaW5kZXggNTMwZWRjOWIxMi4uMTk5MDJmNmU0YyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE5LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIw
LjAuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICIgXAogUFlQSV9QQUNLQUdFID0gIm1l
c29uX3B5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9tZXNvbnB5Ci1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOTk1OWQxOThhYTY5YjU3ZmNmZDM1NGEzNDUxOGM2Zjc5NWI3ODFhNzNlZDA2NTZm
NGQwMTY2MDE2MGNjMjU1MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZDk3MjZhZTZjZDM3ZTIy
ZjIxMGM3NGIzNjRiMzAxODBhNjhjMjA0NDJlOTdmZjA5ZjNjNTY2YTQxNGFmNzM4IgogCiBERVBF
TkRTOnJlbW92ZTpjbGFzcy1uYXRpdmUgPSAicHl0aG9uMy1tZXNvbi1weXRob24tbmF0aXZlIgog
Ci0tIAoyLjQ3LjEKCg==

--===============6332866329503004046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info/licenses/LICENSES, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.19.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info

--===============6332866329503004046==--

