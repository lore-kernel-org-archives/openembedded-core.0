Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
 by mx.groups.io with SMTP id smtpd.web10.14316.1589986715760176819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.ch header.s=protonmail header.b=jXhHFg3s;
 spf=pass (domain: protonmail.ch, ip: 185.70.40.130, mailfrom: vygu@protonmail.ch)
Date: Wed, 20 May 2020 14:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail; t=1589986713;
	bh=jSysTZMj/4xO10spBGfyfFJ8L55x3E+ne6a5bhVE83E=;
	h=Date:To:From:Reply-To:Subject:From;
	b=jXhHFg3smhERG199MdKwwsPkb/dnlkQJJIOt8xJolKBm9m16rpOpWUPb/D529yIBr
	 Ya49d996f2+IWT3Q+Uzo/FpmV5D/mLoD9KeekdkIqbz1+PARiDorjxuuGV3z9SznHa
	 OLwXWdWj+sTGOM8iLD2GATG8qLiVlA7UtprVFmNo=
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
From: "vygu" <vygu@protonmail.ch>
Reply-To: vygu <vygu@protonmail.ch>
Subject: Shared Sstate-cache with qemu issue
Message-ID: <zxxczoV4xZ05IC1nvadUPPkZfB5DTsdyaCkM4vJ14VE8QVDkm1O6RFDlBj8i4m-TmEQtziE9k5nwJ1qGe1nagwqHr5lLK4t8dJSs5-AaJlw=@protonmail.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Content-Type: multipart/alternative;
	boundary="b1_75f953f50c8a163c42f7fa11aa77707a"

--b1_75f953f50c8a163c42f7fa11aa77707a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpXZSBvYnNlcnZlIGFuIGlzc3VlIHdpdGggcWVtdSAocnVucWVtdSkgd2hlbiB3ZSB1
c2Ugb3VyIHNoYXJlZCBzc3RhdGUtY2FjaGUuCklmIHdlIGJ1aWxkIHRoZSBzc3RhdGUtY2FjaGUg
b24gYSBkZWJpYW4geDg2XzY0LCBhbmQgYWZ0ZXIgd2UgdXNlIGl0IG9uIGFuIHVidW50dSB4ODZf
NjQsIHFlbXUgbG9va3MgZm9yIHNldmVyYWwgbm90LWZvdW5kIGxpYnMuCldlIGhhdmUgcmVwcm9k
dWNlZCB0aGlzIHByb2JsZW0gb24gdHdvIGRpZmZlcmVudCBwYyB3aXRoIHVidW50dS4gV2UgZG9u
J3QgaGF2ZSB0aGlzIHByb2JsZW0sIGlmIHdlIHVzZSB0aGUgc3N0YXRlLWNhY2hlIG9uIGFub3Ro
ZXIgZGViaWFuLCBhbmQgbGRkIHNob3dzIHRoZSB1c2Ugb2YgbG9jYWwvaG9zdCBsaWJzLCBub3Qg
dGhlIHlvY3RvIGxpYnMuCgpDb3JkaWFsbHksCgp2eWd1


--b1_75f953f50c8a163c42f7fa11aa77707a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XZSBvYnNlcnZlIGFuIGlz
c3VlIHdpdGggcWVtdSAocnVucWVtdSkgd2hlbiB3ZSB1c2Ugb3VyIHNoYXJlZCBzc3RhdGUtY2Fj
aGUuPGJyPjwvZGl2PjxkaXY+SWYgd2UgYnVpbGQgdGhlIHNzdGF0ZS1jYWNoZSBvbiBhIGRlYmlh
biB4ODZfNjQsIGFuZCBhZnRlciB3ZSB1c2UgaXQgb24gYW4gdWJ1bnR1IHg4Nl82NCwgcWVtdSBs
b29rcyBmb3Igc2V2ZXJhbCBub3QtZm91bmQgbGlicy48YnI+V2UgaGF2ZSByZXByb2R1Y2VkIHRo
aXMgcHJvYmxlbSBvbiB0d28gZGlmZmVyZW50IHBjIHdpdGggdWJ1bnR1LiBXZSBkb24ndCBoYXZl
IHRoaXMgcHJvYmxlbSwgaWYgd2UgdXNlIHRoZSBzc3RhdGUtY2FjaGUgb24gYW5vdGhlciBkZWJp
YW4sIGFuZCBsZGQgc2hvd3MgdGhlIHVzZSBvZiBsb2NhbC9ob3N0IGxpYnMsIG5vdCB0aGUgeW9j
dG8gbGlicy4gPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Db3JkaWFsbHksPGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+dnlndTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayI+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2stdXNlciBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+PGJyPjwv
ZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==



--b1_75f953f50c8a163c42f7fa11aa77707a--
