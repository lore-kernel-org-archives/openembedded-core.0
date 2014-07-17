Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1786FEB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 01:47:11 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so1721509wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 18:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9G4+JnqwkdQ+jcAhvHEtZOhRL/VXyn/wYVdDIgel4E8=;
	b=zCr7iZy0YH74498lqJxG782VGLRSVKFQZ+QQidD52cLPli+0l4BcHgLaf3Eatr/JOW
	V0X17C3zyG/voAJyR1LziNABBrJcaktNlcErqP8UXJnhndD/LTyASUgRSXk8VXs7tkQP
	yCK2408zqYj4PkumpqNEcEgVwqDJFXJdi7DZjBsrKFXtNFLfrxoBXx2rf4TNBpBELRP4
	qymR9EyyVbVvNdlwSYEoMqqvlugQXIETEb2ShhfahQ5B4QBazQXCsc0Dihq7QgS8nYBT
	xTI39pcK4uz5LfcgvrAIcQBSEpSX1+VKaRjFlmw+a/6nSVPp7SVxKXEGBs8a52qmqHM+
	HLBg==
MIME-Version: 1.0
X-Received: by 10.194.87.134 with SMTP id ay6mr39406000wjb.84.1405561632593;
	Wed, 16 Jul 2014 18:47:12 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Wed, 16 Jul 2014 18:47:12 -0700 (PDT)
Date: Wed, 16 Jul 2014 18:47:12 -0700
Message-ID: <CAOLEWZXde+2T1bS4ARKMv0cy4KGEZtXHVhtaab0E--49q6wsHA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: libgcrypt workaround
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
X-List-Received-Date: Thu, 17 Jul 2014 01:47:21 -0000
X-Groupsio-MsgNum: 55132
Content-Type: multipart/mixed; boundary=089e0102ee04d2367104fe59d1bc

--089e0102ee04d2367104fe59d1bc
Content-Type: multipart/alternative; boundary=089e0102ee04d2366c04fe59d1ba

--089e0102ee04d2366c04fe59d1ba
Content-Type: text/plain; charset=UTF-8

OE-devs/Tim:

Here's the basic recipe patch; not sure if I should submit it formally or
not.  Maybe a configure patch is preferred?  Feedback welcome.

Thanks, Steve

--089e0102ee04d2366c04fe59d1ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>OE-devs/Tim:<br><br></div>Here&#39;s the basic r=
ecipe patch; not sure if I should submit it formally or not.=C2=A0 Maybe a =
configure patch is preferred?=C2=A0 Feedback welcome.<br><br></div>Thanks, =
Steve<br>
</div>

--089e0102ee04d2366c04fe59d1ba--

--089e0102ee04d2367104fe59d1bc
Content-Type: text/x-patch; charset=US-ASCII; 
	name="libgcrypt.inc_gpgerror_linker-args.patch"
Content-Disposition: attachment; 
	filename="libgcrypt.inc_gpgerror_linker-args.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxpf3h8c0

ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHQuaW5j
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlwdC5pbmMKaW5kZXggYmJh
NGE3OS4uYmQ0ZWVkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0
L2xpYmdjcnlwdC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdj
cnlwdC5pbmMKQEAgLTIyLDExICsyMiwxNyBAQCBpbmhlcml0IGF1dG90b29scy1icm9rZW5zZXAg
dGV4aW5mbyBiaW5jb25maWctZGlzYWJsZWQgcGtnY29uZmlnCiAKIEFTRkxBR1M9Ii0tZGl2aWRl
IgogQ1BQRkxBR1NfYXBwZW5kID0gIiAtRFBJQyAtZlBJQyIKKwogRVhUUkFfT0VDT05GID0gIi0t
d2l0aG91dC1jYXBhYmlsaXRpZXMgLS1kaXNhYmxlLXBhZGxvY2stc3VwcG9ydCIKIAogZG9fY29u
ZmlndXJlX3ByZXBlbmQgKCkgewogCSMgRWxzZSB0aGVzZSBjb3VsZCBiZSB1c2VkIGluIHByZWZl
cm5jZSB0byB0aG9zZSBpbiBhY2xvY2FsLWNvcHkKIAlybSAtZiAke1N9L200LyoubTQKKwlleHBv
cnQgR1BHX0VSUk9SX0xJQlM9Ii1MJHtTVEFHSU5HX0xJQkRJUn0gLWxncGctZXJyb3IgIgorfQor
Citkb19jb25maWd1cmVfcHJlcGVuZF9jbGFzcy1uYXRpdmUoKSB7CisJZXhwb3J0IEdQR19FUlJP
Ul9MSUJTPSItTCR7U1RBR0lOR19MSUJESVJfTkFUSVZFfSAtbGdwZy1lcnJvciAiCiB9CiAKICMg
bGliZ2NyeXB0LnBjIGlzIGFkZGVkIGxvY2FsbHkgYW5kIHRodXMgaW5zdGFsbGVkIGhlcmUK

--089e0102ee04d2367104fe59d1bc--
