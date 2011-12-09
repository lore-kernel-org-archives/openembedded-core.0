Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYqal-0004eE-24
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 03:53:43 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 4AA1BC9A0
	for <openembedded-core@openembedded.org>;
	Fri,  9 Dec 2011 03:24:13 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjYeAIpw4U5T4zgTPGdsb2JhbAAMHRqnY4MfAQEBATeCJAEBAQEDAQEBNTYKEQsVAwkUAg8JAwIBAgEPBgEbFBMGAgEBiAsjtxmICIMzBJJHgiSKaYc+
X-IronPort-AV: E=Sophos;i="4.71,323,1320620400"; d="scan'208";a="233745195"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 09 Dec 2011 03:21:54 +0100
Message-ID: <4EE170C6.2070201@emagii.com>
Date: Fri, 09 Dec 2011 03:21:58 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@openembedded.org
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
	<20111207215306.GE6351@sakrah.homelinux.org>
In-Reply-To: <20111207215306.GE6351@sakrah.homelinux.org>
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 09 Dec 2011 02:53:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-07 22:53, Khem Raj wrote:
> On (07/12/11 11:34), Beth Flanagan wrote:
>> From: Christopher Larson<kergoth@gmail.com>
>>
>> Deploys sources for recipes for compliance with copyleft-style licenses
>> Defaults to using symlinks, as it's a quick operation, and one can easily
>> follow the links when making use of the files (e.g. tar with the -h arg).
>>
>> By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
>>
>> Signed-off-by: Christopher Larson<kergoth@gmail.com>
>> ---
>>   meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
>>   1 files changed, 94 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/classes/copyleft_compliance.bbclass
>>
>> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
>> new file mode 100644
>> index 0000000..5d9ab11
>> --- /dev/null
>> +++ b/meta/classes/copyleft_compliance.bbclass
>> @@ -0,0 +1,94 @@
>> +# Deploy sources for recipes for compliance with copyleft-style licenses
>> +# Defaults to using symlinks, as it's a quick operation, and one can easily
>> +# follow the links when making use of the files (e.g. tar with the -h arg).
>> +#
>> +# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
>> +#
>> +# vi:sts=4:sw=4:et
>> +
>> +COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
>> +
>> +COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
>> +COPYLEFT_LICENSE_INCLUDE[type] = 'list'
>> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
If the Ampersand is not accepted in the LICENSE string, then the recipes 
below are broken.

 From my latest build, at least recipes with "&&" fail...
This means that nothing really completes that I have tested.

MAJOR BREAKAGE!!!!

I think it would be better FIRST to fix the recipes, and then introduce 
checking.
BR
Ulf


