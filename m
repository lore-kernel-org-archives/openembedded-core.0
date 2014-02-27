Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 88D0B6F302
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:34:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2014 14:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,557,1389772800"; d="scan'208";a="491177438"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.209])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2014 14:34:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 22:34:05 +0000
Message-ID: <4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 22:34:09 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 27 February 2014 21:20:37 David Nystr=F6m wrote:
> Adding a common interface to add predefined package manager
> channels to prebuilt rootfs:es.
>=20
> Adding PACKAGE_FEED_URIS =3D "http://myre.po/repo/, will
> assume repo directories named (rpm,ipk,deb) as subdirectories
> and statically add them to the rootfs, using the same PKG_ARCHs
> as the build which produced the images.
>=20
> Tested with RPM, IPK and DEB.

Looks good. The only thing that looks like it might be missing here is =
there=20
appears to be no way to name the package repo entries individually, tho=
ugh I'm=20
not sure what syntax we would use to allow that.

Thoughts?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

