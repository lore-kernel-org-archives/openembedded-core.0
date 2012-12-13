Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TjE2g-0001g4-Tr; Thu, 13 Dec 2012 20:02:00 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so894820dak.6
	for <multiple recipients>; Thu, 13 Dec 2012 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=svYNi4+26nVFyhIHtLbDE5qTQqhsilV7cSTrLV/K3NE=;
	b=W7Ij2kfXFlE7oX8L86Sgg3kS9sxwbAF8XAyRuvwSIJeJhRd6ReHlY5XEgTlGRFW7y7
	znwOjoiXJnDldD0f1Ld2gEX5GcdWpnzuq52Xu2QjLbclI3srY33jvfYJu6fKpam9TgUj
	F0c4Df6ANHEcIWzb/4TAKmtE92SMthmYmTA9Bqz8Bh3M0OjYDjkcTWYzcIe65AXX+44G
	PhoGcHJPnrHGNM6cNqWJCD5VlVTp3jK+HH3yLNndOAOYVSCCi/ajPVznWv+yZxkE+kEy
	hBpyWb+RGlDNT64ixrw6Jq1+pUssgeAE14L3+8pptd4MADEx44BkT3QRvNIBdHWkQkY3
	MQww==
Received: by 10.66.52.102 with SMTP id s6mr8812095pao.6.1355424442741;
	Thu, 13 Dec 2012 10:47:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id yi9sm1435658pbc.39.2012.12.13.10.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 10:47:21 -0800 (PST)
Date: Thu, 13 Dec 2012 19:47:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20121213184734.GG3356@jama.jama.net>
References: <20121213174202.GE3356@jama.jama.net>
	<CALbNGRQJCHMxY403ZbzehuurM2jt2UnVbdETqh=PVm73JV4BvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQJCHMxY403ZbzehuurM2jt2UnVbdETqh=PVm73JV4BvA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Thu, 13 Dec 2012 19:02:01 -0000
X-Groupsio-MsgNum: 32644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline

--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 07:20:33PM +0100, Andreas M=FCller wrote:
> On Thu, Dec 13, 2012 at 6:42 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '1'
> Feel a bit responsible for this one. Could you give some details?

more then:
  patch on ML
  | http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1:
parser error : Content error in the external subset
  | HTTP/1.1 200 OK

?

I'll send that patch set as soon as I can verify it on the same box
where it failed before (I've verified it locally already, but as some
PATCHv2 from last week confirms, sometimes it's not good enough test).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDKIsYACgkQN1Ujt2V2gBxcBgCgt8M9mo6M5cdq/33ot5Fyax92
brwAoIofgtsESqoB+wj6Ot4Dp6ue28o6
=aJti
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
