Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C30C7713B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:16:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Feb 2016 02:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="926078963"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2016 02:16:00 -0800
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
	IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 29 Feb 2016 10:15:42 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.157]) by
	IRSMSX156.ger.corp.intel.com ([169.254.3.132]) with mapi id
	14.03.0248.002; Mon, 29 Feb 2016 10:15:42 +0000
From: "Constantin, Costin C" <costin.c.constantin@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/kernel.py: Add new file
	destined for kernel related tests [YP#7202]: Test for linux-dummy The
	new
	kernel.py file is intended for kernel related test cases. The test for
	linux-dummy will ensure it is in good shape and...
Thread-Index: AQHRbOgjxIuYPiRBMEakxz/Ar6I9vZ9C2b8A
Date: Mon, 29 Feb 2016 10:15:42 +0000
Message-ID: <2B8B4B6BB45F5242AFEC714E022A4B4A46CB099C@IRSMSX101.ger.corp.intel.com>
References: <1456047951-28027-1-git-send-email-costin.c.constantin@intel.com>
	<5437205.k9xUkGe2xD@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5437205.k9xUkGe2xD@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/kernel.py: Add new file destined for kernel related tests [YP#7202]: Test for linux-dummy The new kernel.py file is intended for kernel related test cases. The test for linux-dummy will ensure it is in good shape and...
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
X-List-Received-Date: Mon, 29 Feb 2016 10:16:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Paul. Something happened to the commit message. I sent it previously=
 to my e-mail and looked fine, but I guess I did something wrong in the  en=
d.
I'll check as per your recommendations.

Cheers,

Costin=20

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Sunday, February 21, 2016 10:41 PM
To: Constantin, Costin C <costin.c.constantin@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/selftest/kernel.py: Add new file destin=
ed for kernel related tests [YP#7202]: Test for linux-dummy The new kernel.=
py file is intended for kernel related test cases. The test for linux-dummy=
 will ensure it is in good shape and...

Hi Costin,

On Sun, 21 Feb 2016 11:45:51 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>

Commit messages should start with a "shortlog" (one line description of the
change) and then the commit message should be separated from that by a blan=
k line so that it's not all crammed into the subject.

> ---
>  meta/lib/oeqa/selftest/kernel.py | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/kernel.py
>=20
> diff --git a/meta/lib/oeqa/selftest/kernel.py
> b/meta/lib/oeqa/selftest/kernel.py new file mode 100644 index=20
> 0000000..3fe3517
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/kernel.py
> @@ -0,0 +1,29 @@
> +import os
> +import oeqa.utils.ftools as ftools
> +from oeqa.selftest.base import oeSelfTest from oeqa.utils.commands=20
> +import runCmd, bitbake, get_bb_var from oeqa.utils.decorators import=20
> +testcase
> +
> +class KernelTests(oeSelfTest):
> +    def  test_dummy_kernel(self):
> +        """
> +        [YP#7202]
> +        - test that linux-dummy target can be used as kernel provider=20
> +for
> an image +        - check no "multiple providers are available for" messa=
ge
> is received while building the image +        """
> +        config_param =3D 'PREFERRED_PROVIDER_virtual/kernel =3D "linux-d=
ummy"'
> +        self.append_config(config_param)

Having set this, I would suggest verifying that it's actually taken effect,=
 since it's common for this to be set within the distro/machine configurati=
on.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

