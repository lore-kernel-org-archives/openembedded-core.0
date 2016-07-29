Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 481C7607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 19:07:06 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id y134so35222855pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=MidWvlbzOXCCgZJLdaOkQv/rW+CB0octXslaQUT7x38=;
	b=gGfTJjNXrMyqTqlYe5J4NL7OrOJY7I+1oqpwrVIHHcscqhl7epL7HIrJIAO8mdoauc
	uDcYLt9rh4uCFi53UGhEu8aDdicNbx4JF6qNNLMvFUgCCe4G0M4vvC3QruKmewDSfpqY
	jUuyJjOnXWg5g6QujCDMnYdbXWHA5m1H0BBscEd/YTUuWsH6tkLcSFUJVlWFxX7TQE5/
	14M12rzAKFgBoY7cUOzyVUF6oQgVZEz5aZTfwoY3gLwAPMSVaWNZzCAC16jlVL82JdgV
	6+OHZoQgxhxYag3UGg3JfyLQaL6egQPlwAyQsYH5Rzhaimnq2HB0Ug5cPx5AlClqFQUi
	+sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MidWvlbzOXCCgZJLdaOkQv/rW+CB0octXslaQUT7x38=;
	b=bywtwHJTpeHsH1+MHv/zbG+Yy5Qa7l/rEdEeLDl16jdeVvll7ahcERFt8bvW2hpMx2
	zEjVf4Jru7jOUU2le+WGSEhqVxPUsaBbiXYGnz/e3PU4FYDcXw4yjGt/zveo5PNkxQee
	WvxXJlzhq1Ez9u+Sju3FuP442qPDVsJ5r4FoHHJtSga0nht29tks8J3si+GLhzE5tUFU
	T7qLDmvT4Ol6YVAokTpkROVo+4SkoH3QnmKitKsMSv4DEQL9MdFv3CWXU24MowfrnPR8
	fwTo8yJabDlSALvxIQT0ObU9Ha3YfTBrCTUC2cHo6stuv0L2xRoO6SUrPSvloDT3RPld
	00BQ==
X-Gm-Message-State: AEkoouuZRIkQK/CIwytwLTyVMHymmwi/Z1FB1ixL2Wrs0LxqmlBCIZbdbXBDJ6twNEURmw==
X-Received: by 10.98.68.1 with SMTP id r1mr54007522pfa.161.1469819227718;
	Fri, 29 Jul 2016 12:07:07 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99bc:2711:d44c:7b33?
	([2601:647:4c00:3edf:99bc:2711:d44c:7b33])
	by smtp.gmail.com with ESMTPSA id
	o2sm26894110pfg.10.2016.07.29.12.07.06
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 12:07:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMSG=xVPrR7peULZh4Ng+EVrjo5SXWwRBU2+o2XjFJGb_F-Xyw@mail.gmail.com>
Date: Fri, 29 Jul 2016 12:07:06 -0700
Message-Id: <175B9BD5-9DEE-4B4C-B9AD-65F1D81438A3@gmail.com>
References: <CAMSG=xVPrR7peULZh4Ng+EVrjo5SXWwRBU2+o2XjFJGb_F-Xyw@mail.gmail.com>
To: Nemicolopterus Crypticus <ncrypticus@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: multilib support on Jethro: populate_sdk help
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
X-List-Received-Date: Fri, 29 Jul 2016 19:07:08 -0000
X-Groupsio-MsgNum: 85138
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8072522F-C75D-482B-957E-C91C499CAC2C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8072522F-C75D-482B-957E-C91C499CAC2C
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_9684580E-C773-47CD-AA8C-97AC52327FB0"

--Apple-Mail=_9684580E-C773-47CD-AA8C-97AC52327FB0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 29, 2016, at 10:48 AM, Nemicolopterus Crypticus =
<ncrypticus@gmail.com> wrote:
>=20
> Hello all,
>=20
> We are having issues with our generated SDK files. We're using the =
jethro branch, and have enabled multilib (see relevant portion of =
local.conf below).
>=20
> I can succesfully run the command to generate the SDK:
> $ bitbake <recipe name> -c populate_sdk
>=20
> But the output is incorrect. While the aarch sysroots look good, the =
sysroots for arm are completely missing. The environment setup script =
ends up pointing to non-existent compilers. Please let me know if you =
need more information!

