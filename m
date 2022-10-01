Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463EC07E9D
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.353.1664643228365037905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HJAC2oZG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101839477e57d-9dcbd0ca-2396-419c-83bd-ebcb4e27498b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hIt+iLZaPtwaDoqT1NKeWxZ0TWb2Pm2r6Nguu+YfsFk=;
	b=HJAC2oZGbXkoLYdB6hznN/wp3b9JKUc5oxYMkw+z4yXSkupjxiAL3X1bjyqDS29P
	ltNKAUhFhm2uDbv/abCUVrLlUfJSjKGo39J4mhcNYxdRK1uW8F5XOu27SI15+70vpFD
	YM+/5ZUL9iVAIZtYovHwGuCB4lXAqZiPG9fVBaiY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hIt+iLZaPtwaDoqT1NKeWxZ0TWb2Pm2r6Nguu+YfsFk=;
	b=eLI46t/kmFJGTJQ34of8IVxfw9hAA5hTjUc0cSdILfNfVc3WY2J59GErrt9UEzOJ
	X5vsrEB7Yt/u04O/Diqf6wR4mO39r8fZJo25JJ7tg1LbGvUUH4BK3YDpwYsQbWns3h0
	mWjGa5QcgeF/6bFhOH/Als9i+rk52wudED15jEhY=
Content-Type: multipart/mixed; boundary="===============8637645799429665981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] powertop: upgrading to 2.15 SUCCEEDED
Message-ID: 
 <010101839477e57d-9dcbd0ca-2396-419c-83bd-ebcb4e27498b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171336

--===============8637645799429665981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *powertop* to *2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-powertop-upgrade-2.14-2.15.patch
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
--===============8637645799429665981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/powertop: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop: SRC_URI changed from "git://github.com/fenrus75/powertop;protocol=https;branch=master file://0001-wakeup_xxx.h-include-limits.h.patch file://0001-src-fix-compatibility-with-ncurses-6.3.patch" to "git://github.com/fenrus75/powertop;protocol=https;branch=master file://0001-wakeup_xxx.h-include-limits.h.patch"
packages/core2-32-poky-linux/powertop: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-bash-completion: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-bash-completion: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-dbg: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-dbg: PKGSIZE changed from 7263612 to 6929396 (-5%)
packages/core2-32-poky-linux/powertop/powertop-dbg: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-dev: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-dev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-doc: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-doc: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-ca: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-ca: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-cs-cz: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-cs-cz: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-de-de: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-de-de: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-en-gb: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-en-gb: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-en-us: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-en-us: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-es-es: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-es-es: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-hu-hu: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-hu-hu: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-id-id: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-id-id: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-nl-nl: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-nl-nl: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-locale-zh-tw: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-locale-zh-tw: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-src: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-src: PKGSIZE changed from 774344 to 775489 (+0%)
packages/core2-32-poky-linux/powertop/powertop-src: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop-staticdev: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop-staticdev: PKGV changed from 2.14 [default] to 2.15 [default]
packages/core2-32-poky-linux/powertop/powertop: PV changed from "2.14" to "2.15"
packages/core2-32-poky-linux/powertop/powertop: PKGSIZE changed from 579176 to 570984 (-1%)
packages/core2-32-poky-linux/powertop/powertop: PKGV changed from 2.14 [default] to 2.15 [default]

--===============8637645799429665981==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-powertop-upgrade-2.14-2.15.patch"

