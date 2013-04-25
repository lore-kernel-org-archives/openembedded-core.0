Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVHwE-0007wy-43
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 10:54:00 +0200
Message-ID: <5178EAFC.5040704@communistcode.co.uk>
Date: Thu, 25 Apr 2013 09:36:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
Subject: Re: [PATCH] connman: update to 1.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 08:54:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25/04/13 03:13, Guo Chunrong-B40290 wrote:
> Hello,
>   I build connman with toolchain(64bit).
>
> The following error:
> | powerpc64-poky-linux-gcc   -mhard-float  -m64 -mcpu=3De5500 --sysroot=
=3D/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020d=
s-64b -DHAVE_CONFIG_H -I.  -I./include -I./src -I./gdbus  -I/local/home/b=
19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/includ=
e/dbus-1.0 -I/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysro=
ots/p5020ds-64b/usr/lib64/dbus-1.0/include   -I/local/home/b19537/gcr/ope=
nsource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I=
/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-6=
4b/usr/lib64/glib-2.0/include   -pthread -I/local/home/b19537/gcr/opensou=
rce/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I/loc=
al/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/u=
sr/lib64/glib-2.0/include  -DCONNMAN_PLUGIN_BUILTIN -DSTATEDIR=3D\""/var/=
run/connman"\" -DPLUGINDIR=3D\""/usr/lib64/connman/plugins"\" -DSCRIPTDIR=
=3D\""/usr/lib64/connman/scripts"\" -DSTORAGEDIR=3D\""/var/lib/connman\""=
 -DVPN_STORAGEDIR=3D\""/var/lib/connman-vpn\"" -DCONFIGDIR=3D\""/etc/conn=
man\"" -O2 -pipe -g -feliminate-unused-debug-types -g -c -o tools/supplic=
ant.o tools/supplicant.c
> | plugins/tist.c: In function 'set_custom_baud_rate':
> | plugins/tist.c:283:18: error: 'TCGETS2' undeclared (first use in this=
 function)
> | plugins/tist.c:283:18: note: each undeclared identifier is reported o=
nly once for each function it appears in
> | plugins/tist.c:291:18: error: 'TCSETS2' undeclared (first use in this=
 function)
> | powerpc64-poky-linux-gcc   -mhard-float  -m64 -mcpu=3De5500 --sysroot=
=3D/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020d=
s-64b -DHAVE_CONFIG_H -I.  -I./include -I./src -I./gdbus  -I/local/home/b=
19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/includ=
e/dbus-1.0 -I/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysro=
ots/p5020ds-64b/usr/lib64/dbus-1.0/include   -I/local/home/b19537/gcr/ope=
nsource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I=
/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-6=
4b/usr/lib64/glib-2.0/include   -pthread -I/local/home/b19537/gcr/opensou=
rce/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I/loc=
al/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/u=
sr/lib64/glib-2.0/include  -DCONNMAN_PLUGIN_BUILTIN -DSTATEDIR=3D\""/var/=
run/connman"\" -DPLUGINDIR=3D\""/usr/lib64/connman/plugins"\" -DSCRIPTDIR=
=3D\""/usr/lib64/connman/scripts"\" -DSTORAGEDIR=3D\""/var/lib/connman\""=
 -DVPN_STORAGEDIR=3D\""/var/lib/connman-vpn\"" -DCONFIGDIR=3D\""/etc/conn=
man\"" -O2 -pipe -g -feliminate-unused-debug-types -g -c -o gdhcp/common.=
o gdhcp/common.c
> | powerpc64-poky-linux-gcc   -mhard-float  -m64 -mcpu=3De5500 --sysroot=
=3D/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020d=
s-64b -DHAVE_CONFIG_H -I.  -I./include -I./src -I./gdbus  -I/local/home/b=
19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/includ=
e/dbus-1.0 -I/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysro=
ots/p5020ds-64b/usr/lib64/dbus-1.0/include   -I/local/home/b19537/gcr/ope=
nsource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I=
/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-6=
4b/usr/lib64/glib-2.0/include   -pthread -I/local/home/b19537/gcr/opensou=
rce/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I/loc=
al/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/u=
sr/lib64/glib-2.0/include  -DCONNMAN_PLUGIN_BUILTIN -DSTATEDIR=3D\""/var/=
run/connman"\" -DPLUGINDIR=3D\""/usr/lib64/connman/plugins"\" -DSCRIPTDIR=
=3D\""/usr/lib64/connman/scripts"\" -DSTORAGEDIR=3D\""/var/lib/connman\""=
 -DVPN_STORAGEDIR=3D\""/var/lib/connman-vpn\"" -DCONFIGDIR=3D\""/etc/conn=
