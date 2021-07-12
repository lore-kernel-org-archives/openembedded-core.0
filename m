Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5893.1626056248648313538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8C19B38C128C
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 2.8.2 SUCCEEDED
Message-ID: <MADEUP.1690E98B1456CB31.19620@lists.openembedded.org>
X-Groupsio-MsgNum: 153749
Content-Type: multipart/mixed; boundary="===============8848417323729003901=="

--===============8848417323729003901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *2.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-2.8.1-2.8.2.patch
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

--===============8848417323729003901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz-gobject.so.0.20802.0 /usr/lib/libharfbuzz.so.0.20802.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.20801.0 to libharfbuzz-gobject.so.0.20802.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.20801.0 to libharfbuzz-icu.so.0.20802.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.20801.0 to libharfbuzz.so.0.20802.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.20801.0 to libharfbuzz-subset.so.0.20802.0
  /usr/lib/libharfbuzz-gobject.so.0.20801.0 moved to /usr/lib/libharfbuzz-gobject.so.0.20802.0
  /usr/lib/libharfbuzz-icu.so.0.20801.0 moved to /usr/lib/libharfbuzz-icu.so.0.20802.0
  /usr/lib/libharfbuzz.so.0.20801.0 moved to /usr/lib/libharfbuzz.so.0.20802.0
  /usr/lib/libharfbuzz-subset.so.0.20801.0 moved to /usr/lib/libharfbuzz-subset.so.0.20802.0

--===============8848417323729003901==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-2.8.1-2.8.2.patch"

