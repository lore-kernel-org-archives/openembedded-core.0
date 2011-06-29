Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbwTV-0008Ff-IR for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 17:14:45 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbwPx-0001Eq-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 17:11:05 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309360040.2551.56.camel@phil-desktop>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
	<A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
	<1309360040.2551.56.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 16:11:03 +0100
Message-ID: <1309360263.2551.59.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Wed, 29 Jun 2011 15:14:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 16:07 +0100, Phil Blundell wrote:
> It seems that the main problem I was having was that (coincidentally in
> light of the earlier gst discussion) the recipe I was trying to build
> was unluckily named and being skipped because base.bbclass thought I
> wasn't licensed to use it.

Also, it does seem that "bitbake -e -b ..." really is broken.  I get:

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 272, in showEnvironment
    command.cooker.showEnvironment(bfile)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 259, in showEnvironment
    fn = self.matchFile(buildfile)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 753, in matchFile
    matches = self.matchFiles(buildfile)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 736, in matchFiles
    filelist, masked = self.collect_bbfiles()
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in collect_bbfiles
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in <lambda>
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bbfile_priority
    for _, _, regex, pri in self.status.bbfile_config_priorities:
AttributeError: 'NoneType' object has no attribute 'bbfile_config_priorities'

Using an absolute path to the .bb file doesn't seem to help in this
case, and I also verified that it does build successfully without the
-e.

p.




