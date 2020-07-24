Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
 by mx.groups.io with SMTP id smtpd.web10.5039.1595593532323021342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 05:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.ch header.s=protonmail header.b=H9ANCY3w;
 spf=pass (domain: protonmail.ch, ip: 185.70.40.137, mailfrom: vygu@protonmail.ch)
Date: Fri, 24 Jul 2020 12:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail; t=1595593528;
	bh=C2FTWJSY1Kz0bCXqIUA+IddTC3gj8zzPwmDEcp2HwFE=;
	h=Date:To:From:Reply-To:Subject:From;
	b=H9ANCY3wz5lhyNdIX3zZDeiZm+WeAlVFtqdkAed2TcN30tlL3t2PK6fPARP1ak+1a
	 +xzaMYx1+bD9nigg5FEVBBZnpCrk7aQ+H3vGpEIp83h0L5FNK94UIzP0g1EiyBruNl
	 OMxHAUjH1Us2kN7IsJ1Qg/SFGEhE0Hv7zRqJUH4U=
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
From: "vygu" <vygu@protonmail.ch>
Reply-To: vygu <vygu@protonmail.ch>
Subject: error about cve_check after a 'do_populate_sdk: Succeeded' on poky master since 20 july on ubuntu18.04/Debian 10/Debian 9.12
Message-ID: <4ndNL9YzwzexePdkb2TsG1deKpyrFQKKBcgbPArK1n89-zKVAjhgWkLksbQrXK27ug5O4Pr69snx4PJnHM_BittA4cTWn9ADxSGhjwGvHKI=@protonmail.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Content-Type: multipart/alternative;
 boundary="b1_7HXk0NzjlRFiYPiYwIqGVRG2zYmmtIq8L8dEnXQsQ"

--b1_7HXk0NzjlRFiYPiYwIqGVRG2zYmmtIq8L8dEnXQsQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpXZSBvYnNlcnZlIHRoaXMgZm9sbG93aW5nIGVycm9yIGFib3V0IGN2ZV9jaGVjayBh
ZnRlciBhIHBvcHVsYXRlX3NkazoKCkVSUk9SOiBFeGVjdXRpb24gb2YgZXZlbnQgaGFuZGxlciAn
Y3ZlX3NhdmVfc3VtbWFyeV9oYW5kbGVyJyBmYWlsZWQKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBj
YWxsIGxhc3QpOgpGaWxlICIvaG9tZS91c2VyL3Bva3kvbWV0YS9jbGFzc2VzL2N2ZS1jaGVjay5i
YmNsYXNzIiwgbGluZSA2NSwgaW4gY3ZlX3NhdmVfc3VtbWFyeV9oYW5kbGVyKGU9PGJiLmV2ZW50
LkJ1aWxkQ29tcGxldGVkIG9iamVjdCBhdCAweDdmZjZkNDFhZjBiOD4pOgoKPiBzaHV0aWwuY29w
eWZpbGUoY3ZlX3RtcF9maWxlLCBjdmVfc3VtbWFyeV9maWxlKQoKRmlsZSAiL3Vzci9saWIvcHl0
aG9uMy42L3NodXRpbC5weSIsIGxpbmUgMTIwLCBpbiBjb3B5ZmlsZShzcmM9Jy9ob21lL3VzZXIv
cG9reS9idWlsZC90bXAvY3ZlX2NoZWNrJywgZHN0PScvaG9tZS91c2VyL3Bva3kvYnVpbGQvdG1w
L2xvZy9jdmUvY3ZlLXN1bW1hcnktMjAyMDA3MjQxMTE4MTQudHh0JywgZm9sbG93X3N5bWxpbmtz
PVRydWUpOgplbHNlOgo+IHdpdGggb3BlbihzcmMsICdyYicpIGFzIGZzcmM6CndpdGggb3Blbihk
c3QsICd3YicpIGFzIGZkc3Q6CkZpbGVOb3RGb3VuZEVycm9yOiBbRXJybm8gMl0gTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeTogJy9ob21lL3VzZXIvcG9reS9idWlsZC90bXAvY3ZlX2NoZWNrJw==

--b1_7HXk0NzjlRFiYPiYwIqGVRG2zYmmtIq8L8dEnXQsQ
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XZSBvYnNlcnZlIHRoaXMg
Zm9sbG93aW5nIGVycm9yIGFib3V0IGN2ZV9jaGVjayBhZnRlciBhIHBvcHVsYXRlX3Nkazo8YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5FUlJPUjogRXhlY3V0aW9uIG9mIGV2ZW50IGhhbmRs
ZXIgJ2N2ZV9zYXZlX3N1bW1hcnlfaGFuZGxlcicgZmFpbGVkPGJyPjwvZGl2PjxkaXY+VHJhY2Vi
YWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOjxicj48L2Rpdj48ZGl2PiZuYnNwOyBGaWxlICIv
aG9tZS91c2VyL3Bva3kvbWV0YS9jbGFzc2VzL2N2ZS1jaGVjay5iYmNsYXNzIiwgbGluZSA2NSwg
aW4gY3ZlX3NhdmVfc3VtbWFyeV9oYW5kbGVyKGU9Jmx0O2JiLmV2ZW50LkJ1aWxkQ29tcGxldGVk
IG9iamVjdCBhdCAweDdmZjZkNDFhZjBiOCZndDspOjxicj48L2Rpdj48ZGl2PiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOzxicj48L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyAmZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHNodXRpbC5jb3B5ZmlsZShjdmVfdG1wX2ZpbGUsIGN2ZV9zdW1tYXJ5X2Zp
bGUpPGJyPjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PGJyPjwvZGl2PjxkaXY+
Jm5ic3A7IEZpbGUgIi91c3IvbGliL3B5dGhvbjMuNi9zaHV0aWwucHkiLCBsaW5lIDEyMCwgaW4g
Y29weWZpbGUoc3JjPScvaG9tZS91c2VyL3Bva3kvYnVpbGQvdG1wL2N2ZV9jaGVjaycsIGRzdD0n
L2hvbWUvdXNlci9wb2t5L2J1aWxkL3RtcC9sb2cvY3ZlL2N2ZS1zdW1tYXJ5LTIwMjAwNzI0MTEx
ODE0LnR4dCcsIGZvbGxvd19zeW1saW5rcz1UcnVlKTo8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBlbHNlOjxicj48L2Rpdj48ZGl2PiZu
YnNwOyZuYnNwOyZuYnNwOyAmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHdpdGggb3BlbihzcmMsICdyYicpIGFzIGZzcmM6PGJyPjwvZGl2PjxkaXY+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHdpdGggb3Blbihkc3QsICd3YicpIGFz
IGZkc3Q6PGJyPjwvZGl2PjxkaXY+RmlsZU5vdEZvdW5kRXJyb3I6IFtFcnJubyAyXSBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5OiAnL2hvbWUvdXNlci9wb2t5L2J1aWxkL3RtcC9jdmVfY2hlY2sn
PGJyPjwvZGl2Pg==


--b1_7HXk0NzjlRFiYPiYwIqGVRG2zYmmtIq8L8dEnXQsQ--
