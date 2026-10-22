Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16567.1792647344679356144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qCzAqQns;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PRtcF9Jb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1621badde-f9fb27d5-443d-4a88-972c-e3958c14cf44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p0Lc3K2KG7hEfwn9pJsj/ui3l91Ouuyu35s5PUTrI8s=;
	b=qCzAqQnsT6IU0gC2sbVnGdWDnoEsZsV92o/iThxsLuxHEeb3CYA8CXSnPUl97xWr
	XkR3NRDWNl9hND2c9BEuMF1/9cTdVVCax3VcULdItm6vom373ubaeY+wAnGBFd+iqkI
	S+Iyxozle1rL3f3xImNHQ3K/7g1Tw1f5gXCg9W3k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p0Lc3K2KG7hEfwn9pJsj/ui3l91Ouuyu35s5PUTrI8s=;
	b=PRtcF9JbxjHgTTVOWUKFgGWvNv2A3Yv57aai3yKveF2puC5N1UcvTLUZ6TetLgBD
	An2noT0jOXHw4sZhFI5UeiOYo45iv2Lx7x86hkLZjTnXorAyq36gL+LMVGxdHfcOlDD
	WSloR+lhlJAanS3DGoP0xQ+1iKmOzBJtXD1vAPas=
Content-Type: multipart/mixed; boundary="===============7220643524982039454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.9.1 SUCCEEDED
Message-ID: <010101a1621badde-f9fb27d5-443d-4a88-972c-e3958c14cf44-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248417

--===============7220643524982039454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.9.0-1.9.1.patch
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
From 29673b332f35fe554b52a61b4580683c21acac9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:32:42 +0000
Subject: [PATCH] libtraceevent: upgrade 1.9.0 -> 1.9.1

