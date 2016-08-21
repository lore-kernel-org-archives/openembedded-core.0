Return-Path: <stiffstone@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0896FFEF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 02:29:28 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m101so81599433ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=h1363mihs4q43Jq0y1R5orVIEvxrzGm4T3LOW1x/Di4=;
	b=y05rN6RYCKlVi5VcI71M1eWjCWr/cqeWD7paj12eLp14zCRInCSIzD1lOnHaFqEmT9
	VsxD2qTu+Bny+rFuYB9grRbBS1cnNQWIguAqlwfADfhXJZntM2I0TAjtHvKux5qeKDqo
	HJoOLiB5nMkgou/GGxV1CRxCmUNr6O1U6a4Qdi8Iwk3pbFk0/K8bg0N6QpIbeXAOhBlW
	tlFpsx8hT4s/2Z5fvsWtv4LxOaRciToY/M3PDkgYGjCp7VkPwBMpqGhjLJoKFOR4XSjU
	7BQefOiOwrqVRL6+3M/YwrE5/FHR5/FVK2AjYY4xGJhWSo9Tk+ENGQxSDvEuuO6c/a9d
	2Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=h1363mihs4q43Jq0y1R5orVIEvxrzGm4T3LOW1x/Di4=;
	b=QRr7forb4K/A/bWasLGrjWkGFM2nUFTj/9r3Lb8IOmgjFNKhFQ7t12KnPXnmVKKrhU
	tC73HkvvWzHaxf6jSQBLNQPjLm4iXCyEt9Ab2cEZlq2IE54/aeV1+aKNEm9gtwdyT5YI
	LVyo82bjwDTk03h8jU0UY+pkEFUpxTNrJx2HBMuiNzc6zp/WJTizcazIbw1qe2G2clzf
	ReY9Knd5EG3udUZiElmQq3u3Z8g7qF6YJUOGDkJe9sLgvoo0NmVpdvs6dSo4CSuL3dKh
	8jUYx7GZ9FU9XYF/4Qf1a+2+5XRFFSsO7l9CceNG9MiQGgGNfs7i6xkhrA4goUz13XPI
	YbOw==
X-Gm-Message-State: AEkoouvuJmgBdeWFElJhU8xiPJ9zrmwPLXNS8Lwe/vVNrncU81bjDjgFJTVJp9HG8Kg1iCTwyW8EiBTUIldFQw==
X-Received: by 10.107.55.70 with SMTP id e67mr17582066ioa.51.1471746569048;
	Sat, 20 Aug 2016 19:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.2.194 with HTTP; Sat, 20 Aug 2016 19:29:28 -0700 (PDT)
From: Yile Ku <stiffstone@gmail.com>
Date: Sat, 20 Aug 2016 20:29:28 -0600
Message-ID: <CAAGP=A-h9Rj3TyET=m=rsq=kQ8FBLm+N4vysOYjxu4YPysTQOg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: daisy compile problem with meta-sdr
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
X-List-Received-Date: Sun, 21 Aug 2016 02:29:29 -0000
Content-Type: multipart/alternative; boundary=001a114a6d76729a1a053a8bb38e

--001a114a6d76729a1a053a8bb38e
Content-Type: text/plain; charset=UTF-8

