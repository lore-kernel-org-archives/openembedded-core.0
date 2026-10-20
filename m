Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1926.1792480406326716847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OjjU7eaP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=raDzsDBj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a158286850-4ed4ad35-680d-4541-98f3-ca470a2b6932-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LJuu35engjdPtOwFRDHSvweWIQKH56cT59OZnNSWoEU=;
	b=OjjU7eaPR433T6+8tKO2ulNEKYnuZ6DYLvG3B4IkVp65fCgAdaPOirDuPxasvk/P
	fZKfugO5dbtAvIzS8jLuqyKTQxq0L4LQsVAbddRjUqbw63zd38m2c80gInOKoHjf2cl
	M3E/ijDwHwb1rAsWz6Xg/xcDK60cWaus0XXpxsIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LJuu35engjdPtOwFRDHSvweWIQKH56cT59OZnNSWoEU=;
	b=raDzsDBjie2dfylAfBW2MrXpWXAi3pSkUN8VMN0+8NBbydS9mqu+yEDkK+JHerTf
	He91JXMvr/GJEa+4IXD4yAEfPZ3jmsKM6NTAQbO+RXPTuSGiOG5r8rohWBsw3MtivTx
	opmLX82oZEwd3HKFvbEKWATzAeXtzuRoHSK2uoDc=
Content-Type: multipart/mixed; boundary="===============4516303667089418224=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.3 SUCCEEDED
Message-ID: <010101a158286850-4ed4ad35-680d-4541-98f3-ca470a2b6932-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248233

--===============4516303667089418224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-17.1-17.3.patch
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
From fd8be23953f3b413d9684f69433b0b24c59c49aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:58:04 +0000
Subject: [PATCH] python3-websockets: upgrade 17.1 -> 17.3

---
 .../{python3-websockets_17.1.bb => python3-websockets_17.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.3.bb
index b5ee3ec661..063e20532f 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+SRC_URI[sha256sum] = "1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============4516303667089418224==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-17.1-17.3.patch"

RnJvbSBmZDhiZTIzOTUzZjNiNDEzZDk2ODRmNjk0MzNiMGIyNGM1OWM0OWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6NTg6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTcuMSAtPiAxNy4zCgotLS0KIC4uLi97cHl0aG9u
My13ZWJzb2NrZXRzXzE3LjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjMuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2Vic29ja2V0c18xNy4xLmJi
ID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNy4zLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4zLmJiCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjMuYmIKaW5kZXggYjVlZTNlYzY2MS4uMDYz
ZTIwNTMyZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdlYnNvY2tldHNfMTcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2Vic29ja2V0c18xNy4zLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MTkyNGE2YWY0NDk1YjhjZmFlZTFiMWRhODY5YjZmNCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImFjZmVhNGMyMGJmNTQzODQ4ODNlYTMzYjEyNDBmYzFkYjRmNTJlMTkwODIz
YTRlMmIzMzRiYzNlOGJmY2E5NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWM3ZGQ5M2ExYzlm
ODkyOTc0NzE0OTM2NzRiMWZjMWQ5NDY3Y2FmZDQ1Mzc0ZjIxNzIyMTMwNDZiZGIzYTMyOSIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ3LjEKCg==

--===============4516303667089418224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/17.1/src/websockets -> /usr/src/debug/python3-websockets/17.3/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 17.1 [default] to 17.3 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.3.dist-info
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "17.1" to "17.3"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1711167 to 1721077 (+1%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 17.1 [default] to 17.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.3.dist-info

--===============4516303667089418224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.3.dist-info

--===============4516303667089418224==--
