Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QDKFa-00046a-SA
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 19:34:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id C72061403A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 18:32:12 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id vghqf76vQWUy
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 18:32:11 +0100 (BST)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id E4D881401C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 18:32:10 +0100 (BST)
Received: by xora-desktop (Postfix, from userid 1000)
	id 06AB410128A; Fri, 22 Apr 2011 18:32:07 +0100 (BST)
Date: Fri, 22 Apr 2011 18:32:07 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110422173207.GA20271@xora-desktop.xora.org.uk>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
	<6B8E23E1-B345-4127-BC51-A92612BE94FB@dominion.thruhere.net>
	<BANLkTi=wNAZ2GG7PntqPXmQ3BGLgQwVD5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=wNAZ2GG7PntqPXmQ3BGLgQwVD5w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 17:34:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 10:27:31AM -0700, Khem Raj wrote:
> On Fri, Apr 22, 2011 at 10:25 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
> >
> > Op 22 apr 2011, om 19:16 heeft Khem Raj het volgende geschreven:
> >
> >> On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wr=
ote:
> >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>>
> >>> This fixes Bug [YOCTO #477]
> >>>
> >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>> ---
> >>> =A0.../python/python-pycairo_1.8.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A08 +++++++-
> >>> =A01 files changed, 7 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb =
b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
> >>> index 7d73dc2..24b3ff2 100644
> >>> --- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
> >>> +++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
> >>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1 & MPLv1.1"
> >>> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df2e071ab72978431b294a=
0d696327421"
> >>> =A0# cairo >=3D 1.8.8
> >>> =A0DEPENDS =3D "cairo"
> >>> -PR =3D "ml0"
> >>> +PR =3D "r1"
> >>
> >> any reason not to use mlX
> >
> > Because rX is a standard and mlX isn't
>=20
> why did we use ml to start with then ?
>=20
Its mickeys initials.

G



