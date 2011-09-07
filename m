Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1IBe-0004gU-AO
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 15:29:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2011 06:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,345,1312182000"; d="scan'208";a="48897872"
Received: from unknown (HELO helios.localnet) ([10.252.120.53])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2011 06:23:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>, Eric 
	=?utf-8?q?B=C3=A9nard?= <eric@eukrea.com>
Date: Wed, 7 Sep 2011 14:23:42 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315401430-27997-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1315401430-27997-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201109071423.42658.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] qt4e-demo-image: improve image
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
X-List-Received-Date: Wed, 07 Sep 2011 13:29:06 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 07 September 2011 14:17:10 Eric B=C3=A9nard wrote:
> use ${POKY_BASE_INSTALL} in order to have the base files and
> ools in the image.
>=20
>..
>=20
>  IMAGE_INSTALL +=3D "\
> -	busybox \
> +	${POKY_BASE_INSTALL} \
>  	module-init-tools \
>  	task-qt4e-base \
>  "

Hmm, I missed this when the original patches came in; surely it would be=20
better to just append to IMAGE_INSTALL after the "inherit core-image" line,=
=20
then we start with the default value from core-image.bbclass?

(Of course with either fix we'll run into the build annoyance pointed out i=
n=20
the other message I just sent, where a whole bunch of X apps we won't need=
=20
will get built.)

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


