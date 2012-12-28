Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToYL8-0007U1-3P
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 12:43:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2012 03:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,369,1355126400"; d="scan'208";a="237591214"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2012 03:28:04 -0800
Message-ID: <50DD8271.4010206@intel.com>
Date: Fri, 28 Dec 2012 13:28:49 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1356619172-30115-1-git-send-email-constantinx.musca@intel.com>
	<50DC8ADB.5060503@linux.intel.com>
In-Reply-To: <50DC8ADB.5060503@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libfm: upgrade to 1.1.0
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
X-List-Received-Date: Fri, 28 Dec 2012 11:43:20 -0000
X-List-Received-Date: Fri, 28 Dec 2012 11:43:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2012 07:52 PM, Saul Wold wrote:
> On 12/27/2012 06:39 AM, Constantin Musca wrote:
>> libfm_fix_for_automake-1.12.patch: removed
>> - problem not reprodicible anymore
>>
>> configure_fix.patch: removed
>> - not used
>>
>> [Other changes]
>> - create a symbolic link from ${includedir}/libfm-1.0 to
>> ${includedir}/libfm (this is where pcmanfm looks)
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   .../libfm/libfm-0.1.17/configure_fix.patch         | 19 ---------
>>   .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch | 48 
>> ----------------------
>>   .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      | 14 +++++--
>>   3 files changed, 10 insertions(+), 71 deletions(-)
>>   delete mode 100644 
>> meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
>>   delete mode 100644 
>> meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
>>   rename meta/recipes-support/libfm/{libfm_0.1.17.bb => 
>> libfm_1.1.0.bb} (71%)
>>
>> diff --git 
>> a/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch 
>> b/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
>> deleted file mode 100644
>> index 351e6e7..0000000
>> --- a/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -Update configure.ac after docs removed in 0.1.16
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
>> -Index: libfm-0.1.16/configure.ac
>> -===================================================================
>> ---- libfm-0.1.16.orig/configure.ac    2011-10-10 15:13:21.000000000 
>> +0800
>> -+++ libfm-0.1.16/configure.ac    2011-10-10 15:13:30.000000000 +0800
>> -@@ -153,9 +153,6 @@
>> -     data/Makefile
>> -     data/ui/Makefile
>> -     po/Makefile.in
>> --    docs/Makefile
>> --    docs/reference/Makefile
>> --    docs/reference/libfm/Makefile
>> -     libfm.pc
>> -     libfm-gtk.pc
>> - ])
>> diff --git 
>> a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch 
>> b/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch 
>>
>> deleted file mode 100644
>> index 3efb4dd..0000000
>> --- 
>> a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -This patch fixes following kind of issues with automake 1.12
>> -| automake: warnings are treated as errors
>> -| data/ui/Makefile.am:21: warning: '%'-style pattern rules are a GNU 
>> make extension
>> -...
>> -| 
>> /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: 
>> warning: 'libfm-gtk.la': linking libtool libraries using a non-POSIX
>> -| 
>> /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: 
>> archiver requires 'AM_PROG_AR' in 'configure.ac'
>> -...
>> -| src/Makefile.am:21: warning: compiling 'glib-compat.c' with 
>> per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
>> -
>> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
>> -2012/05/03
>> -
>> -Index: libfm-0.1.17/configure.ac
>> -===================================================================
>> ---- libfm-0.1.17.orig/configure.ac
>> -+++ libfm-0.1.17/configure.ac
>> -@@ -4,11 +4,17 @@
>> - AC_PREREQ([2.63])
>> - AC_INIT([libfm], [0.1.17], [http://pcmanfm.sorceforge.net/])
>> - AM_INIT_AUTOMAKE([-Wall -Werror foreign])
>> -+
>> -+# automake 1.12 seems to require this, but automake 1.11 doesn't 
>> recognize it
>> -+m4_pattern_allow([AM_PROG_AR])
>> -+AM_PROG_AR
>> -+
>> - AC_CONFIG_MACRO_DIR(m4)
>> - AC_CONFIG_HEADERS([config.h])
>> -
>> - # Checks for programs.
>> - AC_PROG_CC
>> -+AM_PROG_CC_C_O
>> - AM_PROG_LIBTOOL
>> -
>> - # Checks for libraries.
>> -Index: libfm-0.1.17/data/ui/Makefile.am
>> -===================================================================
>> ---- libfm-0.1.17.orig/data/ui/Makefile.am
>> -+++ libfm-0.1.17/data/ui/Makefile.am
>> -@@ -18,6 +18,6 @@ EXTRA_DIST = \
>> -     $(NULL)
>> -
>> - # Purge GtkBuilder UI files
>> --%.ui: %.glade
>> -+.glade.ui:
>> -     cp $< $@
>> -     $(top_builddir)/src/xml-purge $@
>> diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb 
>> b/meta/recipes-support/libfm/libfm_1.1.0.bb
>> similarity index 71%
>> rename from meta/recipes-support/libfm/libfm_0.1.17.bb
>> rename to meta/recipes-support/libfm/libfm_1.1.0.bb
>> index 2cac361..95a2ca0 100644
>> --- a/meta/recipes-support/libfm/libfm_0.1.17.bb
>> +++ b/meta/recipes-support/libfm/libfm_1.1.0.bb
>> @@ -10,16 +10,22 @@ LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>>   SECTION = "x11/libs"
>>   DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native"
>>
>> -PR = "r4"
>> +PR = "r0"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
>> -           file://libfm_fix_for_automake-1.12.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "a97e03d973e6ac727f28d0934d6c9ad5"
>> -SRC_URI[sha256sum] = 
>> "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15bc7131b"
>> +SRC_URI[md5sum] = "a5bc8b8291cf810c659bfb3af378b5de"
>> +SRC_URI[sha256sum] = 
>> "b9426e588670b53570b808c49abd1d103863614dd3622559b8c3ef1392fe0b3d"
>>
>>   inherit autotools pkgconfig
>>
>> +do_install_append() {
>> +    cd ${D}/${includedir}
>> +    rm -rf ${BPN}
>> +    ln -s ${BPN}-1.0 ${BPN}
>> +    cd ${S}
>> +}
> This is not the correct way to do this kind of thing and I am not even 
> sure why you need to do this at all.  I tested unmodified libfm with 
> pcmanfm 1.1.0 and it worked correctly, I think all the extra linking 
> stuff was not needed at all.
>
> Looks like we can clean up the patches and simplify the recipe.
>
> Sau!
>
>
>> +
>>   PACKAGES += "${PN}-mime"
>>   FILES_${PN}-mime = "${datadir}/mime/"
>>
If you try to build unmodified libfm several times you will discover an 
error like this:
ERROR: Error executing a python function in 
/home/dev/yocto/poky/meta/recipes-support/libfm/libfm_1.1.0.bb:
OSError: [Errno 40] Too many levels of symbolic links: 
'/home/dev/yocto/poky-build/tmp/work/armv5te-poky-linux-gnueabi/libfm/1.1.0-r0/packages-split/libfm-dev/usr/include/libfm/libfm-1.0'

ERROR: The stack trace of python calls that resulted in this 
exception/failure was:
ERROR:   File "populate_packages", line 177, in <module>
ERROR:
ERROR:   File "populate_packages", line 147, in populate_packages
ERROR:
ERROR: The code that was being executed was:
ERROR:      0173:                bb.note("%s contains dangling symlink 
to %s" % (pkg, l))
ERROR:      0174:        d.setVar('RDEPENDS_' + pkg, 
bb.utils.join_deps(rdepends, commasep=False))
ERROR:      0175:
ERROR:      0176:
ERROR:  *** 0177:populate_packages(d)
ERROR:      0178:
ERROR: [From file: 'populate_packages', lineno: 177, function: <module>]
ERROR:      0143:                path = os.path.join(root, f)
ERROR:      0144:                rpath = path[len(inst_root):]
ERROR:      0145:                pkg_files[pkg].append(rpath)
ERROR:      0146:                try:
ERROR:  *** 0147:                    s = os.stat(path)
ERROR:      0148:                except OSError, (err, strerror):
ERROR:      0149:                    if err != errno.ENOENT:
ERROR:      0150:                        raise
ERROR:      0151:                    target = os.readlink(path)
ERROR: [From file: 'populate_packages', lineno: 147, function: 
populate_packages]
ERROR: Function failed: populate_packages
ERROR: Logfile of failure stored in: 
/home/dev/yocto/poky-build/tmp/work/armv5te-poky-linux-gnueabi/libfm/1.1.0-r0/temp/log.do_package.743


The files from the package dir look like this:
libfm/1.1.0-r0/package/usr/include:
total 8.0K
drwxr-xr-x 2 costin costin 4.0K Dec 28 11:48 libfm/
drwxr-xr-x 2 costin costin 4.0K Dec 28 11:48 libfm-1.0/
libfm/1.1.0-r0/package/usr/include/libfm:
total 0
lrwxrwxrwx 1 costin costin 9 Dec 28 11:48 libfm-1.0 -> libfm-1.0


The problem is that we have the following definition in src/Makefile.am:
     pkginclude_HEADERS = \
         $(LIBFM_INCLUDES) \
         $(LIBFM_GTK_INCLUDES) \
         $(NULL)

Automake autogenerates from this definition code that creates 
pkgincludedir which is (${includedir}/libfm}. Thus we have a race 
condition between the code that creates pkgincludedir and the code that 
tries to symlink ${includedir}/libfm-1.0 to ${includedir}/libfm. More 
details can be found in patch v3. I hope now everything is clear.


Cheers,
Constantin


