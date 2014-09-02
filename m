Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id E251265D56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 09:03:30 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id u10so7182705lbd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AafqheiByqjF0s4zt7ZIHqsi686rP9kNePIbfuge1PI=;
	b=vH9tmaMxnV3xvZhPfUArvUtJU7RLZ047Eb1w78QHHZ1r72kR0WfbPOuPqGBgqCzlLa
	yz6mH4Nd8rJLDl13lr5uZ1J8iffidTcHMqFvQzByWBM7ZXSKQ84FQGfu13F+vO1pMNsO
	CsuB+IpGPe1KZs3084ytduUXekYulJ/iGzHw6FNuPqfqovdJxz1kq5qERm+Zs1btdU+8
	aDLiAJy3wYXsswbqpenATbcABbyV7QhRKuF5R+SXvQ7cM1BiFgXvEFzZZZLj/GrYUrtL
	t+AMOfGdze0MYpTP56FiDG3fq5z96F9W6taJnuKDG1j1ypKrcfZRU5D22jqI/Sm3F/EW
	i9zA==
X-Received: by 10.152.9.100 with SMTP id y4mr5493286laa.26.1409648610798;
	Tue, 02 Sep 2014 02:03:30 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	yr17sm4637150lbb.46.2014.09.02.02.03.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Sep 2014 02:03:28 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 2 Sep 2014 09:03:25 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140902090325.GQ7174@gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
	<CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
	<CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
	<CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
	<1409641865.29296.261.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1409641865.29296.261.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Tue, 02 Sep 2014 09:03:37 -0000
X-Groupsio-MsgNum: 57299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2MHPAl/EzyWgzIZ"
Content-Disposition: inline

--y2MHPAl/EzyWgzIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 08:11:05AM +0100, Richard Purdie wrote:
> On Tue, 2014-09-02 at 09:22 +0300, Fathi Boudra wrote:
> > On 1 September 2014 21:04, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> > > Laszlo,
> > >
> > > On Mon, Sep 1, 2014 at 2:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
> > >> Just in case the severity is not clear. Without this change, the Yoc=
to
> > >> SDK breaks the build for our software since we do prefer to use ccac=
he
> > >> for speeding the build process up. We are probably not alone with th=
at
> > >> ...
> > >
> > > Saul request is very valid. He is asking you to conform to the commit
> > > guidelines we use and it is no-sense you to expect that he or someone
> > > else does this for you.
> > >
> > > So I think if you expect this to be merged you need to fix and send a=
 v2.
> >=20
> > fwiw, we've been hit by this maintainers behavior. Several patches are
> > stuck in the queue after 10 days of non-activity, followed up by a
> > nitpick comment.
> > It's a source of frustration for the submitter and is killing his
> > motivation. Such comment could come earlier, while he's in the heat of
> > the action and he's usually more receptive to the review.
> >=20
> > As a result, we lose a contribution. The
> > project/maintainer/submitter/end-user doesn't benefit from the
> > contribution.
> >=20
> > my 2cts.
>=20
> There are two sides to this. There can be frustrations on the submitters
> side, equally, we don't have that many people prepared to review other
> people's code. Code review is a pretty thankless task (as this thread is
> showing) and trying to pull together all the different patches, testing
> them and ensuring there are no regressions takes significant time and
> effort.
>=20

Obvious style issues as this patch had don't require someone to be an exper=
t on
the area of the code that has been changed in order to give a review. I'm h=
appy
to keep my eyes open and try to comment where something doesn't match the p=
atch
guidelines and a few more people doing that would catch the low hanging fru=
it at
least.

>=20
> The kernel gets around this by having subsystem maintainers. With
> OE-Core, its certainly true that particular contributors do have
> "ownership" of parts of the system in my mind and their changes to those
> parts of the system are easier to review and accept. It would be good to
> see more of that kind of ownership too but that trust takes time to
> develop and its not something many are willing to work on. The layers
> model obviously tries to help that too.
>=20

Ownership like this is excellent. What would help the most is a simple tool=
 or
method to tell you who to Cc on a patch when you send it to the mailing lis=
t.
Linux has the "get_maintainer.pl" script for this. I haven't seen anything
similar in oe-core.

For example, I'd like to be Cc'd on changes to opkg in oe-core and vim in
meta-oe as I know those recipes well. I wouldn't expect people to wait for =
my
review, but a Cc might speed things up. I often miss patches to the areas I=
'm
interested in if I'm too busy to follow the mailing lists in detail.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--y2MHPAl/EzyWgzIZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUBYfdAAoJEBwoJlo7UPQD5moIAIyHwnAK2pLWEZ7PXz+a2tF9
REkLQbo5B1Q1D7ZIz45/m3Tkpk0ZS4BwfbG2artffaVLC/8UQR1Bm+L/f2DWBoAd
QhJWco30EiyyXo/YdgnJM2sfjuK+qxigg+i5tYx6CmDoz2KRCRPpoASn1kLhTmqj
wJk+tjQA5V4MVcmTW8nlL4ekUJupEqtgEIQqRNnnJVxXE4rA8H5pgwp7/Zn0GGk+
14jEUU9tcPDB45Cv0nLfuL/r5ZpVdGsp4up0nQqh1RRhxSDtc+yLOgoMIByO9+dg
yuOxopQH2eL/L3vaVVPNEDT/E6ATkZh4DBEHNVAJCKyf/8oIqU9xpgGIWHNKEhE=
=sGtT
-----END PGP SIGNATURE-----

--y2MHPAl/EzyWgzIZ--
