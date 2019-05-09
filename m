Return-Path: <guslees@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7A67E03B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 22:30:55 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id h126so2707253lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=l4Sip+WN8K1xRsVUR7EP4EyCXkk+ZijpHwRsIxeItMQ=;
	b=V1pLwzw9xUwYrL5ilB1nVeAkt7Wfpi12Uj+0vcg4Ij+RNguAUGFCfJ4zSJ65M3Pu0w
	ibHq3/Qps5jEpVdZkKrkbk9hV6BpxjRv8bPmgzF2r6A7wF3n4psNnjuiHFI8/vV4OzOY
	+vjHsve+uRv0VMiauLwUh2PjYl2JLIkxYMi3+nqbcW47gmevrW11bi6hemoXEhdgLggY
	W+WWr95h5jeRyVhEfjmz4LiZMhrS29zZWHp6U4v9JbAmFleXVR0aWjeKG5Fumge0Hmtr
	ohyHM0Vlwd3eeXRV/HWvdPXjargKYbJo78Mqv/U7EdhpK/N4m0rxalT01EDQn3vaVnfh
	2S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=l4Sip+WN8K1xRsVUR7EP4EyCXkk+ZijpHwRsIxeItMQ=;
	b=kZ1LFK0quwRkC/wPaKWXJih9fWS2my7HOfTojIFnNQ3roc+K5kzKwSd0IjJoccc+nA
	0VYK6XFiZjKWFDWw6TGouD9Dz6jJA7dReSWkrQvTvqAoh3mXD+4QDpxeMw9ZBCGswaep
	+QOqO06y3uA5HF24K4ouMN1FEG7u+Poh4pmQpaUTOts610UnGR9DBjwb4kJ3B3TGoIIy
	Y71EAH6OBiswgweuJ8O4lT135R830/EAcs7spyin/foIbHEsazf2+jVbFOmq1KEXRk0u
	c3nTLoFZvo+twqbmraRcwJMzQttG7p3fsvDRqn+N1N9930pvI5OoX5pxTe/cHBoz7QbX
	rOqg==
X-Gm-Message-State: APjAAAU9mjGoa1DeGGnWZm5oLE9JXrRS2gCwgiz1Qzv1J2DG3e9FwI5A
	Ld8/ncULVWlD/1GtzgKaH2hb8TmZoCSfJitYYJugHEkjrtA=
X-Google-Smtp-Source: APXvYqx7/cYHLccpUvIv7tv5JuXCV4w9ChvuSy/O8GIN+M3YS70g8KSkv2DRUL25s5ZxFuYxNX1uIxYVbgozF0vtZI0=
X-Received: by 2002:ac2:41da:: with SMTP id d26mr3842672lfi.34.1557441055291; 
	Thu, 09 May 2019 15:30:55 -0700 (PDT)
MIME-Version: 1.0
From: Angus Lees <guslees@gmail.com>
Date: Fri, 10 May 2019 08:30:42 +1000
Message-ID: <CAPA_H3enhkzkA0gpnWrEDr5MxmMWMk_XuxWW_xr_JGth1P7a9w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [thud] Backport "package_manager.py: Use data.tar.xz for ipkg too"
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
X-List-Received-Date: Thu, 09 May 2019 22:30:55 -0000
Content-Type: multipart/alternative; boundary="000000000000dbfdec05887c00da"

--000000000000dbfdec05887c00da
Content-Type: text/plain; charset="UTF-8"

Please cherry-pick c09a22c421a57701f6b943eb50b9bae1545e5b39
 onto thud release branch.  (Note warrior already has this commit)

The fix should also be applied to sumo, if we're still making changes
there.  (Any branch that includes b95b6ba1a2959e2294a8848fa35f20163388eb06)

-- 
Thanks,
 - Gus

--000000000000dbfdec05887c00da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(178,104,24)">Please cherry-pick=C2=A0</span></span><span style=3D"font=
-family:monospace"><span style=3D"color:rgb(178,104,24)">c09a22c421a57701f6=
b943eb50b9bae1545e5b39</span><br></span><span style=3D"font-family:monospac=
e"><span style=3D"color:rgb(178,104,24)">=C2=A0onto thud release branch.=C2=
=A0 (Note warrior already has this commit)</span><br></span><div><br></div>=
<div>The fix should also be applied to sumo, if we&#39;re still making chan=
ges there.=C2=A0 (Any branch that includes=C2=A0<span style=3D"color:rgb(17=
8,104,24);font-family:monospace">b95b6ba1a2959e2294a8848fa35f20163388eb06)<=
/span></div><div><br></div>--=C2=A0<div>Thanks,<br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0- Gus</div></=
div></div>

--000000000000dbfdec05887c00da--
