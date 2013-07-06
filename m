Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 134576B090
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:16:59 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2094595eek.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zIGEPQkPku6V6lEWc93NcnOmLlKSSAybe0dH4kdHerY=;
	b=MGkNHN8MrJBxE9J6+Jtgr73FWxr968wXEqoYh4atBQ0O1vp3je0SXuS23zahS05DVk
	xdQoZkyi3abpfYTPImLbxdJiBOujCSEycExCCkhqdHpxV9kty/j3hYECYkBRv70Dl8Qm
	FJAGzCbNJVhymeDx75XT47xecPnw1Xv2tToqvhBM/BTIVjObrcNx+5nt2XxJxK6jUn67
	/mQw7tjy1ojvR031kx65NVMRcMIFAsjoUBYZDkzvQe0QT4MC2om2TgMVtBSC13RuAnrK
	n44elTXHStVvVCwY2d/Z0oN3QA8RhNLNBxgY7DfVqsN6FXFWXAzivzc5cGZV1KwSmay2
	Z6yw==
X-Received: by 10.14.111.7 with SMTP id v7mr18476809eeg.84.1373152620141;
	Sat, 06 Jul 2013 16:17:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm27829400eeb.7.2013.07.06.16.16.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:16:59 -0700 (PDT)
Date: Sun, 7 Jul 2013 01:17:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130706231706.GF3288@jama>
References: <20130706230840.GE3288@jama>
	<1373152554-22840-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373152554-22840-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH] SHLIBSSEARCHDIRS
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
X-List-Received-Date: Sat, 06 Jul 2013 23:17:00 -0000
X-Groupsio-MsgNum: 41562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline

--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 07, 2013 at 01:15:54AM +0200, Martin Jansa wrote:
> ---
>  meta/classes/package.bbclass | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

Ignore this one, wrong git revision passed to send-email..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHYpXIACgkQN1Ujt2V2gBzTOgCfURO7m3k1rfp5iS1HNStP8igP
o1EAn3rEXtG21UaCK5/yB+UzKB2Zxxw1
=EFN8
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--
