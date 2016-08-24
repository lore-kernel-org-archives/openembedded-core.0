Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EAF9260125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 00:41:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 23 Aug 2016 17:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,568,1464678000"; 
   d="scan'208";a="1006274"
Received: from dgilrut-mobl.amr.corp.intel.com ([10.254.19.98])
	by orsmga004.jf.intel.com with ESMTP; 23 Aug 2016 17:41:04 -0700
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <1471011020888.78139@saabgroup.com>
Date: Tue, 23 Aug 2016 17:41:06 -0700
Message-Id: <91A8506F-5CE5-4A57-A177-40E499A9284A@linux.intel.com>
References: <1471011020888.78139@saabgroup.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Wed, 24 Aug 2016 00:41:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Bruce,
Ping~~~
Could you or anyone have a look on this patch? It is for =
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9805

Thanks


> On Aug 12, 2016, at 7:10 AM, Waldo Mattias =
<Mattias.Waldo@saabgroup.com> wrote:
>=20
> The absence of certs/signing_key.* in $kerneldir made signing of
> out-of-tree kernel modules fail (silently). Add copying of these files
> during the shared_workdir task.
>=20
> Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
> ---
> meta/classes/kernel.bbclass | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6e3e81e..2bfd65c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -295,6 +295,8 @@ do_shared_workdir () {
>        cp .config $kerneldir/
>        mkdir -p $kerneldir/include/config
>        cp include/config/kernel.release =
$kerneldir/include/config/kernel.release
> +       mkdir -p $kerneldir/certs
> +       cp certs/signing_key.* $kerneldir/certs
>=20
>        # We can also copy over all the generated files and avoid =
special cases
>        # like version.h, but we've opted to keep this small until file =
creep starts
> --
> 2.9.2
>=20
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


