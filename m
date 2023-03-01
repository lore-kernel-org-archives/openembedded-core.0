Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60587C88CB2
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.24040.1677681915013410224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M5auZf9Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101869da271ad-5c5ab430-7471-43cf-905e-28e0c0b6cecf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4tYGwdSnO2kFSFrLRlMGWntGTtmJiCB+qkGgMFXGLcg=;
	b=M5auZf9Qwg/+qXEbkJ6ti1HubsM1rvEhjw3v211JtEBKcn4Jzjp3pvfsxAPqwHaN
	mSWDcozu1g7zW+LFnfKYffLqr1H5F/d8BNH6Is/t3u94/5Yi/oi7/js/R+88fQjzyu0
	4cft0GP/zwXI/AjiTbjPZs/g912qXY+FqukKB32g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4tYGwdSnO2kFSFrLRlMGWntGTtmJiCB+qkGgMFXGLcg=;
	b=OMjU0FKXV6CllWX+7S8iUGc8PFtcHPI1HahI3q+0SlWrZG3iVvuMYJ6s+v+gQBZa
	UFI4ORF4BY4WVUDvFBpQdN/aqhUuNfkBqWfx9xQvueaB0SAcBtdk57DBNyqSRORJ0t5
	G1NaMTgCOoqnBcEQkILvw8wWTKTvqE5rJhnoC0t8=
Content-Type: multipart/mixed; boundary="===============0901560984212170264=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.15.04 SUCCEEDED
Message-ID: <010101869da271ad-5c5ab430-7471-43cf-905e-28e0c0b6cecf-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177908

--===============0901560984212170264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.15.04* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.15.03-0.15.04.patch
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
--===============0901560984212170264==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.15.03-0.15.04.patch"

