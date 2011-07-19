Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+ZJxfvcl0gJVxxsOHud8spyKIj9olxrRQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjEMY-0006Sw-Fp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:45:42 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHfa8j009943;
	Tue, 19 Jul 2011 12:41:37 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:41:31 -0500
Message-Id: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Cc: yocto@yoctoproject.org
Subject: [PATCH v2 0/5] Add support for PowerPC e500v2/SPE
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
X-List-Received-Date: Tue, 19 Jul 2011 17:45:42 -0000

The majority of support for the PowerPC e500v2/SPE target already
exists.  However some minor cleans are required to get things working
completely.

The e500v2 utilizes a unique floating point programming model / ABI from
other PowerPC targets and thus requires special handling.

- k


