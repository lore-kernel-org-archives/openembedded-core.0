Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F19D865CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 09:31:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so1869308wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JcobVeRGtou5Ur8q5vwk1dpW2kJyqOFYva4gVNEU/YA=;
	b=JS60kMnm5P0gGKbunRmo2txmXUl6/5quujKMXnkt54cyDM6aS6tPzRdm5gBKrZbDWm
	u54B4CFfC1pxU9hY874MO9fB7WD5iBGxo01s4wFxuwjXvO8cWCoD6K+LaENUlWXD+y5P
	atQEZPv5fe2d1eJOdZaLEB3+CoY00Vf7ubDBOErw2EzG2BLIXc1+37XbU7iiTWdVEcqr
	V08XD8w3aClJodlgeb+ym7DHVS8/whzjifX92sGjwjurxYKkyBefrAdfIjUn5ei+snmf
	NTcdrhz+Q0EF+nJ2IDdSAP7JXbBEPgGnqWgh4LpOcIvCp4W/nps+QL2pEymrT5pZa+mK
	etfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JcobVeRGtou5Ur8q5vwk1dpW2kJyqOFYva4gVNEU/YA=;
	b=MG+ylVQLJ4q/uv2KcjhmZQ8PrEG0ogpjrazalvVscEsGY92l/Mjk3zjNlx5ISVBePB
	PYVSqQ/xfoD6+voC+mepX6GxAJ5ed0N0tDnKoiEQd7N2ahFun/7dXwI1e4NJS2kMUUFj
	PGaydnGrJI7Gt1QE+Fnhz7hUgm9Id0NeTShiJQBIYzmRjRsNVc0CN4r+bzqpLhXxFoPt
	1v1KesCNeaxB6a5uWLRKpVZW8b5JuaFnbKh2GNz0PP2BaSL04tO67J5UkGPlAtVZm7F7
	te3GLCt4Lc9Q9xWXhww9Z9f7GijiDQ50M5Ngo/IKNjA1CS1mSEobu7zUAUWvj7URiJWy
	kGQw==
X-Gm-Message-State: AE9vXwPjId76U0nBAOMrrKbJX2aPOxK93alrRScxGf2nCFNigFVxOOdzKv37Droq3Igguw==
X-Received: by 10.194.120.37 with SMTP id kz5mr2395035wjb.196.1473413469860;
	Fri, 09 Sep 2016 02:31:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f123sm2412466wmf.11.2016.09.09.02.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Sep 2016 02:31:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Sep 2016 11:31:11 +0200
To: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
Message-ID: <20160909093111.GA2639@jama>
References: <20160908092601.7588-1-pidge@toganlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160908092601.7588-1-pidge@toganlabs.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] report-error.bbclass: Add support for autosending
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
X-List-Received-Date: Fri, 09 Sep 2016 09:31:10 -0000
X-Groupsio-MsgNum: 86962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 11:26:01AM +0200, Elizabeth 'pidge' Flanagan wrote:
> This commit pulls and extends the functionality of .oe-error-report into
> local.conf. It maintains the functionality of .oe-error-report.
>=20
> It also enables report-error to automatically send error reports to a=20
> specified error report server. This patch enables infrastructure ppl to
> set development teams up so that we can gather error metrics automaticall=
y.
>=20
> This relies on a new set of variables:
>=20
> REPORTERROR[autosend]=3D"yes|no|ask"
> REPORTERROR[user]=3Dusername
> REPORTERROR[email]=3Demail
> REPORTERROR[server]=3Derror-report-web instance
>=20
> For autosend yes and no are pretty self explainatory. ask does not pass
> the -y flag to send-error-report, thus enabling the end user to review
> the report prior to submission.

The same functionality was sent more than 2 years ago, but it was
rejected, so I'm carrying it in our own fork since then:

http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091222=
=2Ehtml

> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
>  meta/classes/report-error.bbclass | 41 +++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-erro=
r.bbclass
> index 82b5bcd..909adf0 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -85,10 +85,47 @@ python errorreport_handler () {
>              bb.utils.unlockfile(lock)
>              failures =3D jsondata['failures']
>              if(len(failures) > 0):
> +
>                  filename =3D "error_report_" + e.data.getVar("BUILDNAME"=
, True)+".txt"
>                  datafile =3D errorreport_savedata(e, jsondata, filename)
> -                bb.note("The errors for this build are stored in %s\nYou=
 can send the errors to a reports server by running:\n  send-error-report %=
s [-s server]" % (datafile, datafile))
> -                bb.note("The contents of these logs will be posted in pu=
blic if you use the above command with the default server. Please ensure yo=
u remove any identifying or proprietary information when prompted before se=
nding.")
> +
> +                cmd_s =3D "send-error-report %s" % datafile
> +                response_s =3D "The errors for this build are stored in =
%s\n" % datafile
> +                sendit =3D False
> +
> +                autosend =3D e.data.getVarFlag("REPORTERROR","autosend")
> +                user =3D e.data.getVarFlag("REPORTERROR","user")
> +                email =3D e.data.getVarFlag("REPORTERROR","email")
> +                server =3D e.data.getVarFlag("REPORTERROR","server")
> +
> +                if user is not None:
> +                    cmd_s +=3D " -n %s" % user
> +                if email is not None:
> +                    cmd_s +=3D " -e %s" % email
> +                if server is not None:
> +                    cmd_s +=3D " -s %s" % server
> +
> +                if autosend is not None:
> +                    if autosend =3D=3D "yes":
> +                        response_s +=3D "The errors for this build are s=
et to automatically be sent.\n"
> +                        cmd_s +=3D " -y"
> +                        sendit =3D True
> +                    elif autosend =3D=3D "ask":
> +                        response_s +=3D "The errors for this build are s=
et to automatically be sent.\n"
> +                        sendit =3D True
> +                elif autosend is None:
> +                        response_s +=3D "You can send the errors to a re=
ports server by running:\n  %s\n" % cmd_s
> +                elif e.data.getVarFlags('REPORTERROR') is None:
> +                        response_s +=3D "You can send the errors to a re=
ports server by running:\n  %s [-s server]\n" % cmd_s
> +                        response_s +=3D "The contents of these logs will=
 be posted in public if you use the above command with the default server.\=
n \
> +                             Please ensure you remove any identifying or=
 proprietary information when prompted before sending.\n"
> +
> +                bb.note(response_s)
> +
> +                if sendit =3D=3D True:
> +                    import shlex, subprocess
> +                    args =3D shlex.split(cmd_s)
> +                    subprocess.call(args)
>  }
> =20
>  addhandler errorreport_handler
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfSgTsACgkQN1Ujt2V2gByHMACePi4IlZ0evxIdSXJYT7C+bywc
E7IAnRPxrkuYIVSzOofD3isMq0sDRUGR
=iO5b
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
