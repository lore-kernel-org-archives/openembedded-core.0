Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQcNh-0003M8-3I
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 13:43:10 +0200
Received: by mail-da0-f52.google.com with SMTP id f10so1100937dak.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jRiTXXhyo0Yk4l9O+P0tCNCpP3y/t0pfu6jadmZi2yQ=;
	b=PsUZAo25nJf91d61cgy4qUW71/4vaZ1wezql9TWrPw/ysRSwy1NT6m9+BGdeq6b/k9
	rOlMQ17AOoswOZQg7taBYozT9cOXCi9tFrj6asAEFsiedTES6KWI4rGQ3kELzAQCICpA
	AUzciYUrTHMkflbp2Ze5XykuTJAdCS+umJOcgcgH2Q5P7cQ0jR9iexHFlE21uRn+V7xC
	t0aGaoXdM2QATzt33+gaFMp1D0sOfAaZLRuyLqhdepBn/bfvQsuDo9tdTjpm5EjHdDY0
	33aoKwmbSmjjHSUXAeZbwKEvx4OBsmBha7oyayof/IUzLJl+U75WAvqiNwU04TaVRaHU
	Oliw==
X-Received: by 10.66.230.164 with SMTP id sz4mr14764765pac.124.1365765935976; 
	Fri, 12 Apr 2013 04:25:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id zv4sm8208786pbb.28.2013.04.12.04.25.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:25:34 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:25:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: David Hirst <hirst689@gmail.com>
Message-ID: <20130412112528.GN2477@jama>
References: <CAHu+ux2oBDWYgWwZc8GUvCqaHCO4KHD=9M1WMM6Jho_Yqgcfjw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHu+ux2oBDWYgWwZc8GUvCqaHCO4KHD=9M1WMM6Jho_Yqgcfjw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: recipe for openssl 1.0.1
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
X-List-Received-Date: Fri, 12 Apr 2013 11:43:13 -0000
X-Groupsio-MsgNum: 37825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="95CBLwa+io9O2zXc"
Content-Disposition: inline

--95CBLwa+io9O2zXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 07:10:16AM -0400, David Hirst wrote:
> Is there as recipe for openssl version 1.0.1, having problems with it and
> wondered if I am just re-inventing the wheel.
> if any one has pointers or a recipe coudl you let me know

http://git.openembedded.org/openembedded-core/commit/?id=3D0470edd01c0aebaa=
78db137e365a7e22bfb199e9

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--95CBLwa+io9O2zXc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFn7ygACgkQN1Ujt2V2gBzRngCeOQZJU5rV2XNTrX5Nh6b4FjGz
57YAn1AFb3HNfjKem2xnSvtIaLJdM6I+
=vM4l
-----END PGP SIGNATURE-----

--95CBLwa+io9O2zXc--
