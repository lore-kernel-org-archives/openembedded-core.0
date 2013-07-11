Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id C0B1260289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:23:22 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so5511386eae.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YMSerCdW9ndCH4b5dg2NyfUQCL6rR1/+JvjhYz153eQ=;
	b=LS5bHaphmFuUXu2JxGKdZM7G0lZYqGzFjocJtkk6FZtD05wJknmQH719CX2l4aYSSa
	oRzWF5ME6Ao0uc6OeouuvMTyXDxinOMV+FZZFygWXKLriBWvNhsDGCAHCb6xGqNZR5Uw
	c5jUaTVZL9r92f0ugBE7mMX7GiFs5tBTpCs8jIWKi7UiM/1SD1ag64GsBhH0KvRa3Y10
	R5lLVJM/t6HEfO24PmGQp3oMkuqbe5GN69q2oaRdDju7ekyUxpeZx5gKcyKK2TvfQfgD
	IN+pTra+bXB27nMYog5oSwr7yp/ga7/3rI68DJkxaiko8Nf6k2TsBJaCvQTaaNt+3yHj
	PkuQ==
X-Received: by 10.14.115.9 with SMTP id d9mr40307091eeh.87.1373531002216;
	Thu, 11 Jul 2013 01:23:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm67085014eed.9.2013.07.11.01.23.20 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 01:23:21 -0700 (PDT)
Date: Thu, 11 Jul 2013 10:23:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Message-ID: <20130711082332.GG3288@jama>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Thu, 11 Jul 2013 08:23:23 -0000
X-Groupsio-MsgNum: 41777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bfHXWC0AWsk5KHuB"
Content-Disposition: inline

--bfHXWC0AWsk5KHuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 12:45:28PM +0500, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>=20
> - Remove dependency on systemd layer
> - Install 'sysv' related files only if distro has this feature

Will you please send .bbappend removal patches for meta-systemd layer
when your changes in oe-core are applied? That way I don't need to keep
track of what was moved already. Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bfHXWC0AWsk5KHuB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHea4QACgkQN1Ujt2V2gBzDFQCfaYO37+NDCf3O36a5M9jbL9K8
W3MAn32lkX6Sq94V5QqWF7oFiugZ2kKm
=4sKQ
-----END PGP SIGNATURE-----

--bfHXWC0AWsk5KHuB--
