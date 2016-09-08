Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E40E65CB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 22:40:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Sep 2016 15:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,302,1470726000"; d="scan'208";a="1037292543"
Received: from jzhang80-mac02.jf.intel.com ([10.24.2.27])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2016 15:40:34 -0700
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <1473362414-29683-1-git-send-email-sgw@linux.intel.com>
Date: Thu, 8 Sep 2016 15:40:34 -0700
Message-Id: <1D92F6AA-3031-4AF8-BD6B-15DC2B28543D@linux.intel.com>
References: <1473362414-29683-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: fix: cp command cannot find tests/Makeflie
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
X-List-Received-Date: Thu, 08 Sep 2016 22:40:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Note the patch is based on 958c05b on master-next branch in poky.

Thanks

> On Sep 8, 2016, at 12:20 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>=20
> bitbake qemu
>=20
> This error shows up:
>=20
> ERROR: qemu-2.7.0-r1 do_install_ptest_base: Function failed:
> do_install_ptest_base
> ...
> cp: cannot stat '...tmp/work/core2-64-poky-linux/qemu/2.7.0-r1
> /qemu-2.7.0/tests/Makefile: No such file or directory
> ...
>=20
> Commit 46e7b70699d8bf4db08c8bb5111974318dd5416d in qemu project
> renamed tests/Makefile to tests/Makefile.include, we apply the
> same change in recipe accordingly to fix this issue.
>=20
> Fixes [YOCTO #10245]
> ---
> meta/recipes-devtools/qemu/qemu.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc =
b/meta/recipes-devtools/qemu/qemu.inc
> index d724aa4..b46e7f7 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -76,7 +76,7 @@ do_install_ptest() {
> 	cp -rL ${B}/tests ${D}${PTEST_PATH}
> 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs =
-i rm -rf {}
>=20
> -	cp ${S}/tests/Makefile ${D}${PTEST_PATH}/tests
> +	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> }
>=20
> do_install () {
> --=20
> 2.7.4
>=20


