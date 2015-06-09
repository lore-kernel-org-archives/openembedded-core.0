Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0FD72491
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 10:15:40 +0000 (UTC)
Received: by laew7 with SMTP id w7so8596290lae.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yeNxVGfRmhwkO6WT2Jacf+xPizXAtN/y/9hX/Iiko+8=;
	b=QcxSAWe8DvW5wJwy+pgEz6vZJDvMTxf+8x36kXUsk6otn2ZA8mHeOvd5aALq3zFfya
	Lp9ckRI0AYlEEoh703C3bO23aGBYsG7CrH4jTUbvRpcI9lG6Dwdj5QpSW7AC5lS4Ak6N
	7ZLPDqmETp2CdSQ3oJXMlxFZYD8aizTGHbRQDemnUntH97WYka84nKKFcQtYsnKv2R29
	yWN+Hpo07OQEdrJ5LuOND39TSDebcKAYdGT/ej57b87iSOMor+Oc0vb+FRH5gG8moyfw
	nqc/xt83d3qGS97HI+tIe8b21/AvU8nmiGv/a36Mkdp0ue4l4nmzlMiab+R/SWwJm/6q
	+P8w==
X-Received: by 10.152.29.234 with SMTP id n10mr21743777lah.101.1433844940947; 
	Tue, 09 Jun 2015 03:15:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.71 with HTTP; Tue, 9 Jun 2015 03:15:20 -0700 (PDT)
In-Reply-To: <CAPybu_2fphBYPGe97YEi-hVkWtp-8euP67T0c3qQruk_PG5YrA@mail.gmail.com>
References: <1433844421-17272-1-git-send-email-ricardo.ribalda@gmail.com>
	<5576BBFA.2030802@topic.nl>
	<CAPybu_2fphBYPGe97YEi-hVkWtp-8euP67T0c3qQruk_PG5YrA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 9 Jun 2015 12:15:20 +0200
Message-ID: <CAPybu_22wysAXSYEj9DMGPy_7WxCCn+yin_J=tyVyiYfdq1Q3Q@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Upgrade to 3.0
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
X-List-Received-Date: Tue, 09 Jun 2015 10:15:44 -0000
Content-Type: text/plain; charset=UTF-8

And shall I give it a negative preference?


