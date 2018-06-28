Return-Path: <clopez@igalia.com>
X-Greylist: delayed 955 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jun 2018 02:44:17 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 102A2605BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 02:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JNLALVC/bl39JkyrW+uAS5a2n9m4qmnNJrid1250Ls4=; 
	b=Y+n3hG+9mTPK/aXzNX1htSdV0munQhb9YH27LGMnVSSnCb9AJ4Spu1gQUf8PbKYSihPTcrR7ks3YS96xMQTVAttJ6E/dKQXy5TlnR0FOKPisPGij4N2h4WV4cIMzY7MDEC3jdcElgwHG2tZvcz6Pn23mzWAtt/4cdNXaOeWeX41uZs1UKds6H7GmUNCwCF3mLZnpVoLxiRVMFqpHmdmBw1dr0iSP6CMv9eRwT4CBHgax3t+/OGJju1jGFdmf/U8BcX2VMWKiGqgwHP348ETNirVmDnPoP7FjF8m3C+MkzqYAt6xb1JRmQyce3EnhXpLc4EVN2t4jb0IRVi24KJ3Csg==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1fYMfU-0005xS-UE; Thu, 28 Jun 2018 04:28:21 +0200
To: Michael Gloff <mgloff@emacinc.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
	<CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
	<CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: Michael Gloff <mgloff@emacinc.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <8cf18c72-e899-b425-dc28-9ad2f853ff18@igalia.com>
Date: Thu, 28 Jun 2018 04:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Sumo webkitgtk fails to compile
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
X-List-Received-Date: Thu, 28 Jun 2018 02:44:18 -0000
X-Groupsio-MsgNum: 112973
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="l5Oq85uKWwCMAsiAwiugOafWOvmb09rje"

--l5Oq85uKWwCMAsiAwiugOafWOvmb09rje
Content-Type: multipart/mixed; boundary="ATekw5JmX3NfwTUDPf9yVhrYDGgcIZAyW";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: Michael Gloff <mgloff@emacinc.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <8cf18c72-e899-b425-dc28-9ad2f853ff18@igalia.com>
Subject: Re: [OE-core] Sumo webkitgtk fails to compile
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
 <CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
 <CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
In-Reply-To: <CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>

--ATekw5JmX3NfwTUDPf9yVhrYDGgcIZAyW
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 27/06/18 19:27, Michael Gloff wrote:
> # GL/GLES header clash: both define the same thing, differently, on 32 =
bit
> x86
> EXTRA_OECMAKE_append_x86 =3D " -DUSE_GSTREAMER_GL=3DOFF "
> EXTRA_OECMAKE_append_x86-x32 =3D " -DUSE_GSTREAMER_GL=3DOFF "
>=20
> I think the best thing to do it to turn off USE_GSTREAMER_GL for all
> architectures. Would a patch doing so be acceptable? I've verified that=
 it
> will build with the _armv5 case.

USE_GSTREAMER_GL is a feature of WebKitGTK+ that allows it to leverage
hardware-accelerated video decoding (for example: on i.MX6).

I think is acceptable to disable this for ARMv5 (because, AFAIK, there
isn't any ARMv5 hardware that can leverage this in any case), but this
should remain enabled for other architectures.



--ATekw5JmX3NfwTUDPf9yVhrYDGgcIZAyW--

--l5Oq85uKWwCMAsiAwiugOafWOvmb09rje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAls0R7sACgkQllCJzmuV
+IJZnQ/9H42osqIj2/zJsqoW/z7JPa/ZNQ7YijMobdhQ1SWVY9D5mrpqY4bh3w+Q
BcWsM4Pf9pQBb9vnpFlyRwkVj05b3/GPEI9oYNkua2+mpQfTeiaIuZrAcITeWPgQ
j+fM49l9/kG84Jsm0mnOYxBraiV3wKWWtUFFwvK/rI3DlLPQAXal6HKzyTx3Y/ow
Y8v1Kn/BH1s6VdUMxPBqvOeAnAXd/NurKlUVAu8eY234FmXpjgdMRvt+w+zaJng5
/JgeVRM4n6Z/DGxK2nFbejhHip+PxNmXgUI1xQ1yDB+47wY0RWmAIgzVKNbEz25L
eLOpnnDcLJnizbgHnWkfSX+aaGMwuY7Vp5aCk0oW6VilogAwg0ashRpb9xFExek8
DpgWMzPGTg2cvboUd13kL9LEkz+lXYUY2/gNAusT+e2Lz6syFfyH+jznqGbjUyC+
Ay2kU2tPOSVJ9j8s2XkeY4xVMvm/gF6l9ZvDYEZxisFTdn2kXF1jIyQAdzGTlwZa
67/NuN8hTbE7801F9AXUnRBZLG4u9jdpiKaxBu0MPJ6TDaDlCvuDWMuqPOJb78C9
CKesXBJb6YbcLRv5DLopoK9Abh4w/0ELUcZ+RC9770N6+k+c++GWv6clrTv4m3Qg
QupIH6yBVnBLNSt/xudbkJu8vImt6og/7TTwW01GTT0Y0DfvakU=
=c2fq
-----END PGP SIGNATURE-----

--l5Oq85uKWwCMAsiAwiugOafWOvmb09rje--
