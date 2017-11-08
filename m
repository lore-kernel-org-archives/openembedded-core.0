Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4267826C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 15:00:59 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id w2so2505765ywa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B5Nm+K73yFmrJKa9fiYMsi/yGbMQp0TBqJl4XGBo8mo=;
	b=Npm8wj3rAZmGYP/KQxcKOnCvj+MzESLb7F5TzKagtPubmGtU7ihbFs4oY8fpStRUrM
	BUjZcRdDXVwnnqmS89rGr8qpFqJWzefeplhjIC6o4zpTMyNtcO4diMp7P0tjQA64TzKb
	FDXZKVL/e8C6cCu7GujIwNtKAxQ4rgo3HlSxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B5Nm+K73yFmrJKa9fiYMsi/yGbMQp0TBqJl4XGBo8mo=;
	b=hcVLT97FZ1c7gHjYSJkQ27r5JbQPbk8gMD0TZCziTcyPyliy5CS7ldwzHXaWvFK5ln
	anuDjRLeMqwBu3T+US+sDIphLW+eoOukZQ+CM8Sq9leND3l8UtI1x06TZwMNS53oO3hR
	OTuHrGO1Zsob22Vtl2+G5OoHaFEzq1u103GA0FAzZUhmVpljm7ZOaXC/4bsepT8wnK09
	75XlAlPwHS2qsgQqcC1WbxZWRLVG3YAdHBBHOfNATxz9peZ3EUwgTPYvoJsbmvwqEsNy
	iesxy58XXzhSTwdPeQY/FcSZvC5DobE2RiGyhNk7+sOox51lyGuDJClch2N3QnBMrZtO
	NbNA==
X-Gm-Message-State: AJaThX6x8iubnfhjZA2u5XuBu8tXFTzetj8JtmmEM7B/Y0lOWt6m+sv/
	hmSHfv+8/7Ed6Kb276kBf6isj5oNop4=
X-Google-Smtp-Source: ABhQp+RPJnrP6WxiU3xu/UIOjbwWqy8oQeIVywwhmMr/fJAjwiznxZ3gk+NuKrRICLc2C3eAwS7n8w==
X-Received: by 10.37.176.136 with SMTP id f8mr67882ybj.280.1510153258951;
	Wed, 08 Nov 2017 07:00:58 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	p68sm2128852ywp.104.2017.11.08.07.00.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 07:00:57 -0800 (PST)
Date: Wed, 8 Nov 2017 10:00:54 -0500
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171108150054.GA27034@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
	<20171106124423.GG32663@bill-the-cat>
	<20171107081135.sqfjuwqw22tz46xw@linux.intel.com>
	<20171107145457.GJ32663@bill-the-cat>
	<20171108112015.cmpqa4qyx7zze3ou@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171108112015.cmpqa4qyx7zze3ou@linux.intel.com>
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
X-List-Received-Date: Wed, 08 Nov 2017 15:01:00 -0000
X-Groupsio-MsgNum: 104663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 01:20:15PM +0200, Ed Bartosh wrote:
> On Tue, Nov 07, 2017 at 09:54:57AM -0500, Tom Rini wrote:
> > On Tue, Nov 07, 2017 at 10:11:35AM +0200, Ed Bartosh wrote:
> > > On Mon, Nov 06, 2017 at 07:44:23AM -0500, Tom Rini wrote:
> > > > On Mon, Nov 06, 2017 at 09:36:20AM -0200, Otavio Salvador wrote:
> > > > > On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.inte=
l.com> wrote:
> > > > > > On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> > > > > >> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> > > > > >> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > > > > >> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > > > >> > > > When we have been told to use the UUID we should also up=
date the fstab
> > > > > >> > > > to make use of PARTUUID instead of hard-coding the devic=
e in question.
> > > > > >> > > > This will make the resulting image much more portable.
> > > > > >> > > >
> > > > > >> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > >> > > > ---
> > > > > >> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > > > > >> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > > >> > >
> > > > > >> > > Where we did we end up with this?  Ed pointed out that you=
 can tell wic
> > > > > >> > > to use a specific UUID, so reproducible images are not a p=
roblem.  And
> > > > > >> > > making images that are readily portable is why other distr=
os use
> > > > > >> > > UUID/LABEL and not device names as much as possible.  I pe=
rsonally enjoy
> > > > > >> > > being able to put an image on uSD for minnow and have it w=
ork :)
> > > > > >> > > Thanks!
> > > > > >> >
> > > > > >> > ping?
> > > > > >>
> > > > > >> I was just reminded about the real problems this solves (swap =
isn't
> > > > > >> /dev/sda3, boot is being excessively slow), so, ping?
> > > > > >>
> > > > > >
> > > > > > I'm generally ok with the patchset. The only thing I'm thinking=
 of is if busybox mount
