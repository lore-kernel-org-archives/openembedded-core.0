Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB51M-0004mE-Hm for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 15:26:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94DRp7o001818 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 14:27:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4ApgfFqxoLq3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 14:27:51 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94DRjf5001813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 14:27:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 14:21:16 +0100
In-Reply-To: <j6abik$9f7$1@dough.gmane.org>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
	<1317401867.12332.216.camel@ted> <j6abik$9f7$1@dough.gmane.org>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317734484.14671.39.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p94DRp7o001818
Subject: Re: [PATCH 0/7] Qt4 upgrade/fixes
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
X-List-Received-Date: Tue, 04 Oct 2011 13:26:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-10-02 at 22:45 +0400, Dmitry Eremin-Solenikov wrote:
> On 09/30/2011 08:57 PM, Richard Purdie wrote:
> > On Fri, 2011-09-30 at 17:33 +0100, Paul Eggleton wrote:
> >> This is a pull request for Eric B=C3=A9nard's qt4_upgrade branch, in=
cluding
> >> an update of Qt to 4.7.4 (preserving 4.7.3 until other layers such a=
s
> >> meta-oe, meta-yocto etc. can sync up) as well as several important b=
ug
> >> fixes.
> >>
> >> The patches look good; if was to be really picky though I would say =
that
> >> the two demo/doc patches in the series ought to be merged into one p=
atch,
> >> and there are a few typos in the commit messages. I'm also relying o=
n
> >> others to review the correctness of the armv6-vfp no-neon patch as I=
 have
> >> no knowledge of this area.
> >>
> >>
> >> The following changes since commit c54c1280fc0d06a53e23339c3913ec88e=
ead13d9:
> >>
> >>    base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100=
)
> >>
> >> are available in the git repository at:
> >>    git://git.openembedded.org/openembedded-core-contrib paule/qt4_up=
grade
> >>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/l=
og/?h=3Dpaule/qt4_upgrade
> >>
> >> Denis Carikli (3):
> >>    qt4.inc: remove the optional documentation package from the demo'=
s
> >>      RRECOMMENDS
> >>    qt4(embedded and x11): disable neon for armv6-vfp
> >>    qt4.inc: package qtdemo's docs in a separate package
> >>
> >> Eric B=C3=A9nard (3):
> >>    qt4e-demo-image: improve image
> >>    qt4: fix generated sdk
> >>    qt4: update to latest version 4.7.4
> >>
> >> Otavio Salvador (1):
> >>    qt4: fix translation support
> >
> > Thanks Paul. I fixed the typos and queued this on master-next.
>=20
> It seems, during 4.7.3 -> 4.7.4 addition, fix-translation patch got=20
> lost. Richard please reaply the "qt4: fix translation support" after=20
> s/4.7.3/4.7.4/ . I can provide a patch if you'd like.

Thanks, I'll merge your two patches. If there is anything else qt4
related that is missing please let me know as I'm assuming these merges
bring the qt4 patches up to date!

Cheers,

Richard



