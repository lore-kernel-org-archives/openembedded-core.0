Return-Path: <frazer.clews@codethink.co.uk>
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
	by mail.openembedded.org (Postfix) with ESMTP id 617B77F9B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 17:14:57 +0000 (UTC)
Received: from [167.98.27.226] (helo=frazerclews.office.codethink.co.uk)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1iP8bZ-0005aD-Ql; Mon, 28 Oct 2019 17:14:57 +0000
From: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 17:14:47 +0000
Message-Id: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
Subject: [PATCH 0/2] Bug fixes for makedevs.c
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
X-List-Received-Date: Mon, 28 Oct 2019 17:14:57 -0000
Content-Transfer-Encoding: 8bit

fixes a few bugs in some print statements and an overflow bug with usr_buf

Frazer Leslie Clews (2):
  fix format strings in makedevs.c in print statements
  fix invalidScanfFormatWidth to prevent overflowing usr_buf

 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.20.1


