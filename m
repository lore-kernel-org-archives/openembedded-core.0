Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 324E675BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:53:32 +0000 (UTC)
Received: by wguu7 with SMTP id u7so8843470wgu.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 05:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=+pYSVZeCfLUn2HFfW2FvXOuvsUe5hF5nhtpMpjZHYRU=;
	b=jbzPW2TjIsLQBrsdGuUK0yMrerEQizKlV1qU5UVzrOo8CBdzZcGx+VUT17x639GNNV
	aMUf7e1Kcb5QU6xhOzMV+DXwmSZjV5R8O8/bSA3GlMa4SYsTWaWCwHwa9Tq2fu+WWeL8
	h53tuwuZJmbcZCyzXbBb+C/Hqs9BedxobpXEL6t90MsXwSdHNdXcarAvj0VJq+Z4dD8d
	Hgeq434k7YQu+XAL0FaNZZNPMd1ZjTHF/u1lEYFKiXYH+XIzHRGfWfUuIC4ci/SMV5WB
	R+Yzilw6BFwmEtn4bsFXQu5wggWBPyf3VVRzejI7NhuMUADop+QmVCmKbpehjsLPRSCI
	NekQ==
X-Gm-Message-State: ALoCoQkMALcMNdG4Bg0mb/982nozPEi+9AzU9zG/Ef2RZt1T3Kc26jPTqKkDFuUl6PMO7fuO8qA6
X-Received: by 10.180.106.195 with SMTP id gw3mr33674559wib.25.1435668813173; 
	Tue, 30 Jun 2015 05:53:33 -0700 (PDT)
Received: from ?IPv6:2001:610:612::7943:57f:5004:cee1?
	([2001:610:612:0:7943:57f:5004:cee1])
	by mx.google.com with ESMTPSA id e2sm43403687wjw.12.2015.06.30.05.53.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jun 2015 05:53:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <55927020.3010605@herbrechtsmeier.net>
Date: Tue, 30 Jun 2015 14:53:29 +0200
Message-Id: <00D88AEB-7B18-4906-8FD3-11B46A01BC11@dominion.thruhere.net>
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
	<mmtpa9$67d$1@ger.gmane.org> <55927020.3010605@herbrechtsmeier.net>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 12:53:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 30 jun. 2015, om 12:32 heeft Stefan Herbrechtsmeier =
<stefan@herbrechtsmeier.net> het volgende geschreven:
>=20
> Am 30.06.2015 um 11:59 schrieb Koen Kooi:
>> Burton, Ross schreef op 30-06-15 om 11:44:
>>> On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com> wrote:
>>>=20
>>>> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke =
mariadb
>>>> in meta-oe.
>>>>=20
>>>> DOes  the person who updated cmake need to fix this or the person =
who
>>>> is feeling the pain will be fixing it ?
>>>>=20
>>> Depends on what the breakage is really.  Can you provide build logs?
>> ERROR: Function failed: do_configure (log file is located at
>> =
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.4=
4-r0/temp/log.do_configure.25603)
>> ERROR: Logfile of failure stored in:
>> =
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.4=
4-r0/temp/log.do_configure.25603
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function autotools_preconfigure
>> | DEBUG: Shell function autotools_preconfigure finished
>> | DEBUG: Executing python function autotools_copy_aclocals
>> | DEBUG: Python function autotools_copy_aclocals finished
>> | DEBUG: Executing shell function do_configure
>> | -- Running cmake version 3.2.2
>> | -- The C compiler identification is GNU 4.8.3
>> | -- The CXX compiler identification is GNU 4.8.3
>> | CMake Error at CMakeLists.txt:86 (PROJECT):
>> |   The CMAKE_C_COMPILER:
>> |
>> |     gcc
>> |
>> |   is not a full path and was not found in the PATH.
>> |
>> |   Tell CMake where to find the compiler by setting either the =
environment
>> |   variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the =
full path to
>> |   the compiler, or to the compiler name if it is in the PATH.
>> |
>> |
>> | CMake Error at CMakeLists.txt:86 (PROJECT):
>> |   The CMAKE_CXX_COMPILER:
>> |
>> |     g++
>> |
>> |   is not a full path and was not found in the PATH.
>> |
>> |   Tell CMake where to find the compiler by setting either the =
environment
>> |   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the =
full path
>> |   to the compiler, or to the compiler name if it is in the PATH.
>> |
>> |
>> | -- Configuring incomplete, errors occurred!
> The problem should be the usage of cmake for a native package.
>=20
> The cmake.bbclass disables the host path and thereby CMake could not =
find the gcc binary.
>=20
> I think the cmake.bbclass need to distinguish between cross and native =
build and set the following for native build:
> set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
> set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH )
> set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )
>=20
> This allows CMake to search the binaries, libraries and includes first =
in the CMAKE_FIND_ROOT_PATH, then in the CMAKE_SYSROOT and then in the =
non-rooted directories.

THanks for the hint, I=E2=80=99m going to test something like this:

[koen@thinkpad classes]$ git diff
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index b0a3972..ead4a26 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,6 +27,13 @@ OECMAKE_RPATH ?=3D ""
 OECMAKE_PERLNATIVE_DIR ??=3D ""
 OECMAKE_EXTRA_ROOT_PATH ?=3D ""
=20
+OECMAKE_PATHS ?=3D ""
+OECMAKE_PATHS_class-native =3D " \
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH ) \
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH ) \
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH ) \
+"
+
 cmake_do_generate_toolchain_file() {
        cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
@@ -67,7 +74,10 @@ list(APPEND CMAKE_MODULE_PATH =
"${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
=20
+${OECMAKE_PATHS}
+
 EOF
+
 }
=20
 addtask generate_toolchain_file after do_patch before do_configure


