Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 31E5A61005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 9BAC819DD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T2Qwn23+ZeKn
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 013E019D78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D57A95FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id CA4545B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id C83393404E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r8ACKD2p001556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:20:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r8ACKDFS001555
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Sep 2013 14:20:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 14:20:09 +0200
Message-Id: <cover.1378815538.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/1] Improve bb-matrix graphs
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
X-List-Received-Date: Tue, 10 Sep 2013 12:20:13 -0000

This improves the look of bb-matrix graphs with sparse data, i.e.,
where not all combinations of BB_NUMBER_THREADS and PARALLEL_MAKE have
been tested.

This adds an implicit dependency on gnuplot v4.4 or later, but since
this only is a script in the contrib section I hope that is
acceptable.

//Peter

The following changes since commit 0ca5d1fb38157564a2b9452ade32391d18a41b09:

  yocto-bsp: remove apm as a default MACHINE_FEATURE (2013-09-09 16:28:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/bb-matrix-plot
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/bb-matrix-plot

Peter Kjellerstedt (1):
  bb-matrix-plot: Use interpolation for sparse data

 scripts/contrib/bb-perf/bb-matrix-plot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.2.1


