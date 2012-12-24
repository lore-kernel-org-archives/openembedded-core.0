Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TnH9x-0003Qp-CI
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 00:10:17 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2012 14:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,349,1355126400"; d="scan'208";a="262271941"
Received: from unknown (HELO [10.255.12.150]) ([10.255.12.150])
	by orsmga002.jf.intel.com with ESMTP; 24 Dec 2012 14:55:20 -0800
Message-ID: <50D8DD58.4040904@linux.intel.com>
Date: Mon, 24 Dec 2012 14:55:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1356015955-24078-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1356015955-24078-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] telepathy-mission-control: upgrade to 5.14.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 23:10:17 -0000
X-Groupsio-MsgNum: 33079
Content-Type: multipart/mixed; boundary="------------090907090503060409090603"

--------------090907090503060409090603
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2012 07:05 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   ...n-control_5.13.0.bb => telepathy-mission-control_5.14.0.bb} |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.13.0.bb => telepathy-mission-control_5.14.0.bb} (87%)
>

There was a problem building this with MUT, not sure if it should be 
/usr/bin/python vs the python-native image, I was building an x86_64 image.

I saw a similar issue with telepathy-idle, will send that log on that 
thread.

Sau!

> diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
> similarity index 87%
> rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
> rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
> index 55ae117..7caacb4 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
> @@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
>
>   SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
>
> -PR = "r1"
> +PR = "r0"
>
>   inherit autotools pkgconfig
>
> @@ -32,7 +32,7 @@ FILES_libmissioncontrol-server = "${libdir}/libmissioncontrol-server.so.*"
>
>   FILES_libmissioncontrol-dev = "${libdir}/libmissioncontrol.* \
>                                  ${includedir}/libmissioncontrol/ \
> -                	       ${libdir}/pkgconfig/libmissioncontrol.pc"
> +                               ${libdir}/pkgconfig/libmissioncontrol.pc"
>   FILES_libmissioncontrol-config-dev = "${libdir}/libmissioncontrol-config.*"
>   FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
>
> @@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
>   FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
>   FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
>
> -SRC_URI[md5sum] = "8b0c82136467d1188d4fa7f032cd3beb"
> -SRC_URI[sha256sum] = "b546da6bd1a1ac16f8a1db67b7673673e007ecaf9844da405c50acbcef0118eb"
> +SRC_URI[md5sum] = "483fa8860891815a540ecf1bb9155122"
> +SRC_URI[sha256sum] = "58e0047f5292836c2c35e1603a908b3ac20a5c0b183869514c63de339fd48a30"
>

--------------090907090503060409090603
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.28655"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.28655"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 8
make  all-recursive
make[1]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0'
Making all in data
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/data'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/data'
Making all in m4
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/m4'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/m4'
Making all in tools
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/tools=
'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/tools'
Making all in xml
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/xml'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/xml'
Making all in mission-control-plugins
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/missi=
on-control-plugins'
{ echo '#include "mcp-signals-marshal.h"' && \
	  glib-genmarshal --body --prefix=3D_mcp_marshal mcp-signals-marshal.list;=
 } \
	    > mcp-signals-marshal.c
glib-genmarshal --header --prefix=3D_mcp_marshal mcp-signals-marshal.list \
	  > mcp-signals-marshal.h
