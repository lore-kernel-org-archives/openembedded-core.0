Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA22C63706
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.46763.1669908625631840488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J5hQwpj9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010184ce4f81d9-14b9211b-5162-4e0c-8e91-66c5ab7496fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sUSy07dhy1XFi0AaFojM200KLZqsHP14vQ6ovaC/gP0=;
	b=J5hQwpj9p1ojZ/Sc4JuONeUtaoIB4BgdinQ+BHuK2lsVzD1XZgYUF++iYKqFFRz1
	9RMcjiTyVQseI8GNhs+XR/pC2T8nC+ZMuUdEI9OUVSDVw8YgTTh9UMwdQHSkPnSalVm
	DDyizaN+t8vS4elhGWNXvAIwxPWpTjNTZaLaG7Bw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sUSy07dhy1XFi0AaFojM200KLZqsHP14vQ6ovaC/gP0=;
	b=QuRxJ8LF0AWfaGvTp1AamLMErQrnShQiCEz7csI9H0DT64tCMfQqU3/tzLwEHa8o
	EIDMgDJbyrWATc3K5/thv2D9GPNiKdarx88rGezHo7inK7ltehbUpm+3xIZCx+uhfog
	rsgR1nqbnlm/6Q9R6x3pQUhupGeYGezadL2WGgsU=
Content-Type: multipart/mixed; boundary="===============6979331522364428649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 4.8 FAILED
Message-ID: <01010184ce4f81d9-14b9211b-5162-4e0c-8e91-66c5ab7496fb-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174180

--===============6979331522364428649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap* to *4.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemtap-upgrade-4.7-4.8.patch
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
--===============6979331522364428649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-4.7-4.8.patch"

