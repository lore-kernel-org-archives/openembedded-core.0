Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id D1DB97C8E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:14:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id f2so4693737edy.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hV6GvAjxdVEbl1+9jY93bS6j/IYrvRRBaKr9lVOyecc=;
	b=bhJwBAC6l/zMHQ15FptsMK8tlZ0e3D7T2ZdaBCvRXAiRbZogH+1PiInh3FZN/b/VOA
	+uj2D0kFqPyexAne6ZWHtxZx6aX4l8lKFiOlD3LuF8ulqbuUd+4TMid25aLyANTCmozQ
	szjzafF56+7sZmoHIdhM+614TMuAcWv1LkA1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hV6GvAjxdVEbl1+9jY93bS6j/IYrvRRBaKr9lVOyecc=;
	b=e03Zhkl5k3ydRAgk7OcXqXF4EKgYuhG31p/SsIXhq2IMf6HtkNHniZ8n6gdlAiSRRR
	2NDbe5IKdoh4QBvAWwabZJxb9cXiZCcOkKecGeliIXsXM6TYeTPfv/yHg2NL3fdjJLCZ
	ed2Z/pnKyCK3yPz0ZdnioCmTserBMgcXOSq36c4S/8LqfyKLHIGHgCWsrcNyiBuKabwy
	T41OyxOb/0x673DLN21nji9clTwDbGGhXHeM/5FacisGBFbpjQ4I345gqNKoKEaYjvqe
	kdKsja7pLIn7WzcHRLqt9K314SAFuz7HfWo989CR/r5WTtxf8OWUyqLBbNZEX9wLkrXx
	XFlg==
X-Gm-Message-State: APjAAAXwW0sCUYpxlkfHNCrSWpBC3mpayCiMsCuIItG2mI1wJ2MTbCsT
	GLpYkSo02jwBfupr7X86vHEt9g==
X-Google-Smtp-Source: APXvYqyJVSJc+oATJZTwwIOeKv0l/CS+vW0/ksiy11b3l5STGs2niIvHiQdSRRx1cmhG2mT4LuDqpA==
X-Received: by 2002:a50:9063:: with SMTP id z32mr16110002edz.164.1551716088339;
	Mon, 04 Mar 2019 08:14:48 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id
	d19sm1244847ejb.31.2019.03.04.08.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 08:14:47 -0800 (PST)
Date: Mon, 4 Mar 2019 11:14:43 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190304161443.GQ5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<20190304155845.GP5026@bill-the-cat>
	<c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 16:14:48 -0000
X-Groupsio-MsgNum: 121915
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lLR1BQqf7txDtYcF"
Content-Disposition: inline

--lLR1BQqf7txDtYcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 04:06:47PM +0000, Richard Purdie wrote:
> On Mon, 2019-03-04 at 10:58 -0500, Tom Rini wrote:
> > Ah, so "poky" got me thinking this morning.  I was just on bitbake
> > v1.40
> > (since I usually use thud, and that's the version for that).  Moving
> > to
> > bitbake master/tip and I don't see the problem anymore.
> >=20
> > Is it possible to have some logic within OE to check the version of
> > bitbake and throw an error / warning?
>=20
> You mean like the BB_MIN_VERSION variable:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#n6
>=20
> ?
>=20
> :)
>
> The changes were intended to be backwards compatible hence it wasn't
> bumped. Clearly something isn't playing as intended...

Yes, that.  I think we haven't fully used that well historically since I
can only ever recall *kaboom* when using too old of a bitbake rather
than a nice sane error message.  Looking at
https://wiki.yoctoproject.org/wiki/Releases and then some quick git
history, we also must have had that mechanism available when I last ran
into something like that even for the fairly ancient jumping around I've
had to do a time or three.

In fact, can we make BB_MIN_VERSION match the table found there?  It
doesn't look like we have resources / time to test things on both
current and min versions, so we should I think have the min match what
we say should be used.

--=20
Tom

--lLR1BQqf7txDtYcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfU7zAAoJEIf59jXTHXZSkK4QAI2yfwLHtmGM4Jp7/17DwxDt
kTu9URdtnMb88xpWsaNRYHTgwB0ofdExPKMRyGEv8jiOULmLvwW7YGvBcJkAXgJ3
s9mrA9n6s/dosgPc2SWKYAckdLOxW2gJ8vwTWLEBti9K7WzUUFzDAtEYL44cRBi6
98LOThXkwlgxaRTz1E1a1rkrj9QZt3vVirhdHQImS3A52RGW3GNW7Z92FNggd7BP
JSOtHvNGF5sFxpyNPa8Z0WAaRNRLQ8KkDGr/e8LLWRBbcDtSGdoFP60i94A/hYhg
sGfsMfGEZDA8xBLBgJaY/W+k5dcSLv5uz+u+bjWnVKywydZhTafGcYYjnZqZXI2t
V8IHHe6HnFMM2Ww2TwSl+cEvtVV9AXH6SMutgQi5g9rfDIrRMNY1rDOMaqMH1jme
Mzdg2+vgxEAW/kiaNanniMxgR04iwoI8IBR5/F0zrZk//ljucIlmpayGvtTXD7MB
Phj+Mdn8+/6sdgIUiPxYIolQ9JaF/MZbjG3zXy0HNPy7me6JXz3MrzNR6O4A0/LA
oyjZxBPKhzDuEcijcm4bQyBQQR7nku1lm1P8cJHxcPd4tVbgLc/zvR1tC6x8MaK7
331HNkiDloK/1JH85U163EPlWQffrIJfrtvNMFU9JWnZA4CgdfUQOdWr96tAbJU1
PcfxmJQ23a6yO2UNC3zI
=hc/z
-----END PGP SIGNATURE-----

--lLR1BQqf7txDtYcF--
