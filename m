Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A402B70101;
	Thu, 17 Nov 2016 23:19:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c4so9697455pfb.3;
	Thu, 17 Nov 2016 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=7+1kuyrq8rNOn+RFPqPmtV4HNbziA3wU4RPUmO+mCOE=;
	b=hcUuvLdxwC3YywVaYpttJjyQhQcBqtVBvuHfc9y9+e5q0NPZytThVgbZYwv/Mjh3XJ
	tzBpvPU0kd55mJGnYyirwIiagYzKqWLrVCTgKNFbgsJjp48JuDxmZ89xXcRzjBxw+hFv
	W1xfvfgMzANd2P+KTJVmIszExF5LALMT+8M6SvHSPHQ6B7yr7FApL90WJo5RUnFNtENv
	QgHjQkrmsBAPL426cPb9j7c+TtWx4/rjylLTmf51ydAz4Xf5S+8wbPnVovUzWM4noryb
	VT1TvNXI7UcsEQMgXgfoHZBwBnBTUU3Fw5EvryDR6QyRNiPThTiQduXWejzvhc2ZsfE9
	sL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=7+1kuyrq8rNOn+RFPqPmtV4HNbziA3wU4RPUmO+mCOE=;
	b=bfiznElYtuJTmzna/bjLQVCVoq31ebSJfBj2t6LuYYTJYoSs7i28YBklVa46Pw9jK/
	rQuPhWgWhhdGfEO9yHnp6A+RR/e+dsfHMJAPqPvV6cccWy2my9LmhYMHK87WwOv+Eylc
	1uSDB/R3aLM6vJUKEVBjWlQphsihrZcxcKAEfR3ZY0VrJr7EAjK8uHX3fOeMbs7UjaQy
	tQmqQ7adxV8/GxPiGydF22Os4BjROk5vpjAIIUB5KwsOo5KWz+2BN9wbuZs9AUVrTuL8
	eNMCJkeJeGTQ/E1SzwDBtmGyrTQoIZaIjqGV1dzAvU0Hy/JghAjc/8iL+hh3Ax4Lb54c
	nzHg==
X-Gm-Message-State: ABUngvfw5NbPYlDEG9c0swVAuZDx7FNrm+HU4YiTMMLqc8UTfKeM93YlC2WEQ6PJnX7m1Q==
X-Received: by 10.99.217.81 with SMTP id e17mr7002204pgj.127.1479424771680;
	Thu, 17 Nov 2016 15:19:31 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:952d:89df:6fe0:f7d9])
	by smtp.gmail.com with ESMTPSA id
	g63sm10860538pfd.60.2016.11.17.15.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 15:19:31 -0800 (PST)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
	<CAP71WjwJDTVsAcU9YrVh0uBcQ87Xt6HB9fCuj_t-jHcaGsjEWw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <0cc6e1e2-aeca-b999-5123-768cac5213b8@gmail.com>
Date: Thu, 17 Nov 2016 15:19:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjwJDTVsAcU9YrVh0uBcQ87Xt6HB9fCuj_t-jHcaGsjEWw@mail.gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 23:19:30 -0000
X-Groupsio-MsgNum: 89553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TfXk6KthHRLWO8pA9Jt4TI0dGFmoehEWi"

--TfXk6KthHRLWO8pA9Jt4TI0dGFmoehEWi
Content-Type: multipart/mixed; boundary="B8uWPQ7arrGov3LRhbwgUOMrNld60nEOV";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "Burton, Ross" <ross.burton@intel.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Message-ID: <0cc6e1e2-aeca-b999-5123-768cac5213b8@gmail.com>
Subject: Re: [OE-core] Enabling uninative by default in oe-core?
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
 <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
 <CAP71WjwJDTVsAcU9YrVh0uBcQ87Xt6HB9fCuj_t-jHcaGsjEWw@mail.gmail.com>
In-Reply-To: <CAP71WjwJDTVsAcU9YrVh0uBcQ87Xt6HB9fCuj_t-jHcaGsjEWw@mail.gmail.com>

--B8uWPQ7arrGov3LRhbwgUOMrNld60nEOV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/17/16 10:56 AM, Nicolas Dechesne wrote:
> On Thu, Nov 17, 2016 at 7:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
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
>=20
> I am not sure how people would care about that (yet ;-) but uninative
> does not work for arm64 (host).
>=20
> Build Configuration:
> BB_VERSION        =3D "1.32.0"
> BUILD_SYS         =3D "aarch64-linux"
> NATIVELSBSTRING   =3D "Debian-8.6"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "qemuarm"
> DISTRO            =3D "nodistro"
> DISTRO_VERSION    =3D "nodistro.0"
> TUNE_FEATURES     =3D "arm armv5 thumb dsp"
> TARGET_FPU        =3D "soft"
> meta              =3D "master:9303d8055c45a0f6af295d70a6f6a8b9d8d8a7c9"=

>=20
> ERROR: Uninative selected but not configured correctly, please set
> UNINATIVE_CHECKSUM[aarch64]
>=20
> I don't know much about it, but it would be nice to fix that before we
> enable it by default. I will try to have a look at it more closely..
>=20

Someone with aarch64 hardware in build boxes could take that up. I dont t=
hink
yocto project or many community members have access to hardware. I would =
be
happy if it informed me and continues without uninative.


--B8uWPQ7arrGov3LRhbwgUOMrNld60nEOV--

--TfXk6KthHRLWO8pA9Jt4TI0dGFmoehEWi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlguOwEACgkQuwUzVZGdMxS5uACdE+CaRzJHwMXoyDNXEfqiKaze
hdwAn3rJvR/Qo6sIy1OyQCW/GLX+TI5N
=r5Ak
-----END PGP SIGNATURE-----

--TfXk6KthHRLWO8pA9Jt4TI0dGFmoehEWi--
