Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTdYw-00065X-RQ for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:58:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOHpfnZ027820;
	Thu, 24 Nov 2011 17:51:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27510-02; Thu, 24 Nov 2011 17:51:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOHpYwr027814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2011 17:51:35 GMT
Message-ID: <1322157100.10928.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 17:51:40 +0000
In-Reply-To: <20111124173621.GB28572@sakrah.homelinux.org>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
	<CAKZ=5EV8Qwh0gzmW6mS+hZB7HpEgDWuscO7_mhDEVsCffWmP2A@mail.gmail.com>
	<20111124173621.GB28572@sakrah.homelinux.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: B29882@freescale.com, Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 17:58:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 09:36 -0800, Khem Raj wrote:
> On (24/11/11 12:44), Julian Pidancet wrote:
> > >> +def get_gcc_multiarch_setting(bb, d):
> > >> +    if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
> > >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'i586', 'i686' ] :
> > >> +            return "--enable-targets=all"
> > >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'powerpc' ] :
> > >> +            return "--enable-targets=powerpc64"
> > >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sparc' ] :
> > >> +            return "--enable-targets=all"
> > >> +    return ""
> 
> looking at above function can this be made into a single if statement
> instead of 3

Julian: Could you update this to use the syntax d.getVar instead of
bb.data.getVar(..., d) please? We recently did a fairly big cleanup of
these and I'd rather not see it creep back in! We also prefer "True"
instead of "1" although we've not done a big cleanup on that yet (its
planned).

As Khem mentioned, we can probably get this down to a couple of getVar
calls instead of the above too!

Cheers,

Richard





