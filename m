Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QK331-0007yH-Gx
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:37:27 +0200
Received: by wye20 with SMTP id 20so141587wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:34:41 -0700 (PDT)
Received: by 10.216.239.67 with SMTP id b45mr76182wer.44.1305095681217;
	Tue, 10 May 2011 23:34:41 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	s40sm3880714weq.28.2011.05.10.23.34.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:34:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4d4aef2d2625c935f09c277d892df6860fd0e28d.1305088327.git.raj.khem@gmail.com>
Date: Wed, 11 May 2011 08:34:37 +0200
Message-Id: <7D81A80D-B331-428F-855C-2120F6B8052B@dominion.thruhere.net>
References: <cover.1305088327.git.raj.khem@gmail.com>
	<4d4aef2d2625c935f09c277d892df6860fd0e28d.1305088327.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/2] metadata_scm.bbclass: Use COREBASE to grok for SCM operations
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
X-List-Received-Date: Wed, 11 May 2011 06:37:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 06:35 heeft Khem Raj het volgende geschreven:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This fixes bitbake bombing out after moving OE-core down in =
bblayers.conf:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
> meta/classes/metadata_scm.bbclass |    5 +----
> 1 files changed, 1 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/metadata_scm.bbclass =
b/meta/classes/metadata_scm.bbclass
> index 7112ad5..99ac05c 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -25,12 +25,9 @@ def base_detect_branch(d):
> 			return rev.strip()
>=20
> 	return "<unknown>"=09
> -=09
> -=09
>=20
> def base_get_scmbasepath(d):
> -	path_to_bbfiles =3D bb.data.getVar( 'BBFILES', d, 1 ).split()
> -	return path_to_bbfiles[0][:path_to_bbfiles[0].rindex( "packages" =
)]
> +	return bb.data.getVar( 'COREBASE', d, 1 )
>=20
> def base_get_metadata_monotone_branch(path, d):
> 	monotone_branch =3D "<unknown>"
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



