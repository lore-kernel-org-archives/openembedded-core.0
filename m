Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id C01BB77C98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:00:32 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l21so39722145ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MGkBi8HJpq+OpRp8Y9iB2hwFZX7EklE8ztJIxgpJcAg=;
	b=itIsTgET8ciLSCDXXHbBwrKJST8yesKYB0CSbiiC0KdvmCJg6NriLB2BBt3orHd5C1
	E0ea78hZz5af/HZXSDcpAl0D7A8dST01NEMdluPkEjTcv7fC7TOI1RB6rNWe+yJQ7jqk
	CRpCgWrKHM6KOECCQvcOv4HWqSieDFI1LJL5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MGkBi8HJpq+OpRp8Y9iB2hwFZX7EklE8ztJIxgpJcAg=;
	b=deXQxao22dembDP1+b1J5t7Y+Ov3PQUJXLVhETCuUWakeGH2hRDBsrH1w6xwC8+rE7
	IG3csTaEDYcn9mYBWwNuUnD74cz5oLWiwgTt4MPH/ESSARxyAs1et2qPOcgavgfe+M7V
	LmeUHUMvaaXYRtDybKTCCzSKOrfMQvCyYxN+TiE7+L826iojsqqkUNHMr+kQxaYpWBP6
	RNA2SZ/1xQZlapYePm34SAYu2IjY4SRGl2ilgtgm+U1cREptoJ6imlAmvXy/QFe+M7yP
	nCk8vmus0Wv9RB1ytc9dfxPJ27He4EntLr3h6lODc3yHpevpPWY9Uu0uGa6KifYC8eu3
	qocA==
X-Gm-Message-State: AIVw1108LlzGVyASHi4CAnOaGsl7uX59XWQz1QVGYGhJp76BQreciTuf
	MptmCQae6K9JB3hR
X-Received: by 10.129.104.215 with SMTP id d206mr1784873ywc.31.1499713231727; 
	Mon, 10 Jul 2017 12:00:31 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id x9sm5129526ywx.54.2017.07.10.12.00.30
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 10 Jul 2017 12:00:31 -0700 (PDT)
Date: Mon, 10 Jul 2017 15:01:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170710190128.GE22707@bill-the-cat>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
MIME-Version: 1.0
In-Reply-To: <7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 19:00:33 -0000
X-Groupsio-MsgNum: 99915
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="reitHOQ4cdJB34v7"
Content-Disposition: inline

--reitHOQ4cdJB34v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> > On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
> >> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> >>> This patch upgrades the U-Boot to the 2017.07 release.
> >>>
> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>> ---
> >>>
> >>>  .../u-boot/{u-boot-common_2017.05.inc =3D> u-boot-common_2017.07.inc=
}     | 2 +-
> >>>  .../u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-boot-fw-utils_2017.07.=
bb}   | 0
> >>>  .../u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boot-mkimage_2017.07.bb=
}     | 0
> >>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.07.bb}  =
      | 0
> >>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc =3D> u-boo=
t-common_2017.07.inc} (88%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-bo=
ot-fw-utils_2017.07.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boo=
t-mkimage_2017.07.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.0=
7.bb} (100%)
> >>>
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta=
/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> similarity index 88%
> >>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> index 0e52f27df8..f27989daa1 100644
> >>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> @@ -7,7 +7,7 @@ PE =3D "1"
> >>>
> >>>  # We use the revision in order to avoid having to fetch it from the
> >>>  # repo during parse
> >>> -SRCREV =3D "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> >>> +SRCREV =3D "d85ca029f257b53a96da6c2fb421e78a003a9943"
> >>
> >> Where did you get this hash from, it's not in the U-Boot repo ...
> >=20
> > From the tag used by Tom. You can check it on his github repository.
>=20
> I cannot, that is NOT where the U-Boot recipe points to nor is it in any
> way an official U-Boot source git tree .

It's also on the official github mirror.  I'll go see why the DENX git
is lagging behind.

--=20
Tom

--reitHOQ4cdJB34v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY88IAAoJEIf59jXTHXZST6MQALA36ipOILBZIg5Q38VewnR5
PdBZ/n7X/sYKv7NCstTHd6B9+GPtF6Qzyi4l8DfZOvUdsznjCOLB/xDI4tL4xj5y
yvAqa9Q6sUvKKhcZzQCmBC0C0mq7qZtutqjpMiTluJCBRXM+sMHyGsqsSE40WT3J
DZ6Y78781b8GuqGm0djWFRxR2pbaTAHcksqIeArmPxlve3WvEBhzLITROT1G7bOz
AZMWbjEyG+/xcBJ3fL6J25hyfRk7gsutSlIaBN74dRKl3a8+Nx/WiO6bgYRZ1MBs
x82AGO3OnH+jVUozpTNPNX83QrAThsKb/7o4MMhvR3FRFiLmTyNraL9fthJ51t/5
QtaD5rpn5m1a0vMo9If88vU2tW1LvoFVfkOJxBjHyxVq1m7dFOqKMWWFmtDGCVnO
2xfcbA2DrU3fK0W8Qn1v9ULCoAoYDnN5FdCv4Hq7lSoyybo+2GOOiNn0q35dX7di
uyGV8PQIVwBuei7slqUvzvEHc5rjvdDTGA9LA7SDEBqpLK1pWOJHNS5aOHKSBGLF
RY3oPwcOLyR/OvrO02zbsOTRrO8kuzZiNLXNAPcfAyOtlgeJjI3sT9QELrHwp17Y
aENiSPfQSmz2fkJJ4eekdN0mCd6KqC2ivCLXokz+t+tUZYIV2rDzPFeGHagOgKv0
sUIzBYRHCnhX6fiprdBq
=jgE1
-----END PGP SIGNATURE-----

--reitHOQ4cdJB34v7--
