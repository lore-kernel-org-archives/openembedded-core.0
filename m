Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7196084E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7E9dAFI003346; Thu, 14 Aug 2014 10:39:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gp_VbK1_506G; Thu, 14 Aug 2014 10:39:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7E9d74Z003341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 14 Aug 2014 10:39:08 +0100
Message-ID: <1408009147.22187.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2014 10:39:07 +0100
In-Reply-To: <20140814085432.GG14848@jama>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
	<20140814085432.GG14848@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] systemd: add libdw to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 09:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 10:54 +0200, Martin Jansa wrote:
> On Thu, Aug 14, 2014 at 04:46:01PM +0800, Chen Qi wrote:
> > Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/systemd/systemd_215.bb |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
> > index 770787b..a52a042 100644
> > --- a/meta/recipes-core/systemd/systemd_215.bb
> > +++ b/meta/recipes-core/systemd/systemd_215.bb
> > @@ -244,7 +244,7 @@ FILES_${PN} = " ${base_bindir}/* \
> >  FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> >  FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> >  
> > -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
> > +RDEPENDS_${PN} += "libdw kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
> 
> Shouldn't it be build-time dependency?
> 
> If it's detected from sysroot in do_configure then it has to be in
> DEPENDS to get deterministic results.

Right. Secondly, what benefit does this library bring us?

Cheers,

Richard


