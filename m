Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DEDC54ED0
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1819.1746113631221265975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dtmgW0UM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OSxc7TwL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b91f2-36e5e2a7-3e75-476c-91cb-9e4433ae8f97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9r378tTH4zPtpIVa7TTBxsyKrWXN7LHkvrCSj95vX6Y=;
	b=dtmgW0UMbUbSZwiQ8q1Teu79FIqwsvlzzAro2vSxu/IPa+7BwCXbim6QvLYu+uq3
	ypfOoo0rlR/ygOzbJGuYcI2N/Tva8uA+zJUyDUqgykF8mCgkZE643RdwwvKpvJ7hejd
	SN6TCdo3xjJrZigb3ENdSEZ7W/2sAlXT96BDknKw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9r378tTH4zPtpIVa7TTBxsyKrWXN7LHkvrCSj95vX6Y=;
	b=OSxc7TwLRewmSBNZ6+ayEefF69jFjvxNvWJeGTYP2QVxb6IDHn1lAt8KkxOMfwQ0
	MzOkScANr55CuNjhDUqAdtRm4fgKUkcrpi51m9m/va6bJXLMC0RTyamQIi+8yRqnhuu
	AuzC568v+baBy/VCKFMQhflIp43ZKikvNSaymR2Q=
Content-Type: multipart/mixed; boundary="===============6588580379553060922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 48.3 SUCCEEDED
Message-ID: <010101968c7b91f2-36e5e2a7-3e75-476c-91cb-9e4433ae8f97-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215857

--===============6588580379553060922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *48.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-48.0-48.3.patch
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
From 45dd1b9e569946efd5c16344eacec4cee2123e8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 12:02:53 +0000
Subject: [PATCH] epiphany: upgrade 48.0 -> 48.3

---
 .../epiphany/{epiphany_48.0.bb => epiphany_48.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.0.bb => epiphany_48.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.0.bb b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.3.bb
index 9eff56df3a..74a17be5a5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
+SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 929e33b015..ce7d5ee42c 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 165ef2bf636c170d81576f7d3e6348fc3d781821 Mon Sep 17 00:00:00 2001
+From 6705cbbb944501b8950695e8987a400c3ee3bbd9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index dac4855750..6d06529ed5 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c43bbbb4154bb9686756297a7e2eecaa72bb1e9f Mon Sep 17 00:00:00 2001
+From 7eec5228010b4195bdf69d3f787e9fac38725a68 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 96554b7..f5c9727 100644
+index 3dc3ae1..ba1640b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 5407d893d6..465e618407 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 4c5f6b0b44b959f0156cb74f76b2db46a0042c4a Mon Sep 17 00:00:00 2001
+From e02da7dc729363ed2c05af75fbfc33fa9cedf041 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============6588580379553060922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-48.0-48.3.patch"

RnJvbSA0NWRkMWI5ZTU2OTk0NmVmZDVjMTYzNDRlYWNlYzRjZWUyMTIzZThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMjowMjo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ4LjAgLT4gNDguMwoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ4LjAuYmIgPT4gZXBpcGhhbnlfNDguMy5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkve2VwaXBoYW55XzQ4LjAuYmIgPT4gZXBpcGhhbnlfNDguMy5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguMC5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OC4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguMy5i
YgppbmRleCA5ZWZmNTZkZjNhLi43NGExN2JlNWE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNDguMy5iYgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJID0gIiR7
R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0i
LCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJjOWQxZjZkZmZiYWQwM2IwOTE2NDM2OTAxYzc3MGRhMzAyODc5Y2E2
MGE2MzZkMmI3MmIyNWIxNDJlYzA1ZjgwIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
ZGEyOTUzZTdlMmI3M2JmNzQ3M2MwYTMzOTc5MTA0ZDc5MzYyNzk1Mjk1ZWFhMGEyYTM4ZWExODg1
MzdkYWYxMyIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNP
TkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVy
X21vZGU9ZmFsc2UiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA5MjllMzNiMDE1Li5jZTdkNWVlNDJj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxw
LW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10
aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE2NWVmMmJmNjM2YzE3
MGQ4MTU3NmY3ZDNlNjM0OGZjM2Q3ODE4MjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDY3MDVjYmJiOTQ0NTAxYjg5NTA2OTVlODk4N2E0MDBjM2VlM2JiZDkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCBk
YWM0ODU1NzUwLi42ZDA2NTI5ZWQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNDNi
YmJiNDE1NGJiOTY4Njc1NjI5N2E3ZTJlZWNhYTcyYmIxZTlmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3ZWVjNTIyODAxMGI0MTk1YmRmNjlkM2Y3ODdlOWZhYzM4NzI1YTY4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9v
cy1yZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggOTY1NTRiNy4uZjVjOTcyNyAxMDA2NDQKK2luZGV4IDNkYzNhZTEu
LmJhMTY0MGIgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCA1NDA3ZDg5M2Q2Li40
NjVlNjE4NDA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21p
Z3JhdG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YzVmNmIwYjQ0Yjk1OWYwMTU2Y2I3
NGY3NmIyZGI0NmEwMDQyYzRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMDJkYTdk
YzcyOTM2M2VkMmMwNWFmNzVmYmZjMzNmYTljZWRmMDQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ3LjEKCg==

--===============6588580379553060922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5908952 to 5908544 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGSIZE changed from 82500 to 92849 (+13%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGSIZE changed from 115981 to 116685 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 93910 to 93914 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 85665 to 85597 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 92032 to 92303 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGSIZE changed from 91618 to 90973 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 136881 to 137761 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ia: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 1132383 to 1132482 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2109832 to 2110393 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 48.0 [default] to 48.3 [default]
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/48/epiphany-48.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/48/epiphany-48.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PV changed from "48.0" to "48.3"
packages/core2-64-poky-linux/epiphany: PKGV changed from 48.0 [default] to 48.3 [default]

--===============6588580379553060922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGSIZE changed from 82500 to 92849 (+13%)

--===============6588580379553060922==--

