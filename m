Return-Path: <Andreas.Reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id D725E77CCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 37BE51E199C;
	Wed, 26 Apr 2017 12:32:28 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001,
	URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eBDhPf9DdOc0; Wed, 26 Apr 2017 12:32:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 362AF1E19AF;
	Wed, 26 Apr 2017 12:32:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wj5g-4nydC2Z; Wed, 26 Apr 2017 12:32:27 +0200 (CEST)
Received: from localhost (p578a821c.dip0.t-ipconnect.de [87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id D64501E199C;
	Wed, 26 Apr 2017 12:32:26 +0200 (CEST)
Date: Wed, 26 Apr 2017 12:34:15 +0200
From: Andreas Reichel <Andreas.Reichel@tngtech.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170426103415.GA4637@tng>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-3-andreas.reichel@tngtech.com>
	<CAJTo0LaJWXe_QfhbOi-Xi9WPYpwgL0Z59=A+PLy-TJRLf+fu5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaJWXe_QfhbOi-Xi9WPYpwgL0Z59=A+PLy-TJRLf+fu5A@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic patch 2/5] wic: Use argparse instead of optparse
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
X-List-Received-Date: Wed, 26 Apr 2017 10:32:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Description: message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2017 at 08:58:44PM +0100, Burton, Ross wrote:

>=20
> On 21 April 2017 at 13:11, Andreas J. Reichel <andreas.reichel@tngtech.=
com>
> wrote:
>=20
>     * optparse is deprecated and will not be developed further
>     =A0 =A0 (see: https://docs.python.org/2/library/optparse.html)
>     * argparse supports subcommands, which simplifies definition of
>     =A0 =A0 arguments and options
>     * reimplement help mechanism through sub-subcommands
>=20
>=20
> This results in a behaviour change and breaks the selftest:
>=20
> FAIL [0.535s]: test_unsupported_subcommand (oeqa.selftest.wic.Wic)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
> =A0 File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-sel=
ftest/
> build/meta/lib/oeqa/utils/decorators.py", line 109, in wrapped_f
> =A0 =A0 return func(*args, **kwargs)
> =A0 File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-sel=
ftest/
> build/meta/lib/oeqa/selftest/wic.py", line 163, in test_unsupported_sub=
command
> =A0 =A0 ignore_status=3DTrue).status)
> AssertionError: 1 !=3D 2
>=20
Dear Ross,

I see three possible strategies in fixing this problem:
- Change the code to keep current return values / behavior
- Adapt the unit test to fit the new code
- Write a less complex patch for just adding the option
  "--keep-partition-images" without migration to argparse

Which way would you prefer it?

Andreas

> Ross

--=20
Andreas Reichel=20
Dipl.-Phys. (Univ.)=20
Software Consultant

Andreas.Reichel@tngtech.com=20
+49-174-3180074

TNG Technology Consulting GmbH, Betastr. 13a, 85774 Unterf=F6hring
Gesch=E4ftsf=FChrer: Henrik Klagges, Christoph Stock, Dr. Robert Dahlke
Sitz: Unterf=F6hring * Amtsgericht M=FCnchen * HRB 135082

