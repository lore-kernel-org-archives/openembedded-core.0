Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX188Z/8dfFoNIDggVF7jRdttuF5krSKyrgU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjW0C-0000V6-Dt
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:35:48 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6KCVcQh020873;
	Wed, 20 Jul 2011 07:31:39 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 20 Jul 2011 07:31:38 -0500
Message-Id: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: qing.he@intel.com
Subject: lzo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:35:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I'm trying to build lzo for a powerpc64 target and I'm getting:

configure: 
configure: Your compiler failed the ACC conformance test - for details see 
configure: `config.log'. Please check that log file and consider sending
configure: a patch or bug-report to <markus@oberhumer.com>.
configure: Thanks for your support.
configure: 
configure: error: ACC conformance test failed. Stop.

- k


