Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B25D60071;
	Thu, 20 Jun 2013 02:28:36 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so5702586pbc.11
	for <multiple recipients>; Wed, 19 Jun 2013 19:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=psIKvUTZ1EoErpq9kfTksUoCGUnIkaW/Xp2IoqwpHGA=;
	b=aDQ5TictYIxZ/f4iQ1j9TbsVx6Tagew6kb243v4hXZfFPy/bO89q9cXexvNEQLDm7H
	SOXj8Mc73S9NP4dEf8ENW8JZTwPHqQmkXgT7SXrdxGjYgIT1qPtHRAkWdmZPJdhXkQ4V
	wf5JMzf4bUQnkbWthMZ6/hEsgs1bz4RAtoRl6bJrx8Tzg03ysgbdwAZXV15VjtJySFlO
	MuGEJUQz0Ei3zcolZ/CEgvRBQvSeVPdCXcqF2uLTMMZ3B+OB78RqNXaznI0Wo3hT9LW7
	7ZguIusgTcvfZP9+hSXXHttPY7XqFfW7hXcc7JO+Zy5jatfWz0gOHMf8MLA2DGlz0t6J
	jM9g==
X-Received: by 10.66.219.1 with SMTP id pk1mr9299732pac.29.1371695317154;
	Wed, 19 Jun 2013 19:28:37 -0700 (PDT)
Received: from bjupudi-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id u6sm25502910pbb.46.2013.06.19.19.28.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 19:28:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
Date: Wed, 19 Jun 2013 19:28:33 -0700
Message-Id: <FB95243C-761D-4268-96A1-B0893DA616AF@gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 20 Jun 2013 02:28:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> luajit is rather a strange error, HOST_CC can't find <sys/types.h> or
> some other common headers.

hmmm luajit does not fail here for beaglebone/qemuarm so not much I can =
help.

>=20
> mplayer2 is failing to find <mad.h>, this needs the same sort of fix I
> made to vlc =
(http://git.openembedded.org/meta-openembedded/commit/?id=3D3d6369b7c39d78=
b0d424dbe5a97e736b694e3c48).
>=20
> Full logs, conf files, etc: =
http://www.paulbarker.me.uk/yocto/20130617_poky/
>=20

I think missing dependencies. Best is to turn this into PACKAGECONFIG=20

> Note that for the final build everything in "fixes/" has been applied,
> including Khem's patches for gypsy, omgps, packagekit and tk.
>=20
> --
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


