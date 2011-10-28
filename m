Received: from fluxnetz.de ([213.133.97.20] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mokml@mnet-online.de>) id 1RJtco-0005Ha-Jr
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 23:06:02 +0200
Received: from gonzales.palutemo by digox.de with esmtp (emil_hOJ9MtmYe440m);
	Fri, 28 Oct 2011 23:00:03 +0200
Date: Fri, 28 Oct 2011 22:58:43 +0200
From: Klaus 'mrmoku' Kurzmann <mokml@mnet-online.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111028205842.GA17752@gonzales.palutemo>
References: <201110272230.29012.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201110272230.29012.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Klaus Kurzmann <mok@fluxnetz.de>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 28 Oct 2011 21:06:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Oct 2011, Andreas M=FCller wrote:

> Since the last updates of all layers (angstrom based) I have issues with

> * networkmanager/nm-applet (meta-oe): I am not allowed to change the sett=
ings
>   any more
> * xfce-session (meta-oe): Logging out takes very long and Restart/Shutdow=
n is=20
>   disabled

> I remember that I had similar issues a while ago. That could be worked ar=
ound
> by starting some dbus stuff ( do not exactly remember what it was ).

> With this vague idea I checked and found in oe-core:

> | dbus: use useradd class to allow use in read-only filesystems
> | author	Otavio Salvador <otavio@ossystems.com.br>
> | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13

> Not understanding totally what is all about I see in /etc/passw

> | messagebus:x:999:998::/var/lib/dbus:/bin/sh

> but I don't have /var/lib/dbus on my sytem!!

> I did not check yet, but maybe this is an incompatibilty with angstrom cu=
stom

> | FILESYSTEM_PERMS_TABLES =3D "fs-perms-angstrom.txt"

> somebody around to enlight the darkness?

one problem seems to be /usr/lib/dbus-1.0/dbus-daemon-launch-helper
having wrong ownership. It is root:root instead of root:messagebus how
it should be. Dunno if that is the only problem but fixing that makes
dbus-activation work again.


> Andreas


Klaus 'mrmoku' Kurzmann


