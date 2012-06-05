Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Sbvpw-00078d-AM
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 17:38:24 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Sbvfr-0000no-Ry>; Tue, 05 Jun 2012 17:28:00 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Sbvfr-00080M-Ge>; Tue, 05 Jun 2012 17:27:59 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1Sbvfq-0006Ik-Dr
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 17:27:58 +0200
Date: Tue, 5 Jun 2012 17:27:58 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120605152758.GA23537@mi.fu-berlin.de>
References: <4FBF9C60.5030000@supergenesis.it>
	<20120525151124.GA31846@mail.familie-heinold.de>
	<4FBFA389.3040201@supergenesis.it>
	<4FCDE263.4050709@supergenesis.it>
MIME-Version: 1.0
In-Reply-To: <4FCDE263.4050709@supergenesis.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Tue, 05 Jun 2012 15:38:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 05, 2012 at 12:41:39PM +0200, Stefano wrote:
> Problem #2
> QLibraryPrivate::loadPlugin failed on
> "/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so" : "Cannot load
> library /usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so:
> (/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined
> symbol: _ZNK16QWSWindowSurface12directRegionEv)"
> "Cannot load library
> /usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so:
> (/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined
> symbol: _ZNK16QWSWindowSurface12directRegionEv)"  could not load
> 
> Anybody have some info to solve the problem?
> Thank's

Hm looks like libqgfxpvregl.so needs more some so-libs depends, find out in which lib the Symbol is e.g. objdump or readelf and
tweak the linker line for libqgfxpvregl.

Bye Henning


