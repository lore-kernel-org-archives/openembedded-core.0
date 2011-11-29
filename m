Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RVIiN-00051t-T9
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:06:55 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RVIbz-0008Na-FD
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:00:19 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E3D06804@orsmsx504.amr.corp.intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
	<4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
	<CAP9ODKpm7jB4FhBuNC7biDyuhVg8Kdxf5wEcm+WwsAyRtZR+WQ@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D06804@orsmsx504.amr.corp.intel.com>
Date: Tue, 29 Nov 2011 08:00:13 +0000
Message-ID: <1322553613.3077.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 08:06:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-11-28 at 17:52 -0800, Kamble, Nitin A wrote:

> Before the generation of libgmpxx library, there was only one library,
> libgmp, and it was getting packaged into libgmp10 package. After
> addition of the libgmpxx library the package name changed to the
> recipe name (gmp), in order to preserve the previous package name(for
> distro upgrades), and to let people avoid installation of libgmpxx if
> they don=E2=80=99t need it in order to save the space on target, two pack=
ages
> are generated for each library with this scheme.

Right, but that's not really the point.  I think what Otavio was trying
to ask was, why didn't you just do:

PACKAGES =3D+ "libgmpxx"
FILES_libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"

?  I think the way you have done it will cause the libgmp package name
to change for people not using debian.bbclass, which is probably a bad
thing.

p.