RnJvbSAzYzM5NGE0ZWQ0MTEzNTI4YTQ4Y2M2ZjdmOGRjMmRhMzBlMjNlOWNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwOTowMTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE1LjAzIC0+IDAuMTUuMDQKCi0tLQogLi4ubmNsdWRlLXN5cy1m
dXRleC5oLWZvci1jbG9ja19hZGp0aW1lLnBhdGNoIHwgMzIgLS0tLS0tLS0tLS0tLS0KIC4uLjEt
dmlhLW1ha2VmaWxlLXRvLWVuYWJsZS1nb2xkLWxpbmtlci5wYXRjaCB8IDQyICsrKy0tLS0tLS0t
LS0tLS0tLS0KIC4uLjAwMS10ZXN0LWZsb2F0LU1ha2UtdmFyaWFibGVzLWdsb2JhbC5wYXRjaCB8
IDM0IC0tLS0tLS0tLS0tLS0tLQogLi4uZXNzLW5nXzAuMTUuMDMuYmIgPT4gc3RyZXNzLW5nXzAu
MTUuMDQuYmJ9IHwgIDcgKystLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEw
NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3RyZXNzLW5nL3N0cmVzcy1uZy8wMDAxLUluY2x1ZGUtc3lzLWZ1dGV4LmgtZm9yLWNsb2NrX2Fk
anRpbWUucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Ry
ZXNzLW5nL3N0cmVzcy1uZy8wMDAxLXRlc3QtZmxvYXQtTWFrZS12YXJpYWJsZXMtZ2xvYmFsLnBh
dGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAu
MTUuMDMuYmIgPT4gc3RyZXNzLW5nXzAuMTUuMDQuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmcvMDAwMS1JbmNsdWRlLXN5cy1m
dXRleC5oLWZvci1jbG9ja19hZGp0aW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0
cmVzcy1uZy9zdHJlc3MtbmcvMDAwMS1JbmNsdWRlLXN5cy1mdXRleC5oLWZvci1jbG9ja19hZGp0
aW1lLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4N2QyZWFkNDZhLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nLzAw
MDEtSW5jbHVkZS1zeXMtZnV0ZXguaC1mb3ItY2xvY2tfYWRqdGltZS5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDMyICswLDAgQEAKLUZyb20gNTdmMjA3ZWM3ZmIzOWM4YjUwMmY0MGRiZGFiZDU2
OGY2Yjg2NmE4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBNb24sIDEzIEZlYiAyMDIzIDEyOjE4OjA4IC0wODAwCi1T
dWJqZWN0OiBbUEFUQ0hdIEluY2x1ZGUgc3lzL2Z1dGV4LmggZm9yIGNsb2NrX2FkanRpbWUKLQot
Rml4ZXMKLWNvcmUtc2hpbS5jOjE5NDI6OTogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5j
dGlvbiAnY2xvY2tfYWRqdGltZSc7IElTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0IGlt
cGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9D
b2xpbklhbktpbmcvc3RyZXNzLW5nL3B1bGwvMjYxXQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGNvcmUtc2hpbS5jIHwgNCArKysrCi0gMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvY29yZS1zaGltLmMgYi9j
b3JlLXNoaW0uYwotaW5kZXggZGM1MzljNjQuLmRlMzhlOTA4IDEwMDY0NAotLS0tIGEvY29yZS1z
aGltLmMKLSsrKyBiL2NvcmUtc2hpbS5jCi1AQCAtNjYsNiArNjYsMTAgQEAgVU5FWFBFQ1RFRAot
ICNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KLSAjZW5kaWYKLSAKLSsjaWYgZGVmaW5lZChIQVZFX1NZ
U19USU1FWF9IKQotKyNpbmNsdWRlIDxzeXMvdGltZXguaD4KLSsjZW5kaWYKLSsKLSAjaWYgZGVm
aW5lZChIQVZFX1NZU19SQU5ET01fSCkKLSAjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgotICNlbmRp
ZgotLS0gCi0yLjM5LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVz
cy1uZy9zdHJlc3MtbmcvMDAwMS1QYXNzLUxEX0dPTEQtMS12aWEtbWFrZWZpbGUtdG8tZW5hYmxl
LWdvbGQtbGlua2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJl
c3MtbmcvMDAwMS1QYXNzLUxEX0dPTEQtMS12aWEtbWFrZWZpbGUtdG8tZW5hYmxlLWdvbGQtbGlu
a2VyLnBhdGNoCmluZGV4IDgyMWU0ZDkxMGYuLjM0OWUwNGE0ZDggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nLzAwMDEtUGFzcy1MRF9HT0xELTEt
dmlhLW1ha2VmaWxlLXRvLWVuYWJsZS1nb2xkLWxpbmtlci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZy8wMDAxLVBhc3MtTERfR09MRC0xLXZpYS1t
YWtlZmlsZS10by1lbmFibGUtZ29sZC1saW5rZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDMyMzg2YzEzNDIwZjY3NmJkOTM4YThiMWNlYWVhYjhhNWRhNDZkMTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGQxZWE3NTNhYzlmYjdmZTNmOTYwNDQ2NjA5MDhkOWM0ZDAyODA2MzYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogVHVlLCAzIEphbiAyMDIzIDExOjAwOjA5IC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIFBhc3MgTERfR09MRD0xIHZpYSBtYWtlZmlsZSB0byBlbmFibGUgZ29sZCBsaW5rZXIKQEAg
LTEwLDE2ICsxMCwxNiBAQCBkZXRlY3RpbmcgYW5kIGRlY2lkaW5nLgogCiBVcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL0NvbGluSWFuS2luZy9zdHJlc3Mtbmcv
cHVsbC8yNTFdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgor
CiAtLS0KLSBNYWtlZmlsZSAgICAgICAgfCA3ICsrKysrKysKLSBNYWtlZmlsZS5jb25maWcgfCA5
ICstLS0tLS0tLQotIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQorIE1ha2VmaWxlIHwgNyArKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggZjJmZDRiNmMu
LmJmZjZiOGFjIDEwMDY0NAoraW5kZXggN2E5NjlhYmEuLjU4M2FlMDRmIDEwMDY0NAogLS0tIGEv
TWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtNjksNiArNjksMTMgQEAgZW5kaWYKK0BAIC05
Myw2ICs5MywxMyBAQCBlbmRpZgogICNDRkxBR1MgKz0gLVdldmVyeXRoaW5nCiAgI2VuZGlmCiAg
CkBAIC0zMywzMyArMzMsMyBAQCBpbmRleCBmMmZkNGI2Yy4uYmZmNmI4YWMgMTAwNjQ0CiAgR1JF
UCA9IGdyZXAKICAjCiAgIyBTdW5PUyByZXF1aXJlcyBzcGVjaWFsIGdyZXAgZm9yIC1lIHN1cHBv
cnQKLWRpZmYgLS1naXQgYS9NYWtlZmlsZS5jb25maWcgYi9NYWtlZmlsZS5jb25maWcKLWluZGV4
IDM5NGVkMjBkLi40OGM5NGZhMSAxMDA2NDQKLS0tLSBhL01ha2VmaWxlLmNvbmZpZwotKysrIGIv
TWFrZWZpbGUuY29uZmlnCi1AQCAtMjQxLDcgKzI0MSw3IEBAIGRlZmluZSBjaGVja19sZAotIAkk
KGNhbGwgY2hlY2tfbGRfdG1wLCQxLCQyLCQzKQotIGVuZGVmCi0gCi0tYWxsOiBsaW5rZXJzIGxp
YnJhcmllcyBoZWFkZXJzIGNwdWZlYXR1cmVzIHR5cGVzIGZ1bmN0aW9ucwotK2FsbDogbGlicmFy
aWVzIGhlYWRlcnMgY3B1ZmVhdHVyZXMgdHlwZXMgZnVuY3Rpb25zCi0gCUBmb3IgSSBpbiAkJChs
cyAkKENPTkZJR1MpKTsgZG8gXAotIAkJaWYgWyAtcyAkKENPTkZJR1MpLyQkSSBdOyB0aGVuIFwK
LSAJCQllY2hvICIjZGVmaW5lICQkSSI7IFwKLUBAIC0yNjIsMTMgKzI2Miw2IEBAIGNvbmZpZ2Rp
cjoKLSBjbGVhbjoKLSAJQHJtIC1yZiAkKENPTkZJR1MpIGNvbmZpZyBjb25maWcuaAotIAotLWxp
bmtlcnM6IFwKLS0JY29uZmlnZGlyIFwKLS0JTERfR09MRAotLQotLUxEX0dPTEQ6Ci0tCSQoY2Fs
bCBjaGVja19sZCx0ZXN0LWxkLEhBVkVfTERfR09MRCxnb2xkKQotLQotIGxpYnJhcmllczogXAot
IAljb25maWdkaXIgXAotIAlMSUJfQUlPIExJQl9BUFBBUk1PUiBMSUJfQlNEIExJQl9DUllQVCBM
SUJfREwgXAotLS0gCi0yLjM5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3N0cmVzcy1uZy9zdHJlc3MtbmcvMDAwMS10ZXN0LWZsb2F0LU1ha2UtdmFyaWFibGVzLWdsb2Jh
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nLzAwMDEt
dGVzdC1mbG9hdC1NYWtlLXZhcmlhYmxlcy1nbG9iYWwucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDJlNTk4Y2E0ZjQuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmcvMDAwMS10ZXN0LWZsb2F0LU1ha2UtdmFyaWFibGVz
LWdsb2JhbC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gOTU4YTg2
MDY5YzhkMDE0OTk2OWI1YzMyMjEyYTI4MDA5YzRhOWRlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBTYXQsIDIxIEph
biAyMDIzIDIzOjE4OjE4IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRlc3QtZmxvYXQ6IE1ha2Ug
dmFyaWFibGVzIGdsb2JhbAotCi1MYXRlc3QgY2xhbmcgKCBjbGFuZyAxNisgKSBpcyBhYmxlIHRv
IG9wdGltaXplIGV2ZXJ5dGhpbmcgb3V0IHdoZW4gLU8yIGlzIHVzZWQgYW5kIGFzCi1hIHJlc3Vs
dCBidWlsZCBzdWNjZWVkcyBhbmQgdGVzdCBvdXRwdXQgY29tZXMgb3V0IHRvIGJlIHdyb25nLiBU
aGVyZWZvcmUKLW1ha2UgdGhlIHZhcmlhYmxlcyBnbG9iYWwsIHNvIGNsYW5nIGRvZXMgbm90IG9w
dGltaXplIGF3YXkgdGhlIGZ1bmN0aW9ucwotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFto
dHRwczovL2dpdGh1Yi5jb20vQ29saW5JYW5LaW5nL3N0cmVzcy1uZy9jb21taXQvZTI5OWViNjBh
M2EwMjllOTc1MzA0Y2M0MzA0NWFlYTZhYjFmYWQ3MF0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSB0ZXN0L3Rlc3QtZmxvYXQuYyB8IDMgKy0tCi0g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEvdGVzdC90ZXN0LWZsb2F0LmMgYi90ZXN0L3Rlc3QtZmxvYXQuYwotaW5kZXggZDI4MDBj
ZDMuLmFkNTUwM2MzIDEwMDY0NAotLS0tIGEvdGVzdC90ZXN0LWZsb2F0LmMKLSsrKyBiL3Rlc3Qv
dGVzdC1mbG9hdC5jCi1AQCAtNjEsMTAgKzYxLDkgQEAKLSAvKiBBdm9pZCBpbXBsaWNpdCBpbnQg
aW4gdGhlIGRlZmluaXRpb24gb2YgdGVzdCBldmVuIGlmIEZMT0FUIGlzIG5vdCBrbm93bi4gKi8K
LSB0eXBlZGVmIEZMT0FUIGZsb2F0X3R5cGU7Ci0gCi0rRkxPQVQgYSA9IDAuMCwgYiA9IDAuMCwg
YyA9IDAuMCwgZCA9IDAuMDsKLSBzdGF0aWMgZmxvYXRfdHlwZSBIT1QgT1BUSU1JWkUzIHRlc3Qo
dm9pZCkKLSB7Ci0tCUZMT0FUIGEgPSAwLjAsIGIgPSAwLjAsIGMgPSAwLjAsIGQgPSAwLjA7Ci0t
Ci0gCWZsb2F0X29wcyhGTE9BVCwgYSwgYiwgYywgZCwgc2luLCBjb3MpOwotIAlmbG9hdF9vcHMo
RkxPQVQsIGEsIGIsIGMsIGQsIHNpbmwsIGNvc2wpOwotIAotLS0gCi0yLjM5LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wMy5i
YiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTUuMDQuYmIK
c2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0
cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wNC5iYgppbmRleCBjZDdmNDFhMDE2Li5lODkx
YmI3MzhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVz
cy1uZ18wLjE1LjAzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3Ry
ZXNzLW5nXzAuMTUuMDQuYmIKQEAgLTYsMTAgKzYsOSBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZj
ZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vQ29saW5J
YW5LaW5nL3N0cmVzcy1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0gICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXRlc3QtZmxvYXQtTWFrZS12YXJpYWJsZXMtZ2xvYmFsLnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtSW5jbHVkZS1zeXMtZnV0ZXguaC1mb3ItY2xvY2tf
YWRqdGltZS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLVBhc3MtTERfR09MRC0xLXZp
YS1tYWtlZmlsZS10by1lbmFibGUtZ29sZC1saW5rZXIucGF0Y2giCi1TUkNSRVYgPSAiZjNiZTA0
NDdjMTBmZDU2NTJiNGMzNzUzZDU2YmNhYWMxM2ZkODkxNyIKKyAgICAgICAgICAgZmlsZTovLzAw
MDEtUGFzcy1MRF9HT0xELTEtdmlhLW1ha2VmaWxlLXRvLWVuYWJsZS1nb2xkLWxpbmtlci5wYXRj
aCBcCisgICAgICAgICAgICIKK1NSQ1JFViA9ICJiOWE0MzdlYzc5MGFkNGJjYzcxZDMxYjJkZjM5
ZDRhNjAxYzU1ZmE4IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9ICJjb3JldXRp
bHMtbmF0aXZlIGxpYmJzZCIKLS0gCjIuMzkuMgoK

