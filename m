Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDF7C74A44
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.10293.1676508397443074485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=asTm2twy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657affca0-2f42f405-f654-48e3-b63e-22a67ad0c414-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B/G7qNV+dza0nR6u+Seg46IQcDiFsOPoW2msxRCnAb4=;
	b=asTm2twyEz3eO1rVZGUAOSZn5t6aqQjrBxq44GO2Pbpa8l5ql4WozwCV7+GmkLQa
	xydo/8Yq+AmjW2xRT+JKQYN86CrNh/DDHh+oXqWJ/DojAEMvTY5JJV2Gun2M2yscVFr
	4EETeqyh710M9Z4OvskfJtCFBsWDm/4vc+oCyXwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B/G7qNV+dza0nR6u+Seg46IQcDiFsOPoW2msxRCnAb4=;
	b=K6jW/NoJAb7TJLv0fjVYHSDrCAm4TpMOdPi3BIWHlHsQAYjzkyHSJNxEnjnV+2Hx
	yII/ix63dYygyq736ZLemmtk+CRUGDLPhvbPra5lZY91hKxAYA+jvXI664pV6VEe5ps
	ep00uMy5W+9GbP+YdURS3QLE7Y7YbrBZ7wreFgEc=
Content-Type: multipart/mixed; boundary="===============1674556385209645297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.03 SUCCEEDED
Message-ID: <0101018657affca0-2f42f405-f654-48e3-b63e-22a67ad0c414-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177244

