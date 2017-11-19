Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF3FC7832A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Nov 2017 14:14:41 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id a4so3361755ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Nov 2017 06:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I4oxuWqsV+HNaF7o9URzxIGa/esttLktJSw3tABpjvc=;
	b=MMY6Dodc/wMnjzeNeA2whhf79iMrX9EuzKyQhXw/8DXRQcmzgtyNVbXgGLSlaCNa4R
	IRIqaplexg9jhnnsb90jVVqiJ1W/pM0zVlOe33WtT5qUaFpn0xMiSSJo8uuSdwiT1k73
	dXF2P3fjzkBCR2ExwQlMZ8NR8Ygd3B+y5lxFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I4oxuWqsV+HNaF7o9URzxIGa/esttLktJSw3tABpjvc=;
	b=mOpkgAApcyydxUUmsW0gP98JnVJvAofY2id+hUgJWkOIY+m0S0gn8sMhf0F4j6L3Df
	U3eMpuScSKbF5iaDn6Bw6w0yWtnUn60KUb10k5MbPBmeflZPqAzC0b1h5UEbl0qVmbxT
	U/KoX5iX6cOfCys9runVljQBj61v6iqlsRp7zyUEL4FJd3lvKe9JKxK41gPa/jHzlQUY
	cTvW4LP/NlPDK4Qvql/bB2EV5e08FcSNjP1Xfx0LplUUPggbEzh40W038oGk8hcJNwGH
	WbDwmX6li9Oye9KDLG2YymCVwzQCFIPaNZeMvaKizh8H1VB1F9F9OOMVZGj/h3XnPnt1
	n9cQ==
X-Gm-Message-State: AJaThX7favrrepG8tHLIsn41XiQZciNghcrc99gue/1AKHEjCMwZXf+I
	z7vyAeIPE9MrvKjhIAxf7wNyLQs13DA=
X-Google-Smtp-Source: AGs4zMbVEnEYm350piK1NkMCgQ+Qchwhww4ZrvpILbkfJxfgtc5iGbh5qrypX85OucjXYNC7T3+UWQ==
X-Received: by 10.129.177.68 with SMTP id p65mr6697121ywh.85.1511100882277;
	Sun, 19 Nov 2017 06:14:42 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	d184sm3619091ywb.42.2017.11.19.06.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Nov 2017 06:14:40 -0800 (PST)
Date: Sun, 19 Nov 2017 09:14:38 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20171119141438.GA9986@bill-the-cat>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
	<20171117205918.GX9986@bill-the-cat>
	<50bf044c-899c-cd0a-84fb-af563ee46546@denx.de>
	<20171118141419.GZ9986@bill-the-cat>
	<31a42ea0-2ec9-565a-aec2-2a4fbf2a1a06@denx.de>
MIME-Version: 1.0
In-Reply-To: <31a42ea0-2ec9-565a-aec2-2a4fbf2a1a06@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Sun, 19 Nov 2017 14:14:42 -0000
X-Groupsio-MsgNum: 105261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="92jpbWK/k6ZbIj2k"
Content-Disposition: inline

--92jpbWK/k6ZbIj2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2017 at 08:29:36PM +0100, Marek Vasut wrote:
> On 11/18/2017 03:14 PM, Tom Rini wrote:
> > On Sat, Nov 18, 2017 at 11:19:13AM +0100, Marek Vasut wrote:
> >> On 11/17/2017 09:59 PM, Tom Rini wrote:
> >>> On Fri, Nov 17, 2017 at 08:19:07PM +0100, Marek Vasut wrote:
> >>>> On 11/14/2017 07:32 PM, Otavio Salvador wrote:
> >>>>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
> >>>>>
> >>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>>>> ---
> >>>>>
> >>>>>  .../u-boot/{u-boot-common_2017.09.inc =3D> u-boot-common_2017.11.i=
nc}     | 2 +-
> >>>>>  .../u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-boot-fw-utils_2017.1=
1.bb}   | 0
> >>>>>  .../u-boot/{u-boot-mkimage_2017.09.bb =3D> u-boot-mkimage_2017.11.=
bb}     | 0
> >>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017.11.bb}=
        | 0
> >>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc =3D> u-b=
oot-common_2017.11.inc} (89%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-=
boot-fw-utils_2017.11.bb} (100%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb =3D> u-b=
oot-mkimage_2017.11.bb} (100%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017=
=2E11.bb} (100%)
> >>>>>
> >>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/me=
ta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>>>> similarity index 89%
> >>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>>>> index 02e51242cb..bfdf1a0d8f 100644
> >>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>>>> @@ -7,7 +7,7 @@ PE =3D "1"
> >>>>> =20
> >>>>>  # We use the revision in order to avoid having to fetch it from the
> >>>>>  # repo during parse
> >>>>> -SRCREV =3D "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> >>>>> +SRCREV =3D "c253573f3e269fd9a24ee6684d87dd91106018a5"
> >>>>> =20
> >>>>>  SRC_URI =3D "git://git.denx.de/u-boot.git \
> >>>>>      file://MPC8315ERDB-enable-DHCP.patch \
> >>>>
> >>>> This patch ^ could use a refresh , since it applies with Fuzz now.
> >>>
> >>> Honestly, just enable DISTRO_DEFAULTS for the board and post that
> >>> upstream instead.
> >>
> >> Or that, but someone would have to test that first and the patch author
> >> does not respond for some reason.
> >=20
> > Adding in Ed..
> >=20
> > Yes, it would be good if the MPC8315 got run-time tested more often, but
> > no, a build test is sufficient I think for changing a few options like
> > this.
>=20
> I didn't have very good experience with changing such stuff for random
> board and not actually testing it thus far ...

Since we're just talking about enabling a few more generic commands, I
think you might be being a tad overly cautious here...

--=20
Tom

--92jpbWK/k6ZbIj2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaEZHOAAoJEIf59jXTHXZScOgP/3bWCZhk9ynN/fEi/d7OJahC
ulY0SC9iMmGv1UysovceCV2D1TbE5ZjIGlRJVlKmfcn4uOhYMbHOB9zu9oO2iH9B
4eOffDdWE0lfNeS+kohq9TUMMYRHed4fdnT1dTFVZIOTEQKjw1mLAoytFSCSLo9H
7K+JW+9tdzCPElVJM3IsjIIHrwGnrZOIE4gDyW4/85KxkC9wUEGxrMZaFun+9xyT
RvNR7RmIAvbJNddDvEqegSPo9xUwp4T82nzl6yAfFxBUh6Df7zEcJT6nfBQt+4mb
EN/pdUaL+/GJTe3e19NP1e364OU0UY0ESQxxSWxUwNGeHgWs5ujHc8IGxPOQHkZA
wbZUGrlF8uB43EVLtjDE6ljzVvuwdPzr4iO1d2OPFX4nqlmQJ2ClD62ZQIOY8ZmD
Nf4A2VcbAPGm+OKCvSq3jIj5Hkjss9ile5rTAae4lFgDwh1EGgdMg7vGqqg4CsOn
Mc5c9Bc7+/CYaUXR63fdMBJ1YRxJfEJQcpCdPqCv08vLeTQxrXKXWL66jBckLhDe
yNaD0Zw1/W8VrPKJCSurgKWoYmAxavWiVADT2f04nI1S4oGEzUY2xlgbE7culQp6
AynEUX8gpPxsszXIvzrVnRzgmOp7U0BV70yS9cX2gm79HizdAueDOkb79552d4F1
6Zhxo0ITeBu4awWE98Uu
=w7MF
-----END PGP SIGNATURE-----

--92jpbWK/k6ZbIj2k--
