Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id CC7CF6FEA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:29:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD00F3QFLFG010@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 15:29:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3706020357; Tue,
	23 Sep 2014 16:29:38 -0400 (EDT)
Date: Tue, 23 Sep 2014 16:29:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20140923202938.GE2480@denix.org>
References: <1411500714-17508-1-git-send-email-denis@denix.org>
	<CAJTo0LZLxJtaimXR4rU85=5VOxQVk7+59+2Le4-r6bvZekgdpQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LZLxJtaimXR4rU85=5VOxQVk7+59+2Le4-r6bvZekgdpQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libinput: add 0.6.0 version
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
X-List-Received-Date: Tue, 23 Sep 2014 20:29:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 23, 2014 at 09:27:19PM +0100, Burton, Ross wrote:
> I didn't see a 3/3 for this series on the list.  It's also too late
> for 1.7, so I'll queue this in my staging branch for 1.8.

This is fine to wait until 1.8 opens. Not sure where 3/3 got stuck - sometimes 
my emails to the list got delayed for few hours...

-- 
Denys


> On 23 September 2014 20:31, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > libinput is an optional dependency for Weston to handle input devices
> > externally, which provides better support especially for touch devices.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-graphics/wayland/libinput_0.6.0.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta/recipes-graphics/wayland/libinput_0.6.0.bb
> >
> > diff --git a/meta/recipes-graphics/wayland/libinput_0.6.0.bb b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
> > new file mode 100644
> > index 0000000..c3bbb7b
> > --- /dev/null
> > +++ b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "Library to handle input devices in Wayland compositors"
> > +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
> > +SECTION = "libs"
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
> > +
> > +DEPENDS = "libevdev udev mtdev"
> > +
> > +SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> > +SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
> > +SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
> > +
> > +inherit autotools pkgconfig
> > --
> > 2.0.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

