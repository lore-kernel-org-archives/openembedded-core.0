Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id F07DE78221
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:09:39 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id u207so23809735ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 04:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XMBSrLwplE4aR4v1ApX3tuZ/+KjH5HIQSGuzXDyXYoM=;
	b=CwpH+RYWT6EstTNnZwsa6X4qbjKs4yrUY6PfxiHWFwYdyP/v3DCTSXtNhi7wk29EE2
	qWrB0AbDwfwMZOhLcBEYZawcrmOoZnI8eyAYTFjnSzVQ4azWrV3S6D4gUOL5nRW9MK3i
	WmfVhyBNtyOtdOsLuPv5fQo5Fkk6J+J/ctlx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XMBSrLwplE4aR4v1ApX3tuZ/+KjH5HIQSGuzXDyXYoM=;
	b=fx6S1WPV2ry/yOcqi5yWkTBaOY6EpRwrQOsdiblkBxjlL06dEIUvfJoIP/kv/NL7yM
	2MaQiJg29c1DjxkoeJEK6zvTVv8YAPd+SNA7fi6dFf+u679pHJMdb94QD8pC24viNXge
	Ee4caIb2RV2HWePrVUP+F1klLD6TFGAgwhIjeo0ASgfZoX7SDPRSqDneX+kRACu+Ubwf
	q77QONudqSSw3tj3jrfctL51KcxTbry0wR1j4LREvVhQetvTqg20jxwryZSwzez9i4vp
	yeIvwPwFH9Ews8I3YBOlqaNw+hEOXOo8DdwpAoJSwWBHs2mSXD4UtmzmKRxtwc1TjDYc
	MM5g==
X-Gm-Message-State: AIVw113eVjSpi+rIzuKHG5sxiV+iQcVYrMZcvgxycN4/hVut9Owje4In
	tXNZNQPxy3yfTctW0nwZAQ==
X-Received: by 10.129.193.65 with SMTP id e1mr459156ywl.256.1501067380211;
	Wed, 26 Jul 2017 04:09:40 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:e405:ea54:38bf:4644])
	by smtp.gmail.com with ESMTPSA id w11sm178022ywc.93.2017.07.26.04.09.39
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 26 Jul 2017 04:09:39 -0700 (PDT)
Date: Wed, 26 Jul 2017 07:10:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170726111057.GC26163@bill-the-cat>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
	<20170726071639.GA13291@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170726071639.GA13291@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Wed, 26 Jul 2017 11:09:40 -0000
X-Groupsio-MsgNum: 100731
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="beyCpKA84xV/nXfr"
Content-Disposition: inline

--beyCpKA84xV/nXfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 10:16:39AM +0300, Ed Bartosh wrote:
> On Fri, Jul 21, 2017 at 06:06:33PM -0400, Tom Rini wrote:
> > When chaining of compression/conversion types was added, we had a new
> > way to handle doing things like "ext4.bz2.sha256sum" or
> > "ext2.gz.u-boot".  However, because the U-Boot image class isn't
> > included normally, it wasn't properly converted at the time.  After the
> > support was added the "clean" argument that the .u-boot code uses no
> > longer functions.  The fix for this inadvertently broke chaining
> > compression/conversion.  First, correct the u-boot conversion code.
> >=20
> > Fixes: 46bc438374de ("image.bbclass: do exact match for rootfs type")
> > Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Patrick Ohly <patrick.ohly@intel.com>
> > Signed-off-by: Tom Rini <trini@konsulko.com>
>=20
> Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>=20
> Any chance to have this functionality covered by oe-selftest?
> That would help to ensure it will not be broken again.

Give me a pointer to adding stuff to oe-selftest and I'll take a look.
Thanks!

--=20
Tom

--beyCpKA84xV/nXfr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZeHjBAAoJEIf59jXTHXZSuooP/0LNb9Fl6UiLRBssa5LZ7xjt
ei5tBrVIv65pu0wJwKovXW+Wa85lpXVqG8n7crzr6HgNFO7RzY5dqIoH4zQYkTDW
yFMVw8H+xdfQu0RN9VKM3BWS3fUVgJ838wzDa9erSWz9HagKHhynz744RqA9xsJr
SXbYeFJ7k0vulbLa6lUn3g9Bxzpb+tSkSbvaSWZ4Dmd796Ak0WnGrhMAADVE5T9p
8YfiiKvHZ62VU/x1hTElN80SveeJ2GLQVhqVBsrCpM3bNX6qsgKa2HfZtyPqDO5m
YlFXlZmAUsie6FE1IMUzx++DvzzL9EcGIxNQwHKIYw5njOR+z43t9KLwfcW8JjM7
dzWHd5I3kQROu2gbxrvncjgOM2yD+Il2dGZBpC5/VUz764gLYzMfhF/D63kSiSMF
x5wwd5xZALk61OwKF9WgGFZ25QD5eGmuTzIS4EQ7/XW4LvnPQ18Cl2VVe+eXm9Ci
fiPlpq//cXwHsaDei3N1Jvw4cGJ0hmnkaHTAwwVxk+N8w1UT90+m/ZvfL9y6nfzk
ntz4QcF28u4TxLEUBcNGxvl61WNFZM+zgN2XPi25WZRVF2/ClmBZ9FILqE0A9+q1
kZNgpeJ16MACNKdsknnVHWuMlnCS6egpbDj637ofk/jHJxP2t/I+tzL4BmVh//Cs
aZkXs1sYGl1rD8DPPTUG
=Tlec
-----END PGP SIGNATURE-----

--beyCpKA84xV/nXfr--
