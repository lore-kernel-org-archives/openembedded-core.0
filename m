Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C599B60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 12:58:50 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id n3so8194255wiv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y/p8/cxqQuJ3l8KtCuLdcrDemUf/jD3kTzvWWPnO/4s=;
	b=R0BEGUjcql74+kXMZ793nWsgvKr6NziStxtkkOMYQSV4QXQDRo45LzRuQZEURPnIVa
	3HUdtAyg4QUO2BO4e75QMvpPWm08BSdq7GB7Hcs5x22EkDAdKyEWdJQmtyNXXlJ1PCIm
	+rm9Z0CDChdiqczHgWpkZWfONP6lm5jY8SF4ZboASF05e4EOVtU1Rd74RbSYKF9P1GJ9
	podre6jCzlRkcDxP3v57wG3wnYMIcc4cqy82PW+XJ9sIKFYla9yeWUj6VzwHg9DsAytC
	fZ6QjOSJlKITw8uD0WIpsdvf40Wk8S6zlbDqf+A92Vsbwl+fJ/n1ZOSscAS6Cvus28Tw
	rJKg==
X-Received: by 10.180.21.166 with SMTP id w6mr3524448wie.43.1415883530479;
	Thu, 13 Nov 2014 04:58:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	rx8sm35452666wjb.30.2014.11.13.04.58.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Nov 2014 04:58:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Nov 2014 13:58:52 +0100
To: =?iso-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Message-ID: <20141113125852.GA2456@jama>
References: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] reporter-error sending report
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
X-List-Received-Date: Thu, 13 Nov 2014 12:58:59 -0000
X-Groupsio-MsgNum: 59629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 09:08:37PM -0200, Jo=E3o Henrique Ferreira de Freit=
as wrote:
> When the Error Reporting Tool is enabled and the build fails, then the re=
port-error=20
> prints an url that the user needs to get and use the send-error-report to=
ol which
> will sends the reporter to a public or private reporting server error.
>=20
> This works very well if the user is sitting in front of the building mach=
ine.
> There are some cases, like jobs running on Jenkins server, that need to s=
end
> reports automatically when a build fails.
>=20
> This patch set introduces a glue between reporter-error.bbclass and send-=
error-reporter tool.

it's report-error.bbclass and send-error-report (not reporter)

> So, report erros will be send as soon as an error happens.
>=20
> Two new variables were added and the user takes the responsible to fill t=
hem (conf/site.conf),
> for example:
>=20
> INHERIT +=3D "report-error"
> ERR_REPORT_SERVER =3D "127.0.0.1:8000"
> ERR_REPORT_USER =3D "joaohf"
> ERR_REPORT_EMAIL =3D "joaohf@gmail.com"

See
http://lists.openembedded.org/pipermail/openembedded-core/2014-March/090576=
=2Ehtml
which does the same, but was rejected because of concerns that someone
will unintentionally upload sensitive data to some public report server.

>=20
>=20
> Jo=E3o Henrique Ferreira de Freitas (2):
>   report-error: sending error report to server without user intervention
>   report-error: send report error with username and email
>=20
>  meta/classes/report-error.bbclass | 15 +++++++++++++
>  scripts/send-error-report         | 45 ++++++++++++++++++++++++---------=
------
>  2 files changed, 43 insertions(+), 17 deletions(-)
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRkqwwACgkQN1Ujt2V2gByA2ACfQbuW8hD295FI06S5QGeSw/op
xvMAnjWFR9L3D2pPazgWhCq2V0OqVKfU
=60nd
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