libtraceevent: 1.9.1
kbuffer: Fix kbuffer_missed_events() when sub-buffer starts with a timestamp
libtraceevent: Fix leaks and NULL check in process_int_dynamic_array()
libtraceevent utest: Avoid host-specific getname_flags output
libtraceevent utest: Handle short reads when reading BTF
libtraceevent: Avoid racing recursive builds of both libraries
libtraceevent: Reject non-text symbol arithmetic
libtraceveent: Add printable characters
libtraceevent: Parse %pB and %pa address specifiers
libtraceevent: Pretty print function parameters of enum-type
libtraceevent utest: Fix type of args in test_btf_read
libtraceevent utest: Read btf file in utest if mmap fails
---
 .../{libtraceevent_1.9.0.bb => libtraceevent_1.9.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.9.0.bb => libtraceevent_1.9.1.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
index a44253a567..ca6aead9b6 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "13701b5532e0c3295bf5670361692b0d0044228d"
+SRCREV = "34ee98e346e6c8f6586fa3a67db5ba2380403bc3"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https;tag=${BPN}-${PV} \
           "
 
-- 
2.47.1


--===============7220643524982039454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: SRC_URI changed from "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent;protocol=https;tag=libtraceevent-1.9.0" to "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent;protocol=https;tag=libtraceevent-1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.9.0", added "/usr/lib/.debug/libtraceevent.so.1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 748432 to 754864 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: FILELIST: directory renamed /usr/src/debug/libtraceevent/1.9.0/include/traceevent -> /usr/src/debug/libtraceevent/1.9.1/include/traceevent, directory renamed /usr/src/debug/libtraceevent/1.9.0/plugins -> /usr/src/debug/libtraceevent/1.9.1/plugins, directory renamed /usr/src/debug/libtraceevent/1.9.0/src -> /usr/src/debug/libtraceevent/1.9.1/src
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 422457 to 426933 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 838744 to 848616 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.9.0", added "/usr/lib/libtraceevent.so.1.9.1"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.9.0" to "1.9.1"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.9.0 to libtraceevent.so.1.9.1
  /usr/lib/libtraceevent.so.1.9.0 moved to /usr/lib/libtraceevent.so.1.9.1

--===============7220643524982039454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.9.0-1.9.1.patch"

RnJvbSAyOTY3M2IzMzJmMzVmZTU1NGI1MmE2MWI0NTgwNjgzYzIxYWNhYzliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MzI6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOS4wIC0+IDEuOS4xCgpsaWJ0cmFjZWV2ZW50OiAxLjku
MQprYnVmZmVyOiBGaXgga2J1ZmZlcl9taXNzZWRfZXZlbnRzKCkgd2hlbiBzdWItYnVmZmVyIHN0
YXJ0cyB3aXRoIGEgdGltZXN0YW1wCmxpYnRyYWNlZXZlbnQ6IEZpeCBsZWFrcyBhbmQgTlVMTCBj
aGVjayBpbiBwcm9jZXNzX2ludF9keW5hbWljX2FycmF5KCkKbGlidHJhY2VldmVudCB1dGVzdDog
QXZvaWQgaG9zdC1zcGVjaWZpYyBnZXRuYW1lX2ZsYWdzIG91dHB1dApsaWJ0cmFjZWV2ZW50IHV0
ZXN0OiBIYW5kbGUgc2hvcnQgcmVhZHMgd2hlbiByZWFkaW5nIEJURgpsaWJ0cmFjZWV2ZW50OiBB
dm9pZCByYWNpbmcgcmVjdXJzaXZlIGJ1aWxkcyBvZiBib3RoIGxpYnJhcmllcwpsaWJ0cmFjZWV2
ZW50OiBSZWplY3Qgbm9uLXRleHQgc3ltYm9sIGFyaXRobWV0aWMKbGlidHJhY2V2ZWVudDogQWRk
IHByaW50YWJsZSBjaGFyYWN0ZXJzCmxpYnRyYWNlZXZlbnQ6IFBhcnNlICVwQiBhbmQgJXBhIGFk
ZHJlc3Mgc3BlY2lmaWVycwpsaWJ0cmFjZWV2ZW50OiBQcmV0dHkgcHJpbnQgZnVuY3Rpb24gcGFy
YW1ldGVycyBvZiBlbnVtLXR5cGUKbGlidHJhY2VldmVudCB1dGVzdDogRml4IHR5cGUgb2YgYXJn
cyBpbiB0ZXN0X2J0Zl9yZWFkCmxpYnRyYWNlZXZlbnQgdXRlc3Q6IFJlYWQgYnRmIGZpbGUgaW4g
dXRlc3QgaWYgbW1hcCBmYWlscwotLS0KIC4uLi97bGlidHJhY2VldmVudF8xLjkuMC5iYiA9PiBs
aWJ0cmFjZWV2ZW50XzEuOS4xLmJifSAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwv
bGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjkuMC5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEu
OS4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vl
dmVudC9saWJ0cmFjZWV2ZW50XzEuOS4wLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFj
ZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS45LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS45
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFj
ZWV2ZW50XzEuOS4xLmJiCmluZGV4IGE0NDI1M2E1NjcuLmNhNmFlYWQ5YjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOS4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEu
OS4xLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
Uy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIxNWQxM2Y5NwogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1PWIzNzA4ODc5ODBkYjVkZDQw
NjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1TUkNSRVYgPSAiMTM3MDFiNTUz
MmUwYzMyOTViZjU2NzAzNjE2OTJiMGQwMDQ0MjI4ZCIKK1NSQ1JFViA9ICIzNGVlOThlMzQ2ZTZj
OGY2NTg2ZmEzYTY3ZGI1YmEyMzgwNDAzYmMzIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVudC5naXQ7YnJhbmNoPSR7QlBO
fTtwcm90b2NvbD1odHRwczt0YWc9JHtCUE59LSR7UFZ9IFwKICAgICAgICAgICAiCiAKLS0gCjIu
NDcuMQoK

--===============7220643524982039454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.9.0", added "/usr/lib/libtraceevent.so.1.9.1"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.9.0 to libtraceevent.so.1.9.1
  /usr/lib/libtraceevent.so.1.9.0 moved to /usr/lib/libtraceevent.so.1.9.1

--===============7220643524982039454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libtraceevent-changelog.txt"

libtraceevent: 1.9.1
kbuffer: Fix kbuffer_missed_events() when sub-buffer starts with a timestamp
libtraceevent: Fix leaks and NULL check in process_int_dynamic_array()
libtraceevent utest: Avoid host-specific getname_flags output
libtraceevent utest: Handle short reads when reading BTF
libtraceevent: Avoid racing recursive builds of both libraries
libtraceevent: Reject non-text symbol arithmetic
libtraceveent: Add printable characters
libtraceevent: Parse %pB and %pa address specifiers
libtraceevent: Pretty print function parameters of enum-type
libtraceevent utest: Fix type of args in test_btf_read
libtraceevent utest: Read btf file in utest if mmap fails

--===============7220643524982039454==--
