Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Aug 2016 18:25:59 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id A02D66E660
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 18:25:59 +0000 (UTC)
Received: (qmail 26944 invoked by uid 1003); 21 Aug 2016 18:19:19 -0000
Received: from unknown (HELO ?192.168.1.3?) (philip@opensdr.com@88.111.155.240)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	21 Aug 2016 18:19:19 -0000
To: Yile Ku <stiffstone@gmail.com>
References: <CAAGP=A-h9Rj3TyET=m=rsq=kQ8FBLm+N4vysOYjxu4YPysTQOg@mail.gmail.com>
	<CAMKF1spEqhVCsFXeDFnpsHyRHCKsmyRbp51REjb6uFBe=k3dwA@mail.gmail.com>
	<CAMKF1srwHc-hj_4q-z3a0U-H7GtdWJVS05JgnxTjynOgf37c9Q@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <b8558002-1c9d-3639-207c-78ce0d4d6fe8@balister.org>
Date: Sun, 21 Aug 2016 19:19:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srwHc-hj_4q-z3a0U-H7GtdWJVS05JgnxTjynOgf37c9Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: daisy compile problem with meta-sdr
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
X-List-Received-Date: Sun, 21 Aug 2016 18:26:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/21/2016 05:18 AM, Khem Raj wrote:
> It seems it needs dependency on gnuradio. Do you have that expressed in
> recipe and make sure gnuradio is packaging its cmake support when building
> 
> On Aug 20, 2016 7:30 PM, "Yile Ku" <stiffstone@gmail.com> wrote:
> 
> I do a bitbake gnuradio-dev-image and get the following:
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
> gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
> ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
> fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/
> log.do_configure.10951
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
> 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
> 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | -- The CXX compiler identification is GNU 4.9.2
> | -- The C compiler identification is GNU 4.9.2
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Build type not specified: defaulting to release.
> | -- Boost version: 1.55.0
> | -- Found the following Boost libraries:
> | --   filesystem
> | --   system
> | CMake Warning at CMakeLists.txt:87 (find_package):
> |   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
> has
> |   asked CMake to find a package configuration file provided by "Gnuradio",
> |   but CMake did not find one.
> |
> |   Could not find a package configuration file provided by "Gnuradio"
> |   (requested version 3.7) with any of the following names:
> |
> |     GnuradioConfig.cmake
> |     gnuradio-config.cmake

Looks like the process for compiling OOT modules isn't finding some
cmake files. I suspect some issues relating to ppc64 as this stuff has
worked on arm and intel builds.

Look in the sysroot and see if these files are in there. Maybe they are
getting installed somewhere the OOT modules can't find them.

Philip


