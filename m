Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8591165C88;
	Wed,  4 Mar 2015 08:45:15 +0000 (UTC)
Received: by wghn12 with SMTP id n12so45145968wgh.1;
	Wed, 04 Mar 2015 00:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qoEWEmbz2K3T5+MmksUTeugRevTiU2dwcu9VZyU5JRw=;
	b=w6BacQL5ioOqjEFH8AXFTxa+kVqh9HodytP5NBG+gfZoKB8zhDSiI8tUDxqiwz4wDy
	II4wDNRYbpd8qlyBP4vzPxZ/4nQ2GBoucGEcJ1tG0Fq1Z8J6g/aUHMHYwKEtxSAA977l
	l/V42yTcC3qRQm+7ksx00mUocB92BINJgCB/N3kkWdYvDzrMwxNf+ksIdft++3FhaQwL
	5BL8xaLrCqfyvoQ5Tek+n664yOEIQgP7JKE9vPyiTtbWMKHWaKX3F5g3TG+X7Msk4gB0
	yV976CwxU5moXqxU3PE+THHOJSWW2oc4+89VJz0QeUAMhJYOtyBoXulKAsag0v9tys80
	30KA==
X-Received: by 10.194.193.9 with SMTP id hk9mr5979027wjc.42.1425458716109;
	Wed, 04 Mar 2015 00:45:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b4sm24182663wic.2.2015.03.04.00.45.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 00:45:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2015 09:45:16 +0100
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150304084516.GH2337@jama>
References: <20150302220550.8A2F450367@opal.openembedded.org>
	<20150304022312.GF2337@jama> <54F67EBD.4060609@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54F67EBD.4060609@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: improve patch application performance
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
X-List-Received-Date: Wed, 04 Mar 2015 08:45:22 -0000
X-Groupsio-MsgNum: 62934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Content-Disposition: inline

--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 10:40:45PM -0500, Bruce Ashfield wrote:
> On 2015-03-03 9:23 PM, Martin Jansa wrote:
> > On Mon, Mar 02, 2015 at 10:05:50PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 148c78e0f5de2689de3ad9beaa9f6de618d87758
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D148c78e0f5de2689de3ad9beaa9f6de618d87758
> >>
> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Date:   Mon Mar  2 16:36:41 2015 -0500
> >>
> >> kern-tools: improve patch application performance
> >>
> >> Update the SRCREV for the following incremental improvement in patch
> >> processing time:
> >>
> >>      kgit-meta: skip patches on non-leaf nodes
> >>
> >>      In a similar way as commit 0768d697 [kgit-meta: dont run kgit-s2q
> >>      for
> >>      non-leaf nodes], we can save even more processing time by not even
> >>      analysing and linking patches if we aren't on the leaf node of the
> >>      tree.
> >>
> >>      This early exit can save nearly 95% of the time required to "patc=
h"
> >>      a tree when no changes are actually applied.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Not sure if it's related to this, but today's world build is failing
> > with:
> >
>=20
> No luck here. I was able to do a clean build of qemux86 against the 3.19
> kernel.
>=20
> I'll keep trying, but am looking for a reproducer at this point.

with qemux86-64 it failed a bit later:
|   CC      drivers/gpu/drm/i915/i915_suspend.o
|   LD      drivers/gpu/drm/panel/built-in.o
|   CC      lib/earlycpio.o
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/uapi/linux/ethtool.h:17:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/ethtool.h:16,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/netdevice.h:43,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/net/inet_sock.h:24,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/net/inet_connection_sock.h:23,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/net/ipv4/inet_connection_sock.c:19:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/if_ether.h:24:33: fatal error: uapi/linux/if_ether.h: N=
o such file or directory
|  #include <uapi/linux/if_ether.h>
|                                  ^
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/arch/x86/include/uapi/asm/bootparam.h:32:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/arch/x86/include/asm/x86_init.h:5,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/arch/x86/include/asm/mpspec.h:6,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/arch/x86/include/asm/smp.h:11,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/smp.h:59,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/topology.h:33,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/gfp.h:8,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/slab.h:14,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/net/ipv6/addrlabel.c:16:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/screen_info.h:4:36: fatal error: uapi/linux/screen_info=
=2Eh: No such file or directory
|  #include <uapi/linux/screen_info.h>
|                                     ^
| compilation terminated.
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/spinlock.h:287:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/rcupdate.h:38,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/idr.h:18,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/kernfs.h:14,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/sysfs.h:15,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/kobject.h:21,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/cdev.h:4,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/drm/drmP.h:36,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/drivers/gpu/drm/i915/i915_suspend.c:27:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/spinlock_api_smp.h:190:34: fatal error: linux/rwlock_ap=
i_smp.h: No such file or directory
| compilation terminated.
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/lib/earlycpio.c:28:0:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/earlycpio.h:4:25: fatal error: linux/types.h: No such f=
ile or directory
|  #include <linux/types.h>
|                          ^
| compilation terminated.
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/uapi/linux/timex.h:56:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/timex.h:56,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/sched.h:19,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/lib/dump_stack.c:8:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/time.h:7:27: fatal error: linux/time64.h: No such file =
or directory
| compilation terminated.
| compilation terminated.
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/fs/nfs/super.c:33:0:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/sunrpc/clnt.h:23:32: fatal error: linux/sunrpc/timer.h:=
 No such file or directory