--===============1674556385209645297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.02-6.03.patch
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
--===============1674556385209645297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.02.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.03.tar.gz"
packages/core2-32-poky-linux/man-pages: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.02 [default] to 6.03 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 7450162 to 7486541 (+0%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3type/printf_arginfo_size_function.3type /usr/share/man/man3type/printf_va_arg_function.3type /usr/share/man/man3/arc4random_uniform.3 /usr/share/man/man3head/printf.h.3head /usr/share/man/man3const/PA_FLOAT.3const /usr/share/man/man3const/PA_FLAG_LONG_DOUBLE.3const /usr/share/man/man3const/PA_FLAG_PTR.3const /usr/share/man/man3/arc4random_buf.3 /usr/share/man/man3/register_printf_type.3 /usr/share/man/man3const/PA_WSTRING.3const /usr/share/man/man3/register_printf_modifier.3 /usr/share/man/man3const/PA_FLAG_LONG.3const /usr/share/man/man3const/PA_INT.3const /usr/share/man/man3/register_printf_specifier.3 /usr/share/man/man3const/PA_WCHAR.3const /usr/share/man/man3const/PA_POINTER.3const /usr/share/man/man3const/PA_FLAG_LONG_LONG.3const /usr/share/man/man3const/PA_FLAG_SHORT.3const /usr/share/man/man3/arc4random.3 /usr/share/man/man3const/PA_DOUBLE.3const /usr/share/man/man3const/PA_STRING.3const /us
 r/share/man/man3/powerof2.3 /usr/share/man/man3const/PA_CHAR.3const /usr/share/man/man3const/PA_LAST.3const /usr/share/man/man3/roundup.3 /usr/share/man/man3type/printf_function.3type /usr/share/man/man3type/printf_info.3type"
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "6.02" to "6.03"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 6.02 [default] to 6.03 [default]

--===============1674556385209645297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3type/printf_function.3type /usr/share/man/man3const/PA_POINTER.3const /usr/share/man/man3const/PA_STRING.3const /usr/share/man/man3/arc4random_buf.3 /usr/share/man/man3const/PA_DOUBLE.3const /usr/share/man/man3/roundup.3 /usr/share/man/man3const/PA_FLAG_SHORT.3const /usr/share/man/man3const/PA_LAST.3const /usr/share/man/man3type/printf_arginfo_size_function.3type /usr/share/man/man3head/printf.h.3head /usr/share/man/man3/powerof2.3 /usr/share/man/man3/arc4random_uniform.3 /usr/share/man/man3const/PA_FLOAT.3const /usr/share/man/man3const/PA_WCHAR.3const /usr/share/man/man3type/printf_info.3type /usr/share/man/man3type/printf_va_arg_function.3type /usr/share/man/man3const/PA_INT.3const /usr/share/man/man3/arc4random.3 /usr/share/man/man3const/PA_FLAG_LONG.3const /usr/share/man/man3const/PA_FLAG_LONG_DOUBLE.3const /usr/share/man/man3/register_printf_specifier.3 /usr/share/man/man3/register_printf_type.
 3 /usr/share/man/man3/register_printf_modifier.3 /usr/share/man/man3const/PA_WSTRING.3const /usr/share/man/man3const/PA_FLAG_PTR.3const /usr/share/man/man3const/PA_FLAG_LONG_LONG.3const /usr/share/man/man3const/PA_CHAR.3const"

--===============1674556385209645297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.02-6.03.patch"

RnJvbSA0MjhjYzkyZmFiYmZkNmJmZjM2ZTU2NzUxYWQzZTA1YTQ5YWMxNTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTk6Mzc6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNi4wMiAtPiA2LjAzCgotLS0KIC4uLi97bWFuLXBhZ2VzXzYuMDIu
YmIgPT4gbWFuLXBhZ2VzXzYuMDMuYmJ9ICB8IDI4ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMve21hbi1wYWdlc182LjAyLmJiID0+IG1hbi1wYWdl
c182LjAzLmJifSAoNjUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4t
cGFnZXMvbWFuLXBhZ2VzXzYuMDIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2Vz
L21hbi1wYWdlc182LjAzLmJiCnNpbWlsYXJpdHkgaW5kZXggNjUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDMuYmIKaW5kZXggOGYx
ZWIzODA4Mi4uZjQzZmI0NzNiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21h
bi1wYWdlcy9tYW4tcGFnZXNfNi4wMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjAzLmJiCkBAIC0xLDEwICsxLDMyIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gUkVBRE1FCisjICsrKyBSRUFETUUKKyMgQEAgLTYyLDcgKzYyLDcgQEAKKyMgICAg
ICAgICBUYXJiYWxscyBvZiByZWxlYXNlcyBzdGFydGluZyBmcm9tIDIuMDAgYXJlIGF2YWlsYWJs
ZSBhdAorIyAgICAgICAgIDxodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9saW51
eC9kb2NzL21hbi1wYWdlcy8+LgorIyAgCisjIC0gICAgICAgVGhlIGdpdCgxKSByZXBvc2l0b3J5
IGNvdmVycyB0aGUgZGV2ZWxvcG1lbnQgc2luY2UgMS43MDoKKyMgKyAgICAgICBUaGUgZ2l0KDEp
IHJlcG9zaXRvcnkgY2FuIGJlIGZvdW5kIGF0OgorIyAgICAgICAgIDxnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2RvY3MvbWFuLXBhZ2VzL21hbi1wYWdlcy5naXQ+CisjICAKKyMgICAgICAg
ICBBIHNlY29uZGFyeSBnaXQoMSkgcmVwb3NpdG9yeSBjYW4gYmUgZm91bmQgYXQ6CisjIAorIwor
CiBTVU1NQVJZID0gIkxpbnV4IG1hbi1wYWdlcyIKIERFU0NSSVBUSU9OID0gIlRoZSBMaW51eCBt
YW4tcGFnZXMgcHJvamVjdCBkb2N1bWVudHMgdGhlIExpbnV4IGtlcm5lbCBhbmQgQyBsaWJyYXJ5
IGludGVyZmFjZXMgdGhhdCBhcmUgZW1wbG95ZWQgYnkgdXNlciBwcm9ncmFtcyIKIFNFQ1RJT04g
PSAiY29uc29sZS91dGlscyIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIv
bGludXgvZG9jcy9tYW4tcGFnZXMiCiBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgJiBHUEwt
Mi4wLW9ubHkgJiBHUEwtMS4wLW9yLWxhdGVyICYgQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNl
ICYgQlNELTQtQ2xhdXNlICYgTUlUIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFE
TUU7bWQ1PTI2OTAxNDA4ZDhjZmQ2ZjY2NzVmOGI0OWRhZjljYzc0IFwKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL1JFQURNRTttZDU9MGZkYWQzOWViYWE5NzNhNTA3ODVmNzlmMGY1OWY4N2Yg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvQlNELTItQ2xhdXNlLnR4dDtt
ZDU9ZDBmMjgwZDEwNThlNzdlNjYyNjRhOWI5ZTEwZTZjODkgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5TRVMvQlNELTMtQ2xhdXNlLnR4dDttZDU9NzFmNzM5ZWY3NTU4MWNhZTMx
MmU4YzcxMWJjZGFiMTYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvQlNE
LTQtQ2xhdXNlLVVDLnR4dDttZDU9MWRhM2NmOGFkNTBjZDhkNWQxZGUzY2ZjNTMxOTZkMDEgXApA
QCAtMTMsMTAgKzM1LDEwIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRTttZDU9
MjY5MDE0MDhkOGNmZDZmNjY3NWY4YjQ5ZGFmOWNjNzQgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5TRVMvR1BMLTIuMC1vci1sYXRlci50eHQ7bWQ1PTNkMjYyMDMzMDNhNzIyZGVk
YzZiZjkwOWQ5NWJhODE1IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0xp
bnV4LW1hbi1wYWdlcy1jb3B5bGVmdC50eHQ7bWQ1PTE3M2I5NjBjNjg2ZmYyZDI2ZjA0M2RkYWVi
NjNmNmNlIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL01JVC50eHQ7bWQ1
PTdkZGE0ZTkwZGVkNjZhYjg4Yjg2Zjc2MTY5ZjI4NjYzIFwKLSAgICAgICAgICAgICAgICAgICAi
CisgICAgICAgICAgICAgICAgICAgICIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9s
aW51eC9kb2NzLyR7QlBOfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5
NjhkZWY5ZTcwNTVjOWNiY2E5YTRmMjFmNzk2NzdiMDJhYzhiMGQyZmE2MmNlZWE3YmQ4ZWY0ZGNj
NmNhYzQxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc2ZWNhMDQ1YjQyYTkwZGQyNWQwOTRjNDZk
OTdhYzkwMTg3YmMwZjFiZmNhMzU4YmI1ZGFlNWM0MzM3YWNiYjAiCiAKIGluaGVyaXQgbWFucGFn
ZXMKIAotLSAKMi4zNy4zCgo=

--===============1674556385209645297==--

