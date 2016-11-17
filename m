Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8CB471A95;
	Thu, 17 Nov 2016 23:22:26 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so18382119pgc.1;
	Thu, 17 Nov 2016 15:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=egQPxnJs33AWSFIni4OxGQ8y+dcQQnVLxWTJ2p/E5iY=;
	b=GokXdvBaKHHomgZbhcQxM9n+OoT5e8hHejKvJPMW3M050Lti7zvCRPiY1ZYYrRoNnr
	Qn9rObJauHoGw8rREfzYj/YRFhS77RscbiQMY4nwjxDT8RNwiNgmTUlwZTxxlmkmf4M7
	EC7cwY/bwceBgdZWpVOj260h7CcO4JwniKv1CTCJfBnv20UkLzy+xvN95LWbZi1dA07y
	seHM2UAHQN0XyNhbqTexjLrM+Wuu+fM2YMGLuYEe1J33hmoCavjg3HnFLIoy8w5sTmBc
	UbsInGc48lSXhRNHW88ltEK7yGbhm+g/I7Ub4dKuA9bQ+tlOxXD3ImK6Z8K+Crrpno8U
	O+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=egQPxnJs33AWSFIni4OxGQ8y+dcQQnVLxWTJ2p/E5iY=;
	b=IohVOZ21EO1jJ1MyKWMPr9TE+327FmV8Q/aa513r6lG8KL1Flbj+OoQsQltDQisVIk
	vAHMtFq3j8SD05zvpcO94DN55fj3QPnt8ugU2pZ0NsWNj4Lz/rJI6p50yiIecHNNnuMN
	JFsQgw7uMvXXluYzextX4OOhqvGBg26giSXOb+RgJwCkWWT+iPWbKoEUfWCrkIo1jL9g
	rEQ2x9Xqe2fqhujRtd61iircrvMFmIu/UJet6T+qf47uPQd1hTgegnV4jdkH9teJ7D5A
	ZarNlHO54t/Zfazgo9qJVpJMbmTznVb0MYT+OL+HIRUVQrFfm9RfBnBNuhXyOZ7ZAlnk
	3jew==
X-Gm-Message-State: ABUngvdhUs5WfjSBb4EAU4a0NCYyTnoN5pYfLwnk8TyN4hzwAu/YsbKEgwZHrRwkkITxlA==
X-Received: by 10.99.185.78 with SMTP id v14mr12245970pgo.179.1479424948349;
	Thu, 17 Nov 2016 15:22:28 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:952d:89df:6fe0:f7d9])
	by smtp.gmail.com with ESMTPSA id
	a66sm10872085pfa.64.2016.11.17.15.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 15:22:27 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
	<20161117185001.GE26131@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <ac552119-5afe-85a8-08a1-8a8ac3e0cf1d@gmail.com>
Date: Thu, 17 Nov 2016 15:22:26 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <20161117185001.GE26131@denix.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 23:22:28 -0000
X-Groupsio-MsgNum: 89554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="lMk4NieRnbD3gk4a9aU9VxjVLMxigSqcA"

--lMk4NieRnbD3gk4a9aU9VxjVLMxigSqcA
Content-Type: multipart/mixed; boundary="CaWHH6cw7Q1vAwAsrXJPGLXVrVNiOw7jX";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "Burton, Ross" <ross.burton@intel.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Message-ID: <ac552119-5afe-85a8-08a1-8a8ac3e0cf1d@gmail.com>
Subject: Re: [Openembedded-architecture] [OE-core] Enabling uninative by
 default in oe-core?
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
 <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
 <20161117185001.GE26131@denix.org>
In-Reply-To: <20161117185001.GE26131@denix.org>

--CaWHH6cw7Q1vAwAsrXJPGLXVrVNiOw7jX
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/17/16 10:50 AM, Denys Dmytriyenko wrote:
> On Thu, Nov 17, 2016 at 10:06:46AM -0800, Khem Raj wrote:
>>
>>
>> On 11/17/16 9:31 AM, Burton, Ross wrote:
>>> Hi,
>>>
>>> Background: uninative is a class that downloads a precompiled host gl=
ibc for
>>> use in the sysroot, thus isolating the native sysroot from the host
>>> environment.  This means greater sstate reuse, as instead of native b=
uilds
>>> being dependent on the host system they're able to be shared between =
all
>>> hosts.  There is a reference tarball hosted on www.yoctoproject.org
>>> <http://www.yoctoproject.org>, and the URL can be overridden by distr=
os if you
>>> would prefer to build your own.
>>>
>>> We enable this in Poky so that we get greater reuse on the autobuilde=
rs, and
>>> due to some issues with the C++ ABI the eSDK generation in master now=
 requires
>>> uninative to be enabled.  The question is: do we now enable uninative=
 by
>>> default in oe-core's nodistro (pointing at the yoctoproject tarball),=
 or do we
>>> keep it disabled by default and require the user to enable uninative =
if they
>>> wish to build an eSDK?
>>>
>>> Personally I'm torn: I don't like eSDK not working out of the box, bu=
t I don't
>>> really like oe-core nodistro depending on uninative.  Though enabling=

>>> uninative globally does mean everything works out of the box, so foll=
owing the
>>> principle of Least Surprise that's what we should do.
>>
>> If we are supporing e-SDK in OE-Core then we should enable uninative t=
oo
>> on the same lines.
>>
>> It does improve the user experience so I am in favor of adding it
>> unconditionally. May be tarball can be hosted on oe mirrors as well fo=
r
>> redundancy
>=20
> I still believe this new feature is moving to become mandatory a bit to=
o=20
> soon...

perhaps keeping it optional for 1 release would be acceptable ? it also m=
eans
that we may not be able to develop core features using this and it would =
also
mean more testing matrix, which I believe is fine. Since we know non unin=
ative
version wont get as much coverage.

>=20


--CaWHH6cw7Q1vAwAsrXJPGLXVrVNiOw7jX--

--lMk4NieRnbD3gk4a9aU9VxjVLMxigSqcA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlguO7IACgkQuwUzVZGdMxTrswCeMVKuumSn65QctXmd6uLq3UUi
z5MAnjq6PwGsF5GX8bwrtUaikL++QFd5
=GChy
-----END PGP SIGNATURE-----

--lMk4NieRnbD3gk4a9aU9VxjVLMxigSqcA--
