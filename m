Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMRNi-0004to-C0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:00:42 +0200
Received: by pwj9 with SMTP id 9so473073pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=n1WaCd67ENNjOlZUNoyZ3+eJcwzAHkOGU5ksaLcCy28=;
	b=cVZqrKIkFmgJr1P/lUMSWlDaWvux1aiH/e2GpSD7uguDLbdt16aXn585KtS1I65LIr
	/yz+HFTTNyKV8ktFNKiMfhwN4qbToEVw4iN6fjHzQLRniC3jv8GrIeCzPa6D0rwG5qw7
	pO6kzhokUpGgORc0fPNlZYiHW03rPjFlXtQ/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZysOwuDCcY3My0M2tMMTLCnO02RsOwhwM7G1WpaB7veEqSQHhlNVwiZfybupMKEU9S
	fO6AX4hzQ+jpn6/xv0cKUc/VRjFsUnUcCHcGlCj9gq5cNFjdqDCbsdvj7PZnJMcfbfqL
	Nj5Nn3lrsYchs1axa8ggf+FJZ+IU94M7gYysY=
Received: by 10.68.60.164 with SMTP id i4mr1783306pbr.0.1305665863847;
	Tue, 17 May 2011 13:57:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p2sm588094pbq.6.2011.05.17.13.57.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 13:57:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2011 13:57:34 -0700
Message-Id: <cover.1305665459.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Define some distro overridable varibles
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
X-List-Received-Date: Tue, 17 May 2011 21:00:42 -0000

Some distros use busybox-mdev instead of udev e.g. this patch
defines variables to denote those and can be overridden in distro
policies. Defaults are kept as it is in default-distrovars.inc

With this patch following patch is not needed
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/002450.html

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/distrovars
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/distrovars

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  default-distrovars.inc,task-core-boot.bb: Create distro overridable
    varibales

 meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb       |    8 ++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
1.7.4.1



