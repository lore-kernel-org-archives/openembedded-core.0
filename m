Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtCDO-0003Xo-FY
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 07:29:26 +0200
Received: by bkbzu17 with SMTP id zu17so3812326bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/HRDhuGnFQXiw4w3ND9NKXlRjymwVGhpWV/zNsNAx90=;
	b=iOZpHW5jnMI6bSWtzxY2MFbd+cIc9ufMUT6ySxto+VoAUIG4BZPUvwluWec57fB21z
	useu0smCkqtg7hX1CLovrmpBUx12YySZF7R6CcSmWrxiVFj6AYHmVxwmRPgkn9ZX9hUM
	0qz550/5pil6NQ/juE3BZI02IHmQBitRqJd0c=
Received: by 10.205.65.13 with SMTP id xk13mr1217889bkb.125.1313472289347;
	Mon, 15 Aug 2011 22:24:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x1sm2601090fah.2.2011.08.15.22.24.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 22:24:47 -0700 (PDT)
Date: Tue, 16 Aug 2011 07:24:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110816052441.GA10195@jama.jama.net>
References: <1313136251-32214-1-git-send-email-noor_ahsan@mentor.com>
	<4E49511C.6050606@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B6CDB78764@shsmsx502.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B6CDB78764@shsmsx502.ccr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH V2] bluez4: Added new recipe 4.96 and removed 4.82 version
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
X-List-Received-Date: Tue, 16 Aug 2011 05:29:26 -0000
X-Groupsio-MsgNum: 8247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 10:40:38AM +0800, Cui, Dexuan wrote:
> Saul Wold wrote on 2011-08-16:
> > On 08/12/2011 01:04 AM, Noor, Ahsan wrote:
> >> From: Noor Ahsan<noor_ahsan@mentor.com>
> >> * Added new recipe 4.96 and removed 4.82 version and its files.
> >> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
> > Merged into OE-Core
>=20
> The patch causes a failure:
> NOTE: package bluez-hcidump-2.0-r0: task do_compile: Failed
> I reported http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1371 for this.

You need patch from this commit
http://git.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=3D852ac4b=
589adb186191ad70a2fa3472d5b351ec4
or upgrade to 2.1

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5J/xkACgkQN1Ujt2V2gByc3wCff/b+k3W6lT6QT261oIAqftXx
MNwAn0I9MzMRL2bMh9gKc95K7nKuns/k
=TIK4
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
