Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Tsb5F-0002LZ-Kb
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:27:22 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so463467obc.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Yft38nYHCDjNtudQ6/jFx0olM9ImPZCkqom3aGWd/z4=;
	b=OO5ugQj3IFlF4areYAOEesx8kuI9kexYb4eSOmJrcmKNQwfGgJrkNb3xovt5yMCCRr
	PW30nhUP/e8g1rkatcB2w8MgsfId3Y2Wvxaq1TScVj/BAD7gxLGCSv0g6K06gS2BkgPU
	t0sGCp1bL8LQMNMLvtbOcNYKrI7441zcXoSPwcfI3w9rwhk89Wa4Lb/hzihQRZSHQYWv
	w+ICLNh+TiY8Tshepk92lfihDPU8bXpqRhcMEDPcq2whbSBmW+gqMHqa0ZLVGq3fzCol
	0xIq6Wv8nqhR3J7ZKIt9c6Pagc780J4amw1vojMMdgCVvVFDDkOrJln4rTca8os3SLTf
	hEoA==
MIME-Version: 1.0
Received: by 10.60.31.130 with SMTP id a2mr36748559oei.95.1357657930501; Tue,
	08 Jan 2013 07:12:10 -0800 (PST)
Received: by 10.182.85.198 with HTTP; Tue, 8 Jan 2013 07:12:10 -0800 (PST)
Date: Tue, 8 Jan 2013 16:12:10 +0100
Message-ID: <CAOHjBZuDiLmweStxyu3ghH-WMz6S-TO+R7qDurnrvXHw9x4qvg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: meta-toolchain build for uclibc, possible issue?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 15:27:22 -0000
Content-Type: multipart/alternative; boundary=e89a8fb201acac8c4104d2c85e83

--e89a8fb201acac8c4104d2c85e83
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

gcc-runtime nativesdk is failing due to the lack of libm.
I want to build meta-toolchain for uclibc, I mean obtaining the cross
compiler for these flavour, so libm should be
provided by the uclibc. But repository doesn't build any uclibc for
nativesdk, (it builds eglibc by default).
I'm in trouble to understand this, where is the answer I'm not
understanding?

Please can you help me?
Cheers,
Giuseppe

--e89a8fb201acac8c4104d2c85e83
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>gcc-runtime nativesdk is failing due t=
o the lack of libm.</div><div>I want to build meta-toolchain for uclibc, I =
mean obtaining the cross compiler for these flavour, so libm should be</div=
>
<div>provided by the uclibc. But repository doesn&#39;t build any uclibc fo=
r nativesdk, (it builds eglibc by default).</div><div>I&#39;m in trouble to=
 understand this, where is the answer I&#39;m not understanding?</div><div>
=A0</div><div>Please can you help me?</div><div>Cheers,</div><div>Giuseppe<=
/div><div>=A0</div>

--e89a8fb201acac8c4104d2c85e83--
