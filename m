Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8AVy-0004eP-1o for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:42:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QChNHN020887 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:43:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UCDPboglDZVq
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:43:23 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QChHQk020881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:43:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 13:36:54 +0100
In-Reply-To: <j5pran$mtt$1@dough.gmane.org>
References: <1316950444.8185.14.camel@ted>
	<1DFC8F6E-C652-42A6-83B2-147A77A70A95@dominion.thruhere.net>
	<j5pran$mtt$1@dough.gmane.org>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317040621.26109.32.camel@ted>
Mime-Version: 1.0
Subject: Re: qt3 vs qt4 issues
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
X-List-Received-Date: Mon, 26 Sep 2011 12:42:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 16:30 +0400, Dmitry Eremin-Solenikov wrote:
> On 09/25/2011 06:50 PM, Koen Kooi wrote:
> >
> > Op 25 sep. 2011, om 13:33 heeft Richard Purdie het volgende geschreven:
> >
> >> I've been looking at the qt3 failures on the autobuilder. It seems there
> >> is some kind of contamination between the qt4 builds and the qt3 builds
> >> and I'm not sure what is or isn't expected to work there.
> >>
> >> We're doing the following in the build:
> >>
> >> a) Build core-image-lsb (includes qt4, builds qt4+qt4-native)
> >> b) Wipe out tmp
> >> c) Add in meta-qt3 layer
> >> d) Enable sstate from build in a)
> >> e) Build core-image-lsb-qt3 which adds in qt3
> >> f) Bitbake determines it needs to install qt4 for the image but
> >>    nothing depends on the native qt4 tools so these are not installed
> >> g) This will build qt3+qt3-native with qt4 in the sysroot but no
> >>    qt4-native
> >> h) We see build failures as qt3 seems to want to find bits of qt4-native
> >>
> >> If qt4 and qt4-native are present, qt3 works
> >> If qt4 and qt4-native are not present, qt3 works
> >> If qt4 is present but qt4-native is not, qt3 fails
> >>
> >> How do we fix this?
> >
> > I suspect qt3 is missing bits of the tool renaming we do for qt4 and qt2 (moc, uic, lrelease, etc)
> 
> Most probably it's true. However for qt3 it can be harder, as qt4 
> already provides uic3, etc.

If there is overlap, the files could be installed into subdirectories
under bin and then inserted into PATH by the appropriate .bbclass
files...

Cheers,

Richard






