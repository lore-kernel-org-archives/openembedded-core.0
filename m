Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE8E7706B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 440E5A00454
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173651-42256 ;
	Mon, 19 Oct 2015 10:17:36 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:34 +0200
Message-Id: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:36,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:36
Subject: [PATCH 0/7] Two fixes and some changes for linux-dtb.inc
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
X-List-Received-Date: Mon, 19 Oct 2015 08:17:41 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable

Hi,

here are two small fixes for linux-dtb.inc and five refactoring patches.  T=
he
fixes come first so they can be applied seperatly.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	 Stefan Christ


Stefan Christ (7):
  linux-dtb.inc: fix detection of ending '.dts'
  linux-dtb.inc: fix file ending detection
  linux-dtb.inc: remove unneeded 'cd'
  linux-dtb.inc: use same variable name DTB for all elements of
    KERNEL=5FDEVICETREE
  linux-dtb.inc: explicit test for empty string not needed
  linux-dtb.inc: refactor common code to function normalize=5Fdtb
  linux-dtb.inc: refactor common code to function
    get=5Freal=5Fdtb=5Fpath=5Fin=5Fkernel

 meta/recipes-kernel/linux/linux-dtb.inc | 91 ++++++++++++++++-------------=
----
 1 file changed, 43 insertions(+), 48 deletions(-)

--=20
1.9.1


