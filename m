Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 9936C7840F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=STaH7DmmMGdFEnga77pAHw7WEjPOi+4wU+mKtWgnYTQ=; 
	b=m9X1ZhdO9XjjwN481y62FThueEZJHuo2qQ6Fgn9Oe+6EaaVEC8AO6wFsHZ0Cs4J6pppXoXKOgWFKMgwjj6aJHACNDRRXiRzkdXEGJTgDB8EssTREKGwDV9SgOdU+7GFemWBkOz+jqderhh8Wo5bexwcDjIBddB3Sg1kECuXaSk/7dD4JALQ5cHsAUC2iwEEStZ49UtHU0ieYEFPRDGzDUayBEir0ciktnanJRcDmPRG0Jke/XUyvdw6TenNcWEYm5wqvodUaSH5oiFLxfCUxdzwX2A/A3i/x0ksjIJQCesDF9TAfyGuGn0aoV0D+q7gX5ZfSga6bN29RO/ceB3txGw==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dnSmt-00006h-6i for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 18:57:51 +0200
To: openembedded-core@lists.openembedded.org
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
	<ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
	<CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-core@lists.openembedded.org
Message-ID: <a97b1a6b-c037-e7ad-4e6a-f770439b7ff5@igalia.com>
Date: Thu, 31 Aug 2017 18:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 16:57:50 -0000
X-Groupsio-MsgNum: 102247
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="3PKXaNK3bmj2x3roWoxI5WISeM3WDwXvo"

--3PKXaNK3bmj2x3roWoxI5WISeM3WDwXvo
Content-Type: multipart/mixed; boundary="w9Xs72H8MiGoxXXacx43U57Q3ntPtwBRL";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <a97b1a6b-c037-e7ad-4e6a-f770439b7ff5@igalia.com>
Subject: Re: [OE-core] [PATCH] initramfs-live-boot: disable
 systemd-update-done.service on live images
References: <20170831122335.6864-1-clopez@igalia.com>
 <CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
 <ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
 <CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
In-Reply-To: <CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>

--w9Xs72H8MiGoxXXacx43U57Q3ntPtwBRL
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 31/08/17 17:48, Burton, Ross wrote:
> On 31 August 2017 at 16:38, Carlos Alberto Lopez Perez <clopez@igalia.c=
om>
> wrote:
>=20
>> On 31/08/17 15:46, Burton, Ross wrote:
>>> Presumably/hopefully systemd isn't hardcoding /etc and /var but
>> respecting
>>> sysconfdir and localstatedir, so the touch should also use those
>> variables
>>> (by sedding the script).
>>
>> https://github.com/systemd/systemd/blob/master/units/
>> systemd-update-done.service.in#L15
>> https://github.com/systemd/systemd/blob/master/src/
>> update-done/update-done.c#L72
>>
>> // losing the hope
>=20
>=20
> Sigh.
>=20
> If you promise to file a bug against systemd moaning about that, I'll q=
ueue
> your patch. ;)
>=20

Better done than promised! :)
https://github.com/systemd/systemd/issues/6716

Best regards.


--w9Xs72H8MiGoxXXacx43U57Q3ntPtwBRL--

--3PKXaNK3bmj2x3roWoxI5WISeM3WDwXvo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlmoQA4ACgkQllCJzmuV
+IKQwQ//SJE4k3enuHcxiRV0iqtHrwJSYA9uoOh3bOnesTDmoh7nAQM/f/J28v1M
Dr6wKs9Q2yUet1OEsF2Jk4XiwfRVh+keUuLoHdSkQnv7RFIOGvW5OoljYbspgDae
elT3WrORb1OfAfnfQ40BFzJVC4+5+Vwo9/q8WrU4HJG5EiqPJlMAKuu2ioe7X6i2
O1Z8+/FUmlROM5kNn5QRJm0z3ImnuBrzZs+1pcZzT/xHwmoMZFj0vFq2TUBDYzs6
M9Qsbf6Q651aS928dJSjSuHswdei8U/aFXLu7DMhjBq4D6tQA1bOgFGjxrkEkRJx
F9l7D/8VJFZtV5y6mPtlo04evxCTEKukv8qrG/IglqYIEaS7e3db8sPWDfkyBXae
wQ3U2vqMm/PrusFLG1Rj10Xkzx7XTgqQBpIOZf2iDHPqABR9HmZQ3hdroown/UBF
zau0861qgf6IwVFlFxFvAYb0+kuSgKe/sr6oAmW8MmQXBBPSKgCoYPMaPOv4kaSP
uT1aUTpfDGuNHADAWH3mav9XVFpDVSSh8puxol5oVQEzvR+82D53FffdTmDde3Lh
JZgl2Nsg4F8tSkgLhuUUHEhU/UfSfs+1cKlNoOuGuTzXTgNkWYpArZo+BDT8EuZv
eT6NWPLkR1klKWVx7vO9cpCQQFY+3w8fAO4ChFU6bj/rJI3C6E8=
=TfOy
-----END PGP SIGNATURE-----

--3PKXaNK3bmj2x3roWoxI5WISeM3WDwXvo--
