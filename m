Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TEzrX-0004He-2n for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 11:49:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9alvR017816;
	Fri, 21 Sep 2012 10:36:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11861-06; Fri, 21 Sep 2012 10:36:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9ac1Y017810
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 10:36:39 +0100
Message-ID: <1348220197.10108.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 21 Sep 2012 10:36:37 +0100
In-Reply-To: <lya9wkr2qj.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1347964372.13596.110.camel@ted>
	<lya9wkr2qj.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Richard Purdie
	<public-richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf/gcc: Add clean masks for stamp files
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
X-List-Received-Date: Fri, 21 Sep 2012 09:49:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 20:03 +0200, Enrico Scholz wrote:
> 
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > +STAMPCLEAN = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-*-*"
> 
> Is it intended that this pattern can match unrelated packages? E.g. for
> PN='gcc-cross', the mask will apply to stampfiles for 'gcc-cross-initial'
> too.

No, this is a problem :(

I saw this last night and have been giving it some thought. We might
have to put a separator into the stamp file format to make this easier
to deal with. The downside is that is a TMPDIR layout change :/.

The thing is the bug this solves is serious even if people only rarely
hit it and I can't think of a better solution...

Cheers,

Richard