RnJvbSA5YWFkNjIwY2EwZDE0MjE4OWVmNjdlZGY5NjBjOTQxODg2OWJiYzk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTdW4sIDExIEp1bCAyMDIxIDIwOjM2OjIzICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gaGFyZmJ1eno6IHVwZ3JhZGUgMi44LjEgLT4gMi44LjIKCi0tLQogLi4uYXJpYWJsZS1zdXBw
X3NpemUtZnJvbS1wbGFuX3N1YnNldF9lLnBhdGNoIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL3toYXJmYnV6el8yLjguMS5iYiA9PiBoYXJmYnV6el8yLjguMi5iYn0gIHwgNDEgKysrKysr
KysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6LzAwMDEtUmVtb3ZlZC11bnVzZWQtdmFyaWFibGUtc3VwcF9zaXplLWZyb20tcGxh
bl9zdWJzZXRfZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97
aGFyZmJ1enpfMi44LjEuYmIgPT4gaGFyZmJ1enpfMi44LjIuYmJ9ICg1NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6LzAwMDEtUmVtb3ZlZC11
bnVzZWQtdmFyaWFibGUtc3VwcF9zaXplLWZyb20tcGxhbl9zdWJzZXRfZS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAxLVJlbW92ZWQtdW51c2VkLXZh
cmlhYmxlLXN1cHBfc2l6ZS1mcm9tLXBsYW5fc3Vic2V0X2UucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IGMxZDRkZjQyYTkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6LzAwMDEtUmVtb3ZlZC11bnVzZWQtdmFyaWFibGUt
c3VwcF9zaXplLWZyb20tcGxhbl9zdWJzZXRfZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ0
ICswLDAgQEAKLUZyb20gZjk2YjJiNjUzYzYwNTY3OWI4M2E4MjBiMzhmNDlhMGEwZjRiYWY0MiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFuZGktQm9nZGFuIFBvc3RlbG5pY3UgPGFi
cG9zdGVsbmljdUBtZS5jb20+Ci1EYXRlOiBXZWQsIDIgSnVuIDIwMjEgMTQ6MDg6MTEgKzAzMDAK
LVN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlZCB1bnVzZWQgdmFyaWFibGUgYHN1cHBfc2l6ZWAgZnJv
bQotIHBsYW5fc3Vic2V0X2VuY29kaW5nKC4uLikuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9oYXJmYnV6ei9oYXJmYnV6ei9jb21taXQvMjQzZDA1NmZm
MWMyYWY1ODNjZWI2N2U1ZGZiZmFhYzUxZGM5NmU2M10KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMvaGItc3Vic2V0LWNmZjEuY2MgfCA0ICst
LS0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS9zcmMvaGItc3Vic2V0LWNmZjEuY2MgYi9zcmMvaGItc3Vic2V0LWNmZjEuY2MK
LWluZGV4IGRmMzIyZjguLjM1ZGFlN2IgMTAwNjQ0Ci0tLS0gYS9zcmMvaGItc3Vic2V0LWNmZjEu
Y2MKLSsrKyBiL3NyYy9oYi1zdWJzZXQtY2ZmMS5jYwotQEAgLTQwMiw3ICs0MDIsNyBAQCBzdHJ1
Y3QgY2ZmX3N1YnNldF9wbGFuIHsKLSAgIHZvaWQgcGxhbl9zdWJzZXRfZW5jb2RpbmcgKGNvbnN0
IE9UOjpjZmYxOjphY2NlbGVyYXRvcl9zdWJzZXRfdCAmYWNjLCBoYl9zdWJzZXRfcGxhbl90ICpw
bGFuKQotICAgewotICAgICBjb25zdCBFbmNvZGluZyAqZW5jb2RpbmcgPSBhY2MuZW5jb2Rpbmc7
Ci0tICAgIHVuc2lnbmVkIGludCAgc2l6ZTAsIHNpemUxLCBzdXBwX3NpemU7Ci0rICAgIHVuc2ln
bmVkIGludCAgc2l6ZTAsIHNpemUxOwotICAgICBoYl9jb2RlcG9pbnRfdCAgY29kZSwgbGFzdF9j
b2RlID0gQ0ZGX1VOREVGX0NPREU7Ci0gICAgIGhiX3ZlY3Rvcl90PGhiX2NvZGVwb2ludF90PiBz
dXBwX2NvZGVzOwotIAotQEAgLTQxMiw3ICs0MTIsNiBAQCBzdHJ1Y3QgY2ZmX3N1YnNldF9wbGFu
IHsKLSAgICAgICByZXR1cm47Ci0gICAgIH0KLSAKLS0gICAgc3VwcF9zaXplID0gMDsKLSAgICAg
c3VwcF9jb2Rlcy5pbml0ICgpOwotIAotICAgICBzdWJzZXRfZW5jX251bV9jb2RlcyA9IHBsYW4t
Pm51bV9vdXRwdXRfZ2x5cGhzICgpIC0gMTsKLUBAIC00NDgsNyArNDQ3LDYgQEAgc3RydWN0IGNm
Zl9zdWJzZXRfcGxhbiB7Ci0gCSAgY29kZV9wYWlyX3QgcGFpciA9IHsgc3VwcF9jb2Rlc1tpXSwg
c2lkIH07Ci0gCSAgc3Vic2V0X2VuY19zdXBwX2NvZGVzLnB1c2ggKHBhaXIpOwotIAl9Ci0tCXN1
cHBfc2l6ZSArPSBTdXBwRW5jb2Rpbmc6OnN0YXRpY19zaXplICogc3VwcF9jb2Rlcy5sZW5ndGg7
Ci0gICAgICAgfQotICAgICB9Ci0gICAgIHN1cHBfY29kZXMuZmluaSAoKTsKLS0tIAotMi4zMS4x
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8y
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8yLjguMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDU1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
aGFyZmJ1enovaGFyZmJ1enpfMi44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9oYXJmYnV6ei9oYXJmYnV6el8yLjguMi5iYgppbmRleCAxYTBlNjUxZjZlLi5lMmRjMGQzOWIw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMi44
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzIuOC4y
LmJiCkBAIC0xLDE5ICsxLDQ4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyAr
KysgQ09QWUlORworIyBAQCAtNCwxNCArNCwxNCBAQAorIyAgCisjICBDb3B5cmlnaHQgwqkgMjAx
MCwyMDExLDIwMTIsMjAxMywyMDE0LDIwMTUsMjAxNiwyMDE3LDIwMTgsMjAxOSwyMDIwICBHb29n
bGUsIEluYy4KKyMgIENvcHlyaWdodCDCqSAyMDE4LDIwMTksMjAyMCAgRWJyYWhpbSBCeWFnb3dp
CisjIC1Db3B5cmlnaHQgwqkgMjAxOSwyMDIwICBGYWNlYm9vaywgSW5jLiAKKyMgK0NvcHlyaWdo
dCDCqSAyMDE5LDIwMjAgIEZhY2Vib29rLCBJbmMuCisjICBDb3B5cmlnaHQgwqkgMjAxMiAgTW96
aWxsYSBGb3VuZGF0aW9uCisjICBDb3B5cmlnaHQgwqkgMjAxMSAgQ29kZXRoaW5rIExpbWl0ZWQK
KyMgIENvcHlyaWdodCDCqSAyMDA4LDIwMTAgIE5va2lhIENvcnBvcmF0aW9uIGFuZC9vciBpdHMg
c3Vic2lkaWFyeSgtaWVzKQorIyAgQ29weXJpZ2h0IMKpIDIwMDkgIEtlaXRoIFN0cmlibGV5Cisj
ICBDb3B5cmlnaHQgwqkgMjAwOSAgTWFydGluIEhvc2tlbiBhbmQgU0lMIEludGVybmF0aW9uYWwK
KyMgIENvcHlyaWdodCDCqSAyMDA3ICBDaHJpcyBXaWxzb24KKyMgLUNvcHlyaWdodCDCqSAyMDA2
ICBCZWhkYWQgRXNmYWhib2QKKyMgK0NvcHlyaWdodCDCqSAyMDA1LDIwMDYsMjAyMCwyMDIxICBC
ZWhkYWQgRXNmYWhib2QKKyMgIENvcHlyaWdodCDCqSAyMDA1ICBEYXZpZCBUdXJuZXIKKyMgIENv
cHlyaWdodCDCqSAyMDA0LDIwMDcsMjAwOCwyMDA5LDIwMTAgIFJlZCBIYXQsIEluYy4KKyMgIENv
cHlyaWdodCDCqSAxOTk4LTIwMDQgIERhdmlkIFR1cm5lciBhbmQgV2VybmVyIExlbWJlcmcKKyMg
CisjCisKIFNVTU1BUlkgPSAiVGV4dCBzaGFwaW5nIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJI
YXJmQnV6eiBpcyBhbiBPcGVuVHlwZSB0ZXh0IHNoYXBpbmcgZW5naW5lLiIKIEhPTUVQQUdFID0g
Imh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvU29mdHdhcmUvSGFyZkJ1enoiCiBCVUdU
UkFDS0VSID0gImh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9k
dWN0PUhhcmZCdXp6IgogU0VDVElPTiA9ICJsaWJzIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT04Zjc4NzYyMGI3ZDM4NjZkOTU1MmZkMTky
NGMwNzU3MiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvaGItdWNkLmNjO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MTU7bWQ1PTI5ZDRkY2I2NDEwNDI5MTk1ZGY2N2VmZTMzODJkOGJjIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NmVlMGYxNjI4MTY5NGZiNmFh
Njg5Y2NhMWUwZmIzZGEgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2hiLXVjZC5j
YztiZWdpbmxpbmU9MTtlbmRsaW5lPTE1O21kNT0yOWQ0ZGNiNjQxMDQyOTE5NWRmNjdlZmUzMzgy
ZDhiYyBcCisgICAgICAgICAgICAgICAgICAgICIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHBzOi8vZ2l0aHViLmNvbS8ke0JQTn0vJHtCUE59L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tf
UkVHRVggPSAiaGFyZmJ1enotKD9QPHB2ZXI+XGQrKFwuXGQrKSspLnRhciIKIAotU1JDX1VSSSA9
ICJodHRwczovL2dpdGh1Yi5jb20vJHtCUE59LyR7QlBOfS9yZWxlYXNlcy9kb3dubG9hZC8ke1BW
fS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlZC11
bnVzZWQtdmFyaWFibGUtc3VwcF9zaXplLWZyb20tcGxhbl9zdWJzZXRfZS5wYXRjaCBcCi0gICAg
ICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTI0ZjY2M2VjNGJmNGUyOTRkOWNmMjMw
NjY4MzcwYjQyNDlhNDhmZjM0ZGVhZjBmMDZlOGZjODJkODkxMzAwIgorU1JDX1VSSSA9ICJodHRw
czovL2dpdGh1Yi5jb20vJHtCUE59LyR7QlBOfS9yZWxlYXNlcy9kb3dubG9hZC8ke1BWfS8ke0JQ
Tn0tJHtQVn0udGFyLnh6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ1ODQ2MTM5NWNlMjhiOWRj
MDM5MDMyNTQzNzRkZDcwYzM4YzhjMjhjNTA0NmRiMTIzYzA4ZjdhYjk0MTdiZTciCiAKIGluaGVy
aXQgbWVzb24gcGtnY29uZmlnIGxpYl9wYWNrYWdlIGd0ay1kb2MgZ29iamVjdC1pbnRyb3NwZWN0
aW9uCiAKLS0gCjIuMjAuMQoK

