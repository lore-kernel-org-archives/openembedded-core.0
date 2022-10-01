Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2522BC47085
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.353.1664643228365037905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lQXY0KbL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101839477dda7-1c68fad9-29ff-4826-a90a-77862e02d0e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i73WHVMOsK4i7qtUkKkGV4PzuoTjab7k4up4my3Jnv0=;
	b=lQXY0KbLM4WZY0pk7fWCkHeR3AsefXHSjclI+hJgYsdxtuMuDtsuhgQ5w4RVbOEq
	0kG9BcaK+JZxWTJ5AlrhdXl/Keailh19BtZr/8OdOrS0JANO4bX2910LiylYiWc5Lsy
	YYR/j1R9QTD6YzWC3aRNju7RIu3cBr5hBOCucqWU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i73WHVMOsK4i7qtUkKkGV4PzuoTjab7k4up4my3Jnv0=;
	b=Ue/o3OEc4nnvojaTNY2uzd8Q7AjlOkYtYX3pnvdDukG2gveuYroq30pQIsEMaUZ6
	cCfi0L836/K3AEBMJ0DTXqmPVki7PlGQPODNfXQmQ+6IDn8E+rdOZE/xqEHH+N6cf/v
	kjE553T53i6EzhEBCix4IOyn5vzFjnQuo+FkPanM=
Content-Type: multipart/mixed; boundary="===============3742913807406371520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.6 SUCCEEDED
Message-ID: 
 <010101839477dda7-1c68fad9-29ff-4826-a90a-77862e02d0e4-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171302

--===============3742913807406371520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.2.5-3.2.6.patch
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
--===============3742913807406371520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.2.5-3.2.6.patch"