I do a bitbake gnuradio-dev-image and get the following:
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
ERROR: Logfile of failure stored in:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 4.9.2
| -- The C compiler identification is GNU 4.9.2
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
-- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| CMake Warning at CMakeLists.txt:87 (find_package):
|   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
has
|   asked CMake to find a package configuration file provided by "Gnuradio",
|   but CMake did not find one.
|
|   Could not find a package configuration file provided by "Gnuradio"
|   (requested version 3.7) with any of the following names:
|
|     GnuradioConfig.cmake
|     gnuradio-config.cmake
|
|   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
|   "Gnuradio_DIR" to a directory containing one of the above files.  If
|   "Gnuradio" provides a separate development package or SDK, be sure it
has
|   been installed.
|
|
| -- Found PkgConfig:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
(found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Error at CMakeLists.txt:98 (message):
|   GnuRadio Runtime required to compile framers
|
|
| -- Configuring incomplete, errors occurred!
| See also
"/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
ERROR: Logfile of failure stored in:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 4.9.2
| -- The C compiler identification is GNU 4.9.2
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
-- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| -- Found PkgConfig:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
(found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Warning at CMakeLists.txt:114 (find_package):
|   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
has
|   asked CMake to find a package configuration file provided by "Gnuradio",
|   but CMake did not find one.
|
|   Could not find a package configuration file provided by "Gnuradio" with
any
|   of the following names:
|
|     GnuradioConfig.cmake
|     gnuradio-config.cmake
|
|   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
|   "Gnuradio_DIR" to a directory containing one of the above files.  If
|   "Gnuradio" provides a separate development package or SDK, be sure it
has
|   been installed.
|
|
| CMake Error at CMakeLists.txt:125 (message):
|   GnuRadio Runtime required to compile mapper
|
|
| -- Configuring incomplete, errors occurred!
| See also
"/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
ERROR: Logfile of failure stored in:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 4.9.2
| -- The C compiler identification is GNU 4.9.2
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
-- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| CMake Warning at CMakeLists.txt:88 (find_package):
|   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
has
|   asked CMake to find a package configuration file provided by "Gnuradio",
|   but CMake did not find one.
|
|   Could not find a package configuration file provided by "Gnuradio" with
any
|   of the following names:
|
|     GnuradioConfig.cmake
|     gnuradio-config.cmake
|
|   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
|   "Gnuradio_DIR" to a directory containing one of the above files.  If
|   "Gnuradio" provides a separate development package or SDK, be sure it
has
|   been installed.
|
|
| -- Found PkgConfig:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
(found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Error at CMakeLists.txt:100 (message):
|   GnuRadio Runtime required to compile mac
|
|
| -- Configuring incomplete, errors occurred!
| See also
"/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
ERROR: Task 1959
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-framers/
gr-framers_git.bb, do_configure) failed with exit code '1'
ERROR: Task 1985
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mapper/
gr-mapper_git.bb, do_configure) failed with exit code '1'
ERROR: Task 1972
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mac/
gr-mac_git.bb, do_configure) failed with exit code '1'
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
ERROR: Logfile of failure stored in:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 4.9.2
| -- The C compiler identification is GNU 4.9.2
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
-- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| -- Found PkgConfig:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
(found version "0.28")
| -- checking for module 'gnuradio-runtime'
| --   found gnuradio-runtime, version 3.7.10
| -- Found GNURADIO_RUNTIME:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libgnuradio-runtime.so
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT:
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Error at CMakeLists.txt:94 (find_package):
|   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
has
|   asked CMake to find a package configuration file provided by "Gnuradio",
|   but CMake did not find one.
|
|   Could not find a package configuration file provided by "Gnuradio"
|   (requested version 3.7.2) with any of the following names:
|
|     GnuradioConfig.cmake
|     gnuradio-config.cmake
|
|   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
|   "Gnuradio_DIR" to a directory containing one of the above files.  If
|   "Gnuradio" provides a separate development package or SDK, be sure it
has
|   been installed.
|
|
| -- Configuring incomplete, errors occurred!
| See also
"/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
ERROR: Task 1998
(/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-message-tools/
gr-message-tools_git.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3576 tasks of which 3572 didn't need to be
rerun and 4 failed.
Waiting for 0 running tasks to finish:

Summary: 4 tasks failed:
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-framers/
gr-framers_git.bb, do_configure
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mapper/
gr-mapper_git.bb, do_configure
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mac/
gr-mac_git.bb, do_configure

/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-message-tools/
gr-message-tools_git.bb, do_configure
Summary: There were 4 ERROR mes

--001a114a6d76729a1a053a8bb38e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do a bitbake gnuradio-dev-image and get the following:<b=
r>NOTE: Preparing runqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: Execu=
ting RunQueue Tasks<br>ERROR: Function failed: do_configure (log file is lo=
cated at /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
work/ppc64e6500-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/lo=
g.do_configure.10951)<br>ERROR: Logfile of failure stored in: /opt/QorIQ-SD=
K-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-li=
nux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951<b=
r>Log data follows:<br>| DEBUG: Executing python function sysroot_cleanssta=
te<br>| DEBUG: Python function sysroot_cleansstate finished<br>| DEBUG: SIT=
E files [&#39;endian-big&#39;, &#39;bit-64&#39;, &#39;powerpc-common&#39;, =
&#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;powerpc-linux&#39;, &#=
39;powerpc64-linux&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell func=
tion autotools_preconfigure<br>| DEBUG: Shell function autotools_preconfigu=
re finished<br>| DEBUG: Executing python function autotools_copy_aclocals<b=
r>| DEBUG: Python function autotools_copy_aclocals finished<br>| DEBUG: Exe=
cuting shell function do_configure<br>| -- The CXX compiler identification =
is GNU 4.9.2<br>| -- The C compiler identification is GNU 4.9.2<br>| -- Che=
ck for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860=
qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powe=
rpc64-fsl-linux-g++<br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-=
V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/us=
r/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecti=
ng CXX compiler ABI info<br>| -- Detecting CXX compiler ABI info - done<br>=
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build=
_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linu=
x/powerpc64-fsl-linux-gcc<br>| -- Check for working C compiler: /opt/QorIQ-=
SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linu=
x/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works<br>| -- Det=
ecting C compiler ABI info<br>| -- Detecting C compiler ABI info - done<br>=
| -- Build type not specified: defaulting to release.<br>| -- Boost version=
: 1.55.0<br>| -- Found the following Boost libraries:<br>| --=C2=A0=C2=A0 f=
ilesystem<br>| --=C2=A0=C2=A0 system<br>| CMake Warning at CMakeLists.txt:8=
7 (find_package):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cmak=
e&quot; in CMAKE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake =
to find a package configuration file provided by &quot;Gnuradio&quot;,<br>|=
=C2=A0=C2=A0 but CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not f=
ind a package configuration file provided by &quot;Gnuradio&quot;<br>|=C2=
=A0=C2=A0 (requested version 3.7) with any of the following names:<br>| <br=
>|=C2=A0=C2=A0=C2=A0=C2=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=
=A0 gnuradio-config.cmake<br>| <br>|=C2=A0=C2=A0 Add the installation prefi=
x of &quot;Gnuradio&quot; to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quo=
t;Gnuradio_DIR&quot; to a directory containing one of the above files.=C2=
=A0 If<br>|=C2=A0=C2=A0 &quot;Gnuradio&quot; provides a separate developmen=
t package or SDK, be sure it has<br>|=C2=A0=C2=A0 been installed.<br>| <br>=
| <br>| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860q=
ds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version =
&quot;0.28&quot;)<br>| -- checking for module &#39;cppunit&#39;<br>| --=C2=
=A0=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/QorIQ-S=
DK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b=
/usr/lib64/libcppunit.so;dl<br>| CMake Error at CMakeLists.txt:98 (message)=
:<br>|=C2=A0=C2=A0 GnuRadio Runtime required to compile framers<br>| <br>| =
<br>| -- Configuring incomplete, errors occurred!<br>| See also &quot;/opt/=
QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e650=
0-fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/build/CMakeFiles/CMak=
eOutput.log&quot;.<br>| WARNING: exit code 1 from a shell command.<br>| ERR=
OR: Function failed: do_configure (log file is located at /opt/QorIQ-SDK-V1=
.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/=
gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)<br>E=
RROR: Function failed: do_configure (log file is located at /opt/QorIQ-SDK-=
V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linu=
x/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)<br>=
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-yocto/bui=
ld_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAU=
TOINC+db0686fbdf-r0/temp/log.do_configure.10949<br>Log data follows:<br>| D=
EBUG: Executing python function sysroot_cleansstate<br>| DEBUG: Python func=
tion sysroot_cleansstate finished<br>| DEBUG: SITE files [&#39;endian-big&#=
39;, &#39;bit-64&#39;, &#39;powerpc-common&#39;, &#39;common-linux&#39;, &#=
39;common-glibc&#39;, &#39;powerpc-linux&#39;, &#39;powerpc64-linux&#39;, &=
#39;common&#39;]<br>| DEBUG: Executing shell function autotools_preconfigur=
e<br>| DEBUG: Shell function autotools_preconfigure finished<br>| DEBUG: Ex=
ecuting python function autotools_copy_aclocals<br>| DEBUG: Python function=
 autotools_copy_aclocals finished<br>| DEBUG: Executing shell function do_c=
onfigure<br>| -- The CXX compiler identification is GNU 4.9.2<br>| -- The C=
 compiler identification is GNU 4.9.2<br>| -- Check for working CXX compile=
r: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroo=
ts/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++<br>| -=
- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_=
b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux=
/powerpc64-fsl-linux-g++ -- works<br>| -- Detecting CXX compiler ABI info<b=
r>| -- Detecting CXX compiler ABI info - done<br>| -- Check for working C c=
ompiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc<=
br>| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/bu=
ild_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-l=
inux/powerpc64-fsl-linux-gcc -- works<br>| -- Detecting C compiler ABI info=
<br>| -- Detecting C compiler ABI info - done<br>| -- Build type not specif=
ied: defaulting to release.<br>| -- Boost version: 1.55.0<br>| -- Found the=
 following Boost libraries:<br>| --=C2=A0=C2=A0 filesystem<br>| --=C2=A0=C2=
=A0 system<br>| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/buil=
d_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found =
version &quot;0.28&quot;)<br>| -- checking for module &#39;cppunit&#39;<br>=
| --=C2=A0=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/=
QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860=
qds-64b/usr/lib64/libcppunit.so;dl<br>| CMake Warning at CMakeLists.txt:114=
 (find_package):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cmake=
&quot; in CMAKE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake t=
o find a package configuration file provided by &quot;Gnuradio&quot;,<br>|=
=C2=A0=C2=A0 but CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not f=
ind a package configuration file provided by &quot;Gnuradio&quot; with any<=
br>|=C2=A0=C2=A0 of the following names:<br>| <br>|=C2=A0=C2=A0=C2=A0=C2=A0=
 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0 gnuradio-config.cmake<br=
>| <br>|=C2=A0=C2=A0 Add the installation prefix of &quot;Gnuradio&quot; to=
 CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quot;Gnuradio_DIR&quot; to a di=
rectory containing one of the above files.=C2=A0 If<br>|=C2=A0=C2=A0 &quot;=
Gnuradio&quot; provides a separate development package or SDK, be sure it h=
as<br>|=C2=A0=C2=A0 been installed.<br>| <br>| <br>| CMake Error at CMakeLi=
sts.txt:125 (message):<br>|=C2=A0=C2=A0 GnuRadio Runtime required to compil=
e mapper<br>| <br>| <br>| -- Configuring incomplete, errors occurred!<br>| =
See also &quot;/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_releas=
e/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/bu=
ild/CMakeFiles/CMakeOutput.log&quot;.<br>| WARNING: exit code 1 from a shel=
l command.<br>| ERROR: Function failed: do_configure (log file is located a=
t /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/pp=
c64e6500-fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/log.do_con=
figure.10949)<br>ERROR: Function failed: do_configure (log file is located =
at /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/p=
pc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.do_confi=
gure.10950)<br>ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-201=
50619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac=
/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950<br>Log data fol=
lows:<br>| DEBUG: Executing python function sysroot_cleansstate<br>| DEBUG:=
 Python function sysroot_cleansstate finished<br>| DEBUG: SITE files [&#39;=
endian-big&#39;, &#39;bit-64&#39;, &#39;powerpc-common&#39;, &#39;common-li=
nux&#39;, &#39;common-glibc&#39;, &#39;powerpc-linux&#39;, &#39;powerpc64-l=
inux&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function autotools=
_preconfigure<br>| DEBUG: Shell function autotools_preconfigure finished<br=
>| DEBUG: Executing python function autotools_copy_aclocals<br>| DEBUG: Pyt=
hon function autotools_copy_aclocals finished<br>| DEBUG: Executing shell f=
unction do_configure<br>| -- The CXX compiler identification is GNU 4.9.2<b=
r>| -- The C compiler identification is GNU 4.9.2<br>| -- Check for working=
 CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_releas=
e/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linu=
x-g++<br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-=
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e65=
00-fsl-linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecting CXX compile=
r ABI info<br>| -- Detecting CXX compiler ABI info - done<br>| -- Check for=
 working C compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_=
release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fs=
l-linux-gcc<br>| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150=
619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc6=
4e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works<br>| -- Detecting C compi=
ler ABI info<br>| -- Detecting C compiler ABI info - done<br>| -- Build typ=
e not specified: defaulting to release.<br>| -- Boost version: 1.55.0<br>| =
-- Found the following Boost libraries:<br>| --=C2=A0=C2=A0 filesystem<br>|=
 --=C2=A0=C2=A0 system<br>| CMake Warning at CMakeLists.txt:88 (find_packag=
e):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cmake&quot; in CMA=
KE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake to find a pack=
age configuration file provided by &quot;Gnuradio&quot;,<br>|=C2=A0=C2=A0 b=
ut CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not find a package =
configuration file provided by &quot;Gnuradio&quot; with any<br>|=C2=A0=C2=
=A0 of the following names:<br>| <br>|=C2=A0=C2=A0=C2=A0=C2=A0 GnuradioConf=
ig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0 gnuradio-config.cmake<br>| <br>|=C2=
=A0=C2=A0 Add the installation prefix of &quot;Gnuradio&quot; to CMAKE_PREF=
IX_PATH or set<br>|=C2=A0=C2=A0 &quot;Gnuradio_DIR&quot; to a directory con=
taining one of the above files.=C2=A0 If<br>|=C2=A0=C2=A0 &quot;Gnuradio&qu=
ot; provides a separate development package or SDK, be sure it has<br>|=C2=
=A0=C2=A0 been installed.<br>| <br>| <br>| -- Found PkgConfig: /opt/QorIQ-S=
DK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux=
/usr/bin/pkg-config (found version &quot;0.28&quot;)<br>| -- checking for m=
odule &#39;cppunit&#39;<br>| --=C2=A0=C2=A0 found cppunit, version 1.13.1<b=
r>| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b=
_release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl<br>| CMake Er=
ror at CMakeLists.txt:100 (message):<br>|=C2=A0=C2=A0 GnuRadio Runtime requ=
ired to compile mac<br>| <br>| <br>| -- Configuring incomplete, errors occu=
rred!<br>| See also &quot;/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds=
-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f089=
33-r0/build/CMakeFiles/CMakeOutput.log&quot;.<br>| WARNING: exit code 1 fro=
m a shell command.<br>| ERROR: Function failed: do_configure (log file is l=
ocated at /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp=
/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/temp/log.d=
o_configure.10950)<br>ERROR: Task 1959 (/opt/QorIQ-SDK-V1.8-20150619-yocto/=
meta-sdr/recipes-support/gr-framers/<a href=3D"http://gr-framers_git.bb">gr=
-framers_git.bb</a>, do_configure) failed with exit code &#39;1&#39;<br>ERR=
OR: Task 1985 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/=
gr-mapper/<a href=3D"http://gr-mapper_git.bb">gr-mapper_git.bb</a>, do_conf=
igure) failed with exit code &#39;1&#39;<br>ERROR: Task 1972 (/opt/QorIQ-SD=
K-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mac/<a href=3D"http://gr-=
mac_git.bb">gr-mac_git.bb</a>, do_configure) failed with exit code &#39;1&#=
39;<br>ERROR: Function failed: do_configure (log file is located at /opt/Qo=
rIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-=
fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_confi=
gure.10948)<br>ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-201=
50619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mes=
sage-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948<br>Lo=
g data follows:<br>| DEBUG: Executing python function sysroot_cleansstate<b=
r>| DEBUG: Python function sysroot_cleansstate finished<br>| DEBUG: SITE fi=
les [&#39;endian-big&#39;, &#39;bit-64&#39;, &#39;powerpc-common&#39;, &#39=
;common-linux&#39;, &#39;common-glibc&#39;, &#39;powerpc-linux&#39;, &#39;p=
owerpc64-linux&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function=
 autotools_preconfigure<br>| DEBUG: Shell function autotools_preconfigure f=
inished<br>| DEBUG: Executing python function autotools_copy_aclocals<br>| =
DEBUG: Python function autotools_copy_aclocals finished<br>| DEBUG: Executi=
ng shell function do_configure<br>| -- The CXX compiler identification is G=
NU 4.9.2<br>| -- The C compiler identification is GNU 4.9.2<br>| -- Check f=
or working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-=
64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/powerpc6=
4-fsl-linux-g++<br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8=
-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bi=
n/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecting C=
XX compiler ABI info<br>| -- Detecting CXX compiler ABI info - done<br>| --=
 Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b48=
60qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/ppc64e6500-fsl-linux/po=
werpc64-fsl-linux-gcc<br>| -- Check for working C compiler: /opt/QorIQ-SDK-=
V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/us=
r/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works<br>| -- Detecti=
ng C compiler ABI info<br>| -- Detecting C compiler ABI info - done<br>| --=
 Build type not specified: defaulting to release.<br>| -- Boost version: 1.=
55.0<br>| -- Found the following Boost libraries:<br>| --=C2=A0=C2=A0 files=
ystem<br>| --=C2=A0=C2=A0 system<br>| -- Found PkgConfig: /opt/QorIQ-SDK-V1=
.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/=
bin/pkg-config (found version &quot;0.28&quot;)<br>| -- checking for module=
 &#39;gnuradio-runtime&#39;<br>| --=C2=A0=C2=A0 found gnuradio-runtime, ver=
sion 3.7.10<br>| -- Found GNURADIO_RUNTIME: /opt/QorIQ-SDK-V1.8-20150619-yo=
cto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/usr/lib64/libgnura=
dio-runtime.so<br>| -- checking for module &#39;cppunit&#39;<br>| --=C2=A0=
=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/QorIQ-SDK-=
V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-64b/us=
r/lib64/libcppunit.so;dl<br>| CMake Error at CMakeLists.txt:94 (find_packag=
e):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cmake&quot; in CMA=
KE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake to find a pack=
age configuration file provided by &quot;Gnuradio&quot;,<br>|=C2=A0=C2=A0 b=
ut CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not find a package =
configuration file provided by &quot;Gnuradio&quot;<br>|=C2=A0=C2=A0 (reque=
sted version 3.7.2) with any of the following names:<br>| <br>|=C2=A0=C2=A0=
=C2=A0=C2=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0 gnuradio-con=
fig.cmake<br>| <br>|=C2=A0=C2=A0 Add the installation prefix of &quot;Gnura=
dio&quot; to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quot;Gnuradio_DIR&q=
uot; to a directory containing one of the above files.=C2=A0 If<br>|=C2=A0=
=C2=A0 &quot;Gnuradio&quot; provides a separate development package or SDK,=
 be sure it has<br>|=C2=A0=C2=A0 been installed.<br>| <br>| <br>| -- Config=
uring incomplete, errors occurred!<br>| See also &quot;/opt/QorIQ-SDK-V1.8-=
20150619-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-=
message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/build/CMakeFiles/CMakeOutput.l=
og&quot;.<br>| WARNING: exit code 1 from a shell command.<br>| ERROR: Funct=
ion failed: do_configure (log file is located at /opt/QorIQ-SDK-V1.8-201506=
19-yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-messag=
e-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)<br>ERRO=
R: Task 1998 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/g=
r-message-tools/<a href=3D"http://gr-message-tools_git.bb">gr-message-tools=
_git.bb</a>, do_configure) failed with exit code &#39;1&#39;<br>NOTE: Tasks=
 Summary: Attempted 3576 tasks of which 3572 didn&#39;t need to be rerun an=
d 4 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summary: 4 tas=
ks failed:<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-su=
pport/gr-framers/<a href=3D"http://gr-framers_git.bb">gr-framers_git.bb</a>=
, do_configure<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipe=
s-support/gr-mapper/<a href=3D"http://gr-mapper_git.bb">gr-mapper_git.bb</a=
>, do_configure<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recip=
es-support/gr-mac/<a href=3D"http://gr-mac_git.bb">gr-mac_git.bb</a>, do_co=
nfigure<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-suppo=
rt/gr-message-tools/<a href=3D"http://gr-message-tools_git.bb">gr-message-t=
ools_git.bb</a>, do_configure<br>Summary: There were 4 ERROR mes<br></div>

--001a114a6d76729a1a053a8bb38e--