make  all-am
make[3]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/missi=
on-control-plugins'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc    -m64 --sysroot=3D/intel/builds/world/tmp/sysroots/qemux86-64 -DHA=
VE_CONFIG_H -I. -I.. -pthread -I/intel/builds/world/tmp/sysroots/qemux86-64=
/usr/include/telepathy-1.0 -I/intel/builds/world/tmp/sysroots/qemux86-64/us=
r/include/dbus-1.0 -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/db=
us-1.0/include -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/gl=
ib-2.0 -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/inclu=
de   -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/=
intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/dbus-1.0/include -I/inte=
l/builds/world/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/intel/builds=
/world/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include   -pthread -I/intel=
/builds/world/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/intel/builds/=
world/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include   -I.. -I.. -DG_LOG_=
DOMAIN=3D\"mc-plugins\" -DMCP_API_VERSION=3D5.5 -DMCP_ABI_VERSION=3D0   -Wa=
ll -Wextra -Wdeclaration-after-statement -Wshadow -Wstrict-prototypes -Wmis=
sing-prototypes -Wmissing-declarations -Wsign-compare -Wnested-externs -Wpo=
inter-arith -Wformat-security -Winit-self -Wno-missing-field-initializers -=
Wno-deprecated-declarations -Wno-unused-parameter -O2 -pipe -g -feliminate-=
unused-debug-types -DENABLE_DEBUG -c -o mcp-signals-marshal.lo mcp-signals-=
marshal.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 --sysroot=
=3D/intel/builds/world/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I.. -pt=
hread -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/telepathy-1=
.0 -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/in=
tel/builds/world/tmp/sysroots/qemux86-64/usr/lib/dbus-1.0/include -I/intel/=
builds/world/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/intel/builds/w=
orld/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include -I/intel/builds/world=
/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/intel/builds/world/tmp/sys=
roots/qemux86-64/usr/lib/dbus-1.0/include -I/intel/builds/world/tmp/sysroot=
s/qemux86-64/usr/include/glib-2.0 -I/intel/builds/world/tmp/sysroots/qemux8=
6-64/usr/lib/glib-2.0/include -pthread -I/intel/builds/world/tmp/sysroots/q=
emux86-64/usr/include/glib-2.0 -I/intel/builds/world/tmp/sysroots/qemux86-6=
4/usr/lib/glib-2.0/include -I.. -I.. -DG_LOG_DOMAIN=3D\"mc-plugins\" -DMCP_=
API_VERSION=3D5.5 -DMCP_ABI_VERSION=3D0 -Wall -Wextra -Wdeclaration-after-s=
tatement -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declar=
ations -Wsign-compare -Wnested-externs -Wpointer-arith -Wformat-security -W=
init-self -Wno-missing-field-initializers -Wno-deprecated-declarations -Wno=
-unused-parameter -O2 -pipe -g -feliminate-unused-debug-types -DENABLE_DEBU=
G -c mcp-signals-marshal.c  -fPIC -DPIC -o .libs/mcp-signals-marshal.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 --sysroot=
=3D/intel/builds/world/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I.. -pt=
hread -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/telepathy-1=
.0 -I/intel/builds/world/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/in=
tel/builds/world/tmp/sysroots/qemux86-64/usr/lib/dbus-1.0/include -I/intel/=
builds/world/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/intel/builds/w=
orld/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include -I/intel/builds/world=
/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/intel/builds/world/tmp/sys=
roots/qemux86-64/usr/lib/dbus-1.0/include -I/intel/builds/world/tmp/sysroot=
s/qemux86-64/usr/include/glib-2.0 -I/intel/builds/world/tmp/sysroots/qemux8=
6-64/usr/lib/glib-2.0/include -pthread -I/intel/builds/world/tmp/sysroots/q=
emux86-64/usr/include/glib-2.0 -I/intel/builds/world/tmp/sysroots/qemux86-6=
4/usr/lib/glib-2.0/include -I.. -I.. -DG_LOG_DOMAIN=3D\"mc-plugins\" -DMCP_=
API_VERSION=3D5.5 -DMCP_ABI_VERSION=3D0 -Wall -Wextra -Wdeclaration-after-s=
tatement -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declar=
ations -Wsign-compare -Wnested-externs -Wpointer-arith -Wformat-security -W=
init-self -Wno-missing-field-initializers -Wno-deprecated-declarations -Wno=
-unused-parameter -O2 -pipe -g -feliminate-unused-debug-types -DENABLE_DEBU=
G -c mcp-signals-marshal.c -o mcp-signals-marshal.o >/dev/null 2>&1
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc    -m64 --sysroot=3D/intel/builds/world/tmp/sysroots/qemux86-64 -Wall -=
Wextra -Wdeclaration-after-statement -Wshadow -Wstrict-prototypes -Wmissing=
-prototypes -Wmissing-declarations -Wsign-compare -Wnested-externs -Wpointe=
r-arith -Wformat-security -Winit-self -Wno-missing-field-initializers -Wno-=
deprecated-declarations -Wno-unused-parameter -O2 -pipe -g -feliminate-unus=
ed-debug-types -DENABLE_DEBUG -export-symbols-regex "^(mcp_)" -no-undefined=
 -version-info "4":"1":"4" -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
o libmission-control-plugins.la -rpath /usr/lib debug.lo account.lo account=
-storage.lo dbus-acl.lo dispatch-operation.lo dispatch-operation-policy.lo =
loader.lo request.lo request-policy.lo mcp-signals-marshal.lo -ltelepathy-g=
lib   -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -lglib-2.0   -pthread -lgmodule-=
2.0 -lrt -lgio-2.0 -lgobject-2.0 -lglib-2.0   =20
x86_64-poky-linux-libtool: link: rm -fr  .libs/libmission-control-plugins.a=
 .libs/libmission-control-plugins.exp .libs/libmission-control-plugins.la .=
