Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbDqS-00007u-76
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:35:28 +0200
Received: by wwi14 with SMTP id 14so2170657wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 08:31:48 -0700 (PDT)
Received: by 10.227.60.206 with SMTP id q14mr5741434wbh.111.1309188707931;
	Mon, 27 Jun 2011 08:31:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fr17sm4173218wbb.23.2011.06.27.08.31.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 08:31:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1309188064.git.mark.hatle@windriver.com>
Date: Mon, 27 Jun 2011 17:31:44 +0200
Message-Id: <BCF3715C-89A9-4B7A-9278-6D589F8223B1@dominion.thruhere.net>
References: <cover.1309188064.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/2] Ensure a reasonable umask, and fix up permissions (V2)
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
X-List-Received-Date: Mon, 27 Jun 2011 15:35:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jun 2011, om 17:26 heeft Mark Hatle het volgende geschreven:

> Revised the fixup_perms function in package.bbclass.  Change to using =
a
> class based approach for the individual permissions entries.
>=20
> Add support for directory linkages.
>=20
> Add entries to match base-files recipe in the fs-perms.txt.
>=20
> (umask commit is unchanged, resending due to time since last sent)
>=20
> ----
>=20
> V1 log below
>=20
> Add a new function that is responsible for fixing directory and file
> permissions, owners and groups during the packaging process.  This =
will fix
> various issues where two packages may create the same directory and =
end up
> with different permissions, owner and/or group.
>=20
> The issue being resolved is that if two packages conflict in their =
ownership
> of a directory, the first installed into the rootfs sets the =
permissions.
> This leads to a least potentially non-deterministic filesystems, at =
worst
> security defects.
>=20
> The user can specify their own settings via the configuration files
> specified in FILESYSTEM_PERMS_TABLES.  If this is not defined, it will
> fall back to loading files/fs-perms.txt from BBPATH.  The format of =
this
> file is documented within the file.
>=20
> By default all of the system directories, specified in bitbake.conf, =
will
> be fixed to be 0755, root, root.
>=20
> The fs-perms.txt contains a few default entries to correct =
documentation,
> locale, headers and debug sources.  It was discovered these are often
> incorrect due to being directly copied from the build user =
environment.
>=20
> Also tweak a couple of warnings to provide more diagnostic =
information.

Does this rely on the umask feature in bitbake master? If so, we should =
check the minumum bitbake requirements again=


