Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E786D6A465
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 11:49:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jun 2013 04:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,968,1363158000"; d="scan'208";a="358068752"
Received: from unknown (HELO helios.localnet) ([10.252.121.210])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2013 04:45:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Jun 2013 12:44:20 +0100
Message-ID: <13328827.HgqEOfqNcC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130630103422.GA3261@jama>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD8650.7050806@windriver.com> <20130630103422.GA3261@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Sun, 30 Jun 2013 11:49:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 30 June 2013 12:34:22 Martin Jansa wrote:
> There is another qt4 issue which causes cmake-native to fail or was
> cmake changed to require qt4 installed on host?

Certainly not. I had a report of this issue but wasn't able to reproduce it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4565

Are you able to help me do that?
 
> | CMake Warning at Modules/FindQt4.cmake:657 (message):
> |   /usr/bin/qmake reported QT_INSTALL_LIBS as "/usr/lib/x86_64-linux-gnu"
> |   but
> |   QtCore could not be found there.  Qt is NOT installed correctly for the
> |   target build environment.
> | 
> | Call Stack (most recent call first):
> |   Tests/RunCMake/CMakeLists.txt:79 (find_package)
> | 
> | -- Looking for Q_WS_X11
> | -- Looking for Q_WS_X11 - not found
> | -- Looking for Q_WS_WIN
> | -- Looking for Q_WS_WIN - not found
> | -- Looking for Q_WS_QWS
> | -- Looking for Q_WS_QWS - not found
> | -- Looking for Q_WS_MAC
> | -- Looking for Q_WS_MAC - not found
> | 
> | CMake Error at Modules/FindQt4.cmake:1032 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/RunCMake/CMakeLists.txt:79 (find_package)
> | 
> | CMake Error at Modules/FindQt4.cmake:1037 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/RunCMake/CMakeLists.txt:79 (find_package)
> | 
> | CMake Error at Modules/FindQt4.cmake:1040 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/RunCMake/CMakeLists.txt:79 (find_package)
> | 
> | CMake Warning at Modules/FindQt4.cmake:657 (message):
> |   /usr/bin/qmake reported QT_INSTALL_LIBS as "/usr/lib/x86_64-linux-gnu"
> |   but
> |   QtCore could not be found there.  Qt is NOT installed correctly for the
> |   target build environment.
> | 
> | Call Stack (most recent call first):
> |   Tests/CMakeLists.txt:263 (find_package)
> | 
> | CMake Error at Modules/FindQt4.cmake:1032 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/CMakeLists.txt:263 (find_package)
> | 
> | CMake Error at Modules/FindQt4.cmake:1037 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/CMakeLists.txt:263 (find_package)
> | 
> | CMake Error at Modules/FindQt4.cmake:1040 (set_property):
> |   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
> |   been created.
> | 
> | Call Stack (most recent call first):
> |   Tests/CMakeLists.txt:263 (find_package)
> | 
> | -- Could NOT find Qt4 (missing:  QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE
> | QT_UIC_EXECUTABLE QT_INCLUDE_DIR QT_LIBRARY_DIR QT_QTCORE_LIBRARY) (found
> | version "4.8.1") -- Performing Test run_pic_test
> | -- Performing Test run_pic_test - Success
> | -- Configuring incomplete, errors occurred!
> | ---------------------------------------------
> | Error when bootstrapping CMake:
> | Problem while running initial CMake
> | ---------------------------------------------
> | ERROR: Function failed: do_configure (log file is located at
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/
> | cmake-native/2.8.11.1-r0/temp/log.do_configure.19730)
> NOTE: recipe cmake-native-2.8.11.1-r0: task do_configure: Failed
> 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

