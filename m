Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCqiB-00044x-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:06:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2012 03:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146875702"
Received: from unknown (HELO helios.localnet) ([10.252.123.244])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2012 03:57:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 11:57:30 +0100
Message-ID: <6668552.CMpgp5lzfB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAHod+GfV+mzvHF=SGtKWTL7GP87-pMeTbtf183m=jU_5PM=YYw@mail.gmail.com>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<alpine.DEB.2.02.1203280532530.22292@oneiric>
	<CAHod+GfV+mzvHF=SGtKWTL7GP87-pMeTbtf183m=jU_5PM=YYw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 11:06:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 28 March 2012 12:51:46 Marko Kati=C4=87 wrote:
> I always use "bitbake -c clean -c cleansstate package" for that purpo=
se.

Firstly, cleansstate does a clean already, so no need to specify that a=
s well.

Secondly, images are always rebuilt so provided you comment out the=20
IMAGE_INSTALL_append or whatever you have done to change the image cont=
ents,=20
you can just build the image again and it will be rebuilt as it was bef=
ore.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


