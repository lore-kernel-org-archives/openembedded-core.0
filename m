Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27CCB60962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 06:00:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Jul 2015 23:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,536,1432623600"; d="scan'208";a="753624543"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2015 23:00:29 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.216]) by
	IRSMSX154.ger.corp.intel.com ([169.254.12.253]) with mapi id
	14.03.0224.002; Fri, 24 Jul 2015 07:00:29 +0100
From: "Constantin, Costin C" <costin.c.constantin@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] oeqa/buildoptions.py: automate test case
	929: check for correct GPL licenses
Thread-Index: AQHQxUvBccLTZPsSAEK8vLRMmmHH3Z3o/skAgAEh9LA=
Date: Fri, 24 Jul 2015 06:00:28 +0000
Message-ID: <2B8B4B6BB45F5242AFEC714E022A4B4A3DF8E759@IRSMSX101.ger.corp.intel.com>
References: <1437658844-12604-1-git-send-email-costin.c.constantin@intel.com>
	<2222392.Tt1iFe0I6f@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2222392.Tt1iFe0I6f@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oeqa/buildoptions.py: automate test case 929: check for correct GPL licenses
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
X-List-Received-Date: Fri, 24 Jul 2015 06:00:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thank you for the reply. :)  I got your point and i guess you're right. May=
be i over exaggerated.=20
Does this mean the auto TC will not be considered as it is now? Should i re=
-send it or will you just erase that line and=20
consider it as it is?

Costin=20

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Thursday, July 23, 2015 4:40 PM
To: Constantin, Costin C
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oeqa/buildoptions.py: automate test case =
929: check for correct GPL licenses

Hi Costin,

On Thursday 23 July 2015 16:40:44 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 30=20
> ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py index e79be9e..ab009f2 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -132,6 +132,36 @@ class BuildImagesTest(oeSelfTest):
>          res =3D bitbake("core-image-directfb", ignore_status=3DTrue)
>          self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed=20
> to build. Please check logs for further details.\nbitbake output %s" %
> res.output)
>
>=20
> +    @testcase(929)
> +    def test_gpl_licenses(self):
> +        """
> +        Test for checking that correct GPL licenses are used when
> explicitly required.=20
> +        """
> +        self.add_command_to_tearDown('cleanup-workdir')

I really don't think we should be calling cleanup-workdir here. If we have =
specific things to bitbake -c clean, by all means do that - but cleanup-wor=
kdir goes through and deletes everything that's not current, which is exces=
sive for this one test.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

