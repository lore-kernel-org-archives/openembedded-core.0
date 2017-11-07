Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECFA78478
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 14:54:58 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id k3so11074879ywk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4j0PxjdzhlfY7nOdYv8mx1iCIe2bH0EwbdqJ6ntttGA=;
	b=pb/y1Lbze9I2dlfsJPXuZ4PdoHr8zFw2bkS3daeNnKnYvixymoPyxyL+RMAWdWAC9/
	taOOy8FVS0dQ6ijaSzoQv85qaqZ9PgVfogi3S42VOYC6vkaT7IpwMarGDc54y+Yr7Xq/
	4TuUZe0xjNfvHmXtfNCg+TFtIrUL5/uQnksUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4j0PxjdzhlfY7nOdYv8mx1iCIe2bH0EwbdqJ6ntttGA=;
	b=QhoSyTa3S1Z8BWbpz5X1h6ajzWSlKSI5PE1uK719swOfhpVg5LK2KBBG8ARI/fSO3s
	r+6AdvArdGBOHVzYw/5f89zRCfDWkethoBIwN07t8JyQQqiJ7wVKex018Tiwu+sKIGju
	vT+WW6Ze5qYfaYdQfsskmtMJQm6raE5K5VxHKhRHYS5FbIxt5ZhRcXoH347TPstNBY2d
	3jz2S4uhuwOMNh0dYzP0+9X7I7FIqFY7oNLXTIi8bjM1XbZ7iklIHnUWiTK0axquNpe+
	3RUWD6z303hhs82hX+Dqkmwo2kOC4o72U2OEWYYBdTrBIdgUwEOYh0ttjvaTv1z3Vw+/
	wIRg==
X-Gm-Message-State: AMCzsaWSH0O2FS32hLoEO3z3Gasanz8ChklyU27ejjJj3Dn/RIryDH4u
	lBZQKreZJPjFkmEax5Hoej+B2g==
X-Google-Smtp-Source: ABhQp+RX40eqPmybDSHUkf81Eb8g7eOZhOtlcM6miUxtasa0XFeHBDIFyROQWe093CCl9adCuhJehA==
X-Received: by 10.129.90.8 with SMTP id o8mr12410148ywb.384.1510066500194;
	Tue, 07 Nov 2017 06:55:00 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	k11sm718195ywk.91.2017.11.07.06.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:54:59 -0800 (PST)
Date: Tue, 7 Nov 2017 09:54:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171107145457.GJ32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
	<20171106124423.GG32663@bill-the-cat>
	<20171107081135.sqfjuwqw22tz46xw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171107081135.sqfjuwqw22tz46xw@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 07 Nov 2017 14:54:59 -0000
X-Groupsio-MsgNum: 104618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="etg/Ry6vb8quy2uR"
Content-Disposition: inline

--etg/Ry6vb8quy2uR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 10:11:35AM +0200, Ed Bartosh wrote:
> On Mon, Nov 06, 2017 at 07:44:23AM -0500, Tom Rini wrote:
> > On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
> > > On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.co=
m> wrote:
> > > > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> > > >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> > > >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > > >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > >> > > > When we have been told to use the UUID we should also update=
 the fstab
> > > >> > > > to make use of PARTUUID instead of hard-coding the device in=
 question.
> > > >> > > > This will make the resulting image much more portable.
> > > >> > > >
> > > >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > >> > > > ---
> > > >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > > >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > >> > >
> > > >> > > Where we did we end up with this?  Ed pointed out that you can=
 tell wic
> > > >> > > to use a specific UUID, so reproducible images are not a probl=
em.  And
> > > >> > > making images that are readily portable is why other distros u=
se
> > > >> > > UUID/LABEL and not device names as much as possible.  I person=
ally enjoy
> > > >> > > being able to put an image on uSD for minnow and have it work =
:)
> > > >> > > Thanks!
> > > >> >
> > > >> > ping?
> > > >>
> > > >> I was just reminded about the real problems this solves (swap isn't
> > > >> /dev/sda3, boot is being excessively slow), so, ping?
> > > >>
> > > >
> > > > I'm generally ok with the patchset. The only thing I'm thinking of =
is if busybox mount
> > > > supports PARTUUID syntax in fstab. Can you check this, please?
> > >=20
> > > It does.
> >=20
> > It doesn't, you need util-linux for a mount that figures these out (or,
> > it did when I wrote the patch set).

