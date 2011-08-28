Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1Qxli8-0000Tg-FH; Sun, 28 Aug 2011 22:12:04 +0200
Received: by eyb7 with SMTP id 7so3485448eyb.18
	for <multiple recipients>; Sun, 28 Aug 2011 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=FOAUrM4LmHhKXdycX3bdjGv/D09YyKjLpu1OwefObzk=;
	b=i4SsJJ2+gP0suahb2eBu3FMF8y87U+yQVt8f08SmrXObP5ozemruaUq0oUmtIQfBn9
	Cug9yMY2TYIN7wgOiacNKCAxincJj/CNvFKbvIjDCW8m2F96VUYqBu9miHONu5DuFzXD
	IR9mKUz04TXWhUlJdEyAEcb5pCo7wmyUJkrao=
MIME-Version: 1.0
Received: by 10.213.26.17 with SMTP id b17mr1150804ebc.2.1314562033083; Sun,
	28 Aug 2011 13:07:13 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Sun, 28 Aug 2011 13:07:13 -0700 (PDT)
Date: Sun, 28 Aug 2011 15:07:13 -0500
Message-ID: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: How do we get programs into sysroots?
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
X-List-Received-Date: Sun, 28 Aug 2011 20:12:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have added a recipe for mkcard script to oe-core/meta/meta-devtools
as follows:

DESCRIPTION = "A tool to format SD Cards correctly"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
SECTION = "base"
SRC_URI = "file://mkcard.txt \
           file://COPYING.patch"
PR = "r3"

do_configure() {
        install -m 0644 ${WORKDIR}/mkcard.txt ${S}/
}

do_install() {
        install -d ${D}${base_sbindir}
        install -m 0755 ${S}/mkcard.txt ${D}${base_sbindir}/mkcard
}

BBCLASSEXTEND = "native"
---

Everything works fine, but I don't see 'mkcard' in /sbin in sysroots
directory. I'd like to install it there. I tried looking at other
scripts to see the right way to do it but I'm not sure of a clean way
to do so. I looked at the staging.bbclass and it seems to only pickup
libs and headers.

Appreciate any help or pointers to posts/documentation

Thanks,
Joel


