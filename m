Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QK6Se-0007NA-Gb
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 12:16:08 +0200
Received: by wwb17 with SMTP id 17so321122wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 03:13:22 -0700 (PDT)
Received: by 10.216.69.140 with SMTP id n12mr6432505wed.32.1305108801988;
	Wed, 11 May 2011 03:13:21 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	g58sm3933436wen.20.2011.05.11.03.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 03:13:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305107117.30391.325.camel@rex>
Date: Wed, 11 May 2011 12:13:19 +0200
Message-Id: <D098457C-E05A-40F8-A61C-36604A51A2E1@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Wed, 11 May 2011 10:16:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 11:45 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-05-10 at 17:58 +0200, Koen Kooi wrote:
>> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>=20
>>> As discussed, we want to make OE-Core usable with no distro set. =
This patch series
>>> makes some big steps towards that goal. I'd be interested in =
feedback on whether it
>>> does the right things and would be usable by others.
>>>=20
>>> The key is the inclusion of a distro/defaultsetup.conf file by =
bitbake.conf and=20
>>> in turn this pulls in a variety of other common include files which =
can likely be
>>> shared. Any point of this cycle can be overridden by another layer =
so its totally
>>> customisable. I'd encourage users to use the pieces they can where =
possible so we
>>> all share best practises but obviously people have choice.
>>>=20
>>> I did dump a load of "default" variables into =
default-distrovars.inc, I'm not
>>> calling that file finished, I just had to draw the line somewhere =
and start a=20
>>> discussion about this :)
>>=20
>> For angstrom we had to change a few things, have a look at
>> =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/c=
onf/distro/include/angstrom-core-tweaks.inc , specifically lines 12-18 =
and 53-54
>=20
> I don't understand what TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH do, I =
can't
> find any reference to them in OECore.

They are for torublesome recipes combined with external toolchains. =
Denys, could you enlighten us a bit more on those?

> For the uclibc bits, I'm proposing
> to add:
>=20
> +DEPLOY_DIR_append =3D "-uclibc"
> +STAGING_DIR_TARGET_append =3D "-uclibc"
> +STAGING_DIR_HOST_append =3D "-uclibc"
> +SSTATE_MANIFESTS_append =3D "-uclibc"
>=20
> to tclibc-uclibc.inc.

Can we use _append_libc-uclibc =3D "uclibc" or even plain ${TCLIBC} in a =
generic include file? That would be a lot more readable and fix glibc vs =
eglibc.

> For the SDK/TOOLCHAIN bits, I need to have a close look at the SDK and
> figure out what the implications are there as I want to ensure that =
they
> can all be parallel installed as well as being in separate tarballs =
but
> its something we need to look at.

I needed 'armv5te' and 'armv7a' in the tarball name, so that's how this =
is derived. It matched the OE names, but Khem found some bugs and =
changed it a little.=


