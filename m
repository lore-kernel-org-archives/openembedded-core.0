Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYdAO-00031K-FL for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:38:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEDOAWG020090;
	Wed, 14 Nov 2012 13:24:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17794-09; Wed, 14 Nov 2012 13:24:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEDO1DD020084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 14 Nov 2012 13:24:02 GMT
Message-ID: <1352899442.13332.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Nov 2012 13:24:02 +0000
In-Reply-To: <20121114123026.GK3928@jama.jama.net>
References: <1352815159.24487.122.camel@ted>
	<20121114123026.GK3928@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Michael, openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Wed, 14 Nov 2012 13:38:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 13:30 +0100, Martin Jansa wrote:
> On Tue, Nov 13, 2012 at 01:59:19PM +0000, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> > new file mode 100644
> > index 0000000..f587c34
> > --- a/dev/null
> > +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> > @@ -0,0 +1,28 @@
> 
> Are you using some special tool to generate git patches or some weird
> git version?

Basically, the data from cgit in the web interface is broken and that is
causing this.

> Patches from you where you add some file usually does not apply here,
> It's caused by:
> --- a/dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> which usually looks like
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch

Right, there is a bug in cgit. I'm not sure if anyone fancies trying to
find/fix it?

Cheers,

Richard



