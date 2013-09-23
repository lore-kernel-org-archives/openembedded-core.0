Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id CEA8F610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:24:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Sep 2013 07:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,962,1371106800"; d="scan'208";a="364323459"
Received: from unknown (HELO helios.localnet) ([10.252.120.20])
	by azsmga001.ch.intel.com with ESMTP; 23 Sep 2013 07:24:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 23 Sep 2013 15:24:40 +0100
Message-ID: <1578169.W0gr9jI3si@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CALbNGRROB7mqTpQr=K-HUotmQx2RhCJ-Cnf=BsmSj_W6svWj6Q@mail.gmail.com>
References: <CALbNGRROB7mqTpQr=K-HUotmQx2RhCJ-Cnf=BsmSj_W6svWj6Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: do_patch and binary patches
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
X-List-Received-Date: Mon, 23 Sep 2013 14:24:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Andreas,

On Wednesday 04 September 2013 13:44:32 Andreas M=FCller wrote:
> did not find any helpful hint - and cannot remember somebody asked
> already: Is there a specific reason why our do_patch ignores binary
> files - or is there a way to allow binary files in patches?

I don't have any specific knowledge about this limitation, and I see yo=
u've=20
worked around it in the mean time; but maybe this is because quilt does=
n't=20
(didn't?) support patching binary files. You could try setting PATCHTOO=
L =3D=20
"patch" instead.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

