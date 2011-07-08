Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfDFA-0001z9-3T for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:45:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfDBR-0007IO-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:41:37 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2011 16:41:36 +0100
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310139697.6337.134.camel@phil-desktop>
Mime-Version: 1.0
Subject: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 15:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not sure whether there are pending patches which will address these
or not, but with a fresh pull from today I'm still not getting very good
packaging for eglibc 2.13.  Specifically:

WARNING: For recipe eglibc, the following files were installed but not
shipped in any package:
WARNING:   /etc/localtime
WARNING:   /etc/rpc
WARNING:   /etc/ld.so.conf
WARNING:   /lib/gconv/ISO-2022-CN-EXT.so
WARNING:   /lib/gconv/IBM921.so
[... etc ...]
WARNING:   /lib/gconv/.debug/ISO-2022-CN-EXT.so
WARNING:   /lib/gconv/.debug/IBM921.so
[... etc ...]
WARNING:   /share/i18n/charmaps/ISO-8859-15.gz
WARNING:   /share/i18n/charmaps/IBM285.gz
[... etc ...]
WARNING:   /share/i18n/locales/ss_ZA
WARNING:   /share/i18n/locales/is_IS
[... etc ...]
WARNING: QA Issue: libc-extra-nss rdepends on eglibc-dev
WARNING: QA Issue: libc-thread-db rdepends on eglibc-dev
ERROR: QA run found fatal errors. Please consider fixing them.

I'm not sure if these are actually new or not, though.  It's possible
that they've been there for ages and I only just noticed.

p.




