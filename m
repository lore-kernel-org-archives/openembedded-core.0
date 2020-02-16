Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5494B60581
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=9190; q=dns/txt; s=axis-central1;
	t=1581857549; x=1613393549;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=HI4Q+KxHYaOxbqjKgnho9fbL0saoWQLlyTdkHB0EF8k=;
	b=IC4a+4xWpXbEgefkbY0/3EdLbYDLLGGfa2BNypGo36nzPhquAtgoT/u5
	lCORonHnTU6+VKoDAWssm+EdCc0Rgskq/fsMyEez9WL+4CoAVld7zSOWe
	Lb9aoRI+Zl16DG7qwgK7Zi8erwW1U3qUSaCQUCJN5thOhlA7UytvPbI72
	GW700Ga3DFCKZluWpo8kCVI+sD6DxpD9duT+HVEs2Tt+2mXrcJPb81Xr8
	8R7MOfdImV2dlyGzSpbGMmdSDUzmiAvK49NeGqqvgTHpVQZ2H2cIN9qNG
	y0LGBpW9FSjOMxxSLH5nBAweEuyKZiG7/MnMg+QAklmvL77DuA5zefkYl Q==;
IronPort-SDR: 84XHoNJXlJgeVuUjOWDmKqexQhPW1uQYw6iIqAL+e9H5G0J61EJTDGxeyaoijQ9tDYftoml9io
	K/JLoYf8bkT7RC5gBHa5l3LwmQhU0E2I2414iz8E/9yHueiOFPBTb+Tc8JhsMJYps175j43PeA
	U1p7rCllsYggREXq1fq7Q97o/W3chzKPGqQcbId8UVUNTgjgFf0gUlBC7CFRC/71vq2GeeWcIS
	oIrvMLxqsnGtAv7jafYy+UQT0CnOAEluWQ6Z8EtOu+LFWUk42ZwZIDnQNG9a14EKKZtjwdIBWr
	4f8=
X-IronPort-AV: E=Sophos;i="5.70,448,1574118000"; 
   d="scan'208";a="5468004"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Thread-Topic: [OE-core] [PATCH] fix various, innocuous typos