> > > > > > supports PARTUUID syntax in fstab. Can you check this, please?
> > > > >=20
> > > > > It does.
> > > >=20
> > > > It doesn't, you need util-linux for a mount that figures these out =
(or,
> > > > it did when I wrote the patch set).
> >=20
> > Let me correct myself here.  I think what threw me off for a moment
> > (since I hadn't picked these patches up in a while) was that busybox
> > mount might handle PARTUUID, but busybox swapon/off doesn't.  But that's
> > not quite the point, either.
> >=20
>=20
> Just checked it out with core-image-minimal:
>=20
> root@qemux86-64:~# grep UUID /etc/fstab
> PARTUUID=3D452e020d-01	/boot	vfat	defaults	0	0
> PARTUUID=3D452e020d-03	/mnt	ext4	defaults	0	0
> root@qemux86-64:~# mount |grep mnt
> root@qemux86-64:~# mount /mnt
> mount: mounting PARTUUID=3D452e020d-03 on /mnt failed: No such file or
> directory
>=20
>=20
> It could be that busybox can be configured to do this, but at least curre=
nt
> oe-core busybox doesn't understand PARTUUID syntax in fstab.

More clarity required then. :)  busybox mount does support LABEL and
UUID (filesystem UUID, that is) but not PARTUUID.  The kernel doesn't
support LABEL nor UUID (that is to say, root=3DUUID=3Dxxx works via
initramfs when it's used in other cases).

But the above leaves out one use case, and it's the one that got me
started here, swap.  busybox does not support UUID nor PARTUUID in
swapon/swapoff.  It's an additional feature to have it create swapfiles
with a UUID at all.

> > > This practically means that this patch makes it impossible to use
> > > --use-uuid for busybox-powered images. This is quite a big regression
> > > from my point of view. We need to make this feature optional then.
> >=20
> > How does it change anything at all for that case?  Today there's cases
> > where you would want to in some cases use PARTUUID, via --use-uuid, but
> > you can't.  --use-uuid is only valid for the root device as the kernel
> > handles parsing PARTUUID and our fstab only ever has /dev/root listed,
> > and all other entires in the table, even when we say --use-uuid, do not
> > use the UUID but instead use the device name.  Today, we only pass
> > --use-uuid in, in that case.
> >=20
> > What 1/2 allows for is passing in --use-uuid for any partition and
> > having it be enforced.  There's no canned wks file changes made at all.
> >=20
> > What 2/2 does is update the systemd canned wks (where you will not be
> > able to have busybox swapon/off, you're already forced into util-linux
> > for utils) to make use of --use-uuid.  I would strongly encourage this
> > to be applied as well as it makes systemd-based images much more useful
> > and does not change anything about busybox-only images.  It also allows
> > for external wks files to use UUIDs when they want to.
>=20
> This makes sense to me. The patchset doesn't introduce regressions to
> the current functionality.

Agreed.

> It would be nice to at least try to make it
> working with busybox-powered images though.

I'm not sure this would be worth the effort.  Given what I said above,
I don't think it's possible.   We could introduce enough logic to say to
use PARTUUID for root, call out to blkid to get the filesystem UUID and
use that for most filesystems, and then still have the busybox issue for
swap.  PARTUUID is always going to work, with a full util-linux.

> If we can't do that for one or another reason we should at least mention
> it in the documentation and wic help. Please, include this into the
> patch.

OK, I can add a little verbage to help.py.  Is there work that needs
doing to the yocto docs repository as well?

>=20
> > > >  That's why 2/2 only updates the
> > > > systemd canned wks as that _will_ have full mount.  But please note=
 that
> > > > you can already make a wks file that doesn't work with busybox moun=
t by
> > > > using the --use-uuid flag for non-root partitions :)
> > >
> > > What's the point of using --use-uuid for non-root partitions? I thoug=
ht
> > > it only makes sense for root as it triggers update of kernel command
> > > line.
> >=20
> > For the same reasons you want to use PARTUUID for the kernel.  You do
> > not know that you're going to be "sda".  You might be "vda" or "mmcblk"
> > or something else.  As a specific example, having "sda3" for swap in the
> > systemd wks file, but your actual device being something else, means
> > that you spend 90s during start-up for systemd trying very hard and
> > being mad that sda3 cannot be swapon'd (it will have swapon'd mmcblk0p3
> > already, automatically).
>=20
> My question was about the current functionaily, i.e. without your patch.
> With your patch using --use-uuid for non-root partitions started to make
> sense.

OK.

> P.S. there is a bugzilla item for this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11525
> please, don't hesitate to comment there.

I've grabbed the bugzilla entry since I'm going to push this until it's
done.  Thanks!

--=20
Tom

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAxwmAAoJEIf59jXTHXZSbG8P/0+UQd8KfIr0i09xotlPIbk7
4/ID5VJMcVen70hleF90t8ULZEbIWkrvK52L8CDb9/Ts6IsQEhZy24zwAd0JF1ma
REqkoqFrp8cqi87hEsRUFLWBOZ3cZgAAuL9j3YyYQtK9ZZVKOLi8ik21letnug6d
4z6Rbs9RW9A/kXQZAdBq22KZRvNB5vkvIl+4eRy28BzyxmEux+pKhKhDT2zNMCux
PirARIzSjhqTk/+6hxkQN2luKOVh3oZvyGbVlHOatUgnurZwXi+jy+osPnYwe8MJ
8cfSgQU55XjjZlfFI8P/nANvvkzMD4t8+FMqrMMFsAMPKl07d/1X/h0xpRDZqy3R
XlGbhfmyc2th9MtxCwWI/fOSQXOYnLORsbri6rVmNJpnt4/wFnJ/qMu81lqdUXuP
2yjYDg501hWWAbeVE+ugIXP0GjrltKmCzM0zQnqbwMzTLiZzMwLGsapGNu5mHSZ3
ZKNVs12FxyQbMslHwvK8BEgvWyvA+1bgyjzyOzgfnVAxkQPQa2TIaOSh1v+bBf0D
PfCszXOKqPCkvIwQGBpf8MNo7HNIB+cR5JomzmYgow7vrDJXX71WVlmCVnXcaP8A
B/U+vuYEtJYe4kI9vVL1L7ZE/DoA1hrfRi0jqMZBBKIFaBQihq7L8o8IISCeFItx
w11AOdMetAk+L049Gdv/
=1B52
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
