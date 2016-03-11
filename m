Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 172686080F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:11:48 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id tt10so102398492pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3UdHcge3mCNH+RHznA9aeEZLH/p8qDh5/7f59qZ8E1Y=;
	b=0dkvHgxccKeFh2dXdlKeZ9MBPXKecPxPjEHhA/Iz0inw0IAj846+D0oHq4WvPd1xFN
	sjnABOdTZ1i5wJu5OpTe+OXxqyy/RiSmqOmQJzIxGsI7Lxljt8crKJAh1vHy18p6SqVJ
	D8fQtcLVwlmG6xzEuWpHzu9v1BhCbQmY0XfdXquCJGS2+7/UAYZi0gg//L97jx1oYQty
	6MwT0RkvmKlM5FBoXReEIiOu1UT6zsTqRkiOp/zsMpNkm9xT8P+stYYQ+xlZq4hRN1jo
	0LPzYOnjdMx3gaPfp8hT+5+J20ox5k6JZyul9EqMSz7DVDGTjxKfOYTi4i6EKk2FxZ1Z
	cKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3UdHcge3mCNH+RHznA9aeEZLH/p8qDh5/7f59qZ8E1Y=;
	b=aMbJZsCrb/F4/lKPnwJR2hhsZBXnprCKHjL6zcpqFsY1n7fndXzrr0kerCzVoPrA1i
	ZqTmKsWlvATsP8TOgl2Nbdl4pNRR81qG2zcyuVX0oxhK1rSXu2DFpAE25Dxx1o/hvbmq
	oFyCIDLY+fFNOYQKqx+lFdg4ZfUHWjF0IJCehUyfXihU2G0aQOyw+GQlE56nwoDDLOqX
	24VU723lOLk+Q/ogvJPI+cmdWwJxon7vNoNt24Us/YKNAYkKjQ8wb+1E6jNhTJA4e2NV
	27Ot7YylK3hecdCglqKNgSaZOlFTpa7Vn6PkR/g6wKq38P6fb6jKc45hhU3TUMCZCIfi
	QaRg==
X-Gm-Message-State: AD7BkJIsVbDDb2ONgSQnJWfkYAqT/4hu6r8SMCyObSpnaAc1PPQtM48Y61dAkI7j52btXA==
X-Received: by 10.66.124.130 with SMTP id mi2mr16641379pab.106.1457712709406; 
	Fri, 11 Mar 2016 08:11:49 -0800 (PST)
Received: from 172-4-122-115.lightspeed.bcvloh.sbcglobal.net
	(110-170-137-253.static.asianet.co.th. [110.170.137.253])
	by smtp.gmail.com with ESMTPSA id
	wh9sm13996964pab.8.2016.03.11.08.11.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 08:11:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>
Date: Fri, 11 Mar 2016 23:11:35 +0700
Message-Id: <7AB4B008-780B-4619-A914-7A00D132FCF0@gmail.com>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
	<CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 16:11:49 -0000
X-Groupsio-MsgNum: 79483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9D8A6A2D-4716-4A04-BD93-CD1970E6331D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9D8A6A2D-4716-4A04-BD93-CD1970E6331D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D1CD6618-00BD-4523-8229-15B1D3040516"

--Apple-Mail=_D1CD6618-00BD-4523-8229-15B1D3040516
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 11, 2016, at 11:02 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> 2016-03-11 15:58 GMT+00:00 Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>:
> -----BEGIN PGP MESSAGE-----
> Comment: GPGTools - https://gpgtools.org <https://gpgtools.org/>
>=20
> hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1
> XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj
> +3QJg/xqk7cgXTLuoUen9JZQHZgnG6+IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5
>=20
> Can you send it non-encrypted? :)

patch is ok. It was an oversight that its fixing.

>=20
> Ross


--Apple-Mail=_D1CD6618-00BD-4523-8229-15B1D3040516
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Mar 11, 2016, at 11:02 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">2016-03-11 15:58 GMT+00:00 Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span>:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":ao7" class="a3s" style="overflow:hidden">-----BEGIN PGP MESSAGE-----<br class="">
Comment: GPGTools - <a href="https://gpgtools.org/" rel="noreferrer" target="_blank" class="">https://gpgtools.org</a><br class="">
<br class="">
hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1<br class="">
XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj<br class="">
+3QJg/xqk7cgXTLuoUen9JZQHZgnG6+IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5<br class=""></div></blockquote></div><br class="">Can you send it non-encrypted? :)</div></div></div></blockquote><div><br class=""></div><div>patch is ok. It was an oversight that its fixing.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_D1CD6618-00BD-4523-8229-15B1D3040516--

--Apple-Mail=_9D8A6A2D-4716-4A04-BD93-CD1970E6331D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbi7kEACgkQuwUzVZGdMxQG1ACeK+s5nztrwteVIYByijuIPq3O
F6IAniHTXvLPWvuc/sMcchx3fF3sKfgp
=8Alw
-----END PGP SIGNATURE-----

--Apple-Mail=_9D8A6A2D-4716-4A04-BD93-CD1970E6331D--
