Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBmKv-0000Y4-Dm for Openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 14:18:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22D9s2T029605; Sat, 2 Mar 2013 13:09:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9AKuH7Vn1URk; Sat,  2 Mar 2013 13:09:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22D9jEh029600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 2 Mar 2013 13:09:48 GMT
Message-ID: <1362229323.11004.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 02 Mar 2013 13:02:03 +0000
In-Reply-To: <CAHUNapTj+8e8fzeHt=NVQ2j5SFCZze7oVM9FqG4dRvuhB5hNDw@mail.gmail.com>
References: <1362147965-42559-1-git-send-email-jason.wessel@windriver.com>
	<CAHUNapTj+8e8fzeHt=NVQ2j5SFCZze7oVM9FqG4dRvuhB5hNDw@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: about the oe-core layer <Openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH] qemu.inc: Non deterministic compile of qemu
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
X-List-Received-Date: Sat, 02 Mar 2013 13:18:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-01 at 11:05 -0500, Trevor Woerner wrote:
> On Fri, Mar 1, 2013 at 9:26 AM, Jason Wessel <jason.wessel@windriver.com> wrote:
> > When you using a qemuppc target and sstate you might end up with
> > the problem:
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 6c44b31..eb60d43 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -2,8 +2,8 @@ DESCRIPTION = "open source processor emulator"
> >  HOMEPAGE = "http://qemu.org"
> >  LICENSE = "GPLv2 & LGPLv2.1"
> >  DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
> > -DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native"
> > -DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman"
> > +DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
> > +DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
> >  RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
> 
> Is there a way to instrument this in such a way that these depends are
> included only when the target machine is qemuppc? Some sort of
> @machine_depends or something?

You could do that but it would mean you'd have a -native recipe
rebuilding when changing machine. I'd not recommend it.

Cheers,

Richard