man\"" -O2 -pipe -g -feliminate-unused-debug-types -g -c -o gdhcp/client.=
o gdhcp/client.c
> | powerpc64-poky-linux-gcc   -mhard-float  -m64 -mcpu=3De5500 --sysroot=
=3D/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020d=
s-64b -DHAVE_CONFIG_H -I.  -I./include -I./src -I./gdbus  -I/local/home/b=
19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/includ=
e/dbus-1.0 -I/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysro=
ots/p5020ds-64b/usr/lib64/dbus-1.0/include   -I/local/home/b19537/gcr/ope=
nsource/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I=
/local/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-6=
4b/usr/lib64/glib-2.0/include   -pthread -I/local/home/b19537/gcr/opensou=
rce/poky/buildmaster/tmp/sysroots/p5020ds-64b/usr/include/glib-2.0 -I/loc=
al/home/b19537/gcr/opensource/poky/buildmaster/tmp/sysroots/p5020ds-64b/u=
sr/lib64/glib-2.0/include  -DCONNMAN_PLUGIN_BUILTIN -DSTATEDIR=3D\""/var/=
run/connman"\" -DPLUGINDIR=3D\""/usr/lib64/connman/plugins"\" -DSCRIPTDIR=
=3D\""/usr/lib64/connman/scripts"\" -DSTORAGEDIR=3D\""/var/lib/connman\""=
 -DVPN_STORAGEDIR=3D\""/var/lib/connman-vpn\"" -DCONFIGDIR=3D\""/etc/conn=
man\"" -O2 -pipe -g -feliminate-unused-debug-types -g -c -o gdhcp/server.=
o gdhcp/server.c
> | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /local/home/b19537/gcr/openso=
urce/poky/buildmaster/tmp/work/ppc64e5500-poky-linux/connman/1.12-r19.0/t=
emp/log.do_compile.24096 for further information)
> $<50>ERROR: Task 6 (/local/home/b19537/gcr/opensource/poky/meta/recipes=
-connectivity/connman/connman_1.12.bb, do_compile) failed with exit code =
'1'
> $<50>NOTE: Tasks Summary: Attempted 1684 tasks of which 1107 didn't nee=
d to be rerun and 1 failed.
> No currently running tasks (1684 of 1691)
>
> Can this be avoided?
>
> Thanks,
> chunrong
>
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembe=
dded-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
> Sent: Wednesday, April 24, 2013 10:26 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Jack Mitchell
> Subject: [OE-core] [PATCH] connman: update to 1.13
>
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> - Removed upstream commited patch
> - Updated git tag srcrev
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   .../connman/connman/add-in.h-for-ipv6.patch          | 20 -----------=
---------
>   .../connman/{connman_1.12.bb =3D> connman_1.13.bb}     |  6 +++---
>   2 files changed, 3 insertions(+), 23 deletions(-)  delete mode 100644=
 meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
>   rename meta/recipes-connectivity/connman/{connman_1.12.bb =3D> connma=
n_1.13.bb} (78%)
>
> diff --git a/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv=
6.patch b/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.pat=
ch
> deleted file mode 100644
> index 8ee0b6f..0000000
> --- a/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch=

> +++ /dev/null
> @@ -1,20 +0,0 @@
> -
> -The 3.8 Kernel headers for if_bridge.h uses the in6_addr struct -which=
 is defined by netinet/in.h which is not included prior.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: git/src/tethering.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/tethering.c
> -+++ git/src/tethering.c
> -@@ -35,6 +35,7 @@
> - #include <string.h>
> - #include <fcntl.h>
> - #include <linux/if_tun.h>
> -+#include <netinet/in.h>
> - #include <linux/if_bridge.h>
> -
> - #include "connman.h"
> diff --git a/meta/recipes-connectivity/connman/connman_1.12.bb b/meta/r=
ecipes-connectivity/connman/connman_1.13.bb
> similarity index 78%
> rename from meta/recipes-connectivity/connman/connman_1.12.bb
> rename to meta/recipes-connectivity/connman/connman_1.13.bb
> index 5ba4032..4f23538 100644
> --- a/meta/recipes-connectivity/connman/connman_1.12.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.13.bb
> @@ -1,13 +1,13 @@
>   require connman.inc
>  =20
> -# 1.12 tag
> -SRCREV =3D "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
> +# 1.13 tag
> +SRCREV =3D "96fcd8871531c9012135110769618d65a3523b4d"
>   SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connman/connman.gi=
t \
>               file://0001-plugin.h-Change-visibility-to-default-for-deb=
ug-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
>               file://inet-fix-ip-cleanup-functions.patch \
> -            file://add-in.h-for-ipv6.patch"
> +            "
>   S =3D "${WORKDIR}/git"
>   PR =3D "${INC_PR}.0"
>  =20
> --
> 1.8.2.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Looks like one for upstream, I'll chase it up.

Cheers,
Jack.

--=20

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--




