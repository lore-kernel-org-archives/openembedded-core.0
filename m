Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCEA971A3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 20:58:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3AKwguJ015452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 13:58:42 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 13:58:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Apr 2017 15:58:27 -0500
Message-ID: <20170410205828.93764-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Restore proper attributions to libsolv patch
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
X-List-Received-Date: Mon, 10 Apr 2017 20:58:43 -0000
Content-Type: text/plain


Per the email: http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135460.html

Neal's attribution to the original code was lost.  In addition the original
two patches were squashed together.  This was not indicated in any change
information.  Again, making it unclear the proper history of the patches.

The associated change has no technical content change to the patches, it
is purely cosmetic.  The attempt is to restore the original unmodified
patches, including all attributions.  Maxim's patch to the if clause
in one hunk was then restored on top.

Let me know if there are any questions or concerns with this set.

(Note, Neal has not provided a signed-off-by line, which is his right as
an external author.  Since I modified the code, I did not add Maxim's either
as I do not have the right to add a signed-off-by line by someone else
without their express permission.)

Mark Hatle (1):
  libsolve: 0001-Add-fallback-fopencookie-implementation.patch fix
    attribution

 ...1-Add-fallback-fopencookie-implementation.patch | 186 +++++++++++++++++----
 1 file changed, 150 insertions(+), 36 deletions(-)

-- 
2.11.0


