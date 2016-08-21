Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 216DD73243
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 04:18:18 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id w38so22117150qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=78kGzeI4qk8bh0DvfZqQD97lHl5qjqNp3kVJuosYr90=;
	b=AZ+kj79QVPm/wLmHslmGDW5KB3tIQMpL+K4/7cDoBaJEJ6qfFGD00N5xWcNhCZiJWX
	ppssjahswP/AwEo5rvQ13GTybbC7Ytl8IROLumDgNOm9/9rgGcNHxjCWs1CCsJ46k4UI
	EhdTLdJQ4s/hSbkZiM83CVfH6LcayqvCkNuxg81hkYADWPouBS0w2q0YJ6Kl8UAzfoEr
	elTzr0F45Y/uJv4zmOTyA5rR2ozi1+8JLsXMr2crtD8Lj4hy2tciVC24iOlnvq5xQLR+
	qb0JXYWaXZde1fHhYh1x+bhiiSXclK4E5OJ1SEJYHoAn5Yb9H070VrKuE5XOCIWxDOxs
	Aq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=78kGzeI4qk8bh0DvfZqQD97lHl5qjqNp3kVJuosYr90=;
	b=ZUnlI+b4tLfWipg5R/LXf1JvBUHaHRYglO6r99kYUe7Kge4q228Bq7FO1WIhlyHyOq
	eHI5w5pChIp60EVmvc0TmpZU9qFmevY3YTqFkezeEWq2EIB3LbO3xGLMytG887pq6+KX
	LjrqAoKlsat3YUTl1vgqeAMYYjysUdU/AEBzEBhOT40bmNGQFYbg01IkYaemkdjSBEoM
	1VhNZKzelkiVc8oH0ZVZx8wQ9WPVnKT0x7aSdcZe1/RdqJt4t5TiuVTujXQRG1Duk0I3
	cy8mD4FZpZsCFPq06P6OwZob0av1f8iv4/MVBQA+1YsSrH3WjlcvAUI9Ab+eHRv8zFHX
	WaQg==
X-Gm-Message-State: AEkoouvKKeXm9nJkVo2jgSHsiPD6MphZEBUlVYh+lzcOoTJ/s3N4h4GA+waPP/2RG99VPgEgBFhi6IrYt0SGhA==
X-Received: by 10.237.51.162 with SMTP id v31mr16975538qtd.1.1471753098509;
	Sat, 20 Aug 2016 21:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Sat, 20 Aug 2016 21:18:16 -0700 (PDT)
Received: by 10.55.215.13 with HTTP; Sat, 20 Aug 2016 21:18:16 -0700 (PDT)
In-Reply-To: <CAMKF1spEqhVCsFXeDFnpsHyRHCKsmyRbp51REjb6uFBe=k3dwA@mail.gmail.com>
References: <CAAGP=A-h9Rj3TyET=m=rsq=kQ8FBLm+N4vysOYjxu4YPysTQOg@mail.gmail.com>
	<CAMKF1spEqhVCsFXeDFnpsHyRHCKsmyRbp51REjb6uFBe=k3dwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 21:18:16 -0700
Message-ID: <CAMKF1srwHc-hj_4q-z3a0U-H7GtdWJVS05JgnxTjynOgf37c9Q@mail.gmail.com>
To: Yile Ku <stiffstone@gmail.com>
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
X-List-Received-Date: Sun, 21 Aug 2016 04:18:22 -0000
Content-Type: multipart/alternative; boundary=94eb2c124a32a263a7053a8d380a

--94eb2c124a32a263a7053a8d380a
Content-Type: text/plain; charset=UTF-8

It seems it needs dependency on gnuradio. Do you have that expressed in
recipe and make sure gnuradio is packaging its cmake support when building

On Aug 20, 2016 7:30 PM, "Yile Ku" <stiffstone@gmail.com> wrote:

