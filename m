Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRp33-0003dD-7h for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:17:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRp00-0001jY-Hw
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:14:28 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 18:14:27 +0100
Message-ID: <1306948467.2529.162.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: gnu-config-native and perl-native
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
X-List-Received-Date: Wed, 01 Jun 2011 17:17:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Further to my mini-crusade against perl-native, I discovered that it was
also being included during the initial pseudo build because
gnu-config-native depends on it.

This also seems a bit mysterious: gnu-config has:

DEPENDS_virtclass-native = "perl-native"

... which suggests that the dependency on perl-native was indeed
intentional rather than accidental.  But later, it has:

	# In the native case we want the system perl as perl-native can't have built yet
	if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
	fi

... which suggests that it isn't actually expecting to use the
newly-built perl anyway.  Does anybody know what's going on with that?

p.




