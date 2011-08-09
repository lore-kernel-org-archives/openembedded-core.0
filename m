Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QqhiI-0006Ss-22
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 10:31:02 +0200
Received: by wwe32 with SMTP id 32so4389176wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 01:26:33 -0700 (PDT)
Received: by 10.227.60.201 with SMTP id q9mr5298829wbh.52.1312878387237;
	Tue, 09 Aug 2011 01:26:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fc2sm5126620wbb.1.2011.08.09.01.26.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 01:26:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b88f61a1da4e2e8ca52bddc442e03db104f4c5d9.1312869726.git.tong.lin@intel.com>
Date: Tue, 9 Aug 2011 10:26:21 +0200
Message-Id: <7ACFBC3A-B0E4-47B1-8D7A-0BAED11B04D7@dominion.thruhere.net>
References: <cover.1312869726.git.tong.lin@intel.com>
	<b88f61a1da4e2e8ca52bddc442e03db104f4c5d9.1312869726.git.tong.lin@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] valgrind: supporting Linux kernel 3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2011 08:31:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 aug. 2011, om 10:30 heeft Lin Tong het volgende geschreven:

>    The old valgrind package do not support for Linux kernel 3.0, only =
for kernel 2.6 and 2.4
>    Now adding the new configuration to the configure.in file to =
support Linux kernel 3.0
>=20
>    This commit fixes the problem in valgrind[YOCTO #1129]
>=20
>    Signed-off-by: Lin Tong <tong.lin@intel.com>
> ---
> .../valgrind-3.6.1/fix_3.0_kernel_support.patch    |   26 =
++++++++++++++++++++
> meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
> 2 files changed, 28 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch=

>=20
> diff --git =
a/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.pat=
ch =
b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.pat=
ch
> new file mode 100644
> index 0000000..54fc481
> --- /dev/null
> +++ =
b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.pat=
ch
> @@ -0,0 +1,26 @@
> +valgrind:Add "3.0.*" statement to the "case" statement for supporting =
the kernel 3.0.* .
> +
> +Signed-off-by: Tong Lin <tong.lin@intel.com>
> +
> +Upstream-Status: Pending
> +
> +diff --git a/configure.in b/configure.in
> +index 3878619..f09720e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -229,10 +229,13 @@ case "${host_os}" in
> +         	    AC_MSG_RESULT([2.4 family (${kernel})])
> +         	    AC_DEFINE([KERNEL_2_4], 1, [Define to 1 if you're =
using Linux 2.4.x])
> +         	    ;;
> +-
> ++             3.0.*)
> ++                    AC_MSG_RESULT([3.0 family (${kernel})])
> ++                    AC_DEFINE([KERNEL_3_0], 1, [Define to 1 if =
you're using Linux 3.0.x])

And that will break with 3.1.x, 3.2.x, etc. 3.1.x is approx 8 weeks =
away.=


