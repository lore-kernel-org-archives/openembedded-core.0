Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZmWe-0000Iv-G2 for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:17:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UH7Iow023694;
	Wed, 30 May 2012 18:07:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23393-04; Wed, 30 May 2012 18:07:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UH79cU023688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 18:07:10 +0100
Message-ID: <1338397629.20169.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 30 May 2012 18:07:09 +0100
In-Reply-To: <lyehq1zk13.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1338391023-31189-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1338392680.20169.148.camel@ted>
	<lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1338396454.20169.163.camel@ted>
	<lyehq1zk13.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtasn: fixed cross build issue
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
X-List-Received-Date: Wed, 30 May 2012 17:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 18:54 +0200, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> setting HELP2MAN environment to 'true' for cross-builds might be a
> >> general solution.... But this does not seem to be implemented...
> >
> > Right, I remember looking into this and its hard to disable. I've pushed
> > a PATH change to address this problem...
> 
> But this makes 'help2man' completely unavailable which might break
> man-page generation for -native (where 'help2man' works) or for every
> package which requires a working 'help2man' tool.

help2man is *totally* useless in any cross situation. We also don't
need/want man-pages for native tools so I can't see a case where this is
a problem...

Cheers,

Richard







