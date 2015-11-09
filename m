Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7871876E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 21:46:55 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so103099072qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 13:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dVFyys4AxiFgQIWb/7eleYrS8iJD9E8I9CyoQC473f8=;
	b=ldCeBa8sswjRUr9LtxWKRKwWECzdbOkZ6kPEH1FhtZ2rNkL5ksPUXa8HxHw9/N9MIy
	KKsngXEf9n1R+fpWCJLzr5OzbgrvjIFXC6hCDm25LXhUjoEtchUcl9kwfD/ES5SVh6fg
	134MgT9XBxScASox5i0O9ksztmZA/rsqXy7JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=dVFyys4AxiFgQIWb/7eleYrS8iJD9E8I9CyoQC473f8=;
	b=iiET5EUy6Ia74/Isp0e61PXnFbbSjLfFlWNIUO9OftfB9ArPV1EQh78gW8Ft2MvZND
	j0iy0XxLYfCFeVXe3iYNShCLGyGALysrepaXfRid7LgR/OtGuKIidsSuQGQOr8K63pml
	Fw2dNaCNxbRpkz/6RLM1FOOjAryVvrBMOGx4QH70QtwP+lr6oUsuVU+NjziXdbS5Wyvj
	E3YHq7QyoVhYPRbglrde9MtilpUvpB3ehGLXjPJdr7B3YHjJi9nvM9H+KJ80F9vQCDTf
	0OjkBbVmvZJlWBn4AAIYeWu0vvKGcKa8XHXCh4fok2V4GJbbVn24iAEMjiDvK4AOhRUZ
	0RhA==
X-Gm-Message-State: ALoCoQmsKA4c/KTNOOQXquiJdxcsJcc+zx3DeP0ZQPAljq67R+XxSF/I8u/o0xvHwmDTfa4sc1sc
X-Received: by 10.140.31.194 with SMTP id f60mr130265qgf.60.1447105615602;
	Mon, 09 Nov 2015 13:46:55 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	b108sm29530qgf.20.2015.11.09.13.46.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Nov 2015 13:46:54 -0800 (PST)
Date: Mon, 9 Nov 2015 16:47:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20151109214736.GK8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<20151109202937.GH8499@bill-the-cat>
	<CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Mon, 09 Nov 2015 21:46:57 -0000
X-Groupsio-MsgNum: 73124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mry1ZXHYlw0wW3YZ"
Content-Disposition: inline

--Mry1ZXHYlw0wW3YZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2015 at 07:11:37PM -0200, Otavio Salvador wrote:
> Hello Tom,
>=20
> On Mon, Nov 9, 2015 at 6:29 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:
> >
> >> The U-Boot 2015.10 has been released at October 20th 2015. This also
> >> removes the GCC workaround, for the inline behavior, as this version
> >> properlu supports the GCC 5.2 as compiler.
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > Sorry for being late on this.  Please make sure to cherry-pick at least
> > c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number of
> > boards won't boot Linux) and possibly even
> > fb3db635757f68e68ab3e943396c34886529b88e /
> > 2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
> > 347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MIPS
> > fixes.
>=20
> I queued those here for the next patch version however it seems noone
> has yet cooked a proper fix for the ppc issue. Are you aware of anyone
> working on it?

Does https://patchwork.ozlabs.org/patch/535537/ fix the issue?

--=20
Tom

--Mry1ZXHYlw0wW3YZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWQRR4AAoJEIRElH1W1v7NzBwQALUDY18O/TN67X11po44g2Me
m8I1uvHLSYp9LbPF9cSG+eLbKpUZYxwCsIOYen28MNEtaW4+AD6A1x+SfGMi9nO7
YmqpAJxlqYAMvN4qSw45T+cTp7mGTSsNyBEW/LfmpRLDE0UgM3Hqu1E7BTLzsXbX
4CDcipaZqYgrh/kJ1TZRF408+d7DtMkVTF+c8S/1MW0MOJgYRDtLFWLY/vVvRdYK
Xw43LIKHFxMfuLEVgJsY2ecvgCM52Nf5OAfBg1OMwWR6PJMwq/eLjHZkTKm2AwWy
LMXsBwRgKYRI0Qys/CS6P7nnqTb3LmDT83bVXQ5l7zHY5nCDfhDX1dp97h1Qgdr5
ViAFRAWGixkK78sLE7/TBZW7q/Ql7WS31bWEExMji81ZnzlbUpH86sh6ZJ3RM7BD
uyCgQ5b7rkbvKyNconaifUQzPZeZG5H9bQmz0IGeMs9w6COd6u1EPeWqEkmqwyhx
Ss0nMP1nKrcxdXPjQ42tm9eB2ERydXEVibeK+PHw0SeVfk7v5Wr1kLz8XEj8BEoc
ktBoGE8ztASB8oxipDf5moa8wvr8qJ0ltX6Owfsm8U40BtuAUww839d/Hg9LPrDv
691G/GymD98U+tBoQ1ZUoo+hPxyMSPvc69+8lAyMFUYCCdOSxWfBtc5vEH/Lu3OS
hn/O6nLWNU60Sbms/Cl1
=017Z
-----END PGP SIGNATURE-----

--Mry1ZXHYlw0wW3YZ--
