Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USO0a-0004bL-3B
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 10:46:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Apr 2013 01:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="228174718"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Apr 2013 01:28:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>,
	Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 17 Apr 2013 09:28:49 +0100
Message-ID: <18219582.KT7bte5u1O@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 08:46:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
> On Apr 16, 2013, at 11:28 PM, Andreas M=FCller <schnitzeltony@googlem=
ail.com>
> wrote:
> > sorry again me with another issue. I updated all layers from master=

> > few hours ago and built from scratch. On first boot with systemd
> > postinst never finishes. I see only:
> >=20
> > [**  } A start job is running for Run pending postinsts
> >=20
> > and ** are moving around.
> >=20
> > Does anybody else face this one?
>
> ran into same issue. I disabled post installs to run on boot

Could you guys please try to debug this and find out what is hanging he=
re,=20
because with core-image-minimal and systemd I don't see this problem, t=
he run-
postinsts script finishes as expected.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


