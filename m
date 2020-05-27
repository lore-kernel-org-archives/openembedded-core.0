Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
 by mx.groups.io with SMTP id smtpd.web10.4879.1590582590318340097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 05:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.ch header.s=protonmail header.b=RUcMUseh;
 spf=pass (domain: protonmail.ch, ip: 185.70.40.138, mailfrom: vygu@protonmail.ch)
Date: Wed, 27 May 2020 12:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail; t=1590582586;
	bh=Q4PUWZAujZegLw6D/T96lCzjif3LmfZQWDHwLAopwpM=;
	h=Date:To:From:Reply-To:Subject:From;
	b=RUcMUsehp8oVhLq84XFO5cQ3HA+ezOyVF6Jn1jjM57lfT0ZPHeXUV2wba9aOnQLU3
	 gwQbveMd3zsJsiNwA2dIKvX9cYVhhfP8l6L3h1cI8Z/tEXAJ7M+ScbqSUoo/UohnXt
	 CDzrMS012KP93iS1vvrShtyvw61f/mP/hm7+1Bgo=
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
From: "vygu" <vygu@protonmail.ch>
Reply-To: vygu <vygu@protonmail.ch>
Subject: Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
Message-ID: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Content-Type: multipart/alternative;
	boundary="b1_e0133763718fcd277de50130cdd74ec8"

--b1_e0133763718fcd277de50130cdd74ec8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpTaW5jZSB0aGUgemV1cyBzZXJpZSAoYWxzbyB3aXRoIGR1bmZlbGwpLCB3ZSBvYnNl
cnZlIGFuIGlzc3VlIHdpdGggcnVucWVtdSB3aGVuIHdlIHNoYXJlIHRoZSBzc3RhdGUtY2FjaGUg
dGhhbmtzIHRvIGEgbWlycm9yIGJldHdlZW4gZGlmZmVyZW50IGxpbnV4IGRpc3RyaWJ1dGlvbiBz
dXBwb3J0ZWQgYnkgeW9jdG8uCgpJZiB3ZSBidWlsZCBhIHNzdGF0ZS1jYWNoZSBvbiBhIGRlYmlh
biAxMCB4ODZfNjQgYnVpbGRmYXJtLCAgYW5kIGFmdGVyIHRoYXQgd2UgdXNlIGl0IG9uIGFuIHVi
dW50dSAxOC4wNCB4ODZfNjQsIHJ1bnFlbXUgZG9uJ3QgZmluZCBzZXZlcmFsIGxpYnMuCldlIGhh
dmUgcmVwcm9kdWNlZCB0aGlzIHByb2JsZW0gb24gdHdvIGRpZmZlcmVudCBwYyB3aXRoIHVidW50
dSAxOC4wNCBhbmQgMTYuMDQuCgpXZSBkb24ndCBoYXZlIHRoaXMgcHJvYmxlbSwgaWYgd2UgdXNl
IHRoZSBzaGFyZWQgc3N0YXRlLWNhY2hlIG9uIGFub3RoZXIgZGViaWFuLgoKSW4gYWxsIGNhc2Vz
LCBhICBsZGQgb24gdGhlIHFlbXUgYmluYXJ5IHNob3dzIHVzIHRoZSB1c2Ugb2YgbG9jYWwvaG9z
dCBsaWJzLCBub3QgdGhlIHlvY3RvIGxpYnMuCgpJcyBpdCBhbiBleHBlY3RlZCBiZWhhdmlvcj8g
b3Igbm90PwpSdW5xZW11J3MgbGlicyBoYXZlIHRvIGNvbWUgZnJvbSB0aGUgbGludXggZGlzdHJp
YnV0aW9uIG9yIGZyb20gdGhlIHlvY3RvIGJ1aWxkIGVudj8KCkNvcmRpYWxseSwKCnZ5Z3U=


--b1_e0133763718fcd277de50130cdd74ec8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TaW5jZSB0aGUgemV1cyBz
ZXJpZSAoYWxzbyB3aXRoIGR1bmZlbGwpLCB3ZSBvYnNlcnZlIGFuIGlzc3VlIHdpdGggcnVucWVt
dSB3aGVuIHdlIHNoYXJlIHRoZSBzc3RhdGUtY2FjaGUgdGhhbmtzIHRvIGEgbWlycm9yIGJldHdl
ZW4gZGlmZmVyZW50IGxpbnV4IGRpc3RyaWJ1dGlvbiBzdXBwb3J0ZWQgYnkgeW9jdG8uPGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5JZiB3ZSBidWlsZCBhIHNzdGF0ZS1jYWNoZSBv
biBhIGRlYmlhbiAxMCB4ODZfNjQgYnVpbGRmYXJtLCZuYnNwOyBhbmQgYWZ0ZXIgdGhhdCB3ZSB1
c2UgaXQgb24gYW4gdWJ1bnR1IDE4LjA0IHg4Nl82NCwgcnVucWVtdSBkb24ndCBmaW5kIHNldmVy
YWwgbGlicy48YnI+PGJyPjwvZGl2PjxkaXY+V2UNCiBoYXZlIHJlcHJvZHVjZWQgdGhpcyBwcm9i
bGVtIG9uIHR3byBkaWZmZXJlbnQgcGMgd2l0aCB1YnVudHUgMTguMDQgYW5kIDE2LjA0LiA8YnI+
PC9kaXY+PGRpdj48YnI+V2UgZG9uJ3QNCmhhdmUgdGhpcyBwcm9ibGVtLCBpZiB3ZSB1c2UgdGhl
IHNoYXJlZCBzc3RhdGUtY2FjaGUgb24gYW5vdGhlciBkZWJpYW4uPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JbiBhbGwgY2FzZXMsIGEmbmJzcDsgbGRkIG9uIHRoZSBxZW11IGJpbmFyeSBzaG93
cyB1cyB0aGUgdXNlIG9mIGxvY2FsL2hvc3QgbGlicywgbm90IHRoZSB5b2N0byBsaWJzLiA8YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JcyBpdCBhbiBleHBlY3RlZCBiZWhhdmlvcj8gb3Ig
bm90Pzxicj48L2Rpdj48L2Rpdj48ZGl2PlJ1bnFlbXUncyBsaWJzIGhhdmUgdG8gY29tZSBmcm9t
IHRoZSBsaW51eCBkaXN0cmlidXRpb24gb3IgZnJvbSB0aGUgeW9jdG8gYnVpbGQgZW52Pzxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNvcmRpYWxseSw8YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj52eWd1PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1h
aWxfc2lnbmF0dXJlX2Jsb2NrIj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9j
ay11c2VyIHByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLWVtcHR5Ij48YnI+PC9kaXY+PC9kaXY+
PGRpdj48YnI+PC9kaXY+



--b1_e0133763718fcd277de50130cdd74ec8--
