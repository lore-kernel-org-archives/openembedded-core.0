Return-Path: <ngompa13@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEF0783AF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 15:10:25 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n5so8202593qke.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Nov 2017 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Xw75vWC/uNTOYh6SVLlO4HFkMDbPv7LKzErt6Kduf3U=;
	b=RqX+juO3e7O4Dbxuhvfc3bymi0I4Lug4KqfqSmPoYJNXzCWfgQCWOfQifuUdVofkaM
	z5GSA4tUWFF4bdQnLFl06DIU9u2vFuxsjm7Y9V34hAkHn1Fn+FGkrGcE8WrTs/6cV8j/
	6nE10vKcRIzIeSPYRKv7ayPMXv5BON3lHmBnfBc+3dbT4sBBrytTNg3uZCZ3p8xL/XrT
	U3VSHb+xFmkKNZlKQanQ/wyco3spP+CqJOzl52euElqlrTwRnAWNzQB1mKfFZxJ0ot42
	yEdSrnGfbQr0YbrAEq4w/xvFkFnJ+JMkT7ExA9HK0+a0C5i6yBIFEv1JyEISgYHaY/tz
	SJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Xw75vWC/uNTOYh6SVLlO4HFkMDbPv7LKzErt6Kduf3U=;
	b=Y1TrVqAEkJ7o6pb4dog9KzW/pT3zQJmGI+9nA2Clx9MI98WU6cjh7/hTo0JPJk6/c9
	e5xF/6sHokFybz0mZjy84UvfaH8uJj/qLkdZLsJ5GL+dbUbB5zdrcXzm4hn9qJtaxfNI
	sx1u7wdDkc4LXj0TAJc0zDTyGmXpIgdTQWrhfmkaQXVSuGksIE/v458VFubKbDEw+uVr
	zVbv62ChVzjVTnvpSNLH3yYV4/fjXSwjeb1stfXEl3L2afxPHIza6Ot0+5yZB8szOtyM
	40wzrvv/CD3YObCsJAE9jRLSx8Xf0AKrWOkX1lYqcGJsfaNRzfCcnGx2YzPqxi04z1nN
	Q1kg==
X-Gm-Message-State: AJaThX7PG9/a1vhxAmY8Aw566YtFODQYT/kNl+63SDjLdAeF1dHvIVSq
	x+6KxQRi2crlT8XTtKgcnmw0O5xyWvKokUAOe4qiizKQ
X-Google-Smtp-Source: ABhQp+RlxItEoRfl04ECuPYaWUQgUNJLWm2ACFuPUfSYp8oy6W386SWeK77Aw/fYs38Eqka81zu1CbRAC0uTFRoAPbw=
X-Received: by 10.55.19.158 with SMTP id 30mr2504567qkt.0.1509894626757; Sun,
	05 Nov 2017 07:10:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.41.130 with HTTP; Sun, 5 Nov 2017 07:09:46 -0800 (PST)
From: Neal Gompa <ngompa13@gmail.com>
Date: Sun, 5 Nov 2017 10:09:46 -0500
Message-ID: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Sun, 05 Nov 2017 15:10:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,

Apologies if this is the wrong mailing list for this, but I'm looking
reintroduce BitBake into Fedora, but it seems like there hasn't been
releases in two years. I also cannot identify anywhere that provides
tarballs of BitBake to package.

Am I not looking in the right place?

I looked in the following locations:

* GitHub: https://github.com/openembedded/bitbake
* OE Git: http://git.openembedded.org/bitbake/
* Yocto downloads page: https://www.yoctoproject.org/downloads/tools

The Fedora package previously referenced snapshot tarballs generated
by tagged releases in OE Git, but there haven't been new tagged
releases in two years.

I'd appreciate any help here.

Thanks in advance and best regards!

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

