Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12FDCA9EDA
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7526.1685693431674496888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X7uho/F2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288158-8efae279-7068-44b4-bab8-bb635ce70212-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nFhUQIrLelSQuc/O2OqrnAltu+UODMRE0CiHsEFQcM0=;
	b=X7uho/F2fIqp2AAJdvbabt6WGuj1Qxp2czu0rwK5tB/jxwEYbFjqesbXRVQQ8zbj
	iTYGIszUkEYym9k/+i5ynDXxVV1c8PVjGq0vwrZXNiLtqnijEFJYgEy8QhT0DMaplUP
	p5kyoOReBXmp9eVO3sYFUFxkb+Ub5LTssEduv18A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nFhUQIrLelSQuc/O2OqrnAltu+UODMRE0CiHsEFQcM0=;
	b=H7MlK1rE9iClkg4expZWxxihuS821KJKU6ZvUOYkGeyHlIsch3yHP4/k2F5zFx2u
	B01IEzw70dEe9tDbMKU2m/QjeawQgJkxap5xOHfNiBXNjwIotjgopdHeSnhDpmoDnDZ
	7LC0TLGDTeGKtXijFcY9pLZX6/Oa0sGE+GM2s+H8=
Content-Type: multipart/mixed; boundary="===============8871627227354047124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.20.1 SUCCEEDED
Message-ID: <010101887b288158-8efae279-7068-44b4-bab8-bb635ce70212-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182187

--===============8871627227354047124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-docutils* to *0.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.19-0.20.1.patch
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
--===============8871627227354047124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.19-0.20.1.patch"

