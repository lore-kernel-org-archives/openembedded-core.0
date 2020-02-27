Return-Path: <clopez@igalia.com>
X-Greylist: delayed 2533 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Feb 2020 16:31:44 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
	by mail.openembedded.org (Postfix) with ESMTP id B76F861687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=jIK4Aqb8THa0VKgZYj3YOLu6kzC9mvZwdwAYZQFyGFY=; 
	b=gTRsIcU51Ihv9WpB8YliyALrApQ2rEleref1gzBwTbNVDJHP026xFSkzjE0npN8SGnpXvbPFwIJr3HdoQ7Zthi+z5AjWFUV8Lxs2YfMiaByoYNZbG1gsn2Qfvh+bbcyDBS89ZvPwEeRjMqRvDLnAxU2qn5LLQEM2vBwdlAhKLNk3v+EPNd4NN60xSGRMNRqSkXXUwtVONzjQPxpD3JJ8OaXAWutXFWn52/5ZoGvGvcWRD0KhYir6DCM4O+oHQqy+GgoVeRlwNmA04+E7RHjbf2BgZRynGYFuEOz3El+Xl1MaFsftjucKMxUGPS9n/kYyEG+VDD6MrIv8XLzHvckPAQ==;
Received: from 83.16.165.83.dynamic.reverse-mundo-r.com ([83.165.16.83]
	helo=[192.168.0.11]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1j7LPn-0006wA-BU; Thu, 27 Feb 2020 16:49:31 +0100
To: Joshua Watt <jpewhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
	<CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
	<CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Autocrypt: addr=clopez@igalia.com; prefer-encrypt=mutual; keydata=
	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
	clOhRuoxQ9cr+zEBVw==
Organization: Igalia S.L.
Mail-Followup-To: Joshua Watt <jpewhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, webkit-wpe@lists.webkit.org
Message-ID: <29f3b8e1-6989-c84e-5d50-4012389f0bab@igalia.com>
Date: Thu, 27 Feb 2020 16:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>
Cc: webkit-wpe@lists.webkit.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wpe-webkit] [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Thu, 27 Feb 2020 16:31:45 -0000
X-Groupsio-MsgNum: 135716
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="at9lXbXbfPDGA5qTsPkJo9XPAA3mR7f3l"

--at9lXbXbfPDGA5qTsPkJo9XPAA3mR7f3l
Content-Type: multipart/mixed; boundary="Sh5AxLe8NZnEZgWm3t5hXfD0TCvn7Lg9p";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: Joshua Watt <jpewhacker@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, webkit-wpe@lists.webkit.org
Message-ID: <29f3b8e1-6989-c84e-5d50-4012389f0bab@igalia.com>
Subject: Re: [wpe-webkit] [OE-core] [PATCH 08/10] webkitgtk: unbreak wayland
 build
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
 <20200216155015.21738-8-alex.kanavin@gmail.com>
 <CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
 <CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
 <CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>
In-Reply-To: <CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>

--Sh5AxLe8NZnEZgWm3t5hXfD0TCvn7Lg9p
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 23/02/2020 15:33, Joshua Watt wrote:
> On Sun, Feb 16, 2020 at 2:52 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>
>> On Sun, 16 Feb 2020 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>>>
>>>> webkit nowadays requires a couple of supplementary libraries for thi=
s,
>>>> so bring them in (courtesy of meta-browser, which will hopefully
>>>> adjust without a lot of trouble).
>>>
>>> its not meta-browser, I guess you should credit meta-wpe here [1]
>>> and perhaps Cc the meta-wpe maintainer as a courtesy.
>>
>>
>> Actually, it's copied from meta-webkit
>> https://github.com/Igalia/meta-webkit/
>> which does not say in the readme who the maintainer is, so I am not su=
re whom to CC.
>> I can adjust the commit msg though.
>=20
> I've CC'd the WPE mailing list.
>=20
> OE-core now has libwpe and wpebackend-fdo recipes. They should
> possibly be removed from meta-webkit to prevent duplication.
>=20


Thanks for the notification. Its great that those recipes are shipped
now on the oe-core layer.

But I don't want to remove those recipes from meta-webkit, even if they
are shipped now there.

That recipes are an essential part of meta-webkit, so I want to be able
to raise the version or change them without depending on oe-core.
For example: sometimes we need to use older versions of yocto, but we
still want to use the last stable version of wpe/libwpe/wpebackend-fdo.
So I find pretty useful to have all the core WPE related recipes on the
meta-webkit layer and not depend on whatever oe-core ships.

There should be no conflict between the recipes as long as the name used
for them its the same, bitbake should simply pick the last version by
default.

Regards.


--Sh5AxLe8NZnEZgWm3t5hXfD0TCvn7Lg9p--

--at9lXbXbfPDGA5qTsPkJo9XPAA3mR7f3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAl5X5QEACgkQllCJzmuV
+IIEBBAApDr1JGdn7h1R0o5E9nFVgkFnn7nXYvl1lf4Nxv2RV/xvOzyWj0F8vkKL
RK/OHBrb4p6fSRU1soiJRP9+IJzTsIjQGsMhcReQdA9tRGtm4mNJC6CFJfgk1Vtt
DJyhC+t9RMaYZ6vc4EcchdP1VwH3GtwNvHvaXdjGCFHDpO/EqZ4FdU7JvBqiOMW+
8HSLQ47mmI2DiltPehDwC+q83PlXkZpUQa+bXgtgRfRz8AqKVxVWeyVuCLLXetMc
2lauTAn+k7njQbfd/RlhUaA3isxQ+/JFShteQ7dBXyavUyB3urDZYbnG4jgJydUM
Jv+j0PKqwVX9II5WPJ153TCbVun1TmjZYQ8DbEZF6cyJycUGvJJJj2d9LYXsFO1R
AK8qXqcKc6/duY/kakpM4ccligH9TuZE4HxFA1qZgCrpZTaojFabYslxxRlmLZJX
SXX7Zy58w9FRqfMZKlT/VhSVZYwq/kz779HC/8q4qJ6OlZjiNIRaahaMXLX1K3qF
GxBmukIuEXW3vT9gWoa7tEGZUjHb9uIdkZcQjM7M8LbgP1ElcJzeK55btYTdqiFO
afDht/jgnprhTFE0wBa9tGPZ6zl2mNPoY+aOxIwYYFPjhK5NofIoh2Js2GbggJfn
aE1CcY7m3HPEYnNvB/OmcOFd6yP5zj+aMxz0sgFt8MFmY8hBifA=
=PV9C
-----END PGP SIGNATURE-----

--at9lXbXbfPDGA5qTsPkJo9XPAA3mR7f3l--
