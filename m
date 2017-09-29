Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 91A077782F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 13:50:17 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u11so882567ywh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=skmwUe5WpgYL4n840vpJiD/N+wGwJliPTltQnUlscJs=;
	b=Ybv3dhUdEyoW2bUmKjDE54Rg9RW+kLKODrFo75hPbNLl1iqepOUCD/Ud86/xyHviQh
	+/F2XPX9bBjVYybQY8bT45E/DotYNVzZuTSbhxugTIZYILLhyKWpOY8LZjzHz7UA7y27
	1my4I+W/EoXqGvaFoghgsY1XOu/cyIcC2jEYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=skmwUe5WpgYL4n840vpJiD/N+wGwJliPTltQnUlscJs=;
	b=se3GRgGrtZEikCzh21TKErI9p/PqfnHHgOjkkmL3wN5Il0ADZsWPWfIB99nl5jUjUV
	u6aZb5HCw70PHzHhw3FQxHWqbZ6Sh2+7RyTHrd4nibL8egonmzX/ao7sxN9NOBvIYSg4
	Xachno5ilOvHRfAgopAppC0nR10rOY18eJWuatZC0AYJilrbqmXWgXraXavRj5HOElLw
	8mUI62fS+8pAeT1ePEeQGv6QJKEnAfXYATiFbhg+d23E2eemolxHAvhNO288kR7dTR9q
	3vQOExOwlG1HWt7rRwwjG6lTOgdfl/uD7pmKRS56pwC80XJuItJu2ZeMa4Tt1TYk0t4e
	ak9Q==
X-Gm-Message-State: AHPjjUiD9m2AFm9WPYEkB4sJ9Gja2gxzQGj6/ljquYFtnhisbFpq4iFa
	BtheuMZsDTDbzaNa3pbsa5ePBg==
X-Google-Smtp-Source: AOwi7QDbG5RG0P/kaBze5TEkt24eir0mASrNxM5io95o+rMw0wfkj23+aXRr/LHDjW3mRUHwrsvG1Q==
X-Received: by 10.37.198.214 with SMTP id k205mr6318626ybf.14.1506693018170;
	Fri, 29 Sep 2017 06:50:18 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:59d1:1e23:9925:e8d6])
	by smtp.gmail.com with ESMTPSA id j6sm1700712ywg.44.2017.09.29.06.50.17
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 06:50:17 -0700 (PDT)
Date: Fri, 29 Sep 2017 09:50:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170929135020.GX3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<20170929112757.xrhavs2uctb6iog7@linux.intel.com>
	<20170929123542.GU3112@bill-the-cat>
	<20170929134454.w4hm54uvbjbpwmba@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170929134454.w4hm54uvbjbpwmba@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Fri, 29 Sep 2017 13:50:17 -0000
X-Groupsio-MsgNum: 103512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6+lUPd1XOsaFBch"
Content-Disposition: inline

--L6+lUPd1XOsaFBch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 04:44:54PM +0300, Ed Bartosh wrote:
> On Fri, Sep 29, 2017 at 08:35:42AM -0400, Tom Rini wrote:
> > On Fri, Sep 29, 2017 at 02:27:57PM +0300, Ed Bartosh wrote:
> > > On Thu, Sep 28, 2017 at 01:44:29PM -0400, Tom Rini wrote:
> > > > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> > > > > On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> > > > > > In the case of non-wic images there is logic today to generate a
> > > > > > startup.nsh file that will be executed by EFI to run the loader=
 that the
