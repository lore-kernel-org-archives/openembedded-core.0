Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIbBn-0005le-It
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:12:47 +0200
Received: by bkat8 with SMTP id t8so154861bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q4TP2sqOKDkov5UM6NoOfxW8pLti3LLaH/TaX4h8rzA=;
	b=XNqamf5vRuuXqPF5yBA1Xalxt0fVjjNbsX5IVYFZ47lZLW+TLHgME1XLR+Ag+eBLOb
	zgRupNiFJZF6WYh9mEL6C2qiWvcBe/cPhnvtXSMdKWnSXV8z+k1vZRQTBJaPfZOWHjbK
	DoEBNYKXAbtRANrXC6q0Rsb5JrAL4tsMn86Xc=
Received: by 10.204.7.138 with SMTP id d10mr19414542bkd.31.1319526410115;
	Tue, 25 Oct 2011 00:06:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm26397834bkv.8.2011.10.25.00.06.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 00:06:48 -0700 (PDT)
Date: Tue, 25 Oct 2011 09:06:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111025070642.GE3602@jama.jama.net>
References: <cover.1319132699.git.nitin.a.kamble@intel.com>
	<c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] perl: upgrade from 5.12.3 to 5.14.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Oct 2011 07:12:47 -0000
X-Groupsio-MsgNum: 11536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline

--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 10:47:08AM -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> parallel build fix patches are not needed as they are upstream now.
> Got a new set of debian patch set for 5.14.2

I know that nobody wants PR bumps and nobody cares so much about upgrade
paths on target, but after this all perl stuff is still in

tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.12.3/
tmp/sysroots/*/usr/lib/perl/5.12.3
and also /usr/lib/perl/5.12.3 on target

so it won't work until someone manually rebuilds *perl*-native and
target recipes with perl modules and user opkg install -force-reinstall
them all..

I have just noticed because pulseaudio fails again:
| checking for perl >=3D 5.8.1... 5.14.2
| checking for XML::Parser... configure: error: XML::Parser perl module
is required for intltool
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed
| + exit 1
| ERROR: Function 'do_configure' failed (see
/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/temp/log=
=2Edo_configure.16391
for further information)
NOTE: package pulseaudio-0.9.23-r6: task do_configure: Failed

This time not because of wrong perl being used..

Regards,

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6mYAIACgkQN1Ujt2V2gBxznQCaAu5MkAv0I+XPvcIH/R/OEoOr
978AnR9ffrtW0Sg/bG9nJY6ThVRZNlNo
=tlM0
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
