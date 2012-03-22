Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SArXR-0001sK-Ja for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 00:35:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MNQUxN021487
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:26:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21166-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:26:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MNQLF1021481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:26:22 GMT
Message-ID: <1332458784.9740.371.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 23:26:24 +0000
In-Reply-To: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 22 Mar 2012 23:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> Hey all,
> 
> Over in meta-ti I kicked off a discussion
> (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
> machine conf files.  This has been discussed a little bit before
> (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
>  The problem is we have the following and I believe ultimately
> conflicting use cases:

I've been under the impression that we decided upon:

> - The machine needs to say 'I need or support the following formats'

so the machine starts and sets:

IMAGE_FSTYPES = "xxxx"

> - The distro needs to say 'I always want format X'

so the distro can do:

IMAGE_FSTYPES += " yyy"

> - The user needs to say 'I know best, give me only format X'

So the user can do:

IMAGE_FSTYPES = "X"

> - The user needs to say 'I know best, give me what you support + X'

IMAGE_FSTYPES += " X"

> We achieve this today, but not very nicely.  For the last one you need
> to start playing order of operations games and that's just not nice.
> My suggestion is that we need to change what the machine.conf sets to
> another variable (SOMETHING_IMAGE_FSTYPES), and a default
> IMAGE_FSTYPES becomes ?= ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
> users can then work more easily with their use cases.  Comments?

I think this is overcomplicating things. Yes the order is important but
lets just document the above?

Cheers,

Richard





