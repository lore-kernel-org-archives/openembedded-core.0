Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TYjRj-0003b9-Nx
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 21:20:27 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TYjEH-003tb7-Vh>; Wed, 14 Nov 2012 21:06:34 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TYjEH-003JjO-U8>; Wed, 14 Nov 2012 21:06:33 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TYjEG-0001aT-QP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 21:06:32 +0100
Date: Wed, 14 Nov 2012 21:06:32 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20121114200632.GC3622@mi.fu-berlin.de>
References: <50A3DDD7.9080205@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50A3DDD7.9080205@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: Can't build qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 20:20:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 14, 2012 at 11:07:19AM -0700, Gary Thomas wrote:
> | /local/qemuarm_test/tmp/sysroots/i686-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: cannot find -lGLU
> 

Hi,

did you check if qt actually needs any glu symbols?

Bye Henning


