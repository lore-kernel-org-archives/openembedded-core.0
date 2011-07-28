Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+7eTkzWzu9cdKzfPDQzqz3Zfh9Cs2allU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmZGD-0006UI-Mg
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 00:40:58 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SMafNd018600
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 17:36:42 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311885993-13462-1-git-send-email-galak@kernel.crashing.org>
Date: Thu, 28 Jul 2011 17:36:42 -0500
Message-Id: <1E95733A-4179-4EE3-837B-D9CAD9028732@kernel.crashing.org>
References: <1311885993-13462-1-git-send-email-galak@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] bitbake.conf: Add PACKAGE_ARCHS to include TUNE_PKGARCH
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
X-List-Received-Date: Thu, 28 Jul 2011 22:40:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 28, 2011, at 3:46 PM, Kumar Gala wrote:

> Recent changes to how TUNE_PKGARCH is composed means it might not be =
in
> the PACKAGE_EXTRA_ARCHS_tune list.  Rather than having to update all
> such lists we just add TUNE_PKGARCH to PACKAGE_ARCHS.
>=20
> An example, for ppc603e TUNE_PKGARCH is now:
>=20
> 	powerpcppc603e
>=20
> However, PACKAGE_EXTRA_ARCHS_tune-ppc603e =3D "powerpc ppc603e"
>=20
> Thus we run into issues during things like rpm packagine since it will
> not end up dealing the rpms created in a 'powerpcppc603e' directory.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/conf/bitbake.conf |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)

Hmm, this does cause some issues like:

ERROR:  Poky's config sanity checker detected a potential =
misconfiguration.
    Either fix the cause of this error or at your own risk disable the =
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable contains duplicates. The following =
archs are listed more than once: ppc603e
ERROR: Execution of event handler 'check_sanity_eventhandler' failed

- k=


