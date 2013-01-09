Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tsrx9-0002e4-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:28:11 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so689824eek.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1sW2qjbrgzY0uihvHZMRaRJwwl6kRdwl+uUn/l1LGUU=;
	b=F2l9qTowwb2YpqliaAKAqQFKCELnilZGNtee04giu6skjzh/NcO8I+E4lZ4668G/5O
	NdHD99dB71G9iXyq1zZ7MNGP3JgTysTnBWflVxEtVLFe+IMar7IKEdEvDYq7ylkL2/Tp
	cheWqRoD0SF6KwMRUnn+Ckfy9Vuo7hlrMRwY1UOypA4nYov2HcZvPBlvfEZ+5q/UHFmb
	8sIPyrt+EAWlGlXdvpF6675m+DwuIFTXmg1M4JvjCfqw+IRz88YiXgCd107V4EFDpsXc
	4MbOsB7gbjcCoJ4VtOj4CWFa3hqRmIjg9Jt8C8G8NWC4NnfeGbKvOq+FBWCXM78vijmr
	1Qnw==
X-Received: by 10.14.204.198 with SMTP id h46mr180855405eeo.1.1357722776185;
	Wed, 09 Jan 2013 01:12:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm140350431eep.9.2013.01.09.01.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 01:12:55 -0800 (PST)
Date: Wed, 9 Jan 2013 10:13:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <20130109091303.GC3722@jama.palm1.palmone.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 09:28:11 -0000
X-Groupsio-MsgNum: 33578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:46:57AM +0200, Marko Lindqvist wrote:
> On 6 January 2013 22:28, Marko Lindqvist <cazfi74@gmail.com> wrote:
> > On 6 January 2013 06:29, Saul Wold <sgw@linux.intel.com> wrote:
> >>>
> >> Even after a number of years, I
> >> loose track sometimes of what's stable vs unstable (odd vs .99 vs ??)
> >
> >  Another challenge for http://packages.yoctoproject.org/ ?
>=20
>  Actually, does it even know how new major versions will be in new
> directory? Asking because I don't know even if it collects the URL to
> check from recipes, or is that given in some specfile. At least gtk+3
> recipe in meta-openembedded has that directory hardcoded
> ".../gtk+/3.4/gtk+-${PV}.tar.xz" so when ever updating to new major
> version, SRC_URI needs to be touched.
>  What I'm envisioning is that maybe bitbake should provide us with new
> variable PM or PMV (major version) that's basically PV with last dot
> and everything after it removed. That would allow us to easily make
> many such SRC_URIs dynamic, e.g., ".../gtk+/${PM}/gtk+-${PV}.tar.xz".
> This would be more worthsome if it's something
> packages.yoctoproject.org too could benefit from.

That looks like SHRT_VER used in some recipes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtNJ8ACgkQN1Ujt2V2gBwMBACfS/40ZouleuCBxTWsCrxQ8exi
ZUAAn03Sjh4K6kYYF9g+KlE/YvEw35c4
=iAFX
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
