Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVO9Q-000481-4Z for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:55:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDmYYP013800
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:48:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13125-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:48:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDmQ2W013794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:48:27 GMT
Message-ID: <1322574514.6171.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 13:48:34 +0000
In-Reply-To: <1322563625-22780-1-git-send-email-eric@eukrea.com>
References: <1322563625-22780-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pATDmYYP013800
Subject: Re: [PATCH] qt4: fix sed to have correct *.pc files
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
X-List-Received-Date: Tue, 29 Nov 2011 13:55:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-29 at 11:47 +0100, Eric B=C3=A9nard wrote:
> it seems sed doesn't handle \? properly if the string in not between
> quotes.
>=20
> without this patch, we get something like (for example for QtDBusE.pc :
> Libs: -L${libdir} -lQtDBusE
> Libs.private: -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom_201=
0_x-eglibc/sysroots/board/
> usr/lib -L/usr/lib  -L/home/ebenard/WORK/setup-scripts/build/tmp-angstr=
om_2010_x-eglibc/sysroots/board
> /usr/lib -lQtXmlE -L/usr/lib -lQtCoreE -lpthread
> Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}
>=20
> with the patch we get what is expected :
> Libs: -L${libdir} -lQtDBusE
> Libs.private:     -lQtXmlE  -lQtCoreE -lpthread
> Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |   10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)

Merged to master, thanks.

Richard