Thanks for report. It will be good if you can open a bugzilla entry for =
this. So it can be tracked.

>=20
> Steps to reproduce:
> $ bitbake <recipe name> -c populate_sdk
> $ cp tmp/deploy/sdk/<sdk-script>.sh /test/directory
> $ cd /test/directory
> $ bash <sdk-script>.sh
> $ ls sysroots/
> aarch64-poky-linux/   x86_64-pokysdk-linux/
>=20
> Note the missing ARM directories.
>=20
> Also, the setup script for arm sets this as the command for compiler:
>  12 export CC=3D"arm-pokymllib32-linux-gnueabi-gcc
>=20
> But that compiler doesn't exist anywhere in the folder where I =
installed everything, or environment!
>=20
> So it appears that it's not completely or correctly packaging =
everything for ARMv7.
>=20
> The documentation does mention some environment variables =
<http://www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-dev=
-environment>, but it's not clear how those related to multilib.
>=20
> For instance, none of our recipes have "SDKIMAGE_FEATURES" defined, =
but clearly the aarch64 sysroots are getting populated correctly (we =
succesfully compiled and ran a simple hello world).
>=20
> Can anyone point me to an example, or discuss a successful use of =
"multilib" on the Jethro branch (given desparate brainstorming below), =
share some more verbose documentation, or ask follow-up questions?
>=20
>=20
> _____________________________________________________________
> Desperate brainstorming below:
> I did find this years-old patch: =
https://patchwork.openembedded.org/patch/30941/ =
<https://patchwork.openembedded.org/patch/30941/>
> Notably, the do_populate_sdk method in =
poky/meta/classes/populate_sdk_base.bbclass iterates over the values =
listed in the MULTILIB_VARIANTS variable:
>=20
> +	variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""
> +	for item in variants.split():
> +		# Load overrides from 'd' to avoid having to reset the =
value...
> +		overrides =3D d.getVar("OVERRIDES", False) + =
":virtclass-multilib-" + item
> +		localdata.setVar("OVERRIDES", overrides)
> +		bb.data.update_data(localdata)
> +		bb.build.exec_func("create_sdk_files", localdata)
>=20
>=20
> The latest version in Jethro does not have anything equivalent to =
that, but I did not dig deeply into the code or the commit history.
>=20
>=20
>=20
>=20
> ______________________________________________________________
> More data:
>=20
> local.conf relevant section:
> #
> # Multilib configuration
> #
> # This sets any packages preprended with lib32- to be built with
> # the armv7a tuning (32 bit) instead of 64 bit aarch.
> #
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7at-neon"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9684580E-C773-47CD-AA8C-97AC52327FB0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 29, 2016, at 10:48 AM, Nemicolopterus Crypticus &lt;<a =
href=3D"mailto:ncrypticus@gmail.com" =
class=3D"">ncrypticus@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D""><div class=3D"">Hello all,<br class=3D""><br =
class=3D""></div>We are having issues with our=20
generated SDK files. We're using the jethro branch, and have enabled=20
multilib (see relevant portion of local.conf below).<br class=3D""><br =
class=3D""></div><div class=3D"">I can succesfully run the command to =
generate the SDK:<br class=3D""></div><div class=3D"">$ bitbake =
&lt;recipe name&gt; -c populate_sdk<br class=3D""><br =
class=3D""></div><div class=3D"">But the output is incorrect. <b =
class=3D"">While
 the aarch sysroots look good, the sysroots for arm are completely=20
missing. The environment setup script ends up pointing to non-existent=20=