Thread-Index: AQHV5J3Gc0GahJtRsEGL8bOv0czUiKgdw3Yw
Date: Sun, 16 Feb 2020 12:52:27 +0000
Message-ID: <0e84f991adc74cbc9de3abcbb8dc3cfc@XBOX03.axis.com>
References: <alpine.LFD.2.21.2002160247270.2008500@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002160247270.2008500@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fix various, innocuous typos
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
X-List-Received-Date: Sun, 16 Feb 2020 12:52:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 16 februari 2020 08:50
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] [PATCH] fix various, innocuous typos
>=20
> Corrections:
>=20
>   - environment
>   - variable
>   - accommodate
>   - conversion
>   - compatible
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
> index 75f0f2c3e3..359f240b0b 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -243,7 +243,7 @@ def testimage_main(d):
>      if d.getVar("TEST_TARGET") =3D=3D "qemu":
>          fstypes =3D [fs for fs in fstypes if fs in supported_fstypes]
>          if not fstypes:
> -            bb.fatal('Unsupported image type built. Add a comptible imag=
e to '
> +            bb.fatal('Unsupported image type built. Add a compatible ima=
ge to '
>                       'IMAGE_FSTYPES. Supported types: %s' %
>                       ', '.join(supported_fstypes))
>      qfstype =3D fstypes[0]
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 1c586a3bc6..751424d1b6 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -1,7 +1,7 @@
>  # Standards are great! Everyone has their own. In an effort to standardi=
ze licensing
>  # names, common-licenses will use the SPDX standard license names. In or=
der to not
>  # break the non-standardized license names that we find in LICENSE, we'l=
l set
> -# up a bunch of VarFlags to accomodate non-SPDX license names.
> +# up a bunch of VarFlags to accommodate non-SPDX license names.
>  #
>  # We should really discuss standardizing this field, but that's a longer=
 term goal.
>  # For now, we can do this and it should grab the most common LICENSE
> naming variations.
> diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/man=
ual/eclipse-plugin.json
> index 9869150dcf..d77d0e673b 100644
> --- a/meta/lib/oeqa/manual/eclipse-plugin.json
> +++ b/meta/lib/oeqa/manual/eclipse-plugin.json
> @@ -82,7 +82,7 @@
>              ],
>              "execution": {
>                  "1": {
> -                    "action": "Launch a QEMU of target enviroment.(Refer=
ence to case \"ADT - Launch qemu by eclipse\") ",
> +                    "action": "Launch a QEMU of target environment.(Refe=
rence to case \"ADT - Launch qemu by eclipse\") ",
>                      "expected_results": ""
>                  },
>                  "2": {
> @@ -164,7 +164,7 @@
>              ],
>              "execution": {
>                  "1": {
> -                    "action": "Launch a QEMU of target enviroment.(Refer=
ence to case \"ADT - Launch qemu by eclipse\") ",
> +                    "action": "Launch a QEMU of target environment.(Refe=
rence to case \"ADT - Launch qemu by eclipse\") ",
>                      "expected_results": ""
>                  },
>                  "2": {
> @@ -319,4 +319,4 @@
>              "summary": "Eclipse_Poky_installation_and_setup"
>          }
>      }
> -]
> \ No newline at end of file
> +]
> diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
> index 09e77c19fe..01c38c24e6 100644
> --- a/meta/lib/oeqa/sdk/context.py
> +++ b/meta/lib/oeqa/sdk/context.py
> @@ -136,7 +136,7 @@ class OESDKTestContextExecutor(OETestContextExecutor)=
:
>          sdk_envs =3D OESDKTestContextExecutor._get_sdk_environs(args.sdk=
_dir)
>          if not sdk_envs:
>              raise argparse_oe.ArgumentUsageError("No available SDK "\
> -                   "enviroments found at %s" % args.sdk_dir, self.name)
> +                   "environments found at %s" % args.sdk_dir, self.name)
>=20
>          if args.list_sdk_env:
>              self._display_sdk_envs(logger.info, args, sdk_envs)
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index e2f91bcb6c..5886862d6c 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1741,7 +1741,7 @@ class DevtoolUpgradeTests(DevtoolBase):
>                           when building the kernel.
>           """
>          kernel_provider =3D get_bb_var('PREFERRED_PROVIDER_virtual/kerne=
l')
> -        # Clean up the enviroment
> +        # Clean up the environment
>          bitbake('%s -c clean' % kernel_provider)
>          tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
>          tempdir_cfg =3D tempfile.mkdtemp(prefix=3D'config_qa')
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/li=
b/oeqa/selftest/cases/oelib/buildhistory.py
> index 6d80827652..d4664bd0df 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
> @@ -45,7 +45,7 @@ class TestBlobParsing(OESelftestTestCase):
>=20
>      def test_blob_to_dict(self):
>          """
> -        Test convertion of git blobs to dictionary
> +        Test conversion of git blobs to dictionary
>          """
>          from oe.buildhistory_analysis import blob_to_dict
>          valuesmap =3D { "foo" : "1", "bar" : "2" }
> diff --git a/meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch b/=
meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
> index a09e2a257e..1823dfee3f 100644
> --- a/meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
> +++ b/meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
> @@ -985,7 +985,7 @@ index 7d9a34a..12f8fb8 100644
>   }
>=20
>   /**********************************************************************=
******
> -@@ -259,38 +263,39 @@ cpu-state-varible M.x86.mode. There are several po=
tential states:
> +@@ -259,38 +263,39 @@ cpu-state-variable M.x86.mode. There are several p=
otential states:

Don't change this. It is part of the patch context information. Even if the=
=20
part after the second @@ is just a comment, it matches information in the=20
existing file and that is no longer true if you change it. Moreover, it wil=
l=20
just be reset if someone refreshes the patch.

>=20
>   Each of the above 7 items are handled with a bit in the mode field.
>   ***********************************************************************=
*****/
> diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and=
-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Cro=
ss-building-and-testing-instructions.patch
> index eda5565371..14d0548b81 100644
> --- a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testin=
g-instructions.patch
> +++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testin=
g-instructions.patch
> @@ -533,7 +533,7 @@ index 0000000000..b67b468466
>  +  Here, 'my-wrapper' must ensure that the value it sees for
>  +  'GCONV_PATH' will be seen by the dynamic linker, and thus 'tst-foo'
>  +  itself.  (The wrapper supplied with GLIBC simply preserves the
> -+  values of *all* enviroment variables, with a fixed set of
> ++  values of *all* environment variables, with a fixed set of
>  +  exceptions.)
>  +
>  +  If your wrapper is a shell script, take care to correctly propagate
> diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.pat=
ch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> index e6998f6e68..e59144a13c 100644
> --- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> +++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
> @@ -148,7 +148,7 @@ index 2d7a6f5..1c53585 100644
>  -        printf("*** being found. The easiest way to fix this is to remo=
ve the old version\n");
>  -        printf("*** of LIBXML, but you can also set the XML2_CONFIG env=
ironment to point to the\n");
>  -        printf("*** correct copy of xml2-config. (In this case, you wil=
l have to\n");
> --        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or=
 edit /etc/ld.so.conf\n");
> +-        printf("*** modify your LD_LIBRARY_PATH environment variable, o=
r edit /etc/ld.so.conf\n");

You cannot change this. Then the patch will no longer apply since this=20
part removes stuff from the upstream contents.

>  -        printf("*** so that the correct libraries are found at run-time=
))\n");
>  -    }
>  -  return 1;
> diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybo=
otchartgui/pybootchartgui/draw.py
> index add5c53882..53324b9f8b 100644
> --- a/scripts/pybootchartgui/pybootchartgui/draw.py
> +++ b/scripts/pybootchartgui/pybootchartgui/draw.py
> @@ -308,7 +308,7 @@ sec_w_base =3D 1 # the width of a second
>  proc_h =3D 16 # the height of a process
>  leg_s =3D 10
>  MIN_IMG_W =3D 800
> -CUML_HEIGHT =3D 2000 # Increased value to accomodate CPU and I/O Graphs
> +CUML_HEIGHT =3D 2000 # Increased value to accommodate CPU and I/O Graphs
>  OPTIONS =3D None
>=20
>  def extents(options, xscale, trace):
>=20
> --
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --

//Peter


