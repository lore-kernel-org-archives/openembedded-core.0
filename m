Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66345C2FC23
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.174022.1692224342707034216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g1/kiIHO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VZML0Ack;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e64e9-7fcfa98f-3772-4eb3-9615-36d69fc0d40b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s/h9H9BMPEU984MAZfg8DJ+1ShZkAih1cIIcOKYa2tU=;
	b=g1/kiIHOl7y1ucFz7OiAMLQpde+AAw4c9iItmwUyFobUMkR1fhz0QsQiOp3YxF60
	O1pcKTGKrdBaFQYBKTgQS7YJFmizsZE7CwMEQrIwnnhHG0Mpu3l6gY4pZO5NzNNZWJJ
	oj8nNjd1QMJvKWZW6MdRuu2knSeRdJ89rl7ljIEQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s/h9H9BMPEU984MAZfg8DJ+1ShZkAih1cIIcOKYa2tU=;
	b=VZML0AckoJLrTDSQRvQvmAigjWx5LtPAElVn6BcoSVKlvcGsiA+PIz2beV3HccsT
	UdI8DOegO1OGS7vMaAjH43fkr3P3tNTmVNRg+rjFMzUcDs/Y7IUL9xTzG3lFHqJZ2+S
	yk8Z6DkqlFbelSnjy7WjpiNCZPf3RgsgFuynNvds=
Content-Type: multipart/mixed; boundary="===============0123388396901459503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.30 SUCCEEDED
Message-ID: <0101018a006e64e9-7fcfa98f-3772-4eb3-9615-36d69fc0d40b-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186206

