Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLWCq-0002d4-Sp for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:29:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28Nob9012638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:23:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11972-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 08:23:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA28NfrF012632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 08:23:42 GMT
Message-ID: <1320222221.20107.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2011 08:23:41 +0000
In-Reply-To: <4EB0DF26.1000200@bluegiga.com>
References: <cover.1320183757.git.sgw@linux.intel.com>
	<453f61fd0043629181379d5d3766c118bdd46dd2.1320183757.git.sgw@linux.intel.com>
	<4EB0DF26.1000200@bluegiga.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Pull v2 2/4] xserver-nodm-init: Add xuser (hardcoded)
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
X-List-Received-Date: Wed, 02 Nov 2011 08:29:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-02 at 08:11 +0200, Lauri Hintsala wrote:
> Hi Saul,
> 
> On 11/01/2011 11:44 PM, Saul Wold wrote:
> > Signed-off-by: Saul Wold<sgw@linux.intel.com>
> > ---
> >   .../x11-common/xserver-nodm-init.bb                |   30 +++++++------------
> >   1 files changed, 11 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> > index ea4222d..5b06bc6 100644
> > --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> > +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> > @@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
> >   LICENSE = "GPLv2"
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> >   SECTION = "x11"
> > -PR = "r26"
> > +PR = "r28"
> >   RDEPENDS_${PN} = "sudo"
> >
> >   SRC_URI = "file://xserver-nodm \
> > @@ -19,27 +19,19 @@ do_install() {
> >       install xserver-nodm ${D}/etc/init.d
> >       if [ "${ROOTLESS_X}" = "1" ] ; then
> >           install -d ${D}/etc/X11
> > -        install Xusername ${D}/etc/X11
> > +	install Xusername ${D}/etc/X11
> 
> Is this indentation change a typo?

Saul fixed this in the v3 which I've taken.

Cheers,

Richard



