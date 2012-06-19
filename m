Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh13Q-0003bM-NC
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:13:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="out'?scan'208";a="159576849"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2012 09:02:31 -0700
Message-ID: <4FE0A296.5090809@linux.intel.com>
Date: Tue, 19 Jun 2012 09:02:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Buildhistory for the PACKAGE Reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:13:22 -0000
X-Groupsio-MsgNum: 23810
Content-Type: multipart/mixed; boundary="------------070803020400090803090809"

--------------070803020400090803090809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Please find attached the buildhistory_diff from 2 world builds with and 
without the PACKAGE Reorder.

All packages that changed should have PR bumps.

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


--------------070803020400090803090809
Content-Type: text/plain; charset=UTF-8;
 name="repackage_buildhistory_diff.out"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="repackage_buildhistory_diff.out"

packages/i586-poky-linux/alsa-lib/alsa-lib-dev: FILELIST: added "/usr/lib/a=
lsa-lib/smixer/smixer-sbase.la /usr/lib/alsa-lib/smixer/smixer-hda.la /usr/=
lib/alsa-lib/smixer/smixer-ac97.la"
  * PR changed from "r1" to "r2"
  * FILES: added "/usr/lib/alsa-lib/*.la /lib/lib*.so /lib/*.la /usr/lib/al=
