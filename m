Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+Moc7KdkIY9i9mVfPc08SlPfjYquST9+g=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoOGf-0002z5-LM
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 01:20:58 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72NFvUv032080;
	Tue, 2 Aug 2011 18:15:57 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
Date: Tue, 2 Aug 2011 18:15:58 -0500
Message-Id: <115F44DD-4174-4BC3-B268-AE9EC4CB8BCD@kernel.crashing.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
To: Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
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
X-List-Received-Date: Tue, 02 Aug 2011 23:20:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 9:26 AM, Kumar Gala wrote:

> Some of powerpc's dont support the fsqrt[s] instructions so we need an
> implementation of the library functions for those processors.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 =
++++++++++++++++++++
> meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
> 2 files changed, 540 insertions(+), 1 deletions(-)
> create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch

What about this patch?

- k=


