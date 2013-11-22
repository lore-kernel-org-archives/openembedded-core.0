Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3496AE22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:35:23 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id oz11so1068831veb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 08:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=4JKwrKcM9sBbDXye1f7kVD+kATCkvnTEZ5rYk7NyfR0=;
	b=gBx9D04TkT2gieH5ezouWPjWoePYoVy/MlBQt3nZlYpFXzIeRo5vDHvahofEkBfKZh
	PfivDecH+fbYIoFxfB/gymFPjMB0hIwZSMDhr9Rzkv3bwVUqxjdIkczCOPfvqau/796L
	cA3WJtt+9Vg4RanxUd0GSUglgaK24EJJL5sbPC5kc5lFonH+eqXVIO+sSvoVaJNoSmIs
	WYh9UbnGgy5OE0LJUEgXM3tNDg4c4Wd8jgwuU7Uny52sKo2Opl3uGcpVziB/FoKNyb4/
	vf69yG/QtgQd17HEgii+TltBWhF7Cguzm2hs/VhvRoXnZLrWtQJm9WfwF/+wpwPMoFw9
	f/tg==
X-Gm-Message-State: ALoCoQk2Te1A5aiWexsFv7LEkSaPPe9t/y07LAddgewlfB+QwmTQvRH1hqBED68jig7X58+0u88D
X-Received: by 10.220.74.69 with SMTP id t5mr12213072vcj.18.1385138122282;
	Fri, 22 Nov 2013 08:35:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 22 Nov 2013 08:35:02 -0800 (PST)
In-Reply-To: <CA+AhUGyTC97_E=Yg1JOorHuBDG7SWQS8jfEX1Wg6Ue5pxZfcLw@mail.gmail.com>
References: <CA+AhUGyTC97_E=Yg1JOorHuBDG7SWQS8jfEX1Wg6Ue5pxZfcLw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Nov 2013 16:35:02 +0000
Message-ID: <CAJTo0LYgrwWu=PkBDnUNdzBQ6Zke4p+0CJfqr9fe4qEE4kCcOw@mail.gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus depends on dbus-ptest-ptest if ptest in DISTRO_FEATURES - bug?
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
X-List-Received-Date: Fri, 22 Nov 2013 16:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 November 2013 09:42, Erik Bot=C3=B6 <erik.boto@pelagicore.com> wrote:
> I noticed that dbus will pull in the ptest package as soon as ptest is
> in DISTRO_FEATURES, the recipe contains: RDEPENDS_dbus =3D
> "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '',
> d)}"
>
> Shouldn't this be handled in image.bbclass via
> COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest' ? Then it will only be
> installed if IMAGE_FEATURES contains ptest, which is how other
> packages handle ptest packages.

Correct, that's a clear bug.

Ross