RnJvbSA4ZjUyOTZlZmMxMDNkOGIyNzNkZmIxYzAxMzUyNzBkNDIyZDNmYmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwOTowNjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJz
eW5jOiB1cGdyYWRlIDMuMi41IC0+IDMuMi42CgotLS0KIC4uLi1wcm90b3R5cGVzLXRvLWZ1bmN0
aW9uLWRlY2xhcmF0aW9ucy5wYXRjaCB8IDE2ICsrKystLS0tLQogLi4uYW50aWMtZXJyb3JzLWF0
LXRoZS1lbmQtb2YtY29uZmlndXJlLnBhdGNoIHwgMzYgKysrKy0tLS0tLS0tLS0tLS0tLQogLi4u
L3JzeW5jL3tyc3luY18zLjIuNS5iYiA9PiByc3luY18zLjIuNi5iYn0gIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3tyc3luY18zLjIuNS5iYiA9PiByc3luY18zLjIuNi5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMv
MDAwMS1BZGQtbWlzc2luZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLUFkZC1taXNzaW5nLXBy
b3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNoCmluZGV4IDQ3NGQ4MmRiMjIu
LjI2Zjg4YTg3MTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxl
cy8wMDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLUFkZC1taXNz
aW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA3ODVjMDA3MmM4MGMyZjZlMDgzOTQ3ODQ1M2NmNjVmZGVhYzE1ZGEwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzYjIzYzQ0NDI3NGI4NzdjMTFjYjMyYTkzYmNlYzRm
N2ZlODk5NzZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjkgQXVnIDIwMjIgMTk6NTM6MjggLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgcHJvdG90eXBlcyB0byBmdW5jdGlvbiBkZWNsYXJh
dGlvbnMKQEAgLTE1LDYgKzE1LDcgQEAgRml4ZXMgZXJyb3JzIGxpa2UKIAogVXBzdHJlYW0tU3Rh
dHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbGlzdHMuc2FtYmEub3JnL2FyY2hpdmUvcnN5bmMvMjAy
Mi1BdWd1c3QvMDMyODU4Lmh0bWxdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgorCiAtLS0KICBjaGVja3N1bS5jICAgICAgIHwgMiArLQogIGV4Y2x1ZGUuYyAg
ICAgICAgfCAyICstCkBAIC0yOSwxMCArMzAsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KICAxMCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NoZWNrc3VtLmMgYi9jaGVja3N1bS5j
Ci1pbmRleCBmYjhjMGEwLi4xNzRjMjhjIDEwMDY0NAoraW5kZXggN2ViNTBmMS4uZTBlZjUzZSAx
MDA2NDQKIC0tLSBhL2NoZWNrc3VtLmMKICsrKyBiL2NoZWNrc3VtLmMKLUBAIC02MjksNyArNjI5
LDcgQEAgaW50IHN1bV9lbmQoY2hhciAqc3VtKQorQEAgLTYzMSw3ICs2MzEsNyBAQCBpbnQgc3Vt
X2VuZChjaGFyICpzdW0pCiAgCXJldHVybiBjc3VtX2xlbl9mb3JfdHlwZShjdXJzdW1fdHlwZSwg
MCk7CiAgfQogIApAQCAtNDIsNyArNDMsNyBAQCBpbmRleCBmYjhjMGEwLi4xNzRjMjhjIDEwMDY0
NAogICNpZmRlZiBTVVBQT1JUX1hYSDMKICAJY2hhciBidWZbMzI4MTZdOwogZGlmZiAtLWdpdCBh
L2V4Y2x1ZGUuYyBiL2V4Y2x1ZGUuYwotaW5kZXggYWRjODJlMi4uNzlmNWE4MiAxMDA2NDQKK2lu
ZGV4IDU0NTg0NTUuLjg3Yzg5ZmUgMTAwNjQ0CiAtLS0gYS9leGNsdWRlLmMKICsrKyBiL2V4Y2x1
ZGUuYwogQEAgLTM1OCw3ICszNTgsNyBAQCB2b2lkIGltcGxpZWRfaW5jbHVkZV9wYXJ0aWFsX3N0
cmluZyhjb25zdCBjaGFyICpzX3N0YXJ0LCBjb25zdCBjaGFyICpzX2VuZCkKQEAgLTUzLDkgKzU0
LDkgQEAgaW5kZXggYWRjODJlMi4uNzlmNWE4MiAxMDA2NDQKICt2b2lkIGZyZWVfaW1wbGllZF9p
bmNsdWRlX3BhcnRpYWxfc3RyaW5nKHZvaWQpCiAgewogIAlpZiAocGFydGlhbF9zdHJpbmdfYnVm
KSB7Ci0gCQlmcmVlKHBhcnRpYWxfc3RyaW5nX2J1Zik7CisgCQlpZiAocGFydGlhbF9zdHJpbmdf
bGVuKQogZGlmZiAtLWdpdCBhL2hsaW5rLmMgYi9obGluay5jCi1pbmRleCA2NjgxMGEzLi42NTEx
ZGZiIDEwMDY0NAoraW5kZXggMjAyOTFmMi4uNWMyNmE2YiAxMDA2NDQKIC0tLSBhL2hsaW5rLmMK
ICsrKyBiL2hsaW5rLmMKIEBAIC0xMTcsOCArMTE3LDcgQEAgc3RhdGljIHZvaWQgbWF0Y2hfZ251
bXMoaW50MzIgKm5keF9saXN0LCBpbnQgbmR4X2NvdW50KQpAQCAtMTY4LDYgKzE2OSwzIEBAIGlu
ZGV4IGJiYmE3YjIuLjYxZjhkYzkgMTAwNjQ0CiAgewogICAgICB1TG9uZyBmbGFnczsKICAKLS0t
IAotMi4zNy4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxl
cy8wMDAxLVR1cm4tb24tcGVkYW50aWMtZXJyb3JzLWF0LXRoZS1lbmQtb2YtY29uZmlndXJlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtVHVybi1vbi1wZWRh
bnRpYy1lcnJvcnMtYXQtdGhlLWVuZC1vZi1jb25maWd1cmUucGF0Y2gKaW5kZXggMWQ5YzRiZmU0
OC4uNmVjMzBmMjFjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2Zp
bGVzLzAwMDEtVHVybi1vbi1wZWRhbnRpYy1lcnJvcnMtYXQtdGhlLWVuZC1vZi1jb25maWd1cmUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtVHVybi1v
bi1wZWRhbnRpYy1lcnJvcnMtYXQtdGhlLWVuZC1vZi1jb25maWd1cmUucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGU2NGE1ODM4N2RiNDYyMzk5MDJiNjEwODcxYTBlYjgxNjI2ZTk5ZmYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMxMDA2NDQ0OWFkOGE1ZjNkODUzMjVhOGJhNTBi
NGNlOThhN2JlNTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEVnZ2VydCA8
ZWdnZXJ0QGNzLnVjbGEuZWR1PgogRGF0ZTogVGh1LCAxOCBBdWcgMjAyMiAwNzo0NjoyOCAtMDcw
MAogU3ViamVjdDogW1BBVENIXSBUdXJuIG9uIC1wZWRhbnRpYy1lcnJvcnMgYXQgdGhlIGVuZCBv
ZiAnY29uZmlndXJlJwpAQCAtNiwzNyArNiwxNiBAQCBTdWJqZWN0OiBbUEFUQ0hdIFR1cm4gb24g
LXBlZGFudGljLWVycm9ycyBhdCB0aGUgZW5kIG9mICdjb25maWd1cmUnCiBQcm9ibGVtIHJlcG9y
dGVkIGJ5IEtoZW0gUmFqIGluOgogaHR0cHM6Ly9saXN0cy5nbnUub3JnL3IvYXV0b2NvbmYtcGF0
Y2hlcy8yMDIyLTA4L21zZzAwMDA5Lmh0bWwKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFto
dHRwczovL2xpc3RzLnNhbWJhLm9yZy9hcmNoaXZlL3JzeW5jLzIwMjItQXVndXN0LzAzMjg2Mi5o
dG1sXQorCiAtLS0KLSBjb25maWd1cmUuYWMgfCAzNSArKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkKKyBjb25maWd1cmUuYWMgfCAyMCArKysrKysrKysrKysrKysrKysrKworIDEgZmlsZSBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMKLWluZGV4IGQxODViMmQzLi43ZTk1MTRmNyAxMDA2NDQKK2luZGV4IGI2ZGU0
ZWIuLjRkOTE3MDggMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5h
YwotQEAgLTEwNzEsMjEgKzEwNzEsNiBAQCBlbGlmIHRlc3QgeCIkYWNfY3ZfaGVhZGVyX3BvcHRf
aCIgIT0geCJ5ZXMiOyB0aGVuCi0gICAgIHdpdGhfaW5jbHVkZWRfcG9wdD15ZXMKLSBmaQotIAot
LWlmIHRlc3QgeCIkR0NDIiA9IHgieWVzIjsgdGhlbgotLSAgICBpZiB0ZXN0IHgiJHdpdGhfaW5j
bHVkZWRfcG9wdCIgIT0geCJ5ZXMiOyB0aGVuCi0tCSMgVHVybiBwZWRhbnRpYyB3YXJuaW5ncyBp
bnRvIGVycm9ycyB0byBlbnN1cmUgYW4gYXJyYXktaW5pdCBvdmVyZmxvdyBpcyBhbiBlcnJvci4K
LS0JQ0ZMQUdTPSIkQ0ZMQUdTIC1wZWRhbnRpYy1lcnJvcnMiCi0tICAgIGVsc2UKLS0JIyBPdXIg
aW50ZXJuYWwgcG9wdCBjb2RlIGNhbm5vdCBiZSBjb21waWxlZCB3aXRoIHBlZGFudGljIHdhcm5p
bmdzIGFzIGVycm9ycywgc28gdHJ5IHRvCi0tCSMgdHVybiBvZmYgcGVkYW50aWMgd2FybmluZ3Mg
KHdoaWNoIHdpbGwgbm90IGxvc2UgdGhlIGVycm9yIGZvciBhcnJheS1pbml0IG92ZXJmbG93KS4K
LS0JIyBPbGRlciBnY2MgdmVyc2lvbnMgZG9uJ3QgdW5kZXJzdGFuZCAtV25vLXBlZGFudGljLCBz
byBjaGVjayBpZiAtLWhlbHA9d2FybmluZ3MgbGlzdHMKLS0JIyAtV3BlZGFudGljIGFuZCB1c2Ug
dGhhdCBhcyBhIGZsYWcuCi0tCWNhc2UgYCRDQyAtLWhlbHA9d2FybmluZ3MgMj4vZGV2L251bGwg
fCBncmVwIFdwZWRhbnRpY2AgaW4KLS0JICAgICotV3BlZGFudGljKikgQ0ZMQUdTPSIkQ0ZMQUdT
IC1wZWRhbnRpYy1lcnJvcnMgLVduby1wZWRhbnRpYyIgOzsKLS0JZXNhYwotLSAgICBmaQotLWZp
Ci0tCi0gQUNfTVNHX0NIRUNLSU5HKFt3aGV0aGVyIHRvIHVzZSBpbmNsdWRlZCBsaWJwb3B0XSkK
LSBpZiB0ZXN0IHgiJHdpdGhfaW5jbHVkZWRfcG9wdCIgPSB4InllcyI7IHRoZW4KLSAgICAgQUNf
TVNHX1JFU1VMVCgkc3JjZGlyL3BvcHQpCi1AQCAtMTQ0NCw2ICsxNDI5LDI2IEBAIGNhc2UgIiRD
QyIgaW4KK0BAIC0xNDI5LDYgKzE0MjksMjYgQEAgY2FzZSAiJENDIiBpbgogICAgICA7OwogIGVz
YWMKICAKQEAgLTYzLDYgKzQyLDMgQEAgaW5kZXggZDE4NWIyZDMuLjdlOTUxNGY3IDEwMDY0NAog
IEFDX0NPTkZJR19GSUxFUyhbTWFrZWZpbGUgbGliL2R1bW15IHpsaWIvZHVtbXkgcG9wdC9kdW1t
eSBzaGNvbmZpZ10pCiAgQUNfT1VUUFVUCiAgCi0tLSAKLTIuMzcuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy4yLjUuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy4yLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi41LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMy4yLjYuYmIKaW5kZXggMGJiYmFj
N2FjZS4uYjk0ZjRlM2FmYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5j
L3JzeW5jXzMuMi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18z
LjIuNi5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQuc2Ft
YmEub3JnL3B1Yi8ke0JQTn0vc3JjLyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLUFkZC1taXNzaW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtVHVybi1vbi1wZWRhbnRpYy1lcnJvcnMtYXQtdGhl
LWVuZC1vZi1jb25maWd1cmUucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMmFjNGQyMTYzNWNkZjc5MTg2N2JjMzc3YzM1Y2E2ZGRhN2Y1MGQ5MTlhNThiZTQ1MDU3
ZmQ1MTYwMGM2OWFiYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYjMzNjViYWIyNzgzN2Q0MWZl
YWY0MmU5NjdjNTdiZDNhNDdiYzhmMTA3NjVhMzY3MWVmZDZhMzgzNTQ1NGQzIgogCiAjIC0xNjU0
OCByZXF1aXJlZCBmb3IgdjMuMS4zcHJlMS4gQWxyZWFkeSBpbiB2My4xLjMuCiBDVkVfQ0hFQ0tf
SUdOT1JFICs9ICIgQ1ZFLTIwMTctMTY1NDggIgotLSAKMi4zMS4xCgo=

--===============3742913807406371520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rsync: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.2.6.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch"
packages/core2-32-poky-linux/rsync: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1140620 to 1143568 (+0%)
packages/core2-32-poky-linux/rsync/rsync-dbg: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-dev: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-dev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-doc: PKGSIZE changed from 291486 to 293817 (+1%)
packages/core2-32-poky-linux/rsync/rsync-doc: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-doc: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-locale: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-locale: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-src: PKGSIZE changed from 1621062 to 1622966 (+0%)
packages/core2-32-poky-linux/rsync/rsync-src: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-src: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync-staticdev: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/core2-32-poky-linux/rsync/rsync: PKGSIZE changed from 622790 to 622726 (-0%)
packages/core2-32-poky-linux/rsync/rsync: PV changed from "3.2.5" to "3.2.6"
packages/core2-32-poky-linux/rsync/rsync: PKGV changed from 3.2.5 [default] to 3.2.6 [default]

--===============3742913807406371520==--

