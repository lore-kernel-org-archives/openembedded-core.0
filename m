Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROZoc-0002xh-Ir
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:57:34 +0100
Received: (qmail invoked by alias); 10 Nov 2011 18:51:17 -0000
Received: from p4FDF0772.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.7.114]
	by mail.gmx.net (mp065) with SMTP; 10 Nov 2011 19:51:17 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1982n9pCO98MoNZpBcAEP12Vv4f+ekQl73GN57Mcw
	hdgxgMsMqo9bly
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 19:56:09 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1320929044-13077-1-git-send-email-koen@dominion.thruhere.net>
	<1320931250.1165.18.camel@ted>
	<A8FB2C52-B689-46AF-9D24-D1EEBA2B19CF@dominion.thruhere.net>
In-Reply-To: <A8FB2C52-B689-46AF-9D24-D1EEBA2B19CF@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201111101956.09638.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] hicolor-icon-theme 0.12: add BBCLASSEXTEND=native for xfce tools
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
X-List-Received-Date: Thu, 10 Nov 2011 18:57:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Thursday, November 10, 2011 02:38:33 PM you wrote:
> Op 10 nov. 2011, om 14:20 heeft Richard Purdie het volgende geschreven:
> > On Thu, 2011-11-10 at 13:44 +0100, Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 ++
> >> 1 files changed, 2 insertions(+), 0 deletions(-)
> >> 
> >> diff --git
> >> a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> >> b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> >> index 759c9d8..aeb89c9 100644
> >> --- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> >> +++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> >> @@ -5,6 +5,8 @@ BUGTRACKER = "https://bugs.freedesktop.org/"
> >> LICENSE = "GPLv2"
> >> LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
> >> 
> >> +BBCLASSEXTEND = "native"
> >> +
> >> SECTION = "unknown"
> >> inherit gnome allarch
> > 
> > This is interesting dilemma since this is an allarch recipe. What issue
> > were you seeing to need this? Could we add the allarch sysroot directory
> > to PATH to resolve this instead? We could add a PROVIDES
> > "hicolor-icon-theme-native" too...
> 
> XFCE needs some native tools to run, one of which has hicolor-icon-theme in
> its depends. Without this patch you can't build xfce. Andreas might know
> more about this.
> 
Up to this mail I did not notice any problem but the bad guy seems xfce4-dev-
tools: Few xfce recipes depend on that and it contains only:

- m4 autoconf extensions
- two shell scripts (don't know what they are for...)

By inheriting xfce, it inherits gtk-icon-cache which seems to depend on hicolor-
icon-theme.

I don't remember what exactly my idea was, when adding native support on that.

Will make a change, build test it on fresh build dir and send a patch on meta-oe 
mailing list.

Apart from bad practice on xfce4-dev-tools: I wouldn't have expected trouble 
when a native recipe depends on an allarch one.

Andreas


