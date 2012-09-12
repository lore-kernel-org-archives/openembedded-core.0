Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnp6-0006ln-9w for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:21:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE8thA020323;
	Wed, 12 Sep 2012 15:08:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19904-06; Wed, 12 Sep 2012 15:08:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE8kLv020317
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:08:48 +0100
Message-ID: <1347458928.11710.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 12 Sep 2012 15:08:48 +0100
In-Reply-To: <504FF70B.7060701@mlbassoc.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<504FF70B.7060701@mlbassoc.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Wed, 12 Sep 2012 14:21:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 20:44 -0600, Gary Thomas wrote:
> On 2012-09-05 22:35, Khem Raj wrote:
> > svn tar balls are 96M as compared to 1.3G git tars
> > its unnessary to suck in that much of data.
> >
> > Fixes [YOCTO #2908]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> What about this patch?   Carrying around a 1.7GB (Sorry, Khem, that's the size of my tar ball!)
> is a bit much, especially when that's what I send to my customers...

I've been hoping to find some time to do something with the fetcher to
try and fix this corner we've ended up pinned into.

Ideally I'd like to see both gcc and eglibc using git, we have git in
ASSUME_PROVIDED and everything is optimal.

I'm not going to reach the release point without doing something about
this but I would like to stick with git if we can possibly help it.

Having to build subversion-native for critical path components is a
major pain and performance issue.

Cheers,

Richard



