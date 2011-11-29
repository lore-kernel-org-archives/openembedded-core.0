Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVNCA-0001xu-Se for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:53:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATClKFj012997
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:47:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12473-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:47:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATClBWw012991
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:47:12 GMT
Message-ID: <1322570839.3166.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 12:47:19 +0000
In-Reply-To: <20111129083851.GD7441@jama.jama.net>
References: <1b0811e1547c7b7e81372248e233867a7df2e2e4.1322554983.git.sgw@linux.intel.com>
	<1322555768-9095-1-git-send-email-Martin.Jansa@gmail.com>
	<20111129083851.GD7441@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] mesa-common: allow empty PN
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
X-List-Received-Date: Tue, 29 Nov 2011 12:53:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 09:38 +0100, Martin Jansa wrote:
> On Tue, Nov 29, 2011 at 09:36:08AM +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-common.inc |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> > index 7d729b4..df035e6 100644
> > --- a/meta/recipes-graphics/mesa/mesa-common.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> > @@ -38,6 +38,9 @@ EXTRA_OECONF = "--enable-glu \
> >  # Multiple virtual/gl providers being built breaks staging
> >  EXCLUDE_FROM_WORLD = "1"
> >  
> > +# ie mesa-dri could be empty and mesa-dri-dev RDEPENDS on it
> > +ALLOW_EMPTY_${PN} = "1"
> > +
> >  PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
> >  FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> >  FILES_libgl = "${libdir}/libGL.so.*"
> > -- 
> > 1.7.8.rc4
> > 
> 
> This is needed because
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012580.html

I've taken this, thanks.

Richard



