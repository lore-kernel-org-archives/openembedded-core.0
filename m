Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E2B2962135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:22:52 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so15203795pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kSNBe5VCwDXhz2yNh6jfms9FAPOVN3qFQXyHoK55/kE=;
	b=HVYzSl3HxeIQITZhgoRO5riJcxGAix8/FLSH5YzabHSEOU7QMEWkjhUCepDWbUI8WO
	6gey+ESaqPhsMoTx8zQhcJepBc8Of/dzDwVqQh5JKsFNYfpiE2weuvxI2a7nCCSDbZBA
	/6Y3L4tvuI3ggjwXD5ZfdNX3NgC7OiWdwMFjNyYHtGRKqRsMD4ulwKjLAY/agyARNVfR
	+wK/DMxj9ZBiPpuUPSeunXXTJnhtMjBYQP7gDx6cpNYYYOScqSGcZY1xbZOP3T4SopAj
	cb95pyUgSFW1QQ5jD8e7etfxOkbDJDYV12JeVqPhm9smVl6GabfX4w646fLi47mmFlRk
	M+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kSNBe5VCwDXhz2yNh6jfms9FAPOVN3qFQXyHoK55/kE=;
	b=RkdqzMv6LehHfm5buR2FaenpphfFGeaEryfZLd/1BMTGPEFQfBtNSvJmIAPZ7/rdvL
	OHO1lYe00RuzKdenBUw2v09/SV0Icl81X7z7LKHIEIH5++3wOt7jAPs230+cSO2mcgug
	8WSrNk2UxDAIsgq+WmJqk/QCiYUo7/oogWDg23G/NggS+XWFH2M14q0RLwRU9CJRZ2u6
	rmMB7uXvVjDGob7Z0XW0kLctvEa1Uvs4NmUxyVTxRXvgHXNBTykji94WccvxiCZnaW9M
	+PHit8rRgB/1Hj2Pz6sGiDeLdvOsrL8I91XivsiSDlibXbjS+aZy6twCtO59nhsI2lAb
	+LQA==
X-Gm-Message-State: ABUngvcdjHKlejQxJWoAYS914PAsHkx4oB61f7NmUjTdySjRdIBykWKdyf7x3+dxGB4UKw==
X-Received: by 10.98.138.72 with SMTP id y69mr6120397pfd.52.1479316973688;
	Wed, 16 Nov 2016 09:22:53 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:253b:db0b:7823:74ba])
	by smtp.gmail.com with ESMTPSA id
	s2sm55805644pfi.10.2016.11.16.09.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:22:52 -0800 (PST)
To: Jack Mitchell <ml@embed.me.uk>, "Burton, Ross" <ross.burton@intel.com>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
	<be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
	<CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
	<977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
Date: Wed, 16 Nov 2016 09:22:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
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
X-List-Received-Date: Wed, 16 Nov 2016 17:22:53 -0000
X-Groupsio-MsgNum: 89477
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="SP8RDaKn3qcCL0lqH5rJtNGV58bbnpim6"

--SP8RDaKn3qcCL0lqH5rJtNGV58bbnpim6
Content-Type: multipart/mixed; boundary="LgRDMf2THTMcje3aMQwgFRx4044lbKfed";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Jack Mitchell <ml@embed.me.uk>, "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <22d481e0-2b32-2959-522f-0ed7dbf71889@gmail.com>
Subject: Re: [OE-core] libtool --with-libtool-sysroot
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
 <CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
 <be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
 <CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
 <977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>
In-Reply-To: <977eace4-b716-70f8-c9f3-837f0b6c239a@embed.me.uk>

--LgRDMf2THTMcje3aMQwgFRx4044lbKfed
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/16/16 2:20 AM, Jack Mitchell wrote:
> On 11/11/16 17:33, Burton, Ross wrote:
>>
>> On 11 November 2016 at 17:31, Jack Mitchell <ml@embed.me.uk
>> <mailto:ml@embed.me.uk>> wrote:
>>
>>     How would one check which libtool was being used, or influence whi=
ch
>>     one autotools chooses?
>>
>>
>> One common problem is a makefile or configure using "libtool" directly=

>> instead of $(LIBTOOL).
>>
>> Grep the generated Makefiles for "libtool", the only instance where it=

>> is executed should be in an assignment to LIBTOOL.  For example, glib:=

>>
>> LIBTOOL =3D $(top_builddir)/x86_64-poky-linux-libtool
>>
>=20
> I got to the bottom of this, I was switching between native and cross
> compiling but only running 'autoreconf -i' so it was detecting libtool =
was
> already present from previous native runs and not replacing it with our=

> 'cross' version of libtool. I feel like there should be a binary compat=
ibility
> check in there to auto overwrite if they don't match, but hey ho.
>=20
> Always use autoreconf -if to force update of all the required autotools=

> scripts in future.

what us autotools bbclass doing in this case ?

>=20
> Cheers,
> Jack.


--LgRDMf2THTMcje3aMQwgFRx4044lbKfed--

--SP8RDaKn3qcCL0lqH5rJtNGV58bbnpim6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgsleoACgkQuwUzVZGdMxRvIACfXQOCFgypFVtY82B//h3SeFL0
y0QAn3pDo38tLTClWY38lEH1Y+rEPmpg
=+4Eo
-----END PGP SIGNATURE-----

--SP8RDaKn3qcCL0lqH5rJtNGV58bbnpim6--
