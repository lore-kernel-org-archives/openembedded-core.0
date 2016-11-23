Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61C847198E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:05:23 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id f8so1246380wje.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0JzzjlhkYv7lbU4FQXFpWP/1JTuHWFr/boaIuTssutE=;
	b=hG/DllZnFkrk7nXF30N3tA+cZVqjjRdfFhd/ET+PsBGkiJBnwNbNKQS67JKYmJRxV8
	oDRKK1XV6zCw7k8vYe15LDxOU+NEq/sxyGfk82EMGp38yue3WRptRWQH8Kl0EUaJgTI/
	FIx+fzZJZyW4hlYz4gbcU54vI8j9xdCENPljGBPBOVbznsNDJD0x68NE4kyhsxu9FI3D
	g+XKp7WvUB1Jg1EP7XcMLcztQXUW3GpS7qrsI01u7LkKfE5eJr3hSEmclyF0OKWONvHf
	hafcNO5tlYhfuoEjTSUq67cd1K/SyiINeeyR7aur3AmzZ+58MO2JlUWwBB8IbbylsUg5
	qsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0JzzjlhkYv7lbU4FQXFpWP/1JTuHWFr/boaIuTssutE=;
	b=MC9OVItQyAfht7dujhrfT0QnWsYnsURncjX+dB7oV1SODtH1R3+IHIwbvwC6DAzpoP
	f+ShXRvUFYvl7OrVouAaOhuhqZju5goAT/39nVhAwHJVhXAHcHU7ZM9GI9XHQwxxbp5p
	UJ/D9gPIW2N+sMx2DoYX6Wrnmqazsw9Ffo1GtfqybiMMG6vIadlyUWY/O6SS049LslY2
	bo4eEWabJN6zF77EQvckbpxGMl+ZwK5hE9FpKOp+SRQCcnPdTtcfoz9nQxeoB95g/Mvy
	2jr5yVbq3xlOUl3AH5nY+U0z8U/jmqhP73PuQYxo8W75mtCgmt5TkxDasC0S/LkKaaHo
	eIow==
X-Gm-Message-State: AKaTC012wIvwrWDyfs0eV+JZ2oVDxYKZ5mIw+q/6zrTuRDC9jxPfQeqFtXfRnXoz351lpA==
X-Received: by 10.194.54.99 with SMTP id i3mr3683892wjp.86.1479913524570;
	Wed, 23 Nov 2016 07:05:24 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i15sm36793512wjs.16.2016.11.23.07.05.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 07:05:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 16:05:25 +0100
To: Ulf Magnusson <ulfalizer@gmail.com>
Message-ID: <20161123150525.GA3265@jama>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
	<CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
	<alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
	<CAFkk2KRQ+vv+X9paB+ZLCuFobAVpXyi7gaV7P5kwgX3hja9Rhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFkk2KRQ+vv+X9paB+ZLCuFobAVpXyi7gaV7P5kwgX3hja9Rhg@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Wed, 23 Nov 2016 15:05:24 -0000
X-Groupsio-MsgNum: 89760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:00:12PM +0100, Ulf Magnusson wrote:
> On Wed, Nov 23, 2016 at 12:34 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> > On Wed, 23 Nov 2016, Burton, Ross wrote:
> >
> >>
> >> On 23 November 2016 at 10:42, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
> >>         colleague has a pile of tarballs that were used to customize a=
n x86
> >>       centos system, wants to move all that to OE with as little fuss =
as
> >>       possible, i guess the simplest way is to just create recipes tha=
t have
> >>       the same tarball in the files/ directory, and write a trivial
> >>       do_install() task that untars it into the root fs, yes?
> >>
> >>
> >> Pretty much, yeah.
> >>
> >> If you've a large pile and they're all effectively the same then a
> >> little class can automate it even more.
> >
> >   already going down that road, just wanted to make sure i hadn't
> > overlooked something obvious.
> >
> > rday
>=20
> bin_package.bbclass might be useful as well, especially if the files
> are already arranged like in the rootfs inside the tarballs.

If these files are overwriting files owned by some other packages, then
you will loose that customization when the package is upgraded by
package manager (unless those files are listed in CONFFILES). You need
to use RREPLACES at least.

> do_install() task that untars it into the root fs, yes?

? do_install installs them to $D not root fs which doesn't even exist yet.

You might also need to skip strip if there are also some binaries which are
already stripped, skip ldflash qa check if they don't have matching hash
type etc

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDWwNAAKCRA3VSO3ZXaA
HItUAJ9H1Z2hQGEMV4Stqkl073xH6/kHygCfcL0Dy4cpZJpOqJfCLaxnL4he2EY=
=NvQZ
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
