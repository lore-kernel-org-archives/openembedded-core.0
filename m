Received: from mail-gh0-f169.google.com ([209.85.160.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFp4W-0000gB-NV
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 18:02:43 +0100
Received: by mail-gh0-f169.google.com with SMTP id r18so211723ghr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7jBT3s3hgXY1OoS4QU4zqsv5TuGFwf2OlmZvFbtvWPM=;
	b=V3A619byLFXG6oxrhUZgQ2Le8Dcd6SERQ+P7iggp3JN8jSk/OswwqFrgVQDSG8LF/c
	7JFdrW82YFv4f+UfQCHyFdSMDwzxTkqJxtNCRMe3LpuwdD/kEP9L0nY8Sur2GItscHt3
	1nZRvwHQu8zziInVggjm1o+qJ8o1wra/0UfnVg4n+xStJI1u8ambz3d2jCrBVYJW7Usn
	gtuyj5nsWLkIeLmPEv4HmLlrNcqcheyiU7iV/T/mcpCYmLEFVK0REb4Bc4urV4N6Gtv2
	cG82VpjRyrwNLIfHDlF98jPECLwXDLnbyCxDzkbPGwUSQ6z3uZabgbvc9wzNnyuJFUj8
	656Q==
X-Received: by 10.236.134.163 with SMTP id s23mr15979332yhi.54.1363193155451; 
	Wed, 13 Mar 2013 09:45:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u2sm36353475yhl.8.2013.03.13.09.45.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:45:54 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:45:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130313164546.GA3260@jama>
References: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
	<1362492625.29587.95.camel@ted>
	<20130305142018.GB12023@jama.dyndns-home.com>
	<1362503769.11727.24.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362503769.11727.24.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: move systemd support where it belongs
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
X-List-Received-Date: Wed, 13 Mar 2013 17:02:46 -0000
X-Groupsio-MsgNum: 36581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MziYxCZO8WOaTd4I"
Content-Disposition: inline

--MziYxCZO8WOaTd4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 05:16:09PM +0000, Richard Purdie wrote:
> On Tue, 2013-03-05 at 15:20 +0100, Martin Jansa wrote:
> > On Tue, Mar 05, 2013 at 02:10:25PM +0000, Richard Purdie wrote:
> > > On Mon, 2013-03-04 at 14:25 +0100, Martin Jansa wrote:
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-connectivity/avahi/avahi.inc       | 6 +-----
> > > >  meta/recipes-connectivity/avahi/avahi_0.6.31.bb | 6 ++++++
> > > >  2 files changed, 7 insertions(+), 5 deletions(-)
> > >=20
> > > "where it belongs"? Is this due to the avahi-ui recipe?
> >=20
> > Yes, avahi-ui is overwriting PACKAGES and systemd.bbclass was showing
> > warnings since this systemd was added to avahi.inc
>=20
> In future please put that in the commit message. I added it this time...

Thanks for adding it, I've reported this issue with longer description
on 27 Feb 2013, then I forgot about it and because I got no reply from
developer who introduced it I've fixed later in hurry to get
meta-systemd parsing again.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MziYxCZO8WOaTd4I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFArToACgkQN1Ujt2V2gBzx5QCcDIp5hQxEkSTu8HZA74qunYHF
TSoAnRh9phurWGh5UVIPaPNd078Ikyhi
=2hbU
-----END PGP SIGNATURE-----

--MziYxCZO8WOaTd4I--