--===============0123388396901459503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICptYyogdG8gKjQuOC4zMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAtIGFwcGx5
IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtbWMtdXBncmFkZS00LjguMjktNC44LjMwLnBhdGNoCiAg
ICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0
aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0IGNv
bnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMK
ICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJl
c2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1haWxp
bmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91bGQg
bm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERB
VEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdAphdXRvbWF0aWMgdXBn
cmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0
dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRhdGUgZmFp
bHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVnemlsbGEu
eW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRl
JTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDBi
YTk4MzNjOWEzOWVmMTc2Zjc1ZjJiN2RhMjQ5MjUwNDRiNzE0NjkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTog
V2VkLCAxNiBBdWcgMjAyMyAwODozMzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1jOiB1cGdy
YWRlIDQuOC4yOSAtPiA0LjguMzAKCi0tLQogLi4uLW1jLXJlcGxhY2UtcGVybC13LXdpdGgtdXNl
LXdhcm5pbmdzLnBhdGNoIHwgMTI3IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL21jL3ttY180Ljgu
MjkuYmIgPT4gbWNfNC44LjMwLmJifSAgICAgICAgIHwgICAzICstCiAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxMjkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11
c2Utd2FybmluZ3MucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMve21jXzQu
OC4yOS5iYiA9PiBtY180LjguMzAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Utd2Fybmlu
Z3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvZmlsZXMvMDAwMS1tYy1yZXBsYWNl
LXBlcmwtdy13aXRoLXVzZS13YXJuaW5ncy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggNWVkZTgyZDM0Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bWMvZmlsZXMvMDAwMS1tYy1yZXBsYWNlLXBlcmwtdy13aXRoLXVzZS13YXJuaW5ncy5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDEyNyArMCwwIEBACi1Gcm9tIDYyYzg2YjY5MTA2ZDBkNzAyMTY3
YmExYjk2M2VhMWMyMDFjY2U1YWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSb2Jl
cnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KLURhdGU6IFRodSwgNiBBcHIgMjAx
NyAwMjoyNDoyOCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBtYzogcmVwbGFjZSAicGVybCAtdyIg
d2l0aCAidXNlIHdhcm5pbmdzIgotCi1UaGUgc2hlYmFuZydzIG1heCBsZW5ndGggaXMgdXN1YWxs
eSAxMjggYXMgZGVmaW5lZCBpbgotL3Vzci9pbmNsdWRlL2xpbnV4L2JpbmZtdHMuaDoKLSAgI2Rl
ZmluZSBCSU5QUk1fQlVGX1NJWkUgMTI4Ci0KLVRoZXJlIHdvdWxkIGJlIGVycm9ycyB3aGVuIEBQ
RVJMQCBpcyBsb25nZXIgdGhhbiAxMjgsIHVzZQotJy91c3IvYmluL2VudiBwZXJsJyBjYW4gZml4
IHRoZSBwcm9ibGVtLCBidXQgJy91c3IvYmluL2VudiBwZXJsIC13JwotZG9lc24ndCB3b3JrOgot
Ci0vdXNyL2Jpbi9lbnY6IHBlcmwgLXc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKLQotU28g
cmVwbGFjZSAicGVybCAtdyIgd2l0aCAidXNlIHdhcm5pbmdzIiB0byBtYWtlIGl0IHdvcmsuCi0K
LVRoZSBtYW4yaGxwLmluIGFscmVhZHkgaGFzICJ1c2Ugd2FybmluZ3M7Iiwgc28ganVzdCByZW1v
dmUgJy13JyBpcyBPSy4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9NaWRuaWdodENvbW1hbmRlci9tYy9wdWxsLzE3NF0KLQotU2lnbmVkLW9mZi1ieTog
Um9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci0KLS0tLQotIHNyYy9tYW4y
aGxwL21hbjJobHAuaW4gICAgICAgICAgIHwgMiArLQotIHNyYy92ZnMvZXh0ZnMvaGVscGVycy9h
Ky5pbiAgICAgIHwgNCArKystCi0gc3JjL3Zmcy9leHRmcy9oZWxwZXJzL21haWxmcy5pbiAgfCAz
ICsrLQotIHNyYy92ZnMvZXh0ZnMvaGVscGVycy9wYXRjaGZzLmluIHwgMyArKy0KLSBzcmMvdmZz
L2V4dGZzL2hlbHBlcnMvdWxpYi5pbiAgICB8IDQgKysrLQotIHNyYy92ZnMvZXh0ZnMvaGVscGVy
cy91emlwLmluICAgIHwgMyArKy0KLSA2IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWFuMmhscC9tYW4yaGxwLmluIGIv
c3JjL21hbjJobHAvbWFuMmhscC5pbgotaW5kZXggMDg3NjVkOC4uOGFhNzEzMSAxMDA2NDQKLS0t
LSBhL3NyYy9tYW4yaGxwL21hbjJobHAuaW4KLSsrKyBiL3NyYy9tYW4yaGxwL21hbjJobHAuaW4K
LUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMX0ZPUl9CVUlMREAgLXcKLSsjISBAUEVSTF9GT1Jf
QlVJTERACi0gIwotICMgIE1hbiBwYWdlIHRvIGhlbHAgZmlsZSBjb252ZXJ0ZXIKLSAjICBDb3B5
cmlnaHQgKEMpIDE5OTQsIDE5OTUsIDE5OTgsIDIwMDAsIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDQs
IDIwMDUsCi1kaWZmIC0tZ2l0IGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL2ErLmluIGIvc3JjL3Zm
cy9leHRmcy9oZWxwZXJzL2ErLmluCi1pbmRleCA1Nzk0NDFjLi5mZTQ0NmY0IDEwMDY0NAotLS0t
IGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL2ErLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBl
cnMvYSsuaW4KLUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotICMK
LSAjIEV4dGVybmFsIGZpbGVzeXN0ZW0gZm9yIG1jLCB1c2luZyBtdG9vbHMKLSAjIFdyaXR0ZW4g
THVkZWsgQnJ1a25lciA8bHVickBiYXJjby5jej4sIDE5OTcKLUBAIC05LDYgKzksOCBAQAotIAot
ICMgVGhlc2UgbXRvb2xzIGNvbXBvbmVudHMgbXVzdCBiZSBpbiBQQVRIIGZvciB0aGlzIHRvIHdv
cmsKLSAKLSt1c2Ugd2FybmluZ3M7Ci0rCi0gc3ViIHF1b3RlIHsKLSAgICAgJF8gPSBzaGlmdChA
Xyk7Ci0gICAgIHMvKFteXHdcLy4rLV0pL1xcJDEvZzsKLWRpZmYgLS1naXQgYS9zcmMvdmZzL2V4
dGZzL2hlbHBlcnMvbWFpbGZzLmluIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL21haWxmcy5pbgot
aW5kZXggNGJkZDY4Yi4uNWJiMzczYiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMvaGVscGVy
cy9tYWlsZnMuaW4KLSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9tYWlsZnMuaW4KLUBAIC0x
LDYgKzEsNyBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotIAotIHVzZSBieXRlczsKLSt1
c2Ugd2FybmluZ3M7Ci0gCi0gIyBNQyBleHRmcyBmb3IgKHBvc3NpYmx5IGNvbXByZXNzZWQpIEJl
cmtlbGV5IHN0eWxlIG1haWxib3ggZmlsZXMKLSAjIFBldGVyIERhdW0gPGdhdG9yQGNzLnR1LWJl
cmxpbi5kZT4gKEphbiAxOTk4LCBtYy00LjEuMjQpCi1kaWZmIC0tZ2l0IGEvc3JjL3Zmcy9leHRm
cy9oZWxwZXJzL3BhdGNoZnMuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvcGF0Y2hmcy5pbgot
aW5kZXggYzIwY2Q1NC4uMWYxZTc1YiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMvaGVscGVy
cy9wYXRjaGZzLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvcGF0Y2hmcy5pbgotQEAg
LTEsNCArMSw0IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwotICMgV3JpdHRlbiBi
eSBBZGFtIEJ5cnRlayA8YWxwaGFAZGViaWFuLm9yZz4sIDIwMDIKLSAjIFJld3JpdHRlbiBieSBE
YXZpZCBTdGVyYmEgPGRhdmVAamlrb3MuY3o+LCAyMDA5Ci1AQCAtOSw2ICs5LDcgQEAKLSAKLSB1
c2UgYnl0ZXM7Ci0gdXNlIHN0cmljdDsKLSt1c2Ugd2FybmluZ3M7Ci0gdXNlIFBPU0lYOwotIHVz
ZSBGaWxlOjpUZW1wICd0ZW1wZmlsZSc7Ci0gCi1kaWZmIC0tZ2l0IGEvc3JjL3Zmcy9leHRmcy9o
ZWxwZXJzL3VsaWIuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdWxpYi5pbgotaW5kZXggNDE4
NjExZi4uODJjN2NjZiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91bGliLmlu
Ci0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdWxpYi5pbgotQEAgLTEsOSArMSwxMSBAQAot
LSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotICMKLSAjIFZGUyB0byBtYW5hZ2UgdGhlIGdwdXRp
bHMgYXJjaGl2ZXMuCi0gIyBXcml0dGVuIGJ5IE1vbG7DoXIgS8Ohcm9seSAocHJvdG9uN0BmcmVl
bWFpbC5odSkgMjAxMgotICMKLSAKLSt1c2Ugd2FybmluZ3M7Ci0rCi0gbXkgJW1vbnRoID0gKCdq
YW4nID0+ICcwMScsICdmZWInID0+ICcwMicsICdtYXInID0+ICcwMycsCi0gICAgICAgICAgICAg
ICdhcHInID0+ICcwNCcsICdtYXknID0+ICcwNScsICdqdW4nID0+ICcwNicsCi0gICAgICAgICAg
ICAgICdqdWwnID0+ICcwNycsICdhdWcnID0+ICcwOCcsICdzZXAnID0+ICcwOScsCi1kaWZmIC0t
Z2l0IGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3V6aXAuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBl
cnMvdXppcC5pbgotaW5kZXggYzQ2OGYzYS4uY2VmZmI1MyAxMDA2NDQKLS0tLSBhL3NyYy92ZnMv
ZXh0ZnMvaGVscGVycy91emlwLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdXppcC5p
bgotQEAgLTEsNCArMSw0IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwotICMgemlw
IGZpbGUgYXJjaGl2ZSBWaXJ0dWFsIEZpbGUgU3lzdGVtIGZvciBNaWRuaWdodCBDb21tYW5kZXIK
LSAjIFZlcnNpb24gMS40LjAgKDIwMDEtMDgtMDcpLgotQEAgLTksNiArOSw3IEBACi0gdXNlIFBP
U0lYOwotIHVzZSBGaWxlOjpCYXNlbmFtZTsKLSB1c2Ugc3RyaWN0OwotK3VzZSB3YXJuaW5nczsK
LSAKLSAjCi0gIyBDb25maWd1cmF0aW9uIG9wdGlvbnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9tYy9tY180LjguMjkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNf
NC44LjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9tYy9tY180LjguMjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9t
Yy9tY180LjguMzAuYmIKaW5kZXggZTdmNGFhY2MyZS4uMjU4YWMzOGUxNSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL21jXzQuOC4yOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbWMvbWNfNC44LjMwLmJiCkBAIC05LDEwICs5LDkgQEAgUkRFUEVORFM6JHtQTn0g
PSAibmN1cnNlcy10ZXJtaW5mby1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAibmN1cnNlcy10
ZXJtaW5mbyIKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcv
ZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
bWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Utd2FybmluZ3MucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vbm9tYW5kYXRlLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImJhNmIyZDg3NTI4MDZhYzIzZmUwNDVjMWIwODFlYjY2ZGNlZmE2MTU5MjA1Yzc5Zjg2YzAw
NWRjYWY5OTQxYzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzgxNzFmMjJmODg5ZTMwMzBlYzkw
NTU0NjNkM2VjZDc4NDM5ODRhYjI0ZTY0OTdkODI5NGQxYzQ0MWE3ZGRiNCIKIAogaW5oZXJpdCBh
dXRvdG9vbHMgZ2V0dGV4dCBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============0123388396901459503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc: SRC_URI changed from "http://www.midnight-commander.org/downloads/mc-4.8.29.tar.bz2 file://0001-mc-replace-perl-w-with-use-warnings.patch file://nomandate.patch" to "http://www.midnight-commander.org/downloads/mc-4.8.30.tar.bz2 file://nomandate.patch"
packages/core2-32-poky-linux/mc/mc-dbg: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-dbg: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-dbg: PKGSIZE changed from 3290556 to 3390296 (+3%)
packages/core2-32-poky-linux/mc/mc-dev: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-dev: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-doc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-doc: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-doc: PKGSIZE changed from 1083774 to 1083788 (+0%)
packages/core2-32-poky-linux/mc/mc-fish: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-fish: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-fish: PKGSIZE changed from 17133 to 17132 (-0%)
packages/core2-32-poky-linux/mc/mc-helpers-perl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-helpers-perl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-helpers-perl: PKGSIZE changed from 77846 to 77901 (+0%)
packages/core2-32-poky-linux/mc/mc-helpers: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-helpers: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-helpers: PKGSIZE changed from 103609 to 103695 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-af: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-af: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ar: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ar: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-az: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-az: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-az: PKGSIZE changed from 20193 to 20124 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-be: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-be: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-be: PKGSIZE changed from 111870 to 113736 (+2%)
packages/core2-32-poky-linux/mc/mc-locale-bg: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-bg: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-bg: PKGSIZE changed from 110392 to 109171 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-br: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-br: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-br: PKGSIZE changed from 2650 to 2657 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-ca: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ca: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ca: PKGSIZE changed from 93442 to 94405 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-cs: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-cs: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-cs: PKGSIZE changed from 93844 to 93878 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-da: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-da: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-da: PKGSIZE changed from 83066 to 87310 (+5%)
packages/core2-32-poky-linux/mc/mc-locale-de-ch: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-de-ch: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-de: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-de: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-de: PKGSIZE changed from 88497 to 91265 (+3%)
packages/core2-32-poky-linux/mc/mc-locale-el: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-el: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-el: PKGSIZE changed from 56936 to 56398 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PKGSIZE changed from 5535 to 26760 (+383%)
packages/core2-32-poky-linux/mc/mc-locale-eo: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-eo: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-eo: PKGSIZE changed from 89452 to 88898 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-es: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-es: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-es: PKGSIZE changed from 90531 to 90242 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-et: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-et: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-et: PKGSIZE changed from 82580 to 87323 (+6%)
packages/core2-32-poky-linux/mc/mc-locale-eu: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-eu: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-eu: PKGSIZE changed from 81621 to 81013 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-fa: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fa: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fa: PKGSIZE changed from 18288 to 18184 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-fi: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fi: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fi: PKGSIZE changed from 42981 to 42747 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-fr-ca: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fr-ca: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fr: PKGSIZE changed from 95206 to 95447 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-ga: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ga: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-gl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-gl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-gl: PKGSIZE changed from 83980 to 83304 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-he: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-he: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-hr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-hr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-hu: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-hu: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-hu: PKGSIZE changed from 78451 to 77835 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ia: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ia: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ia: PKGSIZE changed from 28673 to 28589 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-id: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-id: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-id: PKGSIZE changed from 16671 to 16557 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ie: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ie: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-it: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-it: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-it: PKGSIZE changed from 87278 to 88177 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-ja: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ja: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ja: PKGSIZE changed from 39333 to 39067 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ka: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ka: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ka: PKGSIZE changed from 60571 to 69185 (+14%)
packages/core2-32-poky-linux/mc/mc-locale-kk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-kk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ko: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ko: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ko: PKGSIZE changed from 92185 to 93470 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-kw: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-kw: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-lt: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-lt: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-lt: PKGSIZE changed from 48364 to 48043 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-lv: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-lv: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-lv: PKGSIZE changed from 19483 to 19415 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-mn: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-mn: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-mn: PKGSIZE changed from 31250 to 31118 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-nb: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nb: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nb: PKGSIZE changed from 87829 to 87563 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-nl-be: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nl-be: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nl: PKGSIZE changed from 84385 to 87731 (+4%)
packages/core2-32-poky-linux/mc/mc-locale-pl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pl: PKGSIZE changed from 93176 to 92888 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PKGSIZE changed from 97809 to 97486 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-pt: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pt: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pt: PKGSIZE changed from 92278 to 91990 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-ro: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ro: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ro: PKGSIZE changed from 92152 to 91588 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ru: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ru: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ru: PKGSIZE changed from 114197 to 115135 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-sk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sk: PKGSIZE changed from 82883 to 82273 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-sl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sl: PKGSIZE changed from 22933 to 22865 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-sr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sr: PKGSIZE changed from 97360 to 96511 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-sv: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sv: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sv: PKGSIZE changed from 81541 to 80973 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-szl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-szl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ta: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ta: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-te: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-te: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-tr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-tr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-tr: PKGSIZE changed from 80133 to 83076 (+4%)
packages/core2-32-poky-linux/mc/mc-locale-uk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-uk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-uk: PKGSIZE changed from 115808 to 113888 (-2%)
packages/core2-32-poky-linux/mc/mc-locale-uz: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-uz: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-vi: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-vi: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-vi: PKGSIZE changed from 24691 to 24556 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-wa: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-wa: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-wa: PKGSIZE changed from 13412 to 13343 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PKGSIZE changed from 76979 to 76418 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PKGSIZE changed from 44804 to 49011 (+9%)
packages/core2-32-poky-linux/mc/mc-src: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-src: FILELIST: directory renamed /usr/src/debug/mc/4.8.29-r0/src/filemanager -> /usr/src/debug/mc/4.8.30-r0/src/filemanager, directory renamed /usr/src/debug/mc/4.8.29-r0/src/subshell -> /usr/src/debug/mc/4.8.30-r0/src/subshell, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/search -> /usr/src/debug/mc/4.8.30-r0/lib/search, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/skin -> /usr/src/debug/mc/4.8.30-r0/lib/skin, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/local -> /usr/src/debug/mc/4.8.30-r0/src/vfs/local, directory renamed /usr/src/debug/mc/4.8.29-r0/src/viewer -> /usr/src/debug/mc/4.8.30-r0/src/viewer, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/sfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/sfs, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/vfs -> /usr/src/debug/mc/4.8.30-r0/lib/vfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/diffviewer -> /usr/src/debug/mc/4.8.30-r0/src/diffviewer, directory renamed /usr/src/d
 ebug/mc/4.8.29-r0/src/vfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/strutil -> /usr/src/debug/mc/4.8.30-r0/lib/strutil, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/ftpfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/ftpfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/extfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/extfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/fish -> /usr/src/debug/mc/4.8.30-r0/src/vfs/fish, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/filehighlight -> /usr/src/debug/mc/4.8.30-r0/lib/filehighlight, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/event -> /usr/src/debug/mc/4.8.30-r0/lib/event, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/tty -> /usr/src/debug/mc/4.8.30-r0/lib/tty, directory renamed /usr/src/debug/mc/4.8.29-r0/src -> /usr/src/debug/mc/4.8.30-r0/src, directory renamed /usr/src/debug/mc/4.8.29-r0/src/editor -> /usr/src/debug/mc/4.8.30-r0/src/editor, directory renamed /us
 r/src/debug/mc/4.8.29-r0/src/consaver -> /usr/src/debug/mc/4.8.30-r0/src/consaver, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/widget -> /usr/src/debug/mc/4.8.30-r0/lib/widget, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/cpio -> /usr/src/debug/mc/4.8.30-r0/src/vfs/cpio, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/mcconfig -> /usr/src/debug/mc/4.8.30-r0/lib/mcconfig, removed "/usr/src/debug/mc/4.8.29-r0/lib/global.h /usr/src/debug/mc/4.8.29-r0/lib/utilunix.c /usr/src/debug/mc/4.8.29-r0/lib/global.c /usr/src/debug/mc/4.8.29-r0/lib/search.h /usr/src/debug/mc/4.8.29-r0/lib/serialize.c /usr/src/debug/mc/4.8.29-r0/lib/lock.h /usr/src/debug/mc/4.8.29-r0/lib/shell.h /usr/src/debug/mc/4.8.29-r0/lib/event-types.h /usr/src/debug/mc/4.8.29-r0/lib/lock.c /usr/src/debug/mc/4.8.29-r0/lib/serialize.h /usr/src/debug/mc/4.8.29-r0/lib/strescape.h /usr/src/debug/mc/4.8.29-r0/lib/shell.c /usr/src/debug/mc/4.8.29-r0/lib/keybind.h /usr/src/debug/mc/4.8.29-r0/lib/keybind.c /usr/src/de
 bug/mc/4.8.29-r0/lib/skin.h /usr/src/debug/mc/4.8.29-r0/lib/charsets.h /usr/src/debug/mc/4.8.29-r0/lib/glibcompat.h /usr/src/debug/mc/4.8.29-r0/lib/timefmt.c /usr/src/debug/mc/4.8.29-r0/lib/glibcompat.c /usr/src/debug/mc/4.8.29-r0/lib/charsets.c /usr/src/debug/mc/4.8.29-r0/lib/timefmt.h /usr/src/debug/mc/4.8.29-r0/lib/mcconfig.h /usr/src/debug/mc/4.8.29-r0/lib/widget.h /usr/src/debug/mc/4.8.29-r0/lib/hook.h /usr/src/debug/mc/4.8.29-r0/lib/util.c /usr/src/debug/mc/4.8.29-r0/lib/filehighlight.h /usr/src/debug/mc/4.8.29-r0/lib/hook.c /usr/src/debug/mc/4.8.29-r0/lib/util.h /usr/src/debug/mc/4.8.29-r0/src/vfs/tar/tar.c /usr/src/debug/mc/4.8.29-r0/lib/event.h /usr/src/debug/mc/4.8.29-r0/lib/strutil.h /usr/src/debug/mc/4.8.29-r0/src/vfs/tar/tar.h", added "/usr/src/debug/mc/4.8.30-r0/lib/global.h /usr/src/debug/mc/4.8.30-r0/lib/utilunix.c /usr/src/debug/mc/4.8.30-r0/lib/global.c /usr/src/debug/mc/4.8.30-r0/lib/search.h /usr/src/debug/mc/4.8.30-r0/lib/serialize.c /usr/src/debug/mc/4.8.30-r0/
 lib/file-entry.h /usr/src/debug/mc/4.8.30-r0/lib/lock.h /usr/src/debug/mc/4.8.30-r0/lib/shell.h /usr/src/debug/mc/4.8.30-r0/lib/event-types.h /usr/src/debug/mc/4.8.30-r0/lib/lock.c /usr/src/debug/mc/4.8.30-r0/lib/serialize.h /usr/src/debug/mc/4.8.30-r0/lib/strescape.h /usr/src/debug/mc/4.8.30-r0/lib/shell.c /usr/src/debug/mc/4.8.30-r0/lib/keybind.h /usr/src/debug/mc/4.8.30-r0/lib/keybind.c /usr/src/debug/mc/4.8.30-r0/lib/skin.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-sparse.c /usr/src/debug/mc/4.8.30-r0/lib/charsets.h /usr/src/debug/mc/4.8.30-r0/lib/glibcompat.h /usr/src/debug/mc/4.8.30-r0/lib/timefmt.c /usr/src/debug/mc/4.8.30-r0/lib/glibcompat.c /usr/src/debug/mc/4.8.30-r0/lib/charsets.c /usr/src/debug/mc/4.8.30-r0/lib/timefmt.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-internal.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-internal.c /usr/src/debug/mc/4.8.30-r0/lib/mcconfig.h /usr/src/debug/mc/4.8.30-r0/lib/widget.h /usr/src/debug/mc/4.8.30-r0/lib/hook.h /usr/src/debug/mc/4
 .8.30-r0/lib/util.c /usr/src/debug/mc/4.8.30-r0/lib/filehighlight.h /usr/src/debug/mc/4.8.30-r0/lib/hook.c /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-xheader.c /usr/src/debug/mc/4.8.30-r0/lib/util.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar.c /usr/src/debug/mc/4.8.30-r0/lib/event.h /usr/src/debug/mc/4.8.30-r0/lib/strutil.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar.h"
