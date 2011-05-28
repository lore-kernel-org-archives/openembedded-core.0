Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQEce-00063H-7t
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 10:11:49 +0200
Received: by fxm19 with SMTP id 19so2033900fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vzMWFWTerTwaleg5O5URoM67oTbUdzeYCPpl5mg9svU=;
	b=FSNSCIySQu2ECE44asGhVkA8yoZVemwWgXgfriwEuUlft6nE/CAeinI21ChQkCV9go
	EM4SXsKRyN3+tJi+Ig+PohJM4iPegkO2tLzE/V7/mDV5aehlTQcW8GArLfe/3rViKKua
	T7TJnVPfCoKZwLjyo4oGOA/6w0eWoMHNgFq9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ja0KGEPMtqwd2DzvE07hpURknKQwr4VKEZZgsgOsqx5rhtd/RZYqqtDaB+/xRkBZFt
	oQrRQyKKx9S8aKDnhzR6R4pG4aQESMqbaGb9m+vM9WbW/v3kv9Q1P2jMBcuUXkvCrUj+
	FFM3OQf/psx79PQABeGvAn9HOwdYNIklFVtpE=
Received: by 10.223.61.134 with SMTP id t6mr1290710fah.28.1306570121268;
	Sat, 28 May 2011 01:08:41 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n15sm88895fag.18.2011.05.28.01.08.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 01:08:40 -0700 (PDT)
Date: Sat, 28 May 2011 10:08:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110528080834.GS3222@jama.jama.net>
References: <59c5261bea00cac9498a176d40e1aaa05da15a55.1306550616.git.raj.khem@gmail.com>
	<7c83be4418db5dc23614761dd34a2887c44828b4.1306550616.git.raj.khem@gmail.com>
	<F46CB9CD-BA76-4A6E-AFD7-2A2833C5743F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <F46CB9CD-BA76-4A6E-AFD7-2A2833C5743F@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] package.bbclass, prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
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
X-List-Received-Date: Sat, 28 May 2011 08:11:49 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9r3HF47jptiQlX4s"
Content-Disposition: inline

--9r3HF47jptiQlX4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2011 at 09:50:09AM +0200, Koen Kooi wrote:
>=20
> Op 28 mei 2011, om 04:44 heeft Khem Raj het volgende geschreven:
>=20
> > Value of USE_PR_SERV is either "1" or "0" looking at
> > settings in bitbake.conf
> > USE_PR_SERV =3D "${@[1,0][(bb.data.getVar('PRSERV_HOST',d,1) is None) o=
r (bb.data.getVar('PRSERV_PORT',d,1) is None)]}"
> > So we compare the strings
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> Fixes the problem for me:
>=20
> Tested-by: Koen Kooi <koen@dominion.thruhere.net>

For me too:
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

> > ---
> > meta/classes/package.bbclass |    2 +-
> > meta/classes/prserv.bbclass  |    2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index a1b9482..1e6a872 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -330,7 +330,7 @@ def runtime_mapping_rename (varname, d):
> > #
> >=20
> > python package_get_auto_pr() {
> > -	if d.getVar('USE_PR_SERV', True):
> > +	if d.getVar('USE_PR_SERV', True) !=3D "0":
> > 		auto_pr=3Dprserv_get_pr_auto(d)
> > 		if auto_pr is None:
> > 			bb.fatal("Can NOT get auto PR revision from remote PR service")
> > diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
> > index de46ff6..18b8589 100644
> > --- a/meta/classes/prserv.bbclass
> > +++ b/meta/classes/prserv.bbclass
> > @@ -12,7 +12,7 @@ def prserv_make_conn(d):
> >     return conn
> >=20
> > def prserv_get_pr_auto(d):
> > -    if not d.getVar('USE_PR_SERV', True):
> > +    if d.getVar('USE_PR_SERV', True) !=3D "0":
> >         bb.warn("Not using network based PR service")
> >         return None
> >=20
> > --=20
> > 1.7.4.1
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9r3HF47jptiQlX4s--
