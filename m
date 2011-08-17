Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QthaJ-0002ev-Ix for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:59:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEsZpH008080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:54:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07811-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:54:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEsO53008074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:54:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110816063227.GA19899@edwin-gen>
References: <cover.1313411858.git.edwin.zhai@intel.com>
	<edd51def7cc31eaa3d67f7cc73bf5fded2351f5f.1313411859.git.edwin.zhai@intel.com>
	<1313418349.14274.587.camel@rex>  <20110816063227.GA19899@edwin-gen>
Date: Wed, 17 Aug 2011 15:54:16 +0100
Message-ID: <1313592856.13995.49.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] qemu: Make qemu buildable inside qemux86/qemuppc target
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
X-List-Received-Date: Wed, 17 Aug 2011 14:59:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 14:32 +0800, Zhai, Edwin wrote:
> On Mon, Aug 15, 2011 at 10:25:49PM +0800, Richard Purdie wrote:
> > 
> > The patch is fine but could we change this to something like:
> > 
> > # Only use the GL passthrough patches for native/nativesdk versions
> > $QEMUGLPATCHES = "\
> >     file://qemu-git-qemugl-host.patch \
> >     file://fix-nogl.patch \
> >     file://qemugl-allow-glxcontext-release.patch \
> >     file://init-info.patch \
> >     file://enable-i386-linux-user.patch \
> >     file://qemugl-fix.patch \
> >     file://opengl-sdl-fix.patch \
> >     "
> > 
> > SRC_URI_append_virtclass-native = "\
> >     ${QEMUGLPATCHES} \
> >     "
> > 
> > SRC_URI_append_virtclass-nativesdk = "\
> >     ${QEMUGLPATCHES} \
> >     file://glflags.patch \
> >     "
> > 
> > which is just a little bit neater. Also, no need for the commented out
> > line.
> 
> RP,
> Thanks for your comments. I have modified it. Pls. pull @ same branch:
> 
> git://git.pokylinux.org/poky-contrib gzhai/master2
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> BTW, I saw qemugl_git.bb is extended as "nativesdk", and was curious about it as 
> qemugl is hacked libgl inside qemu guest, thus should not be related to "native" 
> case. Any reason? Meet the dependency requirement?

I've merged this, thanks.

We need the GL code in nativesdk since this ships as part of the SDK/ADT
toolchain and we want the GL pass through support there.

Cheers,

Richard



