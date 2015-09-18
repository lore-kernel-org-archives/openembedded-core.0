Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4025577028
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:49:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 06:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; d="scan'208";a="647534973"
Received: from thomasda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.18])
	by orsmga003.jf.intel.com with ESMTP; 18 Sep 2015 06:49:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:49:26 +0100
Message-ID: <3626879.9vZPovGyJa@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1442583133.26666.253.camel@linuxfoundation.org>
References: <1442577093-6511-1-git-send-email-dv@pseudoterminal.org>
	<1442583133.26666.253.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH] gdk-pixbuf: remove redundant libx11 DEPENDS line
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 13:49:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Richard,

On Friday 18 September 2015 14:32:13 Richard Purdie wrote:
> On Fri, 2015-09-18 at 13:51 +0200, Carlos Rafael Giani wrote:
> > The x11 packageconfig already takes care of the X11 dependency, and also
> > respects the DISTRO_FEATURES
> > 
> > Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> > ---
> > 
> >  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb index
> > 07c2dce..bdf173a 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \> 
> >  SECTION = "libs"
> >  
> >  DEPENDS = "glib-2.0"
> > 
> > -DEPENDS_append_linuxstdbase = " virtual/libx11"
> 
> Do we not need something like:
> 
> PACKAGECONFIG_append_linuxstdbase = "x11"
> 
> to ensure that this is enabled for LSB?

The recipe already does something like this further down.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

