Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SOxOG-0005lz-9e for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 22:40:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UKUUKv007016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 21:30:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06267-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 21:30:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UKULKi007009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 21:30:24 +0100
Message-ID: <1335817824.7415.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 21:30:24 +0100
In-Reply-To: <20120430185327.GF3664@jama.jama.net>
References: <1335782052.7415.1.camel@ted>
	<CAMKF1spqp12AKBB1FLESE+WbzFb4sBf=J18aDNhYKRbYZoQECQ@mail.gmail.com>
	<20120430185327.GF3664@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qt-4.8.1: Fix compile failures on qemux86
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
X-List-Received-Date: Mon, 30 Apr 2012 20:40:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 20:53 +0200, Martin Jansa wrote:
> On Mon, Apr 30, 2012 at 07:34:58AM -0700, Khem Raj wrote:
> > On Mon, Apr 30, 2012 at 3:34 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
> > > index b42ca01..8c38cae 100644
> > > --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
> > > +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> > > @@ -21,6 +21,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
> > >            file://g++.conf \
> > >            file://linux.conf \
> > >            file://gcc47-fix.patch \
> > > +           file://gcc47-fix2.patch \
> > >            file://disable-fuse-gold-flag.patch \
> > >            "
> > >
> > > diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> > > new file mode 100644
> > > index 0000000..09513b6
> > > --- a/dev/null
> > > +++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> > > @@ -0,0 +1,50 @@
> > > +Fixes for gcc 4.7.0, particularly on qemux86
> > > +
> > > +Origin: upstream, http://trac.webkit.org/changeset/93631
> > > +Origin: upstream, http://trac.webkit.org/changeset/113848
> > > +
> > > +Bug: https://bugs.webkit.org/show_bug.cgi?id=62168
> > > +Bug: https://bugs.webkit.org/show_bug.cgi?id=83584
> > > +
> > > +RP 2012/04/30
> > > +
> > > +Upstream-Status: Backport
> > > +
> > 
> > looks good. Are we able to build QT 4.8.x now
> 
> FWIW: with qemux86-64 and current gcc-4.7 I was able to build
> qt4-x11-free-4.8.1 even before this patch.

Right, but qemux86 failed. I'm not sure why the difference (different
error/warning flags?) but this patch does fix it.

Cheers,

Richard



