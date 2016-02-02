Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D325770EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:32:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 13:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="904196166"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 13:32:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 10:32:27 +1300
Message-ID: <1709638.qS8Gzah4d3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B1201A.8080602@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<1693758.K4BiiZTEt9@peggleto-mobl.ger.corp.intel.com>
	<56B1201A.8080602@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 13/20] oeqa/oetest.py: Fix missing oeqa.runtime import.
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
X-List-Received-Date: Tue, 02 Feb 2016 21:32:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

OK, then you need to say that in the commit message rather than saying =
that=20
you're fixing a missing import - it's an optimisation, rather than a fi=
x.

Cheers,
Paul

On Tue, 02 Feb 2016 15:31:06 An=EDbal Lim=F3n wrote:
> Yes, but i think is better to import only the module that we need. :)=

>=20
> On 02/02/2016 03:25 PM, Paul Eggleton wrote:
> > On Tue, 02 Feb 2016 09:14:16 An=EDbal Lim=F3n wrote:
> >> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> >>=20
> >> oeqa.runtime import is used in TestContext to get data fixtures
> >> directory.
> >>=20
> >> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> >> ---
> >>=20
> >>  meta/lib/oeqa/oetest.py | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> >> index 28577ef..16705cc 100644
> >> --- a/meta/lib/oeqa/oetest.py
> >> +++ b/meta/lib/oeqa/oetest.py
> >>=20
> >> @@ -18,7 +18,7 @@ except ImportError:
> >>      pass
> >> =20
> >>  import logging
> >>=20
> >> -import oeqa
> >> +import oeqa.runtime
> >>=20
> >>  from oeqa.utils.decorators import LogResults, gettag, getResults
> >> =20
> >>  logger =3D logging.getLogger("BitBake")
> >=20
> > Are you sure this actually does anything? Importing the parent modu=
le
> > should already allow access to child modules, AIUI.
> >=20
> > Cheers,
> > Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

