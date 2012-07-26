Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuQek-0004Iz-TY for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:11:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QFxn2i022733
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:59:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22416-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:59:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QFxdQV022726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:59:41 +0100
Message-ID: <1343318378.7600.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 16:59:38 +0100
In-Reply-To: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6QFxn2i022733
Subject: Re: [PATCH] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 16:11:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-26 at 17:16 +0200, Andreas M=C3=BCller wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/gtk-doc.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclas=
s
> index 8a312f5..be10c75 100644
> --- a/meta/classes/gtk-doc.bbclass
> +++ b/meta/classes/gtk-doc.bbclass
> @@ -7,7 +7,7 @@
>  # packages up any existing documentation (so from tarball builds).
> =20
>  DEPENDS_append =3D " gtk-doc-stub-native"
> -DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"
> +DEPENDS_append_virtclass-native =3D " gtk-doc-stub-native"
> =20
>  EXTRA_OECONF_append =3D "\
>    --disable-gtk-doc \

What happens if we simply remove this line entirely?

Do we have any recipes setting DEPENDS_virtclass-native which also use
this class? If so, we might end up just hardcoding things...

Cheers,

Richard



