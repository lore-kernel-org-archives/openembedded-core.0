Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D95CCF972
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5718.1693650551528939319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MO3CiT/4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cJxaiSyP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a55708d54-25394a83-5663-44f3-91b7-29089721d3a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zmAnTNBMdLD7beBxUmiTEDUi6JR4U7Z7LKODgZkvxzI=;
	b=MO3CiT/4ZjhiL7gcHup14Qgs3L40p9KzjH27M8u3mdK0QEQneknTxW35Kklwz80K
	jpDYh4yi4QPTQ2DNtk0RvLOlcUcuqJjJPOI33mN6jQFMvXIfLtZ5uKpVtawIulxZUBU
	bHAsxdhynQPecRnKd+4IhHFVvmKr3VnamGuEXq4Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zmAnTNBMdLD7beBxUmiTEDUi6JR4U7Z7LKODgZkvxzI=;
	b=cJxaiSyPZ6JDlVP0yOOyojoEwn77EB3htCRiaz5m9Z+H73UL90JIY6Wew3yLEZhm
	N3jNnzD1tLBWvdFaBu4u2MG9596uxzEEWk3GE5BLIrIcAjoGiyPLYjRMduBXYotxnCo
	jxkr5cjNkQ4ZoBDH/+ASKpu6sf+YVPWGEjgODo24=
Content-Type: multipart/mixed; boundary="===============1964591221182124992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.30 SUCCEEDED
Message-ID: <0101018a55708d54-25394a83-5663-44f3-91b7-29089721d3a8-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187098

