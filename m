Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19agFCCbrjBTDXNtmrsEtDgNv8I96uSODs=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqrEb-0004Ad-TU
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:41:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79IaWcf029895
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 13:36:32 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 13:36:28 -0500
Message-Id: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH 0/4] python libdir / site-packages path cleanup
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
X-List-Received-Date: Tue, 09 Aug 2011 18:41:02 -0000

Utilize python-dir setting of am_cv_python_pythondir &
am_cv_python_pyexecdir to proper paths to handle different libdir and
multilib cases.

- k