| compilation terminated.
| make[3]: *** [lib/earlycpio.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[6]: *** [drivers/gpu/drm/i915/i915_suspend.o] Error 1
| make[5]: *** [drivers/gpu/drm/i915] Error 2
| make[4]: *** No rule to make target `net/ipv6/ip6_fib.o', needed by `net/=
ipv6/ipv6.o'.  Stop.
| make[4]: *** Waiting for unfinished jobs....
|   CC      net/ipv6/route.o
| make[4]: *** [drivers/gpu/drm] Error 2
| make[3]: *** [lib/dump_stack.o] Error 1
| make[3]: *** [drivers/gpu] Error 2
| make[3]: *** Waiting for unfinished jobs....
| make[4]: *** [net/ipv4/inet_connection_sock.o] Error 1
| make[2]: *** [lib] Error 2
| make[2]: *** Waiting for unfinished jobs....
| make[4]: *** [net/ipv6/addrlabel.o] Error 1
| make[4]: *** [fs/nfs/super.o] Error 1
| make[3]: *** [net/ipv4] Error 2
| make[3]: *** Waiting for unfinished jobs....
| make[4]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/scripts/Makefile.build: No such file or directory
| make[4]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/scripts/Makefile.build'.  Stop.
| make[5]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/scripts/Makefile.build: No such file or directory
| make[5]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/scripts/Makefile.build'.  Stop.
| x86_64-oe-linux-gcc: error: /home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k-shared/qemux86-64/kernel-source/net/ipv6/route.c: No such file or directo=
ry
| make[3]: *** [fs/nfs] Error 2
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [net/mac80211] Error 2
| make[4]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/scripts/Makefile.build: No such file or directory
| make[4]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/scripts/Makefile.build'.  Stop.
| x86_64-oe-linux-gcc: fatal error: no input files
| compilation terminated.
| make[5]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/scripts/Makefile.build: No such file or directory
| make[5]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/scripts/Makefile.build'.  Stop.
| make[3]: *** [fs/notify] Error 2
| make[5]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/scripts/Makefile.build: No such file or directory
| make[5]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/scripts/Makefile.build'.  Stop.
| make[4]: *** [drivers/i2c/algos] Error 2
| make[4]: *** Waiting for unfinished jobs....
| make[4]: *** [drivers/i2c/busses] Error 2
| make[4]: *** [net/ipv6/route.o] Error 1
| make[3]: *** [net/ipv6] Error 2
| make[4]: *** [drivers/i2c/muxes] Error 2
| make[2]: *** [net] Error 2
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86-64/kernel-source/fs/nls/nls_iso8859-1.c: No such fi=
le or directory
| make[4]: *** [fs/nls/nls_iso8859-1.o] Error 2
| make[3]: *** [fs/nls] Error 2
| make[2]: *** [fs] Error 2
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86-64/kernel-source/drivers/i2c/i2c-core.c: No such fi=
le or directory
| make[4]: *** [drivers/i2c/i2c-core.o] Error 2
| make[3]: *** [drivers/i2c] Error 2
| make[2]: *** [drivers] Error 2
| make[1]: *** [sub-make] Error 2
| make: *** [__sub-make] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.19+gitAU=
TOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_compile.30660)
NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task do_=
compile: Failed

> > ERROR: Function failed: do_kernel_configme (log file is located at /hom=
e/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.1=
9+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9ec=
ed9b-r0/temp/log.do_kernel_configme.29401
> > Log data follows:
> > | DEBUG: Executing shell function do_kernel_configme
> > | NOTE: kernel configme
> > | [INFO] Configuring target/machine combo: "standard/qemux86"
> > | [INFO] collecting configs in .meta/meta-series
> > | mv: cannot move `/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux=
86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/linux-qemu=
x86-standard-build/.tmp.config.PKIfLNkSVj' to `.meta/cfg/standard/common-pc=
/qemux86-standard-config-3.19': No such file or directory
> > | creation of pre-processed config data failed
> > | config of "standard/qemux86" failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_kernel_configme (log file is located at /h=
ome/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3=
=2E19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> > NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task=
 do_kernel_configme: Failed
> > ERROR: Task 30091 (/home/jenkins/oe/world/shr-core/openembedded-core/me=
ta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed wit=
h exit code '1'
> >
> >>
> >> ---
> >>
> >>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b=
/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> index 80d26f9..131c5e9 100644
> >> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=
=3D5;endline=3D9;md5=3Dd8d1d729a70c
> >>
> >>   DEPENDS =3D "git-native"
> >>
> >> -SRCREV =3D "cab17f884998b43692244a863dea6f505c7f67af"
> >> +SRCREV =3D "0c51a3d02fa54726141f32824b11d0676960e0a5"
> >>   PR =3D "r12"
> >>   PV =3D "0.2+git${SRCPV}"
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT2xhwACgkQN1Ujt2V2gBzhYwCeKRXpjgJAfCGu8jtVYc3fVDKU
910An3AlD9ZkRweZ6w3qIp0UoO6Oq1rl
=o4mv
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--
