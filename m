Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9Yw9-0006T4-Ht
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 12:03:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2012 02:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,379,1344236400"; d="scan'208";a="218796414"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2012 02:51:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 06 Sep 2012 10:51:10 +0100
Message-ID: <4865258.AYjzzpLvn7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CALbNGRTrP1i2R69pT-rgtGhs+qmeGeGtPnBAxGgpxq5L2SJ3Ag@mail.gmail.com>
References: <CALbNGRTrP1i2R69pT-rgtGhs+qmeGeGtPnBAxGgpxq5L2SJ3Ag@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: IMAGE_LINGUAS question
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 10:03:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 28 August 2012 06:33:55 Andreas M=FCller wrote:
> The display manager LXDM (and I think others too) check in
> configuration files which languages to offer. I would like to add a
> postinst for LXDM which fills it's configuration file according to
> what was installed by IMAGE_LINGUAS. Now my question (I looked into
> image.bbclass but did not find something useful): Is there some file
> around in rootfs where I can get the information which languages were=

> installed by image linguas?

My suggestion would be to add a shell function called from=20
ROOTFS_POSTPROCESS_COMMAND which calls the get_split_linguas shell func=
tion=20
(see image.bbclass) or uses IMAGE_LINGUAS directly depending on what yo=
ur=20
configuration file expects.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


