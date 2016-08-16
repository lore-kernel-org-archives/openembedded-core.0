Return-Path: <clord@mozilla.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8BC73D27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:41:28 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b62so112429540iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mozilla.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=FsJPVAjFypYrr9YF98BLrl5mgw/7gdMiqI1R+0/sPgA=;
	b=ejnKYt3uxfdxvs9v4IcR/Qs+o8Ife0PEgC6DSc/Kipy03M/KM7MYtzQmyV2tlhYEe1
	8f3XgoFmraXxCTqSsLqA169/4MFHAd1dx+sBRE/AXV177axCKNctmIigQPhBc0NSElvm
	uKJE2UGeIdGEqxPtFnfsGryprlxB22QJw5Qg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FsJPVAjFypYrr9YF98BLrl5mgw/7gdMiqI1R+0/sPgA=;
	b=U6QezPhxqEQn5UgF9R5qyayIOkjlhAjmedbiCrpGmNMF2A6fWMePmGt2ZUAweHW3Hl
	crSIjMCisMUh3/Dte+AOTgUdYowzv+dl0kWqGi8+ZWsixwEgVosdCxurGlBhpLX/YI7t
	8r+sUYMuC6XT0NfBkyqeVmx6bTn4lSAb4b2PD1+HnICX2fXA1nHTlUGcA+jKE5GkrZx0
	kSvW+6BQl6pC2iVKN4D0lESXViR8Axl5At98HK5c419etfDMvNpdjSdGYB393IRs6PzV
	i/twcMSoR/01DCiD9Nj5NKJRzJxIvLf2qeY2C2ZnoCo8b4WOcTFwq2TxliAge+t0fD8N
	cXyg==
X-Gm-Message-State: AEkoousBGzDgqWwcH8Tf4OFZgqD9/BGb61e9khtErHZIQrBe3+F7ta8WcVlL6hbngJOSIB9C7tKMZ+pcdjh0I6UT
X-Received: by 10.107.169.207 with SMTP id f76mr7035786ioj.192.1471365688775; 
	Tue, 16 Aug 2016 09:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.23.212 with HTTP; Tue, 16 Aug 2016 09:41:28 -0700 (PDT)
From: Christopher Lord <clord@mozilla.com>
Date: Tue, 16 Aug 2016 17:41:28 +0100
Message-ID: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: npm.bbclass
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
X-List-Received-Date: Tue, 16 Aug 2016 16:41:28 -0000
Content-Type: multipart/alternative; boundary=001a1142773836f360053a33058b

--001a1142773836f360053a33058b
Content-Type: text/plain; charset=UTF-8

I've been using npm.bbclass with various node projects we're working on in
the Connected Devices team at Mozilla, and had some questions/comments
about behaviour (note that I'm basing this off of ostro master, which I
unfortunately have to use as no other Intel Edison bsp is adequate);

- Is there a good reason the npm fetcher only works with a registry? It
seems it could get most (all?) pertinent information from a package.json in
the root of a repository.

- Is there a reason to split the package like it does? Node projects tend
to have huge dependency trees, it makes updating and distributing
node-based applications a bit of a chore if they end up split into 20
packages, most of which have no use separately. It would be great if there
was at least a way to disable this.

- The information about packaging non-registry software here:
https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM is incomplete - you
also need to generate a shrinkwrap and install that into the srcdir, or
you're very likely to get failures doing dependency resolution. Not an OE
issue, but I guess Yocto folks also read this list and it's related :)

- Any patches end up getting packaged because they get put in the srcdir.
I'm guessing this isn't intentional (or maybe it is?)

Just wanted to provide some feedback. It's fantastic that OE has the
ability to package node software, and despite the teething difficulties,
I've appreciated its availability!

Cheers,

--Chris

--001a1142773836f360053a33058b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>I&#39;ve been using npm=
.bbclass with=20
various node projects we&#39;re working on in the Connected Devices team at=
=20
Mozilla, and had some questions/comments about behaviour (note that I&#39;m=
 basing=20
this off of ostro master, which I unfortunately have to use as no other=20
Intel Edison bsp is adequate);<br><br></div>- Is there a good reason the
 npm fetcher only works with a registry? It seems it could get most=20
(all?) pertinent information from a package.json in the root of a=20
repository.<br><br></div>- Is there a reason to split the package like=20
it does? Node projects tend to have huge dependency trees, it makes=20
updating and distributing node-based applications a bit of a chore if=20
they end up split into 20 packages, most of which have no use=20
separately. It would be great if there was at least a way to disable this.<=
br><br></div>- The information about packaging non-registry software here: =
<a href=3D"https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM" target=3D"=
_blank">https://wiki.yoctoproject.org/<wbr>wiki/TipsAndTricks/NPM</a>
 is incomplete - you also need to generate a shrinkwrap and install that
 into the srcdir, or you&#39;re very likely to get failures doing dependenc=
y
 resolution. Not an OE issue, but I guess Yocto folks also read this=20
list and it&#39;s related :)<br><br></div>- Any patches end up getting pack=
aged because they get put in the srcdir. I&#39;m guessing this isn&#39;t in=
tentional (or maybe it is?)<br><br></div>Just
 wanted to provide some feedback. It&#39;s fantastic that OE has the abilit=
y
 to package node software, and despite the teething difficulties, I&#39;ve=
=20
appreciated its availability!<br><br></div>Cheers,<br><br></div>--Chris</di=
v>

--001a1142773836f360053a33058b--
