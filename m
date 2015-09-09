Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C0E3B763F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 19:28:17 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so18814016pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wGg05WqzELy8TnEVrGRQ9tyeScwUKKVMj3g3RVZygoA=;
	b=lI5QWdiGYKhFseTrcIKJzlD0khoUF+5sUduzp3dJ93s7r08+tX54ZZptUENkr6sYDs
	CkGxcIb1z6g4l9uj78nb/rMq1wV93C7ojfyranaHrk9ykkICtrtLIMyPERk5YxixfXKO
	yl6qu7UkutMwysQHY1dFdWKQRu0/xluSxA3GISmj0JTc8BM7+zJGNAM44wI6YghwLZO8
	bywfajLj2U1EOO5bihBsTGpWxj+hQrZI0z5B1nk0rUUEeEkcPxUtWrx2ihSLO+qPWVEk
	MpsKlREEfOerUXm9L7+hCbgS0QML3NxJo9BhktOAEXdrI+FLLeQqSAfZpIRvwCNaawuv
	aoGA==
X-Received: by 10.67.8.106 with SMTP id dj10mr64581914pad.123.1441826897328;
	Wed, 09 Sep 2015 12:28:17 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:984a:11bb:da12:b894?
	([2601:647:4c02:370d:984a:11bb:da12:b894])
	by smtp.gmail.com with ESMTPSA id
	di5sm7869090pdb.76.2015.09.09.12.28.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Sep 2015 12:28:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaCUeR2pt6d2=yrTtdfJsd1AOd4iUeZMXOuOm_ROvcsWg@mail.gmail.com>
Date: Wed, 9 Sep 2015 12:28:11 -0700
Message-Id: <29BB45DC-8BCA-4559-AD0E-BFE1FB3E5A03@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<b4be4eb148b3551893639ac087be2d4e8dcb8eb5.1441753511.git.raj.khem@gmail.com>
	<CAJTo0LaCUeR2pt6d2=yrTtdfJsd1AOd4iUeZMXOuOm_ROvcsWg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/16] webkit-gtk: Backport fix to remove FrameDestructionObserver
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
X-List-Received-Date: Wed, 09 Sep 2015 19:28:18 -0000
X-Groupsio-MsgNum: 70928
Content-Type: multipart/signed;
	boundary="Apple-Mail=_973F9BF7-5D4B-48C9-B4ED-0EA2B3F75BC4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_973F9BF7-5D4B-48C9-B4ED-0EA2B3F75BC4
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DBB73B1A-78C9-4C09-95CF-628D271F759C"

--Apple-Mail=_DBB73B1A-78C9-4C09-95CF-628D271F759C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Ross

> On Sep 9, 2015, at 6:04 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 9 September 2015 at 00:07, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> This helps clang compile webkit without problems. This is a backport
> from upstream
>=20
> MUT has an upgrade to webkitgtk 2.8.5, would this version have this =
fix integrated?
>=20

yes its been fixed in 2.8.x. point me to MUT commit I can cherry-pick =
locally here and try it out to make it sure.

> Ross


--Apple-Mail=_DBB73B1A-78C9-4C09-95CF-628D271F759C
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class="">Hi Ross<div class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Sep 9, 2015, at 6:04 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 9 September 2015 at 00:07, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":16x" class="a3s" style="overflow:hidden">This helps clang compile webkit without problems. This is a backport<br class="">
from upstream<br class=""></div></blockquote></div><br class="">MUT has an upgrade to webkitgtk 2.8.5, would this version have this fix integrated?</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>yes its been fixed in 2.8.x. point me to MUT commit I can cherry-pick locally here and try it out to make it sure.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></div></body></html>

--Apple-Mail=_DBB73B1A-78C9-4C09-95CF-628D271F759C--

--Apple-Mail=_973F9BF7-5D4B-48C9-B4ED-0EA2B3F75BC4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXwiE8ACgkQuwUzVZGdMxSrMgCfb+SM/3yueJi6UUxjsG3si8H+
9RwAnjiSUgORMFSsxoWgSQA9BhpxyiR0
=CiB6
-----END PGP SIGNATURE-----

--Apple-Mail=_973F9BF7-5D4B-48C9-B4ED-0EA2B3F75BC4--
