Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E9CA9EB9
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.7639.1685693434086172050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R6hvEdhX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b28862d-2d01292a-f2a4-4872-90b8-2ca0a222810d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wRcDjpaBRy3S4Edeb51J7Z/iv3779SIkoBKPrnnbYmQ=;
	b=R6hvEdhXQDsaQaAG62pWmLjuZkZ2V6LNUK8FlnIZ3oNE+LTatg/hzHvzWWXMNGwE
	fkLBkbNfoxgmEwoo3K2nrdQHQz0F4Z1dKL/qmy1Y5F63nSa1rxkXvikynZxKcnjgpX+
	F4LiQ+eqtvZu7XPSwqbnB8HjDE2mIc767SK7eIxU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wRcDjpaBRy3S4Edeb51J7Z/iv3779SIkoBKPrnnbYmQ=;
	b=EqLYEjplzVm7ComU+vzbRvOTiDUFlRQxNNRgDt8KRdtWmVg3G1Ov+1g8ul9kGhXm
	znrnJzU9rTRz6hYC7snFOkpa3Ar+wJceXo88ktxGLBiRQS+KZAcqeArMdFuJZ7RNPMR
	RyciqL9lbqZ6p3Ats5jz8WXsDp1XKgPUGql36IbU=
Content-Type: multipart/mixed; boundary="===============3336020826022479141=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.11.3 SUCCEEDED
Message-ID: <010101887b28862d-2d01292a-f2a4-4872-90b8-2ca0a222810d-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182220

--===============3336020826022479141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.11.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.11.2-3.11.3.patch
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
--===============3336020826022479141==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.11.2-3.11.3.patch"

RnJvbSA2ZWI3NDk0NjgwZWJlMzRmOTczNzQ3MzA5OTI2NmExMTM3NmUwMjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxODoxNzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjM6IHVwZ3JhZGUgMy4xMS4yIC0+IDMuMTEuMwoKLS0tCiAuLi4vMDAwMS1Eb24tdC1zZWFy
Y2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaCAgICAgICAgfCAyICstCiAuLi4x
LUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0
Y2ggfCAyICstCiAuLi4vcHl0aG9uMy8xMi1kaXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFn
aW5nLWFyZWEucGF0Y2ggICAgfCAyICstCiAuLi4vcHl0aG9uL3tweXRob24zXzMuMTEuMi5iYiA9
PiBweXRob24zXzMuMTEuMy5iYn0gICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3tweXRob24zXzMuMTEuMi5iYiA9PiBweXRob24zXzMuMTEuMy5iYn0gKDk5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAw
MS1Eb24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLURvbi10LXNlYXJjaC1zeXN0ZW0t
Zm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCmluZGV4IDk2ZTVlODEzNDIuLmM5MjUzODMyY2Yg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLURv
bi10LXNlYXJjaC1zeXN0ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLURvbi10LXNlYXJjaC1zeXN0ZW0t
Zm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZDI5NmRj
NjM1YWQzYWMyNzkyOTU1Y2UzN2UxNDBhNDEwNGIwOThmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2Y2I2NjdmMzdiZWFjZDgzMmNiNDA5ZTUyNDRiM2M5MGRmYWQzMmY3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5j
b20+CiBEYXRlOiBXZWQsIDQgTWFyIDIwMjAgMDA6MDY6NDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gRG9uJ3Qgc2VhcmNoIHN5c3RlbSBmb3IgaGVhZGVycy9saWJyYXJpZXMKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcu
cHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVm
aXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNoCmluZGV4IDg2OTcxZjQwNDguLmQ1Yjdj
ZTJiOTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8w
MDAxLUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3Uu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGli
LXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gY2FiOGI4YjEzOTAxNjVhOTNkZmIyN2M0OGMxY2M0YzNlNDI4
MGRmZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGVkNDgxZjQ5MjhjMzYxOTcwZTc4
ZjI3YzRkOWJlODcwMGFmMTc2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDEwIFNlcCAyMDIx
IDEyOjI4OjMxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIExpYi9zeXNjb25maWcucHk6IHVzZSBw
cmVmaXggdmFsdWUgZnJvbSBidWlsZCBjb25maWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNp
ZGUtc3RhZ2luZy1hcmVhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmctYXJlYS5wYXRjaAppbmRl
eCBlMDgwYjVjNTYyLi41ZWU0ZTRmMTI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1h
cmVhLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8xMi1k
aXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDc5ZTdlZDU5NzUwNjEyZTU3NjQ3ODQ3OTU3YWI4NTcwOTMwN2VhMzggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRjMzkyNTJjNzFkOGJjYTgxZmRjNDM3NTNjODNhNTlm
ODY2OGM2MTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAxNCBNYXkgMjAxMyAxNTowMDoyNiAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBweXRob24zOiBBZGQgdGFyZ2V0IGFuZCBuYXRpdmUgcmVjaXBlcwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTEuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjMuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zXzMuMTEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zXzMuMTEuMy5iYgppbmRleCA0MjFhMzA1ZTIyLi5jNzk3NDg0OWI2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMS4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjMuYmIKQEAgLTM5LDcgKzM5LDcg
QEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8x
Mi1kaXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmll
cy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOWU0YjhmNWYx
NjU4NTQyYThjMTNlMmRkMjc3MzU4YzljNDhmMmIyZjczMTg2NTJlZjE2NzVlNDAyYjlkMmFmIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhNWRiOTljOTYxYTdlY2YyN2M3NTk1NjE4OWM5NjAyYzk2
ODc1MWYxMWRiZWFlMmI5MDBkYmZmMWMwODViNWUiCiAKICMgZXhjbHVkZSBwcmUtcmVsZWFzZXMg
Zm9yIGJvdGggcHl0aG9uIDIueCBhbmQgMy54CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJbUHBd
eXRob24tKD9QPHB2ZXI+XGQrKFwuXGQrKSspLnRhciIKLS0gCjIuMzkuMgoK

