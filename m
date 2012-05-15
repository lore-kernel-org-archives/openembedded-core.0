Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SUHc2-0004bL-Im; Tue, 15 May 2012 15:16:26 +0200
Received: by eekd49 with SMTP id d49so1683967eek.6
	for <multiple recipients>; Tue, 15 May 2012 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4GXrkpyt1AwH43de8CIaKshESo12zo7kuW3u2hG/8XI=;
	b=YSyTNh1RwcebtkGrC0nRsqOgDqb+CXKkGpS23U2eR8qwQ9m+Rq7s2DQd5zezQL/+By
	x1/vCXsXmJcP2iuzQ1vbiq3ZwoYIVCyhBCqciXw5t3OztfVfoNrdsSV1zDPOFcmEFgvr
	+nERYEmJ+gowqXJSK1SJwJonN7SMwaZGuaIt/Bjhy9R2jfWmJUYQEnedFod504wG1YJa
	MzMjXkzSni7S6DzBdqKEZukc+JpYJ2ixpv72Cf+jzsVTw5UNAMlp+A+KYg+fHkXixVWF
	ugOIP5PbpnAKp7LnJJTdolKx4unpzIDE7iDmRt0o7pMDns0FJKHWSbszW952wi407iJi
	aDNw==
Received: by 10.14.22.6 with SMTP id s6mr445144ees.53.1337087186411;
	Tue, 15 May 2012 06:06:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d18sm106520554eeb.7.2012.05.15.06.06.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 06:06:25 -0700 (PDT)
Date: Tue, 15 May 2012 15:06:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120515130625.GD3166@jama.jama.net>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:16:26 -0000
X-Groupsio-MsgNum: 22152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline

--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 03:02:37PM +0200, Giuseppe Condorelli wrote:
> Hi All,
>=20
> there are a number of packages having a broken SRC_URI, for example git.
> Has someone met this issue?
> For sure we can correct those links adding a dedicated .bbappend file for
> each failing package but
> I think we could also update the main package fixing the errors.

This should go to oe-core ML:
openembedded-core@lists.openembedded.org

And yes it should be fixed in original recipe.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+yVNEACgkQN1Ujt2V2gBw9pACgoTmEhrafYXhcddnzkrQ3qqK+
oIMAoKwRLezPuCZ9GyMUd3hmK5iD2Qs1
=BXoO
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
