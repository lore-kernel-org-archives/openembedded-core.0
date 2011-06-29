Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qbw81-0007Xi-NB for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:52:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbw4T-0001E8-HL
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:48:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 15:48:15 +0100
Message-ID: <1309358918.2551.48.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: bitbake -b busted again?
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
X-List-Received-Date: Wed, 29 Jun 2011 14:52:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Using bitbake master from today, I'm now getting this error whenever I
try to do "bitbake -b anything.bb":

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in
runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 190, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 792, in buildFile
    self.status.add_from_recipeinfo(fn, info_array)
  File "/home/pb/oe/bitbake/lib/bb/cache.py", line 710, in
add_from_recipeinfo
    info.add_cacheData(self, fn)
  File "/home/pb/oe/bitbake/lib/bb/cache.py", line 182, in add_cacheData
    cachedata.task_deps[fn] = self.task_deps
AttributeError: 'CoreRecipeInfo' object has no attribute 'task_deps'

p.




