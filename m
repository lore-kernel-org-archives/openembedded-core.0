Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHsIK-0001lc-JJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:44:16 +0200
Received: by pwj9 with SMTP id 9so886132pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5+RgerI3u6IRxphzjaJ1wr3R4bgHoSOKVhx+yi/vAy4=;
	b=C3cNFXSEs0DnxpjG0V4GCO4E748s2/k/CxhmFQGgr8eDYRf/yEWpdyV0omFaTpaTzj
	GJ4nn3APRq5mjzBjs5yaKFGavt4IhZKNj4/BhPNEunL0xgJjo2X4nVHB7CDtr5diq179
	NEpUafJUdnorLdC2LI5ffjsvuuRW2OWsqEBsU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wbyRu7KzhYgbAaVkZJh9DNh6PZg1Bx8GXFvmcobrpZUoez/yilNnsVRk2vaKjDf4Fd
	1gbWXkkwhfSm0tEqO77ItQ9le4oPlcZN55dJZpnRQ4wJwfdK8Pb6FnUhDppvDwSP4RM3
	Sz59BzZXvBpL5PETbYarmo2Dzbkx9qA9Ox/+Y=
Received: by 10.68.9.132 with SMTP id z4mr2680638pba.282.1304577693392;
	Wed, 04 May 2011 23:41:33 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g3sm735763pbj.70.2011.05.04.23.41.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 23:41:32 -0700 (PDT)
Date: Wed, 4 May 2011 23:40:58 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110505064058.GC10374@sakrah.homelinux.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
	<4DBF4F26.90404@intel.com>
	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
	<4DC03C43.8080507@windriver.com> <4DC04CCA.2030100@intel.com>
	<BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>
	<4DC1F20A.4000906@intel.com>
	<BANLkTimpqOp2+AjNJFqsyA4JVfJmbuToSw@mail.gmail.com>
	<4DC24434.6000209@intel.com>
MIME-Version: 1.0
In-Reply-To: <4DC24434.6000209@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Thu, 05 May 2011 06:44:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/05/11 14:31), Zhai, Edwin wrote:
> 
> 
> Khem Raj wrote:
> >
> >On Wed, May 4, 2011 at 5:40 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
> >> Raj,
> >> We have a bug for Nvidia driver @
> >> http://bugzilla.pokylinux.org/show_bug.cgi?id=649
> >> and a fix @
> >> http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa <http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=gzhai/fix2&id=f596757000465a4b8350e16f21553a23b8bbedfa>
> >
> >>
> >> I think it deserves a try.
> >>
> >> BTW, where is your gl library, including original one and
> >Nvidia's? I doubt
> >> the layout may changes in ubuntu 11.04, so that our code failed
> >to detect
> >> it.
> >
> >yes this helps indeed. Please propose this patch for oe-core's
> >scripts/runqemu-internal
> >
> 
> After discussion, we found this patch only works for Ubuntu(Fedora
> installed Nvidia driver in different way), and there is no elegant
> fix for all distribution. So we decided that just give out useful
> info and let end user to do the right thing for their own
> distribution.

We could always poke for distro type and distro versions if need be via
parsing ( /etc/lsb-release e.g.)
and do whatever distro needs in conditionals.

> 
> >Thanks
> >-Khem
> >
> >_______________________________________________
> >Openembedded-core mailing list
> >Openembedded-core@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


