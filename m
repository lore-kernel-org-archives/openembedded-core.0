Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFFE6B8C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:44:09 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id z12so2991513wgg.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 02:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=nKw6KtZT23WChC7RAHAkb7lGIjxFNQFdJ7HzHFaeQjY=;
	b=mCZp9+HD0/bsLCtk3y6qO/NvpamTQv8my5ztr81HquGanKwJvDW5JNb6CC021WqD8D
	Y4hozeS2SlJ5YnLxQWlgxAk1f+4ukumBAMjrpbunVNX4EERkTl1JYkhOgn5u3IiNcGo5
	py4t67/sdcEyZ+bkEGeVD7+Kwsn+vqPU1KBssvwaq6KZrXpsC6QNPaBXm4an7xg0A503
	hafF0YTCuVGjK+ggAmHU1VCYHsLO8qQxeFlahEoKKoHtsq6Yo0eZQrrOTc7sVMMfy3iH
	33VBqjJ0YG98tR8dVq+GLx+An9HLr8kehZyIv4p0Q1ltX4g2LuUayj50R2SdWUtofMe9
	IYfQ==
X-Gm-Message-State: ALoCoQny3djS+faHeImiODCSZB2F7DdEMA18u/cbjnnb0pnfUxTATgKZo4x/gsfG2GI2ifsjvGw/
X-Received: by 10.194.201.65 with SMTP id jy1mr7451121wjc.43.1389869049128;
	Thu, 16 Jan 2014 02:44:09 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id uq2sm5711244wjc.5.2014.01.16.02.44.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jan 2014 02:44:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <CAP9ODKq+XKYP3ae=2tFdj5BATBUHUt6E-Wq8SzMpPebt9cN51g@mail.gmail.com>
Date: Thu, 16 Jan 2014 11:46:12 +0100
Message-Id: <38155A0E-22FF-4A3A-916A-5C0D2C256AA9@linaro.org>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
	<52D7A5F0.6090501@linaro.org>
	<CAP9ODKq+XKYP3ae=2tFdj5BATBUHUt6E-Wq8SzMpPebt9cN51g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Thu, 16 Jan 2014 10:44:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Op 16 jan. 2014, om 11:38 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

>=20
>=20
>=20
> On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi <koen.kooi@linaro.org> =
wrote:
> On 01/15/2014 12:22 PM, Otavio Salvador wrote:
>=20
>=20
>=20
> On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
>=20
>     I've limited it to 64bit targets, but to be honest debug splitting
>     doesn't make sense for grub since it won't run in your rootfs and
>     attaching gdb is pretty much impossible.
>=20
>     Signed-off-by: Koen Kooi <koen.kooi@linaro.org
>     <mailto:koen.kooi@linaro.org>>
>=20
>=20
>=20
> I'd prefer to remove the debug systems than skip the split. What =
others
> think?
>=20
> I'm not sure what you mean by that, do you mean using =
INHIBIT_PACKAGE_STRIP or something else?
>=20
>=20
> Yes and be sure it has been stripped during build.

That seems to be a lot more work for the same effect. Stripping isn't =
the problem, it's debugedit trying to do its magic that fails.

regards,

Koen=