libs/libmission-control-plugins.lai .libs/libmission-control-plugins.so .li=
bs/libmission-control-plugins.so.0 .libs/libmission-control-plugins.so.0.4.=
1 .libs/libmission-control-plugins.ver
x86_64-poky-linux-libtool: link: x86_64-poky-linux-nm  .libs/debug.o .libs/=
account.o .libs/account-storage.o .libs/dbus-acl.o .libs/dispatch-operation=
.o .libs/dispatch-operation-policy.o .libs/loader.o .libs/request.o .libs/r=
equest-policy.o .libs/mcp-signals-marshal.o   | sed -n -e 's/^.*[	 ]\([ABCD=
GIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | se=
d '/ __gnu_lto/d' | /intel/builds/world/tmp/sysroots/x86_64-linux//bin/sed =
's/.* //' | sort | uniq > .libs/libmission-control-plugins.exp
x86_64-poky-linux-libtool: link: /bin/grep -E -e "^(mcp_)" ".libs/libmissio=
n-control-plugins.exp" > ".libs/libmission-control-plugins.expT"
x86_64-poky-linux-libtool: link: mv -f ".libs/libmission-control-plugins.ex=
pT" ".libs/libmission-control-plugins.exp"
x86_64-poky-linux-libtool: link: echo "{ global:" > .libs/libmission-contro=
l-plugins.ver
x86_64-poky-linux-libtool: link:  cat .libs/libmission-control-plugins.exp =
| sed -e "s/\(.*\)/\1;/" >> .libs/libmission-control-plugins.ver
x86_64-poky-linux-libtool: link:  echo "local: *; };" >> .libs/libmission-c=
ontrol-plugins.ver
x86_64-poky-linux-libtool: link:  x86_64-poky-linux-gcc    -m64 --sysroot=
=3D/intel/builds/world/tmp/sysroots/qemux86-64 -shared  -fPIC -DPIC  .libs/=
debug.o .libs/account.o .libs/account-storage.o .libs/dbus-acl.o .libs/disp=
atch-operation.o .libs/dispatch-operation-policy.o .libs/loader.o .libs/req=
uest.o .libs/request-policy.o .libs/mcp-signals-marshal.o   /intel/builds/w=
orld/tmp/sysroots/qemux86-64/usr/lib/libtelepathy-glib.so -L/intel/builds/w=
orld/tmp/sysroots/qemux86-64/usr/lib /intel/builds/world/tmp/sysroots/qemux=
86-64/usr/lib/libdbus-glib-1.so /intel/builds/world/tmp/sysroots/qemux86-64=
/usr/lib/libdbus-1.so /intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/l=
ibgio-2.0.so /intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/libgmodule=
-2.0.so -ldl -lz -lresolv /intel/builds/world/tmp/sysroots/qemux86-64/usr/l=
ib/libgobject-2.0.so /intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/li=
bgthread-2.0.so /intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/libffi.=
so /intel/builds/world/tmp/sysroots/qemux86-64/usr/lib/libglib-2.0.so -lpth=
read -lrt  -m64 --sysroot=3D/intel/builds/world/tmp/sysroots/qemux86-64 -O2=
 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -pthread   -pthread -Wl,-so=