--===============1964591221182124992==
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
JTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDFl
MTBkZDcxNmYxZjFkMWZmMjdmOTg4Mjg5MGU1YzU5MTgzYWZhNzUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTog
RnJpLCAxIFNlcCAyMDIzIDIwOjI4OjQ1ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gbWM6IHVwZ3Jh
ZGUgNC44LjI5IC0+IDQuOC4zMAoKLS0tCiAuLi4tbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Ut
d2FybmluZ3MucGF0Y2ggfCAxMjcgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vbWMve21jXzQuOC4y
OS5iYiA9PiBtY180LjguMzAuYmJ9ICAgICAgICAgfCAgIDMgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEyOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWMvZmlsZXMvMDAwMS1tYy1yZXBsYWNlLXBlcmwtdy13aXRoLXVz
ZS13YXJuaW5ncy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy97bWNfNC44
LjI5LmJiID0+IG1jXzQuOC4zMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbWMvZmlsZXMvMDAwMS1tYy1yZXBsYWNlLXBlcmwtdy13aXRoLXVzZS13YXJuaW5n
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9maWxlcy8wMDAxLW1jLXJlcGxhY2Ut
cGVybC13LXdpdGgtdXNlLXdhcm5pbmdzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCA1ZWRlODJkMzQyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9t
Yy9maWxlcy8wMDAxLW1jLXJlcGxhY2UtcGVybC13LXdpdGgtdXNlLXdhcm5pbmdzLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMTI3ICswLDAgQEAKLUZyb20gNjJjODZiNjkxMDZkMGQ3MDIxNjdi
YTFiOTYzZWExYzIwMWNjZTVhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJvYmVy
dCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgotRGF0ZTogVGh1LCA2IEFwciAyMDE3
IDAyOjI0OjI4IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIG1jOiByZXBsYWNlICJwZXJsIC13IiB3
aXRoICJ1c2Ugd2FybmluZ3MiCi0KLVRoZSBzaGViYW5nJ3MgbWF4IGxlbmd0aCBpcyB1c3VhbGx5
IDEyOCBhcyBkZWZpbmVkIGluCi0vdXNyL2luY2x1ZGUvbGludXgvYmluZm10cy5oOgotICAjZGVm
aW5lIEJJTlBSTV9CVUZfU0laRSAxMjgKLQotVGhlcmUgd291bGQgYmUgZXJyb3JzIHdoZW4gQFBF
UkxAIGlzIGxvbmdlciB0aGFuIDEyOCwgdXNlCi0nL3Vzci9iaW4vZW52IHBlcmwnIGNhbiBmaXgg
dGhlIHByb2JsZW0sIGJ1dCAnL3Vzci9iaW4vZW52IHBlcmwgLXcnCi1kb2Vzbid0IHdvcms6Ci0K
LS91c3IvYmluL2VudjogcGVybCAtdzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQotCi1TbyBy
ZXBsYWNlICJwZXJsIC13IiB3aXRoICJ1c2Ugd2FybmluZ3MiIHRvIG1ha2UgaXQgd29yay4KLQot
VGhlIG1hbjJobHAuaW4gYWxyZWFkeSBoYXMgInVzZSB3YXJuaW5nczsiLCBzbyBqdXN0IHJlbW92
ZSAnLXcnIGlzIE9LLgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRo
dWIuY29tL01pZG5pZ2h0Q29tbWFuZGVyL21jL3B1bGwvMTc0XQotCi1TaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KLQotLS0tCi0gc3JjL21hbjJo
bHAvbWFuMmhscC5pbiAgICAgICAgICAgfCAyICstCi0gc3JjL3Zmcy9leHRmcy9oZWxwZXJzL2Er
LmluICAgICAgfCA0ICsrKy0KLSBzcmMvdmZzL2V4dGZzL2hlbHBlcnMvbWFpbGZzLmluICB8IDMg
KystCi0gc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3BhdGNoZnMuaW4gfCAzICsrLQotIHNyYy92ZnMv
ZXh0ZnMvaGVscGVycy91bGliLmluICAgIHwgNCArKystCi0gc3JjL3Zmcy9leHRmcy9oZWxwZXJz
L3V6aXAuaW4gICAgfCAzICsrLQotIDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9tYW4yaGxwL21hbjJobHAuaW4gYi9z
cmMvbWFuMmhscC9tYW4yaGxwLmluCi1pbmRleCAwODc2NWQ4Li44YWE3MTMxIDEwMDY0NAotLS0t
IGEvc3JjL21hbjJobHAvbWFuMmhscC5pbgotKysrIGIvc3JjL21hbjJobHAvbWFuMmhscC5pbgot
QEAgLTEsNCArMSw0IEBACi0tIyEgQFBFUkxfRk9SX0JVSUxEQCAtdwotKyMhIEBQRVJMX0ZPUl9C
VUlMREAKLSAjCi0gIyAgTWFuIHBhZ2UgdG8gaGVscCBmaWxlIGNvbnZlcnRlcgotICMgIENvcHly
aWdodCAoQykgMTk5NCwgMTk5NSwgMTk5OCwgMjAwMCwgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwg
MjAwNSwKLWRpZmYgLS1naXQgYS9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvYSsuaW4gYi9zcmMvdmZz
L2V4dGZzL2hlbHBlcnMvYSsuaW4KLWluZGV4IDU3OTQ0MWMuLmZlNDQ2ZjQgMTAwNjQ0Ci0tLS0g
YS9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvYSsuaW4KLSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVy
cy9hKy5pbgotQEAgLTEsNCArMSw0IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwot
ICMgRXh0ZXJuYWwgZmlsZXN5c3RlbSBmb3IgbWMsIHVzaW5nIG10b29scwotICMgV3JpdHRlbiBM
dWRlayBCcnVrbmVyIDxsdWJyQGJhcmNvLmN6PiwgMTk5NwotQEAgLTksNiArOSw4IEBACi0gCi0g
IyBUaGVzZSBtdG9vbHMgY29tcG9uZW50cyBtdXN0IGJlIGluIFBBVEggZm9yIHRoaXMgdG8gd29y
awotIAotK3VzZSB3YXJuaW5nczsKLSsKLSBzdWIgcXVvdGUgewotICAgICAkXyA9IHNoaWZ0KEBf
KTsKLSAgICAgcy8oW15cd1wvListXSkvXFwkMS9nOwotZGlmZiAtLWdpdCBhL3NyYy92ZnMvZXh0
ZnMvaGVscGVycy9tYWlsZnMuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvbWFpbGZzLmluCi1p
bmRleCA0YmRkNjhiLi41YmIzNzNiIDEwMDY0NAotLS0tIGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJz
L21haWxmcy5pbgotKysrIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL21haWxmcy5pbgotQEAgLTEs
NiArMSw3IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gCi0gdXNlIGJ5dGVzOwotK3Vz
ZSB3YXJuaW5nczsKLSAKLSAjIE1DIGV4dGZzIGZvciAocG9zc2libHkgY29tcHJlc3NlZCkgQmVy
a2VsZXkgc3R5bGUgbWFpbGJveCBmaWxlcwotICMgUGV0ZXIgRGF1bSA8Z2F0b3JAY3MudHUtYmVy
bGluLmRlPiAoSmFuIDE5OTgsIG1jLTQuMS4yNCkKLWRpZmYgLS1naXQgYS9zcmMvdmZzL2V4dGZz
L2hlbHBlcnMvcGF0Y2hmcy5pbiBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9wYXRjaGZzLmluCi1p
bmRleCBjMjBjZDU0Li4xZjFlNzViIDEwMDY0NAotLS0tIGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJz
L3BhdGNoZnMuaW4KLSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9wYXRjaGZzLmluCi1AQCAt
MSw0ICsxLDQgQEAKLS0jISBAUEVSTEAgLXcKLSsjISBAUEVSTEAKLSAjCi0gIyBXcml0dGVuIGJ5
IEFkYW0gQnlydGVrIDxhbHBoYUBkZWJpYW4ub3JnPiwgMjAwMgotICMgUmV3cml0dGVuIGJ5IERh
dmlkIFN0ZXJiYSA8ZGF2ZUBqaWtvcy5jej4sIDIwMDkKLUBAIC05LDYgKzksNyBAQAotIAotIHVz
ZSBieXRlczsKLSB1c2Ugc3RyaWN0OwotK3VzZSB3YXJuaW5nczsKLSB1c2UgUE9TSVg7Ci0gdXNl
IEZpbGU6OlRlbXAgJ3RlbXBmaWxlJzsKLSAKLWRpZmYgLS1naXQgYS9zcmMvdmZzL2V4dGZzL2hl
bHBlcnMvdWxpYi5pbiBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91bGliLmluCi1pbmRleCA0MTg2
MTFmLi44MmM3Y2NmIDEwMDY0NAotLS0tIGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3VsaWIuaW4K
LSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91bGliLmluCi1AQCAtMSw5ICsxLDExIEBACi0t
IyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwotICMgVkZTIHRvIG1hbmFnZSB0aGUgZ3B1dGls
cyBhcmNoaXZlcy4KLSAjIFdyaXR0ZW4gYnkgTW9sbsOhciBLw6Fyb2x5IChwcm90b243QGZyZWVt
YWlsLmh1KSAyMDEyCi0gIwotIAotK3VzZSB3YXJuaW5nczsKLSsKLSBteSAlbW9udGggPSAoJ2ph
bicgPT4gJzAxJywgJ2ZlYicgPT4gJzAyJywgJ21hcicgPT4gJzAzJywKLSAgICAgICAgICAgICAg
J2FwcicgPT4gJzA0JywgJ21heScgPT4gJzA1JywgJ2p1bicgPT4gJzA2JywKLSAgICAgICAgICAg
ICAgJ2p1bCcgPT4gJzA3JywgJ2F1ZycgPT4gJzA4JywgJ3NlcCcgPT4gJzA5JywKLWRpZmYgLS1n
aXQgYS9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdXppcC5pbiBiL3NyYy92ZnMvZXh0ZnMvaGVscGVy
cy91emlwLmluCi1pbmRleCBjNDY4ZjNhLi5jZWZmYjUzIDEwMDY0NAotLS0tIGEvc3JjL3Zmcy9l
eHRmcy9oZWxwZXJzL3V6aXAuaW4KLSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91emlwLmlu
Ci1AQCAtMSw0ICsxLDQgQEAKLS0jISBAUEVSTEAgLXcKLSsjISBAUEVSTEAKLSAjCi0gIyB6aXAg
ZmlsZSBhcmNoaXZlIFZpcnR1YWwgRmlsZSBTeXN0ZW0gZm9yIE1pZG5pZ2h0IENvbW1hbmRlcgot
ICMgVmVyc2lvbiAxLjQuMCAoMjAwMS0wOC0wNykuCi1AQCAtOSw2ICs5LDcgQEAKLSB1c2UgUE9T
SVg7Ci0gdXNlIEZpbGU6OkJhc2VuYW1lOwotIHVzZSBzdHJpY3Q7Ci0rdXNlIHdhcm5pbmdzOwot
IAotICMKLSAjIENvbmZpZ3VyYXRpb24gb3B0aW9ucwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21jL21jXzQuOC4yOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYy9tY180
LjguMzAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL21jL21jXzQuOC4yOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21j
L21jXzQuOC4zMC5iYgppbmRleCBlN2Y0YWFjYzJlLi4yNThhYzM4ZTE1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjI5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9tYy9tY180LjguMzAuYmIKQEAgLTksMTAgKzksOSBAQCBSREVQRU5EUzoke1BOfSA9
ICJuY3Vyc2VzLXRlcm1pbmZvLWJhc2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJuY3Vyc2VzLXRl
cm1pbmZvIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cubWlkbmlnaHQtY29tbWFuZGVyLm9yZy9k
b3dubG9hZHMvJHtCUE59LSR7UFZ9LnRhci5iejIgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1t
Yy1yZXBsYWNlLXBlcmwtdy13aXRoLXVzZS13YXJuaW5ncy5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly9ub21hbmRhdGUucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYmE2YjJkODc1MjgwNmFjMjNmZTA0NWMxYjA4MWViNjZkY2VmYTYxNTkyMDVjNzlmODZjMDA1
ZGNhZjk5NDFjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzODE3MWYyMmY4ODllMzAzMGVjOTA1
NTQ2M2QzZWNkNzg0Mzk4NGFiMjRlNjQ5N2Q4Mjk0ZDFjNDQxYTdkZGI0IgogCiBpbmhlcml0IGF1
dG90b29scyBnZXR0ZXh0IHBrZ2NvbmZpZwogCi0tIAoyLjM5LjIKCg==

