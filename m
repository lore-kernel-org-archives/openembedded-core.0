Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 387C876294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:36:32 +0000 (UTC)
Received: by qgec40 with SMTP id c40so21960572qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aNFsN7TZawOkn9ADM4CFA42hij2mkChUO515/6f2lC0=;
	b=n0bdxBXRL7LR1jVqQIMv/vBq/jodljw/yHnn7JNsREWWpBvQh9n2K3MRz/M5uffwmE
	pq6H5/MyOuLs0iRWxMjLhQoNoJZH+iSnZNHStrjv/t5botjHusoiAZAUShlnfO4YcMTb
	NTxZob/kNoHJoasn2/t7nKH3yyOUlfOwuhUHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=aNFsN7TZawOkn9ADM4CFA42hij2mkChUO515/6f2lC0=;
	b=UZFjTbF818dyFEwuNnVQpofHnlwqhSKn3dMgqIzX3RIdkZHBE9Ygp//WwjtMCu6Vkb
	eM8vBrsAtKCa3vX4caRD0wncqY7kjrMUb6vSuDVKrt9N8cMWJq4NcJk79u9YPH6evrN/
	81ieZ5Ui2O4WaM2BUH4OPecWKssF7qJX0f0NwiU+X9auQNkwQj8lOSm5eNKsGvhWUhmf
	Ji3ilb86xazVN4Vg4s6p3rK6BP0vTscGrR76TM3p69J2knpyWwR9Y0rsf4IyWu0lqf2k
	s7r3yR5bylBhSuhKFOikOE5cQHbcpgbe3IBXJbJ8RO5C1C/3wPpFkxMndguxHIwy/T88
	0TlA==
X-Gm-Message-State: ALoCoQmMB2EZi6MxxEzZzVlWnpYJTX6IjS8q/cXV2TG4WrWD75x0NM7PM1vkaliuaJ/43W6JeU3r
X-Received: by 10.140.17.105 with SMTP id 96mr10539172qgc.34.1447245392870;
	Wed, 11 Nov 2015 04:36:32 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	u200sm2793411qka.14.2015.11.11.04.36.31
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 04:36:31 -0800 (PST)
Date: Wed, 11 Nov 2015 07:37:15 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151111123715.GK8060@bill-the-cat>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
	<CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
	<563B6674.1030106@pseudoterminal.org>
	<20151110130935.GU8499@bill-the-cat>
	<58549136-994C-4F05-9310-5235F4E2F618@gmail.com>
MIME-Version: 1.0
In-Reply-To: <58549136-994C-4F05-9310-5235F4E2F618@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 11 Nov 2015 12:36:33 -0000
X-Groupsio-MsgNum: 73223
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline

--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 07:59:03PM -0800, Khem Raj wrote:
>=20
> > On Nov 10, 2015, at 5:09 AM, Tom Rini <trini@konsulko.com> wrote:
> >=20
> > On Thu, Nov 05, 2015 at 03:23:48PM +0100, Carlos Rafael Giani wrote:
> >> On 11/05/2015 03:22 PM, Otavio Salvador wrote:
> >>> Hello Carlos,
> >>>=20
> >>> On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
> >>> <dv@pseudoterminal.org> wrote:
> >>>> So, this is because of the TOOLCHAIN_OPTIONS ?
> >>>> Also, what about the ${CC} ? Right now it won't work properly with c=
lang for
> >>>> example.
> >>> The clang is problem might involve us to rework something but all this
> >>> needs to be based on last U-Boot releases; we shouldn't put
> >>> workarounds and hacks on OE-Core without good reasons.
> >>>=20
> >>> Has the clang been tested with 2015.10?
> >>=20
> >> Still, then I'd add something to output an error message like
> >> "U-Boot can only be compiled with gcc". Right now, the error
> >> messages that would occur would be highly confusing and misleading.
> >=20
> > U-Boot supports clang, but it's not as well tested as other things.
> > However, this patch is still wrong as we do not want to try and force
> > flags to gcc, just like we don't with the kernel.  For more on U-Boot,
> > see doc/README.clang (And then possibly do some fixups, I'm not having
> > super luck with it right now, but I'm in a bit of a rush right now).
> >=20
>=20
> This patch is however injecting flags externally, so in case you were to =
use
> clang with OE in context the TOOLCHAIN_OPTION will be appropriately set a=
s well
> so this should work fine. As far as u-boot=E2=80=99s own build architectu=
re is concerned
> its fine. I think the real problem is arising due to toolchain defaults i=
n OE
> e.g. when we default to hard float gcc does not really use hard-float unl=
ess specified on commandline. One can argue that OE should be fixed for tha=
t or gcc
> should be using the right ABI as default which corresponds to default con=
figs as used for gcc in toolchain.
>=20
> One concern here I have is that when we switch float-abi like this, what =
is the impact on u-boot itself, has it ever been build and tested with hard=
-float, as long as there are no float function arguments this should not do=
 anything to code
> but then we need report on this.=20

First, no, like the kernel, you do not go mucking with the float options
that U-Boot wants to use.  OE is correctly today letting U-Boot enforce
what it wants (and then from time to time exposing latent bug from cases
where the toolchain ends up overriding us).

Second, it's currently a bit of a moot point as U-Boot for clang for ARM
needs a bit of attention again as how we deal with global data is once
again making clang unhappy and no one has gone and fixed it again.

--=20
Tom

--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWQzZ7AAoJEIRElH1W1v7NXjEQAL/w4dO9kp8azsGyDeLEj2ZL
Gvacrxkm+MbVMafvgVu+T0UN/3W7IYls2x9ISc5mauhISFXBow1JEUNqdzf4rdrp
WnJ7//zbvzn43tdNW7NsMWKL3TQOdVBvc0HJQcOHSyLHL4tWE1w6y+U0njQC4Fpf
ZNCJ66LamXYebZT/zCQqqEvseXhPqqaejaKKFniHtFCEbW5F1xuFrcP/R5vaVXpC
Gm501rGQLjGZIZ0ko178PvjXmzXM3Y3DtoBH008Gp1pCHzWhOn3H3iucI7HdzB0l
Y1XFv32Io2nUq0AhnRiVy27YTYe588wdHtZpVTA45JSY7PvPRWnrfGBVaLyBb6FD
7EUpy2x4xjUkLbIEn/D3d3rPXSMKXqLz8KqfcEDuj/+nU4Wh3OLmjGef3gwupoU8
l4ZgPvZs8aK+NRDoRxj8qm1II77rJ6ikRZK371JQ5w2HUdF640eoJ+tyzfUKAyUW
3nGaC5/9cl9KoM7Rcf9KpiT0TEjlavb9D74Zg7qQDpLpgTMr6OghyAxT5jlkBbWh
P81eE6Zf2HQjLnXmYpTdAIrtVmqRvVeOgsfkMiO8A43033MA4sayVdRZOc5uzU0p
DBLeFzPKkBI36+B+ogvA+X+FwBbVVmqOGIBu+ezTWOjd7w5x06Xr0l3yL//s03WB
1sZYf7kP7VogBkM63Dly
=XmJa
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--
