Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE8A7FC01;
	Mon, 20 Jan 2020 16:52:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b6so218154wrq.0;
	Mon, 20 Jan 2020 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jxEP3Ol1I8gsQShctfYr/TEL7O84uZnbx1OwThIriBQ=;
	b=r1qr1QUYurscpEjMx4sd+Qovh3wJoK3EqKXRQAQLVqxx+EngMd9xCeO7rWuAH6bvrR
	b2sOHGlhqzLFKW4rHkDkaM3fKO2mdy2TG2vKCbUD5Kd7cyjq0MevNJ0pG8tNbYa1zkU0
	LKJ3dOeA7JLuAaC2nVhQlQIuWkn0UfBjFg+jX6PbPa+m2/1xGbXzePP2ZcDBj1p/3brr
	I6hVBijYdD4MEjEIrPF+JjQDdTDeKe5hIHSUubtMui17sGHkm01Xn13uRpp0qsbE1T7z
	2+WBSplwjYbpQ3k0mMbjZuLUocEvG8kXlGF4PynRia3y160/boSi+47TfunVjGgNcXCr
	Qh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jxEP3Ol1I8gsQShctfYr/TEL7O84uZnbx1OwThIriBQ=;
	b=EUGRddXr29SmWir8HK5D7jV6ljUgXqI3TKybWhs0ugtGmlaNSncx6ldFTVPsvbZ+b0
	/rJyzgAC8Ko2pdtt6MQmWyl67TUljsMLSBcutA3zwwjLUU7wUXCDrSWq3xaZFWXrwawq
	hnwFl79kCq8LCe3kEw4XI16Ut2huy75yrq8jLe8xlQhlowGb36mgHmozCmr0leM+uPey
	UbSAW7DoQppz1J0bDXY5j4sARTtCgsDaoSBq/myGrW6q7f4IJTeKP3yCZ0efsRxbgkQ4
	yE++u/Ic9tyZED5NgjfEafln6qQwC5n3xpmGOYsjk4xsQR0OXTPrZ9QgkiXnUS25NmaZ
	S+DA==
X-Gm-Message-State: APjAAAVQIoxIZWnt9+PR5gPXRZRSBOgj2Dd/El02w92H/tErZnDTigKs
	er0WTyan0oLZY0/yu3bWQQm77t6NOGW+vcVgCDc=
X-Google-Smtp-Source: APXvYqyAghtiGD60507eBCQZUylNLvQ7SQrzhGSzbt22L1n84qXDgtz7ed43pt9h1kUqkbAVtk1VJ168cHUeHp0mpx0=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr383368wrr.265.1579539128262; 
	Mon, 20 Jan 2020 08:52:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
In-Reply-To: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 20 Jan 2020 17:51:57 +0100
Message-ID: <CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 20 Jan 2020 16:52:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi all
>
> Recently py2 is removed from oe-core, So I did quick patches to get a
> world build going. And
> here are initial failures, please help out with recipes your can or
> care for. Eventually, the remaining
> ones we can blacklist for 3.1 release.
>
> http://errors.yoctoproject.org/Errors/Build/97185/
>
> I will post more arches as they become available. If you want to try
> the same for machines/distros you can try yoe/mut for meta-oe

I've actually asked Ross about similar failures, specifically in
[meta-openembeeded/meta-python] where there is a good mix of Pytho2
and Python3 still present. I've started to remove those yesterday, and
would continue with that layer further.

>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
>
> Thank you
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Andrey.