--===============1964591221182124992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc: SRC_URI changed from "http://www.midnight-commander.org/downloads/mc-4.8.29.tar.bz2 file://0001-mc-replace-perl-w-with-use-warnings.patch file://nomandate.patch" to "http://www.midnight-commander.org/downloads/mc-4.8.30.tar.bz2 file://nomandate.patch"
packages/core2-32-poky-linux/mc: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-dbg: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-dbg: PKGSIZE changed from 3291100 to 3390832 (+3%)
packages/core2-32-poky-linux/mc/mc-dbg: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-dev: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-dev: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-doc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-doc: PKGSIZE changed from 1083774 to 1083788 (+0%)
packages/core2-32-poky-linux/mc/mc-doc: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-fish: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-fish: PKGSIZE changed from 17133 to 17132 (-0%)
packages/core2-32-poky-linux/mc/mc-fish: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-helpers-perl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-helpers-perl: PKGSIZE changed from 77846 to 77901 (+0%)
packages/core2-32-poky-linux/mc/mc-helpers-perl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-helpers: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-helpers: PKGSIZE changed from 103609 to 103695 (+0%)
packages/core2-32-poky-linux/mc/mc-helpers: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-af: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-af: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ar: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ar: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-az: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-az: PKGSIZE changed from 20193 to 20124 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-az: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-be: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-be: PKGSIZE changed from 111870 to 113736 (+2%)
packages/core2-32-poky-linux/mc/mc-locale-be: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-bg: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-bg: PKGSIZE changed from 110392 to 109171 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-bg: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-br: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-br: PKGSIZE changed from 2650 to 2657 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-br: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ca: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ca: PKGSIZE changed from 93442 to 94405 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-ca: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-cs: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-cs: PKGSIZE changed from 93844 to 93878 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-cs: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-da: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-da: PKGSIZE changed from 83066 to 87310 (+5%)
packages/core2-32-poky-linux/mc/mc-locale-da: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-de-ch: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-de-ch: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-de: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-de: PKGSIZE changed from 88497 to 91265 (+3%)
packages/core2-32-poky-linux/mc/mc-locale-de: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-el: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-el: PKGSIZE changed from 56936 to 56398 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-el: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PKGSIZE changed from 5535 to 26760 (+383%)
packages/core2-32-poky-linux/mc/mc-locale-en-gb: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-eo: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-eo: PKGSIZE changed from 89452 to 88898 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-eo: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-es: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-es: PKGSIZE changed from 90531 to 90242 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-es: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-et: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-et: PKGSIZE changed from 82580 to 87323 (+6%)
packages/core2-32-poky-linux/mc/mc-locale-et: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-eu: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-eu: PKGSIZE changed from 81621 to 81013 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-eu: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fa: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fa: PKGSIZE changed from 18288 to 18184 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-fa: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fi: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fi: PKGSIZE changed from 42981 to 42747 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-fi: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fr-ca: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fr-ca: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-fr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-fr: PKGSIZE changed from 95206 to 95447 (+0%)
packages/core2-32-poky-linux/mc/mc-locale-fr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ga: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ga: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-gl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-gl: PKGSIZE changed from 83980 to 83304 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-gl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-he: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-he: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-hr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-hr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-hu: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-hu: PKGSIZE changed from 78451 to 77835 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-hu: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ia: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ia: PKGSIZE changed from 28673 to 28589 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-ia: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-id: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-id: PKGSIZE changed from 16671 to 16557 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-id: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ie: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ie: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-it: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-it: PKGSIZE changed from 87278 to 88177 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-it: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ja: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ja: PKGSIZE changed from 39333 to 39067 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ja: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ka: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ka: PKGSIZE changed from 60571 to 69185 (+14%)
packages/core2-32-poky-linux/mc/mc-locale-ka: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-kk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-kk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ko: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ko: PKGSIZE changed from 92185 to 93470 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-ko: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-kw: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-kw: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-lt: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-lt: PKGSIZE changed from 48364 to 48043 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-lt: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-lv: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-lv: PKGSIZE changed from 19483 to 19415 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-lv: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-mn: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-mn: PKGSIZE changed from 31250 to 31118 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-mn: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nb: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nb: PKGSIZE changed from 87829 to 87563 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-nb: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nl-be: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nl-be: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-nl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-nl: PKGSIZE changed from 84385 to 87731 (+4%)
packages/core2-32-poky-linux/mc/mc-locale-nl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pl: PKGSIZE changed from 93176 to 92888 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-pl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PKGSIZE changed from 97809 to 97486 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-pt-br: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-pt: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-pt: PKGSIZE changed from 92278 to 91990 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-pt: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ro: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ro: PKGSIZE changed from 92152 to 91588 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-ro: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ru: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ru: PKGSIZE changed from 114197 to 115135 (+1%)
packages/core2-32-poky-linux/mc/mc-locale-ru: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sk: PKGSIZE changed from 82883 to 82273 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-sk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sl: PKGSIZE changed from 22933 to 22865 (-0%)
packages/core2-32-poky-linux/mc/mc-locale-sl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sr: PKGSIZE changed from 97360 to 96511 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-sr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-sv: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-sv: PKGSIZE changed from 81541 to 80973 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-sv: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-szl: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-szl: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-ta: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-ta: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-te: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-te: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-tr: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-tr: PKGSIZE changed from 80133 to 83076 (+4%)
packages/core2-32-poky-linux/mc/mc-locale-tr: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-uk: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-uk: PKGSIZE changed from 115808 to 113888 (-2%)
packages/core2-32-poky-linux/mc/mc-locale-uk: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-uz: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-uz: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-vi: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-vi: PKGSIZE changed from 24691 to 24556 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-vi: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-wa: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-wa: PKGSIZE changed from 13412 to 13343 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-wa: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PKGSIZE changed from 76979 to 76418 (-1%)
packages/core2-32-poky-linux/mc/mc-locale-zh-cn: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PKGSIZE changed from 44804 to 49011 (+9%)
packages/core2-32-poky-linux/mc/mc-locale-zh-tw: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-src: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-src: FILELIST: directory renamed /usr/src/debug/mc/4.8.29-r0/lib/vfs -> /usr/src/debug/mc/4.8.30-r0/lib/vfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/sfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/sfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/subshell -> /usr/src/debug/mc/4.8.30-r0/src/subshell, directory renamed /usr/src/debug/mc/4.8.29-r0/src/diffviewer -> /usr/src/debug/mc/4.8.30-r0/src/diffviewer, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/mcconfig -> /usr/src/debug/mc/4.8.30-r0/lib/mcconfig, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/widget -> /usr/src/debug/mc/4.8.30-r0/lib/widget, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/search -> /usr/src/debug/mc/4.8.30-r0/lib/search, directory renamed /usr/src/debug/mc/4.8.29-r0/src -> /usr/src/debug/mc/4.8.30-r0/src, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/event 
 -> /usr/src/debug/mc/4.8.30-r0/lib/event, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/tty -> /usr/src/debug/mc/4.8.30-r0/lib/tty, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/strutil -> /usr/src/debug/mc/4.8.30-r0/lib/strutil, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/extfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/extfs, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/ftpfs -> /usr/src/debug/mc/4.8.30-r0/src/vfs/ftpfs, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/skin -> /usr/src/debug/mc/4.8.30-r0/lib/skin, directory renamed /usr/src/debug/mc/4.8.29-r0/src/consaver -> /usr/src/debug/mc/4.8.30-r0/src/consaver, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/cpio -> /usr/src/debug/mc/4.8.30-r0/src/vfs/cpio, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/fish -> /usr/src/debug/mc/4.8.30-r0/src/vfs/fish, directory renamed /usr/src/debug/mc/4.8.29-r0/src/editor -> /usr/src/debug/mc/4.8.30-r0/src/editor, directory renamed /usr/src/debug/mc/4.8
 .29-r0/src/viewer -> /usr/src/debug/mc/4.8.30-r0/src/viewer, directory renamed /usr/src/debug/mc/4.8.29-r0/lib/filehighlight -> /usr/src/debug/mc/4.8.30-r0/lib/filehighlight, directory renamed /usr/src/debug/mc/4.8.29-r0/src/vfs/local -> /usr/src/debug/mc/4.8.30-r0/src/vfs/local, directory renamed /usr/src/debug/mc/4.8.29-r0/src/filemanager -> /usr/src/debug/mc/4.8.30-r0/src/filemanager, removed "/usr/src/debug/mc/4.8.29-r0/lib/keybind.h /usr/src/debug/mc/4.8.29-r0/lib/keybind.c /usr/src/debug/mc/4.8.29-r0/src/vfs/tar/tar.c /usr/src/debug/mc/4.8.29-r0/lib/skin.h /usr/src/debug/mc/4.8.29-r0/lib/util.h /usr/src/debug/mc/4.8.29-r0/lib/util.c /usr/src/debug/mc/4.8.29-r0/src/vfs/tar/tar.h /usr/src/debug/mc/4.8.29-r0/lib/event-types.h /usr/src/debug/mc/4.8.29-r0/lib/utilunix.c /usr/src/debug/mc/4.8.29-r0/lib/serialize.h /usr/src/debug/mc/4.8.29-r0/lib/strescape.h /usr/src/debug/mc/4.8.29-r0/lib/shell.c /usr/src/debug/mc/4.8.29-r0/lib/serialize.c /usr/src/debug/mc/4.8.29-r0/lib/shell.h /us
 r/src/debug/mc/4.8.29-r0/lib/timefmt.c /usr/src/debug/mc/4.8.29-r0/lib/charsets.c /usr/src/debug/mc/4.8.29-r0/lib/charsets.h /usr/src/debug/mc/4.8.29-r0/lib/timefmt.h /usr/src/debug/mc/4.8.29-r0/lib/lock.c /usr/src/debug/mc/4.8.29-r0/lib/hook.h /usr/src/debug/mc/4.8.29-r0/lib/global.h /usr/src/debug/mc/4.8.29-r0/lib/hook.c /usr/src/debug/mc/4.8.29-r0/lib/widget.h /usr/src/debug/mc/4.8.29-r0/lib/lock.h /usr/src/debug/mc/4.8.29-r0/lib/global.c /usr/src/debug/mc/4.8.29-r0/lib/strutil.h /usr/src/debug/mc/4.8.29-r0/lib/glibcompat.h /usr/src/debug/mc/4.8.29-r0/lib/filehighlight.h /usr/src/debug/mc/4.8.29-r0/lib/event.h /usr/src/debug/mc/4.8.29-r0/lib/mcconfig.h /usr/src/debug/mc/4.8.29-r0/lib/search.h /usr/src/debug/mc/4.8.29-r0/lib/glibcompat.c", added "/usr/src/debug/mc/4.8.30-r0/lib/keybind.h /usr/src/debug/mc/4.8.30-r0/lib/keybind.c /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar.c /usr/src/debug/mc/4.8.30-r0/lib/skin.h /usr/src/debug/mc/4.8.30-r0/lib/util.h /usr/src/debug/mc/4.8.30-r0/li
 b/util.c /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar.h /usr/src/debug/mc/4.8.30-r0/lib/event-types.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-xheader.c /usr/src/debug/mc/4.8.30-r0/lib/file-entry.h /usr/src/debug/mc/4.8.30-r0/lib/utilunix.c /usr/src/debug/mc/4.8.30-r0/lib/serialize.h /usr/src/debug/mc/4.8.30-r0/lib/strescape.h /usr/src/debug/mc/4.8.30-r0/lib/shell.c /usr/src/debug/mc/4.8.30-r0/lib/serialize.c /usr/src/debug/mc/4.8.30-r0/lib/shell.h /usr/src/debug/mc/4.8.30-r0/lib/timefmt.c /usr/src/debug/mc/4.8.30-r0/lib/charsets.c /usr/src/debug/mc/4.8.30-r0/lib/charsets.h /usr/src/debug/mc/4.8.30-r0/lib/timefmt.h /usr/src/debug/mc/4.8.30-r0/lib/lock.c /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-internal.c /usr/src/debug/mc/4.8.30-r0/lib/hook.h /usr/src/debug/mc/4.8.30-r0/lib/global.h /usr/src/debug/mc/4.8.30-r0/lib/hook.c /usr/src/debug/mc/4.8.30-r0/lib/widget.h /usr/src/debug/mc/4.8.30-r0/lib/lock.h /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-internal.h /usr/src/debug/mc/4.8.30
 -r0/lib/global.c /usr/src/debug/mc/4.8.30-r0/lib/strutil.h /usr/src/debug/mc/4.8.30-r0/lib/glibcompat.h /usr/src/debug/mc/4.8.30-r0/lib/filehighlight.h /usr/src/debug/mc/4.8.30-r0/lib/event.h /usr/src/debug/mc/4.8.30-r0/lib/mcconfig.h /usr/src/debug/mc/4.8.30-r0/lib/search.h /usr/src/debug/mc/4.8.30-r0/lib/glibcompat.c /usr/src/debug/mc/4.8.30-r0/src/vfs/tar/tar-sparse.c"
