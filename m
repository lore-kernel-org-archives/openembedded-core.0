Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8FLx-0002tG-V7 for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 19:52:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QHrOoV006404 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:53:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0s9yqw2EoUl2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:53:24 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QHrJnH006365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 18:53:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 18:46:56 +0100
In-Reply-To: <CAMKF1sqUF-tGki2ihVLR1j2rRwZnGO4OCzJdTBck9e2NqggHmw@mail.gmail.com>
References: <1316843665-26137-1-git-send-email-raj.khem@gmail.com>
	<1316971428.8185.34.camel@ted>
	<CAMKF1sqUF-tGki2ihVLR1j2rRwZnGO4OCzJdTBck9e2NqggHmw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317059223.26109.71.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] gnome-doc-utils: Prepend PKG_CONFIG_SYSROOT_DIR to the path returned from PKG_CONFIG
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
X-List-Received-Date: Mon, 26 Sep 2011 17:52:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 10:07 -0700, Khem Raj wrote:
> On Sun, Sep 25, 2011 at 10:23 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2011-09-23 at 22:54 -0700, Khem Raj wrote:
> >> If we build say gnome based image on a build system which does not have
> >> gnome e.g. kubuntu then packages like gedit do not build since it uses
> >> gnome files from host system which are non existent on kubuntu
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../gnome-doc-utils/sysrooted-pkg-config.patch     |   37 ++++++++++++++++++++
> >>  meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    6 ++-
> >>  2 files changed, 41 insertions(+), 2 deletions(-)
> >>  create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
> >>
> >
> > Merged to master, thanks.
> >
> 
> Richard
> 
> It does not appear in the pull I just did moments ago.

Sorry, not sure how that went wrong but I've merged it now...

Cheers,

Richard



