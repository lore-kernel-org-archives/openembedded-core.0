Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D460C6370D
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.5191.1668517535100873570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kxF/OfvX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101847b652331-99f9f6ca-ebe3-45cb-87a1-6e87158cd19e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bqLuDVq/vYISveZDA2sdeuTFBc/1vK7rdXUq4nCtSS8=;
	b=kxF/OfvX30VWeGLLzsEKyzY+YqrC3Vnr2X18+HEvpVBYEQuXon7+E71vnieH+BzH
	7j0rMayPxbs4NEk85+6HXoVxCWzjtQMQgiB/onn/ZijMeGRkMamqhU0NStDpaAUgxLl
	TKjHY9cUoxaIMyf7fCMm8vIks/Qiwvp6S8RK02Jg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bqLuDVq/vYISveZDA2sdeuTFBc/1vK7rdXUq4nCtSS8=;
	b=hIwExcKNLvwgRW59QvZuzHZdeIAaFid1gYH7zi6T2Tdej0ncEO3BECID8y4AKo3f
	2PgHQ6TJxLdXyEnFf9AzlclMKtr3m/hK4V4ZRbVLiT9xnan0xy1mLTRA0pE/ptWx0cM
	aUzObKzpJnPRtdslLzRuNd+1Oc6crZtKn36QGIpY=
Content-Type: multipart/mixed; boundary="===============2811262597240084967=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.8 SUCCEEDED
Message-ID: <010101847b652331-99f9f6ca-ebe3-45cb-87a1-6e87158cd19e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173324

--===============2811262597240084967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemtap-uprobes-upgrade-4.7-4.8.patch
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
--===============2811262597240084967==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-uprobes-upgrade-4.7-4.8.patch"

