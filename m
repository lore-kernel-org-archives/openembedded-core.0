Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvQyH-0001eC-IJ
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 10:06:49 +0100
Received: by wyb38 with SMTP id 38so1847457wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 01:05:18 -0800 (PST)
Received: by 10.216.51.135 with SMTP id b7mr357349wec.29.1299229518098;
	Fri, 04 Mar 2011 01:05:18 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	t11sm1044105wes.41.2011.03.04.01.05.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 01:05:17 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D703953.8040000@intel.com>
Date: Fri, 4 Mar 2011 10:05:16 +0100
Message-Id: <8081091C-6C1A-44C5-9428-239C293C01F0@dominion.thruhere.net>
References: <cover.1299182375.git.sgw@linux.intel.com>	<e5662d07e615cfa5879a5d700df2d1e9049a6413.1299182375.git.sgw@linux.intel.com>
	<AANLkTi=aQ=HYbPrXd98qvxYC=voFhf0AJMsse5bcrp3M@mail.gmail.com>
	<4D703953.8040000@intel.com>
To: "Zhai, Edwin" <edwin.zhai@intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Fri, 04 Mar 2011 09:06:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt 2011, om 01:58 heeft Zhai, Edwin het volgende geschreven:

>=20
>=20
> Khem Raj wrote:
>>=20
>>=20
>> > --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
>> > +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
>> > @@ -16,9 +16,12 @@ PACKAGE_ARCH =3D "all"
>> >
>> >  EXTRA_OECONF +=3D =
"--with-iconmap=3D${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
>> >
>> > +#explictly setting "Sato" as default icon theme to avoid icon =
missing due to
>> > +#tricky race condition
>> >  pkg_postinst_${PN} () {
>> >         if [ "x$D" !=3D "x" ]; then
>> >                 exit 1
>> >         fi
>> >         gtk-update-icon-cache -q /usr/share/icons/Sato
>> > +        echo 'gtk-icon-theme-name =3D "Sato"' >> =
/etc/gtk-2.0/gtkrc
>>=20
>> what would happen if you reinstalled this packge again I guess it
>> would keep appending right ?
>>=20
>=20
> I think postinst only got called via init script on 1st boot of the =
image, so it should be okay.

Postinst get called every time your install, reinstall or upgrade a =
package.

regards,

Koen=


