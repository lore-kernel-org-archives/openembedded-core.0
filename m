Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QV5Dj-0000pi-Df for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 19:10:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5AH6lvj029147
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 18:06:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28912-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 18:06:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5AH6gxp029141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 18:06:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <846A0A7E-6D7C-4A13-BC4F-C10562777AC2@dominion.thruhere.net>
References: <1307714956.25285.14.camel@phil-desktop>
	<846A0A7E-6D7C-4A13-BC4F-C10562777AC2@dominion.thruhere.net>
Date: Fri, 10 Jun 2011 18:06:29 +0100
Message-ID: <1307725590.15712.225.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake -b busted
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
X-List-Received-Date: Fri, 10 Jun 2011 17:10:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-10 at 16:17 +0200, Koen Kooi wrote:
> Op 10 jun 2011, om 16:09 heeft Phil Blundell het volgende geschreven:
> 
> > Since updating this morning, it seems that oe-core master now requires
> > bitbake 1.13.1 to be installed.  (I don't recall any discussion of that
> > change or the reasons for it, but no doubt they are good ones.)
> > 
> > I couldn't find a 1.13.1 tag (or in fact any tags after 1.12.0) in the
> > bitbake repository so I pulled the head of master.  Judging from the
> > contents of the log this is pretty close to 1.13.1 if not identical.
> > 
> > Unfortunately, this update seems to have broken "bitbake -b <file>"
> > altogether.  Any such command now seems to give me:
> > 
> > ERROR: Command execution failed: Traceback (most recent call last):
> >  File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
> >    commandmethod(self.cmds_async, self, options)
> >  File "/home/pb/oe/bitbake/lib/bb/command.py", line 190, in buildFile
> >    command.cooker.buildFile(bfile, task)
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 774, in buildFile
> >    fn = self.matchFile(fn)
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 752, in matchFile
> >    matches = self.matchFiles(buildfile)
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 735, in matchFiles
> >    filelist, masked = self.collect_bbfiles()
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in collect_bbfiles
> >    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in <lambda>
> >    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
> >  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bbfile_priority
> >    for _, _, regex, pri in self.status.bbfile_config_priorities:
> > AttributeError: 'NoneType' object has no attribute 'bbfile_config_priorities'
> 
> Known problem:
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003721.html

Which is now fixed in bitbake master.

Cheers,

Richard



