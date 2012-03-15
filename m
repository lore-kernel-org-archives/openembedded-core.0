Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1S8IrD-0006MU-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 23:09:16 +0100
Received: by dado14 with SMTP id o14so5656116dad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 15:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=UsJXVSK92FlXG07nPXjeAVU6YbQLbDji8jatbhlr3U4=;
	b=OSSwCfcrjoDaDSCFFPoYYDAw7S6xkL07zpuApKD3QLLMusPKkYX8BZCNgd5GKK38pb
	s500W1fjU+Fxg0a6q9qdqMLoiV6OD4YHa0h0QswpWnhB0tMUMhGPbCRP3507WBoin07E
	ARTXeUfLEf23BI2mp7cj14yWg55Bn7eGat46TNm0lmlD85XGXrs7LW53ohvqdiHfIi7X
	IPfghZHLEkDVP5459syorg/O5blnM7nIJkgg43usLLa8MHh+h84vBHAEYV1WF7TaGh1t
	/jsj1i5fVRhHA4XarHLUEg6gc86fNyXudT+NKdhFuoLfLa6+BB7gJE1wYGp1nPMZib43
	zm+g==
Received: by 10.68.129.74 with SMTP id nu10mr8081634pbb.157.1331848827451;
	Thu, 15 Mar 2012 15:00:27 -0700 (PDT)
Received: from localhost (static-50-53-102-193.bvtn.or.frontiernet.net.
	[50.53.102.193])
	by mx.google.com with ESMTPS id 2sm2718503pbw.57.2012.03.15.15.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 15:00:25 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 15:00:16 -0700
Message-Id: <cover.1331848750.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmIfo80l8OAmf4GdNlFZbBSX3SVlGFi0hdXnsQuflcZwKGfXZb6056H6lXsB2ZAHW7dAbGT
Subject: [PATCH 0/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Thu, 15 Mar 2012 22:09:16 -0000

The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:

  qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/updates
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/updates

Darren Hart (1):
  rt-tests: Add src/backfire to FILES_${PN}

 meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.5.4



