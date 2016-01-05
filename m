Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 606EB731D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:10:18 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id yy13so128428939pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=64okpSTLWRD/6p6IhIaVvPsXqySAv1M7orgatjqMzyQ=;
	b=vZGqJlZBhrrqvyAHMCohDKAh3pFz2uLch/qeCaTJ6zkVsKKQ/NQodrmqg2C4ESc/Yr
	fOeA8wLiLbEWAv3JP9w/JZ1CLI+ByK72+v16cjz7mJENGTDvSOWOIuHGEl+PsYdASe+F
	2bcM0u/0sbQlR/Di2/SfK2LVuIDODKNe8eBE4g7BR0fXAycvF7afcPkqk3FFiAf2yLXw
	Cdp3eplQW9IAzSxg9p7/Oh6iNJXRPNYbZJ16LCjK/g6v04Wqx3rxsDuipfQrPWgK3WdL
	/4SelHWzU9M5tst+wtFnFNwbM4EqDnHq/mLsTMyjF1c/DFyFv7vszqfwVdvAIvqK7+oy
	pN4A==
X-Received: by 10.66.97.5 with SMTP id dw5mr47427325pab.27.1452028219774;
	Tue, 05 Jan 2016 13:10:19 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:41f6:2669:fdf0:2010?
	([2601:647:4c01:b37d:41f6:2669:fdf0:2010])
	by smtp.gmail.com with ESMTPSA id
	b9sm72048378pas.31.2016.01.05.13.10.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:10:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZX0AnEjGSsRH87xsXNX1io=T17rBCnzJH_Ek=Lptzg5w@mail.gmail.com>
Date: Tue, 5 Jan 2016 13:10:20 -0800
Message-Id: <763CE3E6-D793-46D3-8A52-8DA08F20F50E@gmail.com>
References: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
	<1451903012-22560-2-git-send-email-ross.burton@intel.com>
	<CAMKF1soaRON--0ywMMeesGsakmcqS7tNZFxeVD=YCA2TE5532Q@mail.gmail.com>
	<CAJTo0LZX0AnEjGSsRH87xsXNX1io=T17rBCnzJH_Ek=Lptzg5w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: add more compression and importd PACKAGECONFIGs
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
X-List-Received-Date: Tue, 05 Jan 2016 21:10:19 -0000
X-Groupsio-MsgNum: 75478
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C4C671B8-6493-4504-A7E9-8A1340863258";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C4C671B8-6493-4504-A7E9-8A1340863258
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_99900725-AF1E-402F-B6E3-97DCCBA65433"

--Apple-Mail=_99900725-AF1E-402F-B6E3-97DCCBA65433
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 4, 2016, at 12:53 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 4 January 2016 at 18:36, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Would it thow some sensible configure errors on enabling importd
> without the dependencies ? now that they are packageconfigs on their
> own. ?
>=20
> No, basically currently if you enable enough options then importd =
enables itself so the main aim here was to add some determinism to both =
all the compression backends and importd.
>=20

OK thank you.

> Ross


--Apple-Mail=_99900725-AF1E-402F-B6E3-97DCCBA65433
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Jan 4, 2016, at 12:53 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 4 January 2016 at 18:36, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":382" class="a3s" style="overflow:hidden">Would it thow some sensible configure errors on enabling importd<br class="">
without the dependencies ? now that they are packageconfigs on their<br class="">
own. ?</div></blockquote></div><br class="">No, basically currently if you enable enough options then importd enables itself so the main aim here was to add some determinism to both all the compression backends and importd.</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>OK thank you.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_99900725-AF1E-402F-B6E3-97DCCBA65433--

--Apple-Mail=_C4C671B8-6493-4504-A7E9-8A1340863258
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaMMTwACgkQuwUzVZGdMxS1GACeNjSygEBsN50lpsefBXJ+wtwD
tpQAn0G5awxN7xcAhsvDUjM6RYR5xlGf
=aN+9
-----END PGP SIGNATURE-----

--Apple-Mail=_C4C671B8-6493-4504-A7E9-8A1340863258--