I do a bitbake gnuradio-dev-image and get the following:
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
fsl-linux/gr-framers/0.0.1+gitAUTOINC+eff6098884-r0/temp/
log.do_configure.10951
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
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
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
| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Error at CMakeLists.txt:98 (message):
|   GnuRadio Runtime required to compile framers
|
|
| -- Configuring incomplete, errors occurred!
| See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
gitAUTOINC+eff6098884-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-framers/0.0.1+
gitAUTOINC+eff6098884-r0/temp/log.do_configure.10951)
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
fsl-linux/gr-mapper/0.0.3+gitAUTOINC+db0686fbdf-r0/temp/
log.do_configure.10949
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
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
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
| See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
gitAUTOINC+db0686fbdf-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mapper/0.0.3+
gitAUTOINC+db0686fbdf-r0/temp/log.do_configure.10949)
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950
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
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
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
| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
| CMake Error at CMakeLists.txt:100 (message):
|   GnuRadio Runtime required to compile mac
|
|
| -- Configuring incomplete, errors occurred!
| See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+gitAUTOINC+3ed6f08933-r0/
build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-mac/0.0.1+
gitAUTOINC+3ed6f08933-r0/temp/log.do_configure.10950)
ERROR: Task 1959 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
support/gr-framers/gr-framers_git.bb, do_configure) failed with exit code
'1'
ERROR: Task 1985 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
support/gr-mapper/gr-mapper_git.bb, do_configure) failed with exit code '1'
ERROR: Task 1972 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
support/gr-mac/gr-mac_git.bb, do_configure) failed with exit code '1'
ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/work/ppc64e6500-
fsl-linux/gr-message-tools/0.0.2+gitAUTOINC+c4ed7e3c1e-r0/
temp/log.do_configure.10948
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
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++
| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-g++ -- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-
linux/usr/bin/ppc64e6500-fsl-linux/powerpc64-fsl-linux-gcc -- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Build type not specified: defaulting to release.
| -- Boost version: 1.55.0
| -- Found the following Boost libraries:
| --   filesystem
| --   system
| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/x86_64-linux/usr/bin/pkg-config (found version "0.28")
| -- checking for module 'gnuradio-runtime'
| --   found gnuradio-runtime, version 3.7.10
| -- Found GNURADIO_RUNTIME: /opt/QorIQ-SDK-V1.8-20150619-
yocto/build_b4860qds-64b_release/tmp/sysroots/b4860qds-
64b/usr/lib64/libgnuradio-runtime.so
| -- checking for module 'cppunit'
| --   found cppunit, version 1.13.1
| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/sysroots/b4860qds-64b/usr/lib64/libcppunit.so;dl
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
| See also "/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
0.2+gitAUTOINC+c4ed7e3c1e-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_
release/tmp/work/ppc64e6500-fsl-linux/gr-message-tools/0.
0.2+gitAUTOINC+c4ed7e3c1e-r0/temp/log.do_configure.10948)
ERROR: Task 1998 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
support/gr-message-tools/gr-message-tools_git.bb, do_configure) failed with
exit code '1'
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
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-sdr/recipes-
support/gr-message-tools/gr-message-tools_git.bb, do_configure
Summary: There were 4 ERROR mes

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c124a32a263a7053a8d380a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">It seems it needs dependency on gnuradio. Do you have that e=
xpressed in recipe and make sure gnuradio is packaging its cmake support wh=
en building</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Aug 20, 2016 7=
:30 PM, &quot;Yile Ku&quot; &lt;<a href=3D"mailto:stiffstone@gmail.com">sti=
ffstone@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=
=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">I do a bitbake gnuradio-dev-image and get the foll=
owing:<br>NOTE: Preparing runqueue<br>NOTE: Executing SetScene Tasks<br>NOT=
E: Executing RunQueue Tasks<br>ERROR: Function failed: do_configure (log fi=
le is located at /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b=
_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-framers/0.0.1+<wbr>gitA=
UTOINC+eff6098884-r0/temp/<wbr>log.do_configure.10951)<br>ERROR: Logfile of=
 failure stored in: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-=
