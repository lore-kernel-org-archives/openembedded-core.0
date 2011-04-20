Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCU0I-0005nR-OV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 11:47:23 +0200
Received: by fxm19 with SMTP id 19so366699fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gNl5ZZawNe5Z27RoE+D0x33PN4dUjR+uJmTiAnFPTnc=;
	b=rtmlkSAzixWisj6DKH/MRTROM36K6BLbLgm63bPAJoZdA3h1XKuYILOpry2UNarRhC
	PnmPaUjpHsG3Q68/NiAJg6aOGnQkXDZskV1zIyznkMWg9Me8lDXmkcr0JnZ2QoEagB5N
	qIAKBFBjoQ63Jy8SqjXOmH02xSFFCeifbD86k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KK9KkQ2r2EaiYVUTZYtwVMshXjaPB68gPyqEp1e2Agga1fueyQAZG8bcdEaVtFBkRv
	/i7ti5DrAsj3kXmeZUTIlxEfs4aeha4E/ZNm4gc621tgg39S5Mq+E0IM0ZbO0vAjuL1A
	skeBHxL3Tcv+/QVGRJCCzn8KIL1Se3vZ0XkwI=
Received: by 10.223.74.83 with SMTP id t19mr1857229faj.149.1303292700384;
	Wed, 20 Apr 2011 02:45:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c21sm226427fac.46.2011.04.20.02.44.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 02:44:59 -0700 (PDT)
Date: Wed, 20 Apr 2011 11:44:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110420094458.GI5675@jama.jama.net>
References: <20110420091523.GH5675@jama.jama.net>
	<89CD9535-8ECD-4B21-AF00-DC47EEF03418@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <89CD9535-8ECD-4B21-AF00-DC47EEF03418@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Mailman refusing multipart/signed Content-Type
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
X-List-Received-Date: Wed, 20 Apr 2011 09:47:24 -0000
X-List-Received-Date: Wed, 20 Apr 2011 09:47:24 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline

--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 11:41:03AM +0200, Koen Kooi wrote:
>=20
> Op 20 apr 2011, om 11:15 heeft Martin Jansa het volgende geschreven:
>=20
> > Hi,=20
> >=20
> > mailman always refuse gpg signed e-mails from me when I forgot to
> > disable default sign.
> >=20
> > Complete header is:
> > Content-Type: multipart/signed; micalg=3Dpgp-sha1; protocol=3D"applicat=
ion/pgp-signature"; boundary=3D"cvVnyQ+4j833TQvp"
> > Content-Disposition: inline
> >=20
> > Mailman message is:
> > The message's content type was not explicitly allowed
> >=20
> > Other LTG lists don't have problem with this, is it intentional or could
> > someone fix oe-core ML configuration?
>=20
> I added 'multipart/signed' to the whitelist, could you try and see if it =
works?

trying now :)

Thanks in advance

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GdbWtwDHkcXqP16f--