meta-bugfix/meta/recipes-connectivity/connman/connman-gnome_0.5.bb:LICENSE 
= "GPLv2 & LGPLv2.1"
meta-openembedded/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
meta-openembedded/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:LICENSE 
= "GPLv2 && LGPLv2"
meta-openembedded/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
meta-openembedded/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb:LICENSE 
= "LGPLv2 & LGPLv2+ & LGPLv2.1+"
meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb:LICENSE="GPLv2 
&& LGPLv2"
meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:LICENSE="GPLv2 
&& LGPLv2"
meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonobo.inc:LICENSE 
= "GPLv2 && LGPLv2.1"
meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb:LICENSE 
= "GPLv2 && LGPLv2.1"
meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:LICENSE 
= "GPLv2 & LGPLv2"
meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb:LICENSE 
= "GPLv2 & LGPLv2"
meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:LICENSE 
= "GPLv2 && LGPLv2 && GFDLv1.1"
meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:LICENSE 
= "GPLv2 && LGPLv2 && GFDLv1.1"
meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:LICENSE 
= "GPLv2 && LGPLv2.1"
meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb:LICENSE 
= "LGPLv2 && GPLv2"
meta-openembedded/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb:LICENSE = 
"GPLv2 && LGPLv2.1"
meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb:LICENSE 
= "LGPLv2 && GPLv2"
meta-openembedded/meta-oe/recipes-connectivity/obex/openobex_1.5.bb:LICENSE 
= "GPLv2 && LGPLv2.1"
meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm.inc:LICENSE = 
"LGPLv2.1 && GPLv2"
meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb:LICENSE 
= "MIT && zlib"
meta-openembedded/meta-oe/recipes-devtools/python/python-numeric_24.2.bb:LICENSE 
= "PSF & LLNL"
meta-openembedded/meta-oe/recipes-devtools/swig/swig.inc:LICENSE = "BSD 
&& GPLv3"
meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-4.5.inc:LICENSE="GCC 
RUNTIME LIBRARY EXCEPTION & GPLv2 & GPLv3 & LGPLv2.1 & LGPLv3"
meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm.inc:LICENSE = 
"LGPLv2.1 && GPLv2"
meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb:LICENSE = 
"GPLv2+ & LGPLv2.1+"
meta-openembedded/meta-oe/recipes-core/udev/udev_173.bb:LICENSE = 
"GPLv2+ & LGPLv2.1+"
meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb:LICENSE 
= "GPLv2 & LGPLv2"
meta-openembedded/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb:LICENSE 
= "GPLv2+ && BSD"
meta-openembedded/meta-oe/recipes-support/debianutils/debianutils_2.30.bb:LICENSE 
= "GPLv2 & BSD & SMAIL_GPL"
meta-openembedded/meta-oe/recipes-support/mpfr/mpfr_3.0.0.bb:LICENSE="GPLv3&LGPLv3"
meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.8.6.bb:LICENSE = 
"GPLv2&LGPLv2"
meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.8.5.bb:LICENSE = 
"GPLv2&LGPLv2"
meta-openembedded/meta-oe/recipes-support/lvm2/lvm2.inc:LICENSE = "GPLv2 
&& LGPLv2"
meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb:LICENSE 
= "LGPLv2.1 && GPLv2"
meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb:LICENSE_URL 
= "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb:LICENSE 
= "GPLv2 & Other"
meta-ti/recipes-misc/payload/beaglebone-getting-started.bb:LICENSE = 
"GPLv2+ && MIT && PD && others"
openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb:LICENSE = 
"FDLv1.2 & GPLv2+ & LGPLv2.1+ & BSD"
openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb:LICENSE 
= "LGPLv2.1 & GPLv2+"
openembedded-core/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb:LICENSE 
= "GPLv2 & LGPLv2+"
openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio.inc:LICENSE 
= "GPLv2+ & LGPLv2.1"
openembedded-core/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb:LICENSE 
= "GPLv2 & MIT"
openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb:LICENSE 
= "GPLv2+ & LGPLv2.1+ & LGPLv2+"
openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb:LICENSE 
= "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb:LICENSE 
= "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb:LICENSE 
= "GPLv2+ & LGPLv2.1+"
openembedded-core/meta/classes/src_distribute.bbclass:    licenses = 
d.getVar('LICENSE', 1).replace('&', '|')
openembedded-core/meta/classes/license.bbclass:                
pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  
*/ /g; p }' ${filename})"
openembedded-core/meta/recipes-connectivity/bluez/bluez4.inc:LICENSE = 
"GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb:LICENSE = 
"ISC & BSD"
openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb:LICENSE 
= "GPLv2 & (LGPL | MPL | BSD)"
openembedded-core/meta/recipes-connectivity/gypsy/gypsy_git.bb:LICENSE = 
"GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-connectivity/gypsy/gypsy_0.8.bb:LICENSE = 
"GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-connectivity/avahi/avahi.inc:LICENSE = 
"GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-connectivity/connman/connman-gnome_0.5.bb:LICENSE 
= "GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb:LICENSE = 
"BSD & GPLv2+ & LGPLv2+ & PD"
openembedded-core/meta/recipes-connectivity/gsm/gsmd.inc:LICENSE = 
"GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-gnome/gtk+/gtk+.inc:LICENSE = "LGPLv2 & 
LGPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-gnome/libglade/libglade_2.6.4.bb:LICENSE 
= "LGPLv2 & LGPLv2+"
openembedded-core/meta/recipes-gnome/gnome/gnome-desktop.inc:LICENSE = 
"GPLv2 & LGPLv2"
openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-gnome/gnome/gnome-doc-utils.inc:LICENSE = 
"GPL & LGPL"
openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb:LICENSE 
= "LGPLv2 & LGPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb:LICENSE 
= "GPLv2 & GPLv2+"
openembedded-core/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb:LICENSE 
= "GPLv2+ & LGPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-extended/quota/quota_4.00-pre1.bb:LICENSE 
= "BSD & GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-extended/sudo/sudo.inc:LICENSE = "ISC & 
UCB & Zlib"
openembedded-core/meta/recipes-extended/sysklogd/sysklogd.inc:LICENSE = 
"GPLv2+ & BSD"
openembedded-core/meta/recipes-extended/xz/xz_5.0.3.bb:LICENSE = "GPLv2+ 
& GPLv3+ & LGPLv2.1+"
openembedded-core/meta/recipes-extended/cronie/cronie_1.4.8.bb:LICENSE = 
"ISC & BSD"
openembedded-core/meta/recipes-extended/libidn/libidn_0.6.14.bb:LICENSE 
= "LGPLv2.1+ & GPLv2+"
openembedded-core/meta/recipes-extended/libidn/libidn_1.22.bb:LICENSE = 
"LGPLv2.1+ & GPLv3+"
openembedded-core/meta/recipes-extended/iputils/iputils_s20101006.bb:LICENSE 
= "BSD & GPLv2+"
openembedded-core/meta/recipes-extended/bc/bc_1.06.bb:LICENSE = "GPLv2+ 
& LGPLv2.1"
openembedded-core/meta/recipes-extended/mailx/mailx_12.5.bb:LICENSE = 
"BSD & MPL-1"
openembedded-core/meta/recipes-extended/procps/procps.inc:LICENSE = 
"GPLv2+ & LGPLv2+"
openembedded-core/meta/files/common-licenses/CDDL-1.0:COVERED SOFTWARE 
IS PROVIDED UNDER THIS LICENSE ON AN &#8220;AS IS&#8221; BASIS, WITHOUT 
WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT 
LIMITATION, WARRANTIES THAT THE COVERED SOFTWARE IS FREE OF DEFECTS, 
MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE 
RISK AS TO THE QUALITY AND PERFORMANCE OF THE COVERED SOFTWARE IS WITH 
YOU. SHOULD ANY COVERED SOFTWARE PROVE DEFECTIVE IN ANY RESPECT, YOU 
(NOT THE INITIAL DEVELOPER OR ANY OTHER CONTRIBUTOR) ASSUME THE COST OF 
ANY NECESSARY SERVICING, REPAIR OR CORRECTION. THIS DISCLAIMER OF 
WARRANTY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE. NO USE OF ANY 
COVERED SOFTWARE IS AUTHORIZED HEREUNDER EXCEPT UNDER THIS DISCLAIMER.
openembedded-core/meta/files/common-licenses/CPAL-1.0:COVERED CODE IS 
PROVIDED UNDER THIS LICENSE ON AN &#8220;AS IS&#8221; BASIS, WITHOUT 
WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT 
LIMITATION, WARRANTIES THAT THE COVERED CODE IS FREE OF DEFECTS, 
MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE 
RISK AS TO THE QUALITY AND PERFORMANCE OF THE COVERED CODE IS WITH YOU. 
SHOULD ANY COVERED CODE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE 
INITIAL DEVELOPER, ORIGINAL DEVELOPER OR ANY OTHER CONTRIBUTOR) ASSUME 
THE COST OF ANY NECESSARY SERVICING, REPAIR OR CORRECTION. THIS 
DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE. NO 
USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER THIS 
DISCLAIMER.
openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb:LICENSE 
= "(GPL-2+ & Elfutils-Exception)"
openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc:LICENSE 
= "GPLv2 & LGPLv2 & BSD & MIT"
openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb:LICENSE 
= "GPLv2 & GPLv2+ & BSD"
openembedded-core/meta/recipes-devtools/gdb/gdb_7.3.1.bb:LICENSE="GPLv2 
& GPLv3 & LGPLv2 & LGPLv3"
openembedded-core/meta/recipes-devtools/python/python-pycairo_1.8.10.bb:LICENSE 
= "LGPLv2.1 & MPL-1"
openembedded-core/meta/recipes-devtools/gcc/gcc-4.6.inc:LICENSE="GPL-3.0-with-GCC-exception 
& GPLv3"
openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb:LICENSE 
= "GPL-2 & PD"
openembedded-core/meta/recipes-devtools/libtool/libtool-2.4.2.inc:LICENSE = 
"GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb:LICENSE = 
"GPLv2 & GPLv3"
openembedded-core/meta/recipes-devtools/qemu/qemu.inc:LICENSE = "GPLv2 & 
LGPLv2.1"
openembedded-core/meta/recipes-devtools/make/make_3.82.bb:LICENSE="GPLv3&LGPLv2"
openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb:LICENSE 
= "GPL-3+ & LGPL-2.1+"
openembedded-core/meta/recipes-core/glib-2.0/glib.inc:LICENSE = "LGPLv2+ 
& BSD & PD"
openembedded-core/meta/recipes-core/busybox/busybox.inc:LICENSE = "GPLv2 
& BSD-4-Clause"
openembedded-core/meta/recipes-core/udev/udev-new.inc:LICENSE = "GPLv2+ 
& LGPLv2.1+"
openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:LICENSE 
= "GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-core/eglibc/eglibc-locale.inc:LICENSE = 
"GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-core/eglibc/eglibc-common.inc:LICENSE = 
"GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-core/util-linux/util-linux.inc:LICENSE = 
"GPLv2+ & LGPLv2.1+ & BSD"
openembedded-core/meta/recipes-kernel/oprofile/oprofile.inc:LICENSE = 
"LGPLv2.1+ & GPLv2"
openembedded-core/meta/recipes-kernel/lttng/lttng-ust_0.15.bb:LICENSE = 
"LGPLv2.1+ & BSD"
openembedded-core/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb:LICENSE 
= "GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-sato/pimlico/contacts.inc:LICENSE = 
"GPLv2 & GPLv2+ & GPLv3+ "
openembedded-core/meta/recipes-sato/pimlico/tasks.inc:LICENSE = "GPLv2 & 
GPLv2+"
openembedded-core/meta/recipes-sato/pimlico/dates.inc:LICENSE = "GPLv2 & 
GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb:LICENSE 
= "GPLv2 & GPLv2+"
openembedded-core/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb:LICENSE 
= "GPLv2+ & LGPLv2+"
openembedded-core/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc:LICENSE 
= "LGPLv2.1 & LGPLv2+"
openembedded-core/meta/recipes-sato/libowl/libowl_git.bb:LICENSE = 
"GPLv2 & LGPLv2+"
openembedded-core/meta/recipes-sato/eds/eds-dbus_2.20.0.bb:LICENSE = 
"LGPLv2 & LGPLv2+"
openembedded-core/meta/recipes-sato/eds/eds-dbus_git.bb:LICENSE = 
"LGPLv2 & LGPLv2+"
openembedded-core/meta/recipes-sato/owl-video-widget/owl-video_git.bb:LICENSE 
= "LGPLv2.1 & GPLv2+"
openembedded-core/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:LICENSE 
= "GPLv2 & GPLv2+"
openembedded-core/meta/recipes-sato/webkit/webkit-gtk_svn.bb:LICENSE = 
"BSD & LGPLv2+"
openembedded-core/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:LICENSE = 
"GPLv2 & GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb:LICENSE="LGPLv3&GPLv3"
openembedded-core/meta/recipes-support/libfm/libfm_0.1.17.bb:LICENSE = 
"GPLv2 & GPLv2+"
openembedded-core/meta/recipes-support/boost/boost.inc:LICENSE = "BSL-1 
& MIT & Python-2.0"
openembedded-core/meta/recipes-support/gpgme/gpgme_1.3.1.bb:LICENSE = 
"GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb:LICENSE = 
"GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-support/libcroco/libcroco_0.6.3.bb:LICENSE = 
"LGPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-support/libgdbus/libgdbus_git.bb:LICENSE 
= "GPLv2 & LGPLv2.1"
openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb:LICENSE 
= "GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/atk/atk.inc:LICENSE = "LGPLv2 & 
LGPLv2+"
openembedded-core/meta/recipes-support/gnutls/gnutls.inc:LICENSE = 
"GPLv3+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/gnutls/libtasn1_2.11.bb:LICENSE = 
"GPLv3+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/libgcrypt/libgcrypt.inc:LICENSE = 
"GPLv2+ & LGPLv2.1+"
openembedded-core/meta/recipes-support/liburcu/liburcu_0.6.4.bb:LICENSE 
= "LGPLv2.1+ & MIT-style"
openembedded-core/meta/recipes-support/libassuan/libassuan_2.0.2.bb:LICENSE 
= "GPLv3 & LGPLv2.1+"
openembedded-core/meta/recipes-support/attr/acl.inc:LICENSE = "LGPLv2.1+ 
& GPLv2+"
openembedded-core/meta/recipes-support/attr/attr.inc:LICENSE = 
"LGPLv2.1+ & GPLv2+"
openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb:LICENSE="GPLv3&LGPLv3"
openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb:LICENSE = 
"GPLv2 & GPLv2+"
openembedded-core/meta/recipes-graphics/cairo/cairo.inc:LICENSE = "MPL-1 
& LGPLv2.1"
openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb:LICENSE 
= "MIT & PD"
openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb:LICENSE 
= "BSD & MIT"
openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:LICENSE 
= "MIT-X & GPLv2+"
openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb:LICENSE 
= "MIT-style & MIT & PD"
openembedded-core/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb:LICENSE 
= "GPLv2 & GPLv2+"
openembedded-core/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/videoproto_2.3.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb:LICENSE 
= "MIT & MIT-style & BSD"
openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb:LICENSE = 
"MIT & MIT-style & PD"
openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb:LICENSE= 
"MIT & MIT-style & BSD"
openembedded-core/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb:LICENSE 
= "MIT & MIT-style"
openembedded-core/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb:LICENSE 
= "MIT & MIT-style & BSD"
openembedded-core/meta/recipes-graphics/xorg-lib/libx11.inc:LICENSE = 
"MIT & MIT-style & BSD"
openembedded-core/meta/recipes-rt/rt-tests/rt-tests_0.83.bb:LICENSE = 
"GPLv2 & GPLv2+"




>> +
>> +COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
>> +COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
>> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
>> +
>> +
>> +def copyleft_should_include(d):
>> +    """Determine if this recipe's sources should be deployed for compliance"""
>> +    import ast
>> +    import oe.license
>> +    from fnmatch import fnmatchcase as fnmatch
>> +
>> +    if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crossdk'):
> we do ship some of them in SDK so IMO they should not be excluded.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



