Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B7C936226A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:37:59 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so5420666eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DFOlEzhDOCvU6+4Z/REYvLDXeyJURdnsuOakQiIq7XA=;
	b=pbH53Q1vRhKJTHlS86hVZYOlilBCmJEJ9YRCwwGVSMUeKStYxn78atvogdPbM69iLz
	cAOkGaC+P/tiRLatWL/a4IrtwXZnc/tO2UEwpsnw5kkmagL5oFFtEEr32i5py6bstC09
	5PzjmlW0H9+sOKtbcQ9p3/nqa2cbLt5x9h5Q7v+SMAaGc7lJVTHrRI2BtPPHNHGpOedT
	2gs+iWwIvOOwCYrfU/zeDfKUjM/YVztVdPipNd/zktRKQPCL6BehAbgdqIO3FZaY9BNd
	yRCZL4XDGvvgn9410HCHQB6MSz3wv2lLg5sRBPUdl6LpisJJqGTYFlMZEtLYQYMRan0T
	PtGA==
X-Received: by 10.14.5.129 with SMTP id 1mr41727989eel.56.1373546279470;
	Thu, 11 Jul 2013 05:37:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm68782092eeu.4.2013.07.11.05.37.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 05:37:58 -0700 (PDT)
Date: Thu, 11 Jul 2013 14:38:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130711123810.GJ3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Thu, 11 Jul 2013 12:38:00 -0000
X-Groupsio-MsgNum: 41815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s7VmGO2m7mcnuX8Q"
Content-Disposition: inline

--s7VmGO2m7mcnuX8Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/test-dependencies.sh | 253 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 253 insertions(+)
>  create mode 100755 scripts/test-dependencies.sh
>=20
> +    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
> +    rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata $tmpdir/sstate-c=
ontrol $tmpdir/stamps $tmpdir/sysroots $tmpdir/work $tmpdir/work-shared 2>/=
dev/null

I'll send v3 which doesn't remove $tmpdir/cache between the builds, it
takes too long already without reparsing all recipes every time.

Originally I was removing it as work around for
http://lists.openembedded.org/pipermail/bitbake-devel/2013-July/003624.html
but that's not needed for master and people probably won't be changing
PNBLACKLIST while this script is running.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s7VmGO2m7mcnuX8Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHepzIACgkQN1Ujt2V2gByhsACffOGmqkQG7LveGg8USQCHXNrT
jVEAoJbncmTnfIDtmZYfXn45qsNnvPwm
=eL1h
-----END PGP SIGNATURE-----

--s7VmGO2m7mcnuX8Q--
