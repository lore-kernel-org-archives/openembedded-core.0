Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1931HIHTHXMmQMcXoMIYSPy10OU7UbUyo4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qopuc-0001EA-PJ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 06:52:03 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p744lZYh027526;
	Wed, 3 Aug 2011 23:47:36 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 3 Aug 2011 23:47:35 -0500
Message-Id: <E22BB6FB-B44D-425A-B99D-2EE82823AEA4@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: how to override baselib for ppc64?
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
X-List-Received-Date: Thu, 04 Aug 2011 04:52:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

in meta/conf/bitbake.conf we set:

baselib =3D "lib"

For the ppc64 (non-multlib) targets we want this to be:

baselib =3D "lib64"

I'm not sure the best way or place to set this so it will work properly =
and co-exist with the multilib options.

- k=


