Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFMXu-000477-8P for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 10:58:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9G8x8an018427 for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2011 09:59:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1v9Js4chQWtx
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2011 09:59:08 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9G8x2wd018423
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2011 09:59:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 16 Oct 2011 09:52:17 +0100
In-Reply-To: <1318688875.3158.5.camel@lenovo.internal.reciva.com>
References: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
	<1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
	<1318688875.3158.5.camel@lenovo.internal.reciva.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318755146.2342.80.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] mesa-common: install internal GL headers to libgl-dev
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
X-List-Received-Date: Sun, 16 Oct 2011 08:58:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-15 at 15:27 +0100, Phil Blundell wrote:
> On Sat, 2011-10-15 at 11:54 +0200, Martin Jansa wrote:
> >  FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
> >  FILES_libegl-dbg += "${libdir}/egl/.debug/*"
> > +
> > +do_install_append () {
> > +    install -d ${D}/${includedir}/GL
> > +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> > +}
> 
> Why is this needed?  If the internal headers are meant to be installed,
> why doesn't "make install" do that?  Or, conversely, if they aren't
> intended to be installed, why do we want them there?
> 
> Please add some commentary to the checkin message explaining the
> rationale for the patch.

Ideally we should write a patch fixing the Makefile so dri-swrast
installs the pieces the xserver needs to build. Does it need both
sarea.h and dri_interface.h or just the latter?

FWIW the dri-i9* drivers install the dri header but not sarea.h.

Cheers,

Richard



