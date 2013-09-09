Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64B826BE96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 17:25:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSV00HCPCDG5UA1@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 09 Sep 2013 12:25:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4FB26200A9; Mon,
	09 Sep 2013 13:24:52 -0400 (EDT)
Date: Mon, 09 Sep 2013 13:24:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Message-id: <20130909172451.GG5834@denix.org>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
MIME-version: 1.0
In-reply-to: <ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 09 Sep 2013 17:25:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 09, 2013 at 04:57:40PM +0000, Kamble, Nitin A wrote:
> Hi Ross,
>   This is a clever way to deal with unnecessary rebuilding of mesa we were 
> seeing earlier. With this mesa-gl, the mesa also need modification to remove 
> gl from the default recipe.
> 
> Also looks like there is a need from community for mesa-gl-lib and 
> mesa-gl-headers, as some platforms need just the mesa-gl-headers and not the 
> libs.
> 
> Nitin

Ross, Nitin,

This is a great and very welcomed development! This would definitely allow our 
TI machines (and other ARM ones, as you said) to happily co-exist with Mesa 
software rendering.

-- 
Denys


> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Ross Burton
> > Sent: Monday, September 09, 2013 5:27 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
> > 
> > Some machines have hardware-specific GL drivers that do EGL and GLES
> > (many ARM boards).  Others have their own EGL/GLES drivers and provide a
> > Mesa DRI driver (EMGD).  Previously adding Mesa, for software GL/GLX
> > rendering in the first case and hardware GLX in the second, involved
> > bbappends and changing Mesa to be machine-specific.
> > 
> > By adding a just-GL Mesa the machine definition can combine it with the
> > hardware drivers cleanly.
> > 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb |    5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-
> > graphics/mesa/mesa-gl_9.1.6.bb
> > new file mode 100644
> > index 0000000..521a830
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
> > @@ -0,0 +1,5 @@
> > +require mesa_${PV}.bb
> > +
> > +FILESPATH = "${FILE_DIRNAME}/mesa-${PV}:${FILE_DIRNAME}/mesa"
> > +
> > +PACKAGECONFIG ??= "dri gl"
> > --
> > 1.7.10.4
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

