Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfeO2-0006Hb-Sy
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 23:49:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2012 14:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="out'?scan'208";a="158227552"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 14:38:17 -0700
Message-ID: <4FDBAB49.9000805@linux.intel.com>
Date: Fri, 15 Jun 2012 14:38:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: PACKAGE List reorder Update
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
X-List-Received-Date: Fri, 15 Jun 2012 21:49:04 -0000
X-Groupsio-MsgNum: 23653
Content-Type: multipart/mixed; boundary="------------020308040906000700060507"

--------------020308040906000700060507
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

As you know I have been working through the issues with the PACKAGES 
list reordering, this first pass moves ${PN} to the last item as a
sweep of it's remaining items.

I have attached a buildhistory_diff out put of the work, you can also 
see the buildhistory at
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgw/repack-buildhistory

I have further summarized this latest run as follows, there are a couple 
of PR bumps that are needed and maybe a couple of files that need to get 
"unmoved".  This found wrongly packaged .la file and -config files, 
along with some manpages.

Please review this further and let me know if you see anything else.
I will likely wrap this up next week for submission.

Thanks

Sau!


Summary of buildhistory_diff:

alsa-lib-dev: added *.la
alsa-lib: removed *.la
cups-dev: added cups-config
cups-doc: added /usr/share/doc/*
cups: removed /usr/share/doc* cups-config
curl-dev: added curl-config
libcurl-dev: removed curl-config (should this have stayed here?)
directfb-dev: added directfb-config
directfb: removed directfb-config
font-util-dev: added aclocal/fontutil.m4
font-util-doc: added /usr/share/man/*
font-util: removed /usr/share/man/*, aclocal/fontutil.m4
gnome-icon-theme-dev: added pkgconfig/gnome-icon-theme.pc
gnome-icon-theme: removed pkgconfig/gnome-icon-theme.pc
   - PR Bump needed
gnome-keyring-dev: added 
/usr/lib/gnome-keyring/devel/gkm-ssh-store-standalone.so 
/usr/lib/gnome-keyring/standalone/gkm-secret-store-standalone.la 
/usr/lib/gnome-keyring/devel/gkm-ssh-store-standalone.la 
/usr/lib/gnome-keyring/devel/gkm-user-store-standalone.la 
/usr/lib/gnome-keyring/devel/gkm-user-store-standalone.so 
/usr/lib/gnome-keyring/standalone/gkm-roots-store-standalone.la
gnome-keyring: removed above files
grub-doc: added /usr/share/locale/* bunch of .mo files, that maybe wrong 
in this case
grub: removed those same files
   - PR Bump Needed
gthumb-dev: added *.la
gthumb: removed *.la
hdparm-doc: added /usr/share/man/*
hdparm: removed /usr/share/man
   - PR Bump Needed
icu-dev: added /usr/lib/icu/*/Makefile.inc and icu-config
icu: removed /usr/lib/icu/*/Makefile.inc and icu-config
libassuan-dev: added libassuan-config
libassuan: removed libassuan
libksba-dev: added ksba-config
libksba: removed ksba-config
   - PR Bump Needed
libnfsidmap-dev: added *.la
libnfsidmap: removed *.la
   - PR Bump Needed
libpcap-dev: added pcap-config (the reason I am doing this fun project)
libpcap: removed pcap-config
libpcre-dev: removed pcretest, pcregrep
libpcre: added pcretest, pcregrep (other distro have these files here)
libuser-dev: added *.la
libuser: removed *.la
   - PR Bump Needed
libxml2-dev: added xml2-config
libxml2: removed xml2-config
   - PR Bump Needed
ltp-doc: added /opt/ltp/share/man/* (hmm, should it be in /opt?)
ltp: removed /opt/ltp/share/man/*
man-pages-doc: added /usr/share/man/*
man-pages: added /usr/share/man/*/*.gz!
   - PR Bump Needed
metacity-doc: added 
/usr/share/gnome/help/creating-metacity-themes/C/creating-metacity-themes.xml
metacity: removed the themese file, this is wrong
   - PR Bump maybe needed, not if I move the file back.
ncurses-dev: added ncursesw5-config and ncurses5-config
ncurses: removed above -config programs
pkgconfig-dev: added /usr/share/aclocal/pkg.m4
pkgconfig: removed /usr/share/aclocal/pkg.m4
taglib-dev: added taglib-config
taglib: removed taglib-config
web-dev: added *.la
web: removed *.la

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


--------------020308040906000700060507
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
packages/i586-poky-linux/curl/curl-dev: FILELIST: added "/usr/bin/curl-conf=
ig"
  * FILES: added "/usr/lib/curl/*.la /usr/bin/*-config /lib/lib*.so /lib/*.=
la"
packages/i586-poky-linux/curl/libcurl-dev: FILELIST: removed all items "/us=
r/bin/curl-config"
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
  * FILES: added "/usr/lib/gnome-icon-theme/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/gnome-icon-theme/gnome-icon-theme-dev: PKGSIZE cha=
nged from 0 to 133 (+100%)
  * FILELIST: added "/usr/share/pkgconfig/gnome-icon-theme.pc"
  *   * FILES: added "/usr/lib/gnome-icon-theme/*.la /lib/lib*.so /lib/*.la=
"
packages/i586-poky-linux/gnome-icon-theme/gnome-icon-theme: FILELIST: remov=
ed "/usr/share/pkgconfig/gnome-icon-theme.pc"
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
packages/i586-poky-linux/grub/grub-dbg: RRECOMMENDS: removed "liblzma-dbg"
packages/i586-poky-linux/grub/grub-dev: RRECOMMENDS: removed "liblzma-dev"
packages/i586-poky-linux/grub/grub-doc: FILELIST: added "/usr/share/locale/=
it/LC_MESSAGES/grub.mo /usr/share/locale/nl/LC_MESSAGES/grub.mo /usr/share/=
locale/ru/LC_MESSAGES/grub.mo /usr/share/locale/ast/LC_MESSAGES/grub.mo /us=
r/share/locale/da/LC_MESSAGES/grub.mo /usr/share/info/grub-dev.info /usr/sh=
are/locale/ca/LC_MESSAGES/grub.mo /usr/share/info/grub.info /usr/share/loca=
le/fr/LC_MESSAGES/grub.mo /usr/share/locale/de/LC_MESSAGES/grub.mo /usr/sha=
re/locale/sv/LC_MESSAGES/grub.mo /usr/share/locale/ko/LC_MESSAGES/grub.mo /=
usr/share/grub/update-grub_lib /usr/share/locale/pl/LC_MESSAGES/grub.mo /us=
r/share/locale/id/LC_MESSAGES/grub.mo /usr/share/locale/vi/LC_MESSAGES/grub=
.mo /usr/share/locale/fi/LC_MESSAGES/grub.mo /usr/share/locale/zh_CN/LC_MES=
SAGES/grub.mo /usr/share/locale/hu/LC_MESSAGES/grub.mo /usr/share/locale/uk=
/LC_MESSAGES/grub.mo /usr/share/grub/grub-mkconfig_lib"
packages/i586-poky-linux/grub/grub-doc: PKGSIZE changed from 0 to 926738 (+=
100%)
  * FILELIST: added "/usr/share/locale/it/LC_MESSAGES/grub.mo /usr/share/lo=
cale/nl/LC_MESSAGES/grub.mo /usr/share/locale/ru/LC_MESSAGES/grub.mo /usr/s=
hare/locale/ast/LC_MESSAGES/grub.mo /usr/share/locale/da/LC_MESSAGES/grub.m=
o /usr/share/info/grub-dev.info /usr/share/locale/ca/LC_MESSAGES/grub.mo /u=
sr/share/info/grub.info /usr/share/locale/fr/LC_MESSAGES/grub.mo /usr/share=
/locale/de/LC_MESSAGES/grub.mo /usr/share/locale/sv/LC_MESSAGES/grub.mo /us=
r/share/locale/ko/LC_MESSAGES/grub.mo /usr/share/grub/update-grub_lib /usr/=
share/locale/pl/LC_MESSAGES/grub.mo /usr/share/locale/id/LC_MESSAGES/grub.m=
o /usr/share/locale/vi/LC_MESSAGES/grub.mo /usr/share/locale/fi/LC_MESSAGES=
/grub.mo /usr/share/locale/zh_CN/LC_MESSAGES/grub.mo /usr/share/locale/hu/L=
C_MESSAGES/grub.mo /usr/share/locale/uk/LC_MESSAGES/grub.mo /usr/share/grub=
/grub-mkconfig_lib"
packages/i586-poky-linux/grub/grub: FILELIST: removed "/usr/share/locale/ru=
/LC_MESSAGES/grub.mo /usr/share/locale/nl/LC_MESSAGES/grub.mo /usr/share/lo=
cale/it/LC_MESSAGES/grub.mo /usr/share/locale/vi/LC_MESSAGES/grub.mo /usr/s=
hare/locale/ast/LC_MESSAGES/grub.mo /usr/share/locale/sv/LC_MESSAGES/grub.m=
o /usr/share/locale/id/LC_MESSAGES/grub.mo /usr/share/info/grub-dev.info /u=
sr/share/locale/ca/LC_MESSAGES/grub.mo /usr/share/info/grub.info /usr/share=
/locale/fr/LC_MESSAGES/grub.mo /usr/share/locale/de/LC_MESSAGES/grub.mo /us=
r/share/locale/zh_CN/LC_MESSAGES/grub.mo /usr/share/locale/ko/LC_MESSAGES/g=
rub.mo /usr/share/grub/update-grub_lib /usr/share/locale/pl/LC_MESSAGES/gru=
b.mo /usr/share/locale/fi/LC_MESSAGES/grub.mo /usr/share/grub/grub-mkconfig=
_lib /usr/share/locale/hu/LC_MESSAGES/grub.mo /usr/share/locale/uk/LC_MESSA=
GES/grub.mo /usr/share/locale/da/LC_MESSAGES/grub.mo"
packages/i586-poky-linux/grub/grub: RDEPENDS: removed "liblzma (>=3D 5.1.1a=
lpha)"
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
an8/hdparm.8"
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
packages/i586-poky-linux/libassuan/libassuan-dev: FILELIST: added "/usr/bin=
/libassuan-config"
  * FILES: added "/usr/bin/*-config /lib/lib*.so /usr/lib/libassuan/*.la /l=
ib/*.la"
packages/i586-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/bin/l=
ibassuan-config"
  * PR changed from "r0" to "r1"
  * PR changed from "r1" to "r2"
  * PR changed from "r1" to "r2"
packages/i586-poky-linux/libksba/libksba-dev: FILELIST: added "/usr/bin/ksb=
a-config"
  * FILES: added "/usr/bin/*-config /usr/lib/libksba/*.la /lib/lib*.so /lib=
/*.la"
packages/i586-poky-linux/libksba/libksba: FILELIST: removed "/usr/bin/ksba-=
config"
packages/i586-poky-linux/libnfsidmap/libnfsidmap-dev: FILELIST: added "/usr=
/lib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/static.la"
  * FILES: added "/usr/lib/libnfsidmap/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/libnfsidmap/libnfsidmap-dev: PKGSIZE changed from =
4381 to 6209 (+41%)
  * FILELIST: added "/usr/lib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/=
static.la"
  *   * FILES: added "/usr/lib/libnfsidmap/*.la /lib/lib*.so /lib/*.la"
packages/i586-poky-linux/libnfsidmap/libnfsidmap: FILELIST: removed "/usr/l=
ib/libnfsidmap/nsswitch.la /usr/lib/libnfsidmap/static.la"
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
packages/i586-poky-linux/libsamplerate0/libsamplerate0-dbg: RRECOMMENDS: re=
moved "libsndfile1-dbg"
packages/i586-poky-linux/libsamplerate0/libsamplerate0-dev: RRECOMMENDS: re=
moved "libsndfile1-dev"
packages/i586-poky-linux/libsamplerate0/libsamplerate0: RDEPENDS: removed "=
libsndfile1 (>=3D 1.0.25)"
  * PR changed from "r5" to "r6"
packages/i586-poky-linux/libuser/libuser-dev: FILELIST: added "/usr/lib/lib=
user/libuser_files.la /usr/lib/libuser/libuser_shadow.la"
  * FILES: added "/lib/lib*.so /lib/*.la /usr/lib/libuser/*.la"
packages/i586-poky-linux/libuser/libuser: FILELIST: removed "/usr/lib/libus=
er/libuser_files.la /usr/lib/libuser/libuser_shadow.la"
packages/i586-poky-linux/libxml2/libxml2-dev: FILELIST: added "/usr/bin/xml=
2-config"
  * FILES: added "/lib/lib*.so /usr/lib/libxml2/*.la /lib/*.la"
packages/i586-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/bin/xml2-=
config"
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
packages/i586-poky-linux/man-pages/man-pages-doc: FILELIST: added "/usr/sha=
re/man/man3/inet_ntop.3 /usr/share/man/man5/passwd.5 /usr/share/man/man3/CI=
RCLEQ_HEAD.3 /usr/share/man/man3/xdr_array.3 /usr/share/man/man2/setregid.2=
 /usr/share/man/man3/grantpt.3 /usr/share/man/man3/inet_pton.3 /usr/share/m=
an/man2/sched_setscheduler.2 /usr/share/man/man3/statvfs.3 /usr/share/man/m=
an3/signgam.3 /usr/share/man/man3/remquof.3 /usr/share/man/man3/endaliasent=
.3 /usr/share/man/man2/pipe.2 /usr/share/man/man3/fabsl.3 /usr/share/man/ma=
n3/fstatvfs.3 /usr/share/man/man3/ctime_r.3 /usr/share/man/man3/erff.3 /usr=
/share/man/man5/environ.5 /usr/share/man/man3/bsearch.3 /usr/share/man/man2=
/chdir.2 /usr/share/man/man3/putwc_unlocked.3 /usr/share/man/man3/tanl.3 /u=
sr/share/man/man3/regerror.3 /usr/share/man/man3/clnt_spcreateerror.3 /usr/=
share/man/man3/sgetspent.3 /usr/share/man/man3/cacosl.3 /usr/share/man/man3=
/LIST_INSERT_AFTER.3 /usr/share/man/man3/fputs.3 /usr/share/man/man2/clock_=
gettime.2 /usr/share/man/man3/y1f.3 /usr/share/man/man2/ioperm.2 /usr/share=
/man/man3/isblank.3 /usr/share/man/man3/dprintf.3 /usr/share/man/man3/pthre=
ad_create.3 /usr/share/man/man3/labs.3 /usr/share/man/man3/casin.3 /usr/sha=
re/man/man3/crealf.3 /usr/share/man/man2/fcntl64.2 /usr/share/man/man3/geto=
pt_long.3 /usr/share/man/man2/vm86.2 /usr/share/man/man2/setsockopt.2 /usr/=
share/man/man2/setresuid.2 /usr/share/man/man3/xdr_rejected_reply.3 /usr/sh=
are/man/man3/pthread_getaffinity_np.3 /usr/share/man/man3/ecvt_r.3 /usr/sha=
re/man/man3/error_message_count.3 /usr/share/man/man3/getdelim.3 /usr/share=
/man/man3/lcong48_r.3 /usr/share/man/man3/wordexp.3 /usr/share/man/man3/TAI=
LQ_REMOVE.3 /usr/share/man/man7/pthreads.7 /usr/share/man/man3/lgamma_r.3 /=
usr/share/man/man3/getrpcbyname_r.3 /usr/share/man/man3/xdr_u_short.3 /usr/=
share/man/man8/ld-linux.8 /usr/share/man/man2/flock.2 /usr/share/man/man2/s=
pu_run.2 /usr/share/man/man3/iruserok.3 /usr/share/man/man2/fremovexattr.2 =
/usr/share/man/man3/wcswidth.3 /usr/share/man/man3/htobe16.3 /usr/share/man=
/man3/xdr_pmaplist.3 /usr/share/man/man3/truncl.3 /usr/share/man/man3/lroun=
dl.3 /usr/share/man/man3/setrpcent.3 /usr/share/man/man3/CPU_ISSET.3 /usr/s=
hare/man/man3/conjf.3 /usr/share/man/man3/execv.3 /usr/share/man/man3/stder=
r.3 /usr/share/man/man3/clnt_pcreateerror.3 /usr/share/man/man3/strtok_r.3 =
/usr/share/man/man3/INFINITY.3 /usr/share/man/man3/strncat.3 /usr/share/man=
/man3/strtok.3 /usr/share/man/man2/sendfile64.2 /usr/share/man/man7/signal.=
7 /usr/share/man/man3/getprotobyname.3 /usr/share/man/man3/getnetgrent_r.3 =
/usr/share/man/man2/setgroups32.2 /usr/share/man/man4/sk98lin.4 /usr/share/=
man/man3/pthread_cleanup_pop.3 /usr/share/man/man3/ptsname_r.3 /usr/share/m=
an/man3/LIST_ENTRY.3 /usr/share/man/man3/strcmp.3 /usr/share/man/man2/vhang=
up.2 /usr/share/man/man7/tcp.7 /usr/share/man/man2/getppid.2 /usr/share/man=
/man3/__setfpucw.3 /usr/share/man/man3/mq_setattr.3 /usr/share/man/man3/j1l=
.3 /usr/share/man/man3/ether_aton_r.3 /usr/share/man/man3/xdr_setpos.3 /usr=
/share/man/man3/fputwc_unlocked.3 /usr/share/man/man3/pthread_cleanup_push.=
3 /usr/share/man/man3/pmap_rmtcall.3 /usr/share/man/man2/mlock.2 /usr/share=
/man/man2/madvise.2 /usr/share/man/man3/ecvt.3 /usr/share/man/man3/rtnetlin=
k.3 /usr/share/man/man3/resolver.3 /usr/share/man/man7/iso_8859-9.7 /usr/sh=
are/man/man3/isnanf.3 /usr/share/man/man3/asctime.3 /usr/share/man/man2/sys=
info.2 /usr/share/man/man3/iswlower.3 /usr/share/man/man3/gai_cancel.3 /usr=
/share/man/man2/ipc.2 /usr/share/man/man3/fmodf.3 /usr/share/man/man3/shm_u=
nlink.3 /usr/share/man/man3/llround.3 /usr/share/man/man2/unlinkat.2 /usr/s=
hare/man/man3/fgetgrent.3 /usr/share/man/man2/inb.2 /usr/share/man/man2/__c=
lone2.2 /usr/share/man/man3/fmodl.3 /usr/share/man/man3/res_querydomain.3 /=
usr/share/man/man3/qgcvt.3 /usr/share/man/man3/dremf.3 /usr/share/man/man3/=
ccoshl.3 /usr/share/man/man3/sinh.3 /usr/share/man/man3/xdr_free.3 /usr/sha=
re/man/man3/getdate_r.3 /usr/share/man/man8/ldconfig.8 /usr/share/man/man7/=
iso_8859_15.7 /usr/share/man/man3/ftrylockfile.3 /usr/share/man/man3/sigpau=
se.3 /usr/share/man/man2/security.2 /usr/share/man/man3/mbsrtowcs.3 /usr/sh=
are/man/man3/lrintl.3 /usr/share/man/man3/strerror.3 /usr/share/man/man3/cc=
osf.3 /usr/share/man/man2/close.2 /usr/share/man/man4/hd.4 /usr/share/man/m=
an3/logbf.3 /usr/share/man/man2/gethostid.2 /usr/share/man/man3/getrpcbynum=
ber.3 /usr/share/man/man3/xdr_int.3 /usr/share/man/man2/inl.2 /usr/share/ma=
n/man3/gets.3 /usr/share/man/man3/des_crypt.3 /usr/share/man/man3/aio_read.=
3 /usr/share/man/man3/warn.3 /usr/share/man/man2/setregid32.2 /usr/share/ma=
n/man3/TAILQ_HEAD.3 /usr/share/man/man3/ilogbl.3 /usr/share/man/man2/setns.=
2 /usr/share/man/man2/syncfs.2 /usr/share/man/man3/gethostbyname2_r.3 /usr/=
share/man/man2/syscalls.2 /usr/share/man/man3/feraiseexcept.3 /usr/share/ma=
n/man3/acoshl.3 /usr/share/man/man3/exp10.3 /usr/share/man/man2/connect.2 /=
usr/share/man/man3/eventfd_write.3 /usr/share/man/man3/tgammaf.3 /usr/share=
/man/man3/fedisableexcept.3 /usr/share/man/man3/endhostent.3 /usr/share/man=
/man3/wmemset.3 /usr/share/man/man3/wcsncpy.3 /usr/share/man/man2/epoll_pwa=
it.2 /usr/share/man/man3/setkey_r.3 /usr/share/man/man3/sysconf.3 /usr/shar=
e/man/man3/expf.3 /usr/share/man/man3/pthread_attr_setinheritsched.3 /usr/s=
hare/man/man2/dup3.2 /usr/share/man/man7/iso_8859_2.7 /usr/share/man/man3/s=
trfry.3 /usr/share/man/man3/nexttowardl.3 /usr/share/man/man2/recvfrom.2 /u=
sr/share/man/man7/pipe.7 /usr/share/man/man2/vserver.2 /usr/share/man/man3/=
asinhf.3 /usr/share/man/man3/CPU_ISSET_S.3 /usr/share/man/man7/rtld-audit.7=
 /usr/share/man/man7/udp.7 /usr/share/man/man2/accept4.2 /usr/share/man/man=
3/fminl.3 /usr/share/man/man3/FD_ZERO.3 /usr/share/man/man4/port.4 /usr/sha=
re/man/man2/link.2 /usr/share/man/man3/sigrelse.3 /usr/share/man/man3/fts_s=
et.3 /usr/share/man/man2/fsetxattr.2 /usr/share/man/man2/utimes.2 /usr/shar=
e/man/man3/stdio_ext.3 /usr/share/man/man7/units.7 /usr/share/man/man3/key_=
encryptsession.3 /usr/share/man/man2/chroot.2 /usr/share/man/man7/iso_8859-=
5.7 /usr/share/man/man3/wctob.3 /usr/share/man/man2/tgkill.2 /usr/share/man=
/man3/undocumented.3 /usr/share/man/man3/pthread_setconcurrency.3 /usr/shar=
e/man/man3/iswpunct.3 /usr/share/man/man2/migrate_pages.2 /usr/share/man/ma=
n3/logbl.3 /usr/share/man/man2/timer_delete.2 /usr/share/man/man3/res_mkque=
ry.3 /usr/share/man/man7/iso_8859-1.7 /usr/share/man/man7/udplite.7 /usr/sh=
are/man/man3/inet_makeaddr.3 /usr/share/man/man8/zic.8 /usr/share/man/man3/=
wcstombs.3 /usr/share/man/man3/difftime.3 /usr/share/man/man7/standards.7 /=
usr/share/man/man2/epoll_wait.2 /usr/share/man/man3/wcsncmp.3 /usr/share/ma=
n/man3/re_comp.3 /usr/share/man/man3/gethostbyname_r.3 /usr/share/man/man7/=
latin1.7 /usr/share/man/man3/sem_unlink.3 /usr/share/man/man2/semop.2 /usr/=
share/man/man7/latin3.7 /usr/share/man/man2/fchdir.2 /usr/share/man/man3/cl=
nttcp_create.3 /usr/share/man/man3/remainderf.3 /usr/share/man/man2/io_gete=
vents.2 /usr/share/man/man3/closelog.3 /usr/share/man/man3/frexpl.3 /usr/sh=
are/man/man7/aio.7 /usr/share/man/man2/getresuid.2 /usr/share/man/man3/fput=
ws_unlocked.3 /usr/share/man/man3/longjmp.3 /usr/share/man/man3/vsprintf.3 =
/usr/share/man/man2/dup.2 /usr/share/man/man3/siggetmask.3 /usr/share/man/m=
an3/rawmemchr.3 /usr/share/man/man3/setttyent.3 /usr/share/man/man3/lutimes=
.3 /usr/share/man/man5/issue.5 /usr/share/man/man3/strverscmp.3 /usr/share/=
man/man3/cproj.3 /usr/share/man/man3/CPU_CLR_S.3 /usr/share/man/man3/mq_sen=
d.3 /usr/share/man/man3/getpass.3 /usr/share/man/man7/mailaddr.7 /usr/share=
/man/man2/fstatat64.2 /usr/share/man/man2/getcpu.2 /usr/share/man/man3/get_=
myaddress.3 /usr/share/man/man3/argz.3 /usr/share/man/man5/protocols.5 /usr=
/share/man/man2/fstat64.2 /usr/share/man/man2/prlimit.2 /usr/share/man/man3=
/usleep.3 /usr/share/man/man2/setpriority.2 /usr/share/man/man3/fmax.3 /usr=
/share/man/man3/etext.3 /usr/share/man/man3/endspent.3 /usr/share/man/man3/=
isprint.3 /usr/share/man/man3/remque.3 /usr/share/man/man3/lrintf.3 /usr/sh=
are/man/man5/wtmp.5 /usr/share/man/man3/strnlen.3 /usr/share/man/man3/isinf=
.3 /usr/share/man/man3/TAILQ_INIT.3 /usr/share/man/man3/scandir.3 /usr/shar=
e/man/man3/wordfree.3 /usr/share/man/man2/setresuid32.2 /usr/share/man/man3=
/isnan.3 /usr/share/man/man2/lsetxattr.2 /usr/share/man/man3/gethostbyname.=
3 /usr/share/man/man3/lgammaf_r.3 /usr/share/man/man3/setutent.3 /usr/share=
/man/man3/ilogb.3 /usr/share/man/man2/signalfd4.2 /usr/share/man/man2/keyct=
l.2 /usr/share/man/man3/wmemmove.3 /usr/share/man/man2/eventfd.2 /usr/share=
/man/man3/byteorder.3 /usr/share/man/man2/vm86old.2 /usr/share/man/man3/fmi=
nf.3 /usr/share/man/man3/fopencookie.3 /usr/share/man/man3/endservent.3 /us=
r/share/man/man3/CPU_EQUAL.3 /usr/share/man/man3/htole64.3 /usr/share/man/m=
an2/olduname.2 /usr/share/man/man3/fread.3 /usr/share/man/man3/pthread_attr=
_getguardsize.3 /usr/share/man/man3/catanf.3 /usr/share/man/man3/gethostent=
_r.3 /usr/share/man/man3/lseek64.3 /usr/share/man/man3/rewind.3 /usr/share/=
man/man3/clnt_sperrno.3 /usr/share/man/man2/geteuid.2 /usr/share/man/man3/r=
emove.3 /usr/share/man/man2/set_mempolicy.2 /usr/share/man/man2/shutdown.2 =
/usr/share/man/man3/svc_getargs.3 /usr/share/man/man3/regcomp.3 /usr/share/=
man/man3/svcerr_weakauth.3 /usr/share/man/man3/fgets.3 /usr/share/man/man3/=
carg.3 /usr/share/man/man2/oldfstat.2 /usr/share/man/man7/boot.7 /usr/share=
/man/man2/mmap.2 /usr/share/man/man3/rindex.3 /usr/share/man/man2/rt_sigtim=
edwait.2 /usr/share/man/man2/writev.2 /usr/share/man/man2/mmap2.2 /usr/shar=
e/man/man3/setnetgrent.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/s=
vcudp_create.3 /usr/share/man/man4/ram.4 /usr/share/man/man2/setfsgid32.2 /=
usr/share/man/man3/pow10f.3 /usr/share/man/man3/execvpe.3 /usr/share/man/ma=
n3/tcflow.3 /usr/share/man/man3/malloc_trim.3 /usr/share/man/man3/asinl.3 /=
usr/share/man/man3/strlen.3 /usr/share/man/man2/arm_fadvise.2 /usr/share/ma=
n/man2/utimensat.2 /usr/share/man/man3/coshf.3 /usr/share/man/man3/argz_ins=
ert.3 /usr/share/man/man3/fgetpwent_r.3 /usr/share/man/man3/xdr_union.3 /us=
r/share/man/man3/iswprint.3 /usr/share/man/man3/psiginfo.3 /usr/share/man/m=
an3/pthread_cleanup_push_defer_np.3 /usr/share/man/man3/strchrnul.3 /usr/sh=
are/man/man3/log10l.3 /usr/share/man/man3/feupdateenv.3 /usr/share/man/man3=
/aio_suspend.3 /usr/share/man/man3/drand48.3 /usr/share/man/man3/strndupa.3=
 /usr/share/man/man3/xdrmem_create.3 /usr/share/man/man3/asinh.3 /usr/share=
/man/man3/swprintf.3 /usr/share/man/man2/setpgrp.2 /usr/share/man/man2/getr=
esgid.2 /usr/share/man/man3/iswctype.3 /usr/share/man/man3/putc_unlocked.3 =
/usr/share/man/man2/getdents.2 /usr/share/man/man3/res_search.3 /usr/share/=
man/man3/inet_network.3 /usr/share/man/man3/mallinfo.3 /usr/share/man/man5/=
ttytype.5 /usr/share/man/man7/netdevice.7 /usr/share/man/man2/pause.2 /usr/=
share/man/man4/console.4 /usr/share/man/man3/sem_getvalue.3 /usr/share/man/=
man3/bstring.3 /usr/share/man/man3/svc_getreq.3 /usr/share/man/man3/exp10f.=
3 /usr/share/man/man3/pthread_attr_getstack.3 /usr/share/man/man3/le16toh.3=
 /usr/share/man/man3/fcvt.3 /usr/share/man/man3/mtrace.3 /usr/share/man/man=
5/proc.5 /usr/share/man/man3/svctcp_create.3 /usr/share/man/man2/setdomainn=
ame.2 /usr/share/man/man3/ulimit.3 /usr/share/man/man3/lockf.3 /usr/share/m=
an/man3/stpncpy.3 /usr/share/man/man3/pthread_exit.3 /usr/share/man/man2/ge=
tresuid32.2 /usr/share/man/man3/tmpfile.3 /usr/share/man/man3/setbuffer.3 /=
usr/share/man/man3/getmntent_r.3 /usr/share/man/man3/sigvec.3 /usr/share/ma=
n/man3/tdelete.3 /usr/share/man/man7/mdoc.samples.7 /usr/share/man/man3/str=
casestr.3 /usr/share/man/man3/iswalpha.3 /usr/share/man/man3/malloc_get_sta=
te.3 /usr/share/man/man4/initrd.4 /usr/share/man/man3/fegetround.3 /usr/sha=
re/man/man3/verr.3 /usr/share/man/man3/pthread_attr_getinheritsched.3 /usr/=
share/man/man3/sigmask.3 /usr/share/man/man3/db.3 /usr/share/man/man3/fmin.=
3 /usr/share/man/man3/FD_ISSET.3 /usr/share/man/man2/mbind.2 /usr/share/man=
/man2/ugetrlimit.2 /usr/share/man/man3/warnx.3 /usr/share/man/man3/vwprintf=
.3 /usr/share/man/man3/iconv_open.3 /usr/share/man/man3/strtoll.3 /usr/shar=
e/man/man3/atanhl.3 /usr/share/man/man3/strptime.3 /usr/share/man/man3/svc_=
sendreply.3 /usr/share/man/man4/epoll.4 /usr/share/man/man3/tcgetpgrp.3 /us=
r/share/man/man2/alloc_hugepages.2 /usr/share/man/man3/posix_fallocate.3 /u=
sr/share/man/man1/ldd.1 /usr/share/man/man2/socket.2 /usr/share/man/man3/cl=
earerr_unlocked.3 /usr/share/man/man3/wctrans.3 /usr/share/man/man3/wcwidth=
.3 /usr/share/man/man2/splice.2 /usr/share/man/man2/mq_timedsend.2 /usr/sha=
re/man/man3/argz_create_sep.3 /usr/share/man/man3/asinf.3 /usr/share/man/ma=
n3/fts_children.3 /usr/share/man/man2/rt_sigreturn.2 /usr/share/man/man3/ge=
trpcent.3 /usr/share/man/man3/svcraw_create.3 /usr/share/man/man7/math_erro=
r.7 /usr/share/man/man3/argz_extract.3 /usr/share/man/man3/backtrace_symbol=
s_fd.3 /usr/share/man/man3/gnu_get_libc_release.3 /usr/share/man/man3/endtt=
yent.3 /usr/share/man/man3/futimens.3 /usr/share/man/man3/initgroups.3 /usr=
/share/man/man3/ceill.3 /usr/share/man/man2/arm_fadvise64_64.2 /usr/share/m=
an/man3/puts.3 /usr/share/man/man2/pciconfig_iobase.2 /usr/share/man/man3/T=
AILQ_INSERT_HEAD.3 /usr/share/man/man3/casinh.3 /usr/share/man/man2/shmctl.=
2 /usr/share/man/man4/mouse.4 /usr/share/man/man3/CPU_AND_S.3 /usr/share/ma=
n/man3/sigwait.3 /usr/share/man/man3/envz_entry.3 /usr/share/man/man3/fdiml=
.3 /usr/share/man/man3/cbrtl.3 /usr/share/man/man3/fputws.3 /usr/share/man/=
man3/mcheck_check_all.3 /usr/share/man/man3/lgammal.3 /usr/share/man/man2/m=
kdir.2 /usr/share/man/man2/kexec_load.2 /usr/share/man/man3/strcoll.3 /usr/=
share/man/man3/dysize.3 /usr/share/man/man3/isdigit.3 /usr/share/man/man3/a=
ssert_perror.3 /usr/share/man/man3/termios.3 /usr/share/man/man5/utmpx.5 /u=
sr/share/man/man3/xdr_float.3 /usr/share/man/man2/request_key.2 /usr/share/=
man/man3/pthread_attr_setdetachstate.3 /usr/share/man/man2/set_robust_list.=
2 /usr/share/man/man3/islessgreater.3 /usr/share/man/man2/clock_getres.2 /u=
sr/share/man/man2/execve.2 /usr/share/man/man3/mkstemp.3 /usr/share/man/man=
2/getpmsg.2 /usr/share/man/man3/getpwnam_r.3 /usr/share/man/man3/atoll.3 /u=
sr/share/man/man7/locale.7 /usr/share/man/man3/be64toh.3 /usr/share/man/man=
3/gammaf.3 /usr/share/man/man3/sincosf.3 /usr/share/man/man3/clock_getres.3=
 /usr/share/man/man5/utmp.5 /usr/share/man/man3/ferror_unlocked.3 /usr/shar=
e/man/man3/malloc_stats.3 /usr/share/man/man2/signal.2 /usr/share/man/man3/=
btree.3 /usr/share/man/man2/setitimer.2 /usr/share/man/man3/hsearch.3 /usr/=
share/man/man3/xdr_string.3 /usr/share/man/man3/strtol.3 /usr/share/man/man=
2/setfsuid.2 /usr/share/man/man3/pthread_setaffinity_np.3 /usr/share/man/ma=
n3/pthread_yield.3 /usr/share/man/man3/vdprintf.3 /usr/share/man/man3/wcpcp=
y.3 /usr/share/man/man3/CPU_OR_S.3 /usr/share/man/man3/vfwprintf.3 /usr/sha=
re/man/man3/CMSG_NXTHDR.3 /usr/share/man/man2/sbrk.2 /usr/share/man/man2/lo=
okup_dcookie.2 /usr/share/man/man3/xdr_enum.3 /usr/share/man/man3/strtoull.=
3 /usr/share/man/man2/pselect6.2 /usr/share/man/man3/isfinite.3 /usr/share/=
man/man2/fstatat.2 /usr/share/man/man2/msgget.2 /usr/share/man/man5/group.5=
 /usr/share/man/man3/dlvsym.3 /usr/share/man/man3/cpowl.3 /usr/share/man/ma=
n2/capget.2 /usr/share/man/man3/llabs.3 /usr/share/man/man3/mblen.3 /usr/sh=
are/man/man3/pthread_getconcurrency.3 /usr/share/man/man2/pipe2.2 /usr/shar=
e/man/man7/iso-8859-5.7 /usr/share/man/man7/complex.7 /usr/share/man/man3/w=
csncat.3 /usr/share/man/man3/CPU_CLR.3 /usr/share/man/man3/ffsl.3 /usr/shar=
e/man/man3/pthread_setschedprio.3 /usr/share/man/man7/iso-8859-1.7 /usr/sha=
re/man/man2/sigqueue.2 /usr/share/man/man7/iso_8859-16.7 /usr/share/man/man=
3/endutxent.3 /usr/share/man/man7/glibc.7 /usr/share/man/man3/timercmp.3 /u=
sr/share/man/man3/fwrite_unlocked.3 /usr/share/man/man3/endrpcent.3 /usr/sh=
are/man/man3/des_setparity.3 /usr/share/man/man2/getsid.2 /usr/share/man/ma=
n3/strftime.3 /usr/share/man/man3/xdr_pmap.3 /usr/share/man/man3/posix_mema=
lign.3 /usr/share/man/man3/vfprintf.3 /usr/share/man/man3/cacoshf.3 /usr/sh=
are/man/man3/xdrrec_create.3 /usr/share/man/man3/backtrace_symbols.3 /usr/s=
hare/man/man2/sched_setaffinity.2 /usr/share/man/man3/pow10l.3 /usr/share/m=
an/man3/error.3 /usr/share/man/man2/recvmsg.2 /usr/share/man/man3/sincosl.3=
 /usr/share/man/man2/read.2 /usr/share/man/man3/pmap_unset.3 /usr/share/man=
/man2/dup2.2 /usr/share/man/man3/timerisset.3 /usr/share/man/man2/recv.2 /u=
sr/share/man/man3/mpool.3 /usr/share/man/man3/exp2.3 /usr/share/man/man3/fe=
clearexcept.3 /usr/share/man/man3/nan.3 /usr/share/man/man7/utf8.7 /usr/sha=
re/man/man3/argz_replace.3 /usr/share/man/man3/sigstack.3 /usr/share/man/ma=
n3/log.3 /usr/share/man/man3/fetestexcept.3 /usr/share/man/man3/setstate_r.=
3 /usr/share/man/man7/bootparam.7 /usr/share/man/man2/idle.2 /usr/share/man=
/man5/intro.5 /usr/share/man/man3/exp2f.3 /usr/share/man/man3/l64a.3 /usr/s=
hare/man/man3/strspn.3 /usr/share/man/man2/setreuid32.2 /usr/share/man/man3=
/pthread_setcancelstate.3 /usr/share/man/man3/getgrnam.3 /usr/share/man/man=
3/tcgetsid.3 /usr/share/man/man2/stat64.2 /usr/share/man/man3/errno.3 /usr/=
share/man/man3/cargl.3 /usr/share/man/man3/copysignf.3 /usr/share/man/man3/=
sinhl.3 /usr/share/man/man5/complex.5 /usr/share/man/man3/open_memstream.3 =
/usr/share/man/man3/vsnprintf.3 /usr/share/man/man5/termcap.5 /usr/share/ma=
n/man3/execlp.3 /usr/share/man/man3/remquol.3 /usr/share/man/man3/xdecrypt.=
3 /usr/share/man/man3/ether_ntohost.3 /usr/share/man/man3/fabs.3 /usr/share=
/man/man3/nextafterf.3 /usr/share/man/man3/major.3 /usr/share/man/man3/even=
tfd_read.3 /usr/share/man/man3/tcsetattr.3 /usr/share/man/man3/sem_init.3 /=
usr/share/man/man3/ecb_crypt.3 /usr/share/man/man3/svc_run.3 /usr/share/man=
/man3/pthread_testcancel.3 /usr/share/man/man3/htons.3 /usr/share/man/man3/=
fputc.3 /usr/share/man/man3/tempnam.3 /usr/share/man/man3/getifaddrs.3 /usr=
/share/man/man3/csinl.3 /usr/share/man/man2/cacheflush.2 /usr/share/man/man=
3/clnt_perror.3 /usr/share/man/man3/clog10l.3 /usr/share/man/man3/wcschr.3 =
/usr/share/man/man3/endpwent.3 /usr/share/man/man3/mbsinit.3 /usr/share/man=
/man3/xdr_inline.3 /usr/share/man/man3/utmpxname.3 /usr/share/man/man3/erfl=
.3 /usr/share/man/man3/strdupa.3 /usr/share/man/man3/logwtmp.3 /usr/share/m=
an/man3/xdr_vector.3 /usr/share/man/man3/fputs_unlocked.3 /usr/share/man/ma=
n3/muntrace.3 /usr/share/man/man2/settimeofday.2 /usr/share/man/man7/futex.=
7 /usr/share/man/man3/printf.3 /usr/share/man/man2/fstat.2 /usr/share/man/m=
an2/wait4.2 /usr/share/man/man3/atan2f.3 /usr/share/man/man2/outl.2 /usr/sh=
are/man/man3/freeifaddrs.3 /usr/share/man/man3/srandom.3 /usr/share/man/man=
2/listen.2 /usr/share/man/man3/islower.3 /usr/share/man/man3/optopt.3 /usr/=
share/man/man3/mq_receive.3 /usr/share/man/man2/semget.2 /usr/share/man/man=
3/sin.3 /usr/share/man/man3/tanf.3 /usr/share/man/man3/sethostid.3 /usr/sha=
re/man/man3/fgetspent.3 /usr/share/man/man5/fs.5 /usr/share/man/man3/srand.=
3 /usr/share/man/man3/ttyslot.3 /usr/share/man/man3/putc.3 /usr/share/man/m=
an2/outb.2 /usr/share/man/man4/random.4 /usr/share/man/man3/sinhf.3 /usr/sh=
are/man/man3/significand.3 /usr/share/man/man2/msgop.2 /usr/share/man/man2/=
io_submit.2 /usr/share/man/man3/tzname.3 /usr/share/man/man3/qsort.3 /usr/s=
hare/man/man2/_Exit.2 /usr/share/man/man3/creall.3 /usr/share/man/man3/wcpn=
cpy.3 /usr/share/man/man3/strtold.3 /usr/share/man/man3/strerror_r.3 /usr/s=
hare/man/man2/setsid.2 /usr/share/man/man2/send.2 /usr/share/man/man3/htobe=
32.3 /usr/share/man/man2/outsw.2 /usr/share/man/man2/get_robust_list.2 /usr=
/share/man/man2/afs_syscall.2 /usr/share/man/man3/atof.3 /usr/share/man/man=
3/mktime.3 /usr/share/man/man2/socketcall.2 /usr/share/man/man3/posix_openp=
t.3 /usr/share/man/man2/getpid.2 /usr/share/man/man3/CPU_COUNT_S.3 /usr/sha=
re/man/man3/ftello.3 /usr/share/man/man3/tgamma.3 /usr/share/man/man3/alloc=
a.3 /usr/share/man/man3/getaddrinfo_a.3 /usr/share/man/man3/sem_timedwait.3=
 /usr/share/man/man3/atan2l.3 /usr/share/man/man3/clock_settime.3 /usr/shar=
e/man/man3/pthread_attr_setschedparam.3 /usr/share/man/man2/rt_sigprocmask.=
2 /usr/share/man/man3/dreml.3 /usr/share/man/man3/argz_next.3 /usr/share/ma=
n/man3/vsscanf.3 /usr/share/man/man3/sigblock.3 /usr/share/man/man3/argz_de=
lete.3 /usr/share/man/man3/mbtowc.3 /usr/share/man/man2/sendfile.2 /usr/sha=
re/man/man3/CPU_ZERO_S.3 /usr/share/man/man3/log2f.3 /usr/share/man/man3/fd=
im.3 /usr/share/man/man3/setlinebuf.3 /usr/share/man/man3/scandirat.3 /usr/=
share/man/man3/initstate_r.3 /usr/share/man/man3/crypt.3 /usr/share/man/man=
3/calloc.3 /usr/share/man/man3/mallopt.3 /usr/share/man/man2/prctl.2 /usr/s=
hare/man/man3/fgetspent_r.3 /usr/share/man/man3/registerrpc.3 /usr/share/ma=
n/man3/memmove.3 /usr/share/man/man3/putw.3 /usr/share/man/man3/execl.3 /us=
r/share/man/man2/readdir.2 /usr/share/man/man3/isalnum.3 /usr/share/man/man=
3/getnetbyaddr.3 /usr/share/man/man3/getutid_r.3 /usr/share/man/man3/cacos.=
3 /usr/share/man/man3/getwc.3 /usr/share/man/man3/iswcntrl.3 /usr/share/man=
/man2/wait3.2 /usr/share/man/man3/nrand48.3 /usr/share/man/man3/catopen.3 /=
usr/share/man/man3/getc.3 /usr/share/man/man3/ldexpf.3 /usr/share/man/man3/=
xdrrec_endofrecord.3 /usr/share/man/man3/inet_addr.3 /usr/share/man/man3/ge=
tnetbyname.3 /usr/share/man/man3/cerfc.3 /usr/share/man/man3/getrpcbyname.3=
 /usr/share/man/man7/shm_overview.7 /usr/share/man/man3/ether_hostton.3 /us=
r/share/man/man3/pthread_attr_setstacksize.3 /usr/share/man/man2/sgetmask.2=
 /usr/share/man/man3/fdimf.3 /usr/share/man/man3/setpwent.3 /usr/share/man/=
man3/iswblank.3 /usr/share/man/man3/towctrans.3 /usr/share/man/man2/create_=
module.2 /usr/share/man/man3/strcpy.3 /usr/share/man/man3/dl_iterate_phdr.3=
 /usr/share/man/man3/round.3 /usr/share/man/man2/waitid.2 /usr/share/man/ma=
n3/localeconv.3 /usr/share/man/man2/pwritev.2 /usr/share/man/man3/acoshf.3 =
/usr/share/man/man3/sinl.3 /usr/share/man/man3/cerf.3 /usr/share/man/man7/l=
atin5.7 /usr/share/man/man2/semtimedop.2 /usr/share/man/man2/mpx.2 /usr/sha=
re/man/man7/credentials.7 /usr/share/man/man2/sysfs.2 /usr/share/man/man3/c=
coshf.3 /usr/share/man/man2/arm_sync_file_range.2 /usr/share/man/man3/getut=
line_r.3 /usr/share/man/man3/execle.3 /usr/share/man/man4/hpsa.4 /usr/share=
/man/man3/getservent.3 /usr/share/man/man3/frexp.3 /usr/share/man/man3/rtim=
e.3 /usr/share/man/man3/nearbyint.3 /usr/share/man/man2/gtty.2 /usr/share/m=
an/man3/openlog.3 /usr/share/man/man3/tgammal.3 /usr/share/man/man2/setgrou=
ps.2 /usr/share/man/man2/rt_sigsuspend.2 /usr/share/man/man2/exit.2 /usr/sh=
are/man/man7/latin7.7 /usr/share/man/man3/ffs.3 /usr/share/man/man3/CIRCLEQ=
_INSERT_HEAD.3 /usr/share/man/man3/get_nprocs.3 /usr/share/man/man3/getw.3 =
/usr/share/man/man3/program_invocation_name.3 /usr/share/man/man3/tdestroy.=
3 /usr/share/man/man3/expl.3 /usr/share/man/man7/latin9.7 /usr/share/man/ma=
n5/hosts.equiv.5 /usr/share/man/man3/ruserok_af.3 /usr/share/man/man3/pthre=
ad_attr_setaffinity_np.3 /usr/share/man/man3/llrintl.3 /usr/share/man/man7/=
posixoptions.7 /usr/share/man/man3/svc_register.3 /usr/share/man/man7/iso-8=
859-14.7 /usr/share/man/man3/confstr.3 /usr/share/man/man7/iso_8859_8.7 /us=
r/share/man/man3/finitef.3 /usr/share/man/man3/clearerr.3 /usr/share/man/ma=
n3/putwchar.3 /usr/share/man/man3/sigaddset.3 /usr/share/man/man2/readahead=
.2 /usr/share/man/man3/getgrouplist.3 /usr/share/man/man3/rcmd.3 /usr/share=
/man/man3/isinff.3 /usr/share/man/man2/personality.2 /usr/share/man/man3/st=
rsignal.3 /usr/share/man/man3/TAILQ_ENTRY.3 /usr/share/man/man3/envz_strip.=
3 /usr/share/man/man3/encrypt.3 /usr/share/man/man3/HUGE_VALF.3 /usr/share/=
man/man3/siglongjmp.3 /usr/share/man/man3/fesetround.3 /usr/share/man/man2/=
symlink.2 /usr/share/man/man3/regfree.3 /usr/share/man/man2/linkat.2 /usr/s=
hare/man/man3/wcsspn.3 /usr/share/man/man7/iso_8859_4.7 /usr/share/man/man3=
/getchar.3 /usr/share/man/man3/malloc.3 /usr/share/man/man3/remquo.3 /usr/s=
hare/man/man2/wait.2 /usr/share/man/man3/CIRCLEQ_REMOVE.3 /usr/share/man/ma=
n3/ispunct.3 /usr/share/man/man3/fpclassify.3 /usr/share/man/man7/iso_8859_=
6.7 /usr/share/man/man3/wmemcmp.3 /usr/share/man/man3/argz_add_sep.3 /usr/s=
hare/man/man2/set_thread_area.2 /usr/share/man/man7/armscii-8.7 /usr/share/=
man/man3/iswgraph.3 /usr/share/man/man3/mmap64.3 /usr/share/man/man2/getrli=
mit.2 /usr/share/man/man5/rpc.5 /usr/share/man/man3/modfl.3 /usr/share/man/=
man2/msgctl.2 /usr/share/man/man3/div.3 /usr/share/man/man3/sqrtl.3 /usr/sh=
are/man/man3/ctanhf.3 /usr/share/man/man3/j0f.3 /usr/share/man/man3/edata.3=
 /usr/share/man/man3/lrint.3 /usr/share/man/man3/cerfcl.3 /usr/share/man/ma=
n3/__fwriting.3 /usr/share/man/man3/acosf.3 /usr/share/man/man3/gmtime_r.3 =
/usr/share/man/man3/gnu_dev_minor.3 /usr/share/man/man2/sched_yield.2 /usr/=
share/man/man3/ptsname.3 /usr/share/man/man3/FD_CLR.3 /usr/share/man/man3/l=
rand48_r.3 /usr/share/man/man3/qecvt_r.3 /usr/share/man/man3/ctanhl.3 /usr/=
share/man/man3/cexp2f.3 /usr/share/man/man3/j0l.3 /usr/share/man/man3/getne=
tent.3 /usr/share/man/man3/isless.3 /usr/share/man/man3/xdr_opaque.3 /usr/s=
hare/man/man3/cfsetospeed.3 /usr/share/man/man5/elf.5 /usr/share/man/man3/a=
texit.3 /usr/share/man/man2/get_mempolicy.2 /usr/share/man/man3/isinfl.3 /u=
sr/share/man/man2/remap_file_pages.2 /usr/share/man/man3/acosh.3 /usr/share=
/man/man2/clock_settime.2 /usr/share/man/man7/koi8-r.7 /usr/share/man/man3/=
getgrent_r.3 /usr/share/man/man3/pthread_sigqueue.3 /usr/share/man/man3/svc=
err_auth.3 /usr/share/man/man3/isalpha.3 /usr/share/man/man3/memalign.3 /us=
r/share/man/man3/fwrite.3 /usr/share/man/man3/setservent.3 /usr/share/man/m=
an3/svcerr_decode.3 /usr/share/man/man7/hier.7 /usr/share/man/man2/killpg.2=
 /usr/share/man/man3/cfgetispeed.3 /usr/share/man/man3/key_secretkey_is_set=
.3 /usr/share/man/man7/rtnetlink.7 /usr/share/man/man3/ynf.3 /usr/share/man=
/man1/intro.1 /usr/share/man/man3/vwarn.3 /usr/share/man/man3/iconv.3 /usr/=
share/man/man3/end.3 /usr/share/man/man3/rintl.3 /usr/share/man/man3/seed48=
.3 /usr/share/man/man2/swapoff.2 /usr/share/man/man5/resolver.5 /usr/share/=
man/man3/acosl.3 /usr/share/man/man4/wavelan.4 /usr/share/man/man3/sethoste=
nt.3 /usr/share/man/man2/path_resolution.2 /usr/share/man/man3/euidaccess.3=
 /usr/share/man/man3/sqrtf.3 /usr/share/man/man3/hdestroy.3 /usr/share/man/=
man3/isspace.3 /usr/share/man/man3/mkfifoat.3 /usr/share/man/man2/setuid.2 =
/usr/share/man/man2/_syscall.2 /usr/share/man/man3/TAILQ_INSERT_TAIL.3 /usr=
/share/man/man7/suffixes.7 /usr/share/man/man2/symlinkat.2 /usr/share/man/m=
an2/clock_nanosleep.2 /usr/share/man/man4/cciss.4 /usr/share/man/man2/sync_=
file_range2.2 /usr/share/man/man3/lckpwdf.3 /usr/share/man/man3/strdup.3 /u=
sr/share/man/man3/asprintf.3 /usr/share/man/man3/getgrgid.3 /usr/share/man/=
man2/umount2.2 /usr/share/man/man3/wcsrtombs.3 /usr/share/man/man3/erand48_=
r.3 /usr/share/man/man2/bdflush.2 /usr/share/man/man3/gamma.3 /usr/share/ma=
n/man2/fchown32.2 /usr/share/man/man3/CPU_COUNT.3 /usr/share/man/man3/LIST_=
HEAD.3 /usr/share/man/man3/getprotoent_r.3 /usr/share/man/man3/pthread_attr=
_setguardsize.3 /usr/share/man/man5/acct.5 /usr/share/man/man3/casinf.3 /us=
r/share/man/man7/netlink.7 /usr/share/man/man5/core.5 /usr/share/man/man3/f=
scanf.3 /usr/share/man/man4/st.4 /usr/share/man/man3/rexec.3 /usr/share/man=
/man3/casinhf.3 /usr/share/man/man3/envz.3 /usr/share/man/man3/pthread_canc=
el.3 /usr/share/man/man5/motd.5 /usr/share/man/man3/inet_lnaof.3 /usr/share=
/man/man3/cexp2l.3 /usr/share/man/man2/times.2 /usr/share/man/man3/pthread_=
setcanceltype.3 /usr/share/man/man3/cbrt.3 /usr/share/man/man3/ferror.3 /us=
r/share/man/man4/fifo.4 /usr/share/man/man3/wcscasecmp.3 /usr/share/man/man=
3/casinhl.3 /usr/share/man/man2/inw_p.2 /usr/share/man/man3/getipnodebyname=
.3 /usr/share/man/man3/fesetexceptflag.3 /usr/share/man/man3/bindresvport.3=
 /usr/share/man/man3/pthread_join.3 /usr/share/man/man3/free.3 /usr/share/m=
an/man2/sendmmsg.2 /usr/share/man/man2/setpgid.2 /usr/share/man/man7/glob.7=
 /usr/share/man/man3/fclose.3 /usr/share/man/man3/mbrtowc.3 /usr/share/man/=
man2/lstat64.2 /usr/share/man/man3/flockfile.3 /usr/share/man/man3/log10f.3=
 /usr/share/man/man7/iso_8859-8.7 /usr/share/man/man3/getrpcbynumber_r.3 /u=
sr/share/man/man3/aio_return.3 /usr/share/man/man3/getline.3 /usr/share/man=
/man2/sched_get_priority_max.2 /usr/share/man/man2/setgid.2 /usr/share/man/=
man3/sscanf.3 /usr/share/man/man5/ftpusers.5 /usr/share/man/man3/signbit.3 =
/usr/share/man/man3/string.3 /usr/share/man/man3/rintf.3 /usr/share/man/man=
2/prof.2 /usr/share/man/man3/pthread_detach.3 /usr/share/man/man3/fgetc_unl=
ocked.3 /usr/share/man/man3/fmod.3 /usr/share/man/man3/toupper.3 /usr/share=
/man/man2/syscall.2 /usr/share/man/man3/canonicalize_file_name.3 /usr/share=
/man/man2/write.2 /usr/share/man/man3/getspent.3 /usr/share/man/man3/wctype=
.3 /usr/share/man/man3/strtoul.3 /usr/share/man/man3/sys_errlist.3 /usr/sha=
re/man/man2/break.2 /usr/share/man/man3/mq_notify.3 /usr/share/man/man3/sca=
lbf.3 /usr/share/man/man3/vlimit.3 /usr/share/man/man3/sigqueue.3 /usr/shar=
e/man/man3/expm1.3 /usr/share/man/man3/tzset.3 /usr/share/man/man2/_exit.2 =
/usr/share/man/man5/nscd.conf.5 /usr/share/man/man3/svc_unregister.3 /usr/s=
hare/man/man3/mq_timedreceive.3 /usr/share/man/man7/icmp.7 /usr/share/man/m=
an3/exp10l.3 /usr/share/man/man3/getpwuid_r.3 /usr/share/man/man2/timer_cre=
ate.2 /usr/share/man/man7/raw.7 /usr/share/man/man2/stat.2 /usr/share/man/m=
an3/pthread_timedjoin_np.3 /usr/share/man/man3/addseverity.3 /usr/share/man=
/man3/getopt.3 /usr/share/man/man3/log1p.3 /usr/share/man/man3/setlogmask.3=
 /usr/share/man/man3/getutent.3 /usr/share/man/man3/isascii.3 /usr/share/ma=
n/man3/gcvt.3 /usr/share/man/man2/getuid.2 /usr/share/man/man3/dirfd.3 /usr=
/share/man/man3/csin.3 /usr/share/man/man3/strstr.3 /usr/share/man/man2/epo=
ll_ctl.2 /usr/share/man/man2/umount.2 /usr/share/man/man2/iopl.2 /usr/share=
/man/man3/lrand48.3 /usr/share/man/man3/intro.3 /usr/share/man/man3/mkdtemp=
.3 /usr/share/man/man3/opendir.3 /usr/share/man/man3/pthread_equal.3 /usr/s=
hare/man/man3/va_arg.3 /usr/share/man/man3/envz_add.3 /usr/share/man/man2/g=
etxattr.2 /usr/share/man/man3/memchr.3 /usr/share/man/man2/futimesat.2 /usr=
/share/man/man3/jn.3 /usr/share/man/man3/y1.3 /usr/share/man/man3/sigsetops=
.3 /usr/share/man/man3/CIRCLEQ_INIT.3 /usr/share/man/man2/chown.2 /usr/shar=
e/man/man4/zero.4 /usr/share/man/man3/LIST_INSERT_HEAD.3 /usr/share/man/man=
7/unicode.7 /usr/share/man/man3/expm1f.3 /usr/share/man/man3/random_r.3 /us=
r/share/man/man3/xdr_u_char.3 /usr/share/man/man2/sigwaitinfo.2 /usr/share/=
man/man3/gnu_dev_major.3 /usr/share/man/man3/key_gendes.3 /usr/share/man/ma=
n3/catan.3 /usr/share/man/man3/svc_getreqset.3 /usr/share/man/man3/__fwrita=
ble.3 /usr/share/man/man2/inotify_init1.2 /usr/share/man/man3/authunix_crea=
te.3 /usr/share/man/man3/cexpl.3 /usr/share/man/man7/iso_8859-6.7 /usr/shar=
e/man/man3/catanl.3 /usr/share/man/man3/getenv.3 /usr/share/man/man3/svcerr=
_systemerr.3 /usr/share/man/man2/sched_getscheduler.2 /usr/share/man/man3/t=
oascii.3 /usr/share/man/man3/getfsent.3 /usr/share/man/man3/lcong48.3 /usr/=
share/man/man7/iso_8859-4.7 /usr/share/man/man3/infnan.3 /usr/share/man/man=
3/optarg.3 /usr/share/man/man3/getchar_unlocked.3 /usr/share/man/man3/ceil.=
3 /usr/share/man/man3/cexpf.3 /usr/share/man/man3/csinh.3 /usr/share/man/ma=
n3/ftok.3 /usr/share/man/man2/fsync.2 /usr/share/man/man2/inotify_add_watch=
.2 /usr/share/man/man2/shmop.2 /usr/share/man/man2/outb_p.2 /usr/share/man/=
man3/ctan.3 /usr/share/man/man3/dlerror.3 /usr/share/man/man7/symlink.7 /us=
r/share/man/man7/latin10.7 /usr/share/man/man2/unshare.2 /usr/share/man/man=
3/LIST_INIT.3 /usr/share/man/man3/__fsetlocking.3 /usr/share/man/man3/imaxa=
bs.3 /usr/share/man/man3/csinf.3 /usr/share/man/man3/hypotf.3 /usr/share/ma=
n/man3/casinl.3 /usr/share/man/man2/semctl.2 /usr/share/man/man2/truncate.2=
 /usr/share/man/man4/dsp56k.4 /usr/share/man/man7/cpuset.7 /usr/share/man/m=
an3/funlockfile.3 /usr/share/man/man3/lgammaf.3 /usr/share/man/man3/qfcvt_r=
.3 /usr/share/man/man3/ceilf.3 /usr/share/man/man3/program_invocation_short=
_name.3 /usr/share/man/man3/getfsfile.3 /usr/share/man/man2/sched_setparam.=
2 /usr/share/man/man3/mbstowcs.3 /usr/share/man/man2/ioctl_list.2 /usr/shar=
e/man/man7/charsets.7 /usr/share/man/man3/svcerr_noprog.3 /usr/share/man/ma=
n4/vcs.4 /usr/share/man/man3/pthread_attr_getstackaddr.3 /usr/share/man/man=
2/vmsplice.2 /usr/share/man/man3/finitel.3 /usr/share/man/man2/kill.2 /usr/=
share/man/man2/sched_getaffinity.2 /usr/share/man/man3/getrpcent_r.3 /usr/s=
hare/man/man3/pthread_attr_setstack.3 /usr/share/man/man3/clock_gettime.3 /=
usr/share/man/man3/cuserid.3 /usr/share/man/man3/getusershell.3 /usr/share/=
man/man3/strtod.3 /usr/share/man/man2/epoll_create.2 /usr/share/man/man2/ou=
tl_p.2 /usr/share/man/man7/ascii.7 /usr/share/man/man3/pututxline.3 /usr/sh=
are/man/man4/mem.4 /usr/share/man/man4/fd.4 /usr/share/man/man2/setresgid32=
.2 /usr/share/man/man3/clnt_geterr.3 /usr/share/man/man3/HUGE_VALL.3 /usr/s=
hare/man/man3/clog10.3 /usr/share/man/man3/pclose.3 /usr/share/man/man2/syn=
c_file_range.2 /usr/share/man/man3/popen.3 /usr/share/man/man2/getdtablesiz=
e.2 /usr/share/man/man3/err.3 /usr/share/man/man3/getspent_r.3 /usr/share/m=
an/man3/CPU_AND.3 /usr/share/man/man3/csinhl.3 /usr/share/man/man3/strtof.3=
 /usr/share/man/man7/iso-8859-9.7 /usr/share/man/man3/exp2l.3 /usr/share/ma=
n/man2/umask.2 /usr/share/man/man3/csqrt.3 /usr/share/man/man3/argz_count.3=
 /usr/share/man/man3/daemon.3 /usr/share/man/man3/va_copy.3 /usr/share/man/=
man2/rt_sigqueueinfo.2 /usr/share/man/man7/iso-8859-7.7 /usr/share/man/man3=
/NAN.3 /usr/share/man/man3/csinhf.3 /usr/share/man/man3/creal.3 /usr/share/=
man/man3/modf.3 /usr/share/man/man3/xdr_char.3 /usr/share/man/man3/wmemcpy.=
3 /usr/share/man/man3/CIRCLEQ_ENTRY.3 /usr/share/man/man2/fchownat.2 /usr/s=
hare/man/man3/fexecve.3 /usr/share/man/man3/pthread_attr_getschedparam.3 /u=
sr/share/man/man3/getopt_long_only.3 /usr/share/man/man2/adjtimex.2 /usr/sh=
are/man/man2/ustat.2 /usr/share/man/man3/clock_getcpuclockid.3 /usr/share/m=
an/man3/index.3 /usr/share/man/man3/rresvport.3 /usr/share/man/man3/gethost=
byname2.3 /usr/share/man/man7/iso_8859_10.7 /usr/share/man/man3/expm1l.3 /u=
sr/share/man/man7/iso_8859-14.7 /usr/share/man/man2/stime.2 /usr/share/man/=
man2/fdatasync.2 /usr/share/man/man2/select_tut.2 /usr/share/man/man2/ssetm=
ask.2 /usr/share/man/man3/mempcpy.3 /usr/share/man/man7/iso_8859_14.7 /usr/=
share/man/man3/swapcontext.3 /usr/share/man/man3/fflush_unlocked.3 /usr/sha=
re/man/man3/setgrent.3 /usr/share/man/man7/iso_8859-10.7 /usr/share/man/man=
2/mkdirat.2 /usr/share/man/man2/fstatfs64.2 /usr/share/man/man2/rt_tgsigque=
ueinfo.2 /usr/share/man/man3/CPU_ALLOC.3 /usr/share/man/man3/gai_suspend.3 =
/usr/share/man/man3/fnmatch.3 /usr/share/man/man2/spu_create.2 /usr/share/m=
an/man3/mq_getattr.3 /usr/share/man/man2/process_vm_writev.2 /usr/share/man=
/man3/minor.3 /usr/share/man/man7/mdoc.7 /usr/share/man/man3/fenv.3 /usr/sh=
are/man/man2/getdomainname.2 /usr/share/man/man3/wcscspn.3 /usr/share/man/m=
an3/log10.3 /usr/share/man/man3/encrypt_r.3 /usr/share/man/man2/removexattr=
.2 /usr/share/man/man3/rint.3 /usr/share/man/man3/setkey.3 /usr/share/man/m=
an3/key_setsecret.3 /usr/share/man/man3/_flushlbf.3 /usr/share/man/man3/CIR=
CLEQ_INSERT_AFTER.3 /usr/share/man/man4/lp.4 /usr/share/man/man7/koi8-u.7 /=
usr/share/man/man3/roundl.3 /usr/share/man/man7/iso_8859-7.7 /usr/share/man=
/man3/clog2f.3 /usr/share/man/man1/getent.1 /usr/share/man/man2/mknod.2 /us=
r/share/man/man3/setaliasent.3 /usr/share/man/man3/fcloseall.3 /usr/share/m=
an/man3/lio_listio.3 /usr/share/man/man3/remainder.3 /usr/share/man/man3/sp=
rintf.3 /usr/share/man/man3/fread_unlocked.3 /usr/share/man/man2/ioctl.2 /u=
sr/share/man/man3/pthread_attr_getaffinity_np.3 /usr/share/man/man3/drem.3 =
/usr/share/man/man3/sigfillset.3 /usr/share/man/man2/free_hugepages.2 /usr/=
share/man/man7/sigevent.7 /usr/share/man/man3/nextafterl.3 /usr/share/man/m=
an2/lchown.2 /usr/share/man/man3/pthread_attr_destroy.3 /usr/share/man/man3=
/atol.3 /usr/share/man/man3/lgamma.3 /usr/share/man/man3/qecvt.3 /usr/share=
/man/man4/null.4 /usr/share/man/man3/va_start.3 /usr/share/man/man3/cfgetos=
peed.3 /usr/share/man/man3/envz_remove.3 /usr/share/man/man3/scalbnf.3 /usr=
/share/man/man2/_llseek.2 /usr/share/man/man3/tsearch.3 /usr/share/man/man3=
/sigignore.3 /usr/share/man/man2/shmget.2 /usr/share/man/man7/utf-8.7 /usr/=
share/man/man3/netlink.3 /usr/share/man/man3/endfsent.3 /usr/share/man/man2=
/sigtimedwait.2 /usr/share/man/man3/fgetgrent_r.3 /usr/share/man/man3/modff=
.3 /usr/share/man/man2/inb_p.2 /usr/share/man/man2/get_thread_area.2 /usr/s=
hare/man/man7/operator.7 /usr/share/man/man3/CPU_SET.3 /usr/share/man/man3/=
getaliasbyname.3 /usr/share/man/man3/pthread_kill.3 /usr/share/man/man3/get=
pt.3 /usr/share/man/man3/cfsetispeed.3 /usr/share/man/man3/endmntent.3 /usr=
/share/man/man3/hdestroy_r.3 /usr/share/man/man2/munlockall.2 /usr/share/ma=
n/man3/ccos.3 /usr/share/man/man3/random.3 /usr/share/man/man3/mcheck.3 /us=
r/share/man/man3/setbuf.3 /usr/share/man/man3/logout.3 /usr/share/man/man3/=
clog.3 /usr/share/man/man5/filesystems.5 /usr/share/man/man3/feenableexcept=
.3 /usr/share/man/man3/pthread_attr_setscope.3 /usr/share/man/man3/iswupper=
.3 /usr/share/man/man3/getwchar_unlocked.3 /usr/share/man/man3/readdir.3 /u=
sr/share/man/man3/xdr_short.3 /usr/share/man/man3/tmpnam.3 /usr/share/man/m=
an3/wcsnrtombs.3 /usr/share/man/man2/mknodat.2 /usr/share/man/man3/atan2.3 =
/usr/share/man/man7/unix.7 /usr/share/man/man2/tee.2 /usr/share/man/man3/ca=
llrpc.3 /usr/share/man/man3/getgrnam_r.3 /usr/share/man/man2/pciconfig_read=
.2 /usr/share/man/man3/scalbnl.3 /usr/share/man/man3/getrpcport.3 /usr/shar=
e/man/man3/__freadable.3 /usr/share/man/man3/updwtmpx.3 /usr/share/man/man3=
/getnetbyname_r.3 /usr/share/man/man7/ipv6.7 /usr/share/man/man3/ftw.3 /usr=
/share/man/man3/sigandset.3 /usr/share/man/man3/svc_destroy.3 /usr/share/ma=
n/man3/log2l.3 /usr/share/man/man3/roundf.3 /usr/share/man/man3/inet_aton.3=
 /usr/share/man/man7/iso-8859-16.7 /usr/share/man/man2/sigaltstack.2 /usr/s=
hare/man/man3/lsearch.3 /usr/share/man/man2/add_key.2 /usr/share/man/man3/x=
drrec_skiprecord.3 /usr/share/man/man3/fdopen.3 /usr/share/man/man3/svcerr_=
progvers.3 /usr/share/man/man3/feholdexcept.3 /usr/share/man/man3/svcudp_bu=
fcreate.3 /usr/share/man/man3/xdr_getpos.3 /usr/share/man/man7/iso-8859-10.=
7 /usr/share/man/man2/set_tid_address.2 /usr/share/man/man3/wcscpy.3 /usr/s=
hare/man/man3/putspent.3 /usr/share/man/man3/ntohs.3 /usr/share/man/man3/ge=
tutmpx.3 /usr/share/man/man3/timezone.3 /usr/share/man/man2/madvise1.2 /usr=
/share/man/man3/fseeko.3 /usr/share/man/man3/wcslen.3 /usr/share/man/man3/c=
sqrtl.3 /usr/share/man/man3/system.3 /usr/share/man/man3/atan.3 /usr/share/=
man/man3/freeaddrinfo.3 /usr/share/man/man3/strncmp.3 /usr/share/man/man3/w=
csstr.3 /usr/share/man/man2/nice.2 /usr/share/man/man3/be32toh.3 /usr/share=
/man/man3/initstate.3 /usr/share/man/man2/insw.2 /usr/share/man/man3/CPU_EQ=
UAL_S.3 /usr/share/man/man2/rmdir.2 /usr/share/man/man3/xdrstdio_create.3 /=
usr/share/man/man3/makedev.3 /usr/share/man/man3/cimagf.3 /usr/share/man/ma=
n3/ldexpl.3 /usr/share/man/man3/trunc.3 /usr/share/man/man3/lround.3 /usr/s=
hare/man/man7/man.7 /usr/share/man/man3/le64toh.3 /usr/share/man/man3/clogf=
.3 /usr/share/man/man3/strrchr.3 /usr/share/man/man2/accept.2 /usr/share/ma=
n/man3/strxfrm.3 /usr/share/man/man3/gethostent.3 /usr/share/man/man3/syslo=
g.3 /usr/share/man/man3/sched_getcpu.3 /usr/share/man/man3/hsearch_r.3 /usr=
/share/man/man2/fstatvfs.2 /usr/share/man/man3/CMSG_FIRSTHDR.3 /usr/share/m=
an/man5/networks.5 /usr/share/man/man3/hstrerror.3 /usr/share/man/man3/tmpn=
am_r.3 /usr/share/man/man5/dir_colors.5 /usr/share/man/man3/ether_aton.3 /u=
sr/share/man/man3/futimes.3 /usr/share/man/man3/re_exec.3 /usr/share/man/ma=
n2/setreuid.2 /usr/share/man/man7/libc.7 /usr/share/man/man3/pthread_attr_g=
etdetachstate.3 /usr/share/man/man3/sighold.3 /usr/share/man/man3/strncasec=
mp.3 /usr/share/man/man2/setxattr.2 /usr/share/man/man2/uselib.2 /usr/share=
/man/man3/feof_unlocked.3 /usr/share/man/man3/clntraw_create.3 /usr/share/m=
an/man3/tcsetpgrp.3 /usr/share/man/man3/catanhl.3 /usr/share/man/man7/iso-8=
859-2.7 /usr/share/man/man3/opterr.3 /usr/share/man/man7/iso-8859-4.7 /usr/=
share/man/man2/pread.2 /usr/share/man/man3/log1pl.3 /usr/share/man/man3/isw=
space.3 /usr/share/man/man2/sigpending.2 /usr/share/man/man3/insque.3 /usr/=
share/man/man3/fmaxl.3 /usr/share/man/man3/tcflush.3 /usr/share/man/man3/ll=
rintf.3 /usr/share/man/man2/renameat.2 /usr/share/man/man3/ilogbf.3 /usr/sh=
are/man/man3/imaxdiv.3 /usr/share/man/man3/cos.3 /usr/share/man/man2/mq_tim=
edreceive.2 /usr/share/man/man2/faccessat.2 /usr/share/man/man3/lfind.3 /us=
r/share/man/man5/resolv.conf.5 /usr/share/man/man3/iscntrl.3 /usr/share/man=
/man3/iswxdigit.3 /usr/share/man/man3/getprotobynumber_r.3 /usr/share/man/m=
an2/setuid32.2 /usr/share/man/man3/hypot.3 /usr/share/man/man3/ldexp.3 /usr=
/share/man/man3/CPU_SET_S.3 /usr/share/man/man3/CMSG_SPACE.3 /usr/share/man=
/man3/exit.3 /usr/share/man/man3/inet_ntoa.3 /usr/share/man/man3/getwc_unlo=
cked.3 /usr/share/man/man3/erf.3 /usr/share/man/man2/fadvise64_64.2 /usr/sh=
are/man/man3/pthread_attr_getscope.3 /usr/share/man/man2/shmdt.2 /usr/share=
/man/man2/eventfd2.2 /usr/share/man/man3/pathconf.3 /usr/share/man/man3/sca=
lb.3 /usr/share/man/man7/ip.7 /usr/share/man/man3/strncpy.3 /usr/share/man/=
man3/execvp.3 /usr/share/man/man3/drand48_r.3 /usr/share/man/man3/tcsendbre=
ak.3 /usr/share/man/man3/dlsym.3 /usr/share/man/man3/sem_destroy.3 /usr/sha=
re/man/man3/ftell.3 /usr/share/man/man3/CPU_FREE.3 /usr/share/man/man3/erro=
r_one_per_line.3 /usr/share/man/man3/j1f.3 /usr/share/man/man3/wcscmp.3 /us=
r/share/man/man2/sethostid.2 /usr/share/man/man8/nscd.8 /usr/share/man/man2=
/poll.2 /usr/share/man/man3/svcfd_create.3 /usr/share/man/man3/fcvt_r.3 /us=
r/share/man/man3/shm_open.3 /usr/share/man/man3/ctanf.3 /usr/share/man/man3=
/ffsll.3 /usr/share/man/man2/mprotect.2 /usr/share/man/man3/cerfcf.3 /usr/s=
hare/man/man3/htole16.3 /usr/share/man/man3/rpc.3 /usr/share/man/man3/glob.=
3 /usr/share/man/man2/mq_getsetattr.2 /usr/share/man/man3/isatty.3 /usr/sha=
re/man/man3/timegm.3 /usr/share/man/man2/listxattr.2 /usr/share/man/man3/at=
oq.3 /usr/share/man/man3/ungetwc.3 /usr/share/man/man3/hcreate.3 /usr/share=
/man/man3/cosl.3 /usr/share/man/man2/getresgid32.2 /usr/share/man/man3/xdr_=
pointer.3 /usr/share/man/man3/getnetgrent.3 /usr/share/man/man3/iconv_close=
.3 /usr/share/man/man3/frexpf.3 /usr/share/man/man2/getpriority.2 /usr/shar=
e/man/man2/mincore.2 /usr/share/man/man3/hasmntopt.3 /usr/share/man/man8/in=
tro.8 /usr/share/man/man3/scalblnf.3 /usr/share/man/man3/y0l.3 /usr/share/m=
an/man5/securetty.5 /usr/share/man/man3/clearenv.3 /usr/share/man/man3/loca=
ltime_r.3 /usr/share/man/man4/sd.4 /usr/share/man/man3/fts_open.3 /usr/shar=
e/man/man3/nextafter.3 /usr/share/man/man4/intro.4 /usr/share/man/man3/near=
byintf.3 /usr/share/man/man3/pthread_getschedparam.3 /usr/share/man/man2/in=
it_module.2 /usr/share/man/man2/futex.2 /usr/share/man/man2/pciconfig_write=
.2 /usr/share/man/man3/ynl.3 /usr/share/man/man2/sync.2 /usr/share/man/man2=
/mq_notify.2 /usr/share/man/man3/cexp.3 /usr/share/man/man3/memcpy.3 /usr/s=
hare/man/man3/vwarnx.3 /usr/share/man/man2/chmod.2 /usr/share/man/man2/inl_=
p.2 /usr/share/man/man3/offsetof.3 /usr/share/man/man3/fwprintf.3 /usr/shar=
e/man/man3/ether_ntoa.3 /usr/share/man/man3/htole32.3 /usr/share/man/man3/v=
times.3 /usr/share/man/man3/getsubopt.3 /usr/share/man/man2/sched_rr_get_in=
terval.2 /usr/share/man/man2/clone2.2 /usr/share/man/man3/stdin.3 /usr/shar=
e/man/man3/getnetent_r.3 /usr/share/man/man3/ctanl.3 /usr/share/man/man3/si=
gdelset.3 /usr/share/man/man5/slabinfo.5 /usr/share/man/man2/statvfs.2 /usr=
/share/man/man3/setusershell.3 /usr/share/man/man3/vscanf.3 /usr/share/man/=
man3/j0.3 /usr/share/man/man2/pread64.2 /usr/share/man/man3/xdr_destroy.3 /=
usr/share/man/man2/oldlstat.2 /usr/share/man/man3/bzero.3 /usr/share/man/ma=
n4/rtc.4 /usr/share/man/man3/tanh.3 /usr/share/man/man7/sem_overview.7 /usr=
/share/man/man4/console_codes.4 /usr/share/man/man3/malloc_usable_size.3 /u=
sr/share/man/man3/fpurge.3 /usr/share/man/man2/getdents64.2 /usr/share/man/=
man3/xdr_callmsg.3 /usr/share/man/man2/time.2 /usr/share/man/man2/lgetxattr=
.2 /usr/share/man/man3/mkstemps.3 /usr/share/man/man2/llseek.2 /usr/share/m=
an/man3/argz_create.3 /usr/share/man/man3/yn.3 /usr/share/man/man3/ntohl.3 =
/usr/share/man/man3/getfsspec.3 /usr/share/man/man7/capabilities.7 /usr/sha=
re/man/man3/xencrypt.3 /usr/share/man/man2/sendmsg.2 /usr/share/man/man3/fo=
rkpty.3 /usr/share/man/man3/memccpy.3 /usr/share/man/man2/getrusage.2 /usr/=
share/man/man3/CMSG_ALIGN.3 /usr/share/man/man3/erfc.3 /usr/share/man/man3/=
atoi.3 /usr/share/man/man3/CIRCLEQ_INSERT_TAIL.3 /usr/share/man/man3/getspn=
am_r.3 /usr/share/man/man3/twalk.3 /usr/share/man/man2/alarm.2 /usr/share/m=
an/man3/res_init.3 /usr/share/man/man3/cprojl.3 /usr/share/man/man3/putchar=
_unlocked.3 /usr/share/man/man3/getaliasbyname_r.3 /usr/share/man/man3/eran=
d48.3 /usr/share/man/man3/fts_close.3 /usr/share/man/man3/getdirentries.3 /=
usr/share/man/man3/catanh.3 /usr/share/man/man3/getaddrinfo.3 /usr/share/ma=
n/man3/llrint.3 /usr/share/man/man3/mq_open.3 /usr/share/man/man2/_sysctl.2=
 /usr/share/man/man3/sigset.3 /usr/share/man/man3/telldir.3 /usr/share/man/=
man3/rexec_af.3 /usr/share/man/man3/ldiv.3 /usr/share/man/man3/mrand48.3 /u=
sr/share/man/man3/scalbn.3 /usr/share/man/man3/getipnodebyaddr.3 /usr/share=
/man/man3/pthread_kill_other_threads_np.3 /usr/share/man/man3/gai_error.3 /=
usr/share/man/man2/select.2 /usr/share/man/man3/wcrtomb.3 /usr/share/man/ma=
n3/rand_r.3 /usr/share/man/man3/gethostbyaddr.3 /usr/share/man/man2/inotify=
_rm_watch.2 /usr/share/man/man5/nologin.5 /usr/share/man/man3/error_at_line=
.3 /usr/share/man/man3/setenv.3 /usr/share/man/man3/scalbl.3 /usr/share/man=
/man3/atanhf.3 /usr/share/man/man3/mbsnrtowcs.3 /usr/share/man/man3/cpow.3 =
/usr/share/man/man3/klogctl.3 /usr/share/man/man3/argz_append.3 /usr/share/=
man/man2/readlink.2 /usr/share/man/man3/sigismember.3 /usr/share/man/man2/m=
sgsnd.2 /usr/share/man/man3/logf.3 /usr/share/man/man3/tanhl.3 /usr/share/m=
an/man3/res_query.3 /usr/share/man/man3/inet.3 /usr/share/man/man3/signific=
andf.3 /usr/share/man/man3/fma.3 /usr/share/man/man3/ether_ntoa_r.3 /usr/sh=
are/man/man2/getpagesize.2 /usr/share/man/man3/seekdir.3 /usr/share/man/man=
2/mlockall.2 /usr/share/man/man2/statfs64.2 /usr/share/man/man3/nexttoward.=
3 /usr/share/man/man4/tty_ioctl.4 /usr/share/man/man3/va_end.3 /usr/share/m=
an/man3/regexec.3 /usr/share/man/man3/exec.3 /usr/share/man/man3/acos.3 /us=
r/share/man/man3/feof.3 /usr/share/man/man2/lstat.2 /usr/share/man/man3/end=
protoent.3 /usr/share/man/man3/LIST_REMOVE.3 /usr/share/man/man3/memfrob.3 =
/usr/share/man/man3/wctomb.3 /usr/share/man/man3/asinhl.3 /usr/share/man/ma=
n3/cerff.3 /usr/share/man/man7/man-pages.7 /usr/share/man/man3/pthread_tryj=
oin_np.3 /usr/share/man/man2/rt_sigpending.2 /usr/share/man/man7/iso-8859-1=
5.7 /usr/share/man/man3/ttyname_r.3 /usr/share/man/man3/erfcl.3 /usr/share/=
man/man3/jrand48_r.3 /usr/share/man/man2/mremap.2 /usr/share/man/man6/intro=
.6 /usr/share/man/man3/setjmp.3 /usr/share/man/man7/tis-620.7 /usr/share/ma=
n/man3/sockatmark.3 /usr/share/man/man5/locale.5 /usr/share/man/man2/gettid=
.2 /usr/share/man/man2/getgroups32.2 /usr/share/man/man3/__fbufsize.3 /usr/=
share/man/man3/getwchar.3 /usr/share/man/man3/memset.3 /usr/share/man/man2/=
getpeername.2 /usr/share/man/man3/fwide.3 /usr/share/man/man2/timer_getover=
run.2 /usr/share/man/man3/endgrent.3 /usr/share/man/man4/futex.4 /usr/share=
/man/man3/tcgetattr.3 /usr/share/man/man3/regex.3 /usr/share/man/man7/iso_8=
859_16.7 /usr/share/man/man3/fegetexceptflag.3 /usr/share/man/man7/intro.7 =
/usr/share/man/man3/srandom_r.3 /usr/share/man/man3/catclose.3 /usr/share/m=
an/man3/xdr_replymsg.3 /usr/share/man/man3/fprintf.3 /usr/share/man/man3/xd=
r_void.3 /usr/share/man/man3/cimagl.3 /usr/share/man/man2/sched_get_priorit=
y_min.2 /usr/share/man/man2/getegid.2 /usr/share/man/man3/getservbyname.3 /=
usr/share/man/man2/fstatfs.2 /usr/share/man/man3/coshl.3 /usr/share/man/man=
2/fgetxattr.2 /usr/share/man/man3/floor.3 /usr/share/man/man3/__flbf.3 /usr=
/share/man/man5/host.conf.5 /usr/share/man/man2/inw.2 /usr/share/man/man3/o=
n_exit.3 /usr/share/man/man3/dlopen.3 /usr/share/man/man3/pthread_attr_init=
.3 /usr/share/man/man3/strtoumax.3 /usr/share/man/man3/rresvport_af.3 /usr/=
share/man/man2/sigsuspend.2 /usr/share/man/man3/strtoimax.3 /usr/share/man/=
man3/getmntent.3 /usr/share/man/man3/CIRCLEQ_INSERT_BEFORE.3 /usr/share/man=
/man2/fadvise64.2 /usr/share/man/man3/aio_write.3 /usr/share/man/man3/pthre=
ad_attr_getschedpolicy.3 /usr/share/man/man3/sigemptyset.3 /usr/share/man/m=
an3/xdr_wrapstring.3 /usr/share/man/man5/ipc.5 /usr/share/man/man7/iso_8859=
_3.7 /usr/share/man/man2/getegid32.2 /usr/share/man/man3/pthread_getcpucloc=
kid.3 /usr/share/man/man3/ruserok.3 /usr/share/man/man3/cfmakeraw.3 /usr/sh=
are/man/man2/fchmodat.2 /usr/share/man/man3/fmaxf.3 /usr/share/man/man3/svc=
err_noproc.3 /usr/share/man/man3/jnf.3 /usr/share/man/man2/timerfd_create.2=
 /usr/share/man/man3/gai_strerror.3 /usr/share/man/man3/setfsent.3 /usr/sha=
re/man/man3/xdr_opaque_auth.3 /usr/share/man/man3/mrand48_r.3 /usr/share/ma=
n/man2/timer_settime.2 /usr/share/man/man3/malloc_info.3 /usr/share/man/man=
3/inet_netof.3 /usr/share/man/man3/timeradd.3 /usr/share/man/man7/x25.7 /us=
r/share/man/man4/full.4 /usr/share/man/man2/readv.2 /usr/share/man/man3/get=
utent_r.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man2/chown32.2 /us=
r/share/man/man3/wmemchr.3 /usr/share/man/man3/getutxline.3 /usr/share/man/=
man2/acct.2 /usr/share/man/man3/CPU_OR.3 /usr/share/man/man3/sem_post.3 /us=
r/share/man/man3/strtouq.3 /usr/share/man/man3/clog2l.3 /usr/share/man/man3=
/conj.3 /usr/share/man/man2/io_setup.2 /usr/share/man/man3/getaliasent_r.3 =
/usr/share/man/man4/tty.4 /usr/share/man/man2/ioprio_get.2 /usr/share/man/m=
an3/login_tty.3 /usr/share/man/man3/pow.3 /usr/share/man/man7/latin2.7 /usr=
/share/man/man3/mbrlen.3 /usr/share/man/man7/svipc.7 /usr/share/man/man3/un=
lockpt.3 /usr/share/man/man3/clntudp_create.3 /usr/share/man/man3/cabs.3 /u=
sr/share/man/man2/tkill.2 /usr/share/man/man7/iso_8859-2.7 /usr/share/man/m=
an7/termio.7 /usr/share/man/man3/sincos.3 /usr/share/man/man3/strchr.3 /usr=
/share/man/man3/getservent_r.3 /usr/share/man/man2/gettimeofday.2 /usr/shar=
e/man/man3/pow10.3 /usr/share/man/man3/abs.3 /usr/share/man/man3/cabsf.3 /u=
sr/share/man/man3/xcrypt.3 /usr/share/man/man3/towlower.3 /usr/share/man/ma=
n2/llistxattr.2 /usr/share/man/man2/flistxattr.2 /usr/share/man/man3/fsetpo=
s.3 /usr/share/man/man5/tzfile.5 /usr/share/man/man3/ttyname.3 /usr/share/m=
an/man3/fabsf.3 /usr/share/man/man3/fileno_unlocked.3 /usr/share/man/man3/H=
UGE_VAL.3 /usr/share/man/man2/munmap.2 /usr/share/man/man7/latin4.7 /usr/sh=
are/man/man2/setgid32.2 /usr/share/man/man3/fgetc.3 /usr/share/man/man2/out=
sl.2 /usr/share/man/man3/mkostemps.3 /usr/share/man/man3/jnl.3 /usr/share/m=
an/man3/clock.3 /usr/share/man/man2/gethostname.2 /usr/share/man/man3/makec=
ontext.3 /usr/share/man/man3/log2.3 /usr/share/man/man3/setnetent.3 /usr/sh=
are/man/man3/putwchar_unlocked.3 /usr/share/man/man2/vfork.2 /usr/share/man=
/man3/xdr_reference.3 /usr/share/man/man2/shmat.2 /usr/share/man/man3/vswpr=
intf.3 /usr/share/man/man3/isgreaterequal.3 /usr/share/man/man3/powf.3 /usr=
/share/man/man3/TAILQ_INSERT_AFTER.3 /usr/share/man/man4/kmem.4 /usr/share/=
man/man3/mktemp.3 /usr/share/man/man3/globfree.3 /usr/share/man/man2/getpgr=
p.2 /usr/share/man/man3/MB_CUR_MAX.3 /usr/share/man/man3/wcsdup.3 /usr/shar=
e/man/man3/ssignal.3 /usr/share/man/man2/recvmmsg.2 /usr/share/man/man3/get=
_nprocs_conf.3 /usr/share/man/man5/shells.5 /usr/share/man/man2/mount.2 /us=
r/share/man/man3/cacosh.3 /usr/share/man/man3/putgrent.3 /usr/share/man/man=
3/xdr_double.3 /usr/share/man/man3/strcat.3 /usr/share/man/man3/sgetspent_r=
.3 /usr/share/man/man3/fpathconf.3 /usr/share/man/man2/ppoll.2 /usr/share/m=
an/man8/ld-linux.so.8 /usr/share/man/man3/ctermid.3 /usr/share/man/man3/fts=
_read.3 /usr/share/man/man2/getitimer.2 /usr/share/man/man8/zdump.8 /usr/sh=
are/man/man2/capset.2 /usr/share/man/man2/tuxcall.2 /usr/share/man/man3/ver=
sionsort.3 /usr/share/man/man3/xdr_authunix_parms.3 /usr/share/man/man3/get=
date_err.3 /usr/share/man/man3/dladdr.3 /usr/share/man/man3/auth_destroy.3 =
/usr/share/man/man2/syslog.2 /usr/share/man/man7/hostname.7 /usr/share/man/=
man3/putchar.3 /usr/share/man/man3/pthread_sigmask.3 /usr/share/man/man2/ge=
tgid.2 /usr/share/man/man3/cexp2.3 /usr/share/man/man3/CPU_ALLOC_SIZE.3 /us=
r/share/man/man3/CPU_ZERO.3 /usr/share/man/man3/getpwnam.3 /usr/share/man/m=
an2/timerfd_gettime.2 /usr/share/man/man3/ctime.3 /usr/share/man/man3/svc_g=
etcaller.3 /usr/share/man/man3/getutline.3 /usr/share/man/man3/getlogin_r.3=
 /usr/share/man/man3/memcmp.3 /usr/share/man/man3/utmpname.3 /usr/share/man=
/man3/gnu_dev_makedev.3 /usr/share/man/man2/unlink.2 /usr/share/man/man2/ge=
tsockname.2 /usr/share/man/man3/argz_stringify.3 /usr/share/man/man3/verrx.=
3 /usr/share/man/man3/argz_add.3 /usr/share/man/man3/setstate.3 /usr/share/=
man/man3/rpmatch.3 /usr/share/man/man2/getgroups.2 /usr/share/man/man2/sock=
etpair.2 /usr/share/man/man2/nanosleep.2 /usr/share/man/man3/mcheck_pedanti=
c.3 /usr/share/man/man2/lremovexattr.2 /usr/share/man/man8/ld.so.8 /usr/sha=
re/man/man3/getprotobyname_r.3 /usr/share/man/man2/pivot_root.2 /usr/share/=
man/man3/strpbrk.3 /usr/share/man/man3/getdate.3 /usr/share/man/man2/setfsg=
id.2 /usr/share/man/man3/rcmd_af.3 /usr/share/man/man3/recno.3 /usr/share/m=
an/man4/ptmx.4 /usr/share/man/man3/key_decryptsession.3 /usr/share/man/man8=
/tzselect.8 /usr/share/man/man3/endnetent.3 /usr/share/man/man2/mq_open.2 /=
usr/share/man/man2/rename.2 /usr/share/man/man3/bsd_signal.3 /usr/share/man=
/man7/socket.7 /usr/share/man/man3/isnanl.3 /usr/share/man/man3/malloc_hook=
.3 /usr/share/man/man3/alphasort.3 /usr/share/man/man3/significandl.3 /usr/=
share/man/man3/seed48_r.3 /usr/share/man/man3/xprt_unregister.3 /usr/share/=
man/man3/y0.3 /usr/share/man/man3/isgreater.3 /usr/share/man/man3/getservby=
port.3 /usr/share/man/man2/access.2 /usr/share/man/man3/memmem.3 /usr/share=
/man/man3/clnt_perrno.3 /usr/share/man/man3/endnetgrent.3 /usr/share/man/ma=
n3/conjl.3 /usr/share/man/man3/fopen.3 /usr/share/man/man3/scalbln.3 /usr/s=
hare/man/man3/a64l.3 /usr/share/man/man2/sigprocmask.2 /usr/share/man/man3/=
strtoq.3 /usr/share/man/man3/pututline.3 /usr/share/man/man3/cimag.3 /usr/s=
hare/man/man2/geteuid32.2 /usr/share/man/man3/clnt_freeres.3 /usr/share/man=
/man3/fts.3 /usr/share/man/man3/getpwent.3 /usr/share/man/man3/endian.3 /us=
r/share/man/man2/unimplemented.2 /usr/share/man/man3/pthread_self.3 /usr/sh=
are/man/man3/mprobe.3 /usr/share/man/man3/hypotl.3 /usr/share/man/man3/clos=
edir.3 /usr/share/man/man3/wcsrchr.3 /usr/share/man/man3/getservbyname_r.3 =
/usr/share/man/man4/ttyS.4 /usr/share/man/man3/hash.3 /usr/share/man/man2/t=
imerfd_settime.2 /usr/share/man/man2/io_destroy.2 /usr/share/man/man3/stpcp=
y.3 /usr/share/man/man2/ftruncate64.2 /usr/share/man/man2/sigaction.2 /usr/=
share/man/man3/xprt_register.3 /usr/share/man/man3/gethostbyaddr_r.3 /usr/s=
hare/man/man3/timersub.3 /usr/share/man/man3/getutmp.3 /usr/share/man/man3/=
getaliasent.3 /usr/share/man/man7/iso_8859-3.7 /usr/share/man/man3/catanhf.=
3 /usr/share/man/man3/iswalnum.3 /usr/share/man/man3/powl.3 /usr/share/man/=
man3/asin.3 /usr/share/man/man3/qsort_r.3 /usr/share/man/man2/fallocate.2 /=
usr/share/man/man3/endutent.3 /usr/share/man/man3/aio_fsync.3 /usr/share/ma=
n/man3/psignal.3 /usr/share/man/man3/htobe64.3 /usr/share/man/man3/localtim=
e.3 /usr/share/man/man2/fcntl.2 /usr/share/man/man2/process_vm_readv.2 /usr=
/share/man/man2/getsockopt.2 /usr/share/man/man5/nsswitch.conf.5 /usr/share=
/man/man3/csqrtf.3 /usr/share/man/man3/pthread_attr_setschedpolicy.3 /usr/s=
hare/man/man2/arch_prctl.2 /usr/share/man/man3/clogl.3 /usr/share/man/man3/=
be16toh.3 /usr/share/man/man2/stty.2 /usr/share/man/man2/modify_ldt.2 /usr/=
share/man/man3/sigisemptyset.3 /usr/share/man/man3/strcspn.3 /usr/share/man=
/man2/oldstat.2 /usr/share/man/man3/nexttowardf.3 /usr/share/man/man3/DES_F=
AILED.3 /usr/share/man/man3/nftw.3 /usr/share/man/man2/query_module.2 /usr/=
share/man/man2/get_kernel_syms.2 /usr/share/man/man3/fgets_unlocked.3 /usr/=
share/man/man3/jrand48.3 /usr/share/man/man3/getspnam.3 /usr/share/man/man2=
/exit_group.2 /usr/share/man/man3/wcsnlen.3 /usr/share/man/man2/preadv.2 /u=
sr/share/man/man2/getuid32.2 /usr/share/man/man3/cacosf.3 /usr/share/man/ma=
n3/fegetenv.3 /usr/share/man/man3/sem_open.3 /usr/share/man/man3/putpwent.3=
 /usr/share/man/man3/setlocale.3 /usr/share/man/man3/malloc_set_state.3 /us=
r/share/man/man7/uri.7 /usr/share/man/man3/CPU_XOR_S.3 /usr/share/man/man2/=
setresgid.2 /usr/share/man/man3/open_wmemstream.3 /usr/share/man/man2/pwrit=
e64.2 /usr/share/man/man3/mq_close.3 /usr/share/man/man3/isgraph.3 /usr/sha=
re/man/man3/ctanh.3 /usr/share/man/man2/brk.2 /usr/share/man/man2/ioprio_se=
t.2 /usr/share/man/man3/pthread_attr_getstacksize.3 /usr/share/man/man3/vas=
printf.3 /usr/share/man/man2/sendto.2 /usr/share/man/man2/oldolduname.2 /us=
r/share/man/man2/munlock.2 /usr/share/man/man7/iso-8859-6.7 /usr/share/man/=
man3/basename.3 /usr/share/man/man2/rt_sigaction.2 /usr/share/man/man3/log1=
pf.3 /usr/share/man/man3/islessequal.3 /usr/share/man/man7/iso-8859-8.7 /us=
r/share/man/man2/bind.2 /usr/share/man/man3/svc_freeargs.3 /usr/share/man/m=
an3/stdout.3 /usr/share/man/man7/iso_8859_13.7 /usr/share/man/man3/sinf.3 /=
usr/share/man/man2/timer_gettime.2 /usr/share/man/man3/fesetenv.3 /usr/shar=
e/man/man3/fileno.3 /usr/share/man/man7/iso_8859_11.7 /usr/share/man/man3/r=
ewinddir.3 /usr/share/man/man2/quotactl.2 /usr/share/man/man7/iso_8859-15.7=
 /usr/share/man/man2/sigreturn.2 /usr/share/man/man3/xdr_bytes.3 /usr/share=
/man/man7/environ.7 /usr/share/man/man7/ddp.7 /usr/share/man/man3/getservby=
port_r.3 /usr/share/man/man3/sys_nerr.3 /usr/share/man/man3/profil.3 /usr/s=
hare/man/man3/fmaf.3 /usr/share/man/man7/numa.7 /usr/share/man/man7/iso_885=
9-11.7 /usr/share/man/man3/error_print_progname.3 /usr/share/man/man3/fgetw=
c_unlocked.3 /usr/share/man/man3/y0f.3 /usr/share/man/man3/sem_wait.3 /usr/=
share/man/man7/packet.7 /usr/share/man/man2/msync.2 /usr/share/man/man3/rea=
ddir_r.3 /usr/share/man/man7/iso_8859-13.7 /usr/share/man/man3/__freading.3=
 /usr/share/man/man3/dn_expand.3 /usr/share/man/man3/fmal.3 /usr/share/man/=
man3/dirname.3 /usr/share/man/man2/move_pages.2 /usr/share/man/man3/getlogi=
n.3 /usr/share/man/man3/atanh.3 /usr/share/man/man3/fflush.3 /usr/share/man=
/man2/subpage_prot.2 /usr/share/man/man3/vfscanf.3 /usr/share/man/man3/iswd=
igit.3 /usr/share/man/man3/qfcvt.3 /usr/share/man/man3/iruserok_af.3 /usr/s=
hare/man/man7/iso-8859-3.7 /usr/share/man/man2/sethostname.2 /usr/share/man=
/man3/dn_comp.3 /usr/share/man/man3/scanf.3 /usr/share/man/man7/mq_overview=
.7 /usr/share/man/man3/backtrace.3 /usr/share/man/man3/clnt_destroy.3 /usr/=
share/man/man2/pwrite.2 /usr/share/man/man7/pty.7 /usr/share/man/man7/featu=
re_test_macros.7 /usr/share/man/man3/cosh.3 /usr/share/man/man2/sched_getpa=
ram.2 /usr/share/man/man3/getc_unlocked.3 /usr/share/man/man3/ether_line.3 =
/usr/share/man/man4/cpuid.4 /usr/share/man/man3/fmemopen.3 /usr/share/man/m=
an3/freopen.3 /usr/share/man/man3/mkfifo.3 /usr/share/man/man3/atanl.3 /usr=
/share/man/man3/clnt_call.3 /usr/share/man/man3/ccosl.3 /usr/share/man/man3=
/ftime.3 /usr/share/man/man3/clog2.3 /usr/share/man/man3/htonl.3 /usr/share=
/man/man3/getprotobynumber.3 /usr/share/man/man3/clnt_sperror.3 /usr/share/=
man/man3/h_errno.3 /usr/share/man/man3/remainderl.3 /usr/share/man/man2/get=
pgid.2 /usr/share/man/man3/ccosh.3 /usr/share/man/man2/seteuid.2 /usr/share=
/man/man3/login.3 /usr/share/man/man4/console_ioctl.4 /usr/share/man/man5/c=
harmap.5 /usr/share/man/man3/vprintf.3 /usr/share/man/man3/setutxent.3 /usr=
/share/man/man3/fgetwc.3 /usr/share/man/man3/xdr_callhdr.3 /usr/share/man/m=
an3/bcmp.3 /usr/share/man/man3/getpwuid.3 /usr/share/man/man7/spufs.7 /usr/=
share/man/man3/cosf.3 /usr/share/man/man3/nearbyintl.3 /usr/share/man/man3/=
xdr_long.3 /usr/share/man/man3/sqrt.3 /usr/share/man/man3/stdarg.3 /usr/sha=
re/man/man3/sigsetmask.3 /usr/share/man/man3/scalblnl.3 /usr/share/man/man3=
/endusershell.3 /usr/share/man/man3/sleep.3 /usr/share/man/man4/urandom.4 /=
usr/share/man/man3/pthread_getattr_np.3 /usr/share/man/man3/setmntent.3 /us=
r/share/man/man3/srand48.3 /usr/share/man/man3/gnu_get_libc_version.3 /usr/=
share/man/man3/clntudp_bufcreate.3 /usr/share/man/man2/clone.2 /usr/share/m=
an/man3/xdr_u_int.3 /usr/share/man/man7/time.7 /usr/share/man/man3/openpty.=
3 /usr/share/man/man7/path_resolution.7 /usr/share/man/man3/fgetpos.3 /usr/=
share/man/man4/vcsa.4 /usr/share/man/man3/nl_langinfo.3 /usr/share/man/man3=
/MB_LEN_MAX.3 /usr/share/man/man2/lchown32.2 /usr/share/man/man3/authunix_c=
reate_default.3 /usr/share/man/man3/tfind.3 /usr/share/man/man3/pmap_getmap=
s.3 /usr/share/man/man3/mq_timedsend.3 /usr/share/man/man3/getumask.3 /usr/=
share/man/man3/atanf.3 /usr/share/man/man3/eaccess.3 /usr/share/man/man3/wm=
empcpy.3 /usr/share/man/man3/getnameinfo.3 /usr/share/man/man3/crypt_r.3 /u=
sr/share/man/man3/herror.3 /usr/share/man/man2/statfs.2 /usr/share/man/man3=
/getpw.3 /usr/share/man/man3/clnt_broadcast.3 /usr/share/man/man2/insl.2 /u=
sr/share/man/man2/sysctl.2 /usr/share/man/man3/tan.3 /usr/share/man/man3/st=
rfmon.3 /usr/share/man/man3/dbopen.3 /usr/share/man/man3/sem_close.3 /usr/s=
hare/man/man7/inotify.7 /usr/share/man/man2/delete_module.2 /usr/share/man/=
man3/raise.3 /usr/share/man/man3/cprojf.3 /usr/share/man/man3/ualarm.3 /usr=
/share/man/man3/get_current_dir_name.3 /usr/share/man/man2/pselect.2 /usr/s=
hare/man/man3/asctime_r.3 /usr/share/man/man3/pthread_setschedparam.3 /usr/=
share/man/man3/getutxent.3 /usr/share/man/man3/errx.3 /usr/share/man/man3/f=
loorf.3 /usr/share/man/man3/gmtime.3 /usr/share/man/man3/updwtmp.3 /usr/sha=
re/man/man3/dlclose.3 /usr/share/man/man7/fifo.7 /usr/share/man/man3/realpa=
th.3 /usr/share/man/man3/freehostent.3 /usr/share/man/man2/waitpid.2 /usr/s=
hare/man/man7/epoll.7 /usr/share/man/man3/getpwent_r.3 /usr/share/man/man3/=
ulckpwdf.3 /usr/share/man/man7/iso-8859-13.7 /usr/share/man/man3/rand.3 /us=
r/share/man/man3/getwd.3 /usr/share/man/man2/posix_fadvise.2 /usr/share/man=
/man3/gethostid.3 /usr/share/man/man7/iso-8859-11.7 /usr/share/man/man7/reg=
ex.7 /usr/share/man/man3/isunordered.3 /usr/share/man/man3/exp.3 /usr/share=
/man/man3/isupper.3 /usr/share/man/man3/clnt_control.3 /usr/share/man/man3/=
timerclear.3 /usr/share/man/man3/wcscat.3 /usr/share/man/man3/finite.3 /usr=
/share/man/man3/xdrrec_eof.3 /usr/share/man/man2/fork.2 /usr/share/man/man2=
/outw.2 /usr/share/man/man2/reboot.2 /usr/share/man/man3/__fpending.3 /usr/=
share/man/man2/truncate64.2 /usr/share/man/man3/pmap_getport.3 /usr/share/m=
an/man3/xdr_accepted_reply.3 /usr/share/man/man3/daylight.3 /usr/share/man/=
man3/wcstoumax.3 /usr/share/man/man3/adjtime.3 /usr/share/man/man3/cerfl.3 =
/usr/share/man/man3/cbc_crypt.3 /usr/share/man/man2/utime.2 /usr/share/man/=
man2/ftruncate.2 /usr/share/man/man3/authnone_create.3 /usr/share/man/man3/=
fgetpwent.3 /usr/share/man/man3/aio_error.3 /usr/share/man/man3/setspent.3 =
/usr/share/man/man2/nfsservctl.2 /usr/share/man/man2/insb.2 /usr/share/man/=
man2/getgid32.2 /usr/share/man/man2/uname.2 /usr/share/man/man1/time.1 /usr=
/share/man/man3/catgets.3 /usr/share/man/man3/tolower.3 /usr/share/man/man2=
/creat.2 /usr/share/man/man3/sem_trywait.3 /usr/share/man/man3/floorl.3 /us=
r/share/man/man3/getnetbyaddr_r.3 /usr/share/man/man3/passwd2des.3 /usr/sha=
re/man/man3/wprintf.3 /usr/share/man/man3/getutxid.3 /usr/share/man/man3/nr=
and48_r.3 /usr/share/man/man3/logb.3 /usr/share/man/man2/inotify_init.2 /us=
r/share/man/man2/io_cancel.2 /usr/share/man/man3/cbrtf.3 /usr/share/man/man=
3/xdr_bool.3 /usr/share/man/man7/cp1251.7 /usr/share/man/man3/FD_SET.3 /usr=
/share/man/man3/wcstok.3 /usr/share/man/man5/numa_maps.5 /usr/share/man/man=
3/pvalloc.3 /usr/share/man/man3/fgetws.3 /usr/share/man/man3/optind.3 /usr/=
share/man/man3/getgrgid_r.3 /usr/share/man/man3/CPU_XOR.3 /usr/share/man/ma=
n3/envz_merge.3 /usr/share/man/man2/getcontext.2 /usr/share/man/man3/logl.3=
 /usr/share/man/man5/hosts.5 /usr/share/man/man3/unlocked_stdio.3 /usr/shar=
e/man/man3/tanhf.3 /usr/share/man/man3/strndup.3 /usr/share/man/man3/timelo=
cal.3 /usr/share/man/man3/le32toh.3 /usr/share/man/man3/mq_unlink.3 /usr/sh=
are/man/man3/mkostemp.3 /usr/share/man/man3/gsignal.3 /usr/share/man/man3/c=
fsetspeed.3 /usr/share/man/man3/getttyent.3 /usr/share/man/man2/setcontext.=
2 /usr/share/man/man3/fgetws_unlocked.3 /usr/share/man/man3/getutid.3 /usr/=
share/man/man2/outsb.2 /usr/share/man/man3/llroundl.3 /usr/share/man/man3/s=
etvbuf.3 /usr/share/man/man3/aio_init.3 /usr/share/man/man3/vsyslog.3 /usr/=
share/man/man3/srand48_r.3 /usr/share/man/man3/aligned_alloc.3 /usr/share/m=
an/man3/lldiv.3 /usr/share/man/man4/msr.4 /usr/share/man/man2/setegid.2 /us=
r/share/man/man2/open.2 /usr/share/man/man3/tcdrain.3 /usr/share/man/man3/e=
rfcf.3 /usr/share/man/man3/getttynam.3 /usr/share/man/man3/fputc_unlocked.3=
 /usr/share/man/man2/ptrace.2 /usr/share/man/man3/fputwc.3 /usr/share/man/m=
an3/snprintf.3 /usr/share/man/man3/ungetc.3 /usr/share/man/man3/pthread_att=
r_setstackaddr.3 /usr/share/man/man2/putpmsg.2 /usr/share/man/man7/latin6.7=
 /usr/share/man/man3/wcstoimax.3 /usr/share/man/man3/queue.3 /usr/share/man=
/man3/nanl.3 /usr/share/man/man3/clnt_create.3 /usr/share/man/man2/fchmod.2=
 /usr/share/man/man3/putwc.3 /usr/share/man/man5/services.5 /usr/share/man/=
man3/swab.3 /usr/share/man/man8/sync.8 /usr/share/man/man3/copysign.3 /usr/=
share/man/man3/__malloc_hook.3 /usr/share/man/man3/realloc.3 /usr/share/man=
/man3/xdr_u_long.3 /usr/share/man/man3/matherr.3 /usr/share/man/man2/_newse=
lect.2 /usr/share/man/man3/wcsncasecmp.3 /usr/share/man/man3/pthread_cleanu=
p_pop_restore_np.3 /usr/share/man/man3/getloadavg.3 /usr/share/man/man2/set=
fsuid32.2 /usr/share/man/man3/setprotoent.3 /usr/share/man/man3/innetgr.3 /=
usr/share/man/man3/memrchr.3 /usr/share/man/man7/latin8.7 /usr/share/man/ma=
n7/arp.7 /usr/share/man/man7/urn.7 /usr/share/man/man3/fseek.3 /usr/share/m=
an/man3/cfree.3 /usr/share/man/man3/btowc.3 /usr/share/man/man3/cacoshl.3 /=
usr/share/man/man7/url.7 /usr/share/man/man3/y1l.3 /usr/share/man/man3/perr=
or.3 /usr/share/man/man7/iso_8859_9.7 /usr/share/man/man3/sigorset.3 /usr/s=
hare/man/man2/epoll_create1.2 /usr/share/man/man3/cabsl.3 /usr/share/man/ma=
n3/getprotoent.3 /usr/share/man/man3/__fpurge.3 /usr/share/man/man2/outw_p.=
2 /usr/share/man/man3/bcopy.3 /usr/share/man/man3/sigsetjmp.3 /usr/share/ma=
n/man7/iso_8859_1.7 /usr/share/man/man3/fdopendir.3 /usr/share/man/man2/msg=
rcv.2 /usr/share/man/man3/res_send.3 /usr/share/man/man3/gammal.3 /usr/shar=
e/man/man7/iso_8859_5.7 /usr/share/man/man3/assert.3 /usr/share/man/man2/in=
tro.2 /usr/share/man/man2/setrlimit.2 /usr/share/man/man3/pmap_set.3 /usr/s=
hare/man/man3/addmntent.3 /usr/share/man/man3/siginterrupt.3 /usr/share/man=
/man2/setup.2 /usr/share/man/man7/iso_8859_7.7 /usr/share/man/man3/getcwd.3=
 /usr/share/man/man4/pts.4 /usr/share/man/man3/abort.3 /usr/share/man/man3/=
strsep.3 /usr/share/man/man3/valloc.3 /usr/share/man/man3/truncf.3 /usr/sha=
re/man/man3/lroundf.3 /usr/share/man/man3/cargf.3 /usr/share/man/man3/copys=
ignl.3 /usr/share/man/man3/towupper.3 /usr/share/man/man2/signalfd.2 /usr/s=
hare/man/man2/lock.2 /usr/share/man/man3/cpowf.3 /usr/share/man/man3/llroun=
df.3 /usr/share/man/man3/getgrent.3 /usr/share/man/man3/hcreate_r.3 /usr/sh=
are/man/man3/xdr.3 /usr/share/man/man3/wcspbrk.3 /usr/share/man/man3/envz_g=
et.3 /usr/share/man/man3/putenv.3 /usr/share/man/man3/isxdigit.3 /usr/share=
/man/man3/fegetexcept.3 /usr/share/man/man3/stdio.3 /usr/share/man/man3/sys=
v_signal.3 /usr/share/man/man2/openat.2 /usr/share/man/man3/isnormal.3 /usr=
/share/man/man3/cmsg.3 /usr/share/man/man2/lseek.2 /usr/share/man/man3/lgam=
mal_r.3 /usr/share/man/man3/aio_cancel.3 /usr/share/man/man3/clog10f.3 /usr=
/share/man/man3/fmtmsg.3 /usr/share/man/man3/strcasecmp.3 /usr/share/man/ma=
n2/fchown.2 /usr/share/man/man3/nanf.3 /usr/share/man/man3/j1.3 /usr/share/=
man/man2/swapon.2 /usr/share/man/man3/unsetenv.3 /usr/share/man/man2/readli=
nkat.2"
packages/i586-poky-linux/man-pages/man-pages-doc: PKGSIZE changed from 0 to=
 5475376 (+100%)
  * FILELIST: added "/usr/share/man/man3/inet_ntop.3 /usr/share/man/man5/pa=
sswd.5 /usr/share/man/man3/CIRCLEQ_HEAD.3 /usr/share/man/man3/xdr_array.3 /=
usr/share/man/man2/setregid.2 /usr/share/man/man3/grantpt.3 /usr/share/man/=
man3/inet_pton.3 /usr/share/man/man2/sched_setscheduler.2 /usr/share/man/ma=
n3/statvfs.3 /usr/share/man/man3/signgam.3 /usr/share/man/man3/remquof.3 /u=
sr/share/man/man3/endaliasent.3 /usr/share/man/man2/pipe.2 /usr/share/man/m=
an3/fabsl.3 /usr/share/man/man3/fstatvfs.3 /usr/share/man/man3/ctime_r.3 /u=
sr/share/man/man3/erff.3 /usr/share/man/man5/environ.5 /usr/share/man/man3/=
bsearch.3 /usr/share/man/man2/chdir.2 /usr/share/man/man3/putwc_unlocked.3 =
/usr/share/man/man3/tanl.3 /usr/share/man/man3/regerror.3 /usr/share/man/ma=
n3/clnt_spcreateerror.3 /usr/share/man/man3/sgetspent.3 /usr/share/man/man3=
/cacosl.3 /usr/share/man/man3/LIST_INSERT_AFTER.3 /usr/share/man/man3/fputs=
.3 /usr/share/man/man2/clock_gettime.2 /usr/share/man/man3/y1f.3 /usr/share=
/man/man2/ioperm.2 /usr/share/man/man3/isblank.3 /usr/share/man/man3/dprint=
f.3 /usr/share/man/man3/pthread_create.3 /usr/share/man/man3/labs.3 /usr/sh=
are/man/man3/casin.3 /usr/share/man/man3/crealf.3 /usr/share/man/man2/fcntl=
64.2 /usr/share/man/man3/getopt_long.3 /usr/share/man/man2/vm86.2 /usr/shar=
e/man/man2/setsockopt.2 /usr/share/man/man2/setresuid.2 /usr/share/man/man3=
/xdr_rejected_reply.3 /usr/share/man/man3/pthread_getaffinity_np.3 /usr/sha=
re/man/man3/ecvt_r.3 /usr/share/man/man3/error_message_count.3 /usr/share/m=
an/man3/getdelim.3 /usr/share/man/man3/lcong48_r.3 /usr/share/man/man3/word=
exp.3 /usr/share/man/man3/TAILQ_REMOVE.3 /usr/share/man/man7/pthreads.7 /us=
r/share/man/man3/lgamma_r.3 /usr/share/man/man3/getrpcbyname_r.3 /usr/share=
/man/man3/xdr_u_short.3 /usr/share/man/man8/ld-linux.8 /usr/share/man/man2/=
flock.2 /usr/share/man/man2/spu_run.2 /usr/share/man/man3/iruserok.3 /usr/s=
hare/man/man2/fremovexattr.2 /usr/share/man/man3/wcswidth.3 /usr/share/man/=
man3/htobe16.3 /usr/share/man/man3/xdr_pmaplist.3 /usr/share/man/man3/trunc=
l.3 /usr/share/man/man3/lroundl.3 /usr/share/man/man3/setrpcent.3 /usr/shar=
e/man/man3/CPU_ISSET.3 /usr/share/man/man3/conjf.3 /usr/share/man/man3/exec=
v.3 /usr/share/man/man3/stderr.3 /usr/share/man/man3/clnt_pcreateerror.3 /u=
sr/share/man/man3/strtok_r.3 /usr/share/man/man3/INFINITY.3 /usr/share/man/=
man3/strncat.3 /usr/share/man/man3/strtok.3 /usr/share/man/man2/sendfile64.=
2 /usr/share/man/man7/signal.7 /usr/share/man/man3/getprotobyname.3 /usr/sh=
are/man/man3/getnetgrent_r.3 /usr/share/man/man2/setgroups32.2 /usr/share/m=
an/man4/sk98lin.4 /usr/share/man/man3/pthread_cleanup_pop.3 /usr/share/man/=
man3/ptsname_r.3 /usr/share/man/man3/LIST_ENTRY.3 /usr/share/man/man3/strcm=
p.3 /usr/share/man/man2/vhangup.2 /usr/share/man/man7/tcp.7 /usr/share/man/=
man2/getppid.2 /usr/share/man/man3/__setfpucw.3 /usr/share/man/man3/mq_seta=
ttr.3 /usr/share/man/man3/j1l.3 /usr/share/man/man3/ether_aton_r.3 /usr/sha=
re/man/man3/xdr_setpos.3 /usr/share/man/man3/fputwc_unlocked.3 /usr/share/m=
an/man3/pthread_cleanup_push.3 /usr/share/man/man3/pmap_rmtcall.3 /usr/shar=
e/man/man2/mlock.2 /usr/share/man/man2/madvise.2 /usr/share/man/man3/ecvt.3=
 /usr/share/man/man3/rtnetlink.3 /usr/share/man/man3/resolver.3 /usr/share/=
man/man7/iso_8859-9.7 /usr/share/man/man3/isnanf.3 /usr/share/man/man3/asct=
ime.3 /usr/share/man/man2/sysinfo.2 /usr/share/man/man3/iswlower.3 /usr/sha=
re/man/man3/gai_cancel.3 /usr/share/man/man2/ipc.2 /usr/share/man/man3/fmod=
f.3 /usr/share/man/man3/shm_unlink.3 /usr/share/man/man3/llround.3 /usr/sha=
re/man/man2/unlinkat.2 /usr/share/man/man3/fgetgrent.3 /usr/share/man/man2/=
inb.2 /usr/share/man/man2/__clone2.2 /usr/share/man/man3/fmodl.3 /usr/share=
/man/man3/res_querydomain.3 /usr/share/man/man3/qgcvt.3 /usr/share/man/man3=
/dremf.3 /usr/share/man/man3/ccoshl.3 /usr/share/man/man3/sinh.3 /usr/share=
/man/man3/xdr_free.3 /usr/share/man/man3/getdate_r.3 /usr/share/man/man8/ld=
config.8 /usr/share/man/man7/iso_8859_15.7 /usr/share/man/man3/ftrylockfile=
.3 /usr/share/man/man3/sigpause.3 /usr/share/man/man2/security.2 /usr/share=
/man/man3/mbsrtowcs.3 /usr/share/man/man3/lrintl.3 /usr/share/man/man3/stre=
rror.3 /usr/share/man/man3/ccosf.3 /usr/share/man/man2/close.2 /usr/share/m=
an/man4/hd.4 /usr/share/man/man3/logbf.3 /usr/share/man/man2/gethostid.2 /u=
sr/share/man/man3/getrpcbynumber.3 /usr/share/man/man3/xdr_int.3 /usr/share=
/man/man2/inl.2 /usr/share/man/man3/gets.3 /usr/share/man/man3/des_crypt.3 =
/usr/share/man/man3/aio_read.3 /usr/share/man/man3/warn.3 /usr/share/man/ma=
n2/setregid32.2 /usr/share/man/man3/TAILQ_HEAD.3 /usr/share/man/man3/ilogbl=
.3 /usr/share/man/man2/setns.2 /usr/share/man/man2/syncfs.2 /usr/share/man/=
man3/gethostbyname2_r.3 /usr/share/man/man2/syscalls.2 /usr/share/man/man3/=
feraiseexcept.3 /usr/share/man/man3/acoshl.3 /usr/share/man/man3/exp10.3 /u=
sr/share/man/man2/connect.2 /usr/share/man/man3/eventfd_write.3 /usr/share/=
man/man3/tgammaf.3 /usr/share/man/man3/fedisableexcept.3 /usr/share/man/man=
3/endhostent.3 /usr/share/man/man3/wmemset.3 /usr/share/man/man3/wcsncpy.3 =
/usr/share/man/man2/epoll_pwait.2 /usr/share/man/man3/setkey_r.3 /usr/share=
/man/man3/sysconf.3 /usr/share/man/man3/expf.3 /usr/share/man/man3/pthread_=
attr_setinheritsched.3 /usr/share/man/man2/dup3.2 /usr/share/man/man7/iso_8=
859_2.7 /usr/share/man/man3/strfry.3 /usr/share/man/man3/nexttowardl.3 /usr=
/share/man/man2/recvfrom.2 /usr/share/man/man7/pipe.7 /usr/share/man/man2/v=
server.2 /usr/share/man/man3/asinhf.3 /usr/share/man/man3/CPU_ISSET_S.3 /us=
r/share/man/man7/rtld-audit.7 /usr/share/man/man7/udp.7 /usr/share/man/man2=
/accept4.2 /usr/share/man/man3/fminl.3 /usr/share/man/man3/FD_ZERO.3 /usr/s=
hare/man/man4/port.4 /usr/share/man/man2/link.2 /usr/share/man/man3/sigrels=
e.3 /usr/share/man/man3/fts_set.3 /usr/share/man/man2/fsetxattr.2 /usr/shar=
e/man/man2/utimes.2 /usr/share/man/man3/stdio_ext.3 /usr/share/man/man7/uni=
ts.7 /usr/share/man/man3/key_encryptsession.3 /usr/share/man/man2/chroot.2 =
/usr/share/man/man7/iso_8859-5.7 /usr/share/man/man3/wctob.3 /usr/share/man=
/man2/tgkill.2 /usr/share/man/man3/undocumented.3 /usr/share/man/man3/pthre=
ad_setconcurrency.3 /usr/share/man/man3/iswpunct.3 /usr/share/man/man2/migr=
ate_pages.2 /usr/share/man/man3/logbl.3 /usr/share/man/man2/timer_delete.2 =
/usr/share/man/man3/res_mkquery.3 /usr/share/man/man7/iso_8859-1.7 /usr/sha=
re/man/man7/udplite.7 /usr/share/man/man3/inet_makeaddr.3 /usr/share/man/ma=
n8/zic.8 /usr/share/man/man3/wcstombs.3 /usr/share/man/man3/difftime.3 /usr=
/share/man/man7/standards.7 /usr/share/man/man2/epoll_wait.2 /usr/share/man=
/man3/wcsncmp.3 /usr/share/man/man3/re_comp.3 /usr/share/man/man3/gethostby=
name_r.3 /usr/share/man/man7/latin1.7 /usr/share/man/man3/sem_unlink.3 /usr=
/share/man/man2/semop.2 /usr/share/man/man7/latin3.7 /usr/share/man/man2/fc=
hdir.2 /usr/share/man/man3/clnttcp_create.3 /usr/share/man/man3/remainderf.=
3 /usr/share/man/man2/io_getevents.2 /usr/share/man/man3/closelog.3 /usr/sh=
are/man/man3/frexpl.3 /usr/share/man/man7/aio.7 /usr/share/man/man2/getresu=
id.2 /usr/share/man/man3/fputws_unlocked.3 /usr/share/man/man3/longjmp.3 /u=
sr/share/man/man3/vsprintf.3 /usr/share/man/man2/dup.2 /usr/share/man/man3/=
siggetmask.3 /usr/share/man/man3/rawmemchr.3 /usr/share/man/man3/setttyent.=
3 /usr/share/man/man3/lutimes.3 /usr/share/man/man5/issue.5 /usr/share/man/=
man3/strverscmp.3 /usr/share/man/man3/cproj.3 /usr/share/man/man3/CPU_CLR_S=
.3 /usr/share/man/man3/mq_send.3 /usr/share/man/man3/getpass.3 /usr/share/m=
an/man7/mailaddr.7 /usr/share/man/man2/fstatat64.2 /usr/share/man/man2/getc=
pu.2 /usr/share/man/man3/get_myaddress.3 /usr/share/man/man3/argz.3 /usr/sh=
are/man/man5/protocols.5 /usr/share/man/man2/fstat64.2 /usr/share/man/man2/=
prlimit.2 /usr/share/man/man3/usleep.3 /usr/share/man/man2/setpriority.2 /u=
sr/share/man/man3/fmax.3 /usr/share/man/man3/etext.3 /usr/share/man/man3/en=
dspent.3 /usr/share/man/man3/isprint.3 /usr/share/man/man3/remque.3 /usr/sh=
are/man/man3/lrintf.3 /usr/share/man/man5/wtmp.5 /usr/share/man/man3/strnle=
n.3 /usr/share/man/man3/isinf.3 /usr/share/man/man3/TAILQ_INIT.3 /usr/share=
/man/man3/scandir.3 /usr/share/man/man3/wordfree.3 /usr/share/man/man2/setr=
esuid32.2 /usr/share/man/man3/isnan.3 /usr/share/man/man2/lsetxattr.2 /usr/=
share/man/man3/gethostbyname.3 /usr/share/man/man3/lgammaf_r.3 /usr/share/m=
an/man3/setutent.3 /usr/share/man/man3/ilogb.3 /usr/share/man/man2/signalfd=
4.2 /usr/share/man/man2/keyctl.2 /usr/share/man/man3/wmemmove.3 /usr/share/=
man/man2/eventfd.2 /usr/share/man/man3/byteorder.3 /usr/share/man/man2/vm86=
old.2 /usr/share/man/man3/fminf.3 /usr/share/man/man3/fopencookie.3 /usr/sh=
are/man/man3/endservent.3 /usr/share/man/man3/CPU_EQUAL.3 /usr/share/man/ma=
n3/htole64.3 /usr/share/man/man2/olduname.2 /usr/share/man/man3/fread.3 /us=
r/share/man/man3/pthread_attr_getguardsize.3 /usr/share/man/man3/catanf.3 /=
usr/share/man/man3/gethostent_r.3 /usr/share/man/man3/lseek64.3 /usr/share/=
man/man3/rewind.3 /usr/share/man/man3/clnt_sperrno.3 /usr/share/man/man2/ge=
teuid.2 /usr/share/man/man3/remove.3 /usr/share/man/man2/set_mempolicy.2 /u=
sr/share/man/man2/shutdown.2 /usr/share/man/man3/svc_getargs.3 /usr/share/m=
an/man3/regcomp.3 /usr/share/man/man3/svcerr_weakauth.3 /usr/share/man/man3=
/fgets.3 /usr/share/man/man3/carg.3 /usr/share/man/man2/oldfstat.2 /usr/sha=
re/man/man7/boot.7 /usr/share/man/man2/mmap.2 /usr/share/man/man3/rindex.3 =
/usr/share/man/man2/rt_sigtimedwait.2 /usr/share/man/man2/writev.2 /usr/sha=
re/man/man2/mmap2.2 /usr/share/man/man3/setnetgrent.3 /usr/share/man/man2/g=
etcwd.2 /usr/share/man/man3/svcudp_create.3 /usr/share/man/man4/ram.4 /usr/=
share/man/man2/setfsgid32.2 /usr/share/man/man3/pow10f.3 /usr/share/man/man=
3/execvpe.3 /usr/share/man/man3/tcflow.3 /usr/share/man/man3/malloc_trim.3 =
/usr/share/man/man3/asinl.3 /usr/share/man/man3/strlen.3 /usr/share/man/man=
2/arm_fadvise.2 /usr/share/man/man2/utimensat.2 /usr/share/man/man3/coshf.3=
 /usr/share/man/man3/argz_insert.3 /usr/share/man/man3/fgetpwent_r.3 /usr/s=
hare/man/man3/xdr_union.3 /usr/share/man/man3/iswprint.3 /usr/share/man/man=
3/psiginfo.3 /usr/share/man/man3/pthread_cleanup_push_defer_np.3 /usr/share=
/man/man3/strchrnul.3 /usr/share/man/man3/log10l.3 /usr/share/man/man3/feup=
dateenv.3 /usr/share/man/man3/aio_suspend.3 /usr/share/man/man3/drand48.3 /=
usr/share/man/man3/strndupa.3 /usr/share/man/man3/xdrmem_create.3 /usr/shar=
e/man/man3/asinh.3 /usr/share/man/man3/swprintf.3 /usr/share/man/man2/setpg=
rp.2 /usr/share/man/man2/getresgid.2 /usr/share/man/man3/iswctype.3 /usr/sh=
are/man/man3/putc_unlocked.3 /usr/share/man/man2/getdents.2 /usr/share/man/=
man3/res_search.3 /usr/share/man/man3/inet_network.3 /usr/share/man/man3/ma=
llinfo.3 /usr/share/man/man5/ttytype.5 /usr/share/man/man7/netdevice.7 /usr=
/share/man/man2/pause.2 /usr/share/man/man4/console.4 /usr/share/man/man3/s=
em_getvalue.3 /usr/share/man/man3/bstring.3 /usr/share/man/man3/svc_getreq.=
3 /usr/share/man/man3/exp10f.3 /usr/share/man/man3/pthread_attr_getstack.3 =
/usr/share/man/man3/le16toh.3 /usr/share/man/man3/fcvt.3 /usr/share/man/man=
3/mtrace.3 /usr/share/man/man5/proc.5 /usr/share/man/man3/svctcp_create.3 /=
usr/share/man/man2/setdomainname.2 /usr/share/man/man3/ulimit.3 /usr/share/=
man/man3/lockf.3 /usr/share/man/man3/stpncpy.3 /usr/share/man/man3/pthread_=
exit.3 /usr/share/man/man2/getresuid32.2 /usr/share/man/man3/tmpfile.3 /usr=
/share/man/man3/setbuffer.3 /usr/share/man/man3/getmntent_r.3 /usr/share/ma=
n/man3/sigvec.3 /usr/share/man/man3/tdelete.3 /usr/share/man/man7/mdoc.samp=
les.7 /usr/share/man/man3/strcasestr.3 /usr/share/man/man3/iswalpha.3 /usr/=
share/man/man3/malloc_get_state.3 /usr/share/man/man4/initrd.4 /usr/share/m=
an/man3/fegetround.3 /usr/share/man/man3/verr.3 /usr/share/man/man3/pthread=
_attr_getinheritsched.3 /usr/share/man/man3/sigmask.3 /usr/share/man/man3/d=
b.3 /usr/share/man/man3/fmin.3 /usr/share/man/man3/FD_ISSET.3 /usr/share/ma=
n/man2/mbind.2 /usr/share/man/man2/ugetrlimit.2 /usr/share/man/man3/warnx.3=
 /usr/share/man/man3/vwprintf.3 /usr/share/man/man3/iconv_open.3 /usr/share=
/man/man3/strtoll.3 /usr/share/man/man3/atanhl.3 /usr/share/man/man3/strpti=
me.3 /usr/share/man/man3/svc_sendreply.3 /usr/share/man/man4/epoll.4 /usr/s=
hare/man/man3/tcgetpgrp.3 /usr/share/man/man2/alloc_hugepages.2 /usr/share/=
man/man3/posix_fallocate.3 /usr/share/man/man1/ldd.1 /usr/share/man/man2/so=
cket.2 /usr/share/man/man3/clearerr_unlocked.3 /usr/share/man/man3/wctrans.=
3 /usr/share/man/man3/wcwidth.3 /usr/share/man/man2/splice.2 /usr/share/man=
/man2/mq_timedsend.2 /usr/share/man/man3/argz_create_sep.3 /usr/share/man/m=
an3/asinf.3 /usr/share/man/man3/fts_children.3 /usr/share/man/man2/rt_sigre=
turn.2 /usr/share/man/man3/getrpcent.3 /usr/share/man/man3/svcraw_create.3 =
/usr/share/man/man7/math_error.7 /usr/share/man/man3/argz_extract.3 /usr/sh=
are/man/man3/backtrace_symbols_fd.3 /usr/share/man/man3/gnu_get_libc_releas=
e.3 /usr/share/man/man3/endttyent.3 /usr/share/man/man3/futimens.3 /usr/sha=
re/man/man3/initgroups.3 /usr/share/man/man3/ceill.3 /usr/share/man/man2/ar=
m_fadvise64_64.2 /usr/share/man/man3/puts.3 /usr/share/man/man2/pciconfig_i=
obase.2 /usr/share/man/man3/TAILQ_INSERT_HEAD.3 /usr/share/man/man3/casinh.=
3 /usr/share/man/man2/shmctl.2 /usr/share/man/man4/mouse.4 /usr/share/man/m=
an3/CPU_AND_S.3 /usr/share/man/man3/sigwait.3 /usr/share/man/man3/envz_entr=
y.3 /usr/share/man/man3/fdiml.3 /usr/share/man/man3/cbrtl.3 /usr/share/man/=
man3/fputws.3 /usr/share/man/man3/mcheck_check_all.3 /usr/share/man/man3/lg=
ammal.3 /usr/share/man/man2/mkdir.2 /usr/share/man/man2/kexec_load.2 /usr/s=
hare/man/man3/strcoll.3 /usr/share/man/man3/dysize.3 /usr/share/man/man3/is=
digit.3 /usr/share/man/man3/assert_perror.3 /usr/share/man/man3/termios.3 /=
usr/share/man/man5/utmpx.5 /usr/share/man/man3/xdr_float.3 /usr/share/man/m=
an2/request_key.2 /usr/share/man/man3/pthread_attr_setdetachstate.3 /usr/sh=
are/man/man2/set_robust_list.2 /usr/share/man/man3/islessgreater.3 /usr/sha=
re/man/man2/clock_getres.2 /usr/share/man/man2/execve.2 /usr/share/man/man3=
/mkstemp.3 /usr/share/man/man2/getpmsg.2 /usr/share/man/man3/getpwnam_r.3 /=
usr/share/man/man3/atoll.3 /usr/share/man/man7/locale.7 /usr/share/man/man3=
/be64toh.3 /usr/share/man/man3/gammaf.3 /usr/share/man/man3/sincosf.3 /usr/=
share/man/man3/clock_getres.3 /usr/share/man/man5/utmp.5 /usr/share/man/man=
3/ferror_unlocked.3 /usr/share/man/man3/malloc_stats.3 /usr/share/man/man2/=
signal.2 /usr/share/man/man3/btree.3 /usr/share/man/man2/setitimer.2 /usr/s=
hare/man/man3/hsearch.3 /usr/share/man/man3/xdr_string.3 /usr/share/man/man=
3/strtol.3 /usr/share/man/man2/setfsuid.2 /usr/share/man/man3/pthread_setaf=
finity_np.3 /usr/share/man/man3/pthread_yield.3 /usr/share/man/man3/vdprint=
f.3 /usr/share/man/man3/wcpcpy.3 /usr/share/man/man3/CPU_OR_S.3 /usr/share/=
man/man3/vfwprintf.3 /usr/share/man/man3/CMSG_NXTHDR.3 /usr/share/man/man2/=
sbrk.2 /usr/share/man/man2/lookup_dcookie.2 /usr/share/man/man3/xdr_enum.3 =
/usr/share/man/man3/strtoull.3 /usr/share/man/man2/pselect6.2 /usr/share/ma=
n/man3/isfinite.3 /usr/share/man/man2/fstatat.2 /usr/share/man/man2/msgget.=
2 /usr/share/man/man5/group.5 /usr/share/man/man3/dlvsym.3 /usr/share/man/m=
an3/cpowl.3 /usr/share/man/man2/capget.2 /usr/share/man/man3/llabs.3 /usr/s=
hare/man/man3/mblen.3 /usr/share/man/man3/pthread_getconcurrency.3 /usr/sha=
re/man/man2/pipe2.2 /usr/share/man/man7/iso-8859-5.7 /usr/share/man/man7/co=
mplex.7 /usr/share/man/man3/wcsncat.3 /usr/share/man/man3/CPU_CLR.3 /usr/sh=
are/man/man3/ffsl.3 /usr/share/man/man3/pthread_setschedprio.3 /usr/share/m=
an/man7/iso-8859-1.7 /usr/share/man/man2/sigqueue.2 /usr/share/man/man7/iso=
_8859-16.7 /usr/share/man/man3/endutxent.3 /usr/share/man/man7/glibc.7 /usr=
/share/man/man3/timercmp.3 /usr/share/man/man3/fwrite_unlocked.3 /usr/share=
/man/man3/endrpcent.3 /usr/share/man/man3/des_setparity.3 /usr/share/man/ma=
n2/getsid.2 /usr/share/man/man3/strftime.3 /usr/share/man/man3/xdr_pmap.3 /=
usr/share/man/man3/posix_memalign.3 /usr/share/man/man3/vfprintf.3 /usr/sha=
re/man/man3/cacoshf.3 /usr/share/man/man3/xdrrec_create.3 /usr/share/man/ma=
n3/backtrace_symbols.3 /usr/share/man/man2/sched_setaffinity.2 /usr/share/m=
an/man3/pow10l.3 /usr/share/man/man3/error.3 /usr/share/man/man2/recvmsg.2 =
/usr/share/man/man3/sincosl.3 /usr/share/man/man2/read.2 /usr/share/man/man=
3/pmap_unset.3 /usr/share/man/man2/dup2.2 /usr/share/man/man3/timerisset.3 =
/usr/share/man/man2/recv.2 /usr/share/man/man3/mpool.3 /usr/share/man/man3/=
exp2.3 /usr/share/man/man3/feclearexcept.3 /usr/share/man/man3/nan.3 /usr/s=
hare/man/man7/utf8.7 /usr/share/man/man3/argz_replace.3 /usr/share/man/man3=
/sigstack.3 /usr/share/man/man3/log.3 /usr/share/man/man3/fetestexcept.3 /u=
sr/share/man/man3/setstate_r.3 /usr/share/man/man7/bootparam.7 /usr/share/m=
an/man2/idle.2 /usr/share/man/man5/intro.5 /usr/share/man/man3/exp2f.3 /usr=
/share/man/man3/l64a.3 /usr/share/man/man3/strspn.3 /usr/share/man/man2/set=
reuid32.2 /usr/share/man/man3/pthread_setcancelstate.3 /usr/share/man/man3/=
getgrnam.3 /usr/share/man/man3/tcgetsid.3 /usr/share/man/man2/stat64.2 /usr=
/share/man/man3/errno.3 /usr/share/man/man3/cargl.3 /usr/share/man/man3/cop=
ysignf.3 /usr/share/man/man3/sinhl.3 /usr/share/man/man5/complex.5 /usr/sha=
re/man/man3/open_memstream.3 /usr/share/man/man3/vsnprintf.3 /usr/share/man=
/man5/termcap.5 /usr/share/man/man3/execlp.3 /usr/share/man/man3/remquol.3 =
/usr/share/man/man3/xdecrypt.3 /usr/share/man/man3/ether_ntohost.3 /usr/sha=
re/man/man3/fabs.3 /usr/share/man/man3/nextafterf.3 /usr/share/man/man3/maj=
or.3 /usr/share/man/man3/eventfd_read.3 /usr/share/man/man3/tcsetattr.3 /us=
r/share/man/man3/sem_init.3 /usr/share/man/man3/ecb_crypt.3 /usr/share/man/=
man3/svc_run.3 /usr/share/man/man3/pthread_testcancel.3 /usr/share/man/man3=
/htons.3 /usr/share/man/man3/fputc.3 /usr/share/man/man3/tempnam.3 /usr/sha=
re/man/man3/getifaddrs.3 /usr/share/man/man3/csinl.3 /usr/share/man/man2/ca=
cheflush.2 /usr/share/man/man3/clnt_perror.3 /usr/share/man/man3/clog10l.3 =
/usr/share/man/man3/wcschr.3 /usr/share/man/man3/endpwent.3 /usr/share/man/=
man3/mbsinit.3 /usr/share/man/man3/xdr_inline.3 /usr/share/man/man3/utmpxna=
me.3 /usr/share/man/man3/erfl.3 /usr/share/man/man3/strdupa.3 /usr/share/ma=
n/man3/logwtmp.3 /usr/share/man/man3/xdr_vector.3 /usr/share/man/man3/fputs=
_unlocked.3 /usr/share/man/man3/muntrace.3 /usr/share/man/man2/settimeofday=
.2 /usr/share/man/man7/futex.7 /usr/share/man/man3/printf.3 /usr/share/man/=
man2/fstat.2 /usr/share/man/man2/wait4.2 /usr/share/man/man3/atan2f.3 /usr/=
share/man/man2/outl.2 /usr/share/man/man3/freeifaddrs.3 /usr/share/man/man3=
/srandom.3 /usr/share/man/man2/listen.2 /usr/share/man/man3/islower.3 /usr/=
share/man/man3/optopt.3 /usr/share/man/man3/mq_receive.3 /usr/share/man/man=
2/semget.2 /usr/share/man/man3/sin.3 /usr/share/man/man3/tanf.3 /usr/share/=
man/man3/sethostid.3 /usr/share/man/man3/fgetspent.3 /usr/share/man/man5/fs=
.5 /usr/share/man/man3/srand.3 /usr/share/man/man3/ttyslot.3 /usr/share/man=
/man3/putc.3 /usr/share/man/man2/outb.2 /usr/share/man/man4/random.4 /usr/s=
hare/man/man3/sinhf.3 /usr/share/man/man3/significand.3 /usr/share/man/man2=
/msgop.2 /usr/share/man/man2/io_submit.2 /usr/share/man/man3/tzname.3 /usr/=
share/man/man3/qsort.3 /usr/share/man/man2/_Exit.2 /usr/share/man/man3/crea=
ll.3 /usr/share/man/man3/wcpncpy.3 /usr/share/man/man3/strtold.3 /usr/share=
/man/man3/strerror_r.3 /usr/share/man/man2/setsid.2 /usr/share/man/man2/sen=
d.2 /usr/share/man/man3/htobe32.3 /usr/share/man/man2/outsw.2 /usr/share/ma=
n/man2/get_robust_list.2 /usr/share/man/man2/afs_syscall.2 /usr/share/man/m=
an3/atof.3 /usr/share/man/man3/mktime.3 /usr/share/man/man2/socketcall.2 /u=
sr/share/man/man3/posix_openpt.3 /usr/share/man/man2/getpid.2 /usr/share/ma=
n/man3/CPU_COUNT_S.3 /usr/share/man/man3/ftello.3 /usr/share/man/man3/tgamm=
a.3 /usr/share/man/man3/alloca.3 /usr/share/man/man3/getaddrinfo_a.3 /usr/s=
hare/man/man3/sem_timedwait.3 /usr/share/man/man3/atan2l.3 /usr/share/man/m=
an3/clock_settime.3 /usr/share/man/man3/pthread_attr_setschedparam.3 /usr/s=
hare/man/man2/rt_sigprocmask.2 /usr/share/man/man3/dreml.3 /usr/share/man/m=
an3/argz_next.3 /usr/share/man/man3/vsscanf.3 /usr/share/man/man3/sigblock.=
3 /usr/share/man/man3/argz_delete.3 /usr/share/man/man3/mbtowc.3 /usr/share=
/man/man2/sendfile.2 /usr/share/man/man3/CPU_ZERO_S.3 /usr/share/man/man3/l=
og2f.3 /usr/share/man/man3/fdim.3 /usr/share/man/man3/setlinebuf.3 /usr/sha=
re/man/man3/scandirat.3 /usr/share/man/man3/initstate_r.3 /usr/share/man/ma=
n3/crypt.3 /usr/share/man/man3/calloc.3 /usr/share/man/man3/mallopt.3 /usr/=
share/man/man2/prctl.2 /usr/share/man/man3/fgetspent_r.3 /usr/share/man/man=
3/registerrpc.3 /usr/share/man/man3/memmove.3 /usr/share/man/man3/putw.3 /u=
sr/share/man/man3/execl.3 /usr/share/man/man2/readdir.2 /usr/share/man/man3=
/isalnum.3 /usr/share/man/man3/getnetbyaddr.3 /usr/share/man/man3/getutid_r=
.3 /usr/share/man/man3/cacos.3 /usr/share/man/man3/getwc.3 /usr/share/man/m=
an3/iswcntrl.3 /usr/share/man/man2/wait3.2 /usr/share/man/man3/nrand48.3 /u=
sr/share/man/man3/catopen.3 /usr/share/man/man3/getc.3 /usr/share/man/man3/=
ldexpf.3 /usr/share/man/man3/xdrrec_endofrecord.3 /usr/share/man/man3/inet_=
addr.3 /usr/share/man/man3/getnetbyname.3 /usr/share/man/man3/cerfc.3 /usr/=
share/man/man3/getrpcbyname.3 /usr/share/man/man7/shm_overview.7 /usr/share=
/man/man3/ether_hostton.3 /usr/share/man/man3/pthread_attr_setstacksize.3 /=
usr/share/man/man2/sgetmask.2 /usr/share/man/man3/fdimf.3 /usr/share/man/ma=
n3/setpwent.3 /usr/share/man/man3/iswblank.3 /usr/share/man/man3/towctrans.=
3 /usr/share/man/man2/create_module.2 /usr/share/man/man3/strcpy.3 /usr/sha=
re/man/man3/dl_iterate_phdr.3 /usr/share/man/man3/round.3 /usr/share/man/ma=
n2/waitid.2 /usr/share/man/man3/localeconv.3 /usr/share/man/man2/pwritev.2 =
/usr/share/man/man3/acoshf.3 /usr/share/man/man3/sinl.3 /usr/share/man/man3=
/cerf.3 /usr/share/man/man7/latin5.7 /usr/share/man/man2/semtimedop.2 /usr/=
share/man/man2/mpx.2 /usr/share/man/man7/credentials.7 /usr/share/man/man2/=
sysfs.2 /usr/share/man/man3/ccoshf.3 /usr/share/man/man2/arm_sync_file_rang=
e.2 /usr/share/man/man3/getutline_r.3 /usr/share/man/man3/execle.3 /usr/sha=
re/man/man4/hpsa.4 /usr/share/man/man3/getservent.3 /usr/share/man/man3/fre=
xp.3 /usr/share/man/man3/rtime.3 /usr/share/man/man3/nearbyint.3 /usr/share=
/man/man2/gtty.2 /usr/share/man/man3/openlog.3 /usr/share/man/man3/tgammal.=
3 /usr/share/man/man2/setgroups.2 /usr/share/man/man2/rt_sigsuspend.2 /usr/=
share/man/man2/exit.2 /usr/share/man/man7/latin7.7 /usr/share/man/man3/ffs.=
3 /usr/share/man/man3/CIRCLEQ_INSERT_HEAD.3 /usr/share/man/man3/get_nprocs.=
3 /usr/share/man/man3/getw.3 /usr/share/man/man3/program_invocation_name.3 =
/usr/share/man/man3/tdestroy.3 /usr/share/man/man3/expl.3 /usr/share/man/ma=
n7/latin9.7 /usr/share/man/man5/hosts.equiv.5 /usr/share/man/man3/ruserok_a=
f.3 /usr/share/man/man3/pthread_attr_setaffinity_np.3 /usr/share/man/man3/l=
lrintl.3 /usr/share/man/man7/posixoptions.7 /usr/share/man/man3/svc_registe=
r.3 /usr/share/man/man7/iso-8859-14.7 /usr/share/man/man3/confstr.3 /usr/sh=
are/man/man7/iso_8859_8.7 /usr/share/man/man3/finitef.3 /usr/share/man/man3=
/clearerr.3 /usr/share/man/man3/putwchar.3 /usr/share/man/man3/sigaddset.3 =
/usr/share/man/man2/readahead.2 /usr/share/man/man3/getgrouplist.3 /usr/sha=
re/man/man3/rcmd.3 /usr/share/man/man3/isinff.3 /usr/share/man/man2/persona=
lity.2 /usr/share/man/man3/strsignal.3 /usr/share/man/man3/TAILQ_ENTRY.3 /u=
sr/share/man/man3/envz_strip.3 /usr/share/man/man3/encrypt.3 /usr/share/man=
/man3/HUGE_VALF.3 /usr/share/man/man3/siglongjmp.3 /usr/share/man/man3/fese=
tround.3 /usr/share/man/man2/symlink.2 /usr/share/man/man3/regfree.3 /usr/s=
hare/man/man2/linkat.2 /usr/share/man/man3/wcsspn.3 /usr/share/man/man7/iso=
_8859_4.7 /usr/share/man/man3/getchar.3 /usr/share/man/man3/malloc.3 /usr/s=
hare/man/man3/remquo.3 /usr/share/man/man2/wait.2 /usr/share/man/man3/CIRCL=
EQ_REMOVE.3 /usr/share/man/man3/ispunct.3 /usr/share/man/man3/fpclassify.3 =
/usr/share/man/man7/iso_8859_6.7 /usr/share/man/man3/wmemcmp.3 /usr/share/m=
an/man3/argz_add_sep.3 /usr/share/man/man2/set_thread_area.2 /usr/share/man=
/man7/armscii-8.7 /usr/share/man/man3/iswgraph.3 /usr/share/man/man3/mmap64=
.3 /usr/share/man/man2/getrlimit.2 /usr/share/man/man5/rpc.5 /usr/share/man=
/man3/modfl.3 /usr/share/man/man2/msgctl.2 /usr/share/man/man3/div.3 /usr/s=
hare/man/man3/sqrtl.3 /usr/share/man/man3/ctanhf.3 /usr/share/man/man3/j0f.=
3 /usr/share/man/man3/edata.3 /usr/share/man/man3/lrint.3 /usr/share/man/ma=
n3/cerfcl.3 /usr/share/man/man3/__fwriting.3 /usr/share/man/man3/acosf.3 /u=
sr/share/man/man3/gmtime_r.3 /usr/share/man/man3/gnu_dev_minor.3 /usr/share=
/man/man2/sched_yield.2 /usr/share/man/man3/ptsname.3 /usr/share/man/man3/F=
D_CLR.3 /usr/share/man/man3/lrand48_r.3 /usr/share/man/man3/qecvt_r.3 /usr/=
share/man/man3/ctanhl.3 /usr/share/man/man3/cexp2f.3 /usr/share/man/man3/j0=
l.3 /usr/share/man/man3/getnetent.3 /usr/share/man/man3/isless.3 /usr/share=
/man/man3/xdr_opaque.3 /usr/share/man/man3/cfsetospeed.3 /usr/share/man/man=
5/elf.5 /usr/share/man/man3/atexit.3 /usr/share/man/man2/get_mempolicy.2 /u=
sr/share/man/man3/isinfl.3 /usr/share/man/man2/remap_file_pages.2 /usr/shar=
e/man/man3/acosh.3 /usr/share/man/man2/clock_settime.2 /usr/share/man/man7/=
koi8-r.7 /usr/share/man/man3/getgrent_r.3 /usr/share/man/man3/pthread_sigqu=
eue.3 /usr/share/man/man3/svcerr_auth.3 /usr/share/man/man3/isalpha.3 /usr/=
share/man/man3/memalign.3 /usr/share/man/man3/fwrite.3 /usr/share/man/man3/=
setservent.3 /usr/share/man/man3/svcerr_decode.3 /usr/share/man/man7/hier.7=
 /usr/share/man/man2/killpg.2 /usr/share/man/man3/cfgetispeed.3 /usr/share/=
man/man3/key_secretkey_is_set.3 /usr/share/man/man7/rtnetlink.7 /usr/share/=
man/man3/ynf.3 /usr/share/man/man1/intro.1 /usr/share/man/man3/vwarn.3 /usr=
/share/man/man3/iconv.3 /usr/share/man/man3/end.3 /usr/share/man/man3/rintl=
.3 /usr/share/man/man3/seed48.3 /usr/share/man/man2/swapoff.2 /usr/share/ma=
n/man5/resolver.5 /usr/share/man/man3/acosl.3 /usr/share/man/man4/wavelan.4=
 /usr/share/man/man3/sethostent.3 /usr/share/man/man2/path_resolution.2 /us=
r/share/man/man3/euidaccess.3 /usr/share/man/man3/sqrtf.3 /usr/share/man/ma=
n3/hdestroy.3 /usr/share/man/man3/isspace.3 /usr/share/man/man3/mkfifoat.3 =
/usr/share/man/man2/setuid.2 /usr/share/man/man2/_syscall.2 /usr/share/man/=
man3/TAILQ_INSERT_TAIL.3 /usr/share/man/man7/suffixes.7 /usr/share/man/man2=
/symlinkat.2 /usr/share/man/man2/clock_nanosleep.2 /usr/share/man/man4/ccis=
s.4 /usr/share/man/man2/sync_file_range2.2 /usr/share/man/man3/lckpwdf.3 /u=
sr/share/man/man3/strdup.3 /usr/share/man/man3/asprintf.3 /usr/share/man/ma=
n3/getgrgid.3 /usr/share/man/man2/umount2.2 /usr/share/man/man3/wcsrtombs.3=
 /usr/share/man/man3/erand48_r.3 /usr/share/man/man2/bdflush.2 /usr/share/m=
an/man3/gamma.3 /usr/share/man/man2/fchown32.2 /usr/share/man/man3/CPU_COUN=
T.3 /usr/share/man/man3/LIST_HEAD.3 /usr/share/man/man3/getprotoent_r.3 /us=
r/share/man/man3/pthread_attr_setguardsize.3 /usr/share/man/man5/acct.5 /us=
r/share/man/man3/casinf.3 /usr/share/man/man7/netlink.7 /usr/share/man/man5=
/core.5 /usr/share/man/man3/fscanf.3 /usr/share/man/man4/st.4 /usr/share/ma=
n/man3/rexec.3 /usr/share/man/man3/casinhf.3 /usr/share/man/man3/envz.3 /us=
r/share/man/man3/pthread_cancel.3 /usr/share/man/man5/motd.5 /usr/share/man=
/man3/inet_lnaof.3 /usr/share/man/man3/cexp2l.3 /usr/share/man/man2/times.2=
 /usr/share/man/man3/pthread_setcanceltype.3 /usr/share/man/man3/cbrt.3 /us=
r/share/man/man3/ferror.3 /usr/share/man/man4/fifo.4 /usr/share/man/man3/wc=
scasecmp.3 /usr/share/man/man3/casinhl.3 /usr/share/man/man2/inw_p.2 /usr/s=
hare/man/man3/getipnodebyname.3 /usr/share/man/man3/fesetexceptflag.3 /usr/=
share/man/man3/bindresvport.3 /usr/share/man/man3/pthread_join.3 /usr/share=
/man/man3/free.3 /usr/share/man/man2/sendmmsg.2 /usr/share/man/man2/setpgid=
.2 /usr/share/man/man7/glob.7 /usr/share/man/man3/fclose.3 /usr/share/man/m=
an3/mbrtowc.3 /usr/share/man/man2/lstat64.2 /usr/share/man/man3/flockfile.3=
 /usr/share/man/man3/log10f.3 /usr/share/man/man7/iso_8859-8.7 /usr/share/m=
an/man3/getrpcbynumber_r.3 /usr/share/man/man3/aio_return.3 /usr/share/man/=
man3/getline.3 /usr/share/man/man2/sched_get_priority_max.2 /usr/share/man/=
man2/setgid.2 /usr/share/man/man3/sscanf.3 /usr/share/man/man5/ftpusers.5 /=
usr/share/man/man3/signbit.3 /usr/share/man/man3/string.3 /usr/share/man/ma=
n3/rintf.3 /usr/share/man/man2/prof.2 /usr/share/man/man3/pthread_detach.3 =
/usr/share/man/man3/fgetc_unlocked.3 /usr/share/man/man3/fmod.3 /usr/share/=
man/man3/toupper.3 /usr/share/man/man2/syscall.2 /usr/share/man/man3/canoni=
calize_file_name.3 /usr/share/man/man2/write.2 /usr/share/man/man3/getspent=
.3 /usr/share/man/man3/wctype.3 /usr/share/man/man3/strtoul.3 /usr/share/ma=
n/man3/sys_errlist.3 /usr/share/man/man2/break.2 /usr/share/man/man3/mq_not=
ify.3 /usr/share/man/man3/scalbf.3 /usr/share/man/man3/vlimit.3 /usr/share/=
man/man3/sigqueue.3 /usr/share/man/man3/expm1.3 /usr/share/man/man3/tzset.3=
 /usr/share/man/man2/_exit.2 /usr/share/man/man5/nscd.conf.5 /usr/share/man=
/man3/svc_unregister.3 /usr/share/man/man3/mq_timedreceive.3 /usr/share/man=
/man7/icmp.7 /usr/share/man/man3/exp10l.3 /usr/share/man/man3/getpwuid_r.3 =
/usr/share/man/man2/timer_create.2 /usr/share/man/man7/raw.7 /usr/share/man=
/man2/stat.2 /usr/share/man/man3/pthread_timedjoin_np.3 /usr/share/man/man3=
/addseverity.3 /usr/share/man/man3/getopt.3 /usr/share/man/man3/log1p.3 /us=
r/share/man/man3/setlogmask.3 /usr/share/man/man3/getutent.3 /usr/share/man=
/man3/isascii.3 /usr/share/man/man3/gcvt.3 /usr/share/man/man2/getuid.2 /us=
r/share/man/man3/dirfd.3 /usr/share/man/man3/csin.3 /usr/share/man/man3/str=
str.3 /usr/share/man/man2/epoll_ctl.2 /usr/share/man/man2/umount.2 /usr/sha=
re/man/man2/iopl.2 /usr/share/man/man3/lrand48.3 /usr/share/man/man3/intro.=
3 /usr/share/man/man3/mkdtemp.3 /usr/share/man/man3/opendir.3 /usr/share/ma=
n/man3/pthread_equal.3 /usr/share/man/man3/va_arg.3 /usr/share/man/man3/env=
z_add.3 /usr/share/man/man2/getxattr.2 /usr/share/man/man3/memchr.3 /usr/sh=
are/man/man2/futimesat.2 /usr/share/man/man3/jn.3 /usr/share/man/man3/y1.3 =
/usr/share/man/man3/sigsetops.3 /usr/share/man/man3/CIRCLEQ_INIT.3 /usr/sha=
re/man/man2/chown.2 /usr/share/man/man4/zero.4 /usr/share/man/man3/LIST_INS=
ERT_HEAD.3 /usr/share/man/man7/unicode.7 /usr/share/man/man3/expm1f.3 /usr/=
share/man/man3/random_r.3 /usr/share/man/man3/xdr_u_char.3 /usr/share/man/m=
an2/sigwaitinfo.2 /usr/share/man/man3/gnu_dev_major.3 /usr/share/man/man3/k=
ey_gendes.3 /usr/share/man/man3/catan.3 /usr/share/man/man3/svc_getreqset.3=
 /usr/share/man/man3/__fwritable.3 /usr/share/man/man2/inotify_init1.2 /usr=
/share/man/man3/authunix_create.3 /usr/share/man/man3/cexpl.3 /usr/share/ma=
n/man7/iso_8859-6.7 /usr/share/man/man3/catanl.3 /usr/share/man/man3/getenv=
.3 /usr/share/man/man3/svcerr_systemerr.3 /usr/share/man/man2/sched_getsche=
duler.2 /usr/share/man/man3/toascii.3 /usr/share/man/man3/getfsent.3 /usr/s=
hare/man/man3/lcong48.3 /usr/share/man/man7/iso_8859-4.7 /usr/share/man/man=
3/infnan.3 /usr/share/man/man3/optarg.3 /usr/share/man/man3/getchar_unlocke=
d.3 /usr/share/man/man3/ceil.3 /usr/share/man/man3/cexpf.3 /usr/share/man/m=
an3/csinh.3 /usr/share/man/man3/ftok.3 /usr/share/man/man2/fsync.2 /usr/sha=
re/man/man2/inotify_add_watch.2 /usr/share/man/man2/shmop.2 /usr/share/man/=
man2/outb_p.2 /usr/share/man/man3/ctan.3 /usr/share/man/man3/dlerror.3 /usr=
/share/man/man7/symlink.7 /usr/share/man/man7/latin10.7 /usr/share/man/man2=
/unshare.2 /usr/share/man/man3/LIST_INIT.3 /usr/share/man/man3/__fsetlockin=
g.3 /usr/share/man/man3/imaxabs.3 /usr/share/man/man3/csinf.3 /usr/share/ma=
n/man3/hypotf.3 /usr/share/man/man3/casinl.3 /usr/share/man/man2/semctl.2 /=
usr/share/man/man2/truncate.2 /usr/share/man/man4/dsp56k.4 /usr/share/man/m=
an7/cpuset.7 /usr/share/man/man3/funlockfile.3 /usr/share/man/man3/lgammaf.=
3 /usr/share/man/man3/qfcvt_r.3 /usr/share/man/man3/ceilf.3 /usr/share/man/=
man3/program_invocation_short_name.3 /usr/share/man/man3/getfsfile.3 /usr/s=
hare/man/man2/sched_setparam.2 /usr/share/man/man3/mbstowcs.3 /usr/share/ma=
n/man2/ioctl_list.2 /usr/share/man/man7/charsets.7 /usr/share/man/man3/svce=
rr_noprog.3 /usr/share/man/man4/vcs.4 /usr/share/man/man3/pthread_attr_gets=
tackaddr.3 /usr/share/man/man2/vmsplice.2 /usr/share/man/man3/finitel.3 /us=
r/share/man/man2/kill.2 /usr/share/man/man2/sched_getaffinity.2 /usr/share/=
man/man3/getrpcent_r.3 /usr/share/man/man3/pthread_attr_setstack.3 /usr/sha=
re/man/man3/clock_gettime.3 /usr/share/man/man3/cuserid.3 /usr/share/man/ma=
n3/getusershell.3 /usr/share/man/man3/strtod.3 /usr/share/man/man2/epoll_cr=
eate.2 /usr/share/man/man2/outl_p.2 /usr/share/man/man7/ascii.7 /usr/share/=
man/man3/pututxline.3 /usr/share/man/man4/mem.4 /usr/share/man/man4/fd.4 /u=
sr/share/man/man2/setresgid32.2 /usr/share/man/man3/clnt_geterr.3 /usr/shar=
e/man/man3/HUGE_VALL.3 /usr/share/man/man3/clog10.3 /usr/share/man/man3/pcl=
ose.3 /usr/share/man/man2/sync_file_range.2 /usr/share/man/man3/popen.3 /us=
r/share/man/man2/getdtablesize.2 /usr/share/man/man3/err.3 /usr/share/man/m=
an3/getspent_r.3 /usr/share/man/man3/CPU_AND.3 /usr/share/man/man3/csinhl.3=
 /usr/share/man/man3/strtof.3 /usr/share/man/man7/iso-8859-9.7 /usr/share/m=
an/man3/exp2l.3 /usr/share/man/man2/umask.2 /usr/share/man/man3/csqrt.3 /us=
r/share/man/man3/argz_count.3 /usr/share/man/man3/daemon.3 /usr/share/man/m=
an3/va_copy.3 /usr/share/man/man2/rt_sigqueueinfo.2 /usr/share/man/man7/iso=
-8859-7.7 /usr/share/man/man3/NAN.3 /usr/share/man/man3/csinhf.3 /usr/share=
/man/man3/creal.3 /usr/share/man/man3/modf.3 /usr/share/man/man3/xdr_char.3=
 /usr/share/man/man3/wmemcpy.3 /usr/share/man/man3/CIRCLEQ_ENTRY.3 /usr/sha=
re/man/man2/fchownat.2 /usr/share/man/man3/fexecve.3 /usr/share/man/man3/pt=
hread_attr_getschedparam.3 /usr/share/man/man3/getopt_long_only.3 /usr/shar=
e/man/man2/adjtimex.2 /usr/share/man/man2/ustat.2 /usr/share/man/man3/clock=
_getcpuclockid.3 /usr/share/man/man3/index.3 /usr/share/man/man3/rresvport.=
3 /usr/share/man/man3/gethostbyname2.3 /usr/share/man/man7/iso_8859_10.7 /u=
sr/share/man/man3/expm1l.3 /usr/share/man/man7/iso_8859-14.7 /usr/share/man=
/man2/stime.2 /usr/share/man/man2/fdatasync.2 /usr/share/man/man2/select_tu=
t.2 /usr/share/man/man2/ssetmask.2 /usr/share/man/man3/mempcpy.3 /usr/share=
/man/man7/iso_8859_14.7 /usr/share/man/man3/swapcontext.3 /usr/share/man/ma=
n3/fflush_unlocked.3 /usr/share/man/man3/setgrent.3 /usr/share/man/man7/iso=
_8859-10.7 /usr/share/man/man2/mkdirat.2 /usr/share/man/man2/fstatfs64.2 /u=
sr/share/man/man2/rt_tgsigqueueinfo.2 /usr/share/man/man3/CPU_ALLOC.3 /usr/=
share/man/man3/gai_suspend.3 /usr/share/man/man3/fnmatch.3 /usr/share/man/m=
an2/spu_create.2 /usr/share/man/man3/mq_getattr.3 /usr/share/man/man2/proce=
ss_vm_writev.2 /usr/share/man/man3/minor.3 /usr/share/man/man7/mdoc.7 /usr/=
share/man/man3/fenv.3 /usr/share/man/man2/getdomainname.2 /usr/share/man/ma=
n3/wcscspn.3 /usr/share/man/man3/log10.3 /usr/share/man/man3/encrypt_r.3 /u=
sr/share/man/man2/removexattr.2 /usr/share/man/man3/rint.3 /usr/share/man/m=
an3/setkey.3 /usr/share/man/man3/key_setsecret.3 /usr/share/man/man3/_flush=
lbf.3 /usr/share/man/man3/CIRCLEQ_INSERT_AFTER.3 /usr/share/man/man4/lp.4 /=
usr/share/man/man7/koi8-u.7 /usr/share/man/man3/roundl.3 /usr/share/man/man=
7/iso_8859-7.7 /usr/share/man/man3/clog2f.3 /usr/share/man/man1/getent.1 /u=
sr/share/man/man2/mknod.2 /usr/share/man/man3/setaliasent.3 /usr/share/man/=
man3/fcloseall.3 /usr/share/man/man3/lio_listio.3 /usr/share/man/man3/remai=
nder.3 /usr/share/man/man3/sprintf.3 /usr/share/man/man3/fread_unlocked.3 /=
usr/share/man/man2/ioctl.2 /usr/share/man/man3/pthread_attr_getaffinity_np.=
3 /usr/share/man/man3/drem.3 /usr/share/man/man3/sigfillset.3 /usr/share/ma=
n/man2/free_hugepages.2 /usr/share/man/man7/sigevent.7 /usr/share/man/man3/=
nextafterl.3 /usr/share/man/man2/lchown.2 /usr/share/man/man3/pthread_attr_=
destroy.3 /usr/share/man/man3/atol.3 /usr/share/man/man3/lgamma.3 /usr/shar=
e/man/man3/qecvt.3 /usr/share/man/man4/null.4 /usr/share/man/man3/va_start.=
3 /usr/share/man/man3/cfgetospeed.3 /usr/share/man/man3/envz_remove.3 /usr/=
share/man/man3/scalbnf.3 /usr/share/man/man2/_llseek.2 /usr/share/man/man3/=
tsearch.3 /usr/share/man/man3/sigignore.3 /usr/share/man/man2/shmget.2 /usr=
/share/man/man7/utf-8.7 /usr/share/man/man3/netlink.3 /usr/share/man/man3/e=
ndfsent.3 /usr/share/man/man2/sigtimedwait.2 /usr/share/man/man3/fgetgrent_=
r.3 /usr/share/man/man3/modff.3 /usr/share/man/man2/inb_p.2 /usr/share/man/=
man2/get_thread_area.2 /usr/share/man/man7/operator.7 /usr/share/man/man3/C=
PU_SET.3 /usr/share/man/man3/getaliasbyname.3 /usr/share/man/man3/pthread_k=
ill.3 /usr/share/man/man3/getpt.3 /usr/share/man/man3/cfsetispeed.3 /usr/sh=
are/man/man3/endmntent.3 /usr/share/man/man3/hdestroy_r.3 /usr/share/man/ma=
n2/munlockall.2 /usr/share/man/man3/ccos.3 /usr/share/man/man3/random.3 /us=
r/share/man/man3/mcheck.3 /usr/share/man/man3/setbuf.3 /usr/share/man/man3/=
logout.3 /usr/share/man/man3/clog.3 /usr/share/man/man5/filesystems.5 /usr/=
share/man/man3/feenableexcept.3 /usr/share/man/man3/pthread_attr_setscope.3=
 /usr/share/man/man3/iswupper.3 /usr/share/man/man3/getwchar_unlocked.3 /us=
r/share/man/man3/readdir.3 /usr/share/man/man3/xdr_short.3 /usr/share/man/m=
an3/tmpnam.3 /usr/share/man/man3/wcsnrtombs.3 /usr/share/man/man2/mknodat.2=
 /usr/share/man/man3/atan2.3 /usr/share/man/man7/unix.7 /usr/share/man/man2=
/tee.2 /usr/share/man/man3/callrpc.3 /usr/share/man/man3/getgrnam_r.3 /usr/=
share/man/man2/pciconfig_read.2 /usr/share/man/man3/scalbnl.3 /usr/share/ma=
n/man3/getrpcport.3 /usr/share/man/man3/__freadable.3 /usr/share/man/man3/u=
pdwtmpx.3 /usr/share/man/man3/getnetbyname_r.3 /usr/share/man/man7/ipv6.7 /=
usr/share/man/man3/ftw.3 /usr/share/man/man3/sigandset.3 /usr/share/man/man=
3/svc_destroy.3 /usr/share/man/man3/log2l.3 /usr/share/man/man3/roundf.3 /u=
sr/share/man/man3/inet_aton.3 /usr/share/man/man7/iso-8859-16.7 /usr/share/=
man/man2/sigaltstack.2 /usr/share/man/man3/lsearch.3 /usr/share/man/man2/ad=
d_key.2 /usr/share/man/man3/xdrrec_skiprecord.3 /usr/share/man/man3/fdopen.=
3 /usr/share/man/man3/svcerr_progvers.3 /usr/share/man/man3/feholdexcept.3 =
/usr/share/man/man3/svcudp_bufcreate.3 /usr/share/man/man3/xdr_getpos.3 /us=
r/share/man/man7/iso-8859-10.7 /usr/share/man/man2/set_tid_address.2 /usr/s=
hare/man/man3/wcscpy.3 /usr/share/man/man3/putspent.3 /usr/share/man/man3/n=
tohs.3 /usr/share/man/man3/getutmpx.3 /usr/share/man/man3/timezone.3 /usr/s=
hare/man/man2/madvise1.2 /usr/share/man/man3/fseeko.3 /usr/share/man/man3/w=
cslen.3 /usr/share/man/man3/csqrtl.3 /usr/share/man/man3/system.3 /usr/shar=
e/man/man3/atan.3 /usr/share/man/man3/freeaddrinfo.3 /usr/share/man/man3/st=
rncmp.3 /usr/share/man/man3/wcsstr.3 /usr/share/man/man2/nice.2 /usr/share/=
man/man3/be32toh.3 /usr/share/man/man3/initstate.3 /usr/share/man/man2/insw=
.2 /usr/share/man/man3/CPU_EQUAL_S.3 /usr/share/man/man2/rmdir.2 /usr/share=
/man/man3/xdrstdio_create.3 /usr/share/man/man3/makedev.3 /usr/share/man/ma=
n3/cimagf.3 /usr/share/man/man3/ldexpl.3 /usr/share/man/man3/trunc.3 /usr/s=
hare/man/man3/lround.3 /usr/share/man/man7/man.7 /usr/share/man/man3/le64to=
h.3 /usr/share/man/man3/clogf.3 /usr/share/man/man3/strrchr.3 /usr/share/ma=
n/man2/accept.2 /usr/share/man/man3/strxfrm.3 /usr/share/man/man3/gethosten=
t.3 /usr/share/man/man3/syslog.3 /usr/share/man/man3/sched_getcpu.3 /usr/sh=
are/man/man3/hsearch_r.3 /usr/share/man/man2/fstatvfs.2 /usr/share/man/man3=
/CMSG_FIRSTHDR.3 /usr/share/man/man5/networks.5 /usr/share/man/man3/hstrerr=
or.3 /usr/share/man/man3/tmpnam_r.3 /usr/share/man/man5/dir_colors.5 /usr/s=
hare/man/man3/ether_aton.3 /usr/share/man/man3/futimes.3 /usr/share/man/man=
3/re_exec.3 /usr/share/man/man2/setreuid.2 /usr/share/man/man7/libc.7 /usr/=
share/man/man3/pthread_attr_getdetachstate.3 /usr/share/man/man3/sighold.3 =
/usr/share/man/man3/strncasecmp.3 /usr/share/man/man2/setxattr.2 /usr/share=
/man/man2/uselib.2 /usr/share/man/man3/feof_unlocked.3 /usr/share/man/man3/=
clntraw_create.3 /usr/share/man/man3/tcsetpgrp.3 /usr/share/man/man3/catanh=
l.3 /usr/share/man/man7/iso-8859-2.7 /usr/share/man/man3/opterr.3 /usr/shar=
e/man/man7/iso-8859-4.7 /usr/share/man/man2/pread.2 /usr/share/man/man3/log=
1pl.3 /usr/share/man/man3/iswspace.3 /usr/share/man/man2/sigpending.2 /usr/=
share/man/man3/insque.3 /usr/share/man/man3/fmaxl.3 /usr/share/man/man3/tcf=
lush.3 /usr/share/man/man3/llrintf.3 /usr/share/man/man2/renameat.2 /usr/sh=
are/man/man3/ilogbf.3 /usr/share/man/man3/imaxdiv.3 /usr/share/man/man3/cos=
.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man2/faccessat.2 /u=
sr/share/man/man3/lfind.3 /usr/share/man/man5/resolv.conf.5 /usr/share/man/=
man3/iscntrl.3 /usr/share/man/man3/iswxdigit.3 /usr/share/man/man3/getproto=
bynumber_r.3 /usr/share/man/man2/setuid32.2 /usr/share/man/man3/hypot.3 /us=
r/share/man/man3/ldexp.3 /usr/share/man/man3/CPU_SET_S.3 /usr/share/man/man=
3/CMSG_SPACE.3 /usr/share/man/man3/exit.3 /usr/share/man/man3/inet_ntoa.3 /=
usr/share/man/man3/getwc_unlocked.3 /usr/share/man/man3/erf.3 /usr/share/ma=
n/man2/fadvise64_64.2 /usr/share/man/man3/pthread_attr_getscope.3 /usr/shar=
e/man/man2/shmdt.2 /usr/share/man/man2/eventfd2.2 /usr/share/man/man3/pathc=
onf.3 /usr/share/man/man3/scalb.3 /usr/share/man/man7/ip.7 /usr/share/man/m=
an3/strncpy.3 /usr/share/man/man3/execvp.3 /usr/share/man/man3/drand48_r.3 =
/usr/share/man/man3/tcsendbreak.3 /usr/share/man/man3/dlsym.3 /usr/share/ma=
n/man3/sem_destroy.3 /usr/share/man/man3/ftell.3 /usr/share/man/man3/CPU_FR=
EE.3 /usr/share/man/man3/error_one_per_line.3 /usr/share/man/man3/j1f.3 /us=
r/share/man/man3/wcscmp.3 /usr/share/man/man2/sethostid.2 /usr/share/man/ma=
n8/nscd.8 /usr/share/man/man2/poll.2 /usr/share/man/man3/svcfd_create.3 /us=
r/share/man/man3/fcvt_r.3 /usr/share/man/man3/shm_open.3 /usr/share/man/man=
3/ctanf.3 /usr/share/man/man3/ffsll.3 /usr/share/man/man2/mprotect.2 /usr/s=
hare/man/man3/cerfcf.3 /usr/share/man/man3/htole16.3 /usr/share/man/man3/rp=
c.3 /usr/share/man/man3/glob.3 /usr/share/man/man2/mq_getsetattr.2 /usr/sha=
re/man/man3/isatty.3 /usr/share/man/man3/timegm.3 /usr/share/man/man2/listx=
attr.2 /usr/share/man/man3/atoq.3 /usr/share/man/man3/ungetwc.3 /usr/share/=
man/man3/hcreate.3 /usr/share/man/man3/cosl.3 /usr/share/man/man2/getresgid=
32.2 /usr/share/man/man3/xdr_pointer.3 /usr/share/man/man3/getnetgrent.3 /u=
sr/share/man/man3/iconv_close.3 /usr/share/man/man3/frexpf.3 /usr/share/man=
/man2/getpriority.2 /usr/share/man/man2/mincore.2 /usr/share/man/man3/hasmn=
topt.3 /usr/share/man/man8/intro.8 /usr/share/man/man3/scalblnf.3 /usr/shar=
e/man/man3/y0l.3 /usr/share/man/man5/securetty.5 /usr/share/man/man3/cleare=
nv.3 /usr/share/man/man3/localtime_r.3 /usr/share/man/man4/sd.4 /usr/share/=
man/man3/fts_open.3 /usr/share/man/man3/nextafter.3 /usr/share/man/man4/int=
ro.4 /usr/share/man/man3/nearbyintf.3 /usr/share/man/man3/pthread_getschedp=
aram.3 /usr/share/man/man2/init_module.2 /usr/share/man/man2/futex.2 /usr/s=
hare/man/man2/pciconfig_write.2 /usr/share/man/man3/ynl.3 /usr/share/man/ma=
n2/sync.2 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/cexp.3 /usr/s=
hare/man/man3/memcpy.3 /usr/share/man/man3/vwarnx.3 /usr/share/man/man2/chm=
od.2 /usr/share/man/man2/inl_p.2 /usr/share/man/man3/offsetof.3 /usr/share/=
man/man3/fwprintf.3 /usr/share/man/man3/ether_ntoa.3 /usr/share/man/man3/ht=
ole32.3 /usr/share/man/man3/vtimes.3 /usr/share/man/man3/getsubopt.3 /usr/s=
hare/man/man2/sched_rr_get_interval.2 /usr/share/man/man2/clone2.2 /usr/sha=
re/man/man3/stdin.3 /usr/share/man/man3/getnetent_r.3 /usr/share/man/man3/c=
tanl.3 /usr/share/man/man3/sigdelset.3 /usr/share/man/man5/slabinfo.5 /usr/=
share/man/man2/statvfs.2 /usr/share/man/man3/setusershell.3 /usr/share/man/=
man3/vscanf.3 /usr/share/man/man3/j0.3 /usr/share/man/man2/pread64.2 /usr/s=
hare/man/man3/xdr_destroy.3 /usr/share/man/man2/oldlstat.2 /usr/share/man/m=
an3/bzero.3 /usr/share/man/man4/rtc.4 /usr/share/man/man3/tanh.3 /usr/share=
/man/man7/sem_overview.7 /usr/share/man/man4/console_codes.4 /usr/share/man=
/man3/malloc_usable_size.3 /usr/share/man/man3/fpurge.3 /usr/share/man/man2=
/getdents64.2 /usr/share/man/man3/xdr_callmsg.3 /usr/share/man/man2/time.2 =
/usr/share/man/man2/lgetxattr.2 /usr/share/man/man3/mkstemps.3 /usr/share/m=
an/man2/llseek.2 /usr/share/man/man3/argz_create.3 /usr/share/man/man3/yn.3=
 /usr/share/man/man3/ntohl.3 /usr/share/man/man3/getfsspec.3 /usr/share/man=
/man7/capabilities.7 /usr/share/man/man3/xencrypt.3 /usr/share/man/man2/sen=
dmsg.2 /usr/share/man/man3/forkpty.3 /usr/share/man/man3/memccpy.3 /usr/sha=
re/man/man2/getrusage.2 /usr/share/man/man3/CMSG_ALIGN.3 /usr/share/man/man=
3/erfc.3 /usr/share/man/man3/atoi.3 /usr/share/man/man3/CIRCLEQ_INSERT_TAIL=
.3 /usr/share/man/man3/getspnam_r.3 /usr/share/man/man3/twalk.3 /usr/share/=
man/man2/alarm.2 /usr/share/man/man3/res_init.3 /usr/share/man/man3/cprojl.=
3 /usr/share/man/man3/putchar_unlocked.3 /usr/share/man/man3/getaliasbyname=
_r.3 /usr/share/man/man3/erand48.3 /usr/share/man/man3/fts_close.3 /usr/sha=
re/man/man3/getdirentries.3 /usr/share/man/man3/catanh.3 /usr/share/man/man=
3/getaddrinfo.3 /usr/share/man/man3/llrint.3 /usr/share/man/man3/mq_open.3 =
/usr/share/man/man2/_sysctl.2 /usr/share/man/man3/sigset.3 /usr/share/man/m=
an3/telldir.3 /usr/share/man/man3/rexec_af.3 /usr/share/man/man3/ldiv.3 /us=
r/share/man/man3/mrand48.3 /usr/share/man/man3/scalbn.3 /usr/share/man/man3=
/getipnodebyaddr.3 /usr/share/man/man3/pthread_kill_other_threads_np.3 /usr=
/share/man/man3/gai_error.3 /usr/share/man/man2/select.2 /usr/share/man/man=
3/wcrtomb.3 /usr/share/man/man3/rand_r.3 /usr/share/man/man3/gethostbyaddr.=
3 /usr/share/man/man2/inotify_rm_watch.2 /usr/share/man/man5/nologin.5 /usr=
/share/man/man3/error_at_line.3 /usr/share/man/man3/setenv.3 /usr/share/man=
/man3/scalbl.3 /usr/share/man/man3/atanhf.3 /usr/share/man/man3/mbsnrtowcs.=
3 /usr/share/man/man3/cpow.3 /usr/share/man/man3/klogctl.3 /usr/share/man/m=
an3/argz_append.3 /usr/share/man/man2/readlink.2 /usr/share/man/man3/sigism=
ember.3 /usr/share/man/man2/msgsnd.2 /usr/share/man/man3/logf.3 /usr/share/=
man/man3/tanhl.3 /usr/share/man/man3/res_query.3 /usr/share/man/man3/inet.3=
 /usr/share/man/man3/significandf.3 /usr/share/man/man3/fma.3 /usr/share/ma=
n/man3/ether_ntoa_r.3 /usr/share/man/man2/getpagesize.2 /usr/share/man/man3=
/seekdir.3 /usr/share/man/man2/mlockall.2 /usr/share/man/man2/statfs64.2 /u=
sr/share/man/man3/nexttoward.3 /usr/share/man/man4/tty_ioctl.4 /usr/share/m=
an/man3/va_end.3 /usr/share/man/man3/regexec.3 /usr/share/man/man3/exec.3 /=
usr/share/man/man3/acos.3 /usr/share/man/man3/feof.3 /usr/share/man/man2/ls=
tat.2 /usr/share/man/man3/endprotoent.3 /usr/share/man/man3/LIST_REMOVE.3 /=
usr/share/man/man3/memfrob.3 /usr/share/man/man3/wctomb.3 /usr/share/man/ma=
n3/asinhl.3 /usr/share/man/man3/cerff.3 /usr/share/man/man7/man-pages.7 /us=
r/share/man/man3/pthread_tryjoin_np.3 /usr/share/man/man2/rt_sigpending.2 /=
usr/share/man/man7/iso-8859-15.7 /usr/share/man/man3/ttyname_r.3 /usr/share=
/man/man3/erfcl.3 /usr/share/man/man3/jrand48_r.3 /usr/share/man/man2/mrema=
p.2 /usr/share/man/man6/intro.6 /usr/share/man/man3/setjmp.3 /usr/share/man=
/man7/tis-620.7 /usr/share/man/man3/sockatmark.3 /usr/share/man/man5/locale=
.5 /usr/share/man/man2/gettid.2 /usr/share/man/man2/getgroups32.2 /usr/shar=
e/man/man3/__fbufsize.3 /usr/share/man/man3/getwchar.3 /usr/share/man/man3/=
memset.3 /usr/share/man/man2/getpeername.2 /usr/share/man/man3/fwide.3 /usr=
/share/man/man2/timer_getoverrun.2 /usr/share/man/man3/endgrent.3 /usr/shar=
e/man/man4/futex.4 /usr/share/man/man3/tcgetattr.3 /usr/share/man/man3/rege=
x.3 /usr/share/man/man7/iso_8859_16.7 /usr/share/man/man3/fegetexceptflag.3=
 /usr/share/man/man7/intro.7 /usr/share/man/man3/srandom_r.3 /usr/share/man=
/man3/catclose.3 /usr/share/man/man3/xdr_replymsg.3 /usr/share/man/man3/fpr=
intf.3 /usr/share/man/man3/xdr_void.3 /usr/share/man/man3/cimagl.3 /usr/sha=
re/man/man2/sched_get_priority_min.2 /usr/share/man/man2/getegid.2 /usr/sha=
re/man/man3/getservbyname.3 /usr/share/man/man2/fstatfs.2 /usr/share/man/ma=
n3/coshl.3 /usr/share/man/man2/fgetxattr.2 /usr/share/man/man3/floor.3 /usr=
/share/man/man3/__flbf.3 /usr/share/man/man5/host.conf.5 /usr/share/man/man=
2/inw.2 /usr/share/man/man3/on_exit.3 /usr/share/man/man3/dlopen.3 /usr/sha=
re/man/man3/pthread_attr_init.3 /usr/share/man/man3/strtoumax.3 /usr/share/=
man/man3/rresvport_af.3 /usr/share/man/man2/sigsuspend.2 /usr/share/man/man=
3/strtoimax.3 /usr/share/man/man3/getmntent.3 /usr/share/man/man3/CIRCLEQ_I=
NSERT_BEFORE.3 /usr/share/man/man2/fadvise64.2 /usr/share/man/man3/aio_writ=
e.3 /usr/share/man/man3/pthread_attr_getschedpolicy.3 /usr/share/man/man3/s=
igemptyset.3 /usr/share/man/man3/xdr_wrapstring.3 /usr/share/man/man5/ipc.5=
 /usr/share/man/man7/iso_8859_3.7 /usr/share/man/man2/getegid32.2 /usr/shar=
e/man/man3/pthread_getcpuclockid.3 /usr/share/man/man3/ruserok.3 /usr/share=
/man/man3/cfmakeraw.3 /usr/share/man/man2/fchmodat.2 /usr/share/man/man3/fm=
axf.3 /usr/share/man/man3/svcerr_noproc.3 /usr/share/man/man3/jnf.3 /usr/sh=
are/man/man2/timerfd_create.2 /usr/share/man/man3/gai_strerror.3 /usr/share=
/man/man3/setfsent.3 /usr/share/man/man3/xdr_opaque_auth.3 /usr/share/man/m=
an3/mrand48_r.3 /usr/share/man/man2/timer_settime.2 /usr/share/man/man3/mal=
loc_info.3 /usr/share/man/man3/inet_netof.3 /usr/share/man/man3/timeradd.3 =
/usr/share/man/man7/x25.7 /usr/share/man/man4/full.4 /usr/share/man/man2/re=
adv.2 /usr/share/man/man3/getutent_r.3 /usr/share/man/man2/mq_unlink.2 /usr=
/share/man/man2/chown32.2 /usr/share/man/man3/wmemchr.3 /usr/share/man/man3=
/getutxline.3 /usr/share/man/man2/acct.2 /usr/share/man/man3/CPU_OR.3 /usr/=
share/man/man3/sem_post.3 /usr/share/man/man3/strtouq.3 /usr/share/man/man3=
/clog2l.3 /usr/share/man/man3/conj.3 /usr/share/man/man2/io_setup.2 /usr/sh=
are/man/man3/getaliasent_r.3 /usr/share/man/man4/tty.4 /usr/share/man/man2/=
ioprio_get.2 /usr/share/man/man3/login_tty.3 /usr/share/man/man3/pow.3 /usr=
/share/man/man7/latin2.7 /usr/share/man/man3/mbrlen.3 /usr/share/man/man7/s=
vipc.7 /usr/share/man/man3/unlockpt.3 /usr/share/man/man3/clntudp_create.3 =
/usr/share/man/man3/cabs.3 /usr/share/man/man2/tkill.2 /usr/share/man/man7/=
iso_8859-2.7 /usr/share/man/man7/termio.7 /usr/share/man/man3/sincos.3 /usr=
/share/man/man3/strchr.3 /usr/share/man/man3/getservent_r.3 /usr/share/man/=
man2/gettimeofday.2 /usr/share/man/man3/pow10.3 /usr/share/man/man3/abs.3 /=
usr/share/man/man3/cabsf.3 /usr/share/man/man3/xcrypt.3 /usr/share/man/man3=
/towlower.3 /usr/share/man/man2/llistxattr.2 /usr/share/man/man2/flistxattr=
.2 /usr/share/man/man3/fsetpos.3 /usr/share/man/man5/tzfile.5 /usr/share/ma=
n/man3/ttyname.3 /usr/share/man/man3/fabsf.3 /usr/share/man/man3/fileno_unl=
ocked.3 /usr/share/man/man3/HUGE_VAL.3 /usr/share/man/man2/munmap.2 /usr/sh=
are/man/man7/latin4.7 /usr/share/man/man2/setgid32.2 /usr/share/man/man3/fg=
etc.3 /usr/share/man/man2/outsl.2 /usr/share/man/man3/mkostemps.3 /usr/shar=
e/man/man3/jnl.3 /usr/share/man/man3/clock.3 /usr/share/man/man2/gethostnam=
e.2 /usr/share/man/man3/makecontext.3 /usr/share/man/man3/log2.3 /usr/share=
/man/man3/setnetent.3 /usr/share/man/man3/putwchar_unlocked.3 /usr/share/ma=
n/man2/vfork.2 /usr/share/man/man3/xdr_reference.3 /usr/share/man/man2/shma=
t.2 /usr/share/man/man3/vswprintf.3 /usr/share/man/man3/isgreaterequal.3 /u=
sr/share/man/man3/powf.3 /usr/share/man/man3/TAILQ_INSERT_AFTER.3 /usr/shar=
e/man/man4/kmem.4 /usr/share/man/man3/mktemp.3 /usr/share/man/man3/globfree=
.3 /usr/share/man/man2/getpgrp.2 /usr/share/man/man3/MB_CUR_MAX.3 /usr/shar=
e/man/man3/wcsdup.3 /usr/share/man/man3/ssignal.3 /usr/share/man/man2/recvm=
msg.2 /usr/share/man/man3/get_nprocs_conf.3 /usr/share/man/man5/shells.5 /u=
sr/share/man/man2/mount.2 /usr/share/man/man3/cacosh.3 /usr/share/man/man3/=
putgrent.3 /usr/share/man/man3/xdr_double.3 /usr/share/man/man3/strcat.3 /u=
sr/share/man/man3/sgetspent_r.3 /usr/share/man/man3/fpathconf.3 /usr/share/=
man/man2/ppoll.2 /usr/share/man/man8/ld-linux.so.8 /usr/share/man/man3/cter=
mid.3 /usr/share/man/man3/fts_read.3 /usr/share/man/man2/getitimer.2 /usr/s=
hare/man/man8/zdump.8 /usr/share/man/man2/capset.2 /usr/share/man/man2/tuxc=
all.2 /usr/share/man/man3/versionsort.3 /usr/share/man/man3/xdr_authunix_pa=
rms.3 /usr/share/man/man3/getdate_err.3 /usr/share/man/man3/dladdr.3 /usr/s=
hare/man/man3/auth_destroy.3 /usr/share/man/man2/syslog.2 /usr/share/man/ma=
n7/hostname.7 /usr/share/man/man3/putchar.3 /usr/share/man/man3/pthread_sig=
mask.3 /usr/share/man/man2/getgid.2 /usr/share/man/man3/cexp2.3 /usr/share/=
man/man3/CPU_ALLOC_SIZE.3 /usr/share/man/man3/CPU_ZERO.3 /usr/share/man/man=
3/getpwnam.3 /usr/share/man/man2/timerfd_gettime.2 /usr/share/man/man3/ctim=
e.3 /usr/share/man/man3/svc_getcaller.3 /usr/share/man/man3/getutline.3 /us=
r/share/man/man3/getlogin_r.3 /usr/share/man/man3/memcmp.3 /usr/share/man/m=
an3/utmpname.3 /usr/share/man/man3/gnu_dev_makedev.3 /usr/share/man/man2/un=
link.2 /usr/share/man/man2/getsockname.2 /usr/share/man/man3/argz_stringify=
.3 /usr/share/man/man3/verrx.3 /usr/share/man/man3/argz_add.3 /usr/share/ma=
n/man3/setstate.3 /usr/share/man/man3/rpmatch.3 /usr/share/man/man2/getgrou=
ps.2 /usr/share/man/man2/socketpair.2 /usr/share/man/man2/nanosleep.2 /usr/=
share/man/man3/mcheck_pedantic.3 /usr/share/man/man2/lremovexattr.2 /usr/sh=
are/man/man8/ld.so.8 /usr/share/man/man3/getprotobyname_r.3 /usr/share/man/=
man2/pivot_root.2 /usr/share/man/man3/strpbrk.3 /usr/share/man/man3/getdate=
.3 /usr/share/man/man2/setfsgid.2 /usr/share/man/man3/rcmd_af.3 /usr/share/=
man/man3/recno.3 /usr/share/man/man4/ptmx.4 /usr/share/man/man3/key_decrypt=
session.3 /usr/share/man/man8/tzselect.8 /usr/share/man/man3/endnetent.3 /u=
sr/share/man/man2/mq_open.2 /usr/share/man/man2/rename.2 /usr/share/man/man=
3/bsd_signal.3 /usr/share/man/man7/socket.7 /usr/share/man/man3/isnanl.3 /u=
sr/share/man/man3/malloc_hook.3 /usr/share/man/man3/alphasort.3 /usr/share/=
man/man3/significandl.3 /usr/share/man/man3/seed48_r.3 /usr/share/man/man3/=
xprt_unregister.3 /usr/share/man/man3/y0.3 /usr/share/man/man3/isgreater.3 =
/usr/share/man/man3/getservbyport.3 /usr/share/man/man2/access.2 /usr/share=
/man/man3/memmem.3 /usr/share/man/man3/clnt_perrno.3 /usr/share/man/man3/en=
dnetgrent.3 /usr/share/man/man3/conjl.3 /usr/share/man/man3/fopen.3 /usr/sh=
are/man/man3/scalbln.3 /usr/share/man/man3/a64l.3 /usr/share/man/man2/sigpr=
ocmask.2 /usr/share/man/man3/strtoq.3 /usr/share/man/man3/pututline.3 /usr/=
share/man/man3/cimag.3 /usr/share/man/man2/geteuid32.2 /usr/share/man/man3/=
clnt_freeres.3 /usr/share/man/man3/fts.3 /usr/share/man/man3/getpwent.3 /us=
r/share/man/man3/endian.3 /usr/share/man/man2/unimplemented.2 /usr/share/ma=
n/man3/pthread_self.3 /usr/share/man/man3/mprobe.3 /usr/share/man/man3/hypo=
tl.3 /usr/share/man/man3/closedir.3 /usr/share/man/man3/wcsrchr.3 /usr/shar=
e/man/man3/getservbyname_r.3 /usr/share/man/man4/ttyS.4 /usr/share/man/man3=
/hash.3 /usr/share/man/man2/timerfd_settime.2 /usr/share/man/man2/io_destro=
y.2 /usr/share/man/man3/stpcpy.3 /usr/share/man/man2/ftruncate64.2 /usr/sha=
re/man/man2/sigaction.2 /usr/share/man/man3/xprt_register.3 /usr/share/man/=
man3/gethostbyaddr_r.3 /usr/share/man/man3/timersub.3 /usr/share/man/man3/g=
etutmp.3 /usr/share/man/man3/getaliasent.3 /usr/share/man/man7/iso_8859-3.7=
 /usr/share/man/man3/catanhf.3 /usr/share/man/man3/iswalnum.3 /usr/share/ma=
n/man3/powl.3 /usr/share/man/man3/asin.3 /usr/share/man/man3/qsort_r.3 /usr=
/share/man/man2/fallocate.2 /usr/share/man/man3/endutent.3 /usr/share/man/m=
an3/aio_fsync.3 /usr/share/man/man3/psignal.3 /usr/share/man/man3/htobe64.3=
 /usr/share/man/man3/localtime.3 /usr/share/man/man2/fcntl.2 /usr/share/man=
/man2/process_vm_readv.2 /usr/share/man/man2/getsockopt.2 /usr/share/man/ma=
n5/nsswitch.conf.5 /usr/share/man/man3/csqrtf.3 /usr/share/man/man3/pthread=
_attr_setschedpolicy.3 /usr/share/man/man2/arch_prctl.2 /usr/share/man/man3=
/clogl.3 /usr/share/man/man3/be16toh.3 /usr/share/man/man2/stty.2 /usr/shar=
e/man/man2/modify_ldt.2 /usr/share/man/man3/sigisemptyset.3 /usr/share/man/=
man3/strcspn.3 /usr/share/man/man2/oldstat.2 /usr/share/man/man3/nexttoward=
f.3 /usr/share/man/man3/DES_FAILED.3 /usr/share/man/man3/nftw.3 /usr/share/=
man/man2/query_module.2 /usr/share/man/man2/get_kernel_syms.2 /usr/share/ma=
n/man3/fgets_unlocked.3 /usr/share/man/man3/jrand48.3 /usr/share/man/man3/g=
etspnam.3 /usr/share/man/man2/exit_group.2 /usr/share/man/man3/wcsnlen.3 /u=
sr/share/man/man2/preadv.2 /usr/share/man/man2/getuid32.2 /usr/share/man/ma=
n3/cacosf.3 /usr/share/man/man3/fegetenv.3 /usr/share/man/man3/sem_open.3 /=
usr/share/man/man3/putpwent.3 /usr/share/man/man3/setlocale.3 /usr/share/ma=
n/man3/malloc_set_state.3 /usr/share/man/man7/uri.7 /usr/share/man/man3/CPU=
_XOR_S.3 /usr/share/man/man2/setresgid.2 /usr/share/man/man3/open_wmemstrea=
m.3 /usr/share/man/man2/pwrite64.2 /usr/share/man/man3/mq_close.3 /usr/shar=
e/man/man3/isgraph.3 /usr/share/man/man3/ctanh.3 /usr/share/man/man2/brk.2 =
/usr/share/man/man2/ioprio_set.2 /usr/share/man/man3/pthread_attr_getstacks=
ize.3 /usr/share/man/man3/vasprintf.3 /usr/share/man/man2/sendto.2 /usr/sha=
re/man/man2/oldolduname.2 /usr/share/man/man2/munlock.2 /usr/share/man/man7=
/iso-8859-6.7 /usr/share/man/man3/basename.3 /usr/share/man/man2/rt_sigacti=
on.2 /usr/share/man/man3/log1pf.3 /usr/share/man/man3/islessequal.3 /usr/sh=
are/man/man7/iso-8859-8.7 /usr/share/man/man2/bind.2 /usr/share/man/man3/sv=
c_freeargs.3 /usr/share/man/man3/stdout.3 /usr/share/man/man7/iso_8859_13.7=
 /usr/share/man/man3/sinf.3 /usr/share/man/man2/timer_gettime.2 /usr/share/=
man/man3/fesetenv.3 /usr/share/man/man3/fileno.3 /usr/share/man/man7/iso_88=
59_11.7 /usr/share/man/man3/rewinddir.3 /usr/share/man/man2/quotactl.2 /usr=
/share/man/man7/iso_8859-15.7 /usr/share/man/man2/sigreturn.2 /usr/share/ma=
n/man3/xdr_bytes.3 /usr/share/man/man7/environ.7 /usr/share/man/man7/ddp.7 =
/usr/share/man/man3/getservbyport_r.3 /usr/share/man/man3/sys_nerr.3 /usr/s=
hare/man/man3/profil.3 /usr/share/man/man3/fmaf.3 /usr/share/man/man7/numa.=
7 /usr/share/man/man7/iso_8859-11.7 /usr/share/man/man3/error_print_prognam=
e.3 /usr/share/man/man3/fgetwc_unlocked.3 /usr/share/man/man3/y0f.3 /usr/sh=
are/man/man3/sem_wait.3 /usr/share/man/man7/packet.7 /usr/share/man/man2/ms=
ync.2 /usr/share/man/man3/readdir_r.3 /usr/share/man/man7/iso_8859-13.7 /us=
r/share/man/man3/__freading.3 /usr/share/man/man3/dn_expand.3 /usr/share/ma=
n/man3/fmal.3 /usr/share/man/man3/dirname.3 /usr/share/man/man2/move_pages.=
2 /usr/share/man/man3/getlogin.3 /usr/share/man/man3/atanh.3 /usr/share/man=
/man3/fflush.3 /usr/share/man/man2/subpage_prot.2 /usr/share/man/man3/vfsca=
nf.3 /usr/share/man/man3/iswdigit.3 /usr/share/man/man3/qfcvt.3 /usr/share/=
man/man3/iruserok_af.3 /usr/share/man/man7/iso-8859-3.7 /usr/share/man/man2=
/sethostname.2 /usr/share/man/man3/dn_comp.3 /usr/share/man/man3/scanf.3 /u=
sr/share/man/man7/mq_overview.7 /usr/share/man/man3/backtrace.3 /usr/share/=
man/man3/clnt_destroy.3 /usr/share/man/man2/pwrite.2 /usr/share/man/man7/pt=
y.7 /usr/share/man/man7/feature_test_macros.7 /usr/share/man/man3/cosh.3 /u=
sr/share/man/man2/sched_getparam.2 /usr/share/man/man3/getc_unlocked.3 /usr=
/share/man/man3/ether_line.3 /usr/share/man/man4/cpuid.4 /usr/share/man/man=
3/fmemopen.3 /usr/share/man/man3/freopen.3 /usr/share/man/man3/mkfifo.3 /us=
r/share/man/man3/atanl.3 /usr/share/man/man3/clnt_call.3 /usr/share/man/man=
3/ccosl.3 /usr/share/man/man3/ftime.3 /usr/share/man/man3/clog2.3 /usr/shar=
e/man/man3/htonl.3 /usr/share/man/man3/getprotobynumber.3 /usr/share/man/ma=
n3/clnt_sperror.3 /usr/share/man/man3/h_errno.3 /usr/share/man/man3/remaind=
erl.3 /usr/share/man/man2/getpgid.2 /usr/share/man/man3/ccosh.3 /usr/share/=
man/man2/seteuid.2 /usr/share/man/man3/login.3 /usr/share/man/man4/console_=
ioctl.4 /usr/share/man/man5/charmap.5 /usr/share/man/man3/vprintf.3 /usr/sh=
are/man/man3/setutxent.3 /usr/share/man/man3/fgetwc.3 /usr/share/man/man3/x=
dr_callhdr.3 /usr/share/man/man3/bcmp.3 /usr/share/man/man3/getpwuid.3 /usr=
/share/man/man7/spufs.7 /usr/share/man/man3/cosf.3 /usr/share/man/man3/near=
byintl.3 /usr/share/man/man3/xdr_long.3 /usr/share/man/man3/sqrt.3 /usr/sha=
re/man/man3/stdarg.3 /usr/share/man/man3/sigsetmask.3 /usr/share/man/man3/s=
calblnl.3 /usr/share/man/man3/endusershell.3 /usr/share/man/man3/sleep.3 /u=
sr/share/man/man4/urandom.4 /usr/share/man/man3/pthread_getattr_np.3 /usr/s=
hare/man/man3/setmntent.3 /usr/share/man/man3/srand48.3 /usr/share/man/man3=
/gnu_get_libc_version.3 /usr/share/man/man3/clntudp_bufcreate.3 /usr/share/=
man/man2/clone.2 /usr/share/man/man3/xdr_u_int.3 /usr/share/man/man7/time.7=
 /usr/share/man/man3/openpty.3 /usr/share/man/man7/path_resolution.7 /usr/s=
hare/man/man3/fgetpos.3 /usr/share/man/man4/vcsa.4 /usr/share/man/man3/nl_l=
anginfo.3 /usr/share/man/man3/MB_LEN_MAX.3 /usr/share/man/man2/lchown32.2 /=
usr/share/man/man3/authunix_create_default.3 /usr/share/man/man3/tfind.3 /u=
sr/share/man/man3/pmap_getmaps.3 /usr/share/man/man3/mq_timedsend.3 /usr/sh=
are/man/man3/getumask.3 /usr/share/man/man3/atanf.3 /usr/share/man/man3/eac=
cess.3 /usr/share/man/man3/wmempcpy.3 /usr/share/man/man3/getnameinfo.3 /us=
r/share/man/man3/crypt_r.3 /usr/share/man/man3/herror.3 /usr/share/man/man2=
/statfs.2 /usr/share/man/man3/getpw.3 /usr/share/man/man3/clnt_broadcast.3 =
/usr/share/man/man2/insl.2 /usr/share/man/man2/sysctl.2 /usr/share/man/man3=
/tan.3 /usr/share/man/man3/strfmon.3 /usr/share/man/man3/dbopen.3 /usr/shar=
e/man/man3/sem_close.3 /usr/share/man/man7/inotify.7 /usr/share/man/man2/de=
lete_module.2 /usr/share/man/man3/raise.3 /usr/share/man/man3/cprojf.3 /usr=
/share/man/man3/ualarm.3 /usr/share/man/man3/get_current_dir_name.3 /usr/sh=
are/man/man2/pselect.2 /usr/share/man/man3/asctime_r.3 /usr/share/man/man3/=
pthread_setschedparam.3 /usr/share/man/man3/getutxent.3 /usr/share/man/man3=
/errx.3 /usr/share/man/man3/floorf.3 /usr/share/man/man3/gmtime.3 /usr/shar=
e/man/man3/updwtmp.3 /usr/share/man/man3/dlclose.3 /usr/share/man/man7/fifo=
.7 /usr/share/man/man3/realpath.3 /usr/share/man/man3/freehostent.3 /usr/sh=
are/man/man2/waitpid.2 /usr/share/man/man7/epoll.7 /usr/share/man/man3/getp=
went_r.3 /usr/share/man/man3/ulckpwdf.3 /usr/share/man/man7/iso-8859-13.7 /=
usr/share/man/man3/rand.3 /usr/share/man/man3/getwd.3 /usr/share/man/man2/p=
osix_fadvise.2 /usr/share/man/man3/gethostid.3 /usr/share/man/man7/iso-8859=
-11.7 /usr/share/man/man7/regex.7 /usr/share/man/man3/isunordered.3 /usr/sh=
are/man/man3/exp.3 /usr/share/man/man3/isupper.3 /usr/share/man/man3/clnt_c=
ontrol.3 /usr/share/man/man3/timerclear.3 /usr/share/man/man3/wcscat.3 /usr=
/share/man/man3/finite.3 /usr/share/man/man3/xdrrec_eof.3 /usr/share/man/ma=
n2/fork.2 /usr/share/man/man2/outw.2 /usr/share/man/man2/reboot.2 /usr/shar=
e/man/man3/__fpending.3 /usr/share/man/man2/truncate64.2 /usr/share/man/man=
3/pmap_getport.3 /usr/share/man/man3/xdr_accepted_reply.3 /usr/share/man/ma=
n3/daylight.3 /usr/share/man/man3/wcstoumax.3 /usr/share/man/man3/adjtime.3=
 /usr/share/man/man3/cerfl.3 /usr/share/man/man3/cbc_crypt.3 /usr/share/man=
/man2/utime.2 /usr/share/man/man2/ftruncate.2 /usr/share/man/man3/authnone_=
create.3 /usr/share/man/man3/fgetpwent.3 /usr/share/man/man3/aio_error.3 /u=
sr/share/man/man3/setspent.3 /usr/share/man/man2/nfsservctl.2 /usr/share/ma=
n/man2/insb.2 /usr/share/man/man2/getgid32.2 /usr/share/man/man2/uname.2 /u=
sr/share/man/man1/time.1 /usr/share/man/man3/catgets.3 /usr/share/man/man3/=
tolower.3 /usr/share/man/man2/creat.2 /usr/share/man/man3/sem_trywait.3 /us=
r/share/man/man3/floorl.3 /usr/share/man/man3/getnetbyaddr_r.3 /usr/share/m=
an/man3/passwd2des.3 /usr/share/man/man3/wprintf.3 /usr/share/man/man3/getu=
txid.3 /usr/share/man/man3/nrand48_r.3 /usr/share/man/man3/logb.3 /usr/shar=
e/man/man2/inotify_init.2 /usr/share/man/man2/io_cancel.2 /usr/share/man/ma=
n3/cbrtf.3 /usr/share/man/man3/xdr_bool.3 /usr/share/man/man7/cp1251.7 /usr=
/share/man/man3/FD_SET.3 /usr/share/man/man3/wcstok.3 /usr/share/man/man5/n=
uma_maps.5 /usr/share/man/man3/pvalloc.3 /usr/share/man/man3/fgetws.3 /usr/=
share/man/man3/optind.3 /usr/share/man/man3/getgrgid_r.3 /usr/share/man/man=
3/CPU_XOR.3 /usr/share/man/man3/envz_merge.3 /usr/share/man/man2/getcontext=
.2 /usr/share/man/man3/logl.3 /usr/share/man/man5/hosts.5 /usr/share/man/ma=
n3/unlocked_stdio.3 /usr/share/man/man3/tanhf.3 /usr/share/man/man3/strndup=
.3 /usr/share/man/man3/timelocal.3 /usr/share/man/man3/le32toh.3 /usr/share=
/man/man3/mq_unlink.3 /usr/share/man/man3/mkostemp.3 /usr/share/man/man3/gs=
ignal.3 /usr/share/man/man3/cfsetspeed.3 /usr/share/man/man3/getttyent.3 /u=
sr/share/man/man2/setcontext.2 /usr/share/man/man3/fgetws_unlocked.3 /usr/s=
hare/man/man3/getutid.3 /usr/share/man/man2/outsb.2 /usr/share/man/man3/llr=
oundl.3 /usr/share/man/man3/setvbuf.3 /usr/share/man/man3/aio_init.3 /usr/s=
hare/man/man3/vsyslog.3 /usr/share/man/man3/srand48_r.3 /usr/share/man/man3=
/aligned_alloc.3 /usr/share/man/man3/lldiv.3 /usr/share/man/man4/msr.4 /usr=
/share/man/man2/setegid.2 /usr/share/man/man2/open.2 /usr/share/man/man3/tc=
drain.3 /usr/share/man/man3/erfcf.3 /usr/share/man/man3/getttynam.3 /usr/sh=
are/man/man3/fputc_unlocked.3 /usr/share/man/man2/ptrace.2 /usr/share/man/m=
an3/fputwc.3 /usr/share/man/man3/snprintf.3 /usr/share/man/man3/ungetc.3 /u=
sr/share/man/man3/pthread_attr_setstackaddr.3 /usr/share/man/man2/putpmsg.2=
 /usr/share/man/man7/latin6.7 /usr/share/man/man3/wcstoimax.3 /usr/share/ma=
n/man3/queue.3 /usr/share/man/man3/nanl.3 /usr/share/man/man3/clnt_create.3=
 /usr/share/man/man2/fchmod.2 /usr/share/man/man3/putwc.3 /usr/share/man/ma=
n5/services.5 /usr/share/man/man3/swab.3 /usr/share/man/man8/sync.8 /usr/sh=
are/man/man3/copysign.3 /usr/share/man/man3/__malloc_hook.3 /usr/share/man/=
man3/realloc.3 /usr/share/man/man3/xdr_u_long.3 /usr/share/man/man3/matherr=
.3 /usr/share/man/man2/_newselect.2 /usr/share/man/man3/wcsncasecmp.3 /usr/=
share/man/man3/pthread_cleanup_pop_restore_np.3 /usr/share/man/man3/getload=
avg.3 /usr/share/man/man2/setfsuid32.2 /usr/share/man/man3/setprotoent.3 /u=
sr/share/man/man3/innetgr.3 /usr/share/man/man3/memrchr.3 /usr/share/man/ma=
n7/latin8.7 /usr/share/man/man7/arp.7 /usr/share/man/man7/urn.7 /usr/share/=
man/man3/fseek.3 /usr/share/man/man3/cfree.3 /usr/share/man/man3/btowc.3 /u=
sr/share/man/man3/cacoshl.3 /usr/share/man/man7/url.7 /usr/share/man/man3/y=
1l.3 /usr/share/man/man3/perror.3 /usr/share/man/man7/iso_8859_9.7 /usr/sha=
re/man/man3/sigorset.3 /usr/share/man/man2/epoll_create1.2 /usr/share/man/m=
an3/cabsl.3 /usr/share/man/man3/getprotoent.3 /usr/share/man/man3/__fpurge.=
3 /usr/share/man/man2/outw_p.2 /usr/share/man/man3/bcopy.3 /usr/share/man/m=
an3/sigsetjmp.3 /usr/share/man/man7/iso_8859_1.7 /usr/share/man/man3/fdopen=
dir.3 /usr/share/man/man2/msgrcv.2 /usr/share/man/man3/res_send.3 /usr/shar=
e/man/man3/gammal.3 /usr/share/man/man7/iso_8859_5.7 /usr/share/man/man3/as=
sert.3 /usr/share/man/man2/intro.2 /usr/share/man/man2/setrlimit.2 /usr/sha=
re/man/man3/pmap_set.3 /usr/share/man/man3/addmntent.3 /usr/share/man/man3/=
siginterrupt.3 /usr/share/man/man2/setup.2 /usr/share/man/man7/iso_8859_7.7=
 /usr/share/man/man3/getcwd.3 /usr/share/man/man4/pts.4 /usr/share/man/man3=
/abort.3 /usr/share/man/man3/strsep.3 /usr/share/man/man3/valloc.3 /usr/sha=
re/man/man3/truncf.3 /usr/share/man/man3/lroundf.3 /usr/share/man/man3/carg=
f.3 /usr/share/man/man3/copysignl.3 /usr/share/man/man3/towupper.3 /usr/sha=
re/man/man2/signalfd.2 /usr/share/man/man2/lock.2 /usr/share/man/man3/cpowf=
.3 /usr/share/man/man3/llroundf.3 /usr/share/man/man3/getgrent.3 /usr/share=
/man/man3/hcreate_r.3 /usr/share/man/man3/xdr.3 /usr/share/man/man3/wcspbrk=
.3 /usr/share/man/man3/envz_get.3 /usr/share/man/man3/putenv.3 /usr/share/m=
an/man3/isxdigit.3 /usr/share/man/man3/fegetexcept.3 /usr/share/man/man3/st=
dio.3 /usr/share/man/man3/sysv_signal.3 /usr/share/man/man2/openat.2 /usr/s=
hare/man/man3/isnormal.3 /usr/share/man/man3/cmsg.3 /usr/share/man/man2/lse=
ek.2 /usr/share/man/man3/lgammal_r.3 /usr/share/man/man3/aio_cancel.3 /usr/=
share/man/man3/clog10f.3 /usr/share/man/man3/fmtmsg.3 /usr/share/man/man3/s=
trcasecmp.3 /usr/share/man/man2/fchown.2 /usr/share/man/man3/nanf.3 /usr/sh=
are/man/man3/j1.3 /usr/share/man/man2/swapon.2 /usr/share/man/man3/unsetenv=
.3 /usr/share/man/man2/readlinkat.2"
packages/i586-poky-linux/man-pages/man-pages: FILELIST: removed all items "=
/usr/share/man/man3/inet_ntop.3 /usr/share/man/man5/passwd.5 /usr/share/man=
/man3/CIRCLEQ_HEAD.3 /usr/share/man/man3/xdr_array.3 /usr/share/man/man2/se=
tregid.2 /usr/share/man/man3/grantpt.3 /usr/share/man/man3/inet_pton.3 /usr=
/share/man/man2/sched_setscheduler.2 /usr/share/man/man3/statvfs.3 /usr/sha=
re/man/man3/signgam.3 /usr/share/man/man3/remquof.3 /usr/share/man/man3/end=
aliasent.3 /usr/share/man/man2/pipe.2 /usr/share/man/man3/fabsl.3 /usr/shar=
e/man/man3/fstatvfs.3 /usr/share/man/man3/ctime_r.3 /usr/share/man/man3/erf=
f.3 /usr/share/man/man5/environ.5 /usr/share/man/man3/bsearch.3 /usr/share/=
man/man2/chdir.2 /usr/share/man/man3/putwc_unlocked.3 /usr/share/man/man3/t=
anl.3 /usr/share/man/man3/regerror.3 /usr/share/man/man3/clnt_spcreateerror=
.3 /usr/share/man/man3/sgetspent.3 /usr/share/man/man3/cacosl.3 /usr/share/=
man/man3/LIST_INSERT_AFTER.3 /usr/share/man/man3/fputs.3 /usr/share/man/man=
2/clock_gettime.2 /usr/share/man/man3/y1f.3 /usr/share/man/man2/ioperm.2 /u=
sr/share/man/man3/isblank.3 /usr/share/man/man3/dprintf.3 /usr/share/man/ma=
n3/pthread_create.3 /usr/share/man/man3/labs.3 /usr/share/man/man3/casin.3 =
/usr/share/man/man3/crealf.3 /usr/share/man/man2/fcntl64.2 /usr/share/man/m=
an3/getopt_long.3 /usr/share/man/man2/vm86.2 /usr/share/man/man2/setsockopt=
.2 /usr/share/man/man2/setresuid.2 /usr/share/man/man3/xdr_rejected_reply.3=
 /usr/share/man/man3/pthread_getaffinity_np.3 /usr/share/man/man3/ecvt_r.3 =
/usr/share/man/man3/error_message_count.3 /usr/share/man/man3/getdelim.3 /u=
sr/share/man/man3/lcong48_r.3 /usr/share/man/man3/wordexp.3 /usr/share/man/=
man3/TAILQ_REMOVE.3 /usr/share/man/man7/pthreads.7 /usr/share/man/man3/lgam=
ma_r.3 /usr/share/man/man3/getrpcbyname_r.3 /usr/share/man/man3/xdr_u_short=
.3 /usr/share/man/man8/ld-linux.8 /usr/share/man/man2/flock.2 /usr/share/ma=
n/man2/spu_run.2 /usr/share/man/man3/iruserok.3 /usr/share/man/man2/fremove=
xattr.2 /usr/share/man/man3/wcswidth.3 /usr/share/man/man3/htobe16.3 /usr/s=
hare/man/man3/xdr_pmaplist.3 /usr/share/man/man3/truncl.3 /usr/share/man/ma=
n3/lroundl.3 /usr/share/man/man3/setrpcent.3 /usr/share/man/man3/CPU_ISSET.=
3 /usr/share/man/man3/conjf.3 /usr/share/man/man3/execv.3 /usr/share/man/ma=
n3/stderr.3 /usr/share/man/man3/clnt_pcreateerror.3 /usr/share/man/man3/str=
tok_r.3 /usr/share/man/man3/INFINITY.3 /usr/share/man/man3/strncat.3 /usr/s=
hare/man/man3/strtok.3 /usr/share/man/man2/sendfile64.2 /usr/share/man/man7=
/signal.7 /usr/share/man/man3/getprotobyname.3 /usr/share/man/man3/getnetgr=
ent_r.3 /usr/share/man/man2/setgroups32.2 /usr/share/man/man4/sk98lin.4 /us=
r/share/man/man3/pthread_cleanup_pop.3 /usr/share/man/man3/ptsname_r.3 /usr=
/share/man/man3/LIST_ENTRY.3 /usr/share/man/man3/strcmp.3 /usr/share/man/ma=
n2/vhangup.2 /usr/share/man/man7/tcp.7 /usr/share/man/man2/getppid.2 /usr/s=
hare/man/man3/__setfpucw.3 /usr/share/man/man3/mq_setattr.3 /usr/share/man/=
man3/j1l.3 /usr/share/man/man3/ether_aton_r.3 /usr/share/man/man3/xdr_setpo=
s.3 /usr/share/man/man3/fputwc_unlocked.3 /usr/share/man/man3/pthread_clean=
up_push.3 /usr/share/man/man3/pmap_rmtcall.3 /usr/share/man/man2/mlock.2 /u=
sr/share/man/man2/madvise.2 /usr/share/man/man3/ecvt.3 /usr/share/man/man3/=
rtnetlink.3 /usr/share/man/man3/resolver.3 /usr/share/man/man7/iso_8859-9.7=
 /usr/share/man/man3/isnanf.3 /usr/share/man/man3/asctime.3 /usr/share/man/=
man2/sysinfo.2 /usr/share/man/man3/iswlower.3 /usr/share/man/man3/gai_cance=
l.3 /usr/share/man/man2/ipc.2 /usr/share/man/man3/fmodf.3 /usr/share/man/ma=
n3/shm_unlink.3 /usr/share/man/man3/llround.3 /usr/share/man/man2/unlinkat.=
2 /usr/share/man/man3/fgetgrent.3 /usr/share/man/man2/inb.2 /usr/share/man/=
man2/__clone2.2 /usr/share/man/man3/fmodl.3 /usr/share/man/man3/res_querydo=
main.3 /usr/share/man/man3/qgcvt.3 /usr/share/man/man3/dremf.3 /usr/share/m=
an/man3/ccoshl.3 /usr/share/man/man3/sinh.3 /usr/share/man/man3/xdr_free.3 =
/usr/share/man/man3/getdate_r.3 /usr/share/man/man8/ldconfig.8 /usr/share/m=
an/man7/iso_8859_15.7 /usr/share/man/man3/ftrylockfile.3 /usr/share/man/man=
3/sigpause.3 /usr/share/man/man2/security.2 /usr/share/man/man3/mbsrtowcs.3=
 /usr/share/man/man3/lrintl.3 /usr/share/man/man3/strerror.3 /usr/share/man=
/man3/ccosf.3 /usr/share/man/man2/close.2 /usr/share/man/man4/hd.4 /usr/sha=
re/man/man3/logbf.3 /usr/share/man/man2/gethostid.2 /usr/share/man/man3/get=
rpcbynumber.3 /usr/share/man/man3/xdr_int.3 /usr/share/man/man2/inl.2 /usr/=
share/man/man3/gets.3 /usr/share/man/man3/des_crypt.3 /usr/share/man/man3/a=
io_read.3 /usr/share/man/man3/warn.3 /usr/share/man/man2/setregid32.2 /usr/=
share/man/man3/TAILQ_HEAD.3 /usr/share/man/man3/ilogbl.3 /usr/share/man/man=
2/setns.2 /usr/share/man/man2/syncfs.2 /usr/share/man/man3/gethostbyname2_r=
.3 /usr/share/man/man2/syscalls.2 /usr/share/man/man3/feraiseexcept.3 /usr/=
share/man/man3/acoshl.3 /usr/share/man/man3/exp10.3 /usr/share/man/man2/con=
nect.2 /usr/share/man/man3/eventfd_write.3 /usr/share/man/man3/tgammaf.3 /u=
sr/share/man/man3/fedisableexcept.3 /usr/share/man/man3/endhostent.3 /usr/s=
hare/man/man3/wmemset.3 /usr/share/man/man3/wcsncpy.3 /usr/share/man/man2/e=
poll_pwait.2 /usr/share/man/man3/setkey_r.3 /usr/share/man/man3/sysconf.3 /=
usr/share/man/man3/expf.3 /usr/share/man/man3/pthread_attr_setinheritsched.=
3 /usr/share/man/man2/dup3.2 /usr/share/man/man7/iso_8859_2.7 /usr/share/ma=
n/man3/strfry.3 /usr/share/man/man3/nexttowardl.3 /usr/share/man/man2/recvf=
rom.2 /usr/share/man/man7/pipe.7 /usr/share/man/man2/vserver.2 /usr/share/m=
an/man3/asinhf.3 /usr/share/man/man3/CPU_ISSET_S.3 /usr/share/man/man7/rtld=
-audit.7 /usr/share/man/man7/udp.7 /usr/share/man/man2/accept4.2 /usr/share=
/man/man3/fminl.3 /usr/share/man/man3/FD_ZERO.3 /usr/share/man/man4/port.4 =
/usr/share/man/man2/link.2 /usr/share/man/man3/sigrelse.3 /usr/share/man/ma=
n3/fts_set.3 /usr/share/man/man2/fsetxattr.2 /usr/share/man/man2/utimes.2 /=
usr/share/man/man3/stdio_ext.3 /usr/share/man/man7/units.7 /usr/share/man/m=
an3/key_encryptsession.3 /usr/share/man/man2/chroot.2 /usr/share/man/man7/i=
so_8859-5.7 /usr/share/man/man3/wctob.3 /usr/share/man/man2/tgkill.2 /usr/s=
hare/man/man3/undocumented.3 /usr/share/man/man3/pthread_setconcurrency.3 /=
usr/share/man/man3/iswpunct.3 /usr/share/man/man2/migrate_pages.2 /usr/shar=
e/man/man3/logbl.3 /usr/share/man/man2/timer_delete.2 /usr/share/man/man3/r=
es_mkquery.3 /usr/share/man/man7/iso_8859-1.7 /usr/share/man/man7/udplite.7=
 /usr/share/man/man3/inet_makeaddr.3 /usr/share/man/man8/zic.8 /usr/share/m=
an/man3/wcstombs.3 /usr/share/man/man3/difftime.3 /usr/share/man/man7/stand=
ards.7 /usr/share/man/man2/epoll_wait.2 /usr/share/man/man3/wcsncmp.3 /usr/=
share/man/man3/re_comp.3 /usr/share/man/man3/gethostbyname_r.3 /usr/share/m=
an/man7/latin1.7 /usr/share/man/man3/sem_unlink.3 /usr/share/man/man2/semop=
.2 /usr/share/man/man7/latin3.7 /usr/share/man/man2/fchdir.2 /usr/share/man=
/man3/clnttcp_create.3 /usr/share/man/man3/remainderf.3 /usr/share/man/man2=
/io_getevents.2 /usr/share/man/man3/closelog.3 /usr/share/man/man3/frexpl.3=
 /usr/share/man/man7/aio.7 /usr/share/man/man2/getresuid.2 /usr/share/man/m=
an3/fputws_unlocked.3 /usr/share/man/man3/longjmp.3 /usr/share/man/man3/vsp=
rintf.3 /usr/share/man/man2/dup.2 /usr/share/man/man3/siggetmask.3 /usr/sha=
re/man/man3/rawmemchr.3 /usr/share/man/man3/setttyent.3 /usr/share/man/man3=
/lutimes.3 /usr/share/man/man5/issue.5 /usr/share/man/man3/strverscmp.3 /us=
r/share/man/man3/cproj.3 /usr/share/man/man3/CPU_CLR_S.3 /usr/share/man/man=
3/mq_send.3 /usr/share/man/man3/getpass.3 /usr/share/man/man7/mailaddr.7 /u=
sr/share/man/man2/fstatat64.2 /usr/share/man/man2/getcpu.2 /usr/share/man/m=
an3/get_myaddress.3 /usr/share/man/man3/argz.3 /usr/share/man/man5/protocol=
s.5 /usr/share/man/man2/fstat64.2 /usr/share/man/man2/prlimit.2 /usr/share/=
man/man3/usleep.3 /usr/share/man/man2/setpriority.2 /usr/share/man/man3/fma=
x.3 /usr/share/man/man3/etext.3 /usr/share/man/man3/endspent.3 /usr/share/m=
an/man3/isprint.3 /usr/share/man/man3/remque.3 /usr/share/man/man3/lrintf.3=
 /usr/share/man/man5/wtmp.5 /usr/share/man/man3/strnlen.3 /usr/share/man/ma=
n3/isinf.3 /usr/share/man/man3/TAILQ_INIT.3 /usr/share/man/man3/scandir.3 /=
usr/share/man/man3/wordfree.3 /usr/share/man/man2/setresuid32.2 /usr/share/=
man/man3/isnan.3 /usr/share/man/man2/lsetxattr.2 /usr/share/man/man3/gethos=
tbyname.3 /usr/share/man/man3/lgammaf_r.3 /usr/share/man/man3/setutent.3 /u=
sr/share/man/man3/ilogb.3 /usr/share/man/man2/signalfd4.2 /usr/share/man/ma=
n2/keyctl.2 /usr/share/man/man3/wmemmove.3 /usr/share/man/man2/eventfd.2 /u=
sr/share/man/man3/byteorder.3 /usr/share/man/man2/vm86old.2 /usr/share/man/=
man3/fminf.3 /usr/share/man/man3/fopencookie.3 /usr/share/man/man3/endserve=
nt.3 /usr/share/man/man3/CPU_EQUAL.3 /usr/share/man/man3/htole64.3 /usr/sha=
re/man/man2/olduname.2 /usr/share/man/man3/fread.3 /usr/share/man/man3/pthr=
ead_attr_getguardsize.3 /usr/share/man/man3/catanf.3 /usr/share/man/man3/ge=
thostent_r.3 /usr/share/man/man3/lseek64.3 /usr/share/man/man3/rewind.3 /us=
r/share/man/man3/clnt_sperrno.3 /usr/share/man/man2/geteuid.2 /usr/share/ma=
n/man3/remove.3 /usr/share/man/man2/set_mempolicy.2 /usr/share/man/man2/shu=
tdown.2 /usr/share/man/man3/svc_getargs.3 /usr/share/man/man3/regcomp.3 /us=
r/share/man/man3/svcerr_weakauth.3 /usr/share/man/man3/fgets.3 /usr/share/m=
an/man3/carg.3 /usr/share/man/man2/oldfstat.2 /usr/share/man/man7/boot.7 /u=
sr/share/man/man2/mmap.2 /usr/share/man/man3/rindex.3 /usr/share/man/man2/r=
t_sigtimedwait.2 /usr/share/man/man2/writev.2 /usr/share/man/man2/mmap2.2 /=
usr/share/man/man3/setnetgrent.3 /usr/share/man/man2/getcwd.2 /usr/share/ma=
n/man3/svcudp_create.3 /usr/share/man/man4/ram.4 /usr/share/man/man2/setfsg=
id32.2 /usr/share/man/man3/pow10f.3 /usr/share/man/man3/execvpe.3 /usr/shar=
e/man/man3/tcflow.3 /usr/share/man/man3/malloc_trim.3 /usr/share/man/man3/a=
sinl.3 /usr/share/man/man3/strlen.3 /usr/share/man/man2/arm_fadvise.2 /usr/=
share/man/man2/utimensat.2 /usr/share/man/man3/coshf.3 /usr/share/man/man3/=
argz_insert.3 /usr/share/man/man3/fgetpwent_r.3 /usr/share/man/man3/xdr_uni=
on.3 /usr/share/man/man3/iswprint.3 /usr/share/man/man3/psiginfo.3 /usr/sha=
re/man/man3/pthread_cleanup_push_defer_np.3 /usr/share/man/man3/strchrnul.3=
 /usr/share/man/man3/log10l.3 /usr/share/man/man3/feupdateenv.3 /usr/share/=
man/man3/aio_suspend.3 /usr/share/man/man3/drand48.3 /usr/share/man/man3/st=
rndupa.3 /usr/share/man/man3/xdrmem_create.3 /usr/share/man/man3/asinh.3 /u=
sr/share/man/man3/swprintf.3 /usr/share/man/man2/setpgrp.2 /usr/share/man/m=
an2/getresgid.2 /usr/share/man/man3/iswctype.3 /usr/share/man/man3/putc_unl=
ocked.3 /usr/share/man/man2/getdents.2 /usr/share/man/man3/res_search.3 /us=
r/share/man/man3/inet_network.3 /usr/share/man/man3/mallinfo.3 /usr/share/m=
an/man5/ttytype.5 /usr/share/man/man7/netdevice.7 /usr/share/man/man2/pause=
.2 /usr/share/man/man4/console.4 /usr/share/man/man3/sem_getvalue.3 /usr/sh=
are/man/man3/bstring.3 /usr/share/man/man3/svc_getreq.3 /usr/share/man/man3=
/exp10f.3 /usr/share/man/man3/pthread_attr_getstack.3 /usr/share/man/man3/l=
e16toh.3 /usr/share/man/man3/fcvt.3 /usr/share/man/man3/mtrace.3 /usr/share=
/man/man5/proc.5 /usr/share/man/man3/svctcp_create.3 /usr/share/man/man2/se=
tdomainname.2 /usr/share/man/man3/ulimit.3 /usr/share/man/man3/lockf.3 /usr=
/share/man/man3/stpncpy.3 /usr/share/man/man3/pthread_exit.3 /usr/share/man=
/man2/getresuid32.2 /usr/share/man/man3/tmpfile.3 /usr/share/man/man3/setbu=
ffer.3 /usr/share/man/man3/getmntent_r.3 /usr/share/man/man3/sigvec.3 /usr/=
share/man/man3/tdelete.3 /usr/share/man/man7/mdoc.samples.7 /usr/share/man/=
man3/strcasestr.3 /usr/share/man/man3/iswalpha.3 /usr/share/man/man3/malloc=
_get_state.3 /usr/share/man/man4/initrd.4 /usr/share/man/man3/fegetround.3 =
/usr/share/man/man3/verr.3 /usr/share/man/man3/pthread_attr_getinheritsched=
.3 /usr/share/man/man3/sigmask.3 /usr/share/man/man3/db.3 /usr/share/man/ma=
n3/fmin.3 /usr/share/man/man3/FD_ISSET.3 /usr/share/man/man2/mbind.2 /usr/s=
hare/man/man2/ugetrlimit.2 /usr/share/man/man3/warnx.3 /usr/share/man/man3/=
vwprintf.3 /usr/share/man/man3/iconv_open.3 /usr/share/man/man3/strtoll.3 /=
usr/share/man/man3/atanhl.3 /usr/share/man/man3/strptime.3 /usr/share/man/m=
an3/svc_sendreply.3 /usr/share/man/man4/epoll.4 /usr/share/man/man3/tcgetpg=
rp.3 /usr/share/man/man2/alloc_hugepages.2 /usr/share/man/man3/posix_falloc=
ate.3 /usr/share/man/man1/ldd.1 /usr/share/man/man2/socket.2 /usr/share/man=
/man3/clearerr_unlocked.3 /usr/share/man/man3/wctrans.3 /usr/share/man/man3=
/wcwidth.3 /usr/share/man/man2/splice.2 /usr/share/man/man2/mq_timedsend.2 =
/usr/share/man/man3/argz_create_sep.3 /usr/share/man/man3/asinf.3 /usr/shar=
e/man/man3/fts_children.3 /usr/share/man/man2/rt_sigreturn.2 /usr/share/man=
/man3/getrpcent.3 /usr/share/man/man3/svcraw_create.3 /usr/share/man/man7/m=
ath_error.7 /usr/share/man/man3/argz_extract.3 /usr/share/man/man3/backtrac=
e_symbols_fd.3 /usr/share/man/man3/gnu_get_libc_release.3 /usr/share/man/ma=
n3/endttyent.3 /usr/share/man/man3/futimens.3 /usr/share/man/man3/initgroup=
s.3 /usr/share/man/man3/ceill.3 /usr/share/man/man2/arm_fadvise64_64.2 /usr=
/share/man/man3/puts.3 /usr/share/man/man2/pciconfig_iobase.2 /usr/share/ma=
n/man3/TAILQ_INSERT_HEAD.3 /usr/share/man/man3/casinh.3 /usr/share/man/man2=
/shmctl.2 /usr/share/man/man4/mouse.4 /usr/share/man/man3/CPU_AND_S.3 /usr/=
share/man/man3/sigwait.3 /usr/share/man/man3/envz_entry.3 /usr/share/man/ma=
n3/fdiml.3 /usr/share/man/man3/cbrtl.3 /usr/share/man/man3/fputws.3 /usr/sh=
are/man/man3/mcheck_check_all.3 /usr/share/man/man3/lgammal.3 /usr/share/ma=
n/man2/mkdir.2 /usr/share/man/man2/kexec_load.2 /usr/share/man/man3/strcoll=
.3 /usr/share/man/man3/dysize.3 /usr/share/man/man3/isdigit.3 /usr/share/ma=
n/man3/assert_perror.3 /usr/share/man/man3/termios.3 /usr/share/man/man5/ut=
mpx.5 /usr/share/man/man3/xdr_float.3 /usr/share/man/man2/request_key.2 /us=
r/share/man/man3/pthread_attr_setdetachstate.3 /usr/share/man/man2/set_robu=
st_list.2 /usr/share/man/man3/islessgreater.3 /usr/share/man/man2/clock_get=
res.2 /usr/share/man/man2/execve.2 /usr/share/man/man3/mkstemp.3 /usr/share=
/man/man2/getpmsg.2 /usr/share/man/man3/getpwnam_r.3 /usr/share/man/man3/at=
oll.3 /usr/share/man/man7/locale.7 /usr/share/man/man3/be64toh.3 /usr/share=
/man/man3/gammaf.3 /usr/share/man/man3/sincosf.3 /usr/share/man/man3/clock_=
getres.3 /usr/share/man/man5/utmp.5 /usr/share/man/man3/ferror_unlocked.3 /=
usr/share/man/man3/malloc_stats.3 /usr/share/man/man2/signal.2 /usr/share/m=
an/man3/btree.3 /usr/share/man/man2/setitimer.2 /usr/share/man/man3/hsearch=
.3 /usr/share/man/man3/xdr_string.3 /usr/share/man/man3/strtol.3 /usr/share=
/man/man2/setfsuid.2 /usr/share/man/man3/pthread_setaffinity_np.3 /usr/shar=
e/man/man3/pthread_yield.3 /usr/share/man/man3/vdprintf.3 /usr/share/man/ma=
n3/wcpcpy.3 /usr/share/man/man3/CPU_OR_S.3 /usr/share/man/man3/vfwprintf.3 =
/usr/share/man/man3/CMSG_NXTHDR.3 /usr/share/man/man2/sbrk.2 /usr/share/man=
/man2/lookup_dcookie.2 /usr/share/man/man3/xdr_enum.3 /usr/share/man/man3/s=
trtoull.3 /usr/share/man/man2/pselect6.2 /usr/share/man/man3/isfinite.3 /us=
r/share/man/man2/fstatat.2 /usr/share/man/man2/msgget.2 /usr/share/man/man5=
/group.5 /usr/share/man/man3/dlvsym.3 /usr/share/man/man3/cpowl.3 /usr/shar=
e/man/man2/capget.2 /usr/share/man/man3/llabs.3 /usr/share/man/man3/mblen.3=
 /usr/share/man/man3/pthread_getconcurrency.3 /usr/share/man/man2/pipe2.2 /=
usr/share/man/man7/iso-8859-5.7 /usr/share/man/man7/complex.7 /usr/share/ma=
n/man3/wcsncat.3 /usr/share/man/man3/CPU_CLR.3 /usr/share/man/man3/ffsl.3 /=
usr/share/man/man3/pthread_setschedprio.3 /usr/share/man/man7/iso-8859-1.7 =
/usr/share/man/man2/sigqueue.2 /usr/share/man/man7/iso_8859-16.7 /usr/share=
/man/man3/endutxent.3 /usr/share/man/man7/glibc.7 /usr/share/man/man3/timer=
cmp.3 /usr/share/man/man3/fwrite_unlocked.3 /usr/share/man/man3/endrpcent.3=
 /usr/share/man/man3/des_setparity.3 /usr/share/man/man2/getsid.2 /usr/shar=
e/man/man3/strftime.3 /usr/share/man/man3/xdr_pmap.3 /usr/share/man/man3/po=
six_memalign.3 /usr/share/man/man3/vfprintf.3 /usr/share/man/man3/cacoshf.3=
 /usr/share/man/man3/xdrrec_create.3 /usr/share/man/man3/backtrace_symbols.=
3 /usr/share/man/man2/sched_setaffinity.2 /usr/share/man/man3/pow10l.3 /usr=
/share/man/man3/error.3 /usr/share/man/man2/recvmsg.2 /usr/share/man/man3/s=
incosl.3 /usr/share/man/man2/read.2 /usr/share/man/man3/pmap_unset.3 /usr/s=
hare/man/man2/dup2.2 /usr/share/man/man3/timerisset.3 /usr/share/man/man2/r=
ecv.2 /usr/share/man/man3/mpool.3 /usr/share/man/man3/exp2.3 /usr/share/man=
/man3/feclearexcept.3 /usr/share/man/man3/nan.3 /usr/share/man/man7/utf8.7 =
/usr/share/man/man3/argz_replace.3 /usr/share/man/man3/sigstack.3 /usr/shar=
e/man/man3/log.3 /usr/share/man/man3/fetestexcept.3 /usr/share/man/man3/set=
state_r.3 /usr/share/man/man7/bootparam.7 /usr/share/man/man2/idle.2 /usr/s=
hare/man/man5/intro.5 /usr/share/man/man3/exp2f.3 /usr/share/man/man3/l64a.=
3 /usr/share/man/man3/strspn.3 /usr/share/man/man2/setreuid32.2 /usr/share/=
man/man3/pthread_setcancelstate.3 /usr/share/man/man3/getgrnam.3 /usr/share=
/man/man3/tcgetsid.3 /usr/share/man/man2/stat64.2 /usr/share/man/man3/errno=
.3 /usr/share/man/man3/cargl.3 /usr/share/man/man3/copysignf.3 /usr/share/m=
an/man3/sinhl.3 /usr/share/man/man5/complex.5 /usr/share/man/man3/open_mems=
tream.3 /usr/share/man/man3/vsnprintf.3 /usr/share/man/man5/termcap.5 /usr/=
share/man/man3/execlp.3 /usr/share/man/man3/remquol.3 /usr/share/man/man3/x=
decrypt.3 /usr/share/man/man3/ether_ntohost.3 /usr/share/man/man3/fabs.3 /u=
sr/share/man/man3/nextafterf.3 /usr/share/man/man3/major.3 /usr/share/man/m=
an3/eventfd_read.3 /usr/share/man/man3/tcsetattr.3 /usr/share/man/man3/sem_=
init.3 /usr/share/man/man3/ecb_crypt.3 /usr/share/man/man3/svc_run.3 /usr/s=
hare/man/man3/pthread_testcancel.3 /usr/share/man/man3/htons.3 /usr/share/m=
an/man3/fputc.3 /usr/share/man/man3/tempnam.3 /usr/share/man/man3/getifaddr=
s.3 /usr/share/man/man3/csinl.3 /usr/share/man/man2/cacheflush.2 /usr/share=
/man/man3/clnt_perror.3 /usr/share/man/man3/clog10l.3 /usr/share/man/man3/w=
cschr.3 /usr/share/man/man3/endpwent.3 /usr/share/man/man3/mbsinit.3 /usr/s=
hare/man/man3/xdr_inline.3 /usr/share/man/man3/utmpxname.3 /usr/share/man/m=
an3/erfl.3 /usr/share/man/man3/strdupa.3 /usr/share/man/man3/logwtmp.3 /usr=
/share/man/man3/xdr_vector.3 /usr/share/man/man3/fputs_unlocked.3 /usr/shar=
e/man/man3/muntrace.3 /usr/share/man/man2/settimeofday.2 /usr/share/man/man=
7/futex.7 /usr/share/man/man3/printf.3 /usr/share/man/man2/fstat.2 /usr/sha=
re/man/man2/wait4.2 /usr/share/man/man3/atan2f.3 /usr/share/man/man2/outl.2=
 /usr/share/man/man3/freeifaddrs.3 /usr/share/man/man3/srandom.3 /usr/share=
/man/man2/listen.2 /usr/share/man/man3/islower.3 /usr/share/man/man3/optopt=
.3 /usr/share/man/man3/mq_receive.3 /usr/share/man/man2/semget.2 /usr/share=
/man/man3/sin.3 /usr/share/man/man3/tanf.3 /usr/share/man/man3/sethostid.3 =
/usr/share/man/man3/fgetspent.3 /usr/share/man/man5/fs.5 /usr/share/man/man=
3/srand.3 /usr/share/man/man3/ttyslot.3 /usr/share/man/man3/putc.3 /usr/sha=
re/man/man2/outb.2 /usr/share/man/man4/random.4 /usr/share/man/man3/sinhf.3=
 /usr/share/man/man3/significand.3 /usr/share/man/man2/msgop.2 /usr/share/m=
an/man2/io_submit.2 /usr/share/man/man3/tzname.3 /usr/share/man/man3/qsort.=
3 /usr/share/man/man2/_Exit.2 /usr/share/man/man3/creall.3 /usr/share/man/m=
an3/wcpncpy.3 /usr/share/man/man3/strtold.3 /usr/share/man/man3/strerror_r.=
3 /usr/share/man/man2/setsid.2 /usr/share/man/man2/send.2 /usr/share/man/ma=
n3/htobe32.3 /usr/share/man/man2/outsw.2 /usr/share/man/man2/get_robust_lis=
t.2 /usr/share/man/man2/afs_syscall.2 /usr/share/man/man3/atof.3 /usr/share=
/man/man3/mktime.3 /usr/share/man/man2/socketcall.2 /usr/share/man/man3/pos=
ix_openpt.3 /usr/share/man/man2/getpid.2 /usr/share/man/man3/CPU_COUNT_S.3 =
/usr/share/man/man3/ftello.3 /usr/share/man/man3/tgamma.3 /usr/share/man/ma=
n3/alloca.3 /usr/share/man/man3/getaddrinfo_a.3 /usr/share/man/man3/sem_tim=
edwait.3 /usr/share/man/man3/atan2l.3 /usr/share/man/man3/clock_settime.3 /=
usr/share/man/man3/pthread_attr_setschedparam.3 /usr/share/man/man2/rt_sigp=
rocmask.2 /usr/share/man/man3/dreml.3 /usr/share/man/man3/argz_next.3 /usr/=
share/man/man3/vsscanf.3 /usr/share/man/man3/sigblock.3 /usr/share/man/man3=
/argz_delete.3 /usr/share/man/man3/mbtowc.3 /usr/share/man/man2/sendfile.2 =
/usr/share/man/man3/CPU_ZERO_S.3 /usr/share/man/man3/log2f.3 /usr/share/man=
/man3/fdim.3 /usr/share/man/man3/setlinebuf.3 /usr/share/man/man3/scandirat=
.3 /usr/share/man/man3/initstate_r.3 /usr/share/man/man3/crypt.3 /usr/share=
/man/man3/calloc.3 /usr/share/man/man3/mallopt.3 /usr/share/man/man2/prctl.=
2 /usr/share/man/man3/fgetspent_r.3 /usr/share/man/man3/registerrpc.3 /usr/=
share/man/man3/memmove.3 /usr/share/man/man3/putw.3 /usr/share/man/man3/exe=
cl.3 /usr/share/man/man2/readdir.2 /usr/share/man/man3/isalnum.3 /usr/share=
/man/man3/getnetbyaddr.3 /usr/share/man/man3/getutid_r.3 /usr/share/man/man=
3/cacos.3 /usr/share/man/man3/getwc.3 /usr/share/man/man3/iswcntrl.3 /usr/s=
hare/man/man2/wait3.2 /usr/share/man/man3/nrand48.3 /usr/share/man/man3/cat=
open.3 /usr/share/man/man3/getc.3 /usr/share/man/man3/ldexpf.3 /usr/share/m=
an/man3/xdrrec_endofrecord.3 /usr/share/man/man3/inet_addr.3 /usr/share/man=
/man3/getnetbyname.3 /usr/share/man/man3/cerfc.3 /usr/share/man/man3/getrpc=
byname.3 /usr/share/man/man7/shm_overview.7 /usr/share/man/man3/ether_hostt=
on.3 /usr/share/man/man3/pthread_attr_setstacksize.3 /usr/share/man/man2/sg=
etmask.2 /usr/share/man/man3/fdimf.3 /usr/share/man/man3/setpwent.3 /usr/sh=
are/man/man3/iswblank.3 /usr/share/man/man3/towctrans.3 /usr/share/man/man2=
/create_module.2 /usr/share/man/man3/strcpy.3 /usr/share/man/man3/dl_iterat=
e_phdr.3 /usr/share/man/man3/round.3 /usr/share/man/man2/waitid.2 /usr/shar=
e/man/man3/localeconv.3 /usr/share/man/man2/pwritev.2 /usr/share/man/man3/a=
coshf.3 /usr/share/man/man3/sinl.3 /usr/share/man/man3/cerf.3 /usr/share/ma=
n/man7/latin5.7 /usr/share/man/man2/semtimedop.2 /usr/share/man/man2/mpx.2 =
/usr/share/man/man7/credentials.7 /usr/share/man/man2/sysfs.2 /usr/share/ma=
n/man3/ccoshf.3 /usr/share/man/man2/arm_sync_file_range.2 /usr/share/man/ma=
n3/getutline_r.3 /usr/share/man/man3/execle.3 /usr/share/man/man4/hpsa.4 /u=
sr/share/man/man3/getservent.3 /usr/share/man/man3/frexp.3 /usr/share/man/m=
an3/rtime.3 /usr/share/man/man3/nearbyint.3 /usr/share/man/man2/gtty.2 /usr=
/share/man/man3/openlog.3 /usr/share/man/man3/tgammal.3 /usr/share/man/man2=
/setgroups.2 /usr/share/man/man2/rt_sigsuspend.2 /usr/share/man/man2/exit.2=
 /usr/share/man/man7/latin7.7 /usr/share/man/man3/ffs.3 /usr/share/man/man3=
/CIRCLEQ_INSERT_HEAD.3 /usr/share/man/man3/get_nprocs.3 /usr/share/man/man3=
/getw.3 /usr/share/man/man3/program_invocation_name.3 /usr/share/man/man3/t=
destroy.3 /usr/share/man/man3/expl.3 /usr/share/man/man7/latin9.7 /usr/shar=
e/man/man5/hosts.equiv.5 /usr/share/man/man3/ruserok_af.3 /usr/share/man/ma=
n3/pthread_attr_setaffinity_np.3 /usr/share/man/man3/llrintl.3 /usr/share/m=
an/man7/posixoptions.7 /usr/share/man/man3/svc_register.3 /usr/share/man/ma=
n7/iso-8859-14.7 /usr/share/man/man3/confstr.3 /usr/share/man/man7/iso_8859=
_8.7 /usr/share/man/man3/finitef.3 /usr/share/man/man3/clearerr.3 /usr/shar=
e/man/man3/putwchar.3 /usr/share/man/man3/sigaddset.3 /usr/share/man/man2/r=
eadahead.2 /usr/share/man/man3/getgrouplist.3 /usr/share/man/man3/rcmd.3 /u=
sr/share/man/man3/isinff.3 /usr/share/man/man2/personality.2 /usr/share/man=
/man3/strsignal.3 /usr/share/man/man3/TAILQ_ENTRY.3 /usr/share/man/man3/env=
z_strip.3 /usr/share/man/man3/encrypt.3 /usr/share/man/man3/HUGE_VALF.3 /us=
r/share/man/man3/siglongjmp.3 /usr/share/man/man3/fesetround.3 /usr/share/m=
an/man2/symlink.2 /usr/share/man/man3/regfree.3 /usr/share/man/man2/linkat.=
2 /usr/share/man/man3/wcsspn.3 /usr/share/man/man7/iso_8859_4.7 /usr/share/=
man/man3/getchar.3 /usr/share/man/man3/malloc.3 /usr/share/man/man3/remquo.=
3 /usr/share/man/man2/wait.2 /usr/share/man/man3/CIRCLEQ_REMOVE.3 /usr/shar=
e/man/man3/ispunct.3 /usr/share/man/man3/fpclassify.3 /usr/share/man/man7/i=
so_8859_6.7 /usr/share/man/man3/wmemcmp.3 /usr/share/man/man3/argz_add_sep.=
3 /usr/share/man/man2/set_thread_area.2 /usr/share/man/man7/armscii-8.7 /us=
r/share/man/man3/iswgraph.3 /usr/share/man/man3/mmap64.3 /usr/share/man/man=
2/getrlimit.2 /usr/share/man/man5/rpc.5 /usr/share/man/man3/modfl.3 /usr/sh=
are/man/man2/msgctl.2 /usr/share/man/man3/div.3 /usr/share/man/man3/sqrtl.3=
 /usr/share/man/man3/ctanhf.3 /usr/share/man/man3/j0f.3 /usr/share/man/man3=
/edata.3 /usr/share/man/man3/lrint.3 /usr/share/man/man3/cerfcl.3 /usr/shar=
e/man/man3/__fwriting.3 /usr/share/man/man3/acosf.3 /usr/share/man/man3/gmt=
ime_r.3 /usr/share/man/man3/gnu_dev_minor.3 /usr/share/man/man2/sched_yield=
.2 /usr/share/man/man3/ptsname.3 /usr/share/man/man3/FD_CLR.3 /usr/share/ma=
n/man3/lrand48_r.3 /usr/share/man/man3/qecvt_r.3 /usr/share/man/man3/ctanhl=
.3 /usr/share/man/man3/cexp2f.3 /usr/share/man/man3/j0l.3 /usr/share/man/ma=
n3/getnetent.3 /usr/share/man/man3/isless.3 /usr/share/man/man3/xdr_opaque.=
3 /usr/share/man/man3/cfsetospeed.3 /usr/share/man/man5/elf.5 /usr/share/ma=
n/man3/atexit.3 /usr/share/man/man2/get_mempolicy.2 /usr/share/man/man3/isi=
nfl.3 /usr/share/man/man2/remap_file_pages.2 /usr/share/man/man3/acosh.3 /u=
sr/share/man/man2/clock_settime.2 /usr/share/man/man7/koi8-r.7 /usr/share/m=
an/man3/getgrent_r.3 /usr/share/man/man3/pthread_sigqueue.3 /usr/share/man/=
man3/svcerr_auth.3 /usr/share/man/man3/isalpha.3 /usr/share/man/man3/memali=
gn.3 /usr/share/man/man3/fwrite.3 /usr/share/man/man3/setservent.3 /usr/sha=
re/man/man3/svcerr_decode.3 /usr/share/man/man7/hier.7 /usr/share/man/man2/=
killpg.2 /usr/share/man/man3/cfgetispeed.3 /usr/share/man/man3/key_secretke=
y_is_set.3 /usr/share/man/man7/rtnetlink.7 /usr/share/man/man3/ynf.3 /usr/s=
hare/man/man1/intro.1 /usr/share/man/man3/vwarn.3 /usr/share/man/man3/iconv=
.3 /usr/share/man/man3/end.3 /usr/share/man/man3/rintl.3 /usr/share/man/man=
3/seed48.3 /usr/share/man/man2/swapoff.2 /usr/share/man/man5/resolver.5 /us=
r/share/man/man3/acosl.3 /usr/share/man/man4/wavelan.4 /usr/share/man/man3/=
sethostent.3 /usr/share/man/man2/path_resolution.2 /usr/share/man/man3/euid=
access.3 /usr/share/man/man3/sqrtf.3 /usr/share/man/man3/hdestroy.3 /usr/sh=
are/man/man3/isspace.3 /usr/share/man/man3/mkfifoat.3 /usr/share/man/man2/s=
etuid.2 /usr/share/man/man2/_syscall.2 /usr/share/man/man3/TAILQ_INSERT_TAI=
L.3 /usr/share/man/man7/suffixes.7 /usr/share/man/man2/symlinkat.2 /usr/sha=
re/man/man2/clock_nanosleep.2 /usr/share/man/man4/cciss.4 /usr/share/man/ma=
n2/sync_file_range2.2 /usr/share/man/man3/lckpwdf.3 /usr/share/man/man3/str=
dup.3 /usr/share/man/man3/asprintf.3 /usr/share/man/man3/getgrgid.3 /usr/sh=
are/man/man2/umount2.2 /usr/share/man/man3/wcsrtombs.3 /usr/share/man/man3/=
erand48_r.3 /usr/share/man/man2/bdflush.2 /usr/share/man/man3/gamma.3 /usr/=
share/man/man2/fchown32.2 /usr/share/man/man3/CPU_COUNT.3 /usr/share/man/ma=
n3/LIST_HEAD.3 /usr/share/man/man3/getprotoent_r.3 /usr/share/man/man3/pthr=
ead_attr_setguardsize.3 /usr/share/man/man5/acct.5 /usr/share/man/man3/casi=
nf.3 /usr/share/man/man7/netlink.7 /usr/share/man/man5/core.5 /usr/share/ma=
n/man3/fscanf.3 /usr/share/man/man4/st.4 /usr/share/man/man3/rexec.3 /usr/s=
hare/man/man3/casinhf.3 /usr/share/man/man3/envz.3 /usr/share/man/man3/pthr=
ead_cancel.3 /usr/share/man/man5/motd.5 /usr/share/man/man3/inet_lnaof.3 /u=
sr/share/man/man3/cexp2l.3 /usr/share/man/man2/times.2 /usr/share/man/man3/=
pthread_setcanceltype.3 /usr/share/man/man3/cbrt.3 /usr/share/man/man3/ferr=
or.3 /usr/share/man/man4/fifo.4 /usr/share/man/man3/wcscasecmp.3 /usr/share=
/man/man3/casinhl.3 /usr/share/man/man2/inw_p.2 /usr/share/man/man3/getipno=
debyname.3 /usr/share/man/man3/fesetexceptflag.3 /usr/share/man/man3/bindre=
svport.3 /usr/share/man/man3/pthread_join.3 /usr/share/man/man3/free.3 /usr=
/share/man/man2/sendmmsg.2 /usr/share/man/man2/setpgid.2 /usr/share/man/man=
7/glob.7 /usr/share/man/man3/fclose.3 /usr/share/man/man3/mbrtowc.3 /usr/sh=
are/man/man2/lstat64.2 /usr/share/man/man3/flockfile.3 /usr/share/man/man3/=
log10f.3 /usr/share/man/man7/iso_8859-8.7 /usr/share/man/man3/getrpcbynumbe=
r_r.3 /usr/share/man/man3/aio_return.3 /usr/share/man/man3/getline.3 /usr/s=
hare/man/man2/sched_get_priority_max.2 /usr/share/man/man2/setgid.2 /usr/sh=
are/man/man3/sscanf.3 /usr/share/man/man5/ftpusers.5 /usr/share/man/man3/si=
gnbit.3 /usr/share/man/man3/string.3 /usr/share/man/man3/rintf.3 /usr/share=
/man/man2/prof.2 /usr/share/man/man3/pthread_detach.3 /usr/share/man/man3/f=
getc_unlocked.3 /usr/share/man/man3/fmod.3 /usr/share/man/man3/toupper.3 /u=
sr/share/man/man2/syscall.2 /usr/share/man/man3/canonicalize_file_name.3 /u=
sr/share/man/man2/write.2 /usr/share/man/man3/getspent.3 /usr/share/man/man=
3/wctype.3 /usr/share/man/man3/strtoul.3 /usr/share/man/man3/sys_errlist.3 =
/usr/share/man/man2/break.2 /usr/share/man/man3/mq_notify.3 /usr/share/man/=
man3/scalbf.3 /usr/share/man/man3/vlimit.3 /usr/share/man/man3/sigqueue.3 /=
usr/share/man/man3/expm1.3 /usr/share/man/man3/tzset.3 /usr/share/man/man2/=
_exit.2 /usr/share/man/man5/nscd.conf.5 /usr/share/man/man3/svc_unregister.=
3 /usr/share/man/man3/mq_timedreceive.3 /usr/share/man/man7/icmp.7 /usr/sha=
re/man/man3/exp10l.3 /usr/share/man/man3/getpwuid_r.3 /usr/share/man/man2/t=
imer_create.2 /usr/share/man/man7/raw.7 /usr/share/man/man2/stat.2 /usr/sha=
re/man/man3/pthread_timedjoin_np.3 /usr/share/man/man3/addseverity.3 /usr/s=
hare/man/man3/getopt.3 /usr/share/man/man3/log1p.3 /usr/share/man/man3/setl=
ogmask.3 /usr/share/man/man3/getutent.3 /usr/share/man/man3/isascii.3 /usr/=
share/man/man3/gcvt.3 /usr/share/man/man2/getuid.2 /usr/share/man/man3/dirf=
d.3 /usr/share/man/man3/csin.3 /usr/share/man/man3/strstr.3 /usr/share/man/=
man2/epoll_ctl.2 /usr/share/man/man2/umount.2 /usr/share/man/man2/iopl.2 /u=
sr/share/man/man3/lrand48.3 /usr/share/man/man3/intro.3 /usr/share/man/man3=
/mkdtemp.3 /usr/share/man/man3/opendir.3 /usr/share/man/man3/pthread_equal.=
3 /usr/share/man/man3/va_arg.3 /usr/share/man/man3/envz_add.3 /usr/share/ma=
n/man2/getxattr.2 /usr/share/man/man3/memchr.3 /usr/share/man/man2/futimesa=
t.2 /usr/share/man/man3/jn.3 /usr/share/man/man3/y1.3 /usr/share/man/man3/s=
igsetops.3 /usr/share/man/man3/CIRCLEQ_INIT.3 /usr/share/man/man2/chown.2 /=
usr/share/man/man4/zero.4 /usr/share/man/man3/LIST_INSERT_HEAD.3 /usr/share=
/man/man7/unicode.7 /usr/share/man/man3/expm1f.3 /usr/share/man/man3/random=
_r.3 /usr/share/man/man3/xdr_u_char.3 /usr/share/man/man2/sigwaitinfo.2 /us=
r/share/man/man3/gnu_dev_major.3 /usr/share/man/man3/key_gendes.3 /usr/shar=
e/man/man3/catan.3 /usr/share/man/man3/svc_getreqset.3 /usr/share/man/man3/=
__fwritable.3 /usr/share/man/man2/inotify_init1.2 /usr/share/man/man3/authu=
nix_create.3 /usr/share/man/man3/cexpl.3 /usr/share/man/man7/iso_8859-6.7 /=
usr/share/man/man3/catanl.3 /usr/share/man/man3/getenv.3 /usr/share/man/man=
3/svcerr_systemerr.3 /usr/share/man/man2/sched_getscheduler.2 /usr/share/ma=
n/man3/toascii.3 /usr/share/man/man3/getfsent.3 /usr/share/man/man3/lcong48=
.3 /usr/share/man/man7/iso_8859-4.7 /usr/share/man/man3/infnan.3 /usr/share=
/man/man3/optarg.3 /usr/share/man/man3/getchar_unlocked.3 /usr/share/man/ma=
n3/ceil.3 /usr/share/man/man3/cexpf.3 /usr/share/man/man3/csinh.3 /usr/shar=
e/man/man3/ftok.3 /usr/share/man/man2/fsync.2 /usr/share/man/man2/inotify_a=
dd_watch.2 /usr/share/man/man2/shmop.2 /usr/share/man/man2/outb_p.2 /usr/sh=
are/man/man3/ctan.3 /usr/share/man/man3/dlerror.3 /usr/share/man/man7/symli=
nk.7 /usr/share/man/man7/latin10.7 /usr/share/man/man2/unshare.2 /usr/share=
/man/man3/LIST_INIT.3 /usr/share/man/man3/__fsetlocking.3 /usr/share/man/ma=
n3/imaxabs.3 /usr/share/man/man3/csinf.3 /usr/share/man/man3/hypotf.3 /usr/=
share/man/man3/casinl.3 /usr/share/man/man2/semctl.2 /usr/share/man/man2/tr=
uncate.2 /usr/share/man/man4/dsp56k.4 /usr/share/man/man7/cpuset.7 /usr/sha=
re/man/man3/funlockfile.3 /usr/share/man/man3/lgammaf.3 /usr/share/man/man3=
/qfcvt_r.3 /usr/share/man/man3/ceilf.3 /usr/share/man/man3/program_invocati=
on_short_name.3 /usr/share/man/man3/getfsfile.3 /usr/share/man/man2/sched_s=
etparam.2 /usr/share/man/man3/mbstowcs.3 /usr/share/man/man2/ioctl_list.2 /=
usr/share/man/man7/charsets.7 /usr/share/man/man3/svcerr_noprog.3 /usr/shar=
e/man/man4/vcs.4 /usr/share/man/man3/pthread_attr_getstackaddr.3 /usr/share=
/man/man2/vmsplice.2 /usr/share/man/man3/finitel.3 /usr/share/man/man2/kill=
.2 /usr/share/man/man2/sched_getaffinity.2 /usr/share/man/man3/getrpcent_r.=
3 /usr/share/man/man3/pthread_attr_setstack.3 /usr/share/man/man3/clock_get=
time.3 /usr/share/man/man3/cuserid.3 /usr/share/man/man3/getusershell.3 /us=
r/share/man/man3/strtod.3 /usr/share/man/man2/epoll_create.2 /usr/share/man=
/man2/outl_p.2 /usr/share/man/man7/ascii.7 /usr/share/man/man3/pututxline.3=
 /usr/share/man/man4/mem.4 /usr/share/man/man4/fd.4 /usr/share/man/man2/set=
resgid32.2 /usr/share/man/man3/clnt_geterr.3 /usr/share/man/man3/HUGE_VALL.=
3 /usr/share/man/man3/clog10.3 /usr/share/man/man3/pclose.3 /usr/share/man/=
man2/sync_file_range.2 /usr/share/man/man3/popen.3 /usr/share/man/man2/getd=
tablesize.2 /usr/share/man/man3/err.3 /usr/share/man/man3/getspent_r.3 /usr=
/share/man/man3/CPU_AND.3 /usr/share/man/man3/csinhl.3 /usr/share/man/man3/=
strtof.3 /usr/share/man/man7/iso-8859-9.7 /usr/share/man/man3/exp2l.3 /usr/=
share/man/man2/umask.2 /usr/share/man/man3/csqrt.3 /usr/share/man/man3/argz=
_count.3 /usr/share/man/man3/daemon.3 /usr/share/man/man3/va_copy.3 /usr/sh=
are/man/man2/rt_sigqueueinfo.2 /usr/share/man/man7/iso-8859-7.7 /usr/share/=
man/man3/NAN.3 /usr/share/man/man3/csinhf.3 /usr/share/man/man3/creal.3 /us=
r/share/man/man3/modf.3 /usr/share/man/man3/xdr_char.3 /usr/share/man/man3/=
wmemcpy.3 /usr/share/man/man3/CIRCLEQ_ENTRY.3 /usr/share/man/man2/fchownat.=
2 /usr/share/man/man3/fexecve.3 /usr/share/man/man3/pthread_attr_getschedpa=
ram.3 /usr/share/man/man3/getopt_long_only.3 /usr/share/man/man2/adjtimex.2=
 /usr/share/man/man2/ustat.2 /usr/share/man/man3/clock_getcpuclockid.3 /usr=
/share/man/man3/index.3 /usr/share/man/man3/rresvport.3 /usr/share/man/man3=
/gethostbyname2.3 /usr/share/man/man7/iso_8859_10.7 /usr/share/man/man3/exp=
m1l.3 /usr/share/man/man7/iso_8859-14.7 /usr/share/man/man2/stime.2 /usr/sh=
are/man/man2/fdatasync.2 /usr/share/man/man2/select_tut.2 /usr/share/man/ma=
n2/ssetmask.2 /usr/share/man/man3/mempcpy.3 /usr/share/man/man7/iso_8859_14=
.7 /usr/share/man/man3/swapcontext.3 /usr/share/man/man3/fflush_unlocked.3 =
/usr/share/man/man3/setgrent.3 /usr/share/man/man7/iso_8859-10.7 /usr/share=
/man/man2/mkdirat.2 /usr/share/man/man2/fstatfs64.2 /usr/share/man/man2/rt_=
tgsigqueueinfo.2 /usr/share/man/man3/CPU_ALLOC.3 /usr/share/man/man3/gai_su=
spend.3 /usr/share/man/man3/fnmatch.3 /usr/share/man/man2/spu_create.2 /usr=
/share/man/man3/mq_getattr.3 /usr/share/man/man2/process_vm_writev.2 /usr/s=
hare/man/man3/minor.3 /usr/share/man/man7/mdoc.7 /usr/share/man/man3/fenv.3=
 /usr/share/man/man2/getdomainname.2 /usr/share/man/man3/wcscspn.3 /usr/sha=
re/man/man3/log10.3 /usr/share/man/man3/encrypt_r.3 /usr/share/man/man2/rem=
ovexattr.2 /usr/share/man/man3/rint.3 /usr/share/man/man3/setkey.3 /usr/sha=
re/man/man3/key_setsecret.3 /usr/share/man/man3/_flushlbf.3 /usr/share/man/=
man3/CIRCLEQ_INSERT_AFTER.3 /usr/share/man/man4/lp.4 /usr/share/man/man7/ko=
i8-u.7 /usr/share/man/man3/roundl.3 /usr/share/man/man7/iso_8859-7.7 /usr/s=
hare/man/man3/clog2f.3 /usr/share/man/man1/getent.1 /usr/share/man/man2/mkn=
od.2 /usr/share/man/man3/setaliasent.3 /usr/share/man/man3/fcloseall.3 /usr=
/share/man/man3/lio_listio.3 /usr/share/man/man3/remainder.3 /usr/share/man=
/man3/sprintf.3 /usr/share/man/man3/fread_unlocked.3 /usr/share/man/man2/io=
ctl.2 /usr/share/man/man3/pthread_attr_getaffinity_np.3 /usr/share/man/man3=
/drem.3 /usr/share/man/man3/sigfillset.3 /usr/share/man/man2/free_hugepages=
.2 /usr/share/man/man7/sigevent.7 /usr/share/man/man3/nextafterl.3 /usr/sha=
re/man/man2/lchown.2 /usr/share/man/man3/pthread_attr_destroy.3 /usr/share/=
man/man3/atol.3 /usr/share/man/man3/lgamma.3 /usr/share/man/man3/qecvt.3 /u=
sr/share/man/man4/null.4 /usr/share/man/man3/va_start.3 /usr/share/man/man3=
/cfgetospeed.3 /usr/share/man/man3/envz_remove.3 /usr/share/man/man3/scalbn=
f.3 /usr/share/man/man2/_llseek.2 /usr/share/man/man3/tsearch.3 /usr/share/=
man/man3/sigignore.3 /usr/share/man/man2/shmget.2 /usr/share/man/man7/utf-8=
.7 /usr/share/man/man3/netlink.3 /usr/share/man/man3/endfsent.3 /usr/share/=
man/man2/sigtimedwait.2 /usr/share/man/man3/fgetgrent_r.3 /usr/share/man/ma=
n3/modff.3 /usr/share/man/man2/inb_p.2 /usr/share/man/man2/get_thread_area.=
2 /usr/share/man/man7/operator.7 /usr/share/man/man3/CPU_SET.3 /usr/share/m=
an/man3/getaliasbyname.3 /usr/share/man/man3/pthread_kill.3 /usr/share/man/=
man3/getpt.3 /usr/share/man/man3/cfsetispeed.3 /usr/share/man/man3/endmnten=
t.3 /usr/share/man/man3/hdestroy_r.3 /usr/share/man/man2/munlockall.2 /usr/=
share/man/man3/ccos.3 /usr/share/man/man3/random.3 /usr/share/man/man3/mche=
ck.3 /usr/share/man/man3/setbuf.3 /usr/share/man/man3/logout.3 /usr/share/m=
an/man3/clog.3 /usr/share/man/man5/filesystems.5 /usr/share/man/man3/feenab=
leexcept.3 /usr/share/man/man3/pthread_attr_setscope.3 /usr/share/man/man3/=
iswupper.3 /usr/share/man/man3/getwchar_unlocked.3 /usr/share/man/man3/read=
dir.3 /usr/share/man/man3/xdr_short.3 /usr/share/man/man3/tmpnam.3 /usr/sha=
re/man/man3/wcsnrtombs.3 /usr/share/man/man2/mknodat.2 /usr/share/man/man3/=
atan2.3 /usr/share/man/man7/unix.7 /usr/share/man/man2/tee.2 /usr/share/man=
/man3/callrpc.3 /usr/share/man/man3/getgrnam_r.3 /usr/share/man/man2/pcicon=
fig_read.2 /usr/share/man/man3/scalbnl.3 /usr/share/man/man3/getrpcport.3 /=
usr/share/man/man3/__freadable.3 /usr/share/man/man3/updwtmpx.3 /usr/share/=
man/man3/getnetbyname_r.3 /usr/share/man/man7/ipv6.7 /usr/share/man/man3/ft=
w.3 /usr/share/man/man3/sigandset.3 /usr/share/man/man3/svc_destroy.3 /usr/=
share/man/man3/log2l.3 /usr/share/man/man3/roundf.3 /usr/share/man/man3/ine=
t_aton.3 /usr/share/man/man7/iso-8859-16.7 /usr/share/man/man2/sigaltstack.=
2 /usr/share/man/man3/lsearch.3 /usr/share/man/man2/add_key.2 /usr/share/ma=
n/man3/xdrrec_skiprecord.3 /usr/share/man/man3/fdopen.3 /usr/share/man/man3=
/svcerr_progvers.3 /usr/share/man/man3/feholdexcept.3 /usr/share/man/man3/s=
vcudp_bufcreate.3 /usr/share/man/man3/xdr_getpos.3 /usr/share/man/man7/iso-=
8859-10.7 /usr/share/man/man2/set_tid_address.2 /usr/share/man/man3/wcscpy.=
3 /usr/share/man/man3/putspent.3 /usr/share/man/man3/ntohs.3 /usr/share/man=
/man3/getutmpx.3 /usr/share/man/man3/timezone.3 /usr/share/man/man2/madvise=
1.2 /usr/share/man/man3/fseeko.3 /usr/share/man/man3/wcslen.3 /usr/share/ma=
n/man3/csqrtl.3 /usr/share/man/man3/system.3 /usr/share/man/man3/atan.3 /us=
r/share/man/man3/freeaddrinfo.3 /usr/share/man/man3/strncmp.3 /usr/share/ma=
n/man3/wcsstr.3 /usr/share/man/man2/nice.2 /usr/share/man/man3/be32toh.3 /u=
sr/share/man/man3/initstate.3 /usr/share/man/man2/insw.2 /usr/share/man/man=
3/CPU_EQUAL_S.3 /usr/share/man/man2/rmdir.2 /usr/share/man/man3/xdrstdio_cr=
eate.3 /usr/share/man/man3/makedev.3 /usr/share/man/man3/cimagf.3 /usr/shar=
e/man/man3/ldexpl.3 /usr/share/man/man3/trunc.3 /usr/share/man/man3/lround.=
3 /usr/share/man/man7/man.7 /usr/share/man/man3/le64toh.3 /usr/share/man/ma=
n3/clogf.3 /usr/share/man/man3/strrchr.3 /usr/share/man/man2/accept.2 /usr/=
share/man/man3/strxfrm.3 /usr/share/man/man3/gethostent.3 /usr/share/man/ma=
n3/syslog.3 /usr/share/man/man3/sched_getcpu.3 /usr/share/man/man3/hsearch_=
r.3 /usr/share/man/man2/fstatvfs.2 /usr/share/man/man3/CMSG_FIRSTHDR.3 /usr=
/share/man/man5/networks.5 /usr/share/man/man3/hstrerror.3 /usr/share/man/m=
an3/tmpnam_r.3 /usr/share/man/man5/dir_colors.5 /usr/share/man/man3/ether_a=
ton.3 /usr/share/man/man3/futimes.3 /usr/share/man/man3/re_exec.3 /usr/shar=
e/man/man2/setreuid.2 /usr/share/man/man7/libc.7 /usr/share/man/man3/pthrea=
d_attr_getdetachstate.3 /usr/share/man/man3/sighold.3 /usr/share/man/man3/s=
trncasecmp.3 /usr/share/man/man2/setxattr.2 /usr/share/man/man2/uselib.2 /u=
sr/share/man/man3/feof_unlocked.3 /usr/share/man/man3/clntraw_create.3 /usr=
/share/man/man3/tcsetpgrp.3 /usr/share/man/man3/catanhl.3 /usr/share/man/ma=
n7/iso-8859-2.7 /usr/share/man/man3/opterr.3 /usr/share/man/man7/iso-8859-4=
.7 /usr/share/man/man2/pread.2 /usr/share/man/man3/log1pl.3 /usr/share/man/=
man3/iswspace.3 /usr/share/man/man2/sigpending.2 /usr/share/man/man3/insque=
.3 /usr/share/man/man3/fmaxl.3 /usr/share/man/man3/tcflush.3 /usr/share/man=
/man3/llrintf.3 /usr/share/man/man2/renameat.2 /usr/share/man/man3/ilogbf.3=
 /usr/share/man/man3/imaxdiv.3 /usr/share/man/man3/cos.3 /usr/share/man/man=
2/mq_timedreceive.2 /usr/share/man/man2/faccessat.2 /usr/share/man/man3/lfi=
nd.3 /usr/share/man/man5/resolv.conf.5 /usr/share/man/man3/iscntrl.3 /usr/s=
hare/man/man3/iswxdigit.3 /usr/share/man/man3/getprotobynumber_r.3 /usr/sha=
re/man/man2/setuid32.2 /usr/share/man/man3/hypot.3 /usr/share/man/man3/ldex=
p.3 /usr/share/man/man3/CPU_SET_S.3 /usr/share/man/man3/CMSG_SPACE.3 /usr/s=
hare/man/man3/exit.3 /usr/share/man/man3/inet_ntoa.3 /usr/share/man/man3/ge=
twc_unlocked.3 /usr/share/man/man3/erf.3 /usr/share/man/man2/fadvise64_64.2=
 /usr/share/man/man3/pthread_attr_getscope.3 /usr/share/man/man2/shmdt.2 /u=
sr/share/man/man2/eventfd2.2 /usr/share/man/man3/pathconf.3 /usr/share/man/=
man3/scalb.3 /usr/share/man/man7/ip.7 /usr/share/man/man3/strncpy.3 /usr/sh=
are/man/man3/execvp.3 /usr/share/man/man3/drand48_r.3 /usr/share/man/man3/t=
csendbreak.3 /usr/share/man/man3/dlsym.3 /usr/share/man/man3/sem_destroy.3 =
/usr/share/man/man3/ftell.3 /usr/share/man/man3/CPU_FREE.3 /usr/share/man/m=
an3/error_one_per_line.3 /usr/share/man/man3/j1f.3 /usr/share/man/man3/wcsc=
mp.3 /usr/share/man/man2/sethostid.2 /usr/share/man/man8/nscd.8 /usr/share/=
man/man2/poll.2 /usr/share/man/man3/svcfd_create.3 /usr/share/man/man3/fcvt=
_r.3 /usr/share/man/man3/shm_open.3 /usr/share/man/man3/ctanf.3 /usr/share/=
man/man3/ffsll.3 /usr/share/man/man2/mprotect.2 /usr/share/man/man3/cerfcf.=
3 /usr/share/man/man3/htole16.3 /usr/share/man/man3/rpc.3 /usr/share/man/ma=
n3/glob.3 /usr/share/man/man2/mq_getsetattr.2 /usr/share/man/man3/isatty.3 =
/usr/share/man/man3/timegm.3 /usr/share/man/man2/listxattr.2 /usr/share/man=
/man3/atoq.3 /usr/share/man/man3/ungetwc.3 /usr/share/man/man3/hcreate.3 /u=
sr/share/man/man3/cosl.3 /usr/share/man/man2/getresgid32.2 /usr/share/man/m=
an3/xdr_pointer.3 /usr/share/man/man3/getnetgrent.3 /usr/share/man/man3/ico=
nv_close.3 /usr/share/man/man3/frexpf.3 /usr/share/man/man2/getpriority.2 /=
usr/share/man/man2/mincore.2 /usr/share/man/man3/hasmntopt.3 /usr/share/man=
/man8/intro.8 /usr/share/man/man3/scalblnf.3 /usr/share/man/man3/y0l.3 /usr=
/share/man/man5/securetty.5 /usr/share/man/man3/clearenv.3 /usr/share/man/m=
an3/localtime_r.3 /usr/share/man/man4/sd.4 /usr/share/man/man3/fts_open.3 /=
usr/share/man/man3/nextafter.3 /usr/share/man/man4/intro.4 /usr/share/man/m=
an3/nearbyintf.3 /usr/share/man/man3/pthread_getschedparam.3 /usr/share/man=
/man2/init_module.2 /usr/share/man/man2/futex.2 /usr/share/man/man2/pciconf=
ig_write.2 /usr/share/man/man3/ynl.3 /usr/share/man/man2/sync.2 /usr/share/=
man/man2/mq_notify.2 /usr/share/man/man3/cexp.3 /usr/share/man/man3/memcpy.=
3 /usr/share/man/man3/vwarnx.3 /usr/share/man/man2/chmod.2 /usr/share/man/m=
an2/inl_p.2 /usr/share/man/man3/offsetof.3 /usr/share/man/man3/fwprintf.3 /=
usr/share/man/man3/ether_ntoa.3 /usr/share/man/man3/htole32.3 /usr/share/ma=
n/man3/vtimes.3 /usr/share/man/man3/getsubopt.3 /usr/share/man/man2/sched_r=
r_get_interval.2 /usr/share/man/man2/clone2.2 /usr/share/man/man3/stdin.3 /=
usr/share/man/man3/getnetent_r.3 /usr/share/man/man3/ctanl.3 /usr/share/man=
/man3/sigdelset.3 /usr/share/man/man5/slabinfo.5 /usr/share/man/man2/statvf=
s.2 /usr/share/man/man3/setusershell.3 /usr/share/man/man3/vscanf.3 /usr/sh=
are/man/man3/j0.3 /usr/share/man/man2/pread64.2 /usr/share/man/man3/xdr_des=
troy.3 /usr/share/man/man2/oldlstat.2 /usr/share/man/man3/bzero.3 /usr/shar=
e/man/man4/rtc.4 /usr/share/man/man3/tanh.3 /usr/share/man/man7/sem_overvie=
w.7 /usr/share/man/man4/console_codes.4 /usr/share/man/man3/malloc_usable_s=
ize.3 /usr/share/man/man3/fpurge.3 /usr/share/man/man2/getdents64.2 /usr/sh=
are/man/man3/xdr_callmsg.3 /usr/share/man/man2/time.2 /usr/share/man/man2/l=
getxattr.2 /usr/share/man/man3/mkstemps.3 /usr/share/man/man2/llseek.2 /usr=
/share/man/man3/argz_create.3 /usr/share/man/man3/yn.3 /usr/share/man/man3/=
ntohl.3 /usr/share/man/man3/getfsspec.3 /usr/share/man/man7/capabilities.7 =
/usr/share/man/man3/xencrypt.3 /usr/share/man/man2/sendmsg.2 /usr/share/man=
/man3/forkpty.3 /usr/share/man/man3/memccpy.3 /usr/share/man/man2/getrusage=
.2 /usr/share/man/man3/CMSG_ALIGN.3 /usr/share/man/man3/erfc.3 /usr/share/m=
an/man3/atoi.3 /usr/share/man/man3/CIRCLEQ_INSERT_TAIL.3 /usr/share/man/man=
3/getspnam_r.3 /usr/share/man/man3/twalk.3 /usr/share/man/man2/alarm.2 /usr=
/share/man/man3/res_init.3 /usr/share/man/man3/cprojl.3 /usr/share/man/man3=
/putchar_unlocked.3 /usr/share/man/man3/getaliasbyname_r.3 /usr/share/man/m=
an3/erand48.3 /usr/share/man/man3/fts_close.3 /usr/share/man/man3/getdirent=
ries.3 /usr/share/man/man3/catanh.3 /usr/share/man/man3/getaddrinfo.3 /usr/=
share/man/man3/llrint.3 /usr/share/man/man3/mq_open.3 /usr/share/man/man2/_=
sysctl.2 /usr/share/man/man3/sigset.3 /usr/share/man/man3/telldir.3 /usr/sh=
are/man/man3/rexec_af.3 /usr/share/man/man3/ldiv.3 /usr/share/man/man3/mran=
d48.3 /usr/share/man/man3/scalbn.3 /usr/share/man/man3/getipnodebyaddr.3 /u=
sr/share/man/man3/pthread_kill_other_threads_np.3 /usr/share/man/man3/gai_e=
rror.3 /usr/share/man/man2/select.2 /usr/share/man/man3/wcrtomb.3 /usr/shar=
e/man/man3/rand_r.3 /usr/share/man/man3/gethostbyaddr.3 /usr/share/man/man2=
/inotify_rm_watch.2 /usr/share/man/man5/nologin.5 /usr/share/man/man3/error=
_at_line.3 /usr/share/man/man3/setenv.3 /usr/share/man/man3/scalbl.3 /usr/s=
hare/man/man3/atanhf.3 /usr/share/man/man3/mbsnrtowcs.3 /usr/share/man/man3=
/cpow.3 /usr/share/man/man3/klogctl.3 /usr/share/man/man3/argz_append.3 /us=
r/share/man/man2/readlink.2 /usr/share/man/man3/sigismember.3 /usr/share/ma=
n/man2/msgsnd.2 /usr/share/man/man3/logf.3 /usr/share/man/man3/tanhl.3 /usr=
/share/man/man3/res_query.3 /usr/share/man/man3/inet.3 /usr/share/man/man3/=
significandf.3 /usr/share/man/man3/fma.3 /usr/share/man/man3/ether_ntoa_r.3=
 /usr/share/man/man2/getpagesize.2 /usr/share/man/man3/seekdir.3 /usr/share=
/man/man2/mlockall.2 /usr/share/man/man2/statfs64.2 /usr/share/man/man3/nex=
ttoward.3 /usr/share/man/man4/tty_ioctl.4 /usr/share/man/man3/va_end.3 /usr=
/share/man/man3/regexec.3 /usr/share/man/man3/exec.3 /usr/share/man/man3/ac=
os.3 /usr/share/man/man3/feof.3 /usr/share/man/man2/lstat.2 /usr/share/man/=
man3/endprotoent.3 /usr/share/man/man3/LIST_REMOVE.3 /usr/share/man/man3/me=
mfrob.3 /usr/share/man/man3/wctomb.3 /usr/share/man/man3/asinhl.3 /usr/shar=
e/man/man3/cerff.3 /usr/share/man/man7/man-pages.7 /usr/share/man/man3/pthr=
ead_tryjoin_np.3 /usr/share/man/man2/rt_sigpending.2 /usr/share/man/man7/is=
o-8859-15.7 /usr/share/man/man3/ttyname_r.3 /usr/share/man/man3/erfcl.3 /us=
r/share/man/man3/jrand48_r.3 /usr/share/man/man2/mremap.2 /usr/share/man/ma=
n6/intro.6 /usr/share/man/man3/setjmp.3 /usr/share/man/man7/tis-620.7 /usr/=
share/man/man3/sockatmark.3 /usr/share/man/man5/locale.5 /usr/share/man/man=
2/gettid.2 /usr/share/man/man2/getgroups32.2 /usr/share/man/man3/__fbufsize=
.3 /usr/share/man/man3/getwchar.3 /usr/share/man/man3/memset.3 /usr/share/m=
an/man2/getpeername.2 /usr/share/man/man3/fwide.3 /usr/share/man/man2/timer=
_getoverrun.2 /usr/share/man/man3/endgrent.3 /usr/share/man/man4/futex.4 /u=
sr/share/man/man3/tcgetattr.3 /usr/share/man/man3/regex.3 /usr/share/man/ma=
n7/iso_8859_16.7 /usr/share/man/man3/fegetexceptflag.3 /usr/share/man/man7/=
intro.7 /usr/share/man/man3/srandom_r.3 /usr/share/man/man3/catclose.3 /usr=
/share/man/man3/xdr_replymsg.3 /usr/share/man/man3/fprintf.3 /usr/share/man=
/man3/xdr_void.3 /usr/share/man/man3/cimagl.3 /usr/share/man/man2/sched_get=
_priority_min.2 /usr/share/man/man2/getegid.2 /usr/share/man/man3/getservby=
name.3 /usr/share/man/man2/fstatfs.2 /usr/share/man/man3/coshl.3 /usr/share=
/man/man2/fgetxattr.2 /usr/share/man/man3/floor.3 /usr/share/man/man3/__flb=
f.3 /usr/share/man/man5/host.conf.5 /usr/share/man/man2/inw.2 /usr/share/ma=
n/man3/on_exit.3 /usr/share/man/man3/dlopen.3 /usr/share/man/man3/pthread_a=
ttr_init.3 /usr/share/man/man3/strtoumax.3 /usr/share/man/man3/rresvport_af=
.3 /usr/share/man/man2/sigsuspend.2 /usr/share/man/man3/strtoimax.3 /usr/sh=
are/man/man3/getmntent.3 /usr/share/man/man3/CIRCLEQ_INSERT_BEFORE.3 /usr/s=
hare/man/man2/fadvise64.2 /usr/share/man/man3/aio_write.3 /usr/share/man/ma=
n3/pthread_attr_getschedpolicy.3 /usr/share/man/man3/sigemptyset.3 /usr/sha=
re/man/man3/xdr_wrapstring.3 /usr/share/man/man5/ipc.5 /usr/share/man/man7/=
iso_8859_3.7 /usr/share/man/man2/getegid32.2 /usr/share/man/man3/pthread_ge=
tcpuclockid.3 /usr/share/man/man3/ruserok.3 /usr/share/man/man3/cfmakeraw.3=
 /usr/share/man/man2/fchmodat.2 /usr/share/man/man3/fmaxf.3 /usr/share/man/=
man3/svcerr_noproc.3 /usr/share/man/man3/jnf.3 /usr/share/man/man2/timerfd_=
create.2 /usr/share/man/man3/gai_strerror.3 /usr/share/man/man3/setfsent.3 =
/usr/share/man/man3/xdr_opaque_auth.3 /usr/share/man/man3/mrand48_r.3 /usr/=
share/man/man2/timer_settime.2 /usr/share/man/man3/malloc_info.3 /usr/share=
/man/man3/inet_netof.3 /usr/share/man/man3/timeradd.3 /usr/share/man/man7/x=
25.7 /usr/share/man/man4/full.4 /usr/share/man/man2/readv.2 /usr/share/man/=
man3/getutent_r.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man2/chown=
32.2 /usr/share/man/man3/wmemchr.3 /usr/share/man/man3/getutxline.3 /usr/sh=
are/man/man2/acct.2 /usr/share/man/man3/CPU_OR.3 /usr/share/man/man3/sem_po=
st.3 /usr/share/man/man3/strtouq.3 /usr/share/man/man3/clog2l.3 /usr/share/=
man/man3/conj.3 /usr/share/man/man2/io_setup.2 /usr/share/man/man3/getalias=
ent_r.3 /usr/share/man/man4/tty.4 /usr/share/man/man2/ioprio_get.2 /usr/sha=
re/man/man3/login_tty.3 /usr/share/man/man3/pow.3 /usr/share/man/man7/latin=
2.7 /usr/share/man/man3/mbrlen.3 /usr/share/man/man7/svipc.7 /usr/share/man=
/man3/unlockpt.3 /usr/share/man/man3/clntudp_create.3 /usr/share/man/man3/c=
abs.3 /usr/share/man/man2/tkill.2 /usr/share/man/man7/iso_8859-2.7 /usr/sha=
re/man/man7/termio.7 /usr/share/man/man3/sincos.3 /usr/share/man/man3/strch=
r.3 /usr/share/man/man3/getservent_r.3 /usr/share/man/man2/gettimeofday.2 /=
usr/share/man/man3/pow10.3 /usr/share/man/man3/abs.3 /usr/share/man/man3/ca=
bsf.3 /usr/share/man/man3/xcrypt.3 /usr/share/man/man3/towlower.3 /usr/shar=
e/man/man2/llistxattr.2 /usr/share/man/man2/flistxattr.2 /usr/share/man/man=
3/fsetpos.3 /usr/share/man/man5/tzfile.5 /usr/share/man/man3/ttyname.3 /usr=
/share/man/man3/fabsf.3 /usr/share/man/man3/fileno_unlocked.3 /usr/share/ma=
n/man3/HUGE_VAL.3 /usr/share/man/man2/munmap.2 /usr/share/man/man7/latin4.7=
 /usr/share/man/man2/setgid32.2 /usr/share/man/man3/fgetc.3 /usr/share/man/=
man2/outsl.2 /usr/share/man/man3/mkostemps.3 /usr/share/man/man3/jnl.3 /usr=
/share/man/man3/clock.3 /usr/share/man/man2/gethostname.2 /usr/share/man/ma=
n3/makecontext.3 /usr/share/man/man3/log2.3 /usr/share/man/man3/setnetent.3=
 /usr/share/man/man3/putwchar_unlocked.3 /usr/share/man/man2/vfork.2 /usr/s=
hare/man/man3/xdr_reference.3 /usr/share/man/man2/shmat.2 /usr/share/man/ma=
n3/vswprintf.3 /usr/share/man/man3/isgreaterequal.3 /usr/share/man/man3/pow=
f.3 /usr/share/man/man3/TAILQ_INSERT_AFTER.3 /usr/share/man/man4/kmem.4 /us=
r/share/man/man3/mktemp.3 /usr/share/man/man3/globfree.3 /usr/share/man/man=
2/getpgrp.2 /usr/share/man/man3/MB_CUR_MAX.3 /usr/share/man/man3/wcsdup.3 /=
usr/share/man/man3/ssignal.3 /usr/share/man/man2/recvmmsg.2 /usr/share/man/=
man3/get_nprocs_conf.3 /usr/share/man/man5/shells.5 /usr/share/man/man2/mou=
nt.2 /usr/share/man/man3/cacosh.3 /usr/share/man/man3/putgrent.3 /usr/share=
/man/man3/xdr_double.3 /usr/share/man/man3/strcat.3 /usr/share/man/man3/sge=
tspent_r.3 /usr/share/man/man3/fpathconf.3 /usr/share/man/man2/ppoll.2 /usr=
/share/man/man8/ld-linux.so.8 /usr/share/man/man3/ctermid.3 /usr/share/man/=
man3/fts_read.3 /usr/share/man/man2/getitimer.2 /usr/share/man/man8/zdump.8=
 /usr/share/man/man2/capset.2 /usr/share/man/man2/tuxcall.2 /usr/share/man/=
man3/versionsort.3 /usr/share/man/man3/xdr_authunix_parms.3 /usr/share/man/=
man3/getdate_err.3 /usr/share/man/man3/dladdr.3 /usr/share/man/man3/auth_de=
stroy.3 /usr/share/man/man2/syslog.2 /usr/share/man/man7/hostname.7 /usr/sh=
are/man/man3/putchar.3 /usr/share/man/man3/pthread_sigmask.3 /usr/share/man=
/man2/getgid.2 /usr/share/man/man3/cexp2.3 /usr/share/man/man3/CPU_ALLOC_SI=
ZE.3 /usr/share/man/man3/CPU_ZERO.3 /usr/share/man/man3/getpwnam.3 /usr/sha=
re/man/man2/timerfd_gettime.2 /usr/share/man/man3/ctime.3 /usr/share/man/ma=
n3/svc_getcaller.3 /usr/share/man/man3/getutline.3 /usr/share/man/man3/getl=
ogin_r.3 /usr/share/man/man3/memcmp.3 /usr/share/man/man3/utmpname.3 /usr/s=
hare/man/man3/gnu_dev_makedev.3 /usr/share/man/man2/unlink.2 /usr/share/man=
/man2/getsockname.2 /usr/share/man/man3/argz_stringify.3 /usr/share/man/man=
3/verrx.3 /usr/share/man/man3/argz_add.3 /usr/share/man/man3/setstate.3 /us=
r/share/man/man3/rpmatch.3 /usr/share/man/man2/getgroups.2 /usr/share/man/m=
an2/socketpair.2 /usr/share/man/man2/nanosleep.2 /usr/share/man/man3/mcheck=
_pedantic.3 /usr/share/man/man2/lremovexattr.2 /usr/share/man/man8/ld.so.8 =
/usr/share/man/man3/getprotobyname_r.3 /usr/share/man/man2/pivot_root.2 /us=
r/share/man/man3/strpbrk.3 /usr/share/man/man3/getdate.3 /usr/share/man/man=
2/setfsgid.2 /usr/share/man/man3/rcmd_af.3 /usr/share/man/man3/recno.3 /usr=
/share/man/man4/ptmx.4 /usr/share/man/man3/key_decryptsession.3 /usr/share/=
man/man8/tzselect.8 /usr/share/man/man3/endnetent.3 /usr/share/man/man2/mq_=
open.2 /usr/share/man/man2/rename.2 /usr/share/man/man3/bsd_signal.3 /usr/s=
hare/man/man7/socket.7 /usr/share/man/man3/isnanl.3 /usr/share/man/man3/mal=
loc_hook.3 /usr/share/man/man3/alphasort.3 /usr/share/man/man3/significandl=
.3 /usr/share/man/man3/seed48_r.3 /usr/share/man/man3/xprt_unregister.3 /us=
r/share/man/man3/y0.3 /usr/share/man/man3/isgreater.3 /usr/share/man/man3/g=
etservbyport.3 /usr/share/man/man2/access.2 /usr/share/man/man3/memmem.3 /u=
sr/share/man/man3/clnt_perrno.3 /usr/share/man/man3/endnetgrent.3 /usr/shar=
e/man/man3/conjl.3 /usr/share/man/man3/fopen.3 /usr/share/man/man3/scalbln.=
3 /usr/share/man/man3/a64l.3 /usr/share/man/man2/sigprocmask.2 /usr/share/m=
an/man3/strtoq.3 /usr/share/man/man3/pututline.3 /usr/share/man/man3/cimag.=
3 /usr/share/man/man2/geteuid32.2 /usr/share/man/man3/clnt_freeres.3 /usr/s=
hare/man/man3/fts.3 /usr/share/man/man3/getpwent.3 /usr/share/man/man3/endi=
an.3 /usr/share/man/man2/unimplemented.2 /usr/share/man/man3/pthread_self.3=
 /usr/share/man/man3/mprobe.3 /usr/share/man/man3/hypotl.3 /usr/share/man/m=
an3/closedir.3 /usr/share/man/man3/wcsrchr.3 /usr/share/man/man3/getservbyn=
ame_r.3 /usr/share/man/man4/ttyS.4 /usr/share/man/man3/hash.3 /usr/share/ma=
n/man2/timerfd_settime.2 /usr/share/man/man2/io_destroy.2 /usr/share/man/ma=
n3/stpcpy.3 /usr/share/man/man2/ftruncate64.2 /usr/share/man/man2/sigaction=
.2 /usr/share/man/man3/xprt_register.3 /usr/share/man/man3/gethostbyaddr_r.=
3 /usr/share/man/man3/timersub.3 /usr/share/man/man3/getutmp.3 /usr/share/m=
an/man3/getaliasent.3 /usr/share/man/man7/iso_8859-3.7 /usr/share/man/man3/=
catanhf.3 /usr/share/man/man3/iswalnum.3 /usr/share/man/man3/powl.3 /usr/sh=
are/man/man3/asin.3 /usr/share/man/man3/qsort_r.3 /usr/share/man/man2/fallo=
cate.2 /usr/share/man/man3/endutent.3 /usr/share/man/man3/aio_fsync.3 /usr/=
share/man/man3/psignal.3 /usr/share/man/man3/htobe64.3 /usr/share/man/man3/=
localtime.3 /usr/share/man/man2/fcntl.2 /usr/share/man/man2/process_vm_read=
v.2 /usr/share/man/man2/getsockopt.2 /usr/share/man/man5/nsswitch.conf.5 /u=
sr/share/man/man3/csqrtf.3 /usr/share/man/man3/pthread_attr_setschedpolicy.=
3 /usr/share/man/man2/arch_prctl.2 /usr/share/man/man3/clogl.3 /usr/share/m=
an/man3/be16toh.3 /usr/share/man/man2/stty.2 /usr/share/man/man2/modify_ldt=
.2 /usr/share/man/man3/sigisemptyset.3 /usr/share/man/man3/strcspn.3 /usr/s=
hare/man/man2/oldstat.2 /usr/share/man/man3/nexttowardf.3 /usr/share/man/ma=
n3/DES_FAILED.3 /usr/share/man/man3/nftw.3 /usr/share/man/man2/query_module=
.2 /usr/share/man/man2/get_kernel_syms.2 /usr/share/man/man3/fgets_unlocked=
.3 /usr/share/man/man3/jrand48.3 /usr/share/man/man3/getspnam.3 /usr/share/=
man/man2/exit_group.2 /usr/share/man/man3/wcsnlen.3 /usr/share/man/man2/pre=
adv.2 /usr/share/man/man2/getuid32.2 /usr/share/man/man3/cacosf.3 /usr/shar=
e/man/man3/fegetenv.3 /usr/share/man/man3/sem_open.3 /usr/share/man/man3/pu=
tpwent.3 /usr/share/man/man3/setlocale.3 /usr/share/man/man3/malloc_set_sta=
te.3 /usr/share/man/man7/uri.7 /usr/share/man/man3/CPU_XOR_S.3 /usr/share/m=
an/man2/setresgid.2 /usr/share/man/man3/open_wmemstream.3 /usr/share/man/ma=
n2/pwrite64.2 /usr/share/man/man3/mq_close.3 /usr/share/man/man3/isgraph.3 =
/usr/share/man/man3/ctanh.3 /usr/share/man/man2/brk.2 /usr/share/man/man2/i=
oprio_set.2 /usr/share/man/man3/pthread_attr_getstacksize.3 /usr/share/man/=
man3/vasprintf.3 /usr/share/man/man2/sendto.2 /usr/share/man/man2/oldolduna=
me.2 /usr/share/man/man2/munlock.2 /usr/share/man/man7/iso-8859-6.7 /usr/sh=
are/man/man3/basename.3 /usr/share/man/man2/rt_sigaction.2 /usr/share/man/m=
an3/log1pf.3 /usr/share/man/man3/islessequal.3 /usr/share/man/man7/iso-8859=
-8.7 /usr/share/man/man2/bind.2 /usr/share/man/man3/svc_freeargs.3 /usr/sha=
re/man/man3/stdout.3 /usr/share/man/man7/iso_8859_13.7 /usr/share/man/man3/=
sinf.3 /usr/share/man/man2/timer_gettime.2 /usr/share/man/man3/fesetenv.3 /=
usr/share/man/man3/fileno.3 /usr/share/man/man7/iso_8859_11.7 /usr/share/ma=
n/man3/rewinddir.3 /usr/share/man/man2/quotactl.2 /usr/share/man/man7/iso_8=
859-15.7 /usr/share/man/man2/sigreturn.2 /usr/share/man/man3/xdr_bytes.3 /u=
sr/share/man/man7/environ.7 /usr/share/man/man7/ddp.7 /usr/share/man/man3/g=
etservbyport_r.3 /usr/share/man/man3/sys_nerr.3 /usr/share/man/man3/profil.=
3 /usr/share/man/man3/fmaf.3 /usr/share/man/man7/numa.7 /usr/share/man/man7=
/iso_8859-11.7 /usr/share/man/man3/error_print_progname.3 /usr/share/man/ma=
n3/fgetwc_unlocked.3 /usr/share/man/man3/y0f.3 /usr/share/man/man3/sem_wait=
.3 /usr/share/man/man7/packet.7 /usr/share/man/man2/msync.2 /usr/share/man/=
man3/readdir_r.3 /usr/share/man/man7/iso_8859-13.7 /usr/share/man/man3/__fr=
eading.3 /usr/share/man/man3/dn_expand.3 /usr/share/man/man3/fmal.3 /usr/sh=
are/man/man3/dirname.3 /usr/share/man/man2/move_pages.2 /usr/share/man/man3=
/getlogin.3 /usr/share/man/man3/atanh.3 /usr/share/man/man3/fflush.3 /usr/s=
hare/man/man2/subpage_prot.2 /usr/share/man/man3/vfscanf.3 /usr/share/man/m=
an3/iswdigit.3 /usr/share/man/man3/qfcvt.3 /usr/share/man/man3/iruserok_af.=
3 /usr/share/man/man7/iso-8859-3.7 /usr/share/man/man2/sethostname.2 /usr/s=
hare/man/man3/dn_comp.3 /usr/share/man/man3/scanf.3 /usr/share/man/man7/mq_=
overview.7 /usr/share/man/man3/backtrace.3 /usr/share/man/man3/clnt_destroy=
.3 /usr/share/man/man2/pwrite.2 /usr/share/man/man7/pty.7 /usr/share/man/ma=
n7/feature_test_macros.7 /usr/share/man/man3/cosh.3 /usr/share/man/man2/sch=
ed_getparam.2 /usr/share/man/man3/getc_unlocked.3 /usr/share/man/man3/ether=
_line.3 /usr/share/man/man4/cpuid.4 /usr/share/man/man3/fmemopen.3 /usr/sha=
re/man/man3/freopen.3 /usr/share/man/man3/mkfifo.3 /usr/share/man/man3/atan=
l.3 /usr/share/man/man3/clnt_call.3 /usr/share/man/man3/ccosl.3 /usr/share/=
man/man3/ftime.3 /usr/share/man/man3/clog2.3 /usr/share/man/man3/htonl.3 /u=
sr/share/man/man3/getprotobynumber.3 /usr/share/man/man3/clnt_sperror.3 /us=
r/share/man/man3/h_errno.3 /usr/share/man/man3/remainderl.3 /usr/share/man/=
man2/getpgid.2 /usr/share/man/man3/ccosh.3 /usr/share/man/man2/seteuid.2 /u=
sr/share/man/man3/login.3 /usr/share/man/man4/console_ioctl.4 /usr/share/ma=
n/man5/charmap.5 /usr/share/man/man3/vprintf.3 /usr/share/man/man3/setutxen=
t.3 /usr/share/man/man3/fgetwc.3 /usr/share/man/man3/xdr_callhdr.3 /usr/sha=
re/man/man3/bcmp.3 /usr/share/man/man3/getpwuid.3 /usr/share/man/man7/spufs=
.7 /usr/share/man/man3/cosf.3 /usr/share/man/man3/nearbyintl.3 /usr/share/m=
an/man3/xdr_long.3 /usr/share/man/man3/sqrt.3 /usr/share/man/man3/stdarg.3 =
/usr/share/man/man3/sigsetmask.3 /usr/share/man/man3/scalblnl.3 /usr/share/=
man/man3/endusershell.3 /usr/share/man/man3/sleep.3 /usr/share/man/man4/ura=
ndom.4 /usr/share/man/man3/pthread_getattr_np.3 /usr/share/man/man3/setmnte=
nt.3 /usr/share/man/man3/srand48.3 /usr/share/man/man3/gnu_get_libc_version=
.3 /usr/share/man/man3/clntudp_bufcreate.3 /usr/share/man/man2/clone.2 /usr=
/share/man/man3/xdr_u_int.3 /usr/share/man/man7/time.7 /usr/share/man/man3/=
openpty.3 /usr/share/man/man7/path_resolution.7 /usr/share/man/man3/fgetpos=
.3 /usr/share/man/man4/vcsa.4 /usr/share/man/man3/nl_langinfo.3 /usr/share/=
man/man3/MB_LEN_MAX.3 /usr/share/man/man2/lchown32.2 /usr/share/man/man3/au=
thunix_create_default.3 /usr/share/man/man3/tfind.3 /usr/share/man/man3/pma=
p_getmaps.3 /usr/share/man/man3/mq_timedsend.3 /usr/share/man/man3/getumask=
.3 /usr/share/man/man3/atanf.3 /usr/share/man/man3/eaccess.3 /usr/share/man=
/man3/wmempcpy.3 /usr/share/man/man3/getnameinfo.3 /usr/share/man/man3/cryp=
t_r.3 /usr/share/man/man3/herror.3 /usr/share/man/man2/statfs.2 /usr/share/=
man/man3/getpw.3 /usr/share/man/man3/clnt_broadcast.3 /usr/share/man/man2/i=
nsl.2 /usr/share/man/man2/sysctl.2 /usr/share/man/man3/tan.3 /usr/share/man=
/man3/strfmon.3 /usr/share/man/man3/dbopen.3 /usr/share/man/man3/sem_close.=
3 /usr/share/man/man7/inotify.7 /usr/share/man/man2/delete_module.2 /usr/sh=
are/man/man3/raise.3 /usr/share/man/man3/cprojf.3 /usr/share/man/man3/ualar=
m.3 /usr/share/man/man3/get_current_dir_name.3 /usr/share/man/man2/pselect.=
2 /usr/share/man/man3/asctime_r.3 /usr/share/man/man3/pthread_setschedparam=
.3 /usr/share/man/man3/getutxent.3 /usr/share/man/man3/errx.3 /usr/share/ma=
n/man3/floorf.3 /usr/share/man/man3/gmtime.3 /usr/share/man/man3/updwtmp.3 =
/usr/share/man/man3/dlclose.3 /usr/share/man/man7/fifo.7 /usr/share/man/man=
3/realpath.3 /usr/share/man/man3/freehostent.3 /usr/share/man/man2/waitpid.=
2 /usr/share/man/man7/epoll.7 /usr/share/man/man3/getpwent_r.3 /usr/share/m=
an/man3/ulckpwdf.3 /usr/share/man/man7/iso-8859-13.7 /usr/share/man/man3/ra=
nd.3 /usr/share/man/man3/getwd.3 /usr/share/man/man2/posix_fadvise.2 /usr/s=
hare/man/man3/gethostid.3 /usr/share/man/man7/iso-8859-11.7 /usr/share/man/=
man7/regex.7 /usr/share/man/man3/isunordered.3 /usr/share/man/man3/exp.3 /u=
sr/share/man/man3/isupper.3 /usr/share/man/man3/clnt_control.3 /usr/share/m=
an/man3/timerclear.3 /usr/share/man/man3/wcscat.3 /usr/share/man/man3/finit=
e.3 /usr/share/man/man3/xdrrec_eof.3 /usr/share/man/man2/fork.2 /usr/share/=
man/man2/outw.2 /usr/share/man/man2/reboot.2 /usr/share/man/man3/__fpending=
.3 /usr/share/man/man2/truncate64.2 /usr/share/man/man3/pmap_getport.3 /usr=
/share/man/man3/xdr_accepted_reply.3 /usr/share/man/man3/daylight.3 /usr/sh=
are/man/man3/wcstoumax.3 /usr/share/man/man3/adjtime.3 /usr/share/man/man3/=
cerfl.3 /usr/share/man/man3/cbc_crypt.3 /usr/share/man/man2/utime.2 /usr/sh=
are/man/man2/ftruncate.2 /usr/share/man/man3/authnone_create.3 /usr/share/m=
an/man3/fgetpwent.3 /usr/share/man/man3/aio_error.3 /usr/share/man/man3/set=
spent.3 /usr/share/man/man2/nfsservctl.2 /usr/share/man/man2/insb.2 /usr/sh=
are/man/man2/getgid32.2 /usr/share/man/man2/uname.2 /usr/share/man/man1/tim=
e.1 /usr/share/man/man3/catgets.3 /usr/share/man/man3/tolower.3 /usr/share/=
man/man2/creat.2 /usr/share/man/man3/sem_trywait.3 /usr/share/man/man3/floo=
rl.3 /usr/share/man/man3/getnetbyaddr_r.3 /usr/share/man/man3/passwd2des.3 =
/usr/share/man/man3/wprintf.3 /usr/share/man/man3/getutxid.3 /usr/share/man=
/man3/nrand48_r.3 /usr/share/man/man3/logb.3 /usr/share/man/man2/inotify_in=
it.2 /usr/share/man/man2/io_cancel.2 /usr/share/man/man3/cbrtf.3 /usr/share=
/man/man3/xdr_bool.3 /usr/share/man/man7/cp1251.7 /usr/share/man/man3/FD_SE=
T.3 /usr/share/man/man3/wcstok.3 /usr/share/man/man5/numa_maps.5 /usr/share=
/man/man3/pvalloc.3 /usr/share/man/man3/fgetws.3 /usr/share/man/man3/optind=
.3 /usr/share/man/man3/getgrgid_r.3 /usr/share/man/man3/CPU_XOR.3 /usr/shar=
e/man/man3/envz_merge.3 /usr/share/man/man2/getcontext.2 /usr/share/man/man=
3/logl.3 /usr/share/man/man5/hosts.5 /usr/share/man/man3/unlocked_stdio.3 /=
usr/share/man/man3/tanhf.3 /usr/share/man/man3/strndup.3 /usr/share/man/man=
3/timelocal.3 /usr/share/man/man3/le32toh.3 /usr/share/man/man3/mq_unlink.3=
 /usr/share/man/man3/mkostemp.3 /usr/share/man/man3/gsignal.3 /usr/share/ma=
n/man3/cfsetspeed.3 /usr/share/man/man3/getttyent.3 /usr/share/man/man2/set=
context.2 /usr/share/man/man3/fgetws_unlocked.3 /usr/share/man/man3/getutid=
.3 /usr/share/man/man2/outsb.2 /usr/share/man/man3/llroundl.3 /usr/share/ma=
n/man3/setvbuf.3 /usr/share/man/man3/aio_init.3 /usr/share/man/man3/vsyslog=
.3 /usr/share/man/man3/srand48_r.3 /usr/share/man/man3/aligned_alloc.3 /usr=
/share/man/man3/lldiv.3 /usr/share/man/man4/msr.4 /usr/share/man/man2/seteg=
id.2 /usr/share/man/man2/open.2 /usr/share/man/man3/tcdrain.3 /usr/share/ma=
n/man3/erfcf.3 /usr/share/man/man3/getttynam.3 /usr/share/man/man3/fputc_un=
locked.3 /usr/share/man/man2/ptrace.2 /usr/share/man/man3/fputwc.3 /usr/sha=
re/man/man3/snprintf.3 /usr/share/man/man3/ungetc.3 /usr/share/man/man3/pth=
read_attr_setstackaddr.3 /usr/share/man/man2/putpmsg.2 /usr/share/man/man7/=
latin6.7 /usr/share/man/man3/wcstoimax.3 /usr/share/man/man3/queue.3 /usr/s=
hare/man/man3/nanl.3 /usr/share/man/man3/clnt_create.3 /usr/share/man/man2/=
fchmod.2 /usr/share/man/man3/putwc.3 /usr/share/man/man5/services.5 /usr/sh=
are/man/man3/swab.3 /usr/share/man/man8/sync.8 /usr/share/man/man3/copysign=
.3 /usr/share/man/man3/__malloc_hook.3 /usr/share/man/man3/realloc.3 /usr/s=
hare/man/man3/xdr_u_long.3 /usr/share/man/man3/matherr.3 /usr/share/man/man=
2/_newselect.2 /usr/share/man/man3/wcsncasecmp.3 /usr/share/man/man3/pthrea=
d_cleanup_pop_restore_np.3 /usr/share/man/man3/getloadavg.3 /usr/share/man/=
man2/setfsuid32.2 /usr/share/man/man3/setprotoent.3 /usr/share/man/man3/inn=
etgr.3 /usr/share/man/man3/memrchr.3 /usr/share/man/man7/latin8.7 /usr/shar=
e/man/man7/arp.7 /usr/share/man/man7/urn.7 /usr/share/man/man3/fseek.3 /usr=
/share/man/man3/cfree.3 /usr/share/man/man3/btowc.3 /usr/share/man/man3/cac=
oshl.3 /usr/share/man/man7/url.7 /usr/share/man/man3/y1l.3 /usr/share/man/m=
an3/perror.3 /usr/share/man/man7/iso_8859_9.7 /usr/share/man/man3/sigorset.=
3 /usr/share/man/man2/epoll_create1.2 /usr/share/man/man3/cabsl.3 /usr/shar=
e/man/man3/getprotoent.3 /usr/share/man/man3/__fpurge.3 /usr/share/man/man2=
/outw_p.2 /usr/share/man/man3/bcopy.3 /usr/share/man/man3/sigsetjmp.3 /usr/=
share/man/man7/iso_8859_1.7 /usr/share/man/man3/fdopendir.3 /usr/share/man/=
man2/msgrcv.2 /usr/share/man/man3/res_send.3 /usr/share/man/man3/gammal.3 /=
usr/share/man/man7/iso_8859_5.7 /usr/share/man/man3/assert.3 /usr/share/man=
/man2/intro.2 /usr/share/man/man2/setrlimit.2 /usr/share/man/man3/pmap_set.=
3 /usr/share/man/man3/addmntent.3 /usr/share/man/man3/siginterrupt.3 /usr/s=
hare/man/man2/setup.2 /usr/share/man/man7/iso_8859_7.7 /usr/share/man/man3/=
getcwd.3 /usr/share/man/man4/pts.4 /usr/share/man/man3/abort.3 /usr/share/m=
an/man3/strsep.3 /usr/share/man/man3/valloc.3 /usr/share/man/man3/truncf.3 =
/usr/share/man/man3/lroundf.3 /usr/share/man/man3/cargf.3 /usr/share/man/ma=
n3/copysignl.3 /usr/share/man/man3/towupper.3 /usr/share/man/man2/signalfd.=
2 /usr/share/man/man2/lock.2 /usr/share/man/man3/cpowf.3 /usr/share/man/man=
3/llroundf.3 /usr/share/man/man3/getgrent.3 /usr/share/man/man3/hcreate_r.3=
 /usr/share/man/man3/xdr.3 /usr/share/man/man3/wcspbrk.3 /usr/share/man/man=
3/envz_get.3 /usr/share/man/man3/putenv.3 /usr/share/man/man3/isxdigit.3 /u=
sr/share/man/man3/fegetexcept.3 /usr/share/man/man3/stdio.3 /usr/share/man/=
man3/sysv_signal.3 /usr/share/man/man2/openat.2 /usr/share/man/man3/isnorma=
l.3 /usr/share/man/man3/cmsg.3 /usr/share/man/man2/lseek.2 /usr/share/man/m=
an3/lgammal_r.3 /usr/share/man/man3/aio_cancel.3 /usr/share/man/man3/clog10=
f.3 /usr/share/man/man3/fmtmsg.3 /usr/share/man/man3/strcasecmp.3 /usr/shar=
e/man/man2/fchown.2 /usr/share/man/man3/nanf.3 /usr/share/man/man3/j1.3 /us=
r/share/man/man2/swapon.2 /usr/share/man/man3/unsetenv.3 /usr/share/man/man=
2/readlinkat.2"
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
packages/i586-poky-linux/metacity/metacity-doc: FILELIST: added "/usr/share=
/gnome/help/creating-metacity-themes/C/creating-metacity-themes.xml"
packages/i586-poky-linux/metacity/metacity-doc: PKGSIZE changed from 6979 t=
o 27989 (+301%)
  * FILELIST: added "/usr/share/gnome/help/creating-metacity-themes/C/creat=
ing-metacity-themes.xml"
packages/i586-poky-linux/metacity/metacity: FILELIST: removed "/usr/share/g=
nome/help/creating-metacity-themes/C/creating-metacity-themes.xml"
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
packages/i586-poky-linux/quota/quota-dbg: RRECOMMENDS: added "libwrap-dbg"
packages/i586-poky-linux/quota/quota-dev: RRECOMMENDS: added "libwrap-dev"
packages/i586-poky-linux/quota/quota: RDEPENDS: added "libwrap (>=3D 7.6)"
  * PR changed from "r7" to "r8"
packages/i586-poky-linux/sudo/sudo-dbg: RRECOMMENDS: added "zlib-dbg"
packages/i586-poky-linux/sudo/sudo-dev: RRECOMMENDS: added "zlib-dev"
packages/i586-poky-linux/sudo/sudo: RDEPENDS: added "zlib (>=3D 1.2.7)"
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
packages/i586-poky-linux/wget/wget-dbg: RRECOMMENDS: removed "libidn-dbg"
packages/i586-poky-linux/wget/wget-dev: RRECOMMENDS: removed "libidn-dev"
packages/i586-poky-linux/wget/wget: RDEPENDS: removed "libidn (>=3D 1.24)"
packages/i586-poky-linux/x11vnc/x11vnc-dbg: RRECOMMENDS: added "libxrandr-d=
bg"
packages/i586-poky-linux/x11vnc/x11vnc-dev: RRECOMMENDS: added "libxrandr-d=
ev"
packages/i586-poky-linux/x11vnc/x11vnc: RDEPENDS: added "libxrandr (>=3D 1.=
3.2)"

--------------020308040906000700060507--
