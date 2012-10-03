Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJOCj-0008QG-7W
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:37:33 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so1956268wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QdOCe6UdQYhJdXedtT+YvtqtkbUt9rZLnLEksXjFW0A=;
	b=Gy1/5od3W1dUktTB8nMUUtptxKTpqe/MCAlxH9rQ0Y60/oyuU/iVGAVZodsI1NuM9O
	r+f7eCDpS+QvqyON7PIDxHF9trFkDsB53e2IwqFaHnIARf6PHV0ZoRbzelrNkCZbsmCh
	u4ebvEe4FFLMQfe4DpLSYfXztSH7iHhXFELXj70hoF/xztBCsEG5Hp2eshH7cRqlWrq2
	xa/79PGVMrRoJLYnFQSTDeMVYjRMp4jMxFBNbgHNs9n6Sj5Dw8Fy5BbMNiuvhXt7s19P
	dbggeYiRYyb+hweq9CVw/jiEZEcxi9ikDnVYolQNm4DLxxZ0xdfF01plrwGL8mSEGJUe
	extg==
Received: by 10.216.241.137 with SMTP id g9mr1023800wer.122.1349267073878;
	Wed, 03 Oct 2012 05:24:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm8191759wib.10.2012.10.03.05.24.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 05:24:33 -0700 (PDT)
Date: Wed, 3 Oct 2012 14:24:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20121003122438.GA29339@jama.jama.net>
References: <cover.1349218820.git.elizabeth.flanagan@intel.com>
	<31141073add21ef176638e48bff752832901bb78.1349218820.git.elizabeth.flanagan@intel.com>
	<CAP9ODKqUq_z4v6pVnhT2R9jv2oYm3=bj5CNfbrGwrFXHG+-udg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqUq_z4v6pVnhT2R9jv2oYm3=bj5CNfbrGwrFXHG+-udg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bzip2 and busybox: Incorrect LICENSE
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
X-List-Received-Date: Wed, 03 Oct 2012 12:37:33 -0000
X-Groupsio-MsgNum: 30318
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 09:21:53AM -0300, Otavio Salvador wrote:
> Hello,
>=20
> On Tue, Oct 2, 2012 at 8:01 PM, Elizabeth Flanagan
> <elizabeth.flanagan@intel.com> wrote:
> > The license for bzip2 is not quite BSD. I have an email out to the
> > maintainer to see if we can utilize a common BSD license (or something
> > else) however, for now, we should revert bzip2 back to a special
> > license.
> >
> > As busybox also utilizes a lightly modified bzip2, this also
> > effects busybox.
> >
> > Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>=20
> Please send it for denzil-next as well.

Maybe with PR bumps as license is part of packaged metadata.

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBsLoYACgkQN1Ujt2V2gBwYewCfUBPJLgSwtF+ceknquAGrpbnl
KgMAoISCSy5fd6aMqCS7cSk5YXQH4zeY
=G+sT
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
