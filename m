Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28ds-0004wA-CI
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:34:16 +0200
Received: by weyr6 with SMTP id r6so2157030wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=szajlHd6C9ae7xEcwDo9O4vmlEq8iCVuWCjWQKxbrjc=;
	b=R1E5aotjs3p+g7kE7XOzwgCW/U27z6j/Vfb2VbwKn7WeDcj9io6cxjXu2caDM7jCCb
	6sUfe0dQ7Yi+f6KUHwz/lMESluwOT7KCb2+PIExpAJqeg7rQTWQb7DKOqvEcW+/epb1v
	MUGz8JRQe8SWE7w5VXdxXqKwtoOHGVCnWHmT3845GHzOVr/iDdEB3S4+cu+0RwXm5kjE
	l83aXQflWWPBNlDxR8/eLK/9yAT9S0CK2bNWwXaxS9JgxOORF9S7kJzVrie6w5Ncru0J
	oBAkxpC4y9a14TX83XmnENWkODUv0uS8QPy5CQw6yXmLwXcEUftEZkjplPtEWznMWR9a
	JmMg==
Received: by 10.216.139.95 with SMTP id b73mr1250841wej.191.1345155738774;
	Thu, 16 Aug 2012 15:22:18 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id t7sm9262196wix.6.2012.08.16.15.22.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:22:16 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:22:08 +0300
Message-Id: <cover.1345155622.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnZWi/Cvr/JrPvuxcpIhuGxp1rtgwapmgAePQUi9bcAVcjpePYu+nziTBZwTlFmExF6sfKA
Subject: [V2 PATCH 0/1] Inherit gettext in subversion
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
X-List-Received-Date: Thu, 16 Aug 2012 22:34:16 -0000

V2:
Send the version of din patch where gettext is inherited

The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:

  bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/fixes

Andrei Gherzan (1):
  subversion: Inherit gettext as msgfmt is needed at compile time

 .../subversion/subversion_1.7.2.bb                 |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5



