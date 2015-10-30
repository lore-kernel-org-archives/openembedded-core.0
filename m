Return-Path: <jatedev@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8FC75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:56:00 +0000 (UTC)
Received: by obbza9 with SMTP id za9so45693216obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=94lGUKX/+1zkLQZ860K7j0Cii666stNuhpgPd1GnCbg=;
	b=IjypOIo9ERwS0Y2x+YtGiUTKrCgNZrhgt2FnYMWCH9dTXXYVwe4n6Lmdn1PM+oOpU1
	k1hihoz03SAql5aWSCK2H1ZpnY38xQbYJi3/Z8HPAqhSsf7XwoTPkHD4Z9Zh9sEkxAd/
	YZ/gDGxo4OcQoXtS5whGKd5p8aUQ1Xi3M670ThkOnIoQ25u6Wa9M1D8UhkAUHtTHTBT6
	X0AYHOWEd0aWe8O/7qCeHH8UsI/u1dxysU3ChSbQZWlM1mFi6PB3AgSOdniuZ3ggZoGG
	ZbH+qzuSI5qp1+Z0L7i1G/Zci4Z3k1Dvv70T9Xfu3CPTx7LwPPlaMHqRj/gfR4j99A1R
	tUKw==
MIME-Version: 1.0
X-Received: by 10.182.210.234 with SMTP id mx10mr5943716obc.47.1446216961077; 
	Fri, 30 Oct 2015 07:56:01 -0700 (PDT)
Received: by 10.76.69.7 with HTTP; Fri, 30 Oct 2015 07:56:01 -0700 (PDT)
Date: Fri, 30 Oct 2015 10:56:01 -0400
Message-ID: <CAPphmgZ_3S+4ePGtCafwPwZ-RyyObw=2yoT==S1bfFyHgNw9Pw@mail.gmail.com>
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rm_work.bbclass: Exclude do_rootfs stamp removal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 14:56:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2b4643bb7be052353a082

--001a11c2b4643bb7be052353a082
Content-Type: text/plain; charset=UTF-8

This prevents unneeded rootfs rebuilds if the metadata has not changed
while using rm_work.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/classes/rm_work.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 5e9efc1..6c58686 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -63,6 +63,10 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_rootfs*)
+               i=dummy
+               break
+               ;;
             *do_build*)
                 i=dummy
                 break
-- 
1.7.9.5

--001a11c2b4643bb7be052353a082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGlzIHByZXZlbnRzIHVubmVlZGVkIHJvb3RmcyByZWJ1aWxk
cyBpZiB0aGUgbWV0YWRhdGEgaGFzIG5vdCBjaGFuZ2VkPGJyPjwvZGl2PndoaWxlIHVzaW5nIHJt
X3dvcmsuPGJyPjxkaXY+PGRpdj48YnI+U2lnbmVkLW9mZi1ieTogSmF0ZSBTdWpqYXZhbmljaCAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmphdGVkZXZAZ21haWwuY29tIj5qYXRlZGV2QGdtYWlsLmNvbTwv
YT4mZ3Q7PGJyPi0tLTxicj7CoG1ldGEvY2xhc3Nlcy9ybV93b3JrLmJiY2xhc3MgfMKgwqDCoCA0
ICsrKys8YnI+wqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspPGJyPjxicj5kaWZmIC0t
Z2l0IGEvbWV0YS9jbGFzc2VzL3JtX3dvcmsuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9ybV93b3Jr
LmJiY2xhc3M8YnI+aW5kZXggNWU5ZWZjMS4uNmM1ODY4NiAxMDA2NDQ8YnI+LS0tIGEvbWV0YS9j
bGFzc2VzL3JtX3dvcmsuYmJjbGFzczxicj4rKysgYi9tZXRhL2NsYXNzZXMvcm1fd29yay5iYmNs
YXNzPGJyPkBAIC02Myw2ICs2MywxMCBAQCBkb19ybV93b3JrICgpIHs8YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaT1kdW1teTxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA7Ozxicj4r
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZG9fcm9vdGZzKik8YnI+K8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaT1kdW1teTxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA7Ozxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKmRvX2J1aWxkKik8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aT1kdW1teTxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazxicj4tLSA8
YnI+MS43LjkuNTxicj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=

--001a11c2b4643bb7be052353a082--
