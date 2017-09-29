Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 33A866059F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 12:35:38 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id s62so740205ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jq+b49mvGSbCSyfgA9jqfBEOQ8fiDXaWjXt3ARs9NGw=;
	b=BCbRVy4OjMs6EpMw6ubdp/j4z5QB8k0HMYpSXOa99vnQtX27kO6NLyVB4omHIpgzvN
	tnKPnTiVAOcPg4qzmfcM/N9P6dC0n3B2zXKoBzkNotz7td4kfzuv2wDLW4tEmawwiSdt
	ePo5YQQeRStgVthjSMlzR3LwyqPWHnCJbfyrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jq+b49mvGSbCSyfgA9jqfBEOQ8fiDXaWjXt3ARs9NGw=;
	b=Qe7ZG8+ISJjFYAtwHB6Nlc9p5j89J6bOrUY67G6NTMKloJ6dhEc9GIs5LmhUKfZhoe
	cot9w4A+Ng8e1CvBCMaqEgEz/s6aiZYLakzIFmeZ6UBAMXUBq9l4OeJdX19DwLJSscLi
	IRrqLaLzlchEgBnrNMgIxGnOwDjvmXrEi+rKs8+bBHlK5JexwuIXFi2aDtNllfYrTtnC
	3KfVetaSHExCfhqRqFJ+SOrw+IrAiRxRZsT/OD+zB0iwoLhGbwx7BdcESOqt+ni6QF+C
	J54PyEI1N7Ls8toIx0NBAjwULnORsUP8vk8IGaXam+5v9PAYI81tPVxIOtyQepuvMl+G
	E3XQ==
X-Gm-Message-State: AHPjjUh5FzJcakJBkFkF2fG0e7+cVhIlnRZdCBcw3aQygUs2yRDdoaci
	072QnyMTYv6Mc7uJnzkfXbFojw==
X-Google-Smtp-Source: AOwi7QDfuYZIcUlyIJRZZwXqknn5k2pu/+XmIeRSKpJmCk0Le8pHkUIcAtxzLVa9Q2DIGwfulB9WIw==
X-Received: by 10.129.81.80 with SMTP id f77mr6256683ywb.104.1506688539912;
	Fri, 29 Sep 2017 05:35:39 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:59d1:1e23:9925:e8d6])
	by smtp.gmail.com with ESMTPSA id
	z77sm1695567ywd.31.2017.09.29.05.35.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 05:35:39 -0700 (PDT)
Date: Fri, 29 Sep 2017 08:35:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170929123542.GU3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<20170929112757.xrhavs2uctb6iog7@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170929112757.xrhavs2uctb6iog7@linux.intel.com>
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
X-List-Received-Date: Fri, 29 Sep 2017 12:35:39 -0000
X-Groupsio-MsgNum: 103505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pE9oldV/ca00Larp"
Content-Disposition: inline

--pE9oldV/ca00Larp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 02:27:57PM +0300, Ed Bartosh wrote:
> On Thu, Sep 28, 2017 at 01:44:29PM -0400, Tom Rini wrote:
> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> > > On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> > > > In the case of non-wic images there is logic today to generate a
> > > > startup.nsh file that will be executed by EFI to run the loader tha=
t the
> > > > image contains.  In the WIC case is currently depends on that file =
being
> > > > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
> > > > present there.
> > >=20
> > > What's wrong with this approach?
> >=20
> > No one ever provides a startup.nsh and everyone that wants one creates
> > the same one line trivial example.  The end result is that no WIC images
> > are Just Bootable on UEFI systems unless you first go and spell that out
> > as the desired booting device.  This isn't an awesome workflow which is
> > why the non-WIC cases make the required startup.nsh :)
>=20
> Would it be better if EFI providers create this file?
>=20
> I still believe that wic should't hack the filesystem content unless
> it's really unavoidable. So far I know only one exception: updating
> /etc/fstab. And even that is not always needed (see --no-update-fstab
> patchset for further details.)

Well, it depends on your view of who is supposed to do what.  Today, in
wic BootimgEFIPlugin mirrors the efi_populate() function of
systemd-boot/grub-efi.bbclass.  That's where startup.nsh is made because
it needs to know the name of the EFI application (also technically the
path, but EFI\BOOT\ is spec mandatated I believe).  So we can't
easily make the deploy functions create startup.nsh without duplicating
logic from the bbclasss.

> > > I'd be happy to make wic to do only partitioning and assembling the
> > > image and avoiding to modify image content as much as possible.
> > > That would make wic design much more clear and let us to remove
> > > a lot of duplication between wic and meta/classes code.
> > >=20
> > > Regarding boot partition content, I think preparing it from bootfs
> > > directory the same way as it's done for root partition is the way to =
go.
> > > You can find more details about it here:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10073
> >=20
> > I don't conceptually see a problem with going that route.  But today WIC
> > images aren't nearly as useful as they could be, with a rather tiny
> > change.
>=20
> If we agree that wic should avoid modifying content then the obvious way
> to solve this is to provide required content (startup.nsh in this case)
> either by EFI related recipes or core classes.

Maybe I have to change my mind after thinking harder :)  Where's the
logic that creates the boot partition now?

> > My patch is also a regression-fix, I believe, in that at some point in
> > the past, when Christopher's patch went in, things were laid out such
> > that startup.nsh was often/always generated by another class and placed
> > where WIC would find it and copy it in.  At some point that was
> > broken/changed, and no one noticed / was interested enough to fix it.
>=20
> If this functionality is covered by wic test suite this wouldn't
> happen.

Once we agree on what the fix looks like, I'll see if I can figure out
how to add in another test. :)

--=20
Tom

--pE9oldV/ca00Larp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzj4eAAoJEIf59jXTHXZSWG4QAJ0lGGNGkRUmNz9gV9U4oMcX
SioeZoBUj061T6z5Kuww+Um1v5IKujdVuB0YHgax1ATdnZcNFxTsvoIEFpLWFWQz
yKtWPkzqn6HLXwTo0e2+2QwtWhW2FqO5Z8havDP0wlPDWSQywfBe8rKLEakaZvKz
NUwjRxJ/uumcc0p5IQGq2QvTnu9k7AzvwwNDrJwMhP2Wg23T5fic6LurbtEQ5x4j
b976NNQopCIsW2fznyH3H3JnjEPTbuTM5bOoqm9RV0Ue0vRRrF8VV6nqBRCAn2I4
pgxrrR/iDQxzld2tLaNynGs3jxNTQMfkNspsQiezhEwP5Tz5C6qhHmrzBuAxd/5N
JqiPGkwtUvtxIJsgwxpV80V/TxFdu01g4pzmKt4pUznwNFNfsb5pZtmfLXvOeuUE
FoaTAGxxoVmWuv58g6GbxPQq3I10WKw0PkD5CT/FTFsFacZ3q4DqAFzNv8vjMGs/
AQdKmjVqO82Q/+kgpRbkdxXTQuMPzyy42F17QqXxJhRQ4CQacV4ePpZqlIFFzXg0
kFumtxFwVn5neCT3S3/ChTfkVxHxZsJHTP3Bp3SJHs1yj9Oy89AKefSXm4R+E/sd
Lfu/WPsdbuelVH+1OXMJ59arRCuy2fMEmQzd3gX1INToaEkd/rvcWiBVbnMYHA0/
dqTh9yObU6zh2fP5+EwX
=Ey0S
-----END PGP SIGNATURE-----

--pE9oldV/ca00Larp--
