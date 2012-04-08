Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SGztz-00054F-QR
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Apr 2012 23:44:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 53F37315AF5E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:34:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NJtmGJhhArMy
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:34:43 +0200 (CEST)
Received: from [192.168.2.108] (p5B119AD0.dip.t-dialin.net [91.17.154.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 10A79315AF5D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:34:43 +0200 (CEST)
Message-ID: <4F820472.1080109@opendreambox.org>
Date: Sun, 08 Apr 2012 23:34:42 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
In-Reply-To: <4F7F85DC.2000301@windriver.com>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Sun, 08 Apr 2012 21:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07.04.2012 02:10, Mark Hatle wrote:
> Just ran a local build with the qemumips machine, this is a standard
> mips32 target.
> 
> From the configure line for eglibc:
> 
> /msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/work/mips32-oe-linux/eglibc-2.13-r23+svnr15508/eglibc-2_13/libc/configure
> --build=x86_64-linux --host=mips-oe-linux --target=mips-oe-linux
> --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
> --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
> --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib
> --includedir=/usr/include --oldincludedir=/usr/include
> --infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules
> --disable-dependency-tracking
> --with-libtool-sysroot=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips
> --enable-kernel=2.6.16 --without-cvs --disable-profile --disable-debug
> --without-gd --enable-clocale=gnu
> --enable-add-ons=ports,nptl,libidn,ports
> --with-headers=/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sysroots/qemumips/usr/include
> --without-selinux
> 
> The system is correctly setting the target to "mips-oe-linux".
> 
> I checked and bash is the same way.
> 
> So the canonical arch is correct, the mips32 is only the packaging
> arch.  It was always intended that the packaging arch be used in full on
> MIPS.  (This will allow us to specify mips32r2, mipsiii, mipsiv, etc as
> necessary if we expand the mips tunings.)

I don't think such a change should be done only few days before a
release. Until this patch was applied, the packaging arch has always
been mipsel, not mips32el. Please, revert or fix this!

> So right now, I don't see any failure conditions with an oe-core build. 
> (This is oe-core as of earlier today.)
> 
> --Mark


