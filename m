Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh2XM-0005Eq-5A
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:48:20 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:38914 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh2N0-0001NZ-0p; Tue, 19 Jun 2012 13:37:38 -0400
Date: Tue, 19 Jun 2012 13:37:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1911542.yM0phlYVn0@helios>
Message-ID: <alpine.DEB.2.02.1206191336450.1359@oneiric>
References: <alpine.DEB.2.02.1206191102130.565@oneiric>
	<1911542.yM0phlYVn0@helios>
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
Subject: Re: getting rid of SRC_URI_append uses with "+="
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
X-List-Received-Date: Tue, 19 Jun 2012 17:48:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 19 Jun 2012, Paul Eggleton wrote:

> On Tuesday 19 June 2012 11:04:06 Robert P. J. Day wrote:
> >   a while back, i pointed out odd instances of:
> >
> > meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=
> > "file://use-includedir.patch \
> > meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips += "
> > file://32bitBE-support.patch"
> > meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc += "
> > file://32bitBE-support.patch"
> > meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
> > file://owl-menu.patch;apply=yes "
> >
> > that is, the apparent redundancy of using "+=" with SRC_URI_append.
> > anyone want to clean those up, just for the sake of clarity?
>
> Sounds good to me, would you mind sending a patch to do this?

  one patch to cover all of the above, to oe-core?  ok, coming later
today.

rday