Let me correct myself here.  I think what threw me off for a moment
(since I hadn't picked these patches up in a while) was that busybox
mount might handle PARTUUID, but busybox swapon/off doesn't.  But that's
not quite the point, either.

> This practically means that this patch makes it impossible to use
> --use-uuid for busybox-powered images. This is quite a big regression
> from my point of view. We need to make this feature optional then.

How does it change anything at all for that case?  Today there's cases
where you would want to in some cases use PARTUUID, via --use-uuid, but
you can't.  --use-uuid is only valid for the root device as the kernel
handles parsing PARTUUID and our fstab only ever has /dev/root listed,
and all other entires in the table, even when we say --use-uuid, do not
use the UUID but instead use the device name.  Today, we only pass
--use-uuid in, in that case.

What 1/2 allows for is passing in --use-uuid for any partition and
having it be enforced.  There's no canned wks file changes made at all.

What 2/2 does is update the systemd canned wks (where you will not be
able to have busybox swapon/off, you're already forced into util-linux
for utils) to make use of --use-uuid.  I would strongly encourage this
to be applied as well as it makes systemd-based images much more useful
and does not change anything about busybox-only images.  It also allows
for external wks files to use UUIDs when they want to.

> >  That's why 2/2 only updates the
> > systemd canned wks as that _will_ have full mount.  But please note that
> > you can already make a wks file that doesn't work with busybox mount by
> > using the --use-uuid flag for non-root partitions :)
>
> What's the point of using --use-uuid for non-root partitions? I thought
> it only makes sense for root as it triggers update of kernel command
> line.

For the same reasons you want to use PARTUUID for the kernel.  You do
not know that you're going to be "sda".  You might be "vda" or "mmcblk"
or something else.  As a specific example, having "sda3" for swap in the
systemd wks file, but your actual device being something else, means
that you spend 90s during start-up for systemd trying very hard and
being mad that sda3 cannot be swapon'd (it will have swapon'd mmcblk0p3
already, automatically).

--=20
Tom

--etg/Ry6vb8quy2uR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAclBAAoJEIf59jXTHXZSAt8QAIZbcDxruruA5GaL64sKZRmo
4BxmJrZ03Njmr801OG/ezpPj0FyBjPss6kBbsWFxVn56KWvaxwoBjWgCM3xgw3Pa
89LQ4Yd+CrCPNPDC83DeatAvD6WBdR2CSq2Be4cAxa8MwilnEwAKaITeE/M5nnyE
nToDe3/Pr5x6JXDfKRlvDq1OMWgxp1DDFaqlPBBCUSoJzmAblrTLQUuAhmTtPdvb
BK3wG328j3/V5VoLI/8II1jZuV0ikwb4B3BWu4gslWr6CDSfu9diJ9Yar1jHRRXL
4ZiCxKm3SiHL7BRB0c2YaVSDMuR7eFRTWrumwxEi7rQd693Zk9t5bCfBJZc7lTAN
7veL9uDmwYkIvNkh2oKAbJdJ2oWLPlX+74Jxb6NhRJmqoZVuvtWIPwHAGcbvH2L9
INsYVs7f9HkbASeE86rZTqAZSgFZuOL6rDrbyePKZc/YEtK+X5GZ9JSfyVTAvUII
jIaWPQVtfvO2V183VEk3hPLuv7gVczvUAjb+pjdOMGqH4QfXUO2lEfuIt2KxFnCZ
3ZpQdxpVXb65axreUiLHUd8aA7DZedCiwkXrxay+B8g5cAVmU5HmTEKUVCei/jnB
+kUdupru2Z8FX3vycDsIbiG87qw5J1iPG7rLpmw647qqCVGF0XkLetaKp5Eb6+ks
/fzfpQZ+dtLkKZnLu52p
=LjDj
-----END PGP SIGNATURE-----

--etg/Ry6vb8quy2uR--
