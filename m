Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6369D65C85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 07:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1I7fFTN011356; Wed, 18 Feb 2015 07:41:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sEoM3g9BfTWY; Wed, 18 Feb 2015 07:41:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1I7f1eA011332
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Feb 2015 07:41:13 GMT
Message-ID: <1424245261.25541.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Wed, 18 Feb 2015 07:41:01 +0000
In-Reply-To: <7c630178dda359245ed1c5e58b191ed927a2e2a0.1424210642.git.alejandro.hernandez@linux.intel.com>
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
	<7c630178dda359245ed1c5e58b191ed927a2e2a0.1424210642.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] Python: Upgrade from 2.7.3 to 2.7.9:
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
X-List-Received-Date: Wed, 18 Feb 2015 07:41:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-17 at 16:22 -0600, Alejandro Hernandez wrote:
> - Based on Paul Eggletons work to partially upgrade to Python 2.7.6
> 
> Modified:
> default-versions.inc: switched to python 2.7.9
> generate-manifest-2.7.py: fixed _sysconfigdata
> python-2.7-manifest.inc: fixed _sysconfigdata
> python.inc: Updated checksums and source, no LICENSE
> change just updated some dates
> python-native_2.7.3 -> python-native_2.7.9 and updated patches
> python_2.7.3 -> python_2.7.9, and added ac_cv_file__dev_ptmx=no
> ac_cv_file__dev_ptc=no in EXTRA_OECONF to solve python
> issue #3754, only needed when cross compiling, also updated patches
> use_sysroot_ncurses_instead_of_host.patch: New patch to use ncursesw
> from sysroot instead of hosts, introduced by fix for python issue #15268
> 
> Rebased:
> 01-use-proper-tools-for-cross-build.patch
> 03-fix-tkinter-detection.patch
> 05-enable-ctypes-cross-build.patch
> 06-avoid_usr_lib_termcap_path_in_linking.patch
> avoid_warning_about_tkinter.patch
> builddir.patch
> fix_for_using_different_libdir.patch
> host_include_contamination.patch
> multilib.patch
> nohostlibs.patch
> search_db_h_in_inc_dirs_and_avoid_warning.patch
> 
> Deleted (fixed on upstream):
> 06-ctypes-libffi-fix-configure.patch
> CVE-2013-4073_py27.patch
> gcc-4.8-fix-configure-Wformat.patch
> json-flaw-fix.patch
> posix_close.patch
> pypirc-secure.patch
> python-2.7.3-CVE-2012-2135.patch
> python-2.7.3-CVE-2013-1752-smtplib-fix.patch
> python-2.7.3-CVE-2014-1912.patch
> python-2.7.3-CVE-2014-7185.patch
> python-2.7.3-berkeley-db-5.3.patch
> python-fix-build-error-with-Readline-6.3.patch
> remove-BOM-insection-code.patch
> remove_sqlite_rpath.patch
> python2.7.3-nossl3.patch
> 
> [YOCTO #7059]

The autobuilder highlkighted some issues which look to be from this
patch:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=1894499d6d00badb0e03fb644ac61258b00e061b

Specifically the perf and python-smartpm failures.

Cheers,

Richard



