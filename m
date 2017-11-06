Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2857846E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 12:44:24 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u142so7655761ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+EWW6fPE2zkx1/m5XK0FOLJde3i9Dbcqu/yUPHZtQww=;
	b=HqWpbBvmPOpGFTJKuCVngKrO+PSn0Vuc4iEnSzTnnmhotYhHzDXk1Z3LCHUEcIhqW+
	PR2XfppI564l2Oh9sBcmRW0CbUk47fft+66jmIz9wiJj4cv8eaiUQBaz0fAyl8E+haue
	EDP/g4+z9bv4jG8cLuHLjaQ9wAZMImp4hP4u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+EWW6fPE2zkx1/m5XK0FOLJde3i9Dbcqu/yUPHZtQww=;
	b=hMuNRTvNz7wEbvAWSUW8CP1lPdWZYP13THl9UEpcfrF/xDDHpjLPwIv8RvUvoAn2Gl
	EaG3bJ4N0Dk+h6GhP/FmgYtm9Z9wsEa317fs4+ux1U/J7TWtgFxU7f9R8wnG2tYMPfa+
	u0LoFJG+TlBWUCLXzj8iDgj+ZALUFyBR948VrUuBkhMpGcEgWsdeFtlBZxJDhmVgFF9e
	QRTTXiaTJ3yCpRWEghJF09I+tGYy6YIB9PC+gVJFk2tFPOBYr9Pwt+glAnJUTC3hLqkX
	3EfYouLHkmVQjfN2pAvkbXM/fAwyLmQRzairDhtd+cDIn3hfJSmbIN5Mat5eLwhLE3yP
	ZNfQ==
X-Gm-Message-State: AMCzsaWYOhNsDn4Ifn+TTxN/n62r/J0Se57qIhQRYR7Ht9V9cY/GhGwB
	fKBkN7cA1sX634hNewJlmhoRDA==
X-Google-Smtp-Source: ABhQp+TzX/jjdR+Qex06PAphA54NwA9+D46uEvoL44ynsVsUzSBd1TWk1QyMZSRiOi8IYEyyTD+Q7Q==
X-Received: by 10.37.172.223 with SMTP id x31mr9338319ybd.386.1509972265997;
	Mon, 06 Nov 2017 04:44:25 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	x68sm6008531ywg.65.2017.11.06.04.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 04:44:25 -0800 (PST)
Date: Mon, 6 Nov 2017 07:44:23 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20171106124423.GG32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Mon, 06 Nov 2017 12:44:25 -0000
X-Groupsio-MsgNum: 104580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline

--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
> On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.com> w=
rote:
> > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> >> > > > When we have been told to use the UUID we should also update the=
 fstab
> >> > > > to make use of PARTUUID instead of hard-coding the device in que=
stion.
> >> > > > This will make the resulting image much more portable.
> >> > > >
> >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> >> > > > ---
> >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> >> > >
> >> > > Where we did we end up with this?  Ed pointed out that you can tel=
l wic
> >> > > to use a specific UUID, so reproducible images are not a problem. =
 And
> >> > > making images that are readily portable is why other distros use
> >> > > UUID/LABEL and not device names as much as possible.  I personally=
 enjoy
> >> > > being able to put an image on uSD for minnow and have it work :)
> >> > > Thanks!
> >> >
> >> > ping?
> >>
> >> I was just reminded about the real problems this solves (swap isn't
> >> /dev/sda3, boot is being excessively slow), so, ping?
> >>
> >
> > I'm generally ok with the patchset. The only thing I'm thinking of is i=
f busybox mount
> > supports PARTUUID syntax in fstab. Can you check this, please?
>=20
> It does.

It doesn't, you need util-linux for a mount that figures these out (or,
it did when I wrote the patch set).  That's why 2/2 only updates the
systemd canned wks as that _will_ have full mount.  But please note that
you can already make a wks file that doesn't work with busybox mount by
using the --use-uuid flag for non-root partitions :)

> > I'd like to see Otavio's confirmation that --uuid option solves
> > his reproducible builds concern.
>=20
> I am not against it if the no-fstab-update consider this too. Using
> uuid when making a fstab makes more sense but the possibility to not
> touch the fstab must be kept.

Right.  I'm only updating the systemd wks file to use this.  Nothing
forces this option to be globally used.

--=20
Tom

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAFknAAoJEIf59jXTHXZSVXMP/jYTwesEgbnz4i06jJoUzI5H
onTkC/Su4OAAcyoMpchcpMZBpFgWwnpKIHNY1WPHMIagfCVATYl9iZ/CfqhkwueD
7E3PDCxT/OkY8fdQj6Ke+FPzZLehs3NdyLOsWYCXI7MD9wfdGBE/Khqgt767li40
d5S+2O2PShVgnkCvFa1IIJX14pqjzWd3d7IOdoDcJwYX2kmihVxvngBbuls2okYe
sMWvW2iymuUc9JRLnQ+mC4fVCSn9ZqL+2C78fqq4EbzS23+r/Iu1apzoYvg6+Qrg
UZ4GVqWBIlllGeAboqaWvQ0kKsHLxjai5kV5HGha08igqL4b4tkFXMuglIgUGrek
HT7ZOCxRbtZkrr3lS5/qY4C/1MUJI0el/G+10JLSpf3NrSkZ5ysYS9mj9K5rmVRq
pJwNlxszv/wCbF20dsBvFGN3+sS28hVdf1cTHX9DHbYXd6JBExO93+YmvkMPlp7f
KOa6lGiblxCxi2Jq00zZRudJiXMoIXJ7jA5o59uw1LOO1d87vLwW1umvv/ZUV8yp
87Cap5nRzno0oA0ts4CR17U3iYOU66eIhXIg0hBmPsBqqIVtEcevL+o9fIB5u5vJ
so9LcTxRzhTyZ2yIUq0MBpqFQbEPrx3KyYt+rZxxyFwfXhR3BXWAnL2hJdMv9iK0
7MUcBEiNwrm87ck4WFJM
=HH1o
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
