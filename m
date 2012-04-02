Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SEg3b-0002eD-PD for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 14:08:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q32BxELi008222;
	Mon, 2 Apr 2012 12:59:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03987-09; Mon,  2 Apr 2012 12:59:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q32Bx2EK008216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Apr 2012 12:59:05 +0100
Message-ID: <1333367943.647.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 02 Apr 2012 12:59:03 +0100
In-Reply-To: <1536285.gssKeMVGyU@helios>
References: <1333202821.18082.225.camel@ted>
	<1333212913.18082.247.camel@ted> <1333338343.647.8.camel@ted>
	<1536285.gssKeMVGyU@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, Steve Sakoman <steve@sakoman.com>
Subject: Re: Re-execution of tasks - test report and results
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
X-List-Received-Date: Mon, 02 Apr 2012 12:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-02 at 10:02 +0100, Paul Eggleton wrote:
> On Monday 02 April 2012 04:45:43 Richard Purdie wrote:
> > diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> > b/meta/recipes-core/gettext/gettext_0.18.1.1.bb index 4144d2b..0ed5dd9
> > 100644
> > --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> > +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > 
> >  PR = "r10"
> >  DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
> > -DEPENDS_virtclass-native = "libxml2-native"
> > +DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
> >  PROVIDES = "virtual/libintl virtual/gettext"
> >  PROVIDES_virtclass-native = "virtual/gettext-native"
> >  CONFLICTS_${PN} = "proxy-libintl"
> > @@ -95,4 +95,8 @@ do_install_append() {
> >      rm -f ${D}${libdir}/preloadable_libintl.so
> >  }
> > 
> > +do_install_append_virtclass-native () {
> > +	rm ${D}${datadir}/aclocal/*
> > +}
> > +
> >  BBCLASSEXTEND = "native nativesdk"
> > 
> > although I'm travelling at the moment and have not tested this yet.
> 
> I've tested this just now and it does fix the problem. The only thing missing 
> is a PR bump.

Thanks for testing. I've gone ahead and merged this into master with a
PR bump added for both gettext and gettext-minimal-native to ensure
sysroots are corrected.

Cheers,

Richard



