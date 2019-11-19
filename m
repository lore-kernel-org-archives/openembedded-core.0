Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id E730F7F7C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:21:33 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id n186so4942936lfd.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=huz3YzzBZJ0k/FvqV5z7wWu9JTc+1bDelgcUtTfwIpA=;
	b=e+FoB5vxP5DaCfydZHLWlygDRTX0tuuW4RvO/AuJ27MuJ/RgDf7nM28sA8yDZqq6OS
	m4pMpNVhgozxMK0K9eN4M40+OiyZXZ/k4SO8XPltWfg4zhVqZvsGF9USrx30s+zPnHB0
	Bs0O2qai3BB43USrEVshKRUvs7lSCZOafFNuJ3UlkEyje0/1ve5se3HRTyDJWuxxe0lp
	xvmcvgyQjIH0Fs3NFjQwT7Qjt+6mMJiAm8EvKk458dlhgXAdp2tGM+CkAeFpFFUzv8qO
	DSfDQ+a3FmzNBoP6klxMszmvJASppnxuB1gh29loBVZM9jrHRT3bmQWleCXbiO5sbEk7
	HCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=huz3YzzBZJ0k/FvqV5z7wWu9JTc+1bDelgcUtTfwIpA=;
	b=hVKS8D2z/JqrZYAvt4W0Ihmzy2v1U0rmTwiYnz+399thRDXMKurN26XtG7abOjF4pD
	IIR1pcjkYykNIu8Pz3PvW5dGbh1OUQb4uZHyCkelUza+zj//vg4DgctX6jDlTWDl4DET
	7z3EfqzXtnrfB3cE4j5Gjo+0jvzsSb2JYd0UHHk7cKWVIoOUCiW9HsO50JuOILGUSHwp
	+npnHMcxGgFnKQxQmlhePCtEX4+hVRvsZ1rVGK05vxyfg+j7oow620O9foG5xsdLAa3O
	xa7UdouiHFfCzAxG8PWPQdVfvHokqxjwhvz9+nGpmsgG6Gbh5pZccjN3oX9dBZc1MO8W
	FnCg==
X-Gm-Message-State: APjAAAWiv37s+h2HcU2B1eSu4WT3lbqou4hugh4d/dSeKC5mdrRLyu/q
	eYrgT18V+LICqJZd6gjXOcrIdN6bVyYMh4Oc4SRXYsO0
X-Google-Smtp-Source: APXvYqyGkuLvR0V8RGSvtJ68B4ST6JGCtmEdw7QZx0TRfdjYhHNBrFg/mRObjnzTIA59l8h09ZZXGPo/Hcjj7sAPLkI=
X-Received: by 2002:ac2:4469:: with SMTP id y9mr4491595lfl.33.1574176894222;
	Tue, 19 Nov 2019 07:21:34 -0800 (PST)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 19 Nov 2019 15:21:22 +0000
Message-ID: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Oe-core: python and BBCLASSEXTEND = "native nativesdk"
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
X-List-Received-Date: Tue, 19 Nov 2019 15:21:34 -0000
Content-Type: multipart/alternative; boundary="00000000000098060a0597b49e44"

--00000000000098060a0597b49e44
Content-Type: text/plain; charset="UTF-8"

Dear Openembedded developer,

a lot of python recipes need to add the

BBCLASSEXTEND = "native nativesdk"

To the recipe to build the native version of the package.
Wouldn't be better to add it to the pythonnative.bbclass by default?

Best Regards
Nicola Lunghi

--00000000000098060a0597b49e44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Openembedded developer,</div><div><br></div><div=
></div><div>a lot of python recipes need to add the</div><div><br></div><di=
v style=3D"margin-left:40px">BBCLASSEXTEND =3D &quot;native nativesdk&quot;=
</div><div><br></div><div>To the recipe to build the native version of the =
package.</div><div>Wouldn&#39;t be better to add it to the pythonnative.bbc=
lass by default?</div><div><br></div><div>Best Regards</div><div>Nicola Lun=
ghi</div><div><br></div></div>

--00000000000098060a0597b49e44--
