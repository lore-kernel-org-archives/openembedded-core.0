Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 650976C491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:52:20 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id u103-v6so917934ybi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PvEhYkNfdrQmw3igliSq2RApJzbS78EfwohZ9RFCi+U=;
	b=jXCXhCAiiLZ+TWruFiH48LhfMC4tDygBjAYKKS7q354bg5Jmo2H4lpJZOZHhCmtSTb
	MngWlH1pf+nE6m/LOARkV148C/JSUo7vfCJkSDzr2UtpKWG4aBOsEhuhmKPGOJTKCevz
	TeV86rBBp1h1J4pg24EKpXXwW6Sd0mJnabzIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PvEhYkNfdrQmw3igliSq2RApJzbS78EfwohZ9RFCi+U=;
	b=m2uYdl1kT7QCfF5mc5GBh3eXnbPe8ffl6PZ1uXJ5sA+KVhtP0dzpS0UoD8uwzfCRmN
	qprH/SgTjEhfW2p9Xpe1xc6YVLaQzu4f2HgihvAWfsEonsAYfVjRxPLlQRHKYiKOiqb7
	Z3hpQiXc7nnnfTmLhblUX7m8AlmdXnGizLXgeFJg1yxJBqEgebYwLW8BkSliUPh60A3L
	M5wGp11np6O8PTtR26KPNZfd651etSgglO/MS8yqr6PGmtyXvIsmk6jvKw0ZRitICwL+
	xdrEGzDgtlsbStcDljl3j2MV1OxDYEryO0QffLolN7Kbc3j4diXZ0OLwW/YHv5R1rw6g
	uizQ==
X-Gm-Message-State: AA+aEWbr7kJHQ1MB8i6WTbySHwU7qYpEGlnO/VyxDg+2Ybn6+OUihRdF
	DVpouySfpiARBfRc8T6nFshbDQ==
X-Google-Smtp-Source: AJdET5et5aOzjfWtvBMsGXw7ysIKlNfICzGzu3s/yTda/zSoIg8M8VDK0Zj0LrmmBk79VhwMNyB9fw==
X-Received: by 2002:a25:5b54:: with SMTP id
	p81-v6mr2245844ybb.339.1542729141166; 
	Tue, 20 Nov 2018 07:52:21 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	l16sm4903335ywa.25.2018.11.20.07.52.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 07:52:20 -0800 (PST)
Date: Tue, 20 Nov 2018 10:52:17 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20181120155217.GA11247@bill-the-cat>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
	<CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
	<CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
	<CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 15:52:20 -0000
X-Groupsio-MsgNum: 118403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6y91TzBqz7AtkeNG"
Content-Disposition: inline

--6y91TzBqz7AtkeNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2018 at 01:48:40PM -0200, Otavio Salvador wrote:
> On Tue, Nov 20, 2018 at 1:40 PM Burton, Ross <ross.burton@intel.com> wrot=
e:
> >
> > (hit sent too early)
> >
> > Of course how big are these tools, and is it really useful splitting
> > them up?  If we're talking a 10k binary, is putting them in separate
> > packages worth the complication?
>=20
> I think it makes sense to split; we are building an embedded system
> build system and granular installation is a must have. Using PN to
> install all tools is a win win combination.

Agreed.  The common use cases won't need all of the possible tools so
lets not grow sizes we don't need to grow.

--=20
Tom

--6y91TzBqz7AtkeNG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJb9C2xAAoJEIf59jXTHXZSHhsP/ia5mfo/Sqw0K/P+LreNspXA
GIUbh72neIbJRGz4anRXS21klG324SvdGlEa73w6gUPEOZW2sejeRfS4GMYpJe/s
lrm5j6ZS4AKvLdp77a00Gp6rQX8smVSGQSGysl5GBJbixOpb3WeSIhpCHh+sKrOh
Z6M3E/+N5Rm91/jfXdsGj9sTe9oho8Vezh5By76g1ua+/NrF4OGc/XIsAoyOt7cP
Upb1gNeLsUrMMQDa90YUWnEX+7Yh805spqBakCsPrqpf7/M/cfzEXzhLip2UIjtL
Cv+AXwM0iM9gO/OH51SmIwYT9KCzWsnd5EXZ6CQb0cYJveDa9FrwC0ofNS8rxh1K
mnXPP9IKZvB90PRUweqxZ+nxAnx7MHr6KV5cAg7h4vPSbiPt2/rY5RjPLAX/AWGV
mc6nnt7QNNlURD28eIyL9E5wlUkE7mTuaTuMiHxDgDcaQ8IYqmz8Qj/ss7pXVxmo
pmpN2apdlc2/cpDJ9bHqqNC7cXZ9fenbE86zOS3qhLx2KlxF0dHd110GdszFPfuW
yWOkY7WWKxCb+glgoYrPFEPL6k6q6i/3byqZIVapVw1bSrCy6Po5kmjsgstXBUvw
TL0TFzdRwuWBvMfUYm8dJILzHOgXkzNtHvPta+OtwZgXJS9Mh38J5DofuqxCOkSa
GDZlTHbQEkPc/v5+lPp8
=m8Fu
-----END PGP SIGNATURE-----

--6y91TzBqz7AtkeNG--
