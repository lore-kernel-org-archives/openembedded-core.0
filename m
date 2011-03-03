Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pv5IE-0000OD-Va
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 10:57:59 +0100
Received: by wyb38 with SMTP id 38so857274wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 01:56:30 -0800 (PST)
Received: by 10.216.188.201 with SMTP id a51mr372605wen.60.1299146190189;
	Thu, 03 Mar 2011 01:56:30 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id g8sm430383wej.23.2011.03.03.01.56.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 01:56:29 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299145156-32150-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2011 10:56:27 +0100
Message-Id: <74B0C439-B6A4-4AF7-9567-0B3E1521F0A8@dominion.thruhere.net>
References: <1299145156-32150-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] sanity.bbclass: some multilib systems have symlink /lib -> /lib64
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
X-List-Received-Date: Thu, 03 Mar 2011 09:57:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt 2011, om 10:39 heeft Martin Jansa het volgende geschreven:

> * ie gentoo has /lib -> /lib64
> * old test assumed only /lib64 -> /lib
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Looks good to me:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
> meta/classes/sanity.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 13940f8..433313b 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -211,7 +211,7 @@ def check_sanity(e):
>     nolibs =3D data.getVar('NO32LIBS', e.data, True)
>     if not nolibs:
>         lib32path =3D '/lib'
> -        if os.path.exists('/lib64') and os.path.islink('/lib64'):
> +        if os.path.exists('/lib64') and ( os.path.islink('/lib64') or =
os.path.islink('/lib') ):
>            lib32path =3D '/lib32'
>=20
>         if os.path.exists('%s/libc.so.6' % lib32path) and not =
os.path.exists('/usr/include/gnu/stubs-32.h'):
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



