Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id D359D77BC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 21:01:51 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id z50so50408746qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 14:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gS1KTXUy3A8BaV/3qnobPQCLILINVGYg1PVk8EBPKIg=;
	b=d5lvSiJxFFyrS1q3Et7lUgrtQ9/MN69yl8ftVwSGgomWD8+G5lmsHum3Lywcs1MJfw
	j/e7N2osusk3NKzWGalOe7FOjHB7f9YdCJgqgH9azGHqyK89/k2U1ldlFx1xPaCuH4K5
	3gbgfkwirNhZ4QWQYtG1tOpkK8ocb1aGabKEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gS1KTXUy3A8BaV/3qnobPQCLILINVGYg1PVk8EBPKIg=;
	b=fM9VylcSeaUKVZB+h+MtPwkabs0Y9yQ1K45lP+QHuimYd2q+XV1BIuQgBq6rJ2s/hH
	cDAQDXSytpM9mxFpDVg4u95MV/7BKnrybCyQg6X9GkTaNqrb0utWZ8FUOmYAeqGa4znB
	W5WrB5ErCcy0jYLpypBh5tWoJqS+1W6J/X8zjUf465Ua0ThZAU42bPqr5lCCmeGm2QXj
	QLnqB1HHV4+v052VoG031NZzcAEFPL72hCaiz57+6edfGHxmbCnJHSfG3bu9lD3zHU+J
	AwkY++fDbBvCEcQmqcW4s7wTZUJkwCMQgyRBS+WLHsf5apYXPWtkPlnSXykAU21BPcqC
	UcZQ==
X-Gm-Message-State: AMCzsaWiVHVhFoCexTc/eY1aMBBHtiaSpP+6uzAIqWCGwVu8VT7CQ2oX
	kh3nHks3+c+2Tgd7CYS5q+McH98aaQI=
X-Google-Smtp-Source: AOwi7QDhsfQnl6isxMM3MzAu5GzHtFEC0BW4+l3+0U30ov2lWCiEwe1enBae+W+X9uZNKSX6UPxVtA==
X-Received: by 10.37.102.7 with SMTP id a7mr3104118ybc.180.1507669312440;
	Tue, 10 Oct 2017 14:01:52 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:cd39:131b:2f6b:7f0e])
	by smtp.gmail.com with ESMTPSA id
	p188sm4542100ywb.53.2017.10.10.14.01.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 14:01:51 -0700 (PDT)
Date: Tue, 10 Oct 2017 17:01:49 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171010210149.GE12015@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1506015977-16858-1-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 10 Oct 2017 21:01:52 -0000
X-Groupsio-MsgNum: 103787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7fVr/IRGAG9sAW4J"
Content-Disposition: inline

--7fVr/IRGAG9sAW4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> When we have been told to use the UUID we should also update the fstab
> to make use of PARTUUID instead of hard-coding the device in question.
> This will make the resulting image much more portable.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Where we did we end up with this?  Ed pointed out that you can tell wic
to use a specific UUID, so reproducible images are not a problem.  And
making images that are readily portable is why other distros use
UUID/LABEL and not device names as much as possible.  I personally enjoy
being able to put an image on uSD for minnow and have it work :)
Thanks!

--=20
Tom

--7fVr/IRGAG9sAW4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ3TU9AAoJEIf59jXTHXZSBeIP/iZYsZRKvVoxNBWhG7MfF5Fc
N/KkJYOe3te2pcRPqjG11lCxxdTUEXkh+0jhTH11JJjdXZ5AzBNLkioFGMgy4QiK
eSVjfrr9d6qzGYsb596jf7ck+3+/3NAgeqnkY1wT0d8IX0mRDdToxZRxoZ0LEJxQ
cDAwHeGsOD6c/BgDPyGkX3X3Xct81mcqmUn1XS/V9zR1X3rKliTA622/5d3mFFl4
7qbaJC/h/hjtuIVszy5XwRYqsz97pZP80PeOc+HP70DtG+ZQodhg2RT9NaSvdtyI
AX49JUd62Wh4EPCR3xlFenoeem3HZ3pOKbro2nW4NOFG5uHxDx6NvsDH2jfcNJht
aheQpyaw1D9nfAj8jlJuBp7fZ4bUTmOcxElmZt0/Hb8Pxc0/j66uHQB2yebzDUnq
tgN67O21EY4jeuorMhFgXmb/cCaJ43lrdaZWlkyoG0xJi8XHYBqFCRy6bY8kkPlc
D3lNkyxu75BWlGI9o+uVoDGyRD2aGtNWVu3XCJ5qNyKrE5p/EGO9sRb6WRL9A5nb
RxgwYl4Lpg7RNrAmTi14BXRM4k8oQyTDBZL5JIP5UqLBzhsVnCLPFFJzKMW0IQlB
rwrFaJBsn2vjEakj3rkmquBfEYIxdKvtUgzxMf1sPYKl5Jr+2AQvS/PM33wqe1Mc
ZEfcEeHnMoLuMZX3Oz3u
=DyTP
-----END PGP SIGNATURE-----

--7fVr/IRGAG9sAW4J--
