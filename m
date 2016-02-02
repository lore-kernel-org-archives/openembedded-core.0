Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2D6B74197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:19:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2016 13:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="875500303"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 13:19:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 10:19:23 +1300
Message-ID: <35476879.65FcALFN4F@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <caa6b2241883567d2453ac7fcc18cdef38bf6c3a.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<caa6b2241883567d2453ac7fcc18cdef38bf6c3a.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 15/20] classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
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
X-List-Received-Date: Tue, 02 Feb 2016 21:19:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 09:14:18 An=EDbal Lim=F3n wrote:
> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>=20
> Sometimes we need to load environment without show help information
> only useful when user is interacting with the SDK.
>=20
> For example: For test extensible SDK.
>=20
> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index 76308ec..fc96a4b 100644=

> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -291,7 +291,7 @@ sdk_ext_postinst() {
>  =09# so put it at the end of $PATH.
>  =09echo "export
> PATH=3D\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}=
" >>
> $env_setup_script
>=20
> -=09echo "printf 'SDK environment now set up; additionally you may no=
w run
> devtool to perform development tasks.\nRun devtool --help for further=

> details.\n'" >> $env_setup_script +=09echo "[ -z \$OE_SDK_EXT_SILENT =
] &&
> printf 'SDK environment now set up; additionally you may now run devt=
ool to
> perform development tasks.\nRun devtool --help for further details.\n=
'" >>
> $env_setup_script
>=20
>  =09# Warn if trying to use external bitbake and the ext SDK together=

>  =09echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attemptin=
g to use
> the extensible SDK in an environment set up to run bitbake - this may=
 lead
> to unexpected results. Please source this script in a new shell sessi=
on
> instead.') || true" >> $env_setup_script

Rather than adding another variable for this why not just redirect the =
output=20
to /dev/null ?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