RnJvbSAwMzgzNTYyYzVkYTdhZmI0ZTYwZTdhYjVhOWQwMjBlOWU5OTBhZDA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNDowMDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBv
d2VydG9wOiB1cGdyYWRlIDIuMTQgLT4gMi4xNQoKLS0tCiAuLi5jLWZpeC1jb21wYXRpYmlsaXR5
LXdpdGgtbmN1cnNlcy02LjMucGF0Y2ggfCA1MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4ve3Bv
d2VydG9wXzIuMTQuYmIgPT4gcG93ZXJ0b3BfMi4xNS5iYn0gICAgfCAgMyArLQogMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNTQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9wb3dlcnRvcC8wMDAxLXNyYy1maXgtY29t
cGF0aWJpbGl0eS13aXRoLW5jdXJzZXMtNi4zLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtl
cm5lbC9wb3dlcnRvcC97cG93ZXJ0b3BfMi4xNC5iYiA9PiBwb3dlcnRvcF8yLjE1LmJifSAoODcl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3AvMDAw
MS1zcmMtZml4LWNvbXBhdGliaWxpdHktd2l0aC1uY3Vyc2VzLTYuMy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3AvMDAwMS1zcmMtZml4LWNvbXBhdGliaWxpdHkt
d2l0aC1uY3Vyc2VzLTYuMy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggODRi
MDVhYzk3MS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3Bvd2VydG9wL3Bv
d2VydG9wLzAwMDEtc3JjLWZpeC1jb21wYXRpYmlsaXR5LXdpdGgtbmN1cnNlcy02LjMucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw1MiArMCwwIEBACi1Gcm9tIDc2ZDNmMDg1MTUyMGJjODQ4OGU0
MzJmNDIzOTQxZjFlNzJjYzc0MDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogTW9uLCAyNSBPY3QgMjAy
MSAxNzo0NzoyMyArMDIwMAotU3ViamVjdDogW1BBVENIXSBzcmM6IGZpeCBjb21wYXRpYmlsaXR5
IHdpdGggbmN1cnNlcyA2LjMKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9mZW5ydXM3NS9wb3dlcnRvcC9wdWxsLzkyXQotU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHNyYy9kZXZpY2VzL2Rl
dmZyZXEuY3BwIHwgMiArLQotIHNyYy9kaXNwbGF5LmNwcCAgICAgICAgIHwgMiArLQotIHNyYy9s
aWIuY3BwICAgICAgICAgICAgIHwgMiArLQotIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2RldmljZXMvZGV2ZnJlcS5j
cHAgYi9zcmMvZGV2aWNlcy9kZXZmcmVxLmNwcAotaW5kZXggMDUwOWQwZi4uYjE5NGFjNCAxMDA2
NDQKLS0tLSBhL3NyYy9kZXZpY2VzL2RldmZyZXEuY3BwCi0rKysgYi9zcmMvZGV2aWNlcy9kZXZm
cmVxLmNwcAotQEAgLTI5Nyw3ICsyOTcsNyBAQCB2b2lkIGRpc3BsYXlfZGV2ZnJlcV9kZXZpY2Vz
KHZvaWQpCi0gCQkJZGYtPmZpbGxfZnJlcV91dGlsaXphdGlvbihqLCBidWYpOwotIAkJCXN0cmNh
dChmbGluZSwgYnVmKTsKLSAJCQlzdHJjYXQoZmxpbmUsICJcbiIpOwotLQkJCXdwcmludHcod2lu
LCBmbGluZSk7Ci0rCQkJd3ByaW50dyh3aW4sICIlcyIsIGZsaW5lKTsKLSAJCX0KLSAJCXdwcmlu
dHcod2luLCAiXG4iKTsKLSAJfQotZGlmZiAtLWdpdCBhL3NyYy9kaXNwbGF5LmNwcCBiL3NyYy9k
aXNwbGF5LmNwcAotaW5kZXggNzEzMTE0NC4uY2MwMzkxOSAxMDA2NDQKLS0tLSBhL3NyYy9kaXNw
bGF5LmNwcAotKysrIGIvc3JjL2Rpc3BsYXkuY3BwCi1AQCAtMTI1LDcgKzEyNSw3IEBAIHZvaWQg
c2hvd190YWIodW5zaWduZWQgaW50IHRhYikKLSAKLSAJYyA9IGJvdHRvbV9saW5lc1t0YWJfbmFt
ZXNbdGFiXV0uY19zdHIoKTsKLSAJaWYgKGMgJiYgc3RybGVuKGMpID4gMCkKLS0JCW12d3ByaW50
dyhib3R0b21fbGluZSwgMCwwLCBjKTsKLSsJCW12d3ByaW50dyhib3R0b21fbGluZSwgMCwwLCAi
JXMiLCBjKTsKLSAJZWxzZQotIAkJbXZ3cHJpbnR3KGJvdHRvbV9saW5lLCAwLCAwLAotIAkJCSI8
RVNDPiAlcyB8IDxUQUI+IC8gPFNoaWZ0ICsgVEFCPiAlcyB8ICIsIF8oIkV4aXQiKSwKLWRpZmYg
LS1naXQgYS9zcmMvbGliLmNwcCBiL3NyYy9saWIuY3BwCi1pbmRleCA1ZTQ4ZjM3Li41Y2QxYzRh
IDEwMDY0NAotLS0tIGEvc3JjL2xpYi5jcHAKLSsrKyBiL3NyYy9saWIuY3BwCi1AQCAtNTgzLDcg
KzU4Myw3IEBAIHZvaWQgdWlfbm90aWZ5X3VzZXJfbmN1cnNlcyhjb25zdCBjaGFyICpmcm10LCAu
Li4pCi0gCSAqIGJ1ZmZlciAqLwotIAl2c25wcmludGYobm90aWZ5LCBVSV9OT1RJRllfQlVGRl9T
WiAtIDEsIGZybXQsIGxpc3QpOwotIAl2YV9lbmQobGlzdCk7Ci0tCW12cHJpbnR3KDEsIDAsIG5v
dGlmeSk7Ci0rCW12cHJpbnR3KDEsIDAsICIlcyIsIG5vdGlmeSk7Ci0gCWF0dHJvZmYoQ09MT1Jf
UEFJUigxKSk7Ci0gfQotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRv
cC9wb3dlcnRvcF8yLjE0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dlcnRvcC9wb3dlcnRv
cF8yLjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4xNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtl
cm5lbC9wb3dlcnRvcC9wb3dlcnRvcF8yLjE1LmJiCmluZGV4IGEyZjMwMDQwYjUuLjBhYWU0Yzkz
OTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4x
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3Bvd2VydG9wL3Bvd2VydG9wXzIuMTUuYmIK
QEAgLTgsOSArOCw4IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTEy
Zjg4NGQyYWUxZmY4N2MwOWU1YjdjY2MyYzRjYTdlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vZmVucnVzNzUvcG93ZXJ0b3A7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXdha2V1cF94eHguaC1pbmNsdWRlLWxpbWl0cy5oLnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtc3JjLWZpeC1jb21wYXRpYmlsaXR5LXdpdGgtbmN1
cnNlcy02LjMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNTJmMDIyZjliYmU2ZTA2
MGZiYTExNzAxZDY1N2E4ZDk3NjI3MDJiYSIKK1NSQ1JFViA9ICJkNTFhZDM5NTQzNmQ0ZDFkY2Mz
Y2E0NmUxNTE5ZmZlYjQ3NWJmNjUxIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjMx
LjEKCg==

--===============8637645799429665981==--

