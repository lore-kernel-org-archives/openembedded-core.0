Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr8sj-0001mL-Hc for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 15:31:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ADR8DZ021811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:27:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:27:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ADR0tp021805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:27:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312973314.6733.37.camel@phil-desktop>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
	<A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
	<1309360040.2551.56.camel@phil-desktop>
	<1309360263.2551.59.camel@phil-desktop>
	<1312973314.6733.37.camel@phil-desktop>
Date: Wed, 10 Aug 2011 14:26:25 +0100
Message-ID: <1312982785.14274.381.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake -b busted again?
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
X-List-Received-Date: Wed, 10 Aug 2011 13:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 11:48 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 16:11 +0100, Phil Blundell wrote:
> > Also, it does seem that "bitbake -e -b ..." really is broken.  I get:
> > 
> > ERROR: Command execution failed: Traceback (most recent call last):
> >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
> >     commandmethod(self.cmds_async, self, options)
> >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 272, in showEnvironment
> >     command.cooker.showEnvironment(bfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 259, in showEnvironment
> >     fn = self.matchFile(buildfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 753, in matchFile
> >     matches = self.matchFiles(buildfile)
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 736, in matchFiles
> >     filelist, masked = self.collect_bbfiles()
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in collect_bbfiles
> >     files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in <lambda>
> >     files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
> >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bbfile_priority
> >     for _, _, regex, pri in self.status.bbfile_config_priorities:
> > AttributeError: 'NoneType' object has no attribute 'bbfile_config_priorities'
> > 
> > Using an absolute path to the .bb file doesn't seem to help in this
> > case, and I also verified that it does build successfully without the
> > -e.
> 
> FWIW, I just re-tested with bitbake master from today and this still
> seems to be broken.

I've posted a patch to fix this to the bitbake list.

Cheers,

Richard