On Tue, Jun 9, 2015 at 12:13 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> shall I leave both then?
>
> On Tue, Jun 9, 2015 at 12:12 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> OpenCV 3 is not backwards compatible, removing 2.x will break any recipe
>> currently using OpenCV.
>>
>>
>>
>>
>> On 09-06-15 12:07, Ricardo Ribalda Delgado wrote:
>>>
>>> -Support for new PACKAGECONFIGS
>>> -Merge with opencv-samples
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> ---
>>>   .../recipes-support/opencv/opencv-samples_2.4.bb   |  39 -------
>>>   meta-oe/recipes-support/opencv/opencv_2.4.bb       |  99
>>> ----------------
>>>   meta-oe/recipes-support/opencv/opencv_3.0.bb       | 125
>>> +++++++++++++++++++++
>>>   3 files changed, 125 insertions(+), 138 deletions(-)
>>>   delete mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
>>>   delete mode 100644 meta-oe/recipes-support/opencv/opencv_2.4.bb
>>>   create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
>>>
>>> diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
>>> b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
>>> deleted file mode 100644
>>> index 9d862fe910f7..000000000000
>>> --- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
>>> +++ /dev/null
>>> @@ -1,39 +0,0 @@
>>> -SUMMARY = "Opencv : The Open Computer Vision Library"
>>> -HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
>>> -SECTION = "libs"
>>> -LICENSE = "BSD"
>>> -
>>> -DEPENDS = "opencv"
>>> -
>>> -LIC_FILES_CHKSUM =
>>> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14
>>> \
>>> -"
>>> -SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
>>> -SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
>>> -          "
>>> -PV = "2.4.3+git${SRCPV}"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -
>>> -do_install() {
>>> -    cd samples/c
>>> -    install -d ${D}/${bindir}
>>> -    install -d ${D}/${datadir}/opencv/samples
>>> -
>>> -    cp * ${D}/${datadir}/opencv/samples || true
>>> -
>>> -    for i in *.c; do
>>> -        echo "compiling $i"
>>> -        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o
>>> `basename $i .c` $i `pkg-config --libs opencv` || true
>>> -        install -m 0755 `basename $i .c` ${D}/${bindir} || true
>>> -        rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true
>>> -    done
>>> -    for i in *.cpp; do
>>> -        echo "compiling $i"
>>> -        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o
>>> `basename $i .cpp` $i `pkg-config --libs opencv` || true
>>> -        install -m 0755 `basename $i .cpp` ${D}/${bindir} || true
>>> -        rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true
>>> -    done
>>> -}
>>> -
>>> -FILES_${PN}-dev += "${datadir}/opencv/samples/*.c*
>>> ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*"
>>> -FILES_${PN} += "${bindir} ${datadir}/opencv"
>>> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb
>>> b/meta-oe/recipes-support/opencv/opencv_2.4.bb
>>> deleted file mode 100644
>>> index 27546161d21f..000000000000
>>> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
>>> +++ /dev/null
>>> @@ -1,99 +0,0 @@
>>> -SUMMARY = "Opencv : The Open Computer Vision Library"
>>> -HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
>>> -SECTION = "libs"
>>> -
>>> -LICENSE = "BSD"
>>> -LIC_FILES_CHKSUM =
>>> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
>>> -
>>> -ARM_INSTRUCTION_SET = "arm"
>>> -
>>> -DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
>>> glib-2.0"
>>> -
>>> -SRCREV = "2c9547e3147779001811d01936aed38f560929fc"
>>> -SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4"
>>> -
>>> -PV = "2.4.11+git${SRCPV}"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -
>>> -# Do an out-of-tree build
>>> -OECMAKE_SOURCEPATH = "${S}"
>>> -OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
>>> -
>>> -EXTRA_OECMAKE =
>>> "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include
>>> \
>>> -                 -DBUILD_PYTHON_SUPPORT=ON \
>>> -                 -DWITH_GSTREAMER=OFF \
>>> -                 -DWITH_1394=OFF \
>>> -                 -DCMAKE_SKIP_RPATH=ON \
>>> -                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
>>> "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
>>> -                 ${@base_conditional("libdir", "/usr/lib64",
>>> "-DLIB_SUFFIX=64", "", d)} \
>>> -                 ${@base_conditional("libdir", "/usr/lib32",
>>> "-DLIB_SUFFIX=32", "", d)} \
>>> -"
>>> -
>>> -PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
>>> -                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",
>>> "", d)}"
>>> -PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
>>> -PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
>>> -PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
>>> -PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
>>> -PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
>>> -PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
>>> -PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
>>> -PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
>>> -
>>> -inherit distutils-base pkgconfig cmake
>>> -
>>> -export BUILD_SYS
>>> -export HOST_SYS
>>> -export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>> -export PYTHON="${STAGING_BINDIR_NATIVE}/python"
>>> -
>>> -TARGET_CC_ARCH += "-I${S}/include "
>>> -
>>> -PACKAGES += "${PN}-apps python-opencv"
>>> -
>>> -python populate_packages_prepend () {
>>> -    cv_libdir = d.expand('${libdir}')
>>> -    cv_libdir_dbg = d.expand('${libdir}/.debug')
>>> -    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev', allow_links=True)
>>> -    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev')
>>> -    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev')
>>> -    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV
>>> %s library', extra_depends='', allow_links=True)
>>> -
>>> -    pn = d.getVar('PN', 1)
>>> -    metapkg =  pn + '-dev'
>>> -    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>>> -    blacklist = [ metapkg ]
>>> -    metapkg_rdepends = [ ]
>>> -    packages = d.getVar('PACKAGES', 1).split()
>>> -    for pkg in packages[1:]:
>>> -        if not pkg in blacklist and not pkg in metapkg_rdepends and
>>> pkg.endswith('-dev'):
>>> -            metapkg_rdepends.append(pkg)
>>> -    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
>>> -}
>>> -
>>> -PACKAGES_DYNAMIC += "^libopencv-.*"
>>> -
>>> -FILES_${PN} = ""
>>> -FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
>>> -FILES_${PN}-dbg += "${libdir}/.debug"
>>> -FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>> -FILES_${PN}-doc = "${datadir}/OpenCV/doc"
>>> -
>>> -ALLOW_EMPTY_${PN} = "1"
>>> -
>>> -INSANE_SKIP_python-opencv = "True"
>>> -SUMMARY_python-opencv = "Python bindings to opencv"
>>> -FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
>>> -RDEPENDS_python-opencv = "python-core python-numpy"
>>> -
>>> -do_install_append() {
>>> -    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
>>> -    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
>>> -
>>> -    # Move Python files into correct library folder (for multilib build)
>>> -    if [ "$libdir" != "/usr/lib" ]; then
>>> -        mv ${D}/usr/lib/* ${D}/${libdir}/
>>> -        rm -rf ${D}/usr/lib
>>> -    fi
>>> -}
>>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb
>>> b/meta-oe/recipes-support/opencv/opencv_3.0.bb
>>> new file mode 100644
>>> index 000000000000..53067d4e6e80
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
>>> @@ -0,0 +1,125 @@
>>> +SUMMARY = "Opencv : The Open Computer Vision Library"
>>> +HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
>>> +SECTION = "libs"
>>> +
>>> +LICENSE = "BSD"
>>> +LIC_FILES_CHKSUM =
>>> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
>>> +
>>> +ARM_INSTRUCTION_SET = "arm"
>>> +
>>> +DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
>>> glib-2.0 oracle-jse-jdk ant"
>>> +
>>> +SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
>>> +SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
>>> +SRCREV_FORMAT = "opencv"
>>> +SRC_URI = "git://github.com/Itseez/opencv.git;nobranch=1;name=opencv \
>>> +
>>> git://github.com/Itseez/opencv_contrib.git;nobranch=1;destsuffix=contrib;name=contrib"
>>> +
>>> +PV = "3.0+git${SRCPV}"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +EXTRA_OECMAKE =
>>> "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include
>>> \
>>> +                -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
>>> +                 -DWITH_1394=OFF \
>>> +                 -DCMAKE_SKIP_RPATH=ON \
>>> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
>>> "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
>>> +                 ${@base_conditional("libdir", "/usr/lib64",
>>> "-DLIB_SUFFIX=64", "", d)} \
>>> +                 ${@base_conditional("libdir", "/usr/lib32",
>>> "-DLIB_SUFFIX=32", "", d)} \
>>> +"
>>> +
>>> +PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l tbb samples\
>>> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",
>>> "", d)}"
>>> +PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
>>> +PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
>>> +PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
>>> +PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
>>> +PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
>>> +PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
>>> +PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
>>> +PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
>>> +PACKAGECONFIG[amdblas] =
>>> "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
>>> +PACKAGECONFIG[amdfft] =
>>> "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
>>> +PACKAGECONFIG[opencl] =
>>> "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
>>> +PACKAGECONFIG[gstreamer] =
>>> "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0
>>> gstreamer1.0-plugins-base,"
>>> +PACKAGECONFIG[oracle-java-amd64] =
>>> "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include
>>> -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux
>>> -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include
>>> -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so
>>> -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,oracle-jse-jdk
>>> ant,"
>>> +PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON
>>> -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
>>> +PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
>>> +
>>> +inherit distutils-base pkgconfig cmake
>>> +
>>> +export BUILD_SYS
>>> +export HOST_SYS
>>> +export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>> +export PYTHON="${STAGING_BINDIR_NATIVE}/python"
>>> +export JAVA_HOME="${STAGING_DIR_TARGET}/usr/share/java/"
>>> +export ANT_DIR="${STAGING_DIR_TARGET}/usr/share/ant/"
>>> +
>>> +TARGET_CC_ARCH += "-I${S}/include "
>>> +
>>> +PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples
>>> ${PN}-apps python-opencv"
>>> +
>>> +python populate_packages_prepend () {
>>> +    cv_libdir = d.expand('${libdir}')
>>> +    cv_libdir_dbg = d.expand('${libdir}/.debug')
>>> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev', allow_links=True)
>>> +    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev')
>>> +    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV
>>> %s development package', extra_depends='${PN}-dev')
>>> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV
>>> %s library', extra_depends='', allow_links=True)
>>> +
>>> +    pn = d.getVar('PN', 1)
>>> +    metapkg =  pn + '-dev'
>>> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>>> +    blacklist = [ metapkg ]
>>> +    metapkg_rdepends = [ ]
>>> +    packages = d.getVar('PACKAGES', 1).split()
>>> +    for pkg in packages[1:]:
>>> +        if not pkg in blacklist and not pkg in metapkg_rdepends and
>>> pkg.endswith('-dev'):
>>> +            metapkg_rdepends.append(pkg)
>>> +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
>>> +
>>> +    blacklist = [ metapkg ]
>>> +    metapkg_rdepends = [ ]
>>> +    for pkg in packages[1:]:
>>> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not
>>> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not
>>> pkg.endswith('-doc') :
>>> +            metapkg_rdepends.append(pkg)
>>> +    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
>>> +
>>> +}
>>> +
>>> +PACKAGES_DYNAMIC += "^libopencv-.*"
>>> +
>>> +FILES_${PN} = ""
>>> +FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
>>> +FILES_${PN}-dbg += "${libdir}/.debug"
>>> +FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>> +FILES_${PN}-doc = "${datadir}/OpenCV/doc"
>>> +FILES_${PN}-java = "${datadir}/OpenCV/java"
>>> +FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
>>> +FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
>>> +FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
>>> +
>>> +INSANE_SKIP_${PN}-apps = "staticdev"
>>> +INSANE_SKIP_${PN}-java = "libdir"
>>> +INSANE_SKIP_${PN}-java-dbg = "libdir"
>>> +
>>> +ALLOW_EMPTY_${PN} = "1"
>>> +
>>> +INSANE_SKIP_python-opencv = "True"
>>> +SUMMARY_python-opencv = "Python bindings to opencv"
>>> +FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
>>> +RDEPENDS_python-opencv = "python-core python-numpy"
>>> +
>>> +do_install_append() {
>>> +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
>>> +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
>>> +
>>> +    # Move Python files into correct library folder (for multilib build)
>>> +    if [ "$libdir" != "/usr/lib" ]; then
>>> +        mv ${D}/usr/lib/* ${D}/${libdir}/
>>> +        rm -rf ${D}/usr/lib
>>> +    fi
>>> +
>>> +    install -d ${D}${datadir}/OpenCV/samples/bin/
>>> +    cp -f bin/*-tutorial-* bin/*-example-*
>>> ${D}${datadir}/OpenCV/samples/bin/
>>> +}
>>>
>>
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Embedded Products
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> Telefax: +31 (0) 499 33 69 70
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>>
>>
>>
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

