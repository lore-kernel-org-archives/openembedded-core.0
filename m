Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19fOXh2E0CZK1OrKfrHhP5BMeRFFrrv8zM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqoaW-0008DG-TZ
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 17:51:29 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79FkxRQ009076
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 10:46:59 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 9 Aug 2011 10:46:58 -0500
Message-Id: <6D5D2EC4-D6E1-4445-9048-66DA9BCF3A81@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: meta-toolchain-sdk build dir names
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
X-List-Received-Date: Tue, 09 Aug 2011 15:51:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

When we do a build we get something like:

opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux

Where does the 'powerpc-poky-linux' name come from?

I think this needs to be more specific to the build if required because =
of how AVAILTUNES, etc are set.

So something like:

opt/poky/1.0+snapshot/sysroots/ppc603e-poky-linux


- k=


