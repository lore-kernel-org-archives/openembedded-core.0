Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7Dn3-0007ji-Bw
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 00:37:19 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so2151646dak.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 15:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QoHm4SCiJnzoeV7xav5SjI9J5Zy4tj+fukvRLJU3S54=;
	b=ZcN4bArFj8RlToMQCGVcpBALGf9um8HinbOav5vQ3qEgeikG4BVDnvp72V5Cu+rmzF
	4ycac8033zQizFDucUDJmKzWhw/4IO4tEhwowm8Yy7W20p7Vy+DO9/cARAsw/2hi5dv+
	v/KRy0CXlMd5hp7BWvGyJRwl5NsS8PJ2owDIO8zEd0uvPwb5iwGBAD2sLnAc7TzyDuJX
	3u5DkxssdAmWo+72/iC/KrtO0VKua0IDuufuDnOYbak/20yMuvr9luBwrsp+9DZHRTOA
	Nvm7NCrT0H4Q9vUg84Cx8Soq9Zy/GNecoadbIqHay6rxDvFrFxQHoijVrvuqV2XHeuQG
	9PGw==
X-Received: by 10.68.48.165 with SMTP id m5mr25204499pbn.40.1361143253519;
	Sun, 17 Feb 2013 15:20:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mw8sm12313177pbc.21.2013.02.17.15.20.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 15:20:52 -0800 (PST)
Date: Mon, 18 Feb 2013 00:20:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130217231955.GF3300@jama>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1361019187.31795.49.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sun, 17 Feb 2013 23:37:19 -0000
X-Groupsio-MsgNum: 35561
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="peRj85VDUce1fu/0"
Content-Disposition: inline

--peRj85VDUce1fu/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2013 at 12:53:07PM +0000, Richard Purdie wrote:
> On the specifics of the do_install_append, you've seen my comments about
> how we're not learning from past mistakes with the way the do_install in
> the class was written. I note Phil also agreed with them, both of us
> remembering some of the horrors we've dealt with in the past (and
> binconfig.bbclass is still around, sadly).

But it doesn't need to be as dangerous as binconfig.bbclass, because we
already list .service or .socket files in SYSTEMD_SERVICE
so we can improve that "find" call to install only stuff we know we need
and error out if it's not found or if there are multiple versions of
that file in WORKDIR.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--peRj85VDUce1fu/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEhZdQACgkQN1Ujt2V2gByzcACcCgoj+y31mJ2SQSOlFIVyS0bH
cgUAoKXoD+1Kh34OnjxCZzRsic5pF4lj
=bkaM
-----END PGP SIGNATURE-----

--peRj85VDUce1fu/0--
