Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SzecH-0002xu-8V
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 04:06:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7A1sT9m002159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Aug 2012 18:54:29 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 9 Aug 2012 18:54:28 -0700
Message-ID: <502469D3.50407@windriver.com>
Date: Fri, 10 Aug 2012 09:54:27 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1344341416.git.wenzong.fan@windriver.com>	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
	<4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
	<502202B0.3060005@windriver.com>
	<359FE728-11F8-46F1-A134-B3A34F895EC6@dominion.thruhere.net>
	<50232C52.8040201@windriver.com> <5023C1C5.3040202@linux.intel.com>
In-Reply-To: <5023C1C5.3040202@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Fri, 10 Aug 2012 02:06:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 09:57 PM, Saul Wold wrote:
> On 08/09/2012 06:19 AM, wenzong fan wrote:
>> On 08/08/2012 04:44 PM, Koen Kooi wrote:
>>>
>>> Op 8 aug. 2012, om 08:09 heeft wenzong fan<wenzong.fan@windriver.com>
>>> het volgende geschreven:
>>>
>>>> On 08/07/2012 08:23 PM, Koen Kooi wrote:
>>>>>
>>>>> Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het
>>>>> volgende geschreven:
>>>>>
>>>>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>>>>
>>>>>> Fix the warning form pcmciautils building:
>>>>>>
>>>>>> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
>>>>>> base_prefix, requires a shared library under exec_prefix (/usr):
>>>>>> libsysfs.so.2 => /usr/lib/libsysfs.so.2"
>>>>>>
>>>>>> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
>>>>>> to "/lib*" instead of "/usr/lib*".
>>>>>>
>>>>>> [YOCTO #2907]
>>>>>>
>>>>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>>>>> ---
>>>>>> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 4 +++-
>>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>>> b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>>> index 3e4fdda..f01d19b 100644
>>>>>> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>>> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>>>> @@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
>>>>>> LIC_FILES_CHKSUM =
>>>>>> "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
>>>>>>
>>>>>> file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
>>>>>>
>>>>>> file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
>>>>>> -PR = "r3"
>>>>>> +PR = "r4"
>>>>>>
>>>>>> SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
>>>>>> file://sysfsutils-2.0.0-class-dup.patch \
>>>>>> @@ -24,3 +24,5 @@ PACKAGES =+ "libsysfs libsysfs-dev
>>>>>> libsysfs-staticdev"
>>>>>> FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
>>>>>> FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>>>>>> FILES_libsysfs-staticdev = "${libdir}/lib*.a"
>>>>>
>>>>> Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Yep, this works but looks confused, do you mean the 'export libdir'
>> should be put ahead of FILES_lib*?
>>
>> From the build logs, only change is $libdir: '/usr/lib -> /lib',
>> details please refer to attached file.
>>
> Wenzong,
> We are looking for buildhistory info, not a diff of your build log.
>
> buildhistory can be activated as follows in your local.conf:
>
> INHERIT += "buildhistory"
> BUILDHISTORY_COMMIT = "1"
>
> Then you can build before and after your change, and use the script
> buildhistory_diff to produce the output we are looking for.

Re-send this because oe-core list was broken yesterday.

Saul,

Thanks for let me know this, it's really cool. The buildhistory diff are:

----------------------------------
commit b6d84f2a1f755e391596e9a6a38167a6c0657b0a
Author: buildhistory <buildhistory@poky>
Date:   Thu Aug 9 20:37:23 2012 +0800

     packages: Build 201208092036 of poky 1.2+snapshot-20120809 for 
machine qemux86 on usp-ub1204-64

diff --git a/packages/i586-poky-linux/sysfsutils/libsysfs-dev/latest 
b/packages/i586-poky-linux/sysfsutils/libsysfs-dev/latest
index d9477cd..565cfbf 100644
--- a/packages/i586-poky-linux/sysfsutils/libsysfs-dev/latest
+++ b/packages/i586-poky-linux/sysfsutils/libsysfs-dev/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS = libsysfs
  RRECOMMENDS = eglibc-dev
  PKGSIZE = 16307
-FILES = /usr/lib/lib*.so /usr/include
-FILELIST = /usr/include/sysfs/dlist.h /usr/include/sysfs/libsysfs.h 
/usr/lib/libsysfs.so
+FILES = /lib/lib*.so /usr/include
+FILELIST = /lib/libsysfs.so /usr/include/sysfs/dlist.h 
/usr/include/sysfs/libsysfs.h
diff --git 
a/packages/i586-poky-linux/sysfsutils/libsysfs-staticdev/latest 
b/packages/i586-poky-linux/sysfsutils/libsysfs-staticdev/latest
index cac1061..6507d26 100644
--- a/packages/i586-poky-linux/sysfsutils/libsysfs-staticdev/latest
+++ b/packages/i586-poky-linux/sysfsutils/libsysfs-staticdev/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS =
  RRECOMMENDS =
  PKGSIZE = 171740
-FILES = /usr/lib/lib*.a
-FILELIST = /usr/lib/libsysfs.a
+FILES = /lib/lib*.a
+FILELIST = /lib/libsysfs.a
diff --git a/packages/i586-poky-linux/sysfsutils/libsysfs/latest 
b/packages/i586-poky-linux/sysfsutils/libsysfs/latest
index 8fb74a6..575f971 100644
--- a/packages/i586-poky-linux/sysfsutils/libsysfs/latest
+++ b/packages/i586-poky-linux/sysfsutils/libsysfs/latest
@@ -4,5 +4,5 @@ PKG = libsysfs2
  RDEPENDS = eglibc (>= 2.16)
  RRECOMMENDS =
  PKGSIZE = 42781
-FILES = /usr/lib/lib*.so.*
-FILELIST = /usr/lib/libsysfs.so.2 /usr/lib/libsysfs.so.2.0.1
+FILES = /lib/lib*.so.*
+FILELIST = /lib/libsysfs.so.2 /lib/libsysfs.so.2.0.1
diff --git a/packages/i586-poky-linux/sysfsutils/sysfsutils-dbg/latest 
b/packages/i586-poky-linux/sysfsutils/sysfsutils-dbg/latest
index e575683..851e8de 100644
--- a/packages/i586-poky-linux/sysfsutils/sysfsutils-dbg/latest
+++ b/packages/i586-poky-linux/sysfsutils/sysfsutils-dbg/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS =
  RRECOMMENDS = eglibc-dbg libsysfs-dbg sysfsutils (= 2.1.0-r3)
  PKGSIZE = 333084
-FILES = /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug 
/usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug 
/usr/lib/sysfsutils/.debug /usr/lib/matchbox-panel/.debug /usr/src/debug
-FILELIST = /usr/bin/.debug/dlist_test /usr/bin/.debug/get_device 
/usr/bin/.debug/get_driver /usr/bin/.debug/get_module 
/usr/bin/.debug/systool /usr/lib/.debug/libsysfs.so 
/usr/lib/.debug/libsysfs.so.2 /usr/lib/.debug/libsysfs.so.2.0.1 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/names.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/names.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/systool.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/include/dlist.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/include/libsysfs.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/dlist.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_attr.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_bus.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_class.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_device.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_driver.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_module.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_utils.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/dlist_test.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_device.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_driver.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_module.c
+FILES = /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug 
/lib/.debug /bin/.debug /sbin/.debug /lib/.debug /lib/sysfsutils/.debug 
/lib/matchbox-panel/.debug /usr/src/debug
+FILELIST = /lib/.debug/libsysfs.so /lib/.debug/libsysfs.so.2 
/lib/.debug/libsysfs.so.2.0.1 /usr/bin/.debug/dlist_test 
/usr/bin/.debug/get_device /usr/bin/.debug/get_driver 
/usr/bin/.debug/get_module /usr/bin/.debug/systool 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/names.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/names.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/cmd/systool.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/include/dlist.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/include/libsysfs.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/dlist.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs.h 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_attr.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_bus.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_class.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_device.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_driver.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_module.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/lib/sysfs_utils.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/dlist_test.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_device.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_driver.c 
/usr/src/debug/sysfsutils-2.1.0-r3/sysfsutils-2.1.0/test/get_module.c
diff --git a/packages/i586-poky-linux/sysfsutils/sysfsutils-dev/latest 
b/packages/i586-poky-linux/sysfsutils/sysfsutils-dev/latest
index b63aae5..b0dcbe3 100644
--- a/packages/i586-poky-linux/sysfsutils/sysfsutils-dev/latest
+++ b/packages/i586-poky-linux/sysfsutils/sysfsutils-dev/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS = sysfsutils (= 2.1.0-r3)
  RRECOMMENDS = eglibc-dev libsysfs-dev
  PKGSIZE = 918
-FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la 
/usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal 
/lib/*.o /usr/lib/sysfsutils/*.la /lib/*.la
-FILELIST = /usr/lib/libsysfs.la
+FILES = /usr/include /lib/lib*.so /lib/lib*.so /lib/*.la /lib/*.o 
/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o 
/lib/sysfsutils/*.la /lib/*.la
+FILELIST = /lib/libsysfs.la
diff --git 
a/packages/i586-poky-linux/sysfsutils/sysfsutils-staticdev/latest 
b/packages/i586-poky-linux/sysfsutils/sysfsutils-staticdev/latest
index f42e82b..14e2fda 100644
--- a/packages/i586-poky-linux/sysfsutils/sysfsutils-staticdev/latest
+++ b/packages/i586-poky-linux/sysfsutils/sysfsutils-staticdev/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS = sysfsutils-dev (= 2.1.0-r3)
  RRECOMMENDS =
  PKGSIZE = 0
-FILES = /usr/lib/*.a /lib/*.a /usr/lib/sysfsutils/*.a
+FILES = /lib/*.a /lib/*.a /lib/sysfsutils/*.a
  FILELIST =
diff --git a/packages/i586-poky-linux/sysfsutils/sysfsutils/latest 
b/packages/i586-poky-linux/sysfsutils/sysfsutils/latest
index 31888df..123f33c 100644
--- a/packages/i586-poky-linux/sysfsutils/sysfsutils/latest
+++ b/packages/i586-poky-linux/sysfsutils/sysfsutils/latest
@@ -3,5 +3,5 @@ PR = r3
  RDEPENDS = eglibc (>= 2.16) libsysfs (>= 2.1.0)
  RRECOMMENDS =
  PKGSIZE = 39360
-FILES = /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc 
/com /var /bin/* /sbin/* /lib/*.so.* /usr/share/sysfsutils 
/usr/lib/sysfsutils/* /usr/share/pixmaps /usr/share/applications 
/usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers
+FILES = /usr/bin/* /usr/sbin/* /usr/libexec/* /lib/lib*.so.* /etc /com 
/var /bin/* /sbin/* /lib/*.so.* /usr/share/sysfsutils /lib/sysfsutils/* 
/usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf 
/usr/share/sounds /lib/bonobo/servers
  FILELIST = /usr/bin/dlist_test /usr/bin/get_device /usr/bin/get_driver 
/usr/bin/get_module /usr/bin/systool
-------------------------------

Thanks
Wenzong

>
> Thanks
> Sau!
>
>> Thanks
>> Wenzong
>>
>>>>>
>>>>>> +
>>>>>> +export libdir = "${base_libdir}"
>>>>>
>>>>> And can you post the buildhistory diff to see if anything else moved
>>>>> when it shouldn't have e.g. package config files?
>>>>
>>>> I make a diff to the build dir, only the location of 'lib/' was moved:
>>>
>>> Please post the buildhistory diff, that is much more informative. And
>>> you haven't responded to the FILES_lib* oversight.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


