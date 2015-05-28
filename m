Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E11D6E5D0;
	Thu, 28 May 2015 13:16:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2015 06:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,513,1427785200"; d="scan'208";a="733097705"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.72.87])
	([10.237.72.87])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2015 06:15:55 -0700
Message-ID: <5566B28E.9080502@linux.intel.com>
Date: Thu, 28 May 2015 09:15:42 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20150528084536.GB2383@jama>
	<1978636.L3ktc4a7s3@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1978636.L3ktc4a7s3@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-05-27
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
X-List-Received-Date: Thu, 28 May 2015 13:16:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2015 01:04 PM, Paul Eggleton wrote:

>
> This seems to be related to gstreamer 0.10 removal; though it's QtWebkit that's
> failing rather than Phonon:
>
> | cd WebKit/qt/tests/ && /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/qmake2 -after              INCPATH+=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/freetype2 LIBS+=-L/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pro -spec /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/mkspecs/linux-g++ -after  INCPATH+=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/freetype2 LIBS+=-L/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib -o Makefile.WebKit
> | WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):1: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | WARNING: (internal):3: Variable INCPATH is deprecated; use INCLUDEPATH instead.
> | Project ERROR: Package gstreamer-app-0.10 not found
> | make[1]: *** [WebCore/Makefile.WebKit] Error 2
> | make[1]: *** Waiting for unfinished jobs....
> | Project ERROR: Package gstreamer-app-0.10 not found
> | make[1]: *** [WebKit/qt/Makefile.WebKit.QtWebKit] Error 2
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/qt-everywhere-opensource-src-4.8.6/src/3rdparty/webkit/Source'
> | make: *** [sub-webkit-make_default-ordered] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qt4-x11-free/4.8.6-r0/temp/log.do_compile.14903)
>
> Alex, can you take a look at this?

I already did; it should be fixed by this patch:

http://lists.openembedded.org/pipermail/openembedded-core/2015-May/105413.html

Regards,
Alex


