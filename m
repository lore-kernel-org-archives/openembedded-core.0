Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99D8D7F80A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 10:58:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so6687379wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kpKLj15oVYbJ7blms5YG8X1FTT2lg+QFelBhKHFrkuU=;
	b=ELNeQ0r3vdqnClFSYlZaNlVrmlU+PmatfPVy/oqQSpGduFTihdDpXsLhlbskZ5JOX6
	8HDyR5VhPGI914fgqkbqYoJxA9NefE+gYqcGfFsBoCrfz6CWaIARf1oKDjZD+iSCn5f+
	nOB3KVqv7SnaDAlWLziCQWeM7R8s+lj/LGWrawyh3LrmCFtVzp76wtM3Su+FHqzzw3EE
	QCNDnMptbrLTVbn6n/eoqe/6uGTh50rDJ0KxTIfzUqMn6HALVp+xlUL+3VJEAHAEJbVu
	QzoHh6scWxwqGMtPUfH57MzIS19oQE3KuG3SPfX5DD+xZPgT/EM9VFgHkAiLZbRt86C7
	JfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kpKLj15oVYbJ7blms5YG8X1FTT2lg+QFelBhKHFrkuU=;
	b=JmtQpoIrKKkIAp4VsLzEATPdcDkhvn0Rp0/0paWsMK+rS9DqV2eXg617AwpaJ/190U
	AWgVjO7DJMAJyKSPdW1KUMCIIfhMzWM52FJnXkLOZ0rRX0RADGrWh/h/x2cBd1dtD/Mw
	LRQk1HNbfmUXxiFtrTsHe2MYAY5rAVNvPf6AwmrnRjzM/PJyp+oCpnUFlGRP8N1OtHMX
	Vn+AAVJeuLdzy2IdkIp40iqn4aMYhjBoKvXKp/X2nwq332KDFHKyb0pNZGg8IyqM5rm8
	iDCK1M+kLQc7xZktAsYgV0tJZI5x0dcgmgLJz/uA0BDl9UyZC1e2JeZKhaN/MUWdbM2i
	FCcg==
X-Gm-Message-State: APjAAAVDzfzpWZmqb+wwyutgFX6vxYOEJ3ICHOHOqG5sV5qhdkLvGJ42
	8r+ww8KLaeb33WHSiPXcp26F33kG
X-Google-Smtp-Source: APXvYqxU6QkrSrdngWUUFTZvxiMDuplMLEYX4NooPrEibXwzHyvDYwAeIN6qR+LhAVXZIVw9I0GRaA==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr29515067wrm.131.1576493899257;
	Mon, 16 Dec 2019 02:58:19 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	b67sm21305672wmc.38.2019.12.16.02.58.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 02:58:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Dec 2019 11:58:17 +0100
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20191216105817.dzbvsct5vu52xsfj@jama>
References: <20191216095620.3747-1-Martin.Jansa@gmail.com>
	<978a0738-d342-9b5e-8a46-e9cb46c5df54@gmail.com>
MIME-Version: 1.0
In-Reply-To: <978a0738-d342-9b5e-8a46-e9cb46c5df54@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate.bbclass: use tabs for indentation
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
X-List-Received-Date: Mon, 16 Dec 2019 10:58:18 -0000
X-Groupsio-MsgNum: 132584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dlmrgmufn7bxmjkm"
Content-Disposition: inline

--dlmrgmufn7bxmjkm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2019 at 11:41:53AM +0100, Jacob Kroon wrote:
> On 12/16/19 10:56 AM, Martin Jansa wrote:
> > * it's terrible, but this is what oe-core wants and it's better than mi=
xing tabs and spaces in the same function
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/sstate.bbclass | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 14de791c81..18e3492674 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -753,13 +753,13 @@ sstate_create_package () {
> >   		return
> >   	fi
> > -        mkdir -p `dirname ${SSTATE_PKG}`
> > +	mkdir -p `dirname ${SSTATE_PKG}`
> >   	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
> > -        # Use pigz if available
> > -        OPT=3D"-czS"
> > -        if [ -x "$(command -v pigz)" ]; then
> > -            OPT=3D"-I pigz -cS"
> > +	# Use pigz if available
> > +	OPT=3D"-czS"
> > +	if [ -x "$(command -v pigz)" ]; then
> > +		OPT=3D"-I pigz -cS"
> >           fi
>=20
> Nice cleanup. Doesn't this final 'fi' still look funky though ?

Yes, you're right, it was still using 8 spaces as well. Hard to notice
when the other half of the file commonly uses 8 spaces and the git diff
with mixed tabs and spaces is always a bit ugly.

Sent v2. Thanks for noticing.

>=20
> >   	# Need to handle empty directories
> >=20

--dlmrgmufn7bxmjkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXfdjSAAKCRA3VSO3ZXaA
HI2PAJ97K7XqzKKf0Xsrh/3kcawERlsoFACgslpAY15cw8ynsaFTo0utAY5B6xA=
=+/h5
-----END PGP SIGNATURE-----

--dlmrgmufn7bxmjkm--
