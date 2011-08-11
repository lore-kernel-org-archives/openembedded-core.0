Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/1GXLs6jhJuozgvaUoJuI5Xj334dE7hnU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrYGe-00031g-Ra
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:38:01 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7BGXRqw003203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:33:28 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <23a2a8333105b2dcbde8e74bc3fd88841656980d.1313079549.git.sgw@linux.intel.com>
Date: Thu, 11 Aug 2011 11:33:16 -0500
Message-Id: <58DA74C3-B734-4611-BA43-1B365E22C58B@kernel.crashing.org>
References: <cover.1313079549.git.sgw@linux.intel.com>
	<23a2a8333105b2dcbde8e74bc3fd88841656980d.1313079549.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 05/10] python-dir: specify am_cv_python_pythondir & am_cv_python_pyexecdir
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
X-List-Received-Date: Thu, 11 Aug 2011 16:38:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 11, 2011, at 11:29 AM, Saul Wold wrote:

> From: Kumar Gala <galak@kernel.crashing.org>
>=20
> autoconf will try and set these to via python.m4:
>=20
> =
am_cv_python_pythondir=3D$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-pac=
kages
> =
am_cv_python_pyexecdir=3D$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/sit=
e-packages
>=20
> However this is problematic as this doesnt respect libdir and where
> we've actually set python's site package dir to.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/classes/python-dir.bbclass |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)

Drop the python patches, Richard wanted us to patch automake,  I've =
posted a new set of patches for that.

- k=


