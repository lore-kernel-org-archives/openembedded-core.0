Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7677D9CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 06:16:36 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h126so3279575lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=207q0e/h+TICr2HOSlPrtkpcPj6kBk/zCjsDM+vHHCg=;
	b=bWDncByWCcyjLUvSk1QyhxLuwntzkYZIbBMUHXm+R6AHsQjt+nj0VVfLJedvr03B/f
	o6hQ8hruzJQHa9CKvAIYekWR5d5BpK4EMyns/F3hL+HsyKoBQ+ulJzg3uYBCWPtOpcqZ
	Z/17Ct2+CxAlF2+zSMPK2DpBkemPYpip1UOjrOY74LSxeMCwugq3+9aPwCuSMVABe0jW
	r9GVgTI0SsF0TkbdqqFbo9BOEmcjpA5Nfo94V3/Yj4OQq3dVqHMxatn4gDiZdi7cZ4f7
	nRLHwTvWEfwQLreyc6HgxqC+6xL4XaY21k3GdJYDYWtT8xwc2n5qz4/xb20I0gF1Ohj0
	Zlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=207q0e/h+TICr2HOSlPrtkpcPj6kBk/zCjsDM+vHHCg=;
	b=IF5b3nxe3ZavLB7j0FZwhnxEnBD9oCrkHPBdtbiA37/mHUkEN5CrrfkUC2iaMqvsOX
	g8Xw21HeiiGuxxkDTbUbzzctilfA5v6Ysi2RoWfOu6uT4SJJQKJHNQDI9zv967R/jyzK
	HskWWuUnxJdaQzo+a1NvN7uVqHFRvtb75Oo+vkYwIkB/LCkuoKwa51zU6LRD/hFIVdB9
	3c6MCDWa2QauIdQCW+6cP2n3Nh3hXvmgx8epPudmVUVamoqFmYvbJjECJ1+0i06+Ntzc
	tI2KER4k+z49cGNSHY5odsnLQeg7a4dED5S2yJRSgEfsDXNYkcZg61tarembdOSKaf9U
	719w==
X-Gm-Message-State: APjAAAUyLOo4URXf1MPcbH3fQoIKrHjkrFXZVgV8l8JctpINPEzACZ3a
	q95eiwgD7hutkG6XQSz6aJuCQ0GFxPHueP0O/24=
X-Google-Smtp-Source: APXvYqwdUpRkoxB+/5u+n05bQuXQEKVRuFEvhOcOD+oZeBWLkDKEXt/q8VaT0DGHoUVUby/b81D+qk9x/n7a8OHJzPQ=
X-Received: by 2002:ac2:523a:: with SMTP id i26mr4768863lfl.118.1557468997560; 
	Thu, 09 May 2019 23:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<20190502210944.62696-3-alex.kiernan@gmail.com>
	<CAKmqyKMDa1gW4ib+3TdJ5v6-58bNjQWmo6GV_6LxkcxpitZNaA@mail.gmail.com>
	<CAO5Uq5TdwdWLiymaOQ91Y3uugg5vzR1EPWGtiRrRE49ktihgUg@mail.gmail.com>
In-Reply-To: <CAO5Uq5TdwdWLiymaOQ91Y3uugg5vzR1EPWGtiRrRE49ktihgUg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 May 2019 23:16:10 -0700
Message-ID: <CAKmqyKM3MPvJu5PGLZbeV2yyGUQr1C4UfHrt38HGK_BUykE4CA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 2/6] systemd: do not create machine-id
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
X-List-Received-Date: Fri, 10 May 2019 06:16:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 1:44 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, May 8, 2019 at 9:19 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, May 2, 2019 at 2:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > From: Jonas Bonn <jonas@norrbonn.se>
> > >
> > > There is no reason to have an emtpy machine-id as part of the systemd
> > > package.  Either:
> > >
> > > i)  the filesystem is writable and the file will be created
> > > automatically; or
> > > ii) the filesystem is read-only, in which case the empty machine-id file
> > > should be created as part of the read-only-rootfs tweaks.
> > >
> > > Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >
> > This patch now results in no "/etc/machine-id" being created which
> > breaks systemd-networkd WiFi connections.
> >
> > I now always see this error when trying to connect to WiFi with
> > wpa_supplicant: "DHCP4 CLIENT: Failed to set IAID+DUID"
> >
>
> I posted this series earlier that fixes everything I know about
> (including the lack of /etc/machine-id in the stateful case):
>
> https://patchwork.openembedded.org/series/17495/
>
> If you can test and I'll have a look if there's anything else that
> needs addressing?

Sorry for the long delay, I didn't get a chance to test it until now.
It's all fixed on master now with your patches.

Alistair

>
> --
> Alex Kiernan

