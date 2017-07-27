Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE4378444
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 22:43:47 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id l82so56507535ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 15:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+YVoCc9uKfciuw/ulBrhAFxenGL63VlrCUM6M6BWz5w=;
	b=jpTRDcpLtFYGLAWCSbd9htOx+BcxSFDADkiF0jHS/PFnoDe6T3dkHHi8fSr6wVwzlI
	UzaeecxP4y2Pb2eNYP/7tVcD8EBRuDQ2AEU1JOQOiB2mC+qLijijIjzMuRmGm35AdUkO
	scQSZ/fg15f18sO5NcvqdqvclxtlUy0mWGH1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+YVoCc9uKfciuw/ulBrhAFxenGL63VlrCUM6M6BWz5w=;
	b=H6Ux2GIvfaUgLt6EGIOqxNv2lniCC1B6J/P2o6PZ49Fc3JNuvN1T3Ulv8OEauuynL9
	n65Vo6Drzg5govZyIUnxd13fH5/EBfw3BxSAb3C855LRx0BUV8MvVP0sqLT8QMMBeHhg
	5Rn/dlksS3aNuDuZGq30MTPVGLquw9Mnwm1WI+nFw+VlK1dZZVxqouovD5me/PUahk2d
	dU2N6mcYNbE+P3+w5Z6VQG0lBalrko4XgASw6gFOlksmCW3/+EJh+4dsa8TDzA5dtJZf
	CLHq9NFaNEeEPmM8P1YN4Kmb8s23LmtMs+/bLrZIz/PrUghTH15yTiC+lU27+nud2Y3C
	oQFA==
X-Gm-Message-State: AIVw113daYaByXDRvlfjAsoXHSjuK47fPhQSS8prg2d/z9WNnR5oDKzM
	JUNUtNRQPqKPRYVj
X-Received: by 10.129.85.16 with SMTP id j16mr4718133ywb.437.1501195428523;
	Thu, 27 Jul 2017 15:43:48 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:81d6:3916:37bc:8569])
	by smtp.gmail.com with ESMTPSA id
	j11sm7342835ywj.96.2017.07.27.15.43.46
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 27 Jul 2017 15:43:47 -0700 (PDT)
Date: Thu, 27 Jul 2017 18:45:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170727224507.GE26163@bill-the-cat>
References: <1501012696-2666-1-git-send-email-trini@konsulko.com>
	<1501171718.27323.389.camel@intel.com>
	<20170727162010.GB26163@bill-the-cat>
	<1501190055.22282.171.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1501190055.22282.171.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH] image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types
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
X-List-Received-Date: Thu, 27 Jul 2017 22:43:47 -0000
X-Groupsio-MsgNum: 100781
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kLrc3wbfh+mG5kJY"
Content-Disposition: inline

--kLrc3wbfh+mG5kJY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 10:14:15PM +0100, Richard Purdie wrote:
> On Thu, 2017-07-27 at 12:20 -0400, Tom Rini wrote:
> > On Thu, Jul 27, 2017 at 04:08:40PM +0000, Wold, Saul wrote:
> > >=20
> > > On Tue, 2017-07-25 at 15:58 -0400, Tom Rini wrote:
> > > >=20
> > > > The vmdk/vdi/qcow2 IMAGE_FSTYPEs predate wic.=A0=A0As such, they
> > > > provide
> > > > some similar underlying functionality in order to produce a
> > > > "disk"
> > > > image
> > > > that in turn can be converted into different formats that various
> > > > hypervisor types work with.=A0=A0They do not however provide the
> > > > ability
> > > > for
> > > > other disk image types to be converted into these same output
> > > > types.
> > > > Furthermore, they are less flexible than what wic does
> > > > provide.=A0=A0This
> > > > drops the old style vmdk/vdi/qcow2 types and re-introduces them
> > > > under
> > > > the CONVERSION_CMD framework.=A0=A0The equivalent of vmdk is now
> > > > wic.vmdk
> > > > and so forth for the other types.
> > > >=20
> > > I like this also! =A0Strong work!
> > >=20
> > > Would this allow us to further collapse the live-vm-common.bbclass
> > > back
> > > to just image-live.bbclass. =A0I know that the magic mapping that
> > > happens
> > > in set_live_vm_vars() has caused confusion in the past and removing
> > > that mapping would be pretty awesome.
> > Yes, with this there is only one user of live-vm-common.bbclass, so
> > it could be folded back.
>=20
> This patchset looks to have caused a number of selftest failures:
>=20
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/409/step=
s/Running%20oe-selftest/logs/stdio
>=20
> I suspect there are some testcases which need updating with this
> change, would you be able to take a look please?

Ah, I was warned there's a full test-suite that takes longer.  I see
they're all in runqemu, I'll kick those off locally and post a v3 once
I've got them fixed.  Thanks!

--=20
Tom

--kLrc3wbfh+mG5kJY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZemzyAAoJEIf59jXTHXZS51YQAJULmTN3+Jhp2rjTfS/Ry8JT
k3RyvtdCXTk6cSFtJR+L6/D7xwUV7s+Di7NV9rXanfbeGt+hNAT09lN+IhzlfqzR
0P79lZg5OA/EhvGbmUISP7KtzV5AcjKrUzCZYyZW4QbYaACxGtw5vu9IrJNkIwnc
aRp+NIVxxdGlPUoYkP32ijyahuFIU3O6mT/jun5nhKtZALpjiY653mG9VAyjZPCZ
kHNWeewrsC2J2vZ9dUtLK3g86M/5fk7L9nQV8vyEPDgNRq03QE+0UEZhHFTW+ibs
ELkFbZAGVdhzNm56g9Z3GAHe8f5OcEaRWFXcb33stWZyuEzicQHmsVSmoWBCM7tP
G/zofeShMcXl4knN+cAO9zmzxDiPRu0kyP4iImuXt7A2nmd7ExhPcBc+eiFIyQoY
l1H4k0S3ZJOaEWG29a7GO3Bajxt73HpwxCgEZLMK4nPHHoMB3Z/dbHPCDsg3U/dW
DIRR6T28Hfd5pFaJeJcMCMgxWHCrpoOs+BbEf/Izh8/Z66MEKOeV3Ui99/Lg2a+f
fxuS4Ji3caVVErUiWeNTl9n5UOgpEwHkLbX1MFYhGYal8MYY/VOMBLR3+5gGAZeN
visfZ4RrfhYPcl0yTCusXLFKFXXW70mLYF6eqWCEKuOuTATmfu73o9zXwXpJZJky
nTo5OI+j9ofKlvpuGISW
=BpNG
-----END PGP SIGNATURE-----

--kLrc3wbfh+mG5kJY--