packages/core2-32-poky-linux/mc/mc-src: PKGSIZE changed from 3838973 to 3954728 (+3%)
packages/core2-32-poky-linux/mc/mc-src: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc-staticdev: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc-staticdev: PV changed from "4.8.29" to "4.8.30"
packages/core2-32-poky-linux/mc/mc: PKGV changed from 4.8.29 [default] to 4.8.30 [default]
packages/core2-32-poky-linux/mc/mc: FILELIST: added "/usr/share/mc/syntax/b.syntax /usr/share/mc/hints/mc.hint.ka"
packages/core2-32-poky-linux/mc/mc: PKGSIZE changed from 3805063 to 3850668 (+1%)
packages/core2-32-poky-linux/mc/mc: PV changed from "4.8.29" to "4.8.30"
Changes to packages/core2-32-poky-linux/mc (sysroot):
  /usr/share/mc/hints/mc.hint.ka was added
  /usr/share/mc/syntax/b.syntax was added

--===============1964591221182124992==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.29-4.8.30.patch"

RnJvbSAxZTEwZGQ3MTZmMWYxZDFmZjI3Zjk4ODI4OTBlNWM1OTE4M2FmYTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMDoyODo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1j
OiB1cGdyYWRlIDQuOC4yOSAtPiA0LjguMzAKCi0tLQogLi4uLW1jLXJlcGxhY2UtcGVybC13LXdp
dGgtdXNlLXdhcm5pbmdzLnBhdGNoIHwgMTI3IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL21jL3tt
Y180LjguMjkuYmIgPT4gbWNfNC44LjMwLmJifSAgICAgICAgIHwgICAzICstCiAyIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMjkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMtcmVwbGFjZS1wZXJsLXct
d2l0aC11c2Utd2FybmluZ3MucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMv
e21jXzQuOC4yOS5iYiA9PiBtY180LjguMzAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21jL2ZpbGVzLzAwMDEtbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Ut
d2FybmluZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWMvZmlsZXMvMDAwMS1tYy1y
ZXBsYWNlLXBlcmwtdy13aXRoLXVzZS13YXJuaW5ncy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggNWVkZTgyZDM0Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbWMvZmlsZXMvMDAwMS1tYy1yZXBsYWNlLXBlcmwtdy13aXRoLXVzZS13YXJuaW5ncy5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDEyNyArMCwwIEBACi1Gcm9tIDYyYzg2YjY5MTA2ZDBk
NzAyMTY3YmExYjk2M2VhMWMyMDFjY2U1YWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KLURhdGU6IFRodSwgNiBB
cHIgMjAxNyAwMjoyNDoyOCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBtYzogcmVwbGFjZSAicGVy
bCAtdyIgd2l0aCAidXNlIHdhcm5pbmdzIgotCi1UaGUgc2hlYmFuZydzIG1heCBsZW5ndGggaXMg
dXN1YWxseSAxMjggYXMgZGVmaW5lZCBpbgotL3Vzci9pbmNsdWRlL2xpbnV4L2JpbmZtdHMuaDoK
LSAgI2RlZmluZSBCSU5QUk1fQlVGX1NJWkUgMTI4Ci0KLVRoZXJlIHdvdWxkIGJlIGVycm9ycyB3
aGVuIEBQRVJMQCBpcyBsb25nZXIgdGhhbiAxMjgsIHVzZQotJy91c3IvYmluL2VudiBwZXJsJyBj
YW4gZml4IHRoZSBwcm9ibGVtLCBidXQgJy91c3IvYmluL2VudiBwZXJsIC13JwotZG9lc24ndCB3
b3JrOgotCi0vdXNyL2Jpbi9lbnY6IHBlcmwgLXc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
LQotU28gcmVwbGFjZSAicGVybCAtdyIgd2l0aCAidXNlIHdhcm5pbmdzIiB0byBtYWtlIGl0IHdv
cmsuCi0KLVRoZSBtYW4yaGxwLmluIGFscmVhZHkgaGFzICJ1c2Ugd2FybmluZ3M7Iiwgc28ganVz
dCByZW1vdmUgJy13JyBpcyBPSy4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vZ2l0aHViLmNvbS9NaWRuaWdodENvbW1hbmRlci9tYy9wdWxsLzE3NF0KLQotU2lnbmVkLW9m
Zi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+Ci0KLS0tLQotIHNy
Yy9tYW4yaGxwL21hbjJobHAuaW4gICAgICAgICAgIHwgMiArLQotIHNyYy92ZnMvZXh0ZnMvaGVs
cGVycy9hKy5pbiAgICAgIHwgNCArKystCi0gc3JjL3Zmcy9leHRmcy9oZWxwZXJzL21haWxmcy5p
biAgfCAzICsrLQotIHNyYy92ZnMvZXh0ZnMvaGVscGVycy9wYXRjaGZzLmluIHwgMyArKy0KLSBz
cmMvdmZzL2V4dGZzL2hlbHBlcnMvdWxpYi5pbiAgICB8IDQgKysrLQotIHNyYy92ZnMvZXh0ZnMv
aGVscGVycy91emlwLmluICAgIHwgMyArKy0KLSA2IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWFuMmhscC9tYW4yaGxw
LmluIGIvc3JjL21hbjJobHAvbWFuMmhscC5pbgotaW5kZXggMDg3NjVkOC4uOGFhNzEzMSAxMDA2
NDQKLS0tLSBhL3NyYy9tYW4yaGxwL21hbjJobHAuaW4KLSsrKyBiL3NyYy9tYW4yaGxwL21hbjJo
bHAuaW4KLUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMX0ZPUl9CVUlMREAgLXcKLSsjISBAUEVS
TF9GT1JfQlVJTERACi0gIwotICMgIE1hbiBwYWdlIHRvIGhlbHAgZmlsZSBjb252ZXJ0ZXIKLSAj
ICBDb3B5cmlnaHQgKEMpIDE5OTQsIDE5OTUsIDE5OTgsIDIwMDAsIDIwMDEsIDIwMDIsIDIwMDMs
IDIwMDQsIDIwMDUsCi1kaWZmIC0tZ2l0IGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL2ErLmluIGIv
c3JjL3Zmcy9leHRmcy9oZWxwZXJzL2ErLmluCi1pbmRleCA1Nzk0NDFjLi5mZTQ0NmY0IDEwMDY0
NAotLS0tIGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL2ErLmluCi0rKysgYi9zcmMvdmZzL2V4dGZz
L2hlbHBlcnMvYSsuaW4KLUBAIC0xLDQgKzEsNCBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJM
QAotICMKLSAjIEV4dGVybmFsIGZpbGVzeXN0ZW0gZm9yIG1jLCB1c2luZyBtdG9vbHMKLSAjIFdy
aXR0ZW4gTHVkZWsgQnJ1a25lciA8bHVickBiYXJjby5jej4sIDE5OTcKLUBAIC05LDYgKzksOCBA
QAotIAotICMgVGhlc2UgbXRvb2xzIGNvbXBvbmVudHMgbXVzdCBiZSBpbiBQQVRIIGZvciB0aGlz
IHRvIHdvcmsKLSAKLSt1c2Ugd2FybmluZ3M7Ci0rCi0gc3ViIHF1b3RlIHsKLSAgICAgJF8gPSBz
aGlmdChAXyk7Ci0gICAgIHMvKFteXHdcLy4rLV0pL1xcJDEvZzsKLWRpZmYgLS1naXQgYS9zcmMv
dmZzL2V4dGZzL2hlbHBlcnMvbWFpbGZzLmluIGIvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL21haWxm
cy5pbgotaW5kZXggNGJkZDY4Yi4uNWJiMzczYiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMv
aGVscGVycy9tYWlsZnMuaW4KLSsrKyBiL3NyYy92ZnMvZXh0ZnMvaGVscGVycy9tYWlsZnMuaW4K
LUBAIC0xLDYgKzEsNyBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotIAotIHVzZSBieXRl
czsKLSt1c2Ugd2FybmluZ3M7Ci0gCi0gIyBNQyBleHRmcyBmb3IgKHBvc3NpYmx5IGNvbXByZXNz
ZWQpIEJlcmtlbGV5IHN0eWxlIG1haWxib3ggZmlsZXMKLSAjIFBldGVyIERhdW0gPGdhdG9yQGNz
LnR1LWJlcmxpbi5kZT4gKEphbiAxOTk4LCBtYy00LjEuMjQpCi1kaWZmIC0tZ2l0IGEvc3JjL3Zm
cy9leHRmcy9oZWxwZXJzL3BhdGNoZnMuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvcGF0Y2hm
cy5pbgotaW5kZXggYzIwY2Q1NC4uMWYxZTc1YiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMv
aGVscGVycy9wYXRjaGZzLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvcGF0Y2hmcy5p
bgotQEAgLTEsNCArMSw0IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwotICMgV3Jp
dHRlbiBieSBBZGFtIEJ5cnRlayA8YWxwaGFAZGViaWFuLm9yZz4sIDIwMDIKLSAjIFJld3JpdHRl
biBieSBEYXZpZCBTdGVyYmEgPGRhdmVAamlrb3MuY3o+LCAyMDA5Ci1AQCAtOSw2ICs5LDcgQEAK
LSAKLSB1c2UgYnl0ZXM7Ci0gdXNlIHN0cmljdDsKLSt1c2Ugd2FybmluZ3M7Ci0gdXNlIFBPU0lY
OwotIHVzZSBGaWxlOjpUZW1wICd0ZW1wZmlsZSc7Ci0gCi1kaWZmIC0tZ2l0IGEvc3JjL3Zmcy9l
eHRmcy9oZWxwZXJzL3VsaWIuaW4gYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdWxpYi5pbgotaW5k
ZXggNDE4NjExZi4uODJjN2NjZiAxMDA2NDQKLS0tLSBhL3NyYy92ZnMvZXh0ZnMvaGVscGVycy91
bGliLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMvdWxpYi5pbgotQEAgLTEsOSArMSwx
MSBAQAotLSMhIEBQRVJMQCAtdwotKyMhIEBQRVJMQAotICMKLSAjIFZGUyB0byBtYW5hZ2UgdGhl
IGdwdXRpbHMgYXJjaGl2ZXMuCi0gIyBXcml0dGVuIGJ5IE1vbG7DoXIgS8Ohcm9seSAocHJvdG9u
N0BmcmVlbWFpbC5odSkgMjAxMgotICMKLSAKLSt1c2Ugd2FybmluZ3M7Ci0rCi0gbXkgJW1vbnRo
ID0gKCdqYW4nID0+ICcwMScsICdmZWInID0+ICcwMicsICdtYXInID0+ICcwMycsCi0gICAgICAg
ICAgICAgICdhcHInID0+ICcwNCcsICdtYXknID0+ICcwNScsICdqdW4nID0+ICcwNicsCi0gICAg
ICAgICAgICAgICdqdWwnID0+ICcwNycsICdhdWcnID0+ICcwOCcsICdzZXAnID0+ICcwOScsCi1k
aWZmIC0tZ2l0IGEvc3JjL3Zmcy9leHRmcy9oZWxwZXJzL3V6aXAuaW4gYi9zcmMvdmZzL2V4dGZz
L2hlbHBlcnMvdXppcC5pbgotaW5kZXggYzQ2OGYzYS4uY2VmZmI1MyAxMDA2NDQKLS0tLSBhL3Ny
Yy92ZnMvZXh0ZnMvaGVscGVycy91emlwLmluCi0rKysgYi9zcmMvdmZzL2V4dGZzL2hlbHBlcnMv
dXppcC5pbgotQEAgLTEsNCArMSw0IEBACi0tIyEgQFBFUkxAIC13Ci0rIyEgQFBFUkxACi0gIwot
ICMgemlwIGZpbGUgYXJjaGl2ZSBWaXJ0dWFsIEZpbGUgU3lzdGVtIGZvciBNaWRuaWdodCBDb21t
YW5kZXIKLSAjIFZlcnNpb24gMS40LjAgKDIwMDEtMDgtMDcpLgotQEAgLTksNiArOSw3IEBACi0g
dXNlIFBPU0lYOwotIHVzZSBGaWxlOjpCYXNlbmFtZTsKLSB1c2Ugc3RyaWN0OwotK3VzZSB3YXJu
aW5nczsKLSAKLSAjCi0gIyBDb25maWd1cmF0aW9uIG9wdGlvbnMKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYy9tY180LjguMjkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bWMvbWNfNC44LjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tYy9tY180LjguMjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9tYy9tY180LjguMzAuYmIKaW5kZXggZTdmNGFhY2MyZS4uMjU4YWMzOGUxNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21jL21jXzQuOC4yOS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbWMvbWNfNC44LjMwLmJiCkBAIC05LDEwICs5LDkgQEAgUkRFUEVORFM6
JHtQTn0gPSAibmN1cnNlcy10ZXJtaW5mby1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAibmN1
cnNlcy10ZXJtaW5mbyIKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm1pZG5pZ2h0LWNvbW1hbmRl
ci5vcmcvZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtbWMtcmVwbGFjZS1wZXJsLXctd2l0aC11c2Utd2FybmluZ3MucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vbm9tYW5kYXRlLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImJhNmIyZDg3NTI4MDZhYzIzZmUwNDVjMWIwODFlYjY2ZGNlZmE2MTU5MjA1Yzc5
Zjg2YzAwNWRjYWY5OTQxYzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzgxNzFmMjJmODg5ZTMw
MzBlYzkwNTU0NjNkM2VjZDc4NDM5ODRhYjI0ZTY0OTdkODI5NGQxYzQ0MWE3ZGRiNCIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============1964591221182124992==
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

--===============1964591221182124992==--

