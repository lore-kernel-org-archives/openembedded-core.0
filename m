Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 824AF78207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:To:References:Subject;
	bh=HIz+LZwh+xSFgADXCbtigFFvc923xtUIDSok9FOk6BY=; 
	b=X3zHlVvN8V3eUeMHD2yalo0l9VsVz671rTEWWYjVjU4KgEM435iGtV/UE2HruecEDhHopIBbF44HYiKlCY6OBjEQad0LYWyd3x+3YEi3IhbvqDXHt6HwuHoObILGljZN2EJ5s1o6aErmBoUhBDvt3t1ttq2LNtauf0cDqnzvEbPcyu/urgv1S0/Nf5sTW5m3852FeTXWdXIHAPUE37VeQ5BpFM0MVqkci7n48QFnKZzvmvyYvACesGQh7BXv/O54hGrAtwDW+JTdlLtCX6qH3vKHoRQSbLAVtMdvwtnPUtO7uvq1UpkP/+ImVk+HQ8uHjlbHMKIMZybxC/qLzcrOAQ==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dnRXn-0000Vl-Ed for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 17:38:11 +0200
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
Date: Thu, 31 Aug 2017 17:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 Aug 2017 15:38:11 -0000
X-Groupsio-MsgNum: 102244
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="R4KE5gAQelOwsfoC85B3WB2WisLuCeOxo"

--R4KE5gAQelOwsfoC85B3WB2WisLuCeOxo
Content-Type: multipart/mixed; boundary="r9pRpXUuKSsWsdTEImfqKjBDbj7gwuINn";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
Subject: Re: [OE-core] [PATCH] initramfs-live-boot: disable
 systemd-update-done.service on live images
References: <20170831122335.6864-1-clopez@igalia.com>
 <CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
In-Reply-To: <CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>

--r9pRpXUuKSsWsdTEImfqKjBDbj7gwuINn
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 31/08/17 15:46, Burton, Ross wrote:
> Presumably/hopefully systemd isn't hardcoding /etc and /var but respect=
ing
> sysconfdir and localstatedir, so the touch should also use those variab=
les
> (by sedding the script).

https://github.com/systemd/systemd/blob/master/units/systemd-update-done.=
service.in#L15
https://github.com/systemd/systemd/blob/master/src/update-done/update-don=
e.c#L72

// losing the hope


--r9pRpXUuKSsWsdTEImfqKjBDbj7gwuINn--

--R4KE5gAQelOwsfoC85B3WB2WisLuCeOxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlmoLWIACgkQllCJzmuV
+IJoVBAAngReZy8ea3UoXBK2viqpL+7AsOL/sU6L+o8KUsSNgh8FLCNsUB/lvUt2
16Z3Fepcksqz0wbaQxbdmb5Slsq+jV2kj+Y7K99FDzZpoLYqNfmemGdz9EgqWX59
F4lHlNcc8nHboKORhzF+kxecm9JDDxtEarQKLo1XNYsypKkODZ5OsEoij3zzFc5X
ibBpdY7A5iG86/ykiKHR7k+Xhy3tl6QUAG93CFKnUxRUTh0AmCXo0F1a/rMI+fJg
XPm3YhjaJSkQ8nHjh7LS0rklz7LBqGTUZjgqHl4IRWiBRGJLBbCtkTN2boIAvXYS
hokWO8EOekO0YhKtHWNAmI+U4rok//cMv5M5dWNvkwqxjXER2wAO9j39wgcXkQVo
ZnocqT7qMKbljsV6KFUpi863VKHgYwm/Z62C2V1+IB1VRjExnuM8RfcxLIxoMM9m
vOi8mx13AWg27R6kx+Ocb1f3CW7gmdplcT/PP1ZLaZip8neBjt3lwE5zgd2ASOEM
TCgNG1ZdL0mAxuQEdTmOV46Dp8UMAGR361dbAQt08ENk2HfD9BznbmXK16Rnz3qe
c4HULyeQl7PFF8l8nrQtS8sLvZnFSwfEQZDvja2Z4Ab1kEnlflPXtF2vwHZRKTy3
WC60Z114u4k7MZGpQ6vojcsoj2RUTNrZBMsdUFJJicFXA1grSvU=
=WLx6
-----END PGP SIGNATURE-----

--R4KE5gAQelOwsfoC85B3WB2WisLuCeOxo--