RnJvbSAwYzIwMDVhYjAzMDNjOWIwMzIyNDFiMGM1NzBjMmIwYTE0NjZhNTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDoyNzo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4xOSAtPiAwLjIwLjEKCi0tLQogLi4uL3B5dGhvbi9w
eXRob24zLWRvY3V0aWxzXzAuMTkuYmIgICAgICAgICAgIHwgIDExIC0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtZG9jdXRpbHNfMC4yMC4xLmJiICAgICAgICAgfCAxMDggKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9j
dXRpbHNfMC4xOS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjIwLjEuYmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4xOS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjE5LmJiCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCA3YWU5M2FiNTU3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjE5LmJiCisrKyAvZGV2L251bGwK
QEAgLTEsMTEgKzAsMCBAQAotU1VNTUFSWSA9ICJEb2N1dGlscyBpcyBhIG1vZHVsYXIgc3lzdGVt
IGZvciBwcm9jZXNzaW5nIGRvY3VtZW50YXRpb24gaW50byB1c2VmdWwgZm9ybWF0cyIKLUhPTUVQ
QUdFID0gImh0dHA6Ly9kb2N1dGlscy5zb3VyY2Vmb3JnZS5uZXQiCi1TRUNUSU9OID0gImRldmVs
L3B5dGhvbiIKLUxJQ0VOU0UgPSAiUFNGLTIuMCAmIEJTRC0yLUNsYXVzZSAmIEdQTC0zLjAtb25s
eSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcudHh0O21kNT00MTAwMWIyOTZh
ODliYjI3ODBiYmUzMDZlOTQ3ZWNlZSIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzOTk1YTY3
NTNjMzBiN2Y1NzdmZWJmYzJjNTA0MTFmZWM2YWFjN2Y3ZmZlYjdjNGNmZTU5OTEwNzJkY2Y5ZTYi
Ci0KLWluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBu
YXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZG9jdXRpbHNfMC4yMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWRvY3V0aWxzXzAuMjAuMS5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi4yNDlhNzVlYTM5Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjAuMS5iYgpAQCAtMCwwICsxLDEwOCBAQAorIyBG
SVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdk
ZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhl
IExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisj
IHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBs
ZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUg
Y2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcudHh0CisjICsrKyBDT1BZSU5HLnR4dAorIyBAQCAt
MSwxNyArMSwxOSBAQAorIyArLi4gaW5jbHVkZTo6IGRvY3MvaGVhZGVyMC50eHQKKyMgKworIyAg
PT09PT09PT09PT09PT09PT09CisjICAgQ29weWluZyBEb2N1dGlscworIyAgPT09PT09PT09PT09
PT09PT09CisjICAKKyMgIDpBdXRob3I6IERhdmlkIEdvb2RnZXIKKyMgIDpDb250YWN0OiBnb29k
Z2VyQHB5dGhvbi5vcmcKKyMgLTpEYXRlOiAkRGF0ZTogMjAyMi0wNS0zMCAxODo1NDo0NiArMDIw
MCAoTW8sIDMwLiBNYWkgMjAyMikgJAorIyArOkRhdGU6ICREYXRlOiAyMDIyLTExLTI5IDAwOjU1
OjI1ICswMTAwIChEaSwgMjkuIE5vdiAyMDIyKSAkCisjICA6V2ViIHNpdGU6IGh0dHBzOi8vZG9j
dXRpbHMuc291cmNlZm9yZ2UuaW8vCisjICA6Q29weXJpZ2h0OiBUaGlzIGRvY3VtZW50IGhhcyBi
ZWVuIHBsYWNlZCBpbiB0aGUgcHVibGljIGRvbWFpbi4KKyMgIAorIyAgTW9zdCBvZiB0aGUgZmls
ZXMgaW5jbHVkZWQgaW4gdGhpcyBwcm9qZWN0IGhhdmUgYmVlbiBwbGFjZWQgaW4gdGhlCisjICBw
dWJsaWMgZG9tYWluLCBhbmQgdGhlcmVmb3JlIGhhdmUgbm8gbGljZW5zZSByZXF1aXJlbWVudHMg
YW5kIG5vCisjICByZXN0cmljdGlvbnMgb24gY29weWluZyBvciB1c2FnZTsgc2VlIHRoZSBgUHVi
bGljIERvbWFpbiBEZWRpY2F0aW9uYF8KKyMgLWJlbG93LiAgVGhlcmUgYXJlIGEgZmV3IGV4Y2Vw
dGlvbnNfLCBsaXN0ZWQgYmVsb3cuCisjICtiZWxvdy4gIFRoZXJlIGFyZSBleGNlcHRpb25zXywg
bGlzdGVkIGJlbG93LgorIyAgRmlsZXMgaW4gdGhlIFNhbmRib3hfIGFyZSBub3QgZGlzdHJpYnV0
ZWQgd2l0aCBEb2N1dGlscyByZWxlYXNlcyBhbmQKKyMgIG1heSBoYXZlIGRpZmZlcmVudCBsaWNl
bnNlIHRlcm1zLgorIyAgCisjIEBAIC04Nyw4ICs4OSw4IEBACisjICAgIFJlbGVhc2VkIHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgYEJTRCAyLUNsYXVzZSBMaWNlbnNlYF8KKyMgICAgKGBsb2NhbCBj
b3B5IDxsaWNlbnNlcy9CU0QtMi1DbGF1c2UudHh0PmBfXykuCisjICAKKyMgLSogZG9jdXRpbHMv
dXRpbHMvbWF0aC9tYXRoMmh0bWwucHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9s
eWdsb3QvbWF0aC5jc3MKKyMgKyogfCBkb2N1dGlscy91dGlscy9tYXRoL21hdGgyaHRtbC5weSwK
KyMgKyAgfCBkb2N1dGlscy93cml0ZXJzL2h0bWw1X3BvbHlnbG90L21hdGguY3NzCisjICAKKyMg
ICAgQ29weXJpZ2h0IMKpIDIwMDksMjAxMCBBbGV4IEZlcm7DoW5kZXo7IDIwMjEgR8O8bnRlciBN
aWxkZQorIyAgCisjIEBAIC05OSwyOCArMTAxLDI4IEBACisjICAKKyMgICAgLi4gX2VMeVhlcjog
aHR0cHM6Ly9naXRodWIuY29tL2FsZXhmZXJuYW5kZXovZWx5eGVyCisjICAKKyMgLSogZG9jdXRp
bHMvX19tYWluX18ucHksCisjIC0gIGRvY3V0aWxzL3BhcnNlcnMvY29tbW9ubWFya193cmFwcGVy
LnB5LAorIyAtICBkb2N1dGlscy9wYXJzZXJzL3JlY29tbW9ubWFya193cmFwcGVyLnB5LAorIyAt
ICBkb2N1dGlscy91dGlscy9lcnJvcl9yZXBvcnRpbmcucHksCisjIC0gIGRvY3V0aWxzL3V0aWxz
L21hdGgvX19pbml0X18ucHksCisjIC0gIGRvY3V0aWxzL3V0aWxzL21hdGgvbGF0ZXgybWF0aG1s
LnB5LAorIyAtICBkb2N1dGlscy91dGlscy9tYXRoL3RleDJtYXRobWxfZXh0ZXJuLnB5LAorIyAt
ICBkb2N1dGlscy91dGlscy9wdW5jdHVhdGlvbl9jaGFycy5weSwKKyMgLSAgZG9jdXRpbHMvdXRp
bHMvc21hcnRxdW90ZXMucHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3Qv
X19pbml0X18ucHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3QvKi5jc3Ms
CisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvbGF0ZXgyZS9kb2N1dGlscy5zdHksCisjIC0gIGRvY3V0
aWxzL3dyaXRlcnMveGV0ZXgvX19pbml0X18ucHksCisjIC0gIHRlc3QvdGVzdF9wYXJzZXJzL3Rl
c3RfcmVjb21tb25tYXJrL1wqLnB5LAorIyAtICB0ZXN0L3Rlc3RfcGFyc2Vycy90ZXN0X3JzdC90
ZXN0X2RpcmVjdGl2ZXMvdGVzdF9faW5pdF9fLnB5LAorIyAtICB0ZXN0L3Rlc3RfcGFyc2Vycy90
ZXN0X3JzdC90ZXN0X2RpcmVjdGl2ZXMvdGVzdF9jb2RlX3BhcnNpbmcucHksCisjIC0gIHRlc3Qv
dGVzdF9wYXJzZXJzL3Rlc3RfcnN0L3Rlc3RfbGluZV9sZW5ndGhfbGltaXRfZGVmYXVsdC5weSwK
KyMgLSAgdGVzdC90ZXN0X3BhcnNlcnMvdGVzdF9yc3QvdGVzdF9saW5lX2xlbmd0aF9saW1pdC5w
eSwKKyMgLSAgdGVzdC90ZXN0X3dyaXRlcnMvdGVzdF9sYXRleDJlX21pc2MucHksCisjIC0gIHRl
c3QvdHJhbnNmb3Jtcy90ZXN0X3NtYXJ0cXVvdGVzLnB5LAorIyAtICB0b29scy9kb2N1dGlscy1j
bGkucHksCisjIC0gIHRvb2xzL3JzdDJodG1sNS5weQorIyArKiB8IGRvY3V0aWxzL19fbWFpbl9f
LnB5LAorIyArICB8IGRvY3V0aWxzL3BhcnNlcnMvY29tbW9ubWFya193cmFwcGVyLnB5LAorIyAr
ICB8IGRvY3V0aWxzL3BhcnNlcnMvcmVjb21tb25tYXJrX3dyYXBwZXIucHksCisjICsgIHwgZG9j
dXRpbHMvdXRpbHMvZXJyb3JfcmVwb3J0aW5nLnB5LAorIyArICB8IGRvY3V0aWxzL3V0aWxzL21h
dGgvX19pbml0X18ucHksCisjICsgIHwgZG9jdXRpbHMvdXRpbHMvbWF0aC9sYXRleDJtYXRobWwu
cHksCisjICsgIHwgZG9jdXRpbHMvdXRpbHMvbWF0aC90ZXgybWF0aG1sX2V4dGVybi5weSwKKyMg
KyAgfCBkb2N1dGlscy91dGlscy9wdW5jdHVhdGlvbl9jaGFycy5weSwKKyMgKyAgfCBkb2N1dGls
cy91dGlscy9zbWFydHF1b3Rlcy5weSwKKyMgKyAgfCBkb2N1dGlscy93cml0ZXJzL2h0bWw1X3Bv
bHlnbG90L19faW5pdF9fLnB5LAorIyArICB8IGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWds
b3QvXCouY3NzLAorIyArICB8IGRvY3V0aWxzL3dyaXRlcnMvbGF0ZXgyZS9kb2N1dGlscy5zdHks
CisjICsgIHwgZG9jdXRpbHMvd3JpdGVycy94ZXRleC9fX2luaXRfXy5weSwKKyMgKyAgfCB0ZXN0
L3Rlc3RfcGFyc2Vycy90ZXN0X3JlY29tbW9ubWFyay9cKi5weSwKKyMgKyAgfCB0ZXN0L3Rlc3Rf
cGFyc2Vycy90ZXN0X3JzdC90ZXN0X2RpcmVjdGl2ZXMvdGVzdF9faW5pdF9fLnB5LAorIyArICB8
IHRlc3QvdGVzdF9wYXJzZXJzL3Rlc3RfcnN0L3Rlc3RfZGlyZWN0aXZlcy90ZXN0X2NvZGVfcGFy
c2luZy5weSwKKyMgKyAgfCB0ZXN0L3Rlc3RfcGFyc2Vycy90ZXN0X3JzdC90ZXN0X2xpbmVfbGVu
Z3RoX2xpbWl0X2RlZmF1bHQucHksCisjICsgIHwgdGVzdC90ZXN0X3BhcnNlcnMvdGVzdF9yc3Qv
dGVzdF9saW5lX2xlbmd0aF9saW1pdC5weSwKKyMgKyAgfCB0ZXN0L3Rlc3Rfd3JpdGVycy90ZXN0
X2xhdGV4MmVfbWlzYy5weSwKKyMgKyAgfCB0ZXN0L3RyYW5zZm9ybXMvdGVzdF9zbWFydHF1b3Rl
cy5weSwKKyMgKyAgfCB0b29scy9kb2N1dGlscy1jbGkucHksCisjICsgIHwgdG9vbHMvcnN0Mmh0
bWw1LnB5CisjICAKKyMgICAgQ29weXJpZ2h0IMKpIEfDvG50ZXIgTWlsZGUuCisjICAgIFJlbGVh
c2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgYEJTRCAyLUNsYXVzZSBMaWNlbnNlYF8KKyMgCisj
CisKK1NVTU1BUlkgPSAiRG9jdXRpbHMgaXMgYSBtb2R1bGFyIHN5c3RlbSBmb3IgcHJvY2Vzc2lu
ZyBkb2N1bWVudGF0aW9uIGludG8gdXNlZnVsIGZvcm1hdHMiCitIT01FUEFHRSA9ICJodHRwOi8v
ZG9jdXRpbHMuc291cmNlZm9yZ2UubmV0IgorU0VDVElPTiA9ICJkZXZlbC9weXRob24iCitMSUNF
TlNFID0gIlBTRi0yLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9ubHkiCitMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9MDhmNWY4YWE2YTFkYjI1MDBjMDhhMmJi
NTU4ZTQ1YWYiCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMDhhNGUyNzZjM2ExNTgzYTg2ZGNl
M2UzNGFiYTNmZTA0ZDAyYmJhMmRkNTFlZDE2MTA2MjQ0ZThhOTIzZTNiIgorCitpbmhlcml0IHB5
cGkgc2V0dXB0b29sczMKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAK
Mi4zOS4yCgo=

