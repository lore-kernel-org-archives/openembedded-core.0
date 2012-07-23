Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StFjj-000853-UO
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:19:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:49183 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StFYg-0003sw-OK; Mon, 23 Jul 2012 06:08:10 -0400
Date: Mon, 23 Jul 2012 06:07:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1965034.biL4ROLyBP@helios>
Message-ID: <alpine.DEB.2.02.1207230606590.20207@oneiric>
References: <alpine.DEB.2.02.1207221512360.968@oneiric>
	<1965034.biL4ROLyBP@helios>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: any current standard on avoiding use of both "_append" and "+="?
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
X-List-Received-Date: Mon, 23 Jul 2012 10:19:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 23 Jul 2012, Paul Eggleton wrote:

> On Sunday 22 July 2012 15:12:51 Robert P. J. Day wrote:
> >   quick check shows this:
> >
> > recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I
> > ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> > recipes-sato/webkit/webkit-gtk_1.8.1.bb:EXTRA_OECONF_append_powerpc +=
> > "--with-unicode-backend=glib"
> > recipes-sato/webkit/webkit-gtk_1.8.1.bb:CPPFLAGS_append_powerpc +=
> > "-I${STAGING_INCDIR}/pango-1.0 \
> >
> >   was there going to be any effort to avoid combining "_append" with
> > "+=" in recipe files, simply for the sake of clarity?
>
> It's fine for these to be cleaned up as long as a leading space is added for
> the second and third (since += will be doing this at the moment).

  is this valid?

meta/classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"

does one not need the leading space in this context?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


