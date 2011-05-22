Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QO01x-0006sP-Lw
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 06:12:41 +0200
Received: by pxi6 with SMTP id 6so3597307pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 21:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6tuezTaQaPZCFHTH7bFB9M59ozr5AKiEayR2PAO2vAA=;
	b=M+e/Ry57NnQ4ndK1Dda6XJvtgcHCiG9yBs/xH0XQ1J5q6tRnPJu7i6SrMHJC2INMOO
	GFUq7/t/vME4LfczMELybc+KtwHjzDXsLjsn5JFpD1TAG2AsMmjKrw1P7558+7Ao5dPw
	84iV0/LJqxbiHZ3AAssKPeomGp3Kjv0hxXaho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cqMoboPtph4i/lbTsMAQd51Wels2hGUXAz+ttTaq9LQ9q+YmoboUIgCPbahrrlvAQi
	U2b0T4khHKnIWRiYWr8Oxn6K7cA1JdrAGsb4rxZHWzomk8T1dfH4JNJvNfLB7+IAtC6V
	DozyZyVGYppFk79nM7n5skCHXBVrYGRdd4wU4=
Received: by 10.142.80.2 with SMTP id d2mr627735wfb.214.1306037381573;
	Sat, 21 May 2011 21:09:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm4660824wfb.10.2011.05.21.21.09.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 May 2011 21:09:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2011 21:09:25 -0700
Message-Id: <cover.1306037150.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Use PARALLELMFLAGS to pass -jN
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
X-List-Received-Date: Sun, 22 May 2011 04:12:41 -0000

eglibc uses PARALLELMFLAGS variable to pass information about parallelism to make
we transfer the contents of PARALLEL_MAKE to PARALLELMFLAGS and pass that
to make

I did a build and install of eglibc with and without patch using -j2

with patch

real    11m26.993s
user    11m25.230s
sys     3m0.150s

without patch

real    12m49.721s
user    11m34.920s
sys     3m19.180s



The following changes since commit 2853c6bee0f695afaebe012be9f6c4a81ac511e2:

  eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS (2011-05-21 15:59:26 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/eglibc
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/eglibc

Khem Raj (1):
  eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS

 meta/recipes-core/eglibc/eglibc.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

-- 
1.7.4.1



