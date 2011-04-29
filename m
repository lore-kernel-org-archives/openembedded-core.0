Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QFlr9-0005Fz-Go
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 13:27:31 +0200
Received: by wwb17 with SMTP id 17so3376985wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2011 04:24:58 -0700 (PDT)
Received: by 10.216.254.39 with SMTP id g39mr4709050wes.108.1304076298225;
	Fri, 29 Apr 2011 04:24:58 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id s40sm1314575weq.4.2011.04.29.04.24.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2011 04:24:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
Date: Fri, 29 Apr 2011 13:24:55 +0200
Message-Id: <9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Fri, 29 Apr 2011 11:27:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 apr 2011, om 12:44 heeft Michael Lippautz het volgende geschreven:

> This fixes compilation/linking of Python 3rd party extensions.
>=20
> ${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
> INCDIR and LIBDIR settings to be used in cross compilation for the
> target. 3rd party module use distutils.sysconfig which uses this
> Makefile to create compiler/linker flags.
>=20
> Workflow:
> 1) compile needs the staged/sysroot Makefile since it is needed
>   for compilation/linking
> 2) install needs the unmodified Makefile to install files (i.e.
>   headers) into the right directores. (otherwise they would be
>   installed in ${D}/${STAGING_...}
> 3) staging needs modified Makefile again
> 4) packaging needs unmodified to make compilation on the target
>   possible

Does any of the sysroot leak into the 3rd party extensions after this =
patch? Apart from that question, the patch looks good to me, although I =
needed a cup of coffee to work out the flow.

regards,

Koen=


