Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpD22-00024r-4a
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:33:14 +0200
Received: by wyg30 with SMTP id 30so1957775wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 22:28:50 -0700 (PDT)
Received: by 10.217.2.202 with SMTP id p52mr1462431wes.28.1312522129903;
	Thu, 04 Aug 2011 22:28:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t46sm1597901wec.14.2011.08.04.22.28.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 22:28:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E3B542C.1070306@linux.intel.com>
Date: Fri, 5 Aug 2011 07:28:46 +0200
Message-Id: <ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Koen Kooi <koen@openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime	dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 05:33:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:

> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>=20
> But you did not test it against anything in oe-core, it has broken the =
build for connman-gnome and oprofileui, which use this bbclass.
>=20
> The oe-core gnome-icon-theme does not include this class.
>=20
> Please correct this.
>=20
>  Processing task-base-extended...
> | error: Failed dependencies:
> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
> | 	hicolor-icon-theme is needed by connman-gnome-0.5-r6.armv5te
> | 	hicolor-icon-theme is needed by =
oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.arm=
v5te

So you found broken metadata. If tasks, connman-gnome and =
oprofileui-server need hicolor-icon-theme, they should list it in their =
RDEPENDS_${PN}. That is a seperate issue than what I fixed in the =
bbclass=