> > > > > > image contains.  In the WIC case is currently depends on that f=
ile being
> > > > > > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only use=
d if
> > > > > > present there.
> > > > >=20
> > > > > What's wrong with this approach?
> > > >=20
> > > > No one ever provides a startup.nsh and everyone that wants one crea=
tes
> > > > the same one line trivial example.  The end result is that no WIC i=
mages
> > > > are Just Bootable on UEFI systems unless you first go and spell tha=
t out
> > > > as the desired booting device.  This isn't an awesome workflow whic=
h is
> > > > why the non-WIC cases make the required startup.nsh :)
> > >=20
> > > Would it be better if EFI providers create this file?
> > >=20
> > > I still believe that wic should't hack the filesystem content unless
> > > it's really unavoidable. So far I know only one exception: updating
> > > /etc/fstab. And even that is not always needed (see --no-update-fstab
> > > patchset for further details.)
> >=20
> > Well, it depends on your view of who is supposed to do what.  Today, in
> > wic BootimgEFIPlugin mirrors the efi_populate() function of
> > systemd-boot/grub-efi.bbclass.
> I'd call this unnecessary duplication. This content should be prepared
> by EFI provider class or recipe and taken by wic as is, without
> modification.
>=20
> I did some work on this: http://lists.openembedded.org/pipermail/openembe=
dded-core/2017-May/136656.html
> If this or similar approach is accepted wic wouldn't need most of boot
> plugings. Boot partition can be prepared out of bootfs directory using
> rootfs plugin.
>=20
> >  That's where startup.nsh is made because
> > it needs to know the name of the EFI application (also technically the
> > path, but EFI\BOOT\ is spec mandatated I believe).  So we can't
> > easily make the deploy functions create startup.nsh without duplicating
> > logic from the bbclasss.
> >=20
> > > > > I'd be happy to make wic to do only partitioning and assembling t=
he
> > > > > image and avoiding to modify image content as much as possible.
> > > > > That would make wic design much more clear and let us to remove
> > > > > a lot of duplication between wic and meta/classes code.
> > > > >=20
> > > > > Regarding boot partition content, I think preparing it from bootfs
> > > > > directory the same way as it's done for root partition is the way=
 to go.
> > > > > You can find more details about it here:
> > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10073
> > > >=20
> > > > I don't conceptually see a problem with going that route.  But toda=
y WIC
> > > > images aren't nearly as useful as they could be, with a rather tiny
> > > > change.
> > >=20
> > > If we agree that wic should avoid modifying content then the obvious =
way
> > > to solve this is to provide required content (startup.nsh in this cas=
e)
> > > either by EFI related recipes or core classes.
> >=20
> > Maybe I have to change my mind after thinking harder :)  Where's the
> > logic that creates the boot partition now?
> >
> Now it's in several places: in meta/classes, efi recipes and wic. I
> think wic should be removed from this list. It's not a wic job to prepare=
 boot content.

OK.  I still argue this is a regression from previous, but I'm also
willing to set this patch aside in favour of the larger rework that's in
progress, thanks.

--=20
Tom

--L6+lUPd1XOsaFBch
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzk+cAAoJEIf59jXTHXZS4G4P/3MiZbkqKZ13AgIa/T4rHW7y
APZE7Pha76R4nYmEyZcWYwOfxq5yMqPuDjcuNmetIviDIr0ev/LD8I/v73rk6ARj
pxbpK3crWANaDQuAh9/eYFCFjoaZfymu0M0+IOzkdoMYxBWeA7d9VbJE6JXIN8Il
Elzc/WnFfNFyMHEnNwCipnTjEuvpbFUZtqyOBt11zOBF6xxdKDqVnDh7NGRrgIuY
mAXZaiFWToJ5Q1qwliZsHUv618NX1sFlKUDhBEDlQ6JJ7QdwVHy2T3p3QTLpauN3
p/QQ+iBjN7K/19GsQi31+piv9U2GaR2fuvnkPL5kt4SIRnv462DQf5OJpFMOao3u
V66QCxchJQNj+JMPrr6dMyfIpRhmmp+G1+Uve5Gi4x1dI1OBekHiNr0mBJ+J7fXw
Kg9A1zBldh3jaOAhb0P5iX9YBU0dVVmS2QZgACCIT8jJhMTvQfYNc9UxpaQRYMaN
magZGdBOK3pT1fc/4GNHX3QefXVK7yKFRBxViDIA1hn8DIeef2S0R4GfCArb37B6
mGPnXOuxg2ULwlR6JEkTUXr9TJxJPYoNU/T3m072TEZjl6B4EIun+41rwpBs56Gd
w9ZNCUTHuH6E3rwEbU+QMVMDkWyDlhEzJ9z+miYrNxoMZWirtecKW3Q5yFAgt/mF
oEWY3qblE01B84/n8EuZ
=/2XD
-----END PGP SIGNATURE-----

--L6+lUPd1XOsaFBch--
