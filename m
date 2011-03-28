Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4HVB-0005X9-CK
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 20:49:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2011 11:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,257,1299484800"; d="scan'208";a="620025676"
Received: from scimitar.isw.intel.com (HELO [10.237.224.30]) ([10.237.224.30])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2011 11:47:03 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2011 19:47:02 +0100
In-Reply-To: <1301327895.3018.200.camel@rex>
References: <cover.1301322225.git.josh@linux.intel.com>
	<7049c8b55628f8d6269cefe4a06f994cc60d49c2.1301322225.git.josh@linux.intel.com>
	<1301327895.3018.200.camel@rex>
X-Mailer: Evolution 2.91.92 (2.91.92-1.fc15) 
Message-ID: <1301338023.6397.17.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 2/4] clutter-gst: add 1.3.6 for use with clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 18:49:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-28 at 16:58 +0100, Richard Purdie wrote:
> On Mon, 2011-03-28 at 15:28 +0100, Joshua Lock wrote:
> > From: Joshua Lock <josh@linux.intel.com>
> > 
> > The inc file should be usable across clutter versions, plus this is already
> > set in the clutter-box2d-1.4_git.bb recipe
> > 
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
> > ---
> >  .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 ++++++++++++++++
> >  meta/recipes-graphics/clutter/clutter-gst.inc      |    3 ++-
> >  2 files changed, 18 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
> > 
> [...]
> > diff --git a/meta/recipes-graphics/clutter/clutter-gst.inc b/meta/recipes-graphics/clutter/clutter-gst.inc
> > index 614c62d..b1c8617 100644
> > --- a/meta/recipes-graphics/clutter/clutter-gst.inc
> > +++ b/meta/recipes-graphics/clutter/clutter-gst.inc
> > @@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer"
> >  HOMEPAGE = "http://www.clutter-project.org/"
> >  LICENSE = "LGPLv2+"
> >  
> > -DEPENDS = "clutter-1.4 gstreamer gst-plugins-base"
> > +DEPENDS = "gstreamer gst-plugins-base"
> >  
> >  FILESPATH = "${FILE_DIRNAME}/clutter-gst"
> >  
> > @@ -11,3 +11,4 @@ FILES_${PN}-examples = "${bindir}/video-player ${bindir}/video-sink"
> >  
> >  inherit autotools pkgconfig gtk-doc
> >  
> > +FILESPATH = "${FILE_DIRNAME}/clutter-gst"
> 
> Why is FILESPATH set twice to the same thing?

Whoops. Because I'm too trusting of patches which apply cleanly. Sorry. 
v2 patchset due shortly...

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



