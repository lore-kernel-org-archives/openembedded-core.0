Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK9hv-0001tt-56 for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 15:44:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDfKEC019906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:41:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19339-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:41:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDfFob019900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:41:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTik-WKWNkvyLtvh-CEtD2e4qa8EcGQ@mail.gmail.com>
References: <BANLkTik-WKWNkvyLtvh-CEtD2e4qa8EcGQ@mail.gmail.com>
Date: Wed, 11 May 2011 14:41:10 +0100
Message-ID: <1305121270.30391.359.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How does openembedded-core-contrib/master relate to openembedded-core/master?
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
X-List-Received-Date: Wed, 11 May 2011 13:44:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 14:37 +0200, Leon Woestenberg wrote:
> how does the master branch of openembedded-core-contrib relate to the
> master branch of openembedded-core?
> 
> Is -core-contrib tracking -core 1-to-1?

I probably shouldn't have pushed that at all to be honest, its just
likely to get out of date quickly :/. I was fiddling with some
configuration, trying to allow easiest comparisons of trees in the
contrib repo and the creation of it was an artefact of that, sorry.

Certainly there would always need to be a 1:1 mapping. The current
server config won't actually allow me to delete the master branch either
as its the "current" branch of the repo and would be used in git clones.

> The reason I ask is that user contribution go into feature branches
> (name/feature) of -core-contrib, but should ideally be based against
> core itself, as RP pulls there, and we want clean pulls.
> 
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/
> http://git.openembedded.org/cgit.cgi/openembedded-core/log/
> 
> My first feature branch (likewise/gnuspe) was cloned from, branched,
> and pushes against openembedded-core-contrib, is that the correct
> approach?

The pull request you sent looked fine. This only works if that master
branch is kept in sync with the main repo though.

Cheers,

Richard



