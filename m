Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 412F96E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:28:58 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so7610641pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=h12oW/PXjy44haDa3D5fiOLzpx6K83c01RJ9+uU8Opk=;
	b=ZFOWkKYNblMBSZ5/uv5vUB6o+3ujYBrOlb7ZOlKAJ6pX52m+FawR6gR/ei25ItuZVP
	phgpXMVgzSybGkimZh/ZBwYubr/q1kXqW2F4MXRqdxOZ7oue5f253wLVjzBB4lmxkVMY
	zDDRUf7zbOA+N0DfPLtv6F+ijxgZPc8YZOsE9LrnDcaPBO6TGho2el++noz/np8Z3EP/
	zBn0DhWqiQWqQ+179GM9AAkEJZtBhHHIbuuwOi7DSF3bano8Q9CWobV2Pe0zHO6H9BDx
	DaW8fKrSNRqEuzlcs+8BJ6pxZ+AwQTerRn5WYWDty/NeWMnn+oFuCw7cI9dk3bQzbCSV
	18qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=h12oW/PXjy44haDa3D5fiOLzpx6K83c01RJ9+uU8Opk=;
	b=Qf4nlwLhRlWIoQ3uRaB0OyKju4BKGZT1ihxsIGgDFsC6Mpt4M+yhU1kVlYdKcBF1nP
	W4hdvzR2G7+m856Mzkp+zth2LTJMcw5IMObNZGAwrUjKIpLldR1XrMEjzbidac4t9j9/
	hcYB3x9UkjgI2KrjqC40KzJzx3loWiSX/R02kAYQ4Zel/wDdzVVGxslT7wWRTuypkv1R
	EO/tDhxVRA4tTUMvCwOa8YCBVfwhFZmGN39agIMVChe/HkvcmMufktbWJyubs2bXON5n
	rVtBBxBEgXniRECOb0vzl2joJpHh2ZjabTYlnp2Ajb4lXQlcDMtBBzFQb8KpcHIPro9J
	l7HQ==
X-Gm-Message-State: ABUngvebRJuEJ3RpBQZfJeKkA8HJzr3h0J3GkaGGs4BV7ITOn86Zgn/QOLm3ug8ikFHs7Q==
X-Received: by 10.98.89.6 with SMTP id n6mr6162775pfb.43.1479317340578;
	Wed, 16 Nov 2016 09:29:00 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:253b:db0b:7823:74ba])
	by smtp.gmail.com with ESMTPSA id
	t21sm31690973pfa.1.2016.11.16.09.28.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:28:59 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
	<be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
	<CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
	<977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
	<22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
	<CAJTo0LZZR73+uoC6zC2u9btouQhEm8tKsz0svf0NvBqyVhQu9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <023d639b-3fff-8321-4652-f60ec7ae97ec@gmail.com>
Date: Wed, 16 Nov 2016 09:28:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZZR73+uoC6zC2u9btouQhEm8tKsz0svf0NvBqyVhQu9g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Wed, 16 Nov 2016 17:28:59 -0000
X-Groupsio-MsgNum: 89479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WMNKdfJEJ7K6ouqf2r5jIupkhVo1LuoJO"

--WMNKdfJEJ7K6ouqf2r5jIupkhVo1LuoJO
Content-Type: multipart/mixed; boundary="Fx88RTu26DHtmlpMXWicULXVTDkfb9JiN";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Jack Mitchell <ml@embed.me.uk>,
 OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <023d639b-3fff-8321-4652-f60ec7ae97ec@gmail.com>
Subject: Re: [OE-core] libtool --with-libtool-sysroot
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
 <CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
 <be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
 <CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
 <977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
 <22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
 <CAJTo0LZZR73+uoC6zC2u9btouQhEm8tKsz0svf0NvBqyVhQu9g@mail.gmail.com>
In-Reply-To: <CAJTo0LZZR73+uoC6zC2u9btouQhEm8tKsz0svf0NvBqyVhQu9g@mail.gmail.com>

--Fx88RTu26DHtmlpMXWicULXVTDkfb9JiN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/16/16 9:26 AM, Burton, Ross wrote:
>=20
> On 16 November 2016 at 17:22, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     what us autotools bbclass doing in this case ?
>=20
>=20
> The class is passing --force, so this only happens if you're running
> autoreconf manually.
>=20

OK thanks so there is nothing to fix. But may be FAQ entry would be good

> Ross


--Fx88RTu26DHtmlpMXWicULXVTDkfb9JiN--

--WMNKdfJEJ7K6ouqf2r5jIupkhVo1LuoJO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgsl1sACgkQuwUzVZGdMxQK4gCfUXdppBR295nJfQuTJDMZ7FxE
7FgAnj2K+OwsuQFrLoo11qWs9RBXg8mX
=P3UB
-----END PGP SIGNATURE-----

--WMNKdfJEJ7K6ouqf2r5jIupkhVo1LuoJO--
