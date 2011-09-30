Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9cwY-0000fM-Ct for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:15:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UDGrkB019996 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:16:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zFQCPndtCn08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:16:53 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UDGj00019985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:16:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 14:10:19 +0100
In-Reply-To: <20110930114932.GD15856@jama.jama.net>
References: <1317382380.12332.171.camel@ted>
	<20110930114932.GD15856@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317388226.12332.192.camel@ted>
Mime-Version: 1.0
Subject: Re: Slight change to merging procedure - master-next
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
X-List-Received-Date: Fri, 30 Sep 2011 13:15:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 13:49 +0200, Martin Jansa wrote:
> On Fri, Sep 30, 2011 at 12:32:54PM +0100, Richard Purdie wrote:
> > One of the issues I've been having is that I read through patches once
> > doing review and then have to wait ~24 hours before merging any patches
> > I think are acceptable in case others have comments. This means I have
> > to go through emails twice and its a bit of a pain.
> > 
> > I'm therefore going to start maintaining master-next with patches I
> > think are ready. They'll sit there for 24 hours before being merged if
> > there aren't other issues raised by anyone else.
> > 
> > I could just do this in private but I'm choosing to make it public. I
> > want to be clear that branch can rebase and change, its not definite
> > until it hits master. I hope some people find it useful.
> 
> I do find it useful, thanks for that.
> 
> /me already rebasing remaining changes from xorg patchset on top of
> master-next ;)
> 
> BTW: is there any plan to give some information when something is
> dropped from master-next? Like: "dropping this from master-next, because
> of feedback from Joe, please send updated patch"

There would be feedback on the mailing list to a patch indicating it
needed something tweaking.

e.g. your comment on the curl update. That one isn't going in until I
get to the bottom of the checksum issue. 

Cheers,

Richard