--===============3336020826022479141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle", added "/usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle"
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle

--===============3336020826022479141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3: SRC_URI changed from "http://www.python.org/ftp/python/3.11.2/Python-3.11.2.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://crosspythonpath.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://maker
 ace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch" to "http://www.python.org/ftp/python/3.11.3/Python-3.11.3.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://crosspythonpath.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-no
 t-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch"
packages/core2-32-poky-linux/python3/libpython3-staticdev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGSIZE changed from 19284298 to 19204012 (-0%)
packages/core2-32-poky-linux/python3/libpython3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/libpython3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/libpython3: PKGSIZE changed from 4913916 to 4893436 (-0%)
packages/core2-32-poky-linux/python3/python3-2to3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-2to3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle", added "/usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-asyncio: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-asyncio: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-asyncio: PKGSIZE changed from 1376419 to 1379304 (+0%)
packages/core2-32-poky-linux/python3/python3-audio: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-audio: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-cgitb: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-cgitb: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-codecs: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-codecs: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compile: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-compile: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compression: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-compression: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compression: PKGSIZE changed from 480965 to 482082 (+0%)
packages/core2-32-poky-linux/python3/python3-core: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-core: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-core: PKGSIZE changed from 9170282 to 9173561 (+0%)
packages/core2-32-poky-linux/python3/python3-crypt: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-crypt: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-ctypes: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ctypes: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-curses: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-curses: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-datetime: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-datetime: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-db: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-db: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-dbg: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 21579112 to 21487312 (-0%)
packages/core2-32-poky-linux/python3/python3-debugger: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-debugger: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-debugger: PKGSIZE changed from 220409 to 219646 (-0%)
packages/core2-32-poky-linux/python3/python3-dev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-dev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-difflib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-difflib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-distutils-windows: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-distutils-windows: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-distutils: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-distutils: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-doc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-doc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-doctest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-doctest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-email: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-email: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-ensurepip: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ensurepip: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-fcntl: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-fcntl: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-gdbm: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-gdbm: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-html: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-html: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-html: PKGSIZE changed from 220811 to 220830 (+0%)
packages/core2-32-poky-linux/python3/python3-idle: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-idle: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-idle: PKGSIZE changed from 2225962 to 2225750 (-0%)
packages/core2-32-poky-linux/python3/python3-image: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-image: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-io: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-io: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-io: PKGSIZE changed from 1007707 to 1007745 (+0%)
packages/core2-32-poky-linux/python3/python3-json: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-json: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-locale: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-locale: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-logging: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-logging: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-mailbox: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mailbox: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-man: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-man: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-math: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-math: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-mime: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mime: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-misc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-misc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-misc: PKGSIZE changed from 2184794 to 2184830 (+0%)
packages/core2-32-poky-linux/python3/python3-mmap: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mmap: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-modules: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-modules: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-multiprocessing: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-multiprocessing: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-netclient: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PKGSIZE changed from 1011227 to 1011370 (+0%)
packages/core2-32-poky-linux/python3/python3-netserver: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-netserver: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-numbers: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-numbers: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pickle: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pickle: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pkgutil: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pkgutil: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-plistlib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PKGSIZE changed from 74083 to 74293 (+0%)
packages/core2-32-poky-linux/python3/python3-pprint: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pprint: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-profile: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-profile: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-profile: PKGSIZE changed from 260416 to 260633 (+0%)
packages/core2-32-poky-linux/python3/python3-ptest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ptest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pydoc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PKGSIZE changed from 1490905 to 1489302 (-0%)
packages/core2-32-poky-linux/python3/python3-resource: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-resource: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-shell: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-shell: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-smtpd: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-smtpd: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-sqlite3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-sqlite3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-src: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-src: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-src: PKGSIZE changed from 26541501 to 26535847 (-0%)
packages/core2-32-poky-linux/python3/python3-staticdev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-staticdev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-statistics: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-statistics: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-stringold: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-stringold: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-syslog: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-syslog: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-terminal: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-terminal: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tests: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tests: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tests: PKGSIZE changed from 59056335 to 59151351 (+0%)
packages/core2-32-poky-linux/python3/python3-threading: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-threading: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tkinter: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tkinter: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tomllib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tomllib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-turtle: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-turtle: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-turtle: PKGSIZE changed from 337784 to 337788 (+0%)
packages/core2-32-poky-linux/python3/python3-unittest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-unittest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-unittest: PKGSIZE changed from 572070 to 572602 (+0%)
packages/core2-32-poky-linux/python3/python3-unixadmin: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-unixadmin: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-venv: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-venv: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-xml: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-xml: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-xmlrpc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-xmlrpc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-zipapp: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-zipapp: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-zoneinfo: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-zoneinfo: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-zoneinfo: PKGSIZE changed from 113362 to 113359 (-0%)
packages/core2-32-poky-linux/python3/python3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle

--===============3336020826022479141==--

