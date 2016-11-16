Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94B2B60685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:08:34 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so15290266pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=xuda1cZ8XMVdSlwt71NCzaIELQzeXtqMq4GBJaA5Y9A=;
	b=s3j91cvUCqQPTl01cVz941CT8AZ8Fzupjg1A/ZJbX0mZc/WcS5bkPnO1g0ocJxiN+b
	3Xk1/SVDjK09oOeVjg+MXj3WOUYvN4+OxuORBua3chUrtr64a6KEfEPZtnY5PDSy4Rw1
	f0MxGBQYxfWBZwwStw9iRL0ElA8HzasUOUZleApAWPxUHMtA+CoMw+IeRfLyhMKWux4y
	qbnjX8Y6Q97aLVLD9hHjmY0qkgOV23OlGHLtuggDNl/wQdugc28J/fdDDlcChXKyu4wH
	8H8/hhcnCXDXbkOkV4kVon0E++9yBaV8Wa3yz02c/13yCcJqLcg/h5UGzAHJWCKtpaFe
	Wj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=xuda1cZ8XMVdSlwt71NCzaIELQzeXtqMq4GBJaA5Y9A=;
	b=Y1LnApIpyx+mGslz0TbjIrs5v8BpxGobPj1Ju1UQdZaz66LcjiiYVeOeJLVgnL2NSO
	tFj9xXxLZkr8OXl9UCwg5xCt8dkaan9lCqCSKp+NIugnDbX8jYQon7f5L719tLmpujaU
	yEgi5A3w/JZtV2jOLFhoJK2rWv2nQw7YqXubcXs1z3gaCDhQUJfQbm8ezkuvxoOhUdOX
	Cv7lW8jAaSkgdTqxkWQMPFRBvmnEGxmZ3d0MLz4Ql5HovJg49yLeqC4gVIl8kBVVKe84
	+1nF+E4YgnWybHKbK8rIeqxYdS/Az3ASXiR44t0EXAe4sMTb8/dlv+8hWKXD905WsFpn
	jBHA==
X-Gm-Message-State: ABUngvd/OR5F/72qtTHjH1/orII/BgTahm3RR4S7kVSDTwck0ab/NOgp9fwVG6GLSucjKQ==
X-Received: by 10.99.239.5 with SMTP id u5mr10990291pgh.61.1479319715772;
	Wed, 16 Nov 2016 10:08:35 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:253b:db0b:7823:74ba])
	by smtp.gmail.com with ESMTPSA id
	y200sm56035614pfb.16.2016.11.16.10.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 10:08:35 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patrick Ohly <patrick.ohly@intel.com>
References: <1479310588.18151.22.camel@intel.com>
	<CADkTA4Pti3PEn7C1AWcy0H0RrWfjphSC1+396tp16z2Wm5PWww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <8dacb506-b9e2-4e0f-96d5-5fb267301f5d@gmail.com>
Date: Wed, 16 Nov 2016 10:08:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Pti3PEn7C1AWcy0H0RrWfjphSC1+396tp16z2Wm5PWww@mail.gmail.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: truncating quoted text in emails
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
X-List-Received-Date: Wed, 16 Nov 2016 18:08:34 -0000
X-Groupsio-MsgNum: 89485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="OtCWI5KsMLbeuDpIqmoFvNCrAdXwlV3Qf"

--OtCWI5KsMLbeuDpIqmoFvNCrAdXwlV3Qf
Content-Type: multipart/mixed; boundary="lN8CnBfR4G83STBH5dGOJwRRTa45nJ905";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Message-ID: <8dacb506-b9e2-4e0f-96d5-5fb267301f5d@gmail.com>
Subject: Re: [OE-core] truncating quoted text in emails
References: <1479310588.18151.22.camel@intel.com>
 <CADkTA4Pti3PEn7C1AWcy0H0RrWfjphSC1+396tp16z2Wm5PWww@mail.gmail.com>
In-Reply-To: <CADkTA4Pti3PEn7C1AWcy0H0RrWfjphSC1+396tp16z2Wm5PWww@mail.gmail.com>

--lN8CnBfR4G83STBH5dGOJwRRTa45nJ905
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/16/16 9:01 AM, Bruce Ashfield wrote:
>=20
>=20
> On Wed, Nov 16, 2016 at 10:36 AM, Patrick Ohly <patrick.ohly@intel.com
> <mailto:patrick.ohly@intel.com>> wrote:
>=20
>     Hello!
>=20
>     While trying to follow patch reviews on this list I noticed that
>     (subjectively?) quite a few replies completely quote the original e=
mail
>     and then just add a few lines. That looks fine in GMail where the q=
uoted
>     text is folded, but not so much in mail readers where quoted text i=
s
>     unfolded (Evolution).
>=20
>     A random example:
>     http://lists.openembedded.org/pipermail/openembedded-core/2016-Nove=
mber/128861.html
>     <http://lists.openembedded.org/pipermail/openembedded-core/2016-Nov=
ember/128861.html>
>=20
>     Not sure what the netiquette is for this list, but at least I would=

>     appreciate a bit more aggressive trimming in replies - thanks! ;-}
>=20
>=20
>=20
> We might as well try to agree on an editor to use ;)

I would expect the users to be aware and do the needed. Worst case
your email wont be read or replied to.



--lN8CnBfR4G83STBH5dGOJwRRTa45nJ905--

--OtCWI5KsMLbeuDpIqmoFvNCrAdXwlV3Qf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgsoKIACgkQuwUzVZGdMxQ7wwCffSGOTafrl7CSGrhm8cZJIrdM
wh0An0e3cH7mbE7/MnUIDEPvDCzwcXjP
=AwMZ
-----END PGP SIGNATURE-----

--OtCWI5KsMLbeuDpIqmoFvNCrAdXwlV3Qf--