> |
> |   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
> |   "Gnuradio_DIR" to a directory containing one of the above files.  If
> |   "Gnuradio" provides a separate development package or SDK, be sure it
> has
> |   been installed.
> |
> |
> | -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
> | -- checking for module 'cppunit'
> | --   found cppunit, version 1.13.1
> | -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
> | CMake Error at CMakeLists.txt:98 (message):
> |   GnuRadio Runtime required to compile framers
> |
> |
> | -- Configuring incomplete, errors occurred!
> | See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
> gitAUTOINC+eff6098884-r0/build/CMakeFiles/CMakeOutput.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
> gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
> ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
> gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
> ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
> fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/
> log.do_configure.10949
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
> 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
> 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | -- The CXX compiler identification is GNU 4.9.2
> | -- The C compiler identification is GNU 4.9.2
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Build type not specified: defaulting to release.
> | -- Boost version: 1.55.0
> | -- Found the following Boost libraries:
> | --   filesystem
> | --   system
> | -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
> | -- checking for module 'cppunit'
> | --   found cppunit, version 1.13.1
> | -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
> | CMake Warning at CMakeLists.txt:114 (find_package):
> |   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
> has
> |   asked CMake to find a package configuration file provided by "Gnuradio",
> |   but CMake did not find one.
> |
> |   Could not find a package configuration file provided by "Gnuradio" with
> any
> |   of the following names:
> |
> |     GnuradioConfig.cmake
> |     gnuradio-config.cmake
> |
> |   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
> |   "Gnuradio_DIR" to a directory containing one of the above files.  If
> |   "Gnuradio" provides a separate development package or SDK, be sure it
> has
> |   been installed.
> |
> |
> | CMake Error at CMakeLists.txt:125 (message):
> |   GnuRadio Runtime required to compile mapper
> |
> |
> | -- Configuring incomplete, errors occurred!
> | See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
> gitAUTOINC+db0686fbdf-r0/build/CMakeFiles/CMakeOutput.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
> gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
> ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
> gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
> ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
> gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
> 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
> 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | -- The CXX compiler identification is GNU 4.9.2
> | -- The C compiler identification is GNU 4.9.2
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Build type not specified: defaulting to release.
> | -- Boost version: 1.55.0
> | -- Found the following Boost libraries:
> | --   filesystem
> | --   system
> | CMake Warning at CMakeLists.txt:88 (find_package):
> |   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
> has
> |   asked CMake to find a package configuration file provided by "Gnuradio",
> |   but CMake did not find one.
> |
> |   Could not find a package configuration file provided by "Gnuradio" with
> any
> |   of the following names:
> |
> |     GnuradioConfig.cmake
> |     gnuradio-config.cmake
> |
> |   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
> |   "Gnuradio_DIR" to a directory containing one of the above files.  If
> |   "Gnuradio" provides a separate development package or SDK, be sure it
> has
> |   been installed.
> |
> |
> | -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
> | -- checking for module 'cppunit'
> | --   found cppunit, version 1.13.1
> | -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
> | CMake Error at CMakeLists.txt:100 (message):
> |   GnuRadio Runtime required to compile mac
> |
> |
> | -- Configuring incomplete, errors occurred!
> | See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/
> build/CMakeFiles/CMakeOutput.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
> gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
> ERROR: Task 1959 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
> support/gr-framers/gr-framers_git.bb, do_configure) failed with exit code
> '1'
> ERROR: Task 1985 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
> support/gr-mapper/gr-mapper_git.bb, do_configure) failed with exit code '1'
> ERROR: Task 1972 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
> support/gr-mac/gr-mac_git.bb, do_configure) failed with exit code '1'
> ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
> 0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
> ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
> fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/
> temp/log.do_configure.10948
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common',
> 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux',
> 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | -- The CXX compiler identification is GNU 4.9.2
> | -- The C compiler identification is GNU 4.9.2
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
> | -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
> | -- Detecting CXX compiler ABI info
> | -- Detecting CXX compiler ABI info - done
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
> | -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
> linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
> | -- Detecting C compiler ABI info
> | -- Detecting C compiler ABI info - done
> | -- Build type not specified: defaulting to release.
> | -- Boost version: 1.55.0
> | -- Found the following Boost libraries:
> | --   filesystem
> | --   system
> | -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
> | -- checking for module 'gnuradio-runtime'
> | --   found gnuradio-runtime, version 3.7.10
> | -- Found GNURADIO_RUNTIME: /opt/QorIQ-SDK-V1.8-20150619-
> yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-
> 64b/usr/lib64/libgnuradio-runtime.so
> | -- checking for module 'cppunit'
> | --   found cppunit, version 1.13.1
> | -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
> | CMake Error at CMakeLists.txt:94 (find_package):
> |   By not providing "FindGnuradio.cmake" in CMAKE_MODULE_PATH this project
> has
> |   asked CMake to find a package configuration file provided by "Gnuradio",
> |   but CMake did not find one.
> |
> |   Could not find a package configuration file provided by "Gnuradio"
> |   (requested version 3.7.2) with any of the following names:
> |
> |     GnuradioConfig.cmake
> |     gnuradio-config.cmake
> |
> |   Add the installation prefix of "Gnuradio" to CMAKE_PREFIX_PATH or set
> |   "Gnuradio_DIR" to a directory containing one of the above files.  If
> |   "Gnuradio" provides a separate development package or SDK, be sure it
> has
> |   been installed.
> |
> |
> | -- Configuring incomplete, errors occurred!
> | See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
> 0.2+gitAUTOINC+c4ed7e3c1e-r0/build/CMakeFiles/CMakeOutput.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
> release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
> 0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
> ERROR: Task 1998 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
> support/gr-message-tools/gr-message-tools_git.bb, do_configure) failed with
> exit code '1'
> NOTE: Tasks Summary: Attempted 3576 tasks of which 3572 didn't need to be
> rerun and 4 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 4 tasks failed:
>   /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-framers/
> gr-framers_git.bb, do_configure
>   /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mapper/
> gr-mapper_git.bb, do_configure
>   /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-support/gr-mac/
> gr-mac_git.bb, do_configure
>   /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
> support/gr-message-tools/gr-message-tools_git.bb, do_configure
> Summary: There were 4 ERROR mes
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 

