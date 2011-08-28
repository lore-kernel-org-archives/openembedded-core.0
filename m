Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QxnO1-0002EK-Vi; Sun, 28 Aug 2011 23:59:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7SLsYFi025590;
	Sun, 28 Aug 2011 22:54:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22015-01; Sun, 28 Aug 2011 22:54:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7SLsPje025584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 28 Aug 2011 22:54:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
References: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
	<CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
Date: Sun, 28 Aug 2011 22:54:18 +0100
Message-ID: <1314568458.5939.271.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Kridner, Jason" <jdk@ti.com>, openembedded-devel@lists.openembedded.org,
	"Kooi, Koen" <k-kooi@ti.com>
Subject: Re: How do we get programs into sysroots?
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
X-List-Received-Date: Sun, 28 Aug 2011 21:59:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-28 at 13:45 -0700, Chris Larson wrote:
> On Sun, Aug 28, 2011 at 1:07 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> > DESCRIPTION = "A tool to format SD Cards correctly"
> > LICENSE = "GPLv2"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> > SECTION = "base"
> > SRC_URI = "file://mkcard.txt \
> >           file://COPYING.patch"
> > PR = "r3"
> >
> > do_configure() {
> >        install -m 0644 ${WORKDIR}/mkcard.txt ${S}/
> > }
> >
> > do_install() {
> >        install -d ${D}${base_sbindir}
> >        install -m 0755 ${S}/mkcard.txt ${D}${base_sbindir}/mkcard
> > }
> >
> > BBCLASSEXTEND = "native"
> > ---
> >
> > Everything works fine, but I don't see 'mkcard' in /sbin in sysroots
> > directory. I'd like to install it there. I tried looking at other
> > scripts to see the right way to do it but I'm not sure of a clean way
> > to do so. I looked at the staging.bbclass and it seems to only pickup
> > libs and headers.
> 
> When using a custom do_install, with BBCLASSEXTEND, afaik you need to
> set NATIVE_INSTALL_WORKS = "1" to get its files into the sysroot for
> the native version.

For OE-dev you do but this shouldn't be necessary any more with OE-Core
since there is no legacy staging.

In this case I wonder if the -native version or the target version is
being run? We only install libs and headers for the target version but
the binaries should be present for the -native recipe and be installed
to the native sysroot...

Cheers,

Richard




