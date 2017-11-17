Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8260E7874B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 20:59:20 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id r186so1885823ywe.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=alF5A4BjXSUhZxJu/Kw1LsTFW3XeVjGC95byKzlgUhA=;
	b=IP5LL4nv+I8Qjer059B57yDys1soLwMudYEUbdEr9vGhlkN1k7eDtSrFA8CMQ2//7z
	TrmnJIGorqp9WLfHd7cEPUM5AlwMkTV1wgtmWzJx26GNN5m40zZrtx93VG7AZPYgJx3M
	b6kNxKlAZIZlHfOIAz4qWLhmfbnHZgpJ6r9K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=alF5A4BjXSUhZxJu/Kw1LsTFW3XeVjGC95byKzlgUhA=;
	b=BB29tw3+eFI71F1LeK9EQmR3xEaz8/BhxvnxqNHHPsee8Jva2P6Gkuoa0emAN7KNfB
	vaamZvRWo+KU2wtiDuQxySyvK7GPq9dZ1Wt6RNWLXBgP9wjbEnnUedyoMiWe8PXol2Q9
	1JFnpfBFtyqHMZBuGvovoJmqzahHrSO83VstT/KXSXACEDwMyS+ZGZ4iIW+linyyqczQ
	MNXm6ntTx1A4u0Sp/peh+SmSfCeaj23h+IhtxLrMCdMWjR0Xu1CfTlM+TN7Y0z4KdKXc
	tlO850TYJxcWFRUL7hNwfD+58PWNxfiBRmt0E8ICMDcoEh2U1vw1yZF/wmmJSo4O8upu
	pzKw==
X-Gm-Message-State: AJaThX6ZRsy5KXCIAgQ6yoN8rTySeedWAijJN6GVLaN/dBVp333AWlCa
	w/mysH8NKQcKanpy0Nz+gGLz6MEW3SI=
X-Google-Smtp-Source: AGs4zMZYTV/CeSWlTCpNDS8F72YfUSZzyur/01NKg87k4jXrdw6Z7MGK7d0+VbeVAzPj4un5YEm7jQ==
X-Received: by 10.129.54.15 with SMTP id d15mr4212149ywa.149.1510952361226;
	Fri, 17 Nov 2017 12:59:21 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	d139sm1907352ywe.49.2017.11.17.12.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 12:59:20 -0800 (PST)
Date: Fri, 17 Nov 2017 15:59:18 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20171117205918.GX9986@bill-the-cat>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
MIME-Version: 1.0
In-Reply-To: <c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Fri, 17 Nov 2017 20:59:20 -0000
X-Groupsio-MsgNum: 105214
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zr5irScySb2At5ws"
Content-Disposition: inline

--Zr5irScySb2At5ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 08:19:07PM +0100, Marek Vasut wrote:
> On 11/14/2017 07:32 PM, Otavio Salvador wrote:
> > This upgrades the U-Boot from 2017.09 to 2017.11 release.
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >=20
> >  .../u-boot/{u-boot-common_2017.09.inc =3D> u-boot-common_2017.11.inc} =
    | 2 +-
> >  .../u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-boot-fw-utils_2017.11.bb=
}   | 0
> >  .../u-boot/{u-boot-mkimage_2017.09.bb =3D> u-boot-mkimage_2017.11.bb} =
    | 0
> >  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017.11.bb}    =
    | 0
> >  4 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc =3D> u-boot-=
common_2017.11.inc} (89%)
> >  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-boot=
-fw-utils_2017.11.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb =3D> u-boot-=
mkimage_2017.11.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017.11.=
bb} (100%)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/meta/r=
ecipes-bsp/u-boot/u-boot-common_2017.11.inc
> > similarity index 89%
> > rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> > rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> > index 02e51242cb..bfdf1a0d8f 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> > @@ -7,7 +7,7 @@ PE =3D "1"
> > =20
> >  # We use the revision in order to avoid having to fetch it from the
> >  # repo during parse
> > -SRCREV =3D "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> > +SRCREV =3D "c253573f3e269fd9a24ee6684d87dd91106018a5"
> > =20
> >  SRC_URI =3D "git://git.denx.de/u-boot.git \
> >      file://MPC8315ERDB-enable-DHCP.patch \
>=20
> This patch ^ could use a refresh , since it applies with Fuzz now.

Honestly, just enable DISTRO_DEFAULTS for the board and post that
upstream instead.

--=20
Tom

--Zr5irScySb2At5ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaD02mAAoJEIf59jXTHXZSOVkQALT0N84bwvifVHj/3zM7CXT6
fIZOiMXFoUWNvLFUHA3K5Cno5Yac/a7IRSEOxGCru5u6R+VfymGWiigQzxJ5T9Yk
aPYOR1WDvQfrnK6rtcc0xRmh35F6QKeEWuRNdqfOQhJQnth2a9dI+C+FTxaQI827
7eJrhi7pJ0CpqHm6iIUoPRCS2BwDySimNYV45+ABcJYC0qXdV6DwkoFc2ofpsNd3
TSSQNqawMAWlII7ItYbaXsaj3k9njweUTcNWbZbKvlgo4gRhi623ZD1iAiPwqIoO
OshMHWRReOP0tMEgoHZFmMYOjJLwkEFg9MGVMDTxi+Js9UdVHjZ9YJUIMiAPW/Gh
EWDTEdf7QOgGXETXPVm6hDj8vJzhQIzcqtussG8i98VRwBIpc2BWSXqpuECEf9lM
FhWpwDIjLJm66HfeFwhhd10GcNErXNxsXoU/KzT1SYturANpP9pXyQNdp06mq2fp
k7HclBIGPFPKO/bHF8wmi8ciyxVAAKK/sCIY1cRuwdLSVxOOO2PxGBnV+q012KDQ
rL5fgwtO0jGugV9mIi5j7SstIeI7pSELwchlC1Ts7VAIDAeGWcqqTrm5gxjhmYfq
6nrEBsVsJKoDR7S+sA4OxZT032Ux+G2QMZO2wD0QK1qcDYkPmaHvv6SnFMjxHZzz
oh4mpnwYyNbW9pPIJiyd
=Oq4X
-----END PGP SIGNATURE-----

--Zr5irScySb2At5ws--
