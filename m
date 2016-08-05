Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C16177117
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:25:18 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so19483329pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=yD/YIwpbe0ViPziXPgEOgvrrvus5+rGVoeILcvd2SjA=;
	b=Qb5KK3xqxuL1W27WoeBnCncYy0ie2bvAljjTXpTkS2GfHT7MiGj0Hhrp5LjQ53FyFO
	Nq6bil/twiFI+QRE9t+8SoA7gezJKIC9+/OOIyeXebSR+o4Ou0gPLzmSj8K0V0XOJMdL
	ZvqiO6P5FwXO/wuUws/S1p/QLjj4BEOhz6Czk1m9O9diyhfQm6HeO+Ir5/HxXQ23Oar7
	fc8pQ0ZoUYsBgTdltuLA1OGU9O2hmjJ4EjHi/WwOYkvR2qds0DYkxBudkfXJh5nUDJqs
	bXEQ8HBC/pKwXPjwZ8WQz1aXsWXjBn2HDv4HW30jpV/0/xE8zGC0m6QbBT+JLYux2qJj
	KBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=yD/YIwpbe0ViPziXPgEOgvrrvus5+rGVoeILcvd2SjA=;
	b=iadYx3nPD0g1rrf6sAaOlsFNvhOVrlgRInd+U59h82Qi617WPjjyj2EkPwMtgpeXLb
	k+LgjArpp4dN/va0zkiaoaKOjxIZqP4AAPim5Ya7SrZC+Tu9kc4LcZ3S5HqwDu/+3DVS
	26RhUHF9OkuKftRcQb9YfTJI4o9AWkUxGGH3Di2Eihl0Xip/0l0uq6bYT9Y9iyIm9j0e
	bohuyoFLd4wlJoZP71JKSaD+ud7IEdHv3ra3PeGIz79Om7mhzbVGP7/17SNke3TXkA0i
	4A4gSujsZftefQjMixNNeILXbwqOxamvis3oO8D7edOyr8y2dgnDd6aBxvOTDQPgqNLY
	b9OQ==
X-Gm-Message-State: AEkoouvARpiBRDeRfBYkOQZLZeOW5irNc5b3jqePZYsbN9V3BiwAPjtaTKusNCe3j5UTIg==
X-Received: by 10.66.233.38 with SMTP id tt6mr135996465pac.99.1470414319425;
	Fri, 05 Aug 2016 09:25:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:41d7:99c1:5cc6:c627?
	([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id
	cp11sm29219529pac.28.2016.08.05.09.25.17
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 09:25:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZUFnurhrmqXuQ=iJSqh=6_zb_M=H6wN=ZnXaZ6Mb+Tvw@mail.gmail.com>
Date: Fri, 5 Aug 2016 09:25:34 -0700
Message-Id: <392D9F5C-401C-4C57-85DC-C879B0820709@gmail.com>
References: <1469821981-6456-1-git-send-email-anibal.limon@linux.intel.com>
	<04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
	<CAJTo0LZUFnurhrmqXuQ=iJSqh=6_zb_M=H6wN=ZnXaZ6Mb+Tvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 16:25:19 -0000
X-Groupsio-MsgNum: 85383
Content-Type: multipart/signed;
	boundary="Apple-Mail=_04F73ECC-7E6F-41B1-A40D-F238DB9F3448";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_04F73ECC-7E6F-41B1-A40D-F238DB9F3448
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_181F6C15-29D9-411C-8F1D-DCE64C3654F5"

--Apple-Mail=_181F6C15-29D9-411C-8F1D-DCE64C3654F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 5, 2016, at 8:54 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 5 August 2016 at 16:44, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> This breaks on musl. Another plea to add a world build on AB for =
atleast
> 1 target for musl.
>=20
> Does oe-core world build green with musl now?

yes except qemuarm. eg. see qemux86 build results from last night

http://errors.yoctoproject.org/Errors/Build/19242/ =
<http://errors.yoctoproject.org/Errors/Build/19242/>

on qemuarm the failure is due to gcc racing against libunwind. when =
libunwind is staged
before gcc is built then it fails to find the right unwind.h, strangely =
this does not happen
on glibc based builds, I wonder if its just a latent problem which we =
are yet see on glibc
based builds

>=20
> Ross


--Apple-Mail=_181F6C15-29D9-411C-8F1D-DCE64C3654F5
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 5, 2016, at 8:54 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 5 August 2016 at 16:44, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":2q0" class="a3s aXjCH m1565b61151f378e0">This breaks on musl. Another plea to add a world build on AB for atleast<br class="">
1 target for musl.<br class=""></div></blockquote></div><br class="">Does oe-core world build green with musl now?</div></div></div></blockquote><div><br class=""></div><div>yes except qemuarm. eg. see qemux86 build results from last night</div><div><br class=""></div><div><a href="http://errors.yoctoproject.org/Errors/Build/19242/" class="">http://errors.yoctoproject.org/Errors/Build/19242/</a></div><div><br class=""></div><div>on qemuarm the failure is due to gcc racing against libunwind. when libunwind is staged</div><div>before gcc is built then it fails to find the right unwind.h, strangely this does not happen</div><div>on glibc based builds, I wonder if its just a latent problem which we are yet see on glibc</div><div>based builds&nbsp;</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_181F6C15-29D9-411C-8F1D-DCE64C3654F5--

--Apple-Mail=_04F73ECC-7E6F-41B1-A40D-F238DB9F3448
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlekvgIACgkQuwUzVZGdMxQ4jwCfZG7p4EkHEFXbNQ0fPmI5frP9
bLEAnjy/sW/zMEXsR9rEwESCgeXJVHVH
=WkFG
-----END PGP SIGNATURE-----

--Apple-Mail=_04F73ECC-7E6F-41B1-A40D-F238DB9F3448--
