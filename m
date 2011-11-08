Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmcz-0006Io-75 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:26:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8EK32W000334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:20:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32744-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 14:19:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8EJm2f000319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:19:49 GMT
Message-ID: <1320761990.10843.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 14:19:50 +0000
In-Reply-To: <1320741708-15019-2-git-send-email-eric@eukrea.com>
References: <4EB86E07.5020907@intel.com>
	<1320741708-15019-1-git-send-email-eric@eukrea.com>
	<1320741708-15019-2-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pA8EK32W000334
Subject: Re: [PATCH 2/2] dbus: fix install for virtclass-nativesdk
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
X-List-Received-Date: Tue, 08 Nov 2011 14:26:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-08 at 09:41 +0100, Eric B=C3=A9nard wrote:
> * 46e6c3fa8034b12d178d605f3f5d7efe69671a13 changed do_install
> which now fails for nativesdk (chown messagebus leads to no
> such user)
> * tested by building meta-toolchain-qte and running the generated
> sdk
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Acked-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-core/dbus/dbus.inc |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/d=
bus.inc
> index caa781c..99b2fc7 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -105,4 +105,8 @@ do_install_virtclass-native() {
>  	# dbus-glib-native and dbus-glib need this xml file
>  	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-=
bus-introspect.xml
>  }
> +
> +do_install_virtclass-nativesdk() {
> +	autotools_do_install
> +}
>  BBCLASSEXTEND =3D "native nativesdk"

I've merged this piece to master, thanks.

Richard



