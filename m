Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id C098D771F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:44:29 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id q80so1551000ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l0xgIUp/4CUbfAzg/ar5J8lzvnN/rULuGkMrhNeHbHc=;
	b=DJRDo8d3pwk7F3/l/73kXcU1eEb9ysG4J6/TnjMCGk+BKDsYK7pkhSC/Mgn/GSw3Os
	MxNkbIjg/pHCdUFpgQeVysyo9TMVt8fU9/nm5pyC03tme/Zkhtx5+l8yyec9p3v82l2G
	hkIAtlPAN5Fq6CBLxn6/Bn0P7aliB8kyr0ghU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l0xgIUp/4CUbfAzg/ar5J8lzvnN/rULuGkMrhNeHbHc=;
	b=FEEbJC4nmKPbf3CIeNXL+UqBTyetu+95wCx+EsQAIQBePafXwYuG7cu0Nov7cq0p3Q
	7jHbDs9o85b6vC1eox0HWkTKkLMx7uSPE74vVY/2/VQrdHKBnNR/jBKCc7slIoQC41b5
	szWVXJPnfaBhEb95d7t0ogXqMouzO4g2JiLqnRLoOJzuHsmpzR6MTiE5ezhbISuf7nfi
	oWMP75p+DNM0BddNa5fsU7riNuTRLpn353IsLwSaOZbIm9u6GonMb00Ur8TMUJMPbCMs
	SBoYoFct1UExGdelkW4yyr/Jn1nqS5U9zbNmMD718OcsQ0nENlQgCKLG0A41Q8UVNNmU
	usdw==
X-Gm-Message-State: AHPjjUj3BNNNJ/K4HNH9ssFs8ZRQcdsVHgQnZOpPSvuTDSZ7Mp1ESuyi
	clIGJ4e3hju+1NzseJ79F6VihQ==
X-Google-Smtp-Source: AOwi7QB4mgo3GTB+siXfNenjZhjcTW+OF7L8etdwJ658Aiup6aVny+0MTcS1pbtRAIQz7wRNmy4VWw==
X-Received: by 10.129.159.73 with SMTP id w70mr4143266ywg.479.1506620670674;
	Thu, 28 Sep 2017 10:44:30 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:706c:f3a8:eab4:3cc8])
	by smtp.gmail.com with ESMTPSA id t64sm807222ywf.91.2017.09.28.10.44.26
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 10:44:27 -0700 (PDT)
Date: Thu, 28 Sep 2017 13:44:29 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170928174429.GO3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170928154707.362zfbhccbydkdox@linux.intel.com>
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
X-List-Received-Date: Thu, 28 Sep 2017 17:44:30 -0000
X-Groupsio-MsgNum: 103470
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TlGginnuNEm5PkhK"
Content-Disposition: inline

--TlGginnuNEm5PkhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> > In the case of non-wic images there is logic today to generate a
> > startup.nsh file that will be executed by EFI to run the loader that the
> > image contains.  In the WIC case is currently depends on that file being
> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
> > present there.
>=20
> What's wrong with this approach?

No one ever provides a startup.nsh and everyone that wants one creates
the same one line trivial example.  The end result is that no WIC images
are Just Bootable on UEFI systems unless you first go and spell that out
as the desired booting device.  This isn't an awesome workflow which is
why the non-WIC cases make the required startup.nsh :)

> I'd be happy to make wic to do only partitioning and assembling the
> image and avoiding to modify image content as much as possible.
> That would make wic design much more clear and let us to remove
> a lot of duplication between wic and meta/classes code.
>=20
> Regarding boot partition content, I think preparing it from bootfs
> directory the same way as it's done for root partition is the way to go.
> You can find more details about it here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10073

I don't conceptually see a problem with going that route.  But today WIC
images aren't nearly as useful as they could be, with a rather tiny
change.

My patch is also a regression-fix, I believe, in that at some point in
the past, when Christopher's patch went in, things were laid out such
that startup.nsh was often/always generated by another class and placed
where WIC would find it and copy it in.  At some point that was
broken/changed, and no one noticed / was interested enough to fix it.

--=20
Tom

--TlGginnuNEm5PkhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzTT9AAoJEIf59jXTHXZSQ04QAIup5rXIA8ESbq7qRhSEAdqQ
QYHkS8fNDQOPpuDBpAfiHcU6B/Qah3rbiKUhvBt1l8o97oWQoe43thSaLgJxQm8f
Rf2+dx5ATB9Z0LuCJHJp7LHT/f97i7HV2vdhRiimghdWFzdB9rio8bobsvQqFzZc
tE5AXZJpGdPDJyulqMIC88aXb+gk/M1wwS4m2AAs4w3BiO1BHN/HecMwNin/8xaV
j0pQTBmBUsMikeg8jvXRqYic5PtPGC1Kx6EpEOqbbX23AQcapXkVyGCO44r7nliG
aBUhAYhd11YYY+qMR3KXcPmB6HcwMg+zmz3SK46/JmecVwrf7HvcvFFoWTTTHJFv
qdp4jRMPm7NFtcCkZxxifpidvt5NPKPpvMYtiX9J1u9LGEyxCNSGNHz1IldfzwEZ
pcIul3Fjd8MToiuWdP7YonW5qDFOzzt90vQ4r5KSBOjS00wqlSxhLQ1oQtiohy1H
bKyeK4mVbm8kcXV3/EXOWhoNXX/ljMgr+BU8wjRJnukVEERcOQLhb+aGYztNtj4i
XkV/3QDi5fNSD2MHqyKvkBkB7r7cgBDnE2l3fS1VY/uwT2RFGc6FbCZpecw/aOQj
MBX/FHiigdOfgao5jvEyB2p4Q6UEKORN5COOEbcid/gGHkEGE7piq6UR7wDNCusg
uJcrUjWTuSLGz8JbQJF4
=5Hg/
-----END PGP SIGNATURE-----

--TlGginnuNEm5PkhK--
