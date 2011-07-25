Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlLZi-0001VZ-M1
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:52:04 +0200
Received: by rex (Postfix, from userid 1000)
	id 4911320572; Mon, 25 Jul 2011 14:47:18 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 14:47:16 +0100
Message-Id: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/5] Various multilib related fixes
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
X-List-Received-Date: Mon, 25 Jul 2011 13:52:04 -0000

Several multilib support updates from Mark are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/ml
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/ml

Mark Hatle (5):
  multilib_header.bbclass: Add oe_multilib_header wrapper
  Fix recipe multilib header conflicts
  eglibc: Update 2.13 to avoid multilib conflicts
  ncurses: Uncompress man pages
  package.bbclass: fixup_perms - symlink bug fix

-- 
1.7.4.1



