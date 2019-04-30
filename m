Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 078F47DA0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:33:26 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id j184so7827296vsd.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=p3kL4tzzQYq1SySG36AHWRAY++8g/glNpow9SDk5d5w=;
	b=Va20Ivj2ZhHJi7B40b2W4zn4JdqpFxv7WKujs/Kcn3WGzD4JGhA6kKdSnvb6VVZPCI
	dWbewDhQxklS3dLUz2wZt6doKi1Of9BzjRzA8cAuY/0UmTX0II2GFxL1yChg9aKC08CO
	00B3gVRz/vH3FXZl5pOK6XUrIW7kfc2V2d1YoZ152I50TC7DgWSwCctg3W4CcbWMk/fN
	7HAS0ARzrBXxTdZC9qEq2SVTj7W4dGoy/5USTnjbpzUbvDiQ9ZqAw0Uoxm4YgJw7sqUt
	T6E7vJ6ovHg4fpahZiW++njetpnAV9iXqteCETqsmximlgMZgCLmSHUD/8Q06YcR1hkS
	fFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=p3kL4tzzQYq1SySG36AHWRAY++8g/glNpow9SDk5d5w=;
	b=oMSx5m6kq/xPt9V0bkYqSQ8WYV2sboZ4kQdGEgB2BxqD7HoGh/DEE65Wx498SlvQ2g
	rXRKGwEvQ7PgMAbkwDak1b5JpFm3q2x37WK0fIvJxXOSpPD0BOIp22lQQviSvVxU+BSR
	UgDMbfvN7kkBqJO6Ue/sLA6X7ynC2EXeCoCXqg8QPNcGRIsDDYVoHmtw/wRwwdSXXCB7
	JiAzdIwR37dhyPZi16ikudMsCa0Q9M0CGWrlEeauyNbIiwaBpBPtUazQXPo6HFSO+i37
	0shym0grj52faJu0BF5INdW2uC8Bt1NPb7cAk2gvj/dbPysbUWC9Kwl0AcwOlA7Z5yV6
	Ixng==
X-Gm-Message-State: APjAAAUAmei5shqNLnOB218R0JkCr5sBpFsZ/UxbVKObPq/I9GY12xnk
	y8GWYoPdVY/lvNlhoFD4scopO7LyZRKozuooWM4=
X-Google-Smtp-Source: APXvYqz925QqCofPGuus47VIfWaCVYvGdQRZLbrnrbTT4ysg0tDWNxVdAHQSbszdWfmmgIpGq/P9gqvsh1/oK3uy2Ks=
X-Received: by 2002:a67:fa4d:: with SMTP id j13mr35403169vsq.22.1556627607767; 
	Tue, 30 Apr 2019 05:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<057307c5-9cd5-49d4-b73e-6bf9be16f710@www.fastmail.com>
	<CAO5Uq5RTE1J6YVQLZ0zhsBHLi=m2fCxgq49mvdUkJJ3iorCQkA@mail.gmail.com>
	<22a9ceb8-073a-4ee9-8ce7-36c2b311b2e9@www.fastmail.com>
In-Reply-To: <22a9ceb8-073a-4ee9-8ce7-36c2b311b2e9@www.fastmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 13:33:16 +0100
Message-ID: <CAO5Uq5TbThvLxoeONBEdRfGEjSuZir+Wphxn5sNgivaB2a9UOg@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 12:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 1:24 PM Paul Barker <paul@betafive.co.uk> wrote:
>
> On Tue, 30 Apr 2019, at 13:14, Alex Kiernan wrote:
> > On Tue, Apr 30, 2019 at 1:08 PM Paul Barker <paul@betafive.co.uk> wrote=
:
> > >
> > > On Mon, 29 Apr 2019, at 15:44, Alex Kiernan wrote:
> > > > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > > > ("meson: stop creating enablement symlinks in /etc during
> > > > installation"), services such as systemd-networkd are no longer ena=
bled
> > > > in images.
> > > >
> > >
> > > As an aside - is this systemd upgrade why on raspberrypi3 with master=
 branches I recently have no console on tty1 and `/etc/systemd/system/getty=
.target.wants/getty@tty1.service` is missing?
> > >
> >
> > I suspect so - certainly getty@ is one of the things that's was
> > touched in the upstream commit.
> >
>
> Doing some reading now.
>
> The discussion on https://github.com/systemd/systemd/issues/12345 suggest=
s we should be running `systemctl preset-all` or at least `systemctl enable=
 getty@tty1` on first boot.

That's what this patchset does (`systemctl preset-all`), or rather it
builds images without /etc/machine-id which triggers systemd to do it.

> Maybe this should be handled at the BSP level so we can decide whether to=
 enable getty@tty1 or not on a per-machine basis.
>

Once I'm done you should be able to install preset files which then
determine what gets enabled/disabled, the only real question I've got
is if we should always do this at image build time, or leave it for
first boot and let systemd do it (on read-write images at least).

> However, I can't see an easy way to resolve this at BSP level right now. =
I know how to add a systemd service file in a package and enable it but in =
this case we're looking to enable a service which is already installed. Rea=
ding through systemd.bbclass and the relevant docs doesn't give any suggest=
ions. Is there any straightforward way to enable an already installed servi=
ce?
>

Personally, if I needed it fixing right now, I'd probably add a hack
during rootfs build to put the symlinks in the right place.

--=20
Alex Kiernan

