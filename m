Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJpNO-0003OU-Ea
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 18:01:34 +0200
Received: by wwi18 with SMTP id 18so3531841wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 08:58:48 -0700 (PDT)
Received: by 10.227.160.11 with SMTP id l11mr2814762wbx.1.1305043128228;
	Tue, 10 May 2011 08:58:48 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm4483987wbo.3.2011.05.10.08.58.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 08:58:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 17:58:42 +0200
Message-Id: <4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Tue, 10 May 2011 16:01:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> As discussed, we want to make OE-Core usable with no distro set. This =
patch series
> makes some big steps towards that goal. I'd be interested in feedback =
on whether it
> does the right things and would be usable by others.
>=20
> The key is the inclusion of a distro/defaultsetup.conf file by =
bitbake.conf and=20
> in turn this pulls in a variety of other common include files which =
can likely be
> shared. Any point of this cycle can be overridden by another layer so =
its totally
> customisable. I'd encourage users to use the pieces they can where =
possible so we
> all share best practises but obviously people have choice.
>=20
> I did dump a load of "default" variables into default-distrovars.inc, =
I'm not
> calling that file finished, I just had to draw the line somewhere and =
start a=20
> discussion about this :)


For angstrom we had to change a few things, have a look at =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/c=
onf/distro/include/angstrom-core-tweaks.inc , specifically lines 12-18 =
and 53-54



regards,

Koen=


