Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjTLl-00062u-Tx
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:45:53 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjTHp-00037N-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:41:50 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 10:41:49 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311154909.30326.51.camel@phil-desktop>
Mime-Version: 1.0
Subject: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 09:45:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since updating this morning I'm getting

| ERROR: Function 'File: '/home/pb/sources/libiconv-1.13.1.tar.gz' has
md5 checksum 7ab33ebd26687c744a37264a330bbe9a when
d42b97f6ef5dd0ba4469d520ed732fed was expected (from URL:
'ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz')' failed
NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed

The offending commit appears to be
bd1e627bef29830f9346b4b984905fd8fcf2e716.  As far as I can tell from a
quick inspection of the files, the checksum that was added for
libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the
earlier version 1.11.1.

p.