--===============0901560984212170264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master file://0001-test-float-Make-variables-global.patch file://0001-Include-sys-futex.h-for-clock_adjtime.patch file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch" to "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 7266716 to 7383992 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 69749 to 70468 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 4325332 to 4376160 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: FILELIST: removed "/usr/src/debug/stress-ng/0.15.03-r0/stress-epoll.c /usr/src/debug/stress-ng/0.15.03-r0/stress-iomix.c /usr/src/debug/stress-ng/0.15.03-r0/stress-qsort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-funcret.c /usr/src/debug/stress-ng/0.15.03-r0/stress-hrtimers.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pty.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mergesort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-radixsort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-shellsort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-resched.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigsegv.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vm-segv.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmapfixed.c /usr/src/debug/stress-ng/0.15.03-r0/stress-signal.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigpending.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vm-splice.c /usr/src/debug/stress-ng/0.15.03-r0/core-klog.c /usr/src/debug/stress-ng/0
 .15.03-r0/core-helper.c /usr/src/debug/stress-ng/0.15.03-r0/core-sched.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ng.c /usr/src/debug/stress-ng/0.15.03-r0/stress-branch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fpunch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-switch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ng.h /usr/src/debug/stress-ng/0.15.03-r0/stress-udp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pthread.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dnotify.c /usr/src/debug/stress-ng/0.15.03-r0/core-killpid.c /usr/src/debug/stress-ng/0.15.03-r0/core-setting.c /usr/src/debug/stress-ng/0.15.03-r0/core-put.h /usr/src/debug/stress-ng/0.15.03-r0/stress-inotify.c /usr/src/debug/stress-ng/0.15.03-r0/stress-cpu.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dirdeep.c /usr/src/debug/stress-ng/0.15.03-r0/stress-bsearch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-hsearch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-lsearch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tsearch.c /
 usr/src/debug/stress-ng/0.15.03-r0/stress-llc-affinity.c /usr/src/debug/stress-ng/0.15.03-r0/stress-affinity.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dccp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-exec.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fifo.c /usr/src/debug/stress-ng/0.15.03-r0/stress-brk.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fork.c /usr/src/debug/stress-ng/0.15.03-r0/stress-numa.c /usr/src/debug/stress-ng/0.15.03-r0/stress-open.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pipe.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-kcmp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-watchdog.c /usr/src/debug/stress-ng/0.15.03-r0/core-parse-opts.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fiemap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mremap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dir.c /usr/src/debug/stress-ng/0.15.03-r0/stress-munmap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rawudp.c /usr/src/debug/stress-
 ng/0.15.03-r0/stress-pagemove.c /usr/src/debug/stress-ng/0.15.03-r0/stress-netdev.c /usr/src/debug/stress-ng/0.15.03-r0/core-mlock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rawdev.c /usr/src/debug/stress-ng/0.15.03-r0/stress-chroot.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ioport.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rawpkt.c /usr/src/debug/stress-ng/0.15.03-r0/stress-reboot.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rlimit.c /usr/src/debug/stress-ng/0.15.03-r0/stress-chattr.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dekker.c /usr/src/debug/stress-ng/0.15.03-r0/stress-efivar.c /usr/src/debug/stress-ng/0.15.03-r0/stress-itimer.c /usr/src/debug/stress-ng/0.15.03-r0/core-module.c /usr/src/debug/stress-ng/0.15.03-r0/core-mounts.c /usr/src/debug/stress-ng/0.15.03-r0/stress-cpu-online.c /usr/src/debug/stress-ng/0.15.03-r0/stress-getrandom.c /usr/src/debug/stress-ng/0.15.03-r0/stress-forkheavy.c /usr/src/debug/stress-ng/0.15.03-r0/stress-misaligned.c /usr/src/debug/stress-
 ng/0.15.03-r0/stress-ping-sock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigchld.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sockdiag.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pageswap.c /usr/src/debug/stress-ng/0.15.03-r0/core-job.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rdrand.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sockfd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-randlist.c /usr/src/debug/stress-ng/0.15.03-r0/stress-skiplist.c /usr/src/debug/stress-ng/0.15.03-r0/core-ignite-cpu.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigpipe.c /usr/src/debug/stress-ng/0.15.03-r0/stress-exit-group.c /usr/src/debug/stress-ng/0.15.03-r0/stress-daemon.c /usr/src/debug/stress-ng/0.15.03-r0/stress-plugin.c /usr/src/debug/stress-ng/0.15.03-r0/core-builtin.h /usr/src/debug/stress-ng/0.15.03-r0/stress-xattr.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pidfd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-prctl.c /usr/src/debug/stress-ng/0.15.03-r0/stress-readahead.c /usr/src/debug/str
 ess-ng/0.15.03-r0/stress-usersyscall.c /usr/src/debug/stress-ng/0.15.03-r0/core-limit.c /usr/src/debug/stress-ng/0.15.03-r0/stress-cap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rawsock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-stackmmap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-landlock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mincore.c /usr/src/debug/stress-ng/0.15.03-r0/stress-unshare.c /usr/src/debug/stress-ng/0.15.03-r0/stress-getdent.c /usr/src/debug/stress-ng/0.15.03-r0/stress-smi.c /usr/src/debug/stress-ng/0.15.03-r0/core-bitops.h /usr/src/debug/stress-ng/0.15.03-r0/stress-mq.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pci.c /usr/src/debug/stress-ng/0.15.03-r0/stress-softlockup.c /usr/src/debug/stress-ng/0.15.03-r0/stress-signest.c /usr/src/debug/stress-ng/0.15.03-r0/stress-aio.c /usr/src/debug/stress-ng/0.15.03-r0/stress-eventfd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-lockofd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-timerfd.c /usr/src/debug/stress-ng/0
 .15.03-r0/stress-tsc.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dynlib.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mcontend.c /usr/src/debug/stress-ng/0.15.03-r0/stress-matrix.c /usr/src/debug/stress-ng/0.15.03-r0/stress-matrix-3d.c /usr/src/debug/stress-ng/0.15.03-r0/stress-syscall.c /usr/src/debug/stress-ng/0.15.03-r0/stress-personality.c /usr/src/debug/stress-ng/0.15.03-r0/stress-memrate.c /usr/src/debug/stress-ng/0.15.03-r0/stress-schedpolicy.c /usr/src/debug/stress-ng/0.15.03-r0/stress-kvm.c /usr/src/debug/stress-ng/0.15.03-r0/stress-inode-flags.c /usr/src/debug/stress-ng/0.15.03-r0/stress-gpu.c /usr/src/debug/stress-ng/0.15.03-r0/stress-bad-ioctl.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmapfork.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vm-addr.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ipsec-mb.c /usr/src/debug/stress-ng/0.15.03-r0/stress-context.c /usr/src/debug/stress-ng/0.15.03-r0/core-mwc.c /usr/src/debug/stress-ng/0.15.03-r0/stress-bad-altstack.c /usr/src/deb
 ug/stress-ng/0.15.03-r0/stress-key.c /usr/src/debug/stress-ng/0.15.03-r0/core-sort.h /usr/src/debug/stress-ng/0.15.03-r0/core-sort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-funccall.c /usr/src/debug/stress-ng/0.15.03-r0/core-hash.h /usr/src/debug/stress-ng/0.15.03-r0/core-affinity.c /usr/src/debug/stress-ng/0.15.03-r0/core-hash.c /usr/src/debug/stress-ng/0.15.03-r0/stress-loadavg.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sem.c /usr/src/debug/stress-ng/0.15.03-r0/stress-memthrash.c /usr/src/debug/stress-ng/0.15.03-r0/stress-memhotplug.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sparsematrix.c /usr/src/debug/stress-ng/0.15.03-r0/stress-io.c /usr/src/debug/stress-ng/0.15.03-r0/core-smart.c /usr/src/debug/stress-ng/0.15.03-r0/core-smart.h /usr/src/debug/stress-ng/0.15.03-r0/core-pthread.h /usr/src/debug/stress-ng/0.15.03-r0/stress-filename.c /usr/src/debug/stress-ng/0.15.03-r0/stress-flushcache.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sysbadaddr.c /usr/src/debug/stress-ng/0.1
 5.03-r0/stress-membarrier.c /usr/src/debug/stress-ng/0.15.03-r0/core-thermal-zone.h /usr/src/debug/stress-ng/0.15.03-r0/core-thermal-zone.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rtc.c /usr/src/debug/stress-ng/0.15.03-r0/stress-binderfs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fsize.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fstat.c /usr/src/debug/stress-ng/0.15.03-r0/stress-futex.c /usr/src/debug/stress-ng/0.15.03-r0/core-perf.c /usr/src/debug/stress-ng/0.15.03-r0/stress-lockf.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigfd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigio.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigrt.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sleep.c /usr/src/debug/stress-ng/0.15.03-r0/stress-spawn.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vecfp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-timer.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tmpfs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-touch.c /usr/src/debug/stress-ng/0.15.03-r0/core-pe
 rf.h /usr/src/debug/stress-ng/0.15.03-r0/stress-prefetch.c /usr/src/debug/stress-ng/0.15.03-r0/stress-race-sched.c /usr/src/debug/stress-ng/0.15.03-r0/stress-urandom.c /usr/src/debug/stress-ng/0.15.03-r0/stress-hdd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmaphuge.c /usr/src/debug/stress-ng/0.15.03-r0/stress-stack.c /usr/src/debug/stress-ng/0.15.03-r0/stress-close.c /usr/src/debug/stress-ng/0.15.03-r0/stress-crypt.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sysfs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ring-pipe.c /usr/src/debug/stress-ng/0.15.03-r0/core-io-priority.c /usr/src/debug/stress-ng/0.15.03-r0/core-thrash.h /usr/src/debug/stress-ng/0.15.03-r0/stress-cacheline.c /usr/src/debug/stress-ng/0.15.03-r0/core-thrash.c /usr/src/debug/stress-ng/0.15.03-r0/stress-physpage.c /usr/src/debug/stress-ng/0.15.03-r0/stress-resources.c /usr/src/debug/stress-ng/0.15.03-r0/stress-quota.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ramfs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rem
 ap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-alarm.c /usr/src/debug/stress-ng/0.15.03-r0/stress-cache.c /usr/src/debug/stress-ng/0.15.03-r0/stress-chdir.c /usr/src/debug/stress-ng/0.15.03-r0/stress-chmod.c /usr/src/debug/stress-ng/0.15.03-r0/stress-chown.c /usr/src/debug/stress-ng/0.15.03-r0/stress-clock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-clone.c /usr/src/debug/stress-ng/0.15.03-r0/stress-userfaultfd.c /usr/src/debug/stress-ng/0.15.03-r0/core-time.c /usr/src/debug/stress-ng/0.15.03-r0/core-cpu.c /usr/src/debug/stress-ng/0.15.03-r0/core-cpu.h /usr/src/debug/stress-ng/0.15.03-r0/stress-vecshuf.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dev.c /usr/src/debug/stress-ng/0.15.03-r0/core-resources.c /usr/src/debug/stress-ng/0.15.03-r0/core-resources.h /usr/src/debug/stress-ng/0.15.03-r0/stress-zlib.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pkey.c /usr/src/debug/stress-ng/0.15.03-r0/stress-poll.c /usr/src/debug/stress-ng/0.15.03-r0/stress-regs.c /usr/src/debug/stress-ng/0.1
 5.03-r0/stress-rmap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rseq.c /usr/src/debug/stress-ng/0.15.03-r0/stress-link.c /usr/src/debug/stress-ng/0.15.03-r0/stress-list.c /usr/src/debug/stress-ng/0.15.03-r0/stress-loop.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-udp-flood.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fallocate.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ioprio.c /usr/src/debug/stress-ng/0.15.03-r0/stress-env.c /usr/src/debug/stress-ng/0.15.03-r0/stress-stream.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mlockmany.c /usr/src/debug/stress-ng/0.15.03-r0/stress-msyncmany.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vforkmany.c /usr/src/debug/stress-ng/0.15.03-r0/stress-pipeherd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vm-rw.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mknod.c /usr/src/debug/stress-ng/0.15.03-r0/stress-msync.c /usr/src/debug/stress-ng/0.15.03-r0/stress-utime.c /usr/src/debug/stress-ng/0.15.03-r0/str
 ess-yield.c /usr/src/debug/stress-ng/0.15.03-r0/stress-memfd.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mlock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mutex.c /usr/src/debug/stress-ng/0.15.03-r0/stress-lease.c /usr/src/debug/stress-ng/0.15.03-r0/stress-locka.c /usr/src/debug/stress-ng/0.15.03-r0/core-icache.h /usr/src/debug/stress-ng/0.15.03-r0/core-icache.c /usr/src/debug/stress-ng/0.15.03-r0/stress-l1cache.c /usr/src/debug/stress-ng/0.15.03-r0/core-lock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-get.c /usr/src/debug/stress-ng/0.15.03-r0/stress-full.c /usr/src/debug/stress-ng/0.15.03-r0/stress-goto.c /usr/src/debug/stress-ng/0.15.03-r0/stress-hash.c /usr/src/debug/stress-ng/0.15.03-r0/stress-jpeg.c /usr/src/debug/stress-ng/0.15.03-r0/stress-judy.c /usr/src/debug/stress-ng/0.15.03-r0/stress-nice.c /usr/src/debug/stress-ng/0.15.03-r0/stress-null.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tree.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigq.c /usr/src/debug/stress-ng/0.15.
 03-r0/stress-aiol.c /usr/src/debug/stress-ng/0.15.03-r0/stress-msg.c /usr/src/debug/stress-ng/0.15.03-r0/core-log.c /usr/src/debug/stress-ng/0.15.03-r0/core-shim.c /usr/src/debug/stress-ng/0.15.03-r0/stress-syncload.c /usr/src/debug/stress-ng/0.15.03-r0/stress-netlink-proc.c /usr/src/debug/stress-ng/0.15.03-r0/stress-netlink-task.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vdso.c /usr/src/debug/stress-ng/0.15.03-r0/stress-zero.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dev-shm.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-priv-instr.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigabrt.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fp-error.c /usr/src/debug/stress-ng/0.15.03-r0/stress-x86syscall.c /usr/src/debug/stress-ng/0.15.03-r0/stress-revio.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fault.c /usr/src/debug/stress-ng/0.15.03-r0/stress-atomic.c /usr/src/debug/stress-ng/0.15.03-r0/stress-fcntl.c /usr/src/debug/stress-ng/0.15.03-r0/st
 ress-cyclic.c /usr/src/debug/stress-ng/0.15.03-r0/stress-malloc.c /usr/src/debug/stress-ng/0.15.03-r0/stress-flock.c /usr/src/debug/stress-ng/0.15.03-r0/stress-longjmp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-seccomp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-x86cpuid.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sockpair.c /usr/src/debug/stress-ng/0.15.03-r0/stress-apparmor.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sockabuse.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dentry.c /usr/src/debug/stress-ng/0.15.03-r0/stress-memcpy.c /usr/src/debug/stress-ng/0.15.03-r0/stress-verity.c /usr/src/debug/stress-ng/0.15.03-r0/stress-file-ioctl.c /usr/src/debug/stress-ng/0.15.03-r0/core-ftrace.h /usr/src/debug/stress-ng/0.15.03-r0/stress-vecmath.c /usr/src/debug/stress-ng/0.15.03-r0/core-ftrace.c /usr/src/debug/stress-ng/0.15.03-r0/core-vmstat.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vecwide.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dirmany.c /usr/src/debug/stress-ng/0.15.03-r0/
 stress-fanotify.c /usr/src/debug/stress-ng/0.15.03-r0/core-try-open.c /usr/src/debug/stress-ng/0.15.03-r0/stress-peterson.c /usr/src/debug/stress-ng/0.15.03-r0/core-cache.c /usr/src/debug/stress-ng/0.15.03-r0/core-cache.h /usr/src/debug/stress-ng/0.15.03-r0/core-net.h /usr/src/debug/stress-ng/0.15.03-r0/core-madvise.c /usr/src/debug/stress-ng/0.15.03-r0/core-mincore.c /usr/src/debug/stress-ng/0.15.03-r0/core-net.c /usr/src/debug/stress-ng/0.15.03-r0/stress-nop.c /usr/src/debug/stress-ng/0.15.03-r0/stress-icmp-flood.c /usr/src/debug/stress-ng/0.15.03-r0/stress-idle-page.c /usr/src/debug/stress-ng/0.15.03-r0/stress-nanosleep.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tee.c /usr/src/debug/stress-ng/0.15.03-r0/stress-access.c /usr/src/debug/stress-ng/0.15.03-r0/stress-enosys.c /usr/src/debug/stress-ng/0.15.03-r0/stress-procfs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mprotect.c /usr/src/debug/stress-ng/0.15.03-r0/stress-lockbus.c /usr/src/debug/stress-ng/0.15.03-r0/stress-af-alg.c 
 /usr/src/debug/stress-ng/0.15.03-r0/stress-handle.c /usr/src/debug/stress-ng/0.15.03-r0/stress-icache.c /usr/src/debug/stress-ng/0.15.03-r0/stress-opcode.c /usr/src/debug/stress-ng/0.15.03-r0/stress-ptrace.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rename.c /usr/src/debug/stress-ng/0.15.03-r0/stress-rotate.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigfpe.c /usr/src/debug/stress-ng/0.15.03-r0/stress-splice.c /usr/src/debug/stress-ng/0.15.03-r0/stress-uprobe.c /usr/src/debug/stress-ng/0.15.03-r0/stress-zombie.c /usr/src/debug/stress-ng/0.15.03-r0/stress-secretmem.c /usr/src/debug/stress-ng/0.15.03-r0/stress-set.c /usr/src/debug/stress-ng/0.15.03-r0/stress-session.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sysinval.c /usr/src/debug/stress-ng/0.15.03-r0/stress-dup.c /usr/src/debug/stress-ng/0.15.03-r0/core-out-of-memory.c /usr/src/debug/stress-ng/0.15.03-r0/stress-copy-file.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sync-file.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sendfil
 e.c /usr/src/debug/stress-ng/0.15.03-r0/stress-oom-pipe.c /usr/src/debug/stress-ng/0.15.03-r0/core-mmap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tun.c /usr/src/debug/stress-ng/0.15.03-r0/stress-tlb-shootdown.c /usr/src/debug/stress-ng/0.15.03-r0/stress-shm.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sem-sysv.c /usr/src/debug/stress-ng/0.15.03-r0/stress-shm-sysv.c /usr/src/debug/stress-ng/0.15.03-r0/stress-madvise.c /usr/src/debug/stress-ng/0.15.03-r0/stress-bind-mount.c /usr/src/debug/stress-ng/0.15.03-r0/stress-far-branch.c /usr/src/debug/stress-ng/0.15.03-r0/core-numa.c /usr/src/debug/stress-ng/0.15.03-r0/stress-bigheap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigtrap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-wcs.c /usr/src/debug/stress-ng/0.15.03-r0/stress-vm.c /usr/src/debug/stress-ng/0.15.03-r0/core-shared-heap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-io-uring.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmapaddr.c /usr/src/debug/stress-ng/0.15.03-r0/stress-mmap
 many.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sockmany.c /usr/src/debug/stress-ng/0.15.03-r0/stress-kill.c /usr/src/debug/stress-ng/0.15.03-r0/stress-klog.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sctp.c /usr/src/debug/stress-ng/0.15.03-r0/stress-seal.c /usr/src/debug/stress-ng/0.15.03-r0/stress-seek.c /usr/src/debug/stress-ng/0.15.03-r0/stress-str.c /usr/src/debug/stress-ng/0.15.03-r0/stress-swap.c /usr/src/debug/stress-ng/0.15.03-r0/stress-wait.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sigsuspend.c /usr/src/debug/stress-ng/0.15.03-r0/stress-heapsort.c /usr/src/debug/stress-ng/0.15.03-r0/stress-sysinfo.c", added "/usr/src/debug/stress-ng/0.15.04-r0/stress-epoll.c /usr/src/debug/stress-ng/0.15.04-r0/stress-iomix.c /usr/src/debug/stress-ng/0.15.04-r0/stress-qsort.c /usr/src/debug/stress-ng/0.15.04-r0/stress-funcret.c /usr/src/debug/stress-ng/0.15.04-r0/stress-hrtimers.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pty.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mergesort.c /
 usr/src/debug/stress-ng/0.15.04-r0/stress-radixsort.c /usr/src/debug/stress-ng/0.15.04-r0/stress-shellsort.c /usr/src/debug/stress-ng/0.15.04-r0/stress-resched.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigsegv.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vm-segv.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmapfixed.c /usr/src/debug/stress-ng/0.15.04-r0/stress-signal.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigpending.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vm-splice.c /usr/src/debug/stress-ng/0.15.04-r0/core-klog.c /usr/src/debug/stress-ng/0.15.04-r0/core-helper.c /usr/src/debug/stress-ng/0.15.04-r0/core-sched.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ng.c /usr/src/debug/stress-ng/0.15.04-r0/stress-branch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fpunch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-switch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ng.h /usr/src/debug/stress-ng/0.15.04-r0/stress-udp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pthread.c /usr/src/d
 ebug/stress-ng/0.15.04-r0/stress-dnotify.c /usr/src/debug/stress-ng/0.15.04-r0/core-killpid.c /usr/src/debug/stress-ng/0.15.04-r0/core-setting.c /usr/src/debug/stress-ng/0.15.04-r0/core-put.h /usr/src/debug/stress-ng/0.15.04-r0/stress-inotify.c /usr/src/debug/stress-ng/0.15.04-r0/stress-cpu.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dirdeep.c /usr/src/debug/stress-ng/0.15.04-r0/stress-bsearch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-hsearch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-lsearch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tsearch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-llc-affinity.c /usr/src/debug/stress-ng/0.15.04-r0/stress-affinity.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dccp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-exec.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fifo.c /usr/src/debug/stress-ng/0.15.04-r0/stress-brk.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fork.c /usr/src/debug/stress-ng/0.15.04-r0/stress-numa.c /usr/src/debug/stress-ng/0.
 15.04-r0/stress-open.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pipe.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-kcmp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-watchdog.c /usr/src/debug/stress-ng/0.15.04-r0/core-parse-opts.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fiemap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mremap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dir.c /usr/src/debug/stress-ng/0.15.04-r0/stress-munmap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rawudp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pagemove.c /usr/src/debug/stress-ng/0.15.04-r0/stress-netdev.c /usr/src/debug/stress-ng/0.15.04-r0/core-mlock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rawdev.c /usr/src/debug/stress-ng/0.15.04-r0/stress-chroot.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ioport.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rawpkt.c /usr/src/debug/stress-ng/0.15.04-r0/stress-reboot.c /usr/src/debug/stress-ng/0.15.04-r0/stress-r
 limit.c /usr/src/debug/stress-ng/0.15.04-r0/stress-umount.c /usr/src/debug/stress-ng/0.15.04-r0/stress-chattr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dekker.c /usr/src/debug/stress-ng/0.15.04-r0/stress-efivar.c /usr/src/debug/stress-ng/0.15.04-r0/stress-itimer.c /usr/src/debug/stress-ng/0.15.04-r0/core-module.c /usr/src/debug/stress-ng/0.15.04-r0/core-mounts.c /usr/src/debug/stress-ng/0.15.04-r0/stress-cpu-online.c /usr/src/debug/stress-ng/0.15.04-r0/stress-getrandom.c /usr/src/debug/stress-ng/0.15.04-r0/stress-forkheavy.c /usr/src/debug/stress-ng/0.15.04-r0/stress-misaligned.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ping-sock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigchld.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sockdiag.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pageswap.c /usr/src/debug/stress-ng/0.15.04-r0/core-job.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rdrand.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sockfd.c /usr/src/debug/stress-ng/0.15.04-r0/stre
 ss-randlist.c /usr/src/debug/stress-ng/0.15.04-r0/stress-skiplist.c /usr/src/debug/stress-ng/0.15.04-r0/core-ignite-cpu.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigpipe.c /usr/src/debug/stress-ng/0.15.04-r0/stress-exit-group.c /usr/src/debug/stress-ng/0.15.04-r0/stress-daemon.c /usr/src/debug/stress-ng/0.15.04-r0/stress-plugin.c /usr/src/debug/stress-ng/0.15.04-r0/core-builtin.h /usr/src/debug/stress-ng/0.15.04-r0/stress-xattr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pidfd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-prctl.c /usr/src/debug/stress-ng/0.15.04-r0/stress-readahead.c /usr/src/debug/stress-ng/0.15.04-r0/stress-usersyscall.c /usr/src/debug/stress-ng/0.15.04-r0/core-limit.c /usr/src/debug/stress-ng/0.15.04-r0/stress-cap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rawsock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-stackmmap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-landlock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mincore.c /usr/src/debug/stress-ng/0.15.04-
 r0/stress-unshare.c /usr/src/debug/stress-ng/0.15.04-r0/stress-getdent.c /usr/src/debug/stress-ng/0.15.04-r0/stress-smi.c /usr/src/debug/stress-ng/0.15.04-r0/core-bitops.h /usr/src/debug/stress-ng/0.15.04-r0/stress-mq.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pci.c /usr/src/debug/stress-ng/0.15.04-r0/stress-softlockup.c /usr/src/debug/stress-ng/0.15.04-r0/stress-signest.c /usr/src/debug/stress-ng/0.15.04-r0/stress-aio.c /usr/src/debug/stress-ng/0.15.04-r0/stress-eventfd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-lockofd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-timerfd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tsc.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dynlib.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mcontend.c /usr/src/debug/stress-ng/0.15.04-r0/core-asm-x86.h /usr/src/debug/stress-ng/0.15.04-r0/stress-matrix.c /usr/src/debug/stress-ng/0.15.04-r0/stress-matrix-3d.c /usr/src/debug/stress-ng/0.15.04-r0/stress-syscall.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pe
 rsonality.c /usr/src/debug/stress-ng/0.15.04-r0/stress-memrate.c /usr/src/debug/stress-ng/0.15.04-r0/stress-schedpolicy.c /usr/src/debug/stress-ng/0.15.04-r0/stress-waitcpu.c /usr/src/debug/stress-ng/0.15.04-r0/stress-kvm.c /usr/src/debug/stress-ng/0.15.04-r0/stress-inode-flags.c /usr/src/debug/stress-ng/0.15.04-r0/stress-gpu.c /usr/src/debug/stress-ng/0.15.04-r0/stress-bad-ioctl.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmapfork.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vm-addr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ipsec-mb.c /usr/src/debug/stress-ng/0.15.04-r0/stress-context.c /usr/src/debug/stress-ng/0.15.04-r0/core-mwc.c /usr/src/debug/stress-ng/0.15.04-r0/stress-bad-altstack.c /usr/src/debug/stress-ng/0.15.04-r0/stress-key.c /usr/src/debug/stress-ng/0.15.04-r0/core-sort.h /usr/src/debug/stress-ng/0.15.04-r0/core-sort.c /usr/src/debug/stress-ng/0.15.04-r0/stress-funccall.c /usr/src/debug/stress-ng/0.15.04-r0/core-hash.h /usr/src/debug/stress-ng/0.15.04-r0/core-affin
 ity.c /usr/src/debug/stress-ng/0.15.04-r0/core-hash.c /usr/src/debug/stress-ng/0.15.04-r0/stress-loadavg.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sem.c /usr/src/debug/stress-ng/0.15.04-r0/stress-memthrash.c /usr/src/debug/stress-ng/0.15.04-r0/stress-memhotplug.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sparsematrix.c /usr/src/debug/stress-ng/0.15.04-r0/stress-io.c /usr/src/debug/stress-ng/0.15.04-r0/core-smart.c /usr/src/debug/stress-ng/0.15.04-r0/core-smart.h /usr/src/debug/stress-ng/0.15.04-r0/core-pthread.h /usr/src/debug/stress-ng/0.15.04-r0/stress-filename.c /usr/src/debug/stress-ng/0.15.04-r0/stress-flushcache.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sysbadaddr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-membarrier.c /usr/src/debug/stress-ng/0.15.04-r0/core-thermal-zone.h /usr/src/debug/stress-ng/0.15.04-r0/core-thermal-zone.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rtc.c /usr/src/debug/stress-ng/0.15.04-r0/stress-binderfs.c /usr/src/debug/stress-ng/0.15.04-r0/st
 ress-fsize.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fstat.c /usr/src/debug/stress-ng/0.15.04-r0/stress-futex.c /usr/src/debug/stress-ng/0.15.04-r0/core-perf.c /usr/src/debug/stress-ng/0.15.04-r0/stress-locka.c /usr/src/debug/stress-ng/0.15.04-r0/stress-lockf.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigfd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigio.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigrt.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sleep.c /usr/src/debug/stress-ng/0.15.04-r0/stress-spawn.c /usr/src/debug/stress-ng/0.15.04-r0/stress-timer.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tmpfs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-touch.c /usr/src/debug/stress-ng/0.15.04-r0/core-perf.h /usr/src/debug/stress-ng/0.15.04-r0/stress-prefetch.c /usr/src/debug/stress-ng/0.15.04-r0/stress-race-sched.c /usr/src/debug/stress-ng/0.15.04-r0/stress-urandom.c /usr/src/debug/stress-ng/0.15.04-r0/stress-hdd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmaphuge.c /usr/src/d
 ebug/stress-ng/0.15.04-r0/stress-stack.c /usr/src/debug/stress-ng/0.15.04-r0/stress-close.c /usr/src/debug/stress-ng/0.15.04-r0/stress-crypt.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sysfs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ring-pipe.c /usr/src/debug/stress-ng/0.15.04-r0/core-io-priority.c /usr/src/debug/stress-ng/0.15.04-r0/core-thrash.h /usr/src/debug/stress-ng/0.15.04-r0/stress-cacheline.c /usr/src/debug/stress-ng/0.15.04-r0/core-thrash.c /usr/src/debug/stress-ng/0.15.04-r0/stress-physpage.c /usr/src/debug/stress-ng/0.15.04-r0/stress-resources.c /usr/src/debug/stress-ng/0.15.04-r0/stress-quota.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ramfs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-remap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-alarm.c /usr/src/debug/stress-ng/0.15.04-r0/stress-cache.c /usr/src/debug/stress-ng/0.15.04-r0/stress-chdir.c /usr/src/debug/stress-ng/0.15.04-r0/stress-chmod.c /usr/src/debug/stress-ng/0.15.04-r0/stress-chown.c /usr/src/debug/stress
 -ng/0.15.04-r0/stress-clock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-clone.c /usr/src/debug/stress-ng/0.15.04-r0/stress-userfaultfd.c /usr/src/debug/stress-ng/0.15.04-r0/core-time.c /usr/src/debug/stress-ng/0.15.04-r0/core-cpu.c /usr/src/debug/stress-ng/0.15.04-r0/core-cpu.h /usr/src/debug/stress-ng/0.15.04-r0/stress-vecshuf.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dev.c /usr/src/debug/stress-ng/0.15.04-r0/core-resources.c /usr/src/debug/stress-ng/0.15.04-r0/core-resources.h /usr/src/debug/stress-ng/0.15.04-r0/stress-zlib.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pkey.c /usr/src/debug/stress-ng/0.15.04-r0/stress-poll.c /usr/src/debug/stress-ng/0.15.04-r0/stress-regs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rmap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rseq.c /usr/src/debug/stress-ng/0.15.04-r0/stress-link.c /usr/src/debug/stress-ng/0.15.04-r0/stress-list.c /usr/src/debug/stress-ng/0.15.04-r0/stress-loop.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmap.c /usr/src/
 debug/stress-ng/0.15.04-r0/stress-udp-flood.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fallocate.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ioprio.c /usr/src/debug/stress-ng/0.15.04-r0/stress-env.c /usr/src/debug/stress-ng/0.15.04-r0/stress-stream.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mlockmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-msyncmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vforkmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-pipeherd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vecfp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vm-rw.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mknod.c /usr/src/debug/stress-ng/0.15.04-r0/stress-msync.c /usr/src/debug/stress-ng/0.15.04-r0/stress-utime.c /usr/src/debug/stress-ng/0.15.04-r0/stress-yield.c /usr/src/debug/stress-ng/0.15.04-r0/stress-memfd.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mlock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mutex.c /usr/src/debug/stress-ng/0.15.04-r0/stress-lease.c /usr/src/debug
 /stress-ng/0.15.04-r0/core-icache.h /usr/src/debug/stress-ng/0.15.04-r0/core-icache.c /usr/src/debug/stress-ng/0.15.04-r0/stress-l1cache.c /usr/src/debug/stress-ng/0.15.04-r0/core-lock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-get.c /usr/src/debug/stress-ng/0.15.04-r0/stress-full.c /usr/src/debug/stress-ng/0.15.04-r0/stress-goto.c /usr/src/debug/stress-ng/0.15.04-r0/stress-hash.c /usr/src/debug/stress-ng/0.15.04-r0/stress-jpeg.c /usr/src/debug/stress-ng/0.15.04-r0/stress-judy.c /usr/src/debug/stress-ng/0.15.04-r0/stress-nice.c /usr/src/debug/stress-ng/0.15.04-r0/stress-null.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tree.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigq.c /usr/src/debug/stress-ng/0.15.04-r0/stress-aiol.c /usr/src/debug/stress-ng/0.15.04-r0/stress-msg.c /usr/src/debug/stress-ng/0.15.04-r0/core-log.c /usr/src/debug/stress-ng/0.15.04-r0/core-shim.c /usr/src/debug/stress-ng/0.15.04-r0/stress-syncload.c /usr/src/debug/stress-ng/0.15.04-r0/stress-netlink-proc.c /usr/
 src/debug/stress-ng/0.15.04-r0/stress-netlink-task.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vdso.c /usr/src/debug/stress-ng/0.15.04-r0/stress-zero.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dev-shm.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-priv-instr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigabrt.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fp-error.c /usr/src/debug/stress-ng/0.15.04-r0/stress-x86syscall.c /usr/src/debug/stress-ng/0.15.04-r0/stress-revio.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fault.c /usr/src/debug/stress-ng/0.15.04-r0/stress-atomic.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fcntl.c /usr/src/debug/stress-ng/0.15.04-r0/stress-cyclic.c /usr/src/debug/stress-ng/0.15.04-r0/stress-malloc.c /usr/src/debug/stress-ng/0.15.04-r0/stress-flock.c /usr/src/debug/stress-ng/0.15.04-r0/stress-longjmp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-seccomp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-x86cpuid.c /usr
 /src/debug/stress-ng/0.15.04-r0/stress-sockpair.c /usr/src/debug/stress-ng/0.15.04-r0/stress-apparmor.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sockabuse.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dentry.c /usr/src/debug/stress-ng/0.15.04-r0/stress-memcpy.c /usr/src/debug/stress-ng/0.15.04-r0/stress-verity.c /usr/src/debug/stress-ng/0.15.04-r0/stress-file-ioctl.c /usr/src/debug/stress-ng/0.15.04-r0/core-ftrace.h /usr/src/debug/stress-ng/0.15.04-r0/stress-vecmath.c /usr/src/debug/stress-ng/0.15.04-r0/core-ftrace.c /usr/src/debug/stress-ng/0.15.04-r0/core-vmstat.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vecwide.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dirmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-fanotify.c /usr/src/debug/stress-ng/0.15.04-r0/core-try-open.c /usr/src/debug/stress-ng/0.15.04-r0/stress-peterson.c /usr/src/debug/stress-ng/0.15.04-r0/core-cache.c /usr/src/debug/stress-ng/0.15.04-r0/core-cache.h /usr/src/debug/stress-ng/0.15.04-r0/core-net.h /usr/src/deb
 ug/stress-ng/0.15.04-r0/core-madvise.c /usr/src/debug/stress-ng/0.15.04-r0/core-mincore.c /usr/src/debug/stress-ng/0.15.04-r0/core-net.c /usr/src/debug/stress-ng/0.15.04-r0/stress-nop.c /usr/src/debug/stress-ng/0.15.04-r0/stress-icmp-flood.c /usr/src/debug/stress-ng/0.15.04-r0/stress-idle-page.c /usr/src/debug/stress-ng/0.15.04-r0/stress-nanosleep.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tee.c /usr/src/debug/stress-ng/0.15.04-r0/stress-access.c /usr/src/debug/stress-ng/0.15.04-r0/stress-enosys.c /usr/src/debug/stress-ng/0.15.04-r0/stress-procfs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mprotect.c /usr/src/debug/stress-ng/0.15.04-r0/stress-lockbus.c /usr/src/debug/stress-ng/0.15.04-r0/stress-af-alg.c /usr/src/debug/stress-ng/0.15.04-r0/stress-handle.c /usr/src/debug/stress-ng/0.15.04-r0/stress-icache.c /usr/src/debug/stress-ng/0.15.04-r0/stress-opcode.c /usr/src/debug/stress-ng/0.15.04-r0/stress-ptrace.c /usr/src/debug/stress-ng/0.15.04-r0/stress-rename.c /usr/src/debug/stress
 -ng/0.15.04-r0/stress-rotate.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigfpe.c /usr/src/debug/stress-ng/0.15.04-r0/stress-splice.c /usr/src/debug/stress-ng/0.15.04-r0/stress-uprobe.c /usr/src/debug/stress-ng/0.15.04-r0/stress-zombie.c /usr/src/debug/stress-ng/0.15.04-r0/stress-secretmem.c /usr/src/debug/stress-ng/0.15.04-r0/stress-set.c /usr/src/debug/stress-ng/0.15.04-r0/stress-session.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sysinval.c /usr/src/debug/stress-ng/0.15.04-r0/stress-dup.c /usr/src/debug/stress-ng/0.15.04-r0/core-out-of-memory.c /usr/src/debug/stress-ng/0.15.04-r0/stress-copy-file.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sync-file.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sendfile.c /usr/src/debug/stress-ng/0.15.04-r0/stress-oom-pipe.c /usr/src/debug/stress-ng/0.15.04-r0/core-mmap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tun.c /usr/src/debug/stress-ng/0.15.04-r0/stress-tlb-shootdown.c /usr/src/debug/stress-ng/0.15.04-r0/stress-shm.c /usr/src/debug/str
 ess-ng/0.15.04-r0/stress-sem-sysv.c /usr/src/debug/stress-ng/0.15.04-r0/stress-shm-sysv.c /usr/src/debug/stress-ng/0.15.04-r0/stress-madvise.c /usr/src/debug/stress-ng/0.15.04-r0/stress-bind-mount.c /usr/src/debug/stress-ng/0.15.04-r0/stress-far-branch.c /usr/src/debug/stress-ng/0.15.04-r0/core-numa.c /usr/src/debug/stress-ng/0.15.04-r0/stress-bigheap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigtrap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-wcs.c /usr/src/debug/stress-ng/0.15.04-r0/stress-vm.c /usr/src/debug/stress-ng/0.15.04-r0/core-shared-heap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-io-uring.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmapaddr.c /usr/src/debug/stress-ng/0.15.04-r0/stress-mmapmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sockmany.c /usr/src/debug/stress-ng/0.15.04-r0/stress-kill.c /usr/src/debug/stress-ng/0.15.04-r0/stress-klog.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sctp.c /usr/src/debug/stress-ng/0.15.04-r0/stress-seal.c /usr/src/debug/stres
 s-ng/0.15.04-r0/stress-seek.c /usr/src/debug/stress-ng/0.15.04-r0/stress-str.c /usr/src/debug/stress-ng/0.15.04-r0/stress-swap.c /usr/src/debug/stress-ng/0.15.04-r0/stress-wait.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sigsuspend.c /usr/src/debug/stress-ng/0.15.04-r0/stress-heapsort.c /usr/src/debug/stress-ng/0.15.04-r0/stress-sysinfo.c"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.15.03 [default] to 0.15.04 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 5092928 to 5088576 (-0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.15.03" to "0.15.04"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.15.03 [default] to 0.15.04 [default]

--===============0901560984212170264==--

