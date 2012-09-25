Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGdPl-0005hr-6f
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:15:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGdDN-0005pi-FG; Wed, 26 Sep 2012 00:02:49 +0200
Message-ID: <1348610431.1335.11.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Colin Walters <walters@verbum.org>
Date: Tue, 25 Sep 2012 23:00:31 +0100
In-Reply-To: <1348610357.2853.5.camel@lenny>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Tue, 25 Sep 2012 22:15:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 17:59 -0400, Colin Walters wrote:
> On Tue, 2012-09-25 at 13:54 +0100, Phil Blundell wrote:
> > Fixes the QA warnings:
> > 
> > WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libblkid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libblkid-dev/lib/libblkid.a'
> > WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libuuid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libuuid-dev/lib/libuuid.a'
> 
> > -FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.a ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> > +FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> 
> Wouldn't EXTRA_OECONF += " --disable-static" be better?

That'd be inconsistent with other packages, since we do generally build
and ship the static libraries.  Having a big switch to turn off static
libraries globally seems like a fine plan, but I can't see any obvious
reason why the util-linux ones are any more useless than the rest.

p.