packages/core2-32-poky-linux/mc/mc-src: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-src: PKGSIZE changed from 3838973 to 3954728 (+3%)
packages/core2-32-poky-linux/mc/mc-staticdev: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-staticdev: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc: FILELIST: added "/usr/share/mc/hints/mc.hint.ka /usr/share/mc/syntax/b.syntax"
packages/core2-32-poky-linux/mc/mc: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc: PKGSIZE changed from 3805063 to 3850668 (+1%)
Changes to packages/core2-32-poky-linux/mc (sysroot):
  /usr/share/mc/hints/mc.hint.ka was added
  /usr/share/mc/syntax/b.syntax was added

--===============0123388396901459503==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.29-4.8.30.patch"

RnJvbSAwYmE5ODMzYzlhMzllZjE3NmY3NWYyYjdkYTI0OTI1MDQ0YjcxNDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDg6MzM6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YzogdXBncmFkZSA0LjguMjkgLT4gNC44LjMwCgotLS0KIC4uLi1tYy1yZXBsYWNlLXBlcmwtdy13
aXRoLXVzZS13YXJuaW5ncy5wYXRjaCB8IDEyNyAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9tYy97
bWNfNC44LjI5LmJiID0+IG1jXzQuOC4zMC5iYn0gICAgICAgICB8ICAgMyArLQogMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTI5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9maWxlcy8wMDAxLW1jLXJlcGxhY2UtcGVybC13
LXdpdGgtdXNlLXdhcm5pbmdzLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21j
L3ttY180LjguMjkuYmIgPT4gbWNfNC44LjMwLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYy9maWxlcy8wMDAxLW1jLXJlcGxhY2UtcGVybC13LXdpdGgtdXNl
LXdhcm5pbmdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMt
cmVwbGFjZS1wZXJsLXctd2l0aC11c2Utd2FybmluZ3MucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDVlZGU4MmQzNDIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Utd2FybmluZ3Mu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMjcgKzAsMCBAQAotRnJvbSA2MmM4NmI2OTEwNmQw
ZDcwMjE2N2JhMWI5NjNlYTFjMjAxY2NlNWFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci1EYXRlOiBUaHUsIDYg
QXByIDIwMTcgMDI6MjQ6MjggLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gbWM6IHJlcGxhY2UgInBl
cmwgLXciIHdpdGggInVzZSB3YXJuaW5ncyIKLQotVGhlIHNoZWJhbmcncyBtYXggbGVuZ3RoIGlz
IHVzdWFsbHkgMTI4IGFzIGRlZmluZWQgaW4KLS91c3IvaW5jbHVkZS9saW51eC9iaW5mbXRzLmg6
Ci0gICNkZWZpbmUgQklOUFJNX0JVRl9TSVpFIDEyOAotCi1UaGVyZSB3b3VsZCBiZSBlcnJvcnMg
d2hlbiBAUEVSTEAgaXMgbG9uZ2VyIHRoYW4gMTI4LCB1c2UKLScvdXNyL2Jpbi9lbnYgcGVybCcg
Y2FuIGZpeCB0aGUgcHJvYmxlbSwgYnV0ICcvdXNyL2Jpbi9lbnYgcGVybCAtdycKLWRvZXNuJ3Qg
d29yazoKLQotL3Vzci9iaW4vZW52OiBwZXJsIC13OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Ci0KLVNvIHJlcGxhY2UgInBlcmwgLXciIHdpdGggInVzZSB3YXJuaW5ncyIgdG8gbWFrZSBpdCB3
b3JrLgotCi1UaGUgbWFuMmhscC5pbiBhbHJlYWR5IGhhcyAidXNlIHdhcm5pbmdzOyIsIHNvIGp1
c3QgcmVtb3ZlICctdycgaXMgT0suCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRw
czovL2dpdGh1Yi5jb20vTWlkbmlnaHRDb21tYW5kZXIvbWMvcHVsbC8xNzRdCi0KLVNpZ25lZC1v
ZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgotCi0tLS0KLSBz
cmMvbWFuMmhscC9tYW4yaGxwLmluICAgICAgICAgICB8IDIgKy0KLSBzcmMvdmZzL2V4dGZzL2hl
bHBlcnMvYSsuaW4gICAgICB8IDQgKysrLQotIHNyYy92ZnMvZXh0ZnMvaGVscGVycy9tYWlsZnMu
aW4gIHwgMyArKy0KLSBzcmMvdmZzL2V4dGZzL2hlbHBlcnMvcGF0Y2hmcy5pbiB8IDMgKystCi0g
c3JjL3Zmcy9leHRmcy9oZWxwZXJzL3VsaWIuaW4gICAgfCA0ICsrKy0KLSBzcmMvdmZzL2V4dGZz
L2hlbHBlcnMvdXppcC5pbiAgICB8IDMgKystCi0gNiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL21hbjJobHAvbWFuMmhs
cC5pbiBiL3NyYy9tYW4yaGxwL21hbjJobHAuaW4KLWluZGV4IDA4NzY1ZDguLjhhYTcxMzEgMTAw
NjQ0Ci0tLS0gYS9zcmMvbWFuMmhscC9tYW4yaGxwLmluCi0rKysgYi9zcmMvbWFuMmhscC9tYW4y
aGxwLmluCi1AQCAtMSw0ICsxLDQgQEAKLS0jISBAUEVSTF9GT1JfQlVJTERAIC13Ci0rIyEgQFBF
UkxfRk9SX0JVSUxEQAotICMKLSAjICBNYW4gcGFnZSB0byBoZWxwIGZpbGUgY29udmVydGVyCi0g
IyAgQ29weXJpZ2h0IChDKSAxOTk0LCAxOTk1LCAxOTk4LCAyMDAwLCAyMDAxLCAyMDAyLCAyMDAz
LCAyMDA0LCAyMDA1LAotZGlmZiAtLWdpdCBhL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9hKy5pbiBi
L3NyYy92ZnMvZXh0ZnMvaGVscGVycy9hKy5pbgotaW5kZXggNTc5NDQxYy4uZmU0NDZmNCAxMDA2
NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9hKy5pbgotKysrIGIvc3JjL3Zmcy9leHRm
cy9oZWxwZXJzL2ErLmluCi1AQCAtMSw0ICsxLDQgQEAKLS0jISBAUEVSTEAgLXcKLSsjISBAUEVS
TEAKLSAjCi0gIyBFeHRlcm5hbCBmaWxlc3lzdGVtIGZvciBtYywgdXNpbmcgbXRvb2xzCi0gIyBX
cml0dGVuIEx1ZGVrIEJydWtuZXIgPGx1YnJAYmFyY28uY3o+LCAxOTk3Ci1AQCAtOSw2ICs5LDgg
QEAKLSAKLSAjIFRoZXNlIG10b29scyBjb21wb25lbnRzIG11c3QgYmUgaW4gUEFUSCBmb3IgdGhp
cyB0byB3b3JrCi0gCi0rdXNlIHdhcm5pbmdzOwotKwotIHN1YiBxdW90ZSB7Ci0gICAgICRfID0g
c2hpZnQoQF8pOwotICAgICBzLyhbXlx3XC8uKy1dKS9cXCQxL2c7Ci1kaWZmIC0tZ2l0IGEvc3Jj
L3Zmcy9leHRmcy9oZWxwZXJzL21haWxmcy5pbiBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9tYWls
ZnMuaW4KLWluZGV4IDRiZGQ2OGIuLjViYjM3M2IgMTAwNjQ0Ci0tLS0gYS9zcmMvdmZzL2V4dGZz
L2hlbHBlcnMvbWFpbGZzLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvbWFpbGZzLmlu
Ci1AQCAtMSw2ICsxLDcgQEAKLS0jISBAUEVSTEAgLXcKLSsjISBAUEVSTEAKLSAKLSB1c2UgYnl0
ZXM7Ci0rdXNlIHdhcm5pbmdzOwotIAotICMgTUMgZXh0ZnMgZm9yIChwb3NzaWJseSBjb21wcmVz
c2VkKSBCZXJrZWxleSBzdHlsZSBtYWlsYm94IGZpbGVzCi0gIyBQZXRlciBEYXVtIDxnYXRvckBj
cy50dS1iZXJsaW4uZGU+IChKYW4gMTk5OCwgbWMtNC4xLjI0KQotZGlmZiAtLWdpdCBhL3NyYy92
ZnMvZXh0ZnMvaGVscGVycy9wYXRjaGZzLmluIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3BhdGNo
ZnMuaW4KLWluZGV4IGMyMGNkNTQuLjFmMWU3NWIgMTAwNjQ0Ci0tLS0gYS9zcmMvdmZzL2V4dGZz
L2hlbHBlcnMvcGF0Y2hmcy5pbgotKysrIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3BhdGNoZnMu
aW4KLUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotICMKLSAjIFdy
aXR0ZW4gYnkgQWRhbSBCeXJ0ZWsgPGFscGhhQGRlYmlhbi5vcmc+LCAyMDAyCi0gIyBSZXdyaXR0
ZW4gYnkgRGF2aWQgU3RlcmJhIDxkYXZlQGppa29zLmN6PiwgMjAwOQotQEAgLTksNiArOSw3IEBA
Ci0gCi0gdXNlIGJ5dGVzOwotIHVzZSBzdHJpY3Q7Ci0rdXNlIHdhcm5pbmdzOwotIHVzZSBQT1NJ
WDsKLSB1c2UgRmlsZTo6VGVtcCAndGVtcGZpbGUnOwotIAotZGlmZiAtLWdpdCBhL3NyYy92ZnMv
ZXh0ZnMvaGVscGVycy91bGliLmluIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3VsaWIuaW4KLWlu
ZGV4IDQxODYxMWYuLjgyYzdjY2YgMTAwNjQ0Ci0tLS0gYS9zcmMvdmZzL2V4dGZzL2hlbHBlcnMv
dWxpYi5pbgotKysrIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3VsaWIuaW4KLUBAIC0xLDkgKzEs
MTEgQEAKLS0jISBAUEVSTEAgLXcKLSsjISBAUEVSTEAKLSAjCi0gIyBWRlMgdG8gbWFuYWdlIHRo
ZSBncHV0aWxzIGFyY2hpdmVzLgotICMgV3JpdHRlbiBieSBNb2xuw6FyIEvDoXJvbHkgKHByb3Rv
bjdAZnJlZW1haWwuaHUpIDIwMTIKLSAjCi0gCi0rdXNlIHdhcm5pbmdzOwotKwotIG15ICVtb250
aCA9ICgnamFuJyA9PiAnMDEnLCAnZmViJyA9PiAnMDInLCAnbWFyJyA9PiAnMDMnLAotICAgICAg
ICAgICAgICAnYXByJyA9PiAnMDQnLCAnbWF5JyA9PiAnMDUnLCAnanVuJyA9PiAnMDYnLAotICAg
ICAgICAgICAgICAnanVsJyA9PiAnMDcnLCAnYXVnJyA9PiAnMDgnLCAnc2VwJyA9PiAnMDknLAot
ZGlmZiAtLWdpdCBhL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91emlwLmluIGIvc3JjL3Zmcy9leHRm
cy9oZWxwZXJzL3V6aXAuaW4KLWluZGV4IGM0NjhmM2EuLmNlZmZiNTMgMTAwNjQ0Ci0tLS0gYS9z
cmMvdmZzL2V4dGZzL2hlbHBlcnMvdXppcC5pbgotKysrIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJz
L3V6aXAuaW4KLUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotICMK
LSAjIHppcCBmaWxlIGFyY2hpdmUgVmlydHVhbCBGaWxlIFN5c3RlbSBmb3IgTWlkbmlnaHQgQ29t
bWFuZGVyCi0gIyBWZXJzaW9uIDEuNC4wICgyMDAxLTA4LTA3KS4KLUBAIC05LDYgKzksNyBAQAot
IHVzZSBQT1NJWDsKLSB1c2UgRmlsZTo6QmFzZW5hbWU7Ci0gdXNlIHN0cmljdDsKLSt1c2Ugd2Fy
bmluZ3M7Ci0gCi0gIwotICMgQ29uZmlndXJhdGlvbiBvcHRpb25zCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjI5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L21jL21jXzQuOC4zMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjI5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbWMvbWNfNC44LjMwLmJiCmluZGV4IGU3ZjRhYWNjMmUuLjI1OGFjMzhlMTUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9tY180LjguMjkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21jL21jXzQuOC4zMC5iYgpAQCAtOSwxMCArOSw5IEBAIFJERVBFTkRT
OiR7UE59ID0gIm5jdXJzZXMtdGVybWluZm8tYmFzZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gIm5j
dXJzZXMtdGVybWluZm8iCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5taWRuaWdodC1jb21tYW5k
ZXIub3JnL2Rvd25sb2Fkcy8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6
Ly8wMDAxLW1jLXJlcGxhY2UtcGVybC13LXdpdGgtdXNlLXdhcm5pbmdzLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovL25vbWFuZGF0ZS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiYTZiMmQ4NzUyODA2YWMyM2ZlMDQ1YzFiMDgxZWI2NmRjZWZhNjE1OTIwNWM3
OWY4NmMwMDVkY2FmOTk0MWMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM4MTcxZjIyZjg4OWUz
MDMwZWM5MDU1NDYzZDNlY2Q3ODQzOTg0YWIyNGU2NDk3ZDgyOTRkMWM0NDFhN2RkYjQiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcGtnY29uZmlnCiAKLS0gCjIuMzkuMgoK

--===============0123388396901459503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mc/mc-locale-en-gb: PKGSIZE changed from 5535 to 26760 (+383%)
packages/core2-32-poky-linux/mc/mc-locale-ka: PKGSIZE changed from 60571 to 69185 (+14%)
packages/core2-32-poky-linux/mc/mc: FILELIST: added "/usr/share/mc/syntax/b.syntax /usr/share/mc/hints/mc.hint.ka"
Changes to packages/core2-32-poky-linux/mc (sysroot):
  /usr/share/mc/hints/mc.hint.ka was added
  /usr/share/mc/syntax/b.syntax was added

--===============0123388396901459503==--

