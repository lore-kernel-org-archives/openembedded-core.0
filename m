Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV2Rv-0006Dn-NW for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:12:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QV2Oj-0000IX-7u
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:09:17 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 15:09:16 +0100
Message-ID: <1307714956.25285.14.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: bitbake -b busted
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
X-List-Received-Date: Fri, 10 Jun 2011 14:12:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since updating this morning, it seems that oe-core master now requires
bitbake 1.13.1 to be installed.  (I don't recall any discussion of that
change or the reasons for it, but no doubt they are good ones.)

I couldn't find a 1.13.1 tag (or in fact any tags after 1.12.0) in the
bitbake repository so I pulled the head of master.  Judging from the
contents of the log this is pretty close to 1.13.1 if not identical.

Unfortunately, this update seems to have broken "bitbake -b <file>"
altogether.  Any such command now seems to give me:

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/pb/oe/bitbake/lib/bb/command.py", line 190, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 774, in buildFile
    fn = self.matchFile(fn)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 752, in matchFile
    matches = self.matchFiles(buildfile)
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 735, in matchFiles
    filelist, masked = self.collect_bbfiles()
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in collect_bbfiles
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in <lambda>
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bbfile_priority
    for _, _, regex, pri in self.status.bbfile_config_priorities:
AttributeError: 'NoneType' object has no attribute 'bbfile_config_priorities'

p.




