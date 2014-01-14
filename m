Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 305F16A566;
	Tue, 14 Jan 2014 13:33:25 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so3976299eaj.12
	for <multiple recipients>; Tue, 14 Jan 2014 05:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S68Ch5KggF9aTqI/k2ez9R7a7uXwbuTXTdlQRH2Bbvg=;
	b=xXX0gbTK2JMsD3rN4IHOChSCg0I+QnmTfc8S2x8k94es+ekNVw2wQnFWoTqZnxckro
	zKj8eUslG/I7SS+M59NVT7URCB3orhPdzYK1JnqNTIWlt+JEy2UEiNev9FBVzYPKyGDH
	a9KeTRJG39cYUkmvE1i1EH5XpbXd44gTm0zby9x2+y8fnxt+Jk+uR8OAM9TVxLPhC+kk
	w02FX6aezFeeqXkAYae1ZNtJiNjxZ6pChUqch7/P4j5d2O4SxUOh3sxi2jY4dyMZfxFW
	swrDQESnSljK819R2MN1kUX6qQxfveay4WS2IZcnyuOkQaJ+oRQYaSKTR5kIV2eOHtM+
	6Xag==
X-Received: by 10.14.113.199 with SMTP id a47mr2191046eeh.41.1389706405768;
	Tue, 14 Jan 2014 05:33:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm1669095eed.14.2014.01.14.05.33.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 05:33:24 -0800 (PST)
Date: Tue, 14 Jan 2014 14:33:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20140114133339.GC3717@jama>
References: <7166127.YkfX3aIoNI@helios> <20140114121347.GB3717@jama>
	<1389704128.19023.11.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1389704128.19023.11.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Public TSC / OE Workgroup meeting today
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
X-List-Received-Date: Tue, 14 Jan 2014 13:33:26 -0000
X-Groupsio-MsgNum: 48968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 12:55:28PM +0000, Phil Blundell wrote:
> On Tue, 2014-01-14 at 13:13 +0100, Martin Jansa wrote:
> > Not sure if it's worth new item on agenda, but maybe we should move
> > meta/classes/image-prelink.bbclass functionality to package.bbclass,
> > maybe we have more cases like this where image build is changing files
> > which are provided by normal packages (such cases are lost after
> > upgrading on device with packagemanager).
>=20
> How would that work?  I'm not sure that it's possible (in the general
> case) to prelink in any sensible way prior to rootfs construction.  The
> same applies to image-mklibs.bbclass.

Hmm, you're right.

The reason why I was thinking about this, is that someone reported to me
that libc-dbg doesn't work after prelink changed libc headers in
do_rootfs (external toolchain).

IIRC there was some discussion about issues caused by prelink changing head=
ers,
I'll try to find it in archives, sorry for noise.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLVPLMACgkQN1Ujt2V2gBznHwCeNQpU3XEyex7+zvDqiPYuCriY
lAcAoKwZ9GO5NxcIv1eVj0DR0UGkmz+x
=wGXx
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