--===============8848417323729003901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 34184216 to 34691096 (+1%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1280989 to 1287071 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 3666867 to 3708956 (+1%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 857415 to 906567 (+6%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1234132 to 1246628 (+1%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20801.0 /usr/lib/libharfbuzz-gobject.so.0.20801.0", added "/usr/lib/libharfbuzz.so.0.20802.0 /usr/lib/libharfbuzz-gobject.so.0.20802.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "2.8.1" to "2.8.2"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases/download/2.8.1/harfbuzz-2.8.1.tar.xz file://0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch" to "https://github.com/harfbuzz/harfbuzz/releases/download/2.8.2/harfbuzz-2.8.2.tar.xz"
packages/core2-32-poky-linux/harfbuzz: PV changed from "2.8.1" to "2.8.2"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.20801.0 to libharfbuzz-gobject.so.0.20802.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.20801.0 to libharfbuzz-icu.so.0.20802.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.20801.0 to libharfbuzz.so.0.20802.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.20801.0 to libharfbuzz-subset.so.0.20802.0
  /usr/lib/libharfbuzz-gobject.so.0.20801.0 moved to /usr/lib/libharfbuzz-gobject.so.0.20802.0
  /usr/lib/libharfbuzz-icu.so.0.20801.0 moved to /usr/lib/libharfbuzz-icu.so.0.20802.0
  /usr/lib/libharfbuzz.so.0.20801.0 moved to /usr/lib/libharfbuzz.so.0.20802.0
  /usr/lib/libharfbuzz-subset.so.0.20801.0 moved to /usr/lib/libharfbuzz-subset.so.0.20802.0

--===============8848417323729003901==--
