Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6179c86e6bacedbbfc5b180ab773bd1a7d7acca3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/24] xserver-xorg: convert from autotools to meson
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 15 Nov 2021 09:30:58 +0000
In-Reply-To: <7a0ff4e8-554a-e6c8-f7cd-ab8d08fa5186@pr.hu>
References: <20211110193937.2606747-1-alex@linutronix.de>
	 <20211110193937.2606747-5-alex@linutronix.de>
	 <7a0ff4e8-554a-e6c8-f7cd-ab8d08fa5186@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: zboszor@pr.hu, Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

On Mon, 2021-11-15 at 07:15 +0100, Zoltan Boszormenyi via lists.openembedded.org
wrote:
> 2021. 11. 10. 20:39 keltezéssel, Alexander Kanavin írta:
> > 
> >   # Xorg requires a SHA1 implementation, pick one
> >   XORG_CRYPTO ??= "openssl"
> > -PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
> > -PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
> > -PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
> > +PACKAGECONFIG[openssl] = "-Dsha1=libcrypto,,openssl"
> > +PACKAGECONFIG[nettle] = "-Dsha1=libnettle,,nettle"
> > +PACKAGECONFIG[gcrypt] = "-Dsha1=libgcrypt,,libgcrypt"
> >   
> >   do_install:append () {
> >   	# Its assumed base-files creates this for us
> > -	rmdir ${D}${localstatedir}/log/
> 
> The comment is related to the presence of /var/log and
> now it doesn't make sense after removing the above line.
> Please remove the comment, too.
> 
> >           sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,' ${D}${mandir}/man5/xorg.conf.5
> >   }
> >   

It is gone:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=657f71e1f5cf8a9f385b1748d99cb6d531511626

Cheers,

Richard