name -Wl,libmission-control-plugins.so.0 -Wl,-version-script -Wl,.libs/libm=
ission-control-plugins.ver -o .libs/libmission-control-plugins.so.0.4.1
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libmission-control-p=
lugins.so.0" && ln -s "libmission-control-plugins.so.0.4.1" "libmission-con=
trol-plugins.so.0")
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libmission-control-p=
lugins.so" && ln -s "libmission-control-plugins.so.0.4.1" "libmission-contr=
ol-plugins.so")
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libmission-=
control-plugins.a  debug.o account.o account-storage.o dbus-acl.o dispatch-=
operation.o dispatch-operation-policy.o loader.o request.o request-policy.o=
 mcp-signals-marshal.o
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libmission-=
control-plugins.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libmission-control-=
plugins.la" && ln -s "../libmission-control-plugins.la" "libmission-control=
-plugins.la" )
make[3]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/missio=
n-control-plugins'
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/missio=
n-control-plugins'
Making all in plugins
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/plugi=
ns'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/plugin=
s'
Making all in src
make[2]: Entering directory `/intel/builds/world/tmp/work/x86_64-poky-linux=
/telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/src'
( cd . && glib-mkenums \
		--fhead "#include \"mcd-enum-types.h\"\n#define g_intern_static_string(s)=
 (s)\n" \
		--fprod "\n/* enumerations from \"@filename@\" */" \
		--ftail "\n#define __MCD_ENUM_TYPES_C__\n" \
		--vhead "GType\n@enum_name@_get_type (void)\n{\n  static GType etype =3D =
0;\n  if (etype =3D=3D 0) {\n    static const G@Type@Value values[] =3D {" =
\
		--vprod "      { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
		--vtail "      { 0, NULL, NULL }\n    };\n    etype =3D g_@type@_register=
_static (g_intern_static_string (\"@EnumName@\"), values);\n  }\n  return e=
type;\n}\n" \
	    mcd-account.h mcd-account-conditions.h mcd-account-manager.h mcd-accou=
nt-manager-default.h mcd-debug.h mcd-mission.h mcd-operation.h mcd-master.h=
 mcd-manager.h mcd-connection.h mcd-connection-plugin.h mcd-connection-serv=
ice-points.h mcd-channel.h mcd-dispatcher.h mcd-service.h mcd-transport.h m=
cd-storage.h   ) > xgen-getc \
	&& cp xgen-getc mcd-enum-types.c  \
	&& rm -f xgen-getc
/bin/mkdir -p _gen
/usr/bin/python ../tools/glib-gtypes-generator.py \
		_gen/mcd.xml _gen/gtypes mc
{ echo '#include "_gen/signals-marshal.h"' && \
	glib-genmarshal --body --prefix=3D_mcd_ext_marshal _gen/signals-marshal.li=
st; } \
	> _gen/signals-marshal.c
xsltproc  --xinclude ../tools/identity.xsl \
		../xml/Connection_Manager_Interface_Account_Storage.xml > _gen/Connection=
_Manager_Interface_Account_Storage.xml
glib-genmarshal --header --prefix=3D_mcd_ext_marshal _gen/signals-marshal.l=
ist > _gen/signals-marshal.h
/bin/mkdir -p _gen
/bin/mkdir -p _gen
/bin/mkdir -p _gen
xsltproc  --xinclude ../tools/identity.xsl \
		../xml/Account_Interface_External_Password_Storage.xml > _gen/Account_Int=
erface_External_Password_Storage.xml
xsltproc  --xinclude ../tools/identity.xsl \
		../xml/Account_Interface_Conditions.xml > _gen/Account_Interface_Conditio=
ns.xml
xsltproc  --xinclude ../tools/identity.xsl \
		../xml/Account_Manager_Interface_Hidden.xml > _gen/Account_Manager_Interf=
ace_Hidden.xml
/bin/mkdir -p _gen
/usr/bin/python ../tools/glib-gtypes-generator.py \
		_gen/mcd.xml _gen/gtypes mc
xsltproc  --xinclude ../tools/identity.xsl \
		dispatcher.xml > _gen/dispatcher.xml
Traceback (most recent call last):
  File "../tools/glib-gtypes-generator.py", line 283, in <module>
    dom =3D xml.dom.minidom.parse(argv[0])
  File "/usr/lib/python2.7/xml/dom/minidom.py", line 1920, in parse
    return expatbuilder.parse(file)
  File "/usr/lib/python2.7/xml/dom/expatbuilder.py", line 924, in parse
    result =3D builder.parseFile(fp)
  File "/usr/lib/python2.7/xml/dom/expatbuilder.py", line 211, in parseFile
    parser.Parse("", True)
xml.parsers.expat.ExpatError: no element found: line 1, column 0
Traceback (most recent call last):
  File "../tools/glib-gtypes-generator.py", line 283, in <module>
    dom =3D xml.dom.minidom.parse(argv[0])
  File "/usr/lib/python2.7/xml/dom/minidom.py", line 1920, in parse
    return expatbuilder.parse(file)
  File "/usr/lib/python2.7/xml/dom/expatbuilder.py", line 924, in parse
    result =3D builder.parseFile(fp)
  File "/usr/lib/python2.7/xml/dom/expatbuilder.py", line 211, in parseFile
    parser.Parse("", True)
xml.parsers.expat.ExpatError: no element found: line 1, column 0
make[2]: *** [_gen/gtypes.h] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [_gen/gtypes-body.h] Error 1
rm _gen/dispatcher.xml _gen/Account_Interface_External_Password_Storage.xml=
 _gen/Connection_Manager_Interface_Account_Storage.xml _gen/Account_Interfa=
ce_Conditions.xml _gen/Account_Manager_Interface_Hidden.xml
make[2]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/intel/builds/world/tmp/work/x86_64-poky-linux/=
telepathy-mission-control/5.14.0-r0/telepathy-mission-control-5.14.0'
make: *** [all] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see /intel/builds/world/tmp/work/x86_64=
-poky-linux/telepathy-mission-control/5.14.0-r0/temp/log.do_compile.28655 f=
or further information)

--------------090907090503060409090603--