RnJvbSA0MTEyYTAxY2RmODUyM2ZiMDVkY2M2NzA3NzQ2NGZlNTI0ZDQ5ZjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMzo0MDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbXRhcDogdXBncmFkZSA0LjcgLT4gNC44CgotLS0KIC4uLi9zeXN0ZW10YXAvc3lzdGVtdGFw
L3B5dGhvbi0zLjExLnBhdGNoICAgICB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYiB8ICA1ICsrLQogLi4uL3N5c3Rl
bXRhcC9zeXN0ZW10YXBfZ2l0LmluYyAgICAgICAgICAgICAgIHwgIDQgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvcHl0aG9uLTMuMTEucGF0
Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAv
cHl0aG9uLTMuMTEucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10
YXAvcHl0aG9uLTMuMTEucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDZlMGM5
N2I4ZDYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lz
dGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzcgKzAsMCBAQAot
RnJvbSAwNjllMTA5Yzk1ZDFhZmNhMTdjZDM3ODFiMzlmMjIwY2Y4YjM5OTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogU3RhbiBDb3ggPHNjb3hAcmVkaGF0LmNvbT4KLURhdGU6IFdl
ZCwgMTMgSnVsIDIwMjIgMDk6NDk6NTEgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzFdIHB5dGhv
biAzLjExIHJlbW92ZWQgZGlyZWN0IGFjY2VzcyB0byBQeUZyYW1lT2JqZWN0Ci0gbWVtYmVycwot
Ci1UYWtlIGludG8gYWNjb3VudCB0aGUgY2hhbmdlIGluIFB5RnJhbWVPYmplY3QgZGVmaW5pdGlv
biB0byBhbGxvdwotYnVpbGRpbmcgc3lzdGVtdGFwIHdpdGggcHl0aG9uIDMuMTEuICBBZGRpdGlv
bmFsIHN1cHBvcnQgZm9yIHB5dGhvbgotMy4xMSBpcyBmb3J0aGNvbWluZy4KLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9c3lzdGVtdGFw
LmdpdDthPWNvbW1pdDtoPTA2OWUxMDljOTVkMWFmY2ExN2NkMzc4MWIzOWYyMjBjZjhiMzk5Nzhd
Ci1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgot
LS0tCi0gcHl0aG9uL0hlbHBlclNEVC9fSGVscGVyU0RULmMgfCA2ICsrKysrKwotIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3B5dGhvbi9IZWxwZXJTRFQv
X0hlbHBlclNEVC5jIGIvcHl0aG9uL0hlbHBlclNEVC9fSGVscGVyU0RULmMKLWluZGV4IDk2N2Ni
NjA3Ny4uNGQyODcxMzJlIDEwMDY0NAotLS0tIGEvcHl0aG9uL0hlbHBlclNEVC9fSGVscGVyU0RU
LmMKLSsrKyBiL3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jCi1AQCAtMTQsNyArMTQsMTMg
QEAKLSAvLyBQUjI1ODQxOiBlbnN1cmUgdGhhdCB0aGUgbGliSGVscGVyU0RULnNvIGZpbGUgY29u
dGFpbnMgZGVidWdpbmZvCi0gLy8gZm9yIHRoZSB0YXBzZXQgaGVscGVyIGZ1bmN0aW9ucywgc28g
dGhleSBkb24ndCBoYXZlIHRvIGxvb2sgaW50byBsaWJweXRob24qCi0gI2luY2x1ZGUgPGZyYW1l
b2JqZWN0Lmg+Ci0rLy8gcHl0aG9uIDMuMTEgcmVtb3ZlZCBkaXJlY3QgYWNjZXNzIHRvIFB5RnJh
bWVPYmplY3QgbWVtYmVycwotKy8vIGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuMTEvd2hhdHNu
ZXcvMy4xMS5odG1sI2MtYXBpLWNoYW5nZXMKLSsjaWYgUFlfTUFKT1JfVkVSU0lPTiA8PSAzICYm
IFBZX01JTk9SX1ZFUlNJT04gPCAxMQotIFB5RnJhbWVPYmplY3QgX2R1bW15X2ZyYW1lOwotKyNl
bHNlCi0rLy9QeUZyYW1lT2JqZWN0ICpfZHVtbXlfZnJhbWU7Ci0rI2VuZGlmCi0gI2luY2x1ZGUg
PG9iamVjdC5oPgotIFB5VmFyT2JqZWN0IF9kdW1teV92YXI7Ci0gI2luY2x1ZGUgPGRpY3RvYmpl
Y3QuaD4KLS0tIAotMi4zMS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lz
dGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXBfZ2l0LmJiCmluZGV4IDA3MmZjYjMxMGEuLjVkZDNmZThkZWIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYgpAQCAtNiw3ICs2LDEw
IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvc3lzdGVtdGFwLyIKIAogcmVx
dWlyZSBzeXN0ZW10YXBfZ2l0LmluYwogCi1TUkNfVVJJICs9ICIgXAorU1JDX1VSSSArPSAiZ2l0
Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5naXQ7YnJhbmNoPW1hc3RlciBcCisgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxv
Y2F0aW9uLWludG8tdGgucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1JbnN0YWxsLXB5
dGhvbi1tb2R1bGVzLXRvLWNvcnJlY3QtbGlicmFyeS1kaXIucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vMDAwMS1zdGFwcnVuLXN0YXBicGYtZG9uLXQtc3VwcG9ydC1pbnN0YWxsaW5nLWEtbm9u
LXJvb3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbXByb3ZlLXJlcHJvZHVjaWJp
bGl0eS1mb3ItYy1jb21waWxpbmcucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1zdGFw
cnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMucGF0Y2ggXAogICAgICAgICAgICAiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0Lmlu
YyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCmluZGV4
IGIwNWE1YTJiMGQuLmVjZThiYWNlOTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
c3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lz
dGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCkBAIC0xLDcgKzEsNyBAQAogTElDRU5TRSA9ICJHUEwt
Mi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKLVNSQ1JFViA9ICIwYzMzNWE3NWE3ODlmZjQ0YjUx
NGU1NjdkNDU4ODgxZTE1Y2MyODNkIgotUFYgPSAiNC43IgorU1JDUkVWID0gImIxNzZhZmIyZTQ5
MTE5ZWY4NDRkMTkzZDI3YjA3NTJhNmQ4NGZlOGYiCitQViA9ICI0LjgiCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5naXQ7YnJhbmNoPW1hc3RlciBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9u
LWxvY2F0aW9uLWludG8tdGgucGF0Y2ggXAotLSAKMi4zMS4xCgo=

--===============6979331522364428649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb: Unable to get checksum for systemtap-uprobes SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for nativesdk-systemtap-native SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for nativesdk-systemtap SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: Parsing halted due to errors, see error messages above

--===============6979331522364428649==--