compilers. </b>Please let me know if you need more information!<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>Thanks for report. It will be good if you can open =
a bugzilla entry for this. So it can be tracked.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">Steps to reproduce:<br class=3D""></div><div class=3D"">$ =
bitbake &lt;recipe name&gt; -c populate_sdk<br class=3D""></div><div =
class=3D"">$ cp tmp/deploy/sdk/&lt;sdk-script&gt;.sh /test/directory<br =
class=3D""></div><div class=3D"">$ cd /test/directory<br =
class=3D""></div><div class=3D"">$ bash &lt;sdk-script&gt;.sh<br =
class=3D""></div><div class=3D"">$ ls sysroots/<br =
class=3D"">aarch64-poky-linux/&nbsp;&nbsp; x86_64-pokysdk-linux/ <br =
class=3D""><br class=3D""></div><div class=3D"">Note the missing ARM =
directories.<br class=3D""><br class=3D""></div><div class=3D"">Also, =
the setup script for arm sets this as the command for compiler:<br =
class=3D"">&nbsp;12 export CC=3D"arm-pokymllib32-linux-gnueabi-gcc<br =
class=3D""><br class=3D""></div><div class=3D"">But that compiler =
doesn't exist anywhere in the folder where I installed everything, or =
environment!<br class=3D""><br class=3D""></div><div class=3D"">So it =
appears that it's not completely or correctly packaging everything for =
ARMv7.<br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">The <a target=3D"_blank" =
href=3D"http://www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#=
sdk-dev-environment" class=3D"">documentation does mention some =
environment variables</a>, but it's not clear how those related to =
multilib.<br class=3D""><br class=3D""></div><div class=3D"">For
 instance, none of our recipes have "SDKIMAGE_FEATURES" defined, but=20
clearly the aarch64 sysroots are getting populated correctly (we=20
succesfully compiled and ran a simple hello world).<br class=3D""><br =
class=3D""></div><div class=3D""><b class=3D"">Can
 anyone point me to an example, or discuss a successful use of=20
"multilib" on the Jethro branch (given desparate brainstorming below),=20=

share some more verbose documentation, or ask follow-up =
questions?</b><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D""><br =
class=3D"">_____________________________________________________________<b=
r class=3D""></div><div class=3D"">Desperate brainstorming below:<br =
class=3D""></div><div class=3D"">I did find this years-old patch: <a =
target=3D"_blank" href=3D"https://patchwork.openembedded.org/patch/30941/"=
 class=3D"">https://patchwork.openembedded.org/patch/30941/</a><br =
class=3D""></div><div class=3D"">Notably, the do_populate_sdk method in =
poky/meta/classes/populate_sdk_base.bbclass iterates over the values =
listed in the MULTILIB_VARIANTS variable:<br class=3D""><br =
class=3D""><pre class=3D""><span class=3D"">+	variants =3D =
d.getVar("MULTILIB_VARIANTS", True) or ""</span>
<span class=3D"">+	for item in variants.split():</span>
<span class=3D"">+		# Load overrides from 'd' to avoid =
having to reset the value...</span>
<span class=3D"">+		overrides =3D d.getVar("OVERRIDES", =
False) + ":virtclass-multilib-" + item</span>
<span class=3D"">+		localdata.setVar("OVERRIDES", =
overrides)</span>
<span class=3D"">+		bb.data.update_data(localdata)</span>
<span class=3D"">+		bb.build.exec_func("create_sdk_files", =
localdata)</span></pre><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">The latest version in Jethro does not =
have anything equivalent to that, but I did not dig deeply into the code =
or the commit history.<br class=3D""></div><div class=3D""><br =
class=3D""><br class=3D""><br class=3D""><br =
class=3D"">______________________________________________________________<=
br class=3D""></div><div class=3D"">More data:<br class=3D""></div><div =
class=3D""><br class=3D""></div>local.conf relevant section:<br =
class=3D"">#<br class=3D""># Multilib configuration<br class=3D"">#<br =
class=3D""># This sets any packages preprended with lib32- to be built =
with<br class=3D""># the armv7a tuning (32 bit) instead of 64 bit =
aarch.<br class=3D"">#<br class=3D"">require conf/multilib.conf<br =
class=3D"">MULTILIBS =3D "multilib:lib32"<br =
class=3D"">DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7at-neon"</div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_9684580E-C773-47CD-AA8C-97AC52327FB0--

--Apple-Mail=_8072522F-C75D-482B-957E-C91C499CAC2C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlebqVoACgkQuwUzVZGdMxTS6QCY9hVnm1I8bDF8hSEBO7qYpYxo
5ACdHpjpBIxC6XWWtwLQb2ukaBnhENA=
=TWCm
-----END PGP SIGNATURE-----

--Apple-Mail=_8072522F-C75D-482B-957E-C91C499CAC2C--