--===============8871627227354047124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: removed "/usr/lib/python3.11/site-packages/docutils-0.19.dist-info/RECORD /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/METADATA /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/dependency_links.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/COPYING.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/SOURCES.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/WHEEL", added "/usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/docutils-0.20.1.di
 st-info/RECORD /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/__pycache__/prepstyles.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/METADATA /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/COPYING.txt /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/prepstyles.py /usr/lib/python3.11/site-packages/docutils/languages/uk.py"
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/COPYING.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/prepstyles.py was added
  /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/__pycache__/prepstyles.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/COPYING.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/dependency_links.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/SOURCES.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/WHEEL was removed

--===============8871627227354047124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.19.tar.gz;downloadfilename=docutils-0.19.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.20.1.tar.gz;downloadfilename=docutils-0.20.1.tar.gz"
packages/core2-32-poky-linux/python3-docutils: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.19 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 3964079 to 3983926 (+1%)
packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: removed "/usr/lib/python3.11/site-packages/docutils-0.19.dist-info/RECORD /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/METADATA /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/COPYING.txt /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/SOURCES.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/dependency_links.html /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/WHEEL", added "/usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/METADATA /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/prepstyles.py /usr/lib/python3.11/site-packages/docutils/writers/od
 f_odt/__pycache__/prepstyles.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/RECORD /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/COPYING.txt /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/docutils/languages/uk.py /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PV changed from "0.19" to "0.20.1"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.19 [default] to 0.20.1 [default]
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/COPYING.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/docutils-0.20.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/prepstyles.py was added
  /usr/lib/python3.11/site-packages/docutils/writers/odf_odt/__pycache__/prepstyles.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/COPYING.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/dependency_links.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/SOURCES.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.html was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info/WHEEL was removed

--===============8871627227354047124==--