sa-lib/smixer/*.la"
packages/i586-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 956 to=
 3896 (+307%)
  * PR changed from "r1" to "r2"
  * FILELIST: added "/usr/lib/alsa-lib/smixer/smixer-sbase.la /usr/lib/alsa=
-lib/smixer/smixer-hda.la /usr/lib/alsa-lib/smixer/smixer-ac97.la"
  *   * FILES: added "/usr/lib/alsa-lib/*.la /lib/lib*.so /lib/*.la /usr/li=
b/alsa-lib/smixer/*.la"
packages/i586-poky-linux/alsa-lib/alsa-lib: FILELIST: removed "/usr/lib/als=
a-lib/smixer/smixer-sbase.la /usr/lib/alsa-lib/smixer/smixer-hda.la /usr/li=
b/alsa-lib/smixer/smixer-ac97.la"
  * PR changed from "r1" to "r2"
  * FILES: added "/usr/lib/alsa-lib/smixer/*.so"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/apr-util/apr-util-dbg: RRECOMMENDS: added "util-li=
nux-libuuid-dbg"
packages/i586-poky-linux/apr-util/apr-util-dev: RRECOMMENDS: added "util-li=
nux-libuuid-dev"
packages/i586-poky-linux/apr-util/apr-util: RDEPENDS: added "util-linux-lib=
uuid (>=3D 2.21.1)"
packages/i586-poky-linux/at/at-dbg: RRECOMMENDS: removed "libpam-dbg"
packages/i586-poky-linux/at/at-dev: RRECOMMENDS: removed "libpam-dev"
packages/i586-poky-linux/at/at: RDEPENDS: removed "libpam (>=3D 1.1.5)"
packages/i586-poky-linux/cups/cups-dev: FILELIST: added "/usr/bin/cups-conf=
ig"
  * PR changed from "r3" to "r4"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /lib/*.la /usr/lib/cups/*.=
la"
packages/i586-poky-linux/cups/cups-doc: FILELIST: added "/usr/share/doc/cup=
s/index.html /usr/share/doc/cups/images/raster.png /usr/share/doc/cups/imag=
es/unsel.gif /usr/share/doc/cups/images/wait.gif /usr/share/doc/cups/images=
/right.gif /usr/share/doc/cups/images/smiley.jpg /usr/share/doc/cups/images=
/cups-raster-chain.png /usr/share/doc/cups/images/cups-block-diagram.png /u=
sr/share/doc/cups/images/sel.gif /usr/share/doc/cups/images/cups-icon.png /=
usr/share/doc/cups/images/generic.png /usr/share/doc/cups/cups-printable.cs=
s /usr/share/doc/cups/images/left.gif /usr/share/doc/cups/images/cups.png /=
usr/share/doc/cups/images/cups-postscript-chain.png /usr/share/doc/cups/cup=
s.css /usr/share/doc/cups/images/cups-command-chain.png /usr/share/doc/cups=
/images/color-wheel.png"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/cups/cups: FILELIST: removed "/usr/share/doc/cups/=
index.html /usr/share/doc/cups/images/raster.png /usr/share/doc/cups/images=
/unsel.gif /usr/share/doc/cups/images/wait.gif /usr/share/doc/cups/images/r=
ight.gif /usr/share/doc/cups/images/smiley.jpg /usr/share/doc/cups/images/c=
ups-raster-chain.png /usr/share/doc/cups/images/cups-block-diagram.png /usr=
/share/doc/cups/images/sel.gif /usr/share/doc/cups/images/cups-icon.png /us=
r/share/doc/cups/images/generic.png /usr/share/doc/cups/cups-printable.css =
/usr/share/doc/cups/images/left.gif /usr/share/doc/cups/images/color-wheel.=
png /usr/share/doc/cups/images/cups.png /usr/share/doc/cups/images/cups-pos=
tscript-chain.png /usr/share/doc/cups/cups.css /usr/share/doc/cups/images/c=
ups-command-chain.png /usr/bin/cups-config"
  * PR changed from "r3" to "r4"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/curl/curl-dev: FILELIST: removed all items "/usr/i=
nclude/curl/stdcheaders.h /usr/include/curl/multi.h /usr/include/curl/typec=
heck-gcc.h /usr/include/curl/curl.h /usr/lib/libcurl.la /usr/include/curl/c=
urlver.h /usr/lib/pkgconfig/libcurl.pc /usr/include/curl/mprintf.h /usr/lib=
/libcurl.so /usr/include/curl/easy.h /usr/include/curl/curlrules.h /usr/inc=
lude/curl/curlbuild.h"
  * PR changed from "r0" to "r1"
  * FILES: added "/usr/lib/curl/*.la /usr/bin/*-config /lib/lib*.so /lib/*.=
la"
packages/i586-poky-linux/curl/curl-dev: RDEPENDS: removed "libcurl"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/curl/curl-staticdev: FILELIST: removed all items "=
/usr/lib/libcurl.a"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/curl: PACKAGES: added "libcurl-staticdev"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/curl/libcurl-dev: FILELIST: added "/usr/include/cu=
rl/stdcheaders.h /usr/include/curl/multi.h /usr/include/curl/typecheck-gcc.=
h /usr/include/curl/curl.h /usr/lib/libcurl.la /usr/include/curl/curlver.h =
/usr/lib/pkgconfig/libcurl.pc /usr/include/curl/mprintf.h /usr/lib/libcurl.=
so /usr/include/curl/easy.h /usr/include/curl/curlrules.h /usr/include/curl=
/curlbuild.h"
  * PR changed from "r0" to "r1"
  * FILES: removed "/usr/lib/lib*.a"
packages/i586-poky-linux/curl/libcurl-dev: RDEPENDS: added "libcurl"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/curl/libcurl-dev: PKGSIZE changed from 5517 to 166=
705 (+2921%)
  * PR changed from "r0" to "r1"
  * FILELIST: added "/usr/include/curl/stdcheaders.h /usr/include/curl/mult=
i.h /usr/include/curl/typecheck-gcc.h /usr/include/curl/curl.h /usr/lib/lib=
curl.la /usr/include/curl/curlver.h /usr/lib/pkgconfig/libcurl.pc /usr/incl=
ude/curl/mprintf.h /usr/lib/libcurl.so /usr/include/curl/easy.h /usr/includ=
e/curl/curlrules.h /usr/include/curl/curlbuild.h"
  *   * FILES: removed "/usr/lib/lib*.a"
packages/i586-poky-linux/directfb/directfb-dev: FILELIST: added "/usr/bin/d=
irectfb-config"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /usr/lib/directfb/*.la /li=
b/*.la"
packages/i586-poky-linux/directfb/directfb: FILELIST: removed "/usr/bin/dir=
ectfb-config"
  * PR changed from "r11+svnr17386" to "r12+svnr17386"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/font-util/font-util-dev: FILELIST: added "/usr/sha=
re/aclocal/fontutil.m4"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/font-util/*.la"
packages/i586-poky-linux/font-util/font-util-dev: PKGSIZE changed from 217 =
to 14434 (+6551%)
  * FILELIST: added "/usr/share/aclocal/fontutil.m4"
  *   * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/font-util/*.la"
packages/i586-poky-linux/font-util/font-util-doc: FILELIST: added "/usr/sha=
re/man/man1/ucs2any.1 /usr/share/man/man1/bdftruncate.1"
packages/i586-poky-linux/font-util/font-util-doc: PKGSIZE changed from 0 to=
 2863 (+100%)
  * FILELIST: added "/usr/share/man/man1/ucs2any.1 /usr/share/man/man1/bdft=
runcate.1"
packages/i586-poky-linux/font-util/font-util: FILELIST: removed "/usr/share=
/man/man1/ucs2any.1 /usr/share/aclocal/fontutil.m4 /usr/share/man/man1/bdft=
runcate.1"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/gnome-icon-theme/gnome-icon-theme-dev: FILELIST: a=
dded "/usr/share/pkgconfig/gnome-icon-theme.pc"
  * PR changed from "r2" to "r3"
  * FILES: added "/usr/lib/gnome-icon-theme/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/gnome-icon-theme/gnome-icon-theme-dev: PKGSIZE cha=
nged from 0 to 133 (+100%)
  * PR changed from "r2" to "r3"
  * FILELIST: added "/usr/share/pkgconfig/gnome-icon-theme.pc"
  *   * FILES: added "/usr/lib/gnome-icon-theme/*.la /lib/lib*.so /lib/*.la=
"
packages/i586-poky-linux/gnome-icon-theme/gnome-icon-theme: FILELIST: remov=
ed "/usr/share/pkgconfig/gnome-icon-theme.pc"
  * PR changed from "r2" to "r3"
  * PR changed from "r2" to "r3"
packages/i586-poky-linux/gnome-keyring/gnome-keyring-dev: FILELIST: added "=
/usr/lib/gnome-keyring/gnome-keyring-pkcs11.la /usr/lib/gnome-keyring/devel=
/gkm-ssh-store-standalone.so /usr/lib/gnome-keyring/standalone/gkm-secret-s=
tore-standalone.la /usr/lib/gnome-keyring/devel/gkm-ssh-store-standalone.la=
 /usr/lib/gnome-keyring/devel/gkm-user-store-standalone.la /usr/lib/gnome-k=
eyring/devel/gkm-user-store-standalone.so /usr/lib/gnome-keyring/standalone=
/gkm-roots-store-standalone.la"
  * PR changed from "r6" to "r7"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/gnome-keyring/devel/*.la =
/usr/lib/gnome-keyring/standalone/*.la /usr/lib/gnome-keyring/*.la /usr/lib=
/gnome-keyring/devel/*.so"
packages/i586-poky-linux/gnome-keyring/gnome-keyring-dev: RDEPENDS: added "=
libgpg-error (>=3D 1.10) glib-2.0 (>=3D 2.32.3) libgcrypt (>=3D 1.5.0) libf=
fi (>=3D 3.0.10) eglibc (>=3D 2.15) libcap (>=3D 2.22)"
  * PR changed from "r6" to "r7"
packages/i586-poky-linux/gnome-keyring/gnome-keyring-dev: PKGSIZE changed f=
rom 172027 to 1118843 (+550%)
  * PR changed from "r6" to "r7"
  * FILELIST: added "/usr/lib/gnome-keyring/gnome-keyring-pkcs11.la /usr/li=
b/gnome-keyring/devel/gkm-ssh-store-standalone.so /usr/lib/gnome-keyring/st=
andalone/gkm-secret-store-standalone.la /usr/lib/gnome-keyring/devel/gkm-ss=
h-store-standalone.la /usr/lib/gnome-keyring/devel/gkm-user-store-standalon=
e.la /usr/lib/gnome-keyring/devel/gkm-user-store-standalone.so /usr/lib/gno=
me-keyring/standalone/gkm-roots-store-standalone.la"
  *   * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/gnome-keyring/devel/*=
.la /usr/lib/gnome-keyring/standalone/*.la /usr/lib/gnome-keyring/*.la /usr=
/lib/gnome-keyring/devel/*.so"
packages/i586-poky-linux/gnome-keyring/gnome-keyring: FILELIST: removed "/u=
sr/lib/gnome-keyring/gnome-keyring-pkcs11.la /usr/lib/gnome-keyring/devel/g=
km-ssh-store-standalone.so /usr/lib/gnome-keyring/standalone/gkm-secret-sto=
re-standalone.la /usr/lib/gnome-keyring/devel/gkm-ssh-store-standalone.la /=
usr/lib/gnome-keyring/devel/gkm-user-store-standalone.la /usr/lib/gnome-key=
ring/devel/gkm-user-store-standalone.so /usr/lib/gnome-keyring/standalone/g=
km-roots-store-standalone.la"
  * PR changed from "r6" to "r7"
  * FILES: removed "/lib/security/*.so"
  * PR changed from "r6" to "r7"
  * PR changed from "r6.0" to "r7.0"
  * PR changed from "r2" to "r3"
packages/i586-poky-linux/grub/grub-doc: FILELIST: added "/usr/share/info/gr=
ub-dev.info /usr/share/info/grub.info"
  * PR changed from "r7" to "r8"
  * FILES: removed "/usr/share" added "/usr/share/info /usr/share/doc /usr/=
share/gtk-doc /usr/share/man /usr/share/gnome/help"
packages/i586-poky-linux/grub/grub-doc: PKGSIZE changed from 0 to 292364 (+=
100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/info/grub-dev.info /usr/share/info/grub.inf=
o"
  *   * FILES: removed "/usr/share" added "/usr/share/info /usr/share/doc /=
usr/share/gtk-doc /usr/share/man /usr/share/gnome/help"
packages/i586-poky-linux/grub/grub-locale-ast: FILELIST: added "/usr/share/=
locale/ast/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-ast: PKGSIZE changed from 0 to 23=
380 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/ast/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-ca: FILELIST: added "/usr/share/l=
ocale/ca/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-ca: PKGSIZE changed from 0 to 458=
16 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/ca/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-da: FILELIST: added "/usr/share/l=
ocale/da/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-da: PKGSIZE changed from 0 to 424=
40 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/da/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-de: FILELIST: added "/usr/share/l=
ocale/de/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-de: PKGSIZE changed from 0 to 451=
31 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/de/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-fi: FILELIST: added "/usr/share/l=
ocale/fi/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-fi: PKGSIZE changed from 0 to 233=
64 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/fi/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-fr: FILELIST: added "/usr/share/l=
ocale/fr/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-fr: PKGSIZE changed from 0 to 437=
98 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/fr/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-hu: FILELIST: added "/usr/share/l=
ocale/hu/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-hu: PKGSIZE changed from 0 to 467=
34 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/hu/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-id: FILELIST: added "/usr/share/l=
ocale/id/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-id: PKGSIZE changed from 0 to 228=
16 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/id/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-it: FILELIST: added "/usr/share/l=
ocale/it/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-it: PKGSIZE changed from 0 to 443=
35 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/it/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-ko: FILELIST: added "/usr/share/l=
ocale/ko/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-ko: PKGSIZE changed from 0 to 253=
17 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/ko/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-nl: FILELIST: added "/usr/share/l=
ocale/nl/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-nl: PKGSIZE changed from 0 to 447=
01 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/nl/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-pl: FILELIST: added "/usr/share/l=
ocale/pl/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-pl: PKGSIZE changed from 0 to 240=
16 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/pl/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-ru: FILELIST: added "/usr/share/l=
ocale/ru/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-ru: PKGSIZE changed from 0 to 588=
05 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/ru/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-sv: FILELIST: added "/usr/share/l=
ocale/sv/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-sv: PKGSIZE changed from 0 to 133=
16 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/sv/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-uk: FILELIST: added "/usr/share/l=
ocale/uk/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-uk: PKGSIZE changed from 0 to 611=
70 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/uk/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-vi: FILELIST: added "/usr/share/l=
ocale/vi/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-vi: PKGSIZE changed from 0 to 258=
75 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/vi/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub-locale-zh-cn: FILELIST: added "/usr/shar=
e/locale/zh_CN/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/grub/grub-locale-zh-cn: PKGSIZE changed from 0 to =
37197 (+100%)
  * PR changed from "r7" to "r8"
  * FILELIST: added "/usr/share/locale/zh_CN/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub: FILELIST: removed "/usr/share/locale/ru=
/LC_MESSAGES/grub.mo /usr/share/locale/nl/LC_MESSAGES/grub.mo /usr/share/lo=
cale/it/LC_MESSAGES/grub.mo /usr/share/locale/vi/LC_MESSAGES/grub.mo /usr/s=
hare/locale/ast/LC_MESSAGES/grub.mo /usr/share/locale/sv/LC_MESSAGES/grub.m=
o /usr/share/locale/id/LC_MESSAGES/grub.mo /usr/share/info/grub-dev.info /u=
sr/share/locale/ca/LC_MESSAGES/grub.mo /usr/share/info/grub.info /usr/share=
/locale/fr/LC_MESSAGES/grub.mo /usr/share/locale/de/LC_MESSAGES/grub.mo /us=
r/share/locale/zh_CN/LC_MESSAGES/grub.mo /usr/share/locale/ko/LC_MESSAGES/g=
rub.mo /usr/share/locale/pl/LC_MESSAGES/grub.mo /usr/share/locale/fi/LC_MES=
SAGES/grub.mo /usr/share/locale/hu/LC_MESSAGES/grub.mo /usr/share/locale/uk=
/LC_MESSAGES/grub.mo /usr/share/locale/da/LC_MESSAGES/grub.mo"
  * PR changed from "r7" to "r8"
  * FILES: removed "/usr" added "/usr/bin/* /lib/*.so.* /usr/share/sounds /=
usr/lib/grub/* /var /com /usr/share/grub /usr/share/idl /usr/share/pixmaps =
/usr/libexec/* /usr/lib/lib*.so.* /usr/share/applications /sbin/* /usr/shar=
e/omf /bin/* /usr/sbin/* /usr/lib/bonobo/servers"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/gthumb/gthumb-dev: FILELIST: added "/usr/lib/gthum=
b/extensions/libpixbuf_savers.la /usr/lib/gthumb/extensions/libexport_tools=
.la /usr/lib/gthumb/extensions/libred_eye_removal.la /usr/lib/gthumb/extens=
ions/libraw_files.la /usr/lib/gthumb/extensions/libfile_viewer.la /usr/lib/=
gthumb/extensions/libbookmarks.la /usr/lib/gthumb/extensions/libgstreamer_u=
tils.la /usr/lib/gthumb/extensions/libsearch.la /usr/lib/gthumb/extensions/=
libedit_metadata.la /usr/lib/gthumb/extensions/libcomments.la /usr/lib/gthu=
mb/extensions/libfile_manager.la /usr/lib/gthumb/extensions/libphoto_import=
er.la /usr/lib/gthumb/extensions/liblist_tools.la /usr/lib/gthumb/extension=
s/libgstreamer_tools.la /usr/lib/gthumb/extensions/libimage_print.la /usr/l=
ib/gthumb/extensions/libchange_date.la /usr/lib/gthumb/extensions/librename=
_series.la /usr/lib/gthumb/extensions/libdesktop_background.la /usr/lib/gth=
umb/extensions/libimage_rotation.la /usr/lib/gthumb/extensions/libimage_vie=
wer.la /usr/lib/gthumb/extensions/libjpeg_utils.la /usr/lib/gthumb/extensio=
ns/libconvert_format.la /usr/lib/gthumb/extensions/libfile_tools.la /usr/li=
b/gthumb/extensions/libwebalbums.la /usr/lib/gthumb/extensions/libresize_im=
ages.la /usr/lib/gthumb/extensions/libimporter.la /usr/lib/gthumb/extension=
s/libcatalogs.la /usr/lib/gthumb/extensions/libslideshow.la"
  * PR changed from "r2" to "r3"
  * FILES: added "/lib/*.la /lib/lib*.so /usr/lib/gthumb/*.la /usr/lib/gthu=
mb/extensions/*.la"
packages/i586-poky-linux/gthumb/gthumb-dev: PKGSIZE changed from 352193 to =
424525 (+20%)
  * PR changed from "r2" to "r3"
  * FILELIST: added "/usr/lib/gthumb/extensions/libpixbuf_savers.la /usr/li=
b/gthumb/extensions/libexport_tools.la /usr/lib/gthumb/extensions/libred_ey=
e_removal.la /usr/lib/gthumb/extensions/libraw_files.la /usr/lib/gthumb/ext=
ensions/libfile_viewer.la /usr/lib/gthumb/extensions/libbookmarks.la /usr/l=
ib/gthumb/extensions/libgstreamer_utils.la /usr/lib/gthumb/extensions/libse=
arch.la /usr/lib/gthumb/extensions/libedit_metadata.la /usr/lib/gthumb/exte=
nsions/libcomments.la /usr/lib/gthumb/extensions/libfile_manager.la /usr/li=
b/gthumb/extensions/libphoto_importer.la /usr/lib/gthumb/extensions/liblist=
_tools.la /usr/lib/gthumb/extensions/libgstreamer_tools.la /usr/lib/gthumb/=
extensions/libimage_print.la /usr/lib/gthumb/extensions/libchange_date.la /=
usr/lib/gthumb/extensions/librename_series.la /usr/lib/gthumb/extensions/li=
bdesktop_background.la /usr/lib/gthumb/extensions/libimage_rotation.la /usr=
/lib/gthumb/extensions/libimage_viewer.la /usr/lib/gthumb/extensions/libjpe=
g_utils.la /usr/lib/gthumb/extensions/libconvert_format.la /usr/lib/gthumb/=
extensions/libfile_tools.la /usr/lib/gthumb/extensions/libwebalbums.la /usr=
/lib/gthumb/extensions/libresize_images.la /usr/lib/gthumb/extensions/libim=
porter.la /usr/lib/gthumb/extensions/libcatalogs.la /usr/lib/gthumb/extensi=
ons/libslideshow.la"
  *   * FILES: added "/lib/*.la /lib/lib*.so /usr/lib/gthumb/*.la /usr/lib/=
gthumb/extensions/*.la"
packages/i586-poky-linux/gthumb/gthumb: FILELIST: removed "/usr/lib/gthumb/=
extensions/libpixbuf_savers.la /usr/lib/gthumb/extensions/libexport_tools.l=
a /usr/lib/gthumb/extensions/libred_eye_removal.la /usr/lib/gthumb/extensio=
ns/libraw_files.la /usr/lib/gthumb/extensions/libfile_viewer.la /usr/lib/gt=
humb/extensions/libbookmarks.la /usr/lib/gthumb/extensions/libgstreamer_uti=
ls.la /usr/lib/gthumb/extensions/libsearch.la /usr/lib/gthumb/extensions/li=
bedit_metadata.la /usr/lib/gthumb/extensions/libcomments.la /usr/lib/gthumb=
/extensions/libfile_manager.la /usr/lib/gthumb/extensions/libphoto_importer=
.la /usr/lib/gthumb/extensions/liblist_tools.la /usr/lib/gthumb/extensions/=
libgstreamer_tools.la /usr/lib/gthumb/extensions/libimage_print.la /usr/lib=
/gthumb/extensions/libchange_date.la /usr/lib/gthumb/extensions/librename_s=
eries.la /usr/lib/gthumb/extensions/libdesktop_background.la /usr/lib/gthum=
b/extensions/libimage_rotation.la /usr/lib/gthumb/extensions/libimage_viewe=
r.la /usr/lib/gthumb/extensions/libjpeg_utils.la /usr/lib/gthumb/extensions=
/libconvert_format.la /usr/lib/gthumb/extensions/libfile_tools.la /usr/lib/=
gthumb/extensions/libwebalbums.la /usr/lib/gthumb/extensions/libresize_imag=
es.la /usr/lib/gthumb/extensions/libimporter.la /usr/lib/gthumb/extensions/=
libcatalogs.la /usr/lib/gthumb/extensions/libslideshow.la"
  * PR changed from "r2" to "r3"
  * FILES: added "/usr/lib/gthumb/extensions/*.extension /usr/lib/gthumb/ex=
tensions/*.so"
  * PR changed from "r2" to "r3"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/hdparm/hdparm-doc: FILELIST: added "/usr/share/man=
/man8/hdparm.8"
packages/i586-poky-linux/hdparm/hdparm-doc: PKGSIZE changed from 0 to 36564=
 (+100%)
  * FILELIST: added "/usr/share/man/man8/hdparm.8"
packages/i586-poky-linux/hdparm/hdparm: FILELIST: removed "/usr/share/man/m=
an8/hdparm.8" added "/usr/bin/wiper.sh"
  * FILES: removed "/sbin /usr/share/man" added "/usr/bin/* /lib/*.so.* /et=
c /var /com /usr/share/sounds /usr/share/idl /usr/share/pixmaps /usr/libexe=
c/* /usr/lib/lib*.so.* /usr/share/applications /sbin/* /usr/share/omf /bin/=
* /usr/lib/hdparm/* /usr/sbin/* /usr/lib/bonobo/servers /usr/share/hdparm"
packages/i586-poky-linux/hdparm/wiper: FILELIST: removed all items "/usr/bi=
n/wiper.sh"
packages/i586-poky-linux/icu/icu-dev: FILELIST: added "/usr/lib/icu/3.6/Mak=
efile.inc /usr/lib/icu/Makefile.inc /usr/bin/icu-config"
  * PR changed from "r7" to "r8"
  * FILES: added "/usr/bin/*-config /lib/*.la /lib/lib*.so /usr/lib/icu/ /u=
sr/lib/icu/*.la"
packages/i586-poky-linux/icu/icu: FILELIST: removed "/usr/lib/icu/3.6/Makef=
ile.inc /usr/lib/icu/Makefile.inc /usr/bin/icu-config"
  * PR changed from "r7" to "r8"
  * PR changed from "r7" to "r8"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/libarchive/libarchive-bin: RDEPENDS: added "libacl=
 (>=3D 2.2.51)"
packages/i586-poky-linux/libarchive/libarchive-dbg: RRECOMMENDS: added "lib=
acl-dbg"
packages/i586-poky-linux/libarchive/libarchive-dev: RRECOMMENDS: added "lib=
acl-dev"
packages/i586-poky-linux/libarchive/libarchive: RDEPENDS: added "libacl (>=
=3D 2.2.51)"
packages/i586-poky-linux/libassuan/libassuan-dev: FILELIST: added "/usr/bin=
/libassuan-config"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /usr/lib/libassuan/*.la /l=
ib/*.la"
packages/i586-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/bin/l=
ibassuan-config"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libevent/libevent-dbg: RRECOMMENDS: removed "libss=
l-dbg libcrypto-dbg"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libevent/libevent-dev: RRECOMMENDS: removed "libss=
l-dev libcrypto-dev"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libevent/libevent-dev: FILELIST: removed "/usr/lib=
/pkgconfig/libevent_openssl.pc /usr/lib/libevent_openssl.la /usr/lib/libeve=
nt_openssl.so"
  * PR changed from "r1" to "r2"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/libevent/*.la"
packages/i586-poky-linux/libevent/libevent-staticdev: FILELIST: removed "/u=
sr/lib/libevent_openssl.a"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libevent/libevent: FILELIST: removed "/usr/lib/lib=
event_openssl-2.0.so.5 /usr/lib/libevent_openssl-2.0.so.5.1.4"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libevent/libevent: RDEPENDS: removed "libcrypto (>=
=3D 1.0.0i) libssl (>=3D 1.0.0i)"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libgcc/libgcc-dbg: RRECOMMENDS: removed "eglibc-db=
g"
packages/i586-poky-linux/libgcc/libgcc-dev: RRECOMMENDS: removed all items =
"eglibc-dev"
packages/i586-poky-linux/libgcc/libgcc: RDEPENDS: removed all items "eglibc=
 (>=3D 2.15)"
  * PR changed from "r0" to "r1"
  * PR changed from "r1" to "r2"
  * PR changed from "r1" to "r2"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/libksba/libksba-dev: FILELIST: added "/usr/bin/ksb=
a-config"
  * PR changed from "r0" to "r1"
  * FILES: added "/usr/bin/*-config /usr/lib/libksba/*.la /lib/lib*.so /lib=
/*.la"
packages/i586-poky-linux/libksba/libksba: FILELIST: removed "/usr/bin/ksba-=
config"
  * PR changed from "r0" to "r1"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/libnfsidmap/libnfsidmap-dev: FILELIST: added "/usr=
/lib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/static.la"
  * PR changed from "r0" to "r1"
  * FILES: added "/usr/lib/libnfsidmap/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/libnfsidmap/libnfsidmap-dev: PKGSIZE changed from =
4381 to 6209 (+41%)
  * PR changed from "r0" to "r1"
  * FILELIST: added "/usr/lib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/=
static.la"
  *   * FILES: added "/usr/lib/libnfsidmap/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/libnfsidmap/libnfsidmap: FILELIST: removed "/usr/l=
ib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/static.la"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/libpcap/libpcap-dev: FILELIST: added "/usr/bin/pca=
p-config"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /lib/*.la /usr/lib/libpcap=
/*.la"
packages/i586-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/bin/pcap-=
config"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libpcre/libpcre-dev: FILELIST: removed "/usr/bin/p=
cretest /usr/bin/pcregrep"
  * PR changed from "r1" to "r2"
  * FILES: removed "/usr/bin/*" added "/usr/bin/*-config /lib/lib*.so /lib/=
*.la /usr/lib/libpcre/*.la"
packages/i586-poky-linux/libpcre/libpcre-dev: RDEPENDS: removed "libpcrepos=
ix (>=3D 8.21) eglibc (>=3D 2.15)" added "libpcreposix"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libpcre/libpcre: FILELIST: added "/usr/bin/pcretes=
t /usr/bin/pcregrep"
  * PR changed from "r1" to "r2"
  * FILES: removed "/usr/lib/libpcre.so.*" added "/usr/bin/* /lib/*.so.* /e=
tc /var /com /usr/libexec/* /usr/share/sounds /usr/lib/libpcre/* /usr/share=
/pixmaps /usr/share/idl /usr/share/libpcre /usr/lib/lib*.so.* /usr/share/ap=
plications /sbin/* /usr/share/omf /bin/* /usr/sbin/* /usr/lib/bonobo/server=
s"
packages/i586-poky-linux/libpcre/libpcre: RDEPENDS: added "libpcreposix (>=
=3D 8.21)"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libpcre/libpcre: PKGSIZE changed from 155124 to 23=
0088 (+48%)
  * PR changed from "r1" to "r2"
  * FILELIST: added "/usr/bin/pcretest /usr/bin/pcregrep"
  *   * FILES: removed "/usr/lib/libpcre.so.*" added "/usr/bin/* /lib/*.so.=
* /etc /var /com /usr/libexec/* /usr/share/sounds /usr/lib/libpcre/* /usr/s=
hare/pixmaps /usr/share/idl /usr/share/libpcre /usr/lib/lib*.so.* /usr/shar=
e/applications /sbin/* /usr/share/omf /bin/* /usr/sbin/* /usr/lib/bonobo/se=
rvers"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/libsamplerate0/libsamplerate0-dbg: RRECOMMENDS: ad=
ded "libsndfile1-dbg"
packages/i586-poky-linux/libsamplerate0/libsamplerate0-dev: RRECOMMENDS: ad=
ded "libsndfile1-dev"
packages/i586-poky-linux/libsamplerate0/libsamplerate0: RDEPENDS: added "li=
bsndfile1 (>=3D 1.0.25)"
  * PR changed from "r5" to "r6"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libuser/libuser-dev: FILELIST: added "/usr/lib/lib=
user/libuser_files.la /usr/lib/libuser/libuser_shadow.la"
  * PR changed from "r1" to "r2"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/libuser/*.la"
packages/i586-poky-linux/libuser/libuser: FILELIST: removed "/usr/lib/libus=
er/libuser_files.la /usr/lib/libuser/libuser_shadow.la"
  * PR changed from "r1" to "r2"
  * PR changed from "r8" to "r9"
packages/i586-poky-linux/libxml2/libxml2-dev: FILELIST: added "/usr/bin/xml=
2-config"
  * PR changed from "r8" to "r9"
  * FILES: added "/lib/lib*.so /usr/lib/libxml2/*.la /lib/*.la"
packages/i586-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/bin/xml2-=
config"
  * PR changed from "r8" to "r9"
packages/i586-poky-linux/ltp/ltp-doc: FILELIST: added "/opt/ltp/share/man/m=
an3/pattern.3 /opt/ltp/share/man/man1/ltp-pan.1 /opt/ltp/share/man/man1/iog=
en.1 /opt/ltp/share/man/man3/usctest.3 /opt/ltp/share/man/man1/doio.1 /opt/=
ltp/share/man/man3/str_to_bytes.3 /opt/ltp/share/man/man3/parse_ranges.3 /o=
pt/ltp/share/man/man3/tst_sig.3 /opt/ltp/share/man/man3/parse_opts.3 /opt/l=
tp/share/man/man1/ltp-bump.1 /opt/ltp/share/man/man3/string_to_tokens.3 /op=
t/ltp/share/man/man3/parse_open_flags.3 /opt/ltp/share/man/man3/forker.3 /o=
pt/ltp/share/man/man3/random_range_seed.3 /opt/ltp/share/man/man3/tst_res.3=
 /opt/ltp/share/man/man3/tst_tmpdir.3 /opt/ltp/share/man/man3/tst_set_error=
.3 /opt/ltp/share/man/man3/write_log.3 /opt/ltp/share/man/man3/get_attrib.3=
 /opt/ltp/share/man/man3/random_range.3 /opt/ltp/share/man/man3/rmobj.3"
packages/i586-poky-linux/ltp/ltp-doc: PKGSIZE changed from 0 to 103169 (+10=
0%)
  * FILELIST: added "/opt/ltp/share/man/man3/pattern.3 /opt/ltp/share/man/m=
an1/ltp-pan.1 /opt/ltp/share/man/man1/iogen.1 /opt/ltp/share/man/man3/uscte=
st.3 /opt/ltp/share/man/man1/doio.1 /opt/ltp/share/man/man3/str_to_bytes.3 =
/opt/ltp/share/man/man3/parse_ranges.3 /opt/ltp/share/man/man3/tst_sig.3 /o=
pt/ltp/share/man/man3/parse_opts.3 /opt/ltp/share/man/man1/ltp-bump.1 /opt/=
ltp/share/man/man3/string_to_tokens.3 /opt/ltp/share/man/man3/parse_open_fl=
ags.3 /opt/ltp/share/man/man3/forker.3 /opt/ltp/share/man/man3/random_range=
_seed.3 /opt/ltp/share/man/man3/tst_res.3 /opt/ltp/share/man/man3/tst_tmpdi=
r.3 /opt/ltp/share/man/man3/tst_set_error.3 /opt/ltp/share/man/man3/write_l=
og.3 /opt/ltp/share/man/man3/get_attrib.3 /opt/ltp/share/man/man3/random_ra=
nge.3 /opt/ltp/share/man/man3/rmobj.3"
packages/i586-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/share/man/man=
3/tst_tmpdir.3 /opt/ltp/share/man/man1/iogen.1 /opt/ltp/share/man/man3/usct=
est.3 /opt/ltp/share/man/man1/doio.1 /opt/ltp/share/man/man1/ltp-pan.1 /opt=
/ltp/share/man/man3/parse_ranges.3 /opt/ltp/share/man/man3/tst_sig.3 /opt/l=
tp/share/man/man3/parse_opts.3 /opt/ltp/share/man/man1/ltp-bump.1 /opt/ltp/=
share/man/man3/string_to_tokens.3 /opt/ltp/share/man/man3/parse_open_flags.=
3 /opt/ltp/share/man/man3/random_range.3 /opt/ltp/share/man/man3/random_ran=
ge_seed.3 /opt/ltp/share/man/man3/str_to_bytes.3 /opt/ltp/share/man/man3/ts=
t_res.3 /opt/ltp/share/man/man3/tst_set_error.3 /opt/ltp/share/man/man3/wri=
te_log.3 /opt/ltp/share/man/man3/get_attrib.3 /opt/ltp/share/man/man3/forke=
r.3 /opt/ltp/share/man/man3/rmobj.3 /opt/ltp/share/man/man3/pattern.3"
  * PR changed from "r2" to "r3"
  * PR changed from "r0" to "r1"
packages/i586-poky-linux/man/man-doc: FILELIST: added "/usr/share/man/man5/=
manpath.5.gz /usr/share/man/man1/man.1.gz /usr/share/man/man7/man.7.gz /usr=
/share/man/man1/man2html.1"
packages/i586-poky-linux/man/man-doc: PKGSIZE changed from 0 to 24922 (+100=
%)
  * FILELIST: added "/usr/share/man/man5/manpath.5.gz /usr/share/man/man1/m=
an.1.gz /usr/share/man/man7/man.7.gz /usr/share/man/man1/man2html.1"
packages/i586-poky-linux/man/man: FILELIST: removed "/usr/share/man/man5/ma=
npath.5.gz /usr/share/man/man1/man.1.gz /usr/share/man/man7/man.7.gz /usr/s=
hare/man/man1/man2html.1"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/metacity/metacity-doc: FILELIST: added "/usr/share=
/gnome/help/creating-metacity-themes/C/creating-metacity-themes.xml"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/metacity/metacity-doc: PKGSIZE changed from 6979 t=
o 27989 (+301%)
  * PR changed from "r3" to "r4"
  * FILELIST: added "/usr/share/gnome/help/creating-metacity-themes/C/creat=
ing-metacity-themes.xml"
packages/i586-poky-linux/metacity/metacity: FILELIST: removed "/usr/share/g=
nome/help/creating-metacity-themes/C/creating-metacity-themes.xml"
  * PR changed from "r3" to "r4"
packages/i586-poky-linux/mpeg2dec/mpeg2dec-dbg: RRECOMMENDS: added "libxext=
-dbg"
packages/i586-poky-linux/mpeg2dec/mpeg2dec: RDEPENDS: added "libxext (>=3D =
1.3.1)"
packages/i586-poky-linux/ncurses/ncurses-dev: FILELIST: added "/usr/bin/ncu=
rsesw5-config /usr/bin/ncurses5-config"
  * FILES: added "/usr/lib/ncurses/*.la /usr/bin/*-config /lib/lib*.so /lib=
/*.la"
packages/i586-poky-linux/ncurses/ncurses: FILELIST: removed "/usr/bin/ncurs=
esw5-config /usr/bin/ncurses5-config"
packages/i586-poky-linux/pkgconfig/pkgconfig-dev: FILELIST: added "/usr/sha=
re/aclocal/pkg.m4"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/pkgconfig/*.la"
packages/i586-poky-linux/pkgconfig/pkgconfig-dev: PKGSIZE changed from 0 to=
 5441 (+100%)
  * FILELIST: added "/usr/share/aclocal/pkg.m4"
  *   * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/pkgconfig/*.la"
packages/i586-poky-linux/pkgconfig/pkgconfig: FILELIST: removed "/usr/share=
/aclocal/pkg.m4"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/qemu/qemu-dbg: RRECOMMENDS: added "dtc-dbg"
packages/i586-poky-linux/qemu/qemu-dev: RRECOMMENDS: added "dtc-dev"
packages/i586-poky-linux/qemu/qemu: RDEPENDS: added "dtc (>=3D 1.3.0+git1+0=
33089f29099bdfd5c2d6986cdb9fd07b16cfde0)"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/socat/socat-dbg: RRECOMMENDS: removed "readline-db=
g"
packages/i586-poky-linux/socat/socat-dev: RRECOMMENDS: removed "readline-de=
v"
packages/i586-poky-linux/socat/socat: RDEPENDS: removed "readline (>=3D 6.2=
)"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/bin/tagli=
b-config"
  * PR changed from "r1" to "r2"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /lib/*.la /usr/lib/taglib/=
*.la"
packages/i586-poky-linux/web/web-dev: FILELIST: added "/usr/lib/web/libwebg=
tkhtml2.la"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/web/*.la"
packages/i586-poky-linux/web/web-dev: PKGSIZE changed from 0 to 3287 (+100%=
)
  * FILELIST: added "/usr/lib/web/libwebgtkhtml2.la"
  *   * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/web/*.la"
packages/i586-poky-linux/web/web: FILELIST: removed "/usr/lib/web/libwebgtk=
html2.la"
  * PR changed from "r5" to "r6"
packages/i586-poky-linux/xdpyinfo/xdpyinfo-dbg: RRECOMMENDS: added "libxcom=
posite-dbg"
packages/i586-poky-linux/xdpyinfo/xdpyinfo-dev: RRECOMMENDS: added "libxcom=
posite-dev"
packages/i586-poky-linux/xdpyinfo/xdpyinfo: RDEPENDS: added "libxcomposite =
(>=3D 0.4.3)"

--------------070803020400090803090809--
