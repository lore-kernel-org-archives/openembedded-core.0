Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAD960C16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 14:59:03 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Fri, 10 Jan 2014
	15:59:01 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 15:58:59 +0100
Message-ID: <cover.1389365909.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] terminal.bbclass: do not export PS1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 14:59:03 -0000
Content-Type: text/plain

terminal.bbclass: do not export PS1
   
With a complex PS1 setup, PS1 might not have all characters correctly escaped
when terminal.bbclass writes the export. This caused the run.do_terminal.PID to
terminate, making it impossible to use the devshell.
    
As the spawned shell will parse e.g. .bashrc (or whatever rc-file is being
used), PS1 will be reset in the devshell.
The following changes since commit 1028ac813fa9803ebfff6bcfa7f8b67012609b27:

  sstate: add do_package to the noexec list in setscene_depvalid (2014-01-07 13:58:28 +0000)

are available in the git repository at:

  git://github.com/darander/oe-core terminal.bbclass
  https://github.com/darander/oe-core/tree/terminal.bbclass

Anders Darander (1):
  terminal.bbclass: do not export PS1

 meta/classes/terminal.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.5.2