64b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-framers/0.0.1+<wbr>g=
itAUTOINC+eff6098884-r0/temp/<wbr>log.do_configure.10951<br>Log data follow=
s:<br>| DEBUG: Executing python function sysroot_cleansstate<br>| DEBUG: Py=
thon function sysroot_cleansstate finished<br>| DEBUG: SITE files [&#39;end=
ian-big&#39;, &#39;bit-64&#39;, &#39;powerpc-common&#39;, &#39;common-linux=
&#39;, &#39;common-glibc&#39;, &#39;powerpc-linux&#39;, &#39;powerpc64-linu=
x&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function autotools_pr=
econfigure<br>| DEBUG: Shell function autotools_preconfigure finished<br>| =
DEBUG: Executing python function autotools_copy_aclocals<br>| DEBUG: Python=
 function autotools_copy_aclocals finished<br>| DEBUG: Executing shell func=
tion do_configure<br>| -- The CXX compiler identification is GNU 4.9.2<br>|=
 -- The C compiler identification is GNU 4.9.2<br>| -- Check for working CX=
X compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr=
>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/p=
owerpc64-fsl-linux-g++<br>| -- Check for working CXX compiler: /opt/QorIQ-S=
DK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/x8=
6_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-g++ -=
- works<br>| -- Detecting CXX compiler ABI info<br>| -- Detecting CXX compi=
ler ABI info - done<br>| -- Check for working C compiler: /opt/QorIQ-SDK-V1=
.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-=
<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-gcc<br>| -=
- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/bui=
ld_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6=
500-fsl-<wbr>linux/powerpc64-fsl-linux-gcc -- works<br>| -- Detecting C com=
piler ABI info<br>| -- Detecting C compiler ABI info - done<br>| -- Build t=
ype not specified: defaulting to release.<br>| -- Boost version: 1.55.0<br>=
| -- Found the following Boost libraries:<br>| --=C2=A0=C2=A0 filesystem<br=
>| --=C2=A0=C2=A0 system<br>| CMake Warning at CMakeLists.txt:87 (find_pack=
age):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cmake&quot; in C=
MAKE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake to find a pa=
ckage configuration file provided by &quot;Gnuradio&quot;,<br>|=C2=A0=C2=A0=
 but CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not find a packag=
e configuration file provided by &quot;Gnuradio&quot;<br>|=C2=A0=C2=A0 (req=
uested version 3.7) with any of the following names:<br>| <br>|=C2=A0=C2=A0=
=C2=A0=C2=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0 gnuradio-con=
fig.cmake<br>| <br>|=C2=A0=C2=A0 Add the installation prefix of &quot;Gnura=
dio&quot; to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quot;Gnuradio_DIR&q=
uot; to a directory containing one of the above files.=C2=A0 If<br>|=C2=A0=
=C2=A0 &quot;Gnuradio&quot; provides a separate development package or SDK,=
 be sure it has<br>|=C2=A0=C2=A0 been installed.<br>| <br>| <br>| -- Found =
PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>=
release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/pkg-config (found version &q=
uot;0.28&quot;)<br>| -- checking for module &#39;cppunit&#39;<br>| --=C2=A0=
=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/QorIQ-SDK-=
V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/b4860=
qds-<wbr>64b/usr/lib64/libcppunit.so;dl<br>| CMake Error at CMakeLists.txt:=
98 (message):<br>|=C2=A0=C2=A0 GnuRadio Runtime required to compile framers=
<br>| <br>| <br>| -- Configuring incomplete, errors occurred!<br>| See also=
 &quot;/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>rele=
ase/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-framers/0.0.1+<wbr>gitAUTOINC+eff=
6098884-r0/<wbr>build/CMakeFiles/CMakeOutput.<wbr>log&quot;.<br>| WARNING: =
exit code 1 from a shell command.<br>| ERROR: Function failed: do_configure=
 (log file is located at /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b486=
0qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-framers/0.0.1+<=
wbr>gitAUTOINC+eff6098884-r0/temp/<wbr>log.do_configure.10951)<br>ERROR: Fu=
nction failed: do_configure (log file is located at /opt/QorIQ-SDK-V1.8-201=
50619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr>f=
sl-linux/gr-mapper/0.0.3+<wbr>gitAUTOINC+db0686fbdf-r0/temp/<wbr>log.do_con=
figure.10949)<br>ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-2=
0150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr=
>fsl-linux/gr-mapper/0.0.3+<wbr>gitAUTOINC+db0686fbdf-r0/temp/<wbr>log.do_c=
onfigure.10949<br>Log data follows:<br>| DEBUG: Executing python function s=
ysroot_cleansstate<br>| DEBUG: Python function sysroot_cleansstate finished=
<br>| DEBUG: SITE files [&#39;endian-big&#39;, &#39;bit-64&#39;, &#39;power=
pc-common&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;powerp=
c-linux&#39;, &#39;powerpc64-linux&#39;, &#39;common&#39;]<br>| DEBUG: Exec=
uting shell function autotools_preconfigure<br>| DEBUG: Shell function auto=
tools_preconfigure finished<br>| DEBUG: Executing python function autotools=
_copy_aclocals<br>| DEBUG: Python function autotools_copy_aclocals finished=
<br>| DEBUG: Executing shell function do_configure<br>| -- The CXX compiler=
 identification is GNU 4.9.2<br>| -- The C compiler identification is GNU 4=
.9.2<br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-<=
wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/us=
r/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-g++<br>| -- Check for w=
orking CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds=
-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wb=
r>linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecting CXX compiler ABI=
 info<br>| -- Detecting CXX compiler ABI info - done<br>| -- Check for work=
ing C compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_=
<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>lin=
ux/powerpc64-fsl-linux-gcc<br>| -- Check for working C compiler: /opt/QorIQ=
-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/=
x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-gcc=
 -- works<br>| -- Detecting C compiler ABI info<br>| -- Detecting C compile=
r ABI info - done<br>| -- Build type not specified: defaulting to release.<=
br>| -- Boost version: 1.55.0<br>| -- Found the following Boost libraries:<=
br>| --=C2=A0=C2=A0 filesystem<br>| --=C2=A0=C2=A0 system<br>| -- Found Pkg=
Config: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>rel=
ease/tmp/sysroots/x86_64-<wbr>linux/usr/bin/pkg-config (found version &quot=
;0.28&quot;)<br>| -- checking for module &#39;cppunit&#39;<br>| --=C2=A0=C2=
=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/QorIQ-SDK-V1.=
8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/b4860qds=
-<wbr>64b/usr/lib64/libcppunit.so;dl<br>| CMake Warning at CMakeLists.txt:1=
14 (find_package):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.cma=
ke&quot; in CMAKE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CMake=
 to find a package configuration file provided by &quot;Gnuradio&quot;,<br>=
|=C2=A0=C2=A0 but CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could not =
find a package configuration file provided by &quot;Gnuradio&quot; with any=
<br>|=C2=A0=C2=A0 of the following names:<br>| <br>|=C2=A0=C2=A0=C2=A0=C2=
=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0 gnuradio-config.cmake=
<br>| <br>|=C2=A0=C2=A0 Add the installation prefix of &quot;Gnuradio&quot;=
 to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quot;Gnuradio_DIR&quot; to a=
 directory containing one of the above files.=C2=A0 If<br>|=C2=A0=C2=A0 &qu=
ot;Gnuradio&quot; provides a separate development package or SDK, be sure i=
t has<br>|=C2=A0=C2=A0 been installed.<br>| <br>| <br>| CMake Error at CMak=
eLists.txt:125 (message):<br>|=C2=A0=C2=A0 GnuRadio Runtime required to com=
pile mapper<br>| <br>| <br>| -- Configuring incomplete, errors occurred!<br=
>| See also &quot;/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64=
b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-mapper/0.0.3+<wbr>gitA=
UTOINC+db0686fbdf-r0/<wbr>build/CMakeFiles/CMakeOutput.<wbr>log&quot;.<br>|=
 WARNING: exit code 1 from a shell command.<br>| ERROR: Function failed: do=
_configure (log file is located at /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/=
build_b4860qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-mappe=
r/0.0.3+<wbr>gitAUTOINC+db0686fbdf-r0/temp/<wbr>log.do_configure.10949)<br>=
ERROR: Function failed: do_configure (log file is located at /opt/QorIQ-SDK=
-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc64e65=
00-<wbr>fsl-linux/gr-mac/0.0.1+<wbr>gitAUTOINC+3ed6f08933-r0/temp/<wbr>log.=
do_configure.10950)<br>ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-=
V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc64e650=
0-<wbr>fsl-linux/gr-mac/0.0.1+<wbr>gitAUTOINC+3ed6f08933-r0/temp/<wbr>log.d=
o_configure.10950<br>Log data follows:<br>| DEBUG: Executing python functio=
n sysroot_cleansstate<br>| DEBUG: Python function sysroot_cleansstate finis=
hed<br>| DEBUG: SITE files [&#39;endian-big&#39;, &#39;bit-64&#39;, &#39;po=
werpc-common&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;pow=
erpc-linux&#39;, &#39;powerpc64-linux&#39;, &#39;common&#39;]<br>| DEBUG: E=
xecuting shell function autotools_preconfigure<br>| DEBUG: Shell function a=
utotools_preconfigure finished<br>| DEBUG: Executing python function autoto=
ols_copy_aclocals<br>| DEBUG: Python function autotools_copy_aclocals finis=
hed<br>| DEBUG: Executing shell function do_configure<br>| -- The CXX compi=
ler identification is GNU 4.9.2<br>| -- The C compiler identification is GN=
U 4.9.2<br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-2015061=
9-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux=
/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-g++<br>| -- Check fo=
r working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860=
qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-=
<wbr>linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecting CXX compiler =
ABI info<br>| -- Detecting CXX compiler ABI info - done<br>| -- Check for w=
orking C compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-6=
4b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>=
linux/powerpc64-fsl-linux-gcc<br>| -- Check for working C compiler: /opt/Qo=
rIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroo=
ts/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-=
gcc -- works<br>| -- Detecting C compiler ABI info<br>| -- Detecting C comp=
iler ABI info - done<br>| -- Build type not specified: defaulting to releas=
e.<br>| -- Boost version: 1.55.0<br>| -- Found the following Boost librarie=
s:<br>| --=C2=A0=C2=A0 filesystem<br>| --=C2=A0=C2=A0 system<br>| CMake War=
ning at CMakeLists.txt:88 (find_package):<br>|=C2=A0=C2=A0 By not providing=
 &quot;FindGnuradio.cmake&quot; in CMAKE_MODULE_PATH this project has<br>|=
=C2=A0=C2=A0 asked CMake to find a package configuration file provided by &=
quot;Gnuradio&quot;,<br>|=C2=A0=C2=A0 but CMake did not find one.<br>| <br>=
|=C2=A0=C2=A0 Could not find a package configuration file provided by &quot=
;Gnuradio&quot; with any<br>|=C2=A0=C2=A0 of the following names:<br>| <br>=
|=C2=A0=C2=A0=C2=A0=C2=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=C2=A0=
 gnuradio-config.cmake<br>| <br>|=C2=A0=C2=A0 Add the installation prefix o=
f &quot;Gnuradio&quot; to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &quot;G=
nuradio_DIR&quot; to a directory containing one of the above files.=C2=A0 I=
f<br>|=C2=A0=C2=A0 &quot;Gnuradio&quot; provides a separate development pac=
kage or SDK, be sure it has<br>|=C2=A0=C2=A0 been installed.<br>| <br>| <br=
>| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860q=
ds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/pkg-config (foun=
d version &quot;0.28&quot;)<br>| -- checking for module &#39;cppunit&#39;<b=
r>| --=C2=A0=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /op=
t/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sy=
sroots/b4860qds-<wbr>64b/usr/lib64/libcppunit.so;dl<br>| CMake Error at CMa=
keLists.txt:100 (message):<br>|=C2=A0=C2=A0 GnuRadio Runtime required to co=
mpile mac<br>| <br>| <br>| -- Configuring incomplete, errors occurred!<br>|=
 See also &quot;/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_=
<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-mac/0.0.1+<wbr>gitAUTOIN=
C+3ed6f08933-r0/<wbr>build/CMakeFiles/CMakeOutput.<wbr>log&quot;.<br>| WARN=
ING: exit code 1 from a shell command.<br>| ERROR: Function failed: do_conf=
igure (log file is located at /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build=
_b4860qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-mac/0.0.1+=
<wbr>gitAUTOINC+3ed6f08933-r0/temp/<wbr>log.do_configure.10950)<br>ERROR: T=
ask 1959 (/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/recipes-<wbr>sup=
port/gr-framers/<a href=3D"http://gr-framers_git.bb" target=3D"_blank">gr-f=
ramers_<wbr>git.bb</a>, do_configure) failed with exit code &#39;1&#39;<br>=
ERROR: Task 1985 (/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/recipes-=
<wbr>support/gr-mapper/<a href=3D"http://gr-mapper_git.bb" target=3D"_blank=
">gr-mapper_<wbr>git.bb</a>, do_configure) failed with exit code &#39;1&#39=
;<br>ERROR: Task 1972 (/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/rec=
ipes-<wbr>support/gr-mac/<a href=3D"http://gr-mac_git.bb" target=3D"_blank"=
>gr-mac_git.bb</a>, do_configure) failed with exit code &#39;1&#39;<br>ERRO=
R: Function failed: do_configure (log file is located at /opt/QorIQ-SDK-V1.=
8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc64e6500-<=
wbr>fsl-linux/gr-message-tools/0.<wbr>0.2+gitAUTOINC+c4ed7e3c1e-r0/<wbr>tem=
p/log.do_configure.10948)<br>ERROR: Logfile of failure stored in: /opt/QorI=
Q-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/work/ppc=
64e6500-<wbr>fsl-linux/gr-message-tools/0.<wbr>0.2+gitAUTOINC+c4ed7e3c1e-r0=
/<wbr>temp/log.do_configure.10948<br>Log data follows:<br>| DEBUG: Executin=
g python function sysroot_cleansstate<br>| DEBUG: Python function sysroot_c=
leansstate finished<br>| DEBUG: SITE files [&#39;endian-big&#39;, &#39;bit-=
64&#39;, &#39;powerpc-common&#39;, &#39;common-linux&#39;, &#39;common-glib=
c&#39;, &#39;powerpc-linux&#39;, &#39;powerpc64-linux&#39;, &#39;common&#39=
;]<br>| DEBUG: Executing shell function autotools_preconfigure<br>| DEBUG: =
Shell function autotools_preconfigure finished<br>| DEBUG: Executing python=
 function autotools_copy_aclocals<br>| DEBUG: Python function autotools_cop=
y_aclocals finished<br>| DEBUG: Executing shell function do_configure<br>| =
-- The CXX compiler identification is GNU 4.9.2<br>| -- The C compiler iden=
tification is GNU 4.9.2<br>| -- Check for working CXX compiler: /opt/QorIQ-=
SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/x=
86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-g++<=
br>| -- Check for working CXX compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>y=
octo/build_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin=
/ppc64e6500-fsl-<wbr>linux/powerpc64-fsl-linux-g++ -- works<br>| -- Detecti=
ng CXX compiler ABI info<br>| -- Detecting CXX compiler ABI info - done<br>=
| -- Check for working C compiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/=
build_b4860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc6=
4e6500-fsl-<wbr>linux/powerpc64-fsl-linux-gcc<br>| -- Check for working C c=
ompiler: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>re=
lease/tmp/sysroots/x86_64-<wbr>linux/usr/bin/ppc64e6500-fsl-<wbr>linux/powe=
rpc64-fsl-linux-gcc -- works<br>| -- Detecting C compiler ABI info<br>| -- =
Detecting C compiler ABI info - done<br>| -- Build type not specified: defa=
ulting to release.<br>| -- Boost version: 1.55.0<br>| -- Found the followin=
g Boost libraries:<br>| --=C2=A0=C2=A0 filesystem<br>| --=C2=A0=C2=A0 syste=
m<br>| -- Found PkgConfig: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4=
860qds-64b_<wbr>release/tmp/sysroots/x86_64-<wbr>linux/usr/bin/pkg-config (=
found version &quot;0.28&quot;)<br>| -- checking for module &#39;gnuradio-r=
untime&#39;<br>| --=C2=A0=C2=A0 found gnuradio-runtime, version 3.7.10<br>|=
 -- Found GNURADIO_RUNTIME: /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b=
4860qds-64b_<wbr>release/tmp/sysroots/b4860qds-<wbr>64b/usr/lib64/libgnurad=
io-<wbr>runtime.so<br>| -- checking for module &#39;cppunit&#39;<br>| --=C2=
=A0=C2=A0 found cppunit, version 1.13.1<br>| -- Found CPPUNIT: /opt/QorIQ-S=
DK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp/sysroots/b4=
860qds-<wbr>64b/usr/lib64/libcppunit.so;dl<br>| CMake Error at CMakeLists.t=
xt:94 (find_package):<br>|=C2=A0=C2=A0 By not providing &quot;FindGnuradio.=
cmake&quot; in CMAKE_MODULE_PATH this project has<br>|=C2=A0=C2=A0 asked CM=
ake to find a package configuration file provided by &quot;Gnuradio&quot;,<=
br>|=C2=A0=C2=A0 but CMake did not find one.<br>| <br>|=C2=A0=C2=A0 Could n=
ot find a package configuration file provided by &quot;Gnuradio&quot;<br>|=
=C2=A0=C2=A0 (requested version 3.7.2) with any of the following names:<br>=
| <br>|=C2=A0=C2=A0=C2=A0=C2=A0 GnuradioConfig.cmake<br>|=C2=A0=C2=A0=C2=A0=
=C2=A0 gnuradio-config.cmake<br>| <br>|=C2=A0=C2=A0 Add the installation pr=
efix of &quot;Gnuradio&quot; to CMAKE_PREFIX_PATH or set<br>|=C2=A0=C2=A0 &=
quot;Gnuradio_DIR&quot; to a directory containing one of the above files.=
=C2=A0 If<br>|=C2=A0=C2=A0 &quot;Gnuradio&quot; provides a separate develop=
ment package or SDK, be sure it has<br>|=C2=A0=C2=A0 been installed.<br>| <=
br>| <br>| -- Configuring incomplete, errors occurred!<br>| See also &quot;=
/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860qds-64b_<wbr>release/tmp=
/work/ppc64e6500-<wbr>fsl-linux/gr-message-tools/0.<wbr>0.2+gitAUTOINC+c4ed=
7e3c1e-r0/<wbr>build/CMakeFiles/CMakeOutput.<wbr>log&quot;.<br>| WARNING: e=
xit code 1 from a shell command.<br>| ERROR: Function failed: do_configure =
(log file is located at /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/build_b4860=
qds-64b_<wbr>release/tmp/work/ppc64e6500-<wbr>fsl-linux/gr-message-tools/0.=
<wbr>0.2+gitAUTOINC+c4ed7e3c1e-r0/<wbr>temp/log.do_configure.10948)<br>ERRO=
R: Task 1998 (/opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/recipes-<wbr=
>support/gr-message-tools/<a href=3D"http://gr-message-tools_git.bb" target=
=3D"_blank">gr-<wbr>message-tools_git.bb</a>, do_configure) failed with exi=
t code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 3576 tasks of which 35=
72 didn&#39;t need to be rerun and 4 failed.<br>Waiting for 0 running tasks=
 to finish:<br><br>Summary: 4 tasks failed:<br>=C2=A0 /opt/QorIQ-SDK-V1.8-2=
0150619-<wbr>yocto/meta-sdr/recipes-<wbr>support/gr-framers/<a href=3D"http=
://gr-framers_git.bb" target=3D"_blank">gr-framers_<wbr>git.bb</a>, do_conf=
igure<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/recipes-<w=
br>support/gr-mapper/<a href=3D"http://gr-mapper_git.bb" target=3D"_blank">=
gr-mapper_<wbr>git.bb</a>, do_configure<br>=C2=A0 /opt/QorIQ-SDK-V1.8-20150=
619-<wbr>yocto/meta-sdr/recipes-<wbr>support/gr-mac/<a href=3D"http://gr-ma=
c_git.bb" target=3D"_blank">gr-mac_git.bb</a>, do_configure<br>=C2=A0 /opt/=
QorIQ-SDK-V1.8-20150619-<wbr>yocto/meta-sdr/recipes-<wbr>support/gr-message=
-tools/<a href=3D"http://gr-message-tools_git.bb" target=3D"_blank">gr-<wbr=
>message-tools_git.bb</a>, do_configure<br>Summary: There were 4 ERROR mes<=
br></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c124a32a263a7053a8d380a--
