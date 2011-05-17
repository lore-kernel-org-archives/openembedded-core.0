Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMO1p-0001jr-S1 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:25:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HHMpKY018976;
	Tue, 17 May 2011 18:22:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18527-09; Tue, 17 May 2011 18:22:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HHMkNw018970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 18:22:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BANLkTikgu6bKT603XFgpvK2b0ikroOTZhQ@mail.gmail.com>
References: <1305630665.3424.227.camel@rex>
	<BANLkTikgu6bKT603XFgpvK2b0ikroOTZhQ@mail.gmail.com>
Date: Tue, 17 May 2011 18:22:45 +0100
Message-ID: <1305652965.3424.268.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Tom King <ka6sox@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core repo broken again
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
X-List-Received-Date: Tue, 17 May 2011 17:25:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 09:56 -0700, Khem Raj wrote:
> On Tue, May 17, 2011 at 4:11 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Hi Guys,
> >
> > Something is broken with the oe-core repository as I can't push to it:
> >
> > $ git push origin master:master
> > Counting objects: 9, done.
> > Delta compression using up to 2 threads.
> > Compressing objects: 100% (5/5), done.
> > Writing objects: 100% (5/5), 628 bytes, done.
> > Total 5 (delta 4), reused 0 (delta 0)
> > remote: sed: can't read ./description: No such file or directory
> > remote: *** Project description file hasn't been set
> > remote: error: hook declined to update refs/heads/master
> > To ssh://git@git.openembedded.org/openembedded-core
> >  ! [remote rejected] master -> master (hook declined)
> > error: failed to push some refs to 'ssh://git@git.openembedded.org/openembedded-core'
> >
> >
> 
> its the same error I fixed last time. Somehow the description files in
> repo got lost after melo rebooted. I have put them back
> can you try and confirm if it works now ?

I've confirmed its working again, thanks. I'm hoping this doesn't happen
again...

Richard



