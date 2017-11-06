Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C655A6FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 13:02:35 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t11so7676953ywg.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 05:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HVu5JrIaNWREgcSKZJTV3T4CIC6QVWKY4RjgZz5aAxA=;
	b=Tvv5yBX9hKWmwL2wWi9sGk8ut6sHzb63MijxDiDJJLPNqlGNIc+F0tC5Lj22uKfH/M
	p6UlacM1TK/ZnXsCOfLagE2zs6LcZOJFAcvMbAZ5N05fHNpWc2S1I8tqz+qnoog8lYNz
	H+Saw5LNBRtypzN1kt5Fs0C4KDfNRJlRo0DAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HVu5JrIaNWREgcSKZJTV3T4CIC6QVWKY4RjgZz5aAxA=;
	b=o8aHLcWdBRmaQJf/oozpcK/a2ZKJDs3EbTkI3lEN5MeOLtJpTsYymwo6/yfHHaEOwr
	x5TiJkg1lMz3iaPMylUJPoIOZ0KDDBQY+4eeh3O3mI+tSPTH9rnaXNwb9WSOiLlwnCwY
	r3NaZ5E6S6O6cRPFN+0vsiOZHNBCF5iEaCTi5HxxsjKTZe7SdMd70kcFgK7lfx5SxgsC
	NQVzl5kBCT6HzGhHCaHLzeicS7IA6rlEhEFFOuP8wPNlpCUCx76BRjljFLnU1mCXrvZ7
	pJGX9DXcR7UpvuHV+6/ianljiyTQOwvCC4iLWmGYCLPF+50ONB/CFjLafIAWIxbY0UCz
	hT1Q==
X-Gm-Message-State: AMCzsaX4Oj5nhmGOm9srKahhjTJE3/+X1UANyojmtKWYVUEVZyZOSDLw
	xz9i+1T70ifQpypDqUy2jX5Alg==
X-Google-Smtp-Source: ABhQp+Sn3aEwkYyDmjBmK5859ZcUr8N63PEd+GWWjXlH7XXmnaY86EhAL3uyI5z8+o7/FhQoGGO/Og==
X-Received: by 10.129.90.8 with SMTP id o8mr10025456ywb.384.1509973356424;
	Mon, 06 Nov 2017 05:02:36 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	q16sm5949237ywa.2.2017.11.06.05.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 05:02:35 -0800 (PST)
Date: Mon, 6 Nov 2017 08:02:33 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20171106130233.GH32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
	<20171106124423.GG32663@bill-the-cat>
	<CAP9ODKo53a46vSpBD5JhnYjZ2cLwP27U+v-XrkboMH8q-05Rcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo53a46vSpBD5JhnYjZ2cLwP27U+v-XrkboMH8q-05Rcw@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 13:02:35 -0000
X-Groupsio-MsgNum: 104582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline

--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 10:51:56AM -0200, Otavio Salvador wrote:
> On Mon, Nov 6, 2017 at 10:44 AM, Tom Rini <trini@konsulko.com> wrote:
> > On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
> >> On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.com=
> wrote:
> >> > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> >> >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> >> >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> >> >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> >> >> > > > When we have been told to use the UUID we should also update =
the fstab
> >> >> > > > to make use of PARTUUID instead of hard-coding the device in =
question.
> >> >> > > > This will make the resulting image much more portable.
> >> >> > > >
> >> >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> >> >> > > > ---
> >> >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> >> >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> >> >> > >
> >> >> > > Where we did we end up with this?  Ed pointed out that you can =
tell wic
> >> >> > > to use a specific UUID, so reproducible images are not a proble=
m.  And
> >> >> > > making images that are readily portable is why other distros use
> >> >> > > UUID/LABEL and not device names as much as possible.  I persona=
lly enjoy
> >> >> > > being able to put an image on uSD for minnow and have it work :)
> >> >> > > Thanks!
> >> >> >
> >> >> > ping?
> >> >>
> >> >> I was just reminded about the real problems this solves (swap isn't
> >> >> /dev/sda3, boot is being excessively slow), so, ping?
> >> >>
> >> >
> >> > I'm generally ok with the patchset. The only thing I'm thinking of i=
s if busybox mount
> >> > supports PARTUUID syntax in fstab. Can you check this, please?
> >>
> >> It does.
> >
> > It doesn't, you need util-linux for a mount that figures these out (or,
> > it did when I wrote the patch set).  That's why 2/2 only updates the
> > systemd canned wks as that _will_ have full mount.  But please note that
> > you can already make a wks file that doesn't work with busybox mount by
> > using the --use-uuid flag for non-root partitions :)
>=20
> For the root, why you don't use U-Boot to figure the uuid and pass it
> as cmdline, in root=3D? It is just a question as this is how we fixed
> this for meta-freescale.

We already, globally, use uuid in WIC for root.  And in the case since
the kernel does it not mount, busybox isn't a concern.  We need to use
UUID more widely however for platforms such as minnowboard where we
might put the same image on SD card or USB (or SSD) where swap won't
always be /dev/sda3 :)

--=20
Tom

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAF1pAAoJEIf59jXTHXZSz5MP/iyUPhNqPqoRfgyi5glZ5drS
1js74z0bWNw4TP8uV9a08fwF4T7c3np0mBIi7h5IclbPGUl5Um32DbhtclKiPZwB
S0ltv3EGyHSFjmZo11wZhApIswd4OdEbdyDdtuWcViBz41vwv+iYGZteInmJzZid
NJnHQyreMlbzb0Qoj6Zm4NFhkSqc3gx6O2f4I48pzKdzmeE/b/QK4iA+hmSE6Zeh
S32L+41WVEgkFKAOfasreRtAo5YePk4b77gjxFwQiDhLU2KZDB4+OODwJz+qQaCd
5b8ZZuN1ktCpIPhHgX1bB+Cvs2T9cpxY0kzoRnMiFCAJxvlLvWCtpSKMQArxpF5o
I4KN2aGybWB1Zbw3+TA7wZ6z84pDuXcm6gv2yq8H9Xs0XalsdxQWHn1uJ+v0TyIz
RLsfKvxzb3JaljYNshO78xWdQyP78G8hl2dBIdNSkkXK07YcH8n+UT8J/NI1RSFw
utOLSeKNaiMjJQLSL8ELc0zoZngGYSgtKuhhIsCwXoXiUftAEk17IdqeLW+EzRiP
4AXFaG4WoN8jF3Zp/7NuO6E/ZbJWJVKmxiql962n7j8lXwq0y0pEfCuBpYVmYPGy
vw4TynvF6SBaSfykI+jEyYG/mV5+OitRQbm2nZwmilUN9G5dQ3YOqOYuunnzkJeX
KvBoxcjsPe7zzScezlcH
=oW+2
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
