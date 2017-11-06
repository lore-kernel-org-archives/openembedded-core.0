Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9397843F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 12:44:19 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id q1so7659513ywh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 04:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KLsB3ZGlXoC3AoOVZOXzOc/Dyv00ZDItFTZqS+IOdys=;
	b=joqHR4SBQVFuyoSLHE552xIocz/2E2lKJJfRHmr6IV60bsHB36HUtCxTQpSC4XX9+p
	uGBLFF2nGQzUrOGgQaSvule32qlVhCXjT4786ZfEs+D6u7hTOfbTPpcZgqAbOehpgq+5
	h0MDZgd2wa47IgBwsnkpfkUZIhHhVhMRt/Wc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KLsB3ZGlXoC3AoOVZOXzOc/Dyv00ZDItFTZqS+IOdys=;
	b=CSVEhM8Y5ycYZEL2YLM+ucXQc4RzeefccVgEowDGQtMN4hoy1JrJM+2ZuXH3Knr5fM
	D7wCnSUsLyxF5NBDajMWYfGV5JXCT/4lnoaZsc32M3JCna9tB1suxSlOe4PpLDaNQqTf
	YHf7MZSqg4Fza/GzpXMWz9wDZ9BixqFKNp6Ji0nPF7on1AU5NPumMjnAkhzvvTblMwvG
	h1MVpxnUYqc9zgj9gGJQuXTma39opUPJPQQyoT03esGJyy+Hqg/ZLe6yrUOoQFmJi+W9
	q3VQ5YlBVhC76l6qoLnXel6uoireM65dtjaaLhsadROukvCU1pR+nQNJuTUghj+IMFIg
	rxKg==
X-Gm-Message-State: AMCzsaUtNAxw0G8a9dTgT+Q2NE47SIYHwwbisWnmlYs+unnZuVHSRnyV
	MsnNrygcn+21xtG3YgF6xwb8hpQTkkQ=
X-Google-Smtp-Source: ABhQp+TB9pk5cbKGpAuu9Em87cydyGpo+KxBtOHYRwToCccLcwDmNOCJ8qojSx4vVU6YBtUVcMW7Uw==
X-Received: by 10.129.99.85 with SMTP id x82mr9509445ywb.225.1509972261013;
	Mon, 06 Nov 2017 04:44:21 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	w6sm5927900ywe.52.2017.11.06.04.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 04:44:19 -0800 (PST)
Date: Mon, 6 Nov 2017 07:44:17 -0500
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171106124417.GF32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171106100829.nqhna6hugyqe636k@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 06 Nov 2017 12:44:20 -0000
X-Groupsio-MsgNum: 104579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline

--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 12:08:29PM +0200, Ed Bartosh wrote:
> On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> > On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> > > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > > > When we have been told to use the UUID we should also update the =
fstab
> > > > > to make use of PARTUUID instead of hard-coding the device in ques=
tion.
> > > > > This will make the resulting image much more portable.
> > > > >=20
> > > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > ---
> > > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > >=20
> > > > Where we did we end up with this?  Ed pointed out that you can tell=
 wic
> > > > to use a specific UUID, so reproducible images are not a problem.  =
And
> > > > making images that are readily portable is why other distros use
> > > > UUID/LABEL and not device names as much as possible.  I personally =
enjoy
> > > > being able to put an image on uSD for minnow and have it work :)
> > > > Thanks!
> > >=20
> > > ping?
> >=20
> > I was just reminded about the real problems this solves (swap isn't
> > /dev/sda3, boot is being excessively slow), so, ping?
> >=20
>=20
> I'm generally ok with the patchset. The only thing I'm thinking of is if =
busybox mount
> supports PARTUUID syntax in fstab. Can you check this, please?
>=20
> I'd like to see Otavio's confirmation that --uuid option solves
> his reproducible builds concern.
>=20
> Can you rebase your patchset on top of current master?

Yes, OK.

> It would be also nice to get this functionality covered by tests.

OK, but what part of oe-selftest, and how exactly?  Can one easily check
the resulting fstab?

--=20
Tom

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAFkhAAoJEIf59jXTHXZSz0sP/2zEUtvd9SbM7/xAJjSCxrIU
ALAG1fTVfuc8KxFcA/pJ0sRVxKdFTG2VP2O4hT4s1/fQNLvXVUsyH7RA5Yr3is13
AcVYheePg69KEilWywDsBWpzRwFWDEY1WPWU1y+SNYyJSe8ndT3EH/5uH6qC1DG5
ynZCRJ71ZlZnKGHJfq/jaqTou6/AGG6aWj0VL8kYO6njxoE9S0qlZi2janDZHngh
pWvp6SLgokdBAbUEsXCdfAlgvKiE5oXV0Li1eV4wea/WerF+9FJ7TfPUwnAV8/A6
7cL3644MWFY4nwB2GcGVKUwP6PjjdQb1q/BtDtfLYurCeG5zgE1iLR9Tff1pRYAX
mcAQ3s5d8JgnKilvhRmx0iujSI9NgiJ1V/kZkK6a7j6IazMxbfurzE553KvyaRg+
EkwcTP7X4xdGeNmNytUAA/grjB1j80oryUCW7J5eFw29ZrSjT45UHrsu7TemJZkj
ZDuQNOBlQL67POQizYrJnveiWDzDvr2E/a0e4CEYJnHGTotBReJ1jrLekEQvgY8J
juzmkdWagY/Uq+KDNL7RrMq3YlgTvOoKo0i/iPx1w9c8bXpn/2ZkJmW5jWxhODU+
9VDlW/yXLDjP0am/D0n47+cAz0R1h4KnKVd8klIkhky9Vq4+wEB5PSJl+A9oRWWM
rCS7Txb6LR/rP5gufpEZ
=lpge
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
