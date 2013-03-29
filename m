Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgz8-0004Wx-1u
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:18 +0100
Received: by mail-ea0-f174.google.com with SMTP id m14so357452eaj.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=Vc/h/WuXoqrjFW+16C3mQVTIa2G9mw6ml1yBNuNknW0=;
	b=EOEOljAIho1rs0wVq7LdBjacoQ7suBgj6FeA9FnfAZO51ueBFSmAor1zB+FpX5Ew38
	k9mJbC4V54IUgxeJ/QYU4JYHCRlIua+CKfCV340N5sLpue+ohGKgNDl4gSBwhDH6TvkW
	JGKA2d/Ly2JoCs/YjQcgGR3yJlWqQfX3luB7oB8axKvocPLYR76JY5dZjrtsvdiUEH55
	fP6EVysb8bxlWfG2blNb/CsnpSCbeQI+TjsB8sek4dt8QQbXc62omWVrffGFxvF+J70o
	iPWVFkP+R60brtXuBcjzozNq6+BA8/+Ke/YJJOdis+ORvcJJqrD81dkg0AHbTzFTkldN
	T35A==
X-Received: by 10.14.5.6 with SMTP id 6mr11477436eek.42.1364592013063;
	Fri, 29 Mar 2013 14:20:13 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.11
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:19:56 +0100
Message-Id: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 0/5] remove gtk+-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 21:37:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3ed59ee53ee7d87694670a7ba864165146b90a6b:

  scripts/contrib/build-perf-test.sh: add timings for bitbake -p (2013-03-29 16:22:52 +0000)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git gtk+-native-farewell

Andreas Müller (5):
      gtk+: don't provide native build
      remove gtk-update-icon-cache-native virtuals
      packagegroup-toolset-native: replace gtk+-native by gtk-update-icon-cache-native
      sstate.bbclass: remove reference to gtk+-native
      seperatebuilddir.inc: remove reference to gtk+-native

 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/classes/sstate.bbclass                        |    2 +-
 meta/conf/distro/include/default-providers.inc     |    1 -
 meta/conf/distro/include/seperatebuilddir.inc      |    1 -
 meta/recipes-gnome/gtk+/gtk+.inc                   |    8 --------
 meta/recipes-gnome/gtk+/gtk+_2.24.15.bb            |   10 +---------
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |    2 --
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 8 files changed, 4 insertions(+), 24 deletions(-)

-- 
1.7.4.4



