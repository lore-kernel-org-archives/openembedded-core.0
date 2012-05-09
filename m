Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRv9q-0000rz-Qi
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:53:35 +0200
Received: by pbbrq2 with SMTP id rq2so7395440pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZJyQVTjTRa48CxQCpK7W8DgMQbeiIZNuTupH7KACvGs=;
	b=h50ILYJeitdpewKIM6ple+vG6lShzeUlWKOJhAGkw5EpobFxLxxb0Cx9bQSYZvbP1n
	7Nr1hYja1D4jx/ym0wNIF18YMaOfDLP4+mjDNJFGODOsr3mI/TiFTR9y4auBehWy9dCD
	mNlkOCPdUiJLwp2mgqB11nXR++r7t0ZsGATgtRkZL2qSsRES+aCBil/NKm5Fo7bvpHi/
	WfYwkog5UBnGhB7IhhyUXWTvgKT1KWvtph6hy9vTLT9MvnpK3hxSyQ9UpK53AgUqll3f
	hTjiPgx26/MwGoJNgGfHlos8jVG+fMkyOAiCDpG6TL/wnjWqRuCXj7LIyJgbKb5XZUjs
	netg==
Received: by 10.68.234.163 with SMTP id uf3mr3075735pbc.63.1336524221460;
	Tue, 08 May 2012 17:43:41 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id d4sm4050427pbr.32.2012.05.08.17.43.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:43:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:43:26 -0700
Message-Id: <cover.1336524034.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Let uclibc provide rtld(GNU_HASH)
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
X-List-Received-Date: Wed, 09 May 2012 00:53:35 -0000

We have seen reports where rtld(GNU_HASH) is found missing
on uclibc based images infact uclibc rtld does provide GNU_HASH
support as default so we add that to PROVIDES

snapshot mirror url is changed. Currently the url will fetch
html files which will end in corrupted downloads so we
update the url location in mirrors class.

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (2):
  uclibc.inc: uclibc rtld does support GNU_HASH
  classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
    location

 meta/classes/mirrors.bbclass        |    2 +-
 meta/recipes-core/uclibc/uclibc.inc |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.5.4



