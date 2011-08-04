Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18LCfJDAG45ZiW7u4QBOPh3nCtq7g3XMNA=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qosqv-00075s-8m
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 10:00:25 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p747txn4022418;
	Thu, 4 Aug 2011 02:55:59 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Thu, 4 Aug 2011 02:55:58 -0500
Message-Id: <EEDE7930-C960-4D86-86EE-D8E1E0A28017@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: 64-bit gcc hack patch /
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
X-List-Received-Date: Thu, 04 Aug 2011 08:00:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

What is meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch really =
accomplishing at this point?

Its not clear to me what benefit or what is really impacted by the =
following change:

 MULTILIB_OPTIONS =3D m64/m32
-MULTILIB_DIRNAMES =3D 64 32=20
-MULTILIB_OSDIRNAMES =3D ../lib64 $(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
+MULTILIB_DIRNAMES =3D . 32
+MULTILIB_OSDIRNAMES =3D . $(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)

Trying to decide if the ppc equivalent of this patch is really needed or =
not.

- k=


