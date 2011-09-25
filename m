Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R7stM-0005GN-85
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:53:28 +0200
Received: from ad.chargestorm.se (85.231.30.150) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Sun, 25 Sep 2011 19:48:04 +0200
Date: Sun, 25 Sep 2011 19:48:18 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110925174817.GA3663@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-4-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKqYbuwZ8a0gJrAY3gYKwGPioH9Nj69+nLWamUGLnEFLsQ@mail.gmail.com>
	<1316971251.8185.31.camel@ted>
	<CAP9ODKquVa1GNpKfchhExqswpYSY+qYFAmqQQcx4HHmP4LUupA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKquVa1GNpKfchhExqswpYSY+qYFAmqQQcx4HHmP4LUupA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 04/10] dbus-glib: include bash-completion stuff
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
X-List-Received-Date: Sun, 25 Sep 2011 17:53:28 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Otavio Salvador <otavio@ossystems.com.br> [110925 19:34]:
> On Sun, Sep 25, 2011 at 14:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2011-09-23 at 17:09 -0300, Otavio Salvador wrote:
> >> On Fri, Sep 23, 2011 at 16:46, Dmitry Eremin-Solenikov
> >> <dbaryshkov@gmail.com> wrote:
> >> ...
> >> > +FILES_${PN} =3D "${libdir}/lib*.so.* \
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${sysconfdir}/bash_completion.d/dbus-b=
ash-completion.sh \
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir}/dbus-bash-completion-help=
er"
> >> ...

> >> I'd prefer to have this in another package.

> > Me too, I think this should be packaged separately (with a RRECOMMENDS
> > on bash-completion for good measure).

> I don't think RRECOMMENDS are good in this case; people were using it
> without this for long time and noone has noticed yet so it seems not
> that required.

I think Richard meant that the new dbus-glib-bash-completion(?) package
should have a RRECOMMENDS on bash-completion (as it will be pretty
useless on a system without bash-completion).

Dbus-glib should definitely not start to RRECOMMEND bash-completion, as
noone has requested that for a long time.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