RnJvbSBiMjQ0YzI1YjI0NTI1MzFkM2Q2YTc0MWUxZjU5YTRlMzgxMzg1YjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6MDI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW10YXAtdXByb2JlczogdXBncmFkZSA0LjcgLT4gNC44CgotLS0KIC4uLi9zeXN0ZW10YXAv
c3lzdGVtdGFwLXVwcm9iZXNfZ2l0LmJiICAgICAgICB8ICAxICsKIC4uLi9zeXN0ZW10YXAvc3lz
dGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoICAgICB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Li9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMgICAgICAgICAgICAgICB8ICA1ICstLQogMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC9weXRob24t
My4xMS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC11cHJvYmVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC11cHJvYmVzX2dpdC5iYgppbmRleCAyMTgxZTQ1YThkLi5hYWMyYjg3MWE3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAtdXByb2Jlc19n
aXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLXVwcm9i
ZXNfZ2l0LmJiCkBAIC0zOCwzICszOCw0IEBAIGRvX2luc3RhbGwoKSB7CiAJCWluc3RhbGwgLW0g
MDY0NCAke1N9L3J1bnRpbWUvdXByb2Jlcy91cHJvYmVzLmtvICR7RH0ke2RhdGFkaXJ9L3N5c3Rl
bXRhcC9ydW50aW1lL3Vwcm9iZXMvCiAJZmkKIH0KKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2ZTBjOTdiOGQ2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC9weXRob24tMy4xMS5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gMDY5ZTEwOWM5NWQxYWZjYTE3Y2QzNzgx
YjM5ZjIyMGNmOGIzOTk3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFN0YW4gQ294
IDxzY294QHJlZGhhdC5jb20+Ci1EYXRlOiBXZWQsIDEzIEp1bCAyMDIyIDA5OjQ5OjUxIC0wNDAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMS8xXSBweXRob24gMy4xMSByZW1vdmVkIGRpcmVjdCBhY2Nlc3Mg
dG8gUHlGcmFtZU9iamVjdAotIG1lbWJlcnMKLQotVGFrZSBpbnRvIGFjY291bnQgdGhlIGNoYW5n
ZSBpbiBQeUZyYW1lT2JqZWN0IGRlZmluaXRpb24gdG8gYWxsb3cKLWJ1aWxkaW5nIHN5c3RlbXRh
cCB3aXRoIHB5dGhvbiAzLjExLiAgQWRkaXRpb25hbCBzdXBwb3J0IGZvciBweXRob24KLTMuMTEg
aXMgZm9ydGhjb21pbmcuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc291
cmNld2FyZS5vcmcvZ2l0Lz9wPXN5c3RlbXRhcC5naXQ7YT1jb21taXQ7aD0wNjllMTA5Yzk1ZDFh
ZmNhMTdjZDM3ODFiMzlmMjIwY2Y4YjM5OTc4XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHB5dGhvbi9IZWxwZXJTRFQvX0hlbHBl
clNEVC5jIHwgNiArKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9weXRob24vSGVscGVyU0RUL19IZWxwZXJTRFQuYyBiL3B5dGhvbi9IZWxwZXJT
RFQvX0hlbHBlclNEVC5jCi1pbmRleCA5NjdjYjYwNzcuLjRkMjg3MTMyZSAxMDA2NDQKLS0tLSBh
L3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jCi0rKysgYi9weXRob24vSGVscGVyU0RUL19I
ZWxwZXJTRFQuYwotQEAgLTE0LDcgKzE0LDEzIEBACi0gLy8gUFIyNTg0MTogZW5zdXJlIHRoYXQg
dGhlIGxpYkhlbHBlclNEVC5zbyBmaWxlIGNvbnRhaW5zIGRlYnVnaW5mbwotIC8vIGZvciB0aGUg
dGFwc2V0IGhlbHBlciBmdW5jdGlvbnMsIHNvIHRoZXkgZG9uJ3QgaGF2ZSB0byBsb29rIGludG8g
bGlicHl0aG9uKgotICNpbmNsdWRlIDxmcmFtZW9iamVjdC5oPgotKy8vIHB5dGhvbiAzLjExIHJl
bW92ZWQgZGlyZWN0IGFjY2VzcyB0byBQeUZyYW1lT2JqZWN0IG1lbWJlcnMKLSsvLyBodHRwczov
L2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCNjLWFwaS1jaGFuZ2VzCi0r
I2lmIFBZX01BSk9SX1ZFUlNJT04gPD0gMyAmJiBQWV9NSU5PUl9WRVJTSU9OIDwgMTEKLSBQeUZy
YW1lT2JqZWN0IF9kdW1teV9mcmFtZTsKLSsjZWxzZQotKy8vUHlGcmFtZU9iamVjdCAqX2R1bW15
X2ZyYW1lOwotKyNlbmRpZgotICNpbmNsdWRlIDxvYmplY3QuaD4KLSBQeVZhck9iamVjdCBfZHVt
bXlfdmFyOwotICNpbmNsdWRlIDxkaWN0b2JqZWN0Lmg+Ci0tLSAKLTIuMzEuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYyBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCmluZGV4IGIwNWE1
YTJiMGQuLmQzMDlhODk0OTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVt
dGFwL3N5c3RlbXRhcF9naXQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFw
L3N5c3RlbXRhcF9naXQuaW5jCkBAIC0xLDEzICsxLDEyIEBACiBMSUNFTlNFID0gIkdQTC0yLjAt
b25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlm
NWZjZTQ0ODZhODBmZGFmNGE0MjYzIgotU1JDUkVWID0gIjBjMzM1YTc1YTc4OWZmNDRiNTE0ZTU2
N2Q0NTg4ODFlMTVjYzI4M2QiCi1QViA9ICI0LjciCitTUkNSRVYgPSAiYjE3NmFmYjJlNDkxMTll
Zjg0NGQxOTNkMjdiMDc1MmE2ZDg0ZmU4ZiIKK1BWID0gIjQuOCIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9zb3VyY2V3YXJlLm9yZy9naXQvc3lzdGVtdGFwLmdpdDticmFuY2g9bWFzdGVyIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtRG8tbm90LWxldC1jb25maWd1cmUtd3JpdGUtYS1weXRob24tbG9j
YXRpb24taW50by10aC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUluc3RhbGwtcHl0
aG9uLW1vZHVsZXMtdG8tY29ycmVjdC1saWJyYXJ5LWRpci5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXN0YXBydW4tc3RhcGJwZi1kb24tdC1zdXBwb3J0LWluc3RhbGxpbmctYS1ub24t
cm9vdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9weXRob24tMy4xMS5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAogQ09NUEFUSUJMRV9IT1NUID0gJyh4ODZfNjR8aS44Nnxwb3dlcnBjfGFybXxh
YXJjaDY0fG1pY3JvYmxhemVlbHxtaXBzfHJpc2N2NjQpLiotbGludXgnCi0tIAoyLjMxLjEKCg==

--===============2811262597240084967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/tapset/python3_local.stp /usr/share/systemtap/examples/general/tapset/python2_local.stp /usr/share/systemtap/examples/general/py3example.stp /usr/share/systemtap/examples/general/tapset/python_local.stpm /usr/share/systemtap/examples/general/py2example.stp", added "/usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp /usr/share/systemtap/examples/general/pyexample.stp /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp"
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"

--===============2811262597240084967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1666 targets, 49 skipped, 0 masked, 0 errors.
Removing 44 recipes from the core2-32 sysroot...done.
Removing 46 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemtap-uprobes'
systemtap-uprobes was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============2811262597240084967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemtap: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch"
packages/core2-32-poky-linux/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGSIZE changed from 58106244 to 58645188 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGSIZE changed from 22718 to 22433 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-dev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGSIZE changed from 468954 to 469215 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-doc: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGSIZE changed from 1505292 to 1484450 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-examples: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/py3example.stp /usr/share/systemtap/examples/general/tapset/python3_local.stp /usr/share/systemtap/examples/general/py2example.stp /usr/share/systemtap/examples/general/tapset/python2_local.stp /usr/share/systemtap/examples/general/tapset/python_local.stpm", added "/usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp /usr/share/systemtap/examples/general/pyexample.stp /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-python: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-python: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGSIZE changed from 2914280 to 2942351 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-src: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap: PKGSIZE changed from 9613929 to 9680063 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"
packages/core2-32-poky-linux/systemtap/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch"
packages/qemux86-poky-linux/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]

--===============2811262597240084967==--

