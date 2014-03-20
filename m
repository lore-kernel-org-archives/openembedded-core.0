Return-Path: <darren.hart@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 503F06EBA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:47:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2014 19:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,691,1389772800"; d="scan'208";a="495537885"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2014 19:47:58 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 19 Mar 2014 19:47:58 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.9]) by
	fmsmsx117.amr.corp.intel.com ([169.254.13.248]) with mapi id
	14.03.0123.003; Wed, 19 Mar 2014 19:47:58 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: libnewt and kexec-tools do_compile failure, missing DEPENDS?
Thread-Index: AQHPQ+bMKvsu6Ih11kiFVNnr7jX/ew==
Date: Thu, 20 Mar 2014 02:47:57 +0000
Message-ID: <CF4FA521.7A471%darren.hart@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.20.163]
MIME-Version: 1.0
Subject: libnewt and kexec-tools do_compile failure, missing DEPENDS?
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
X-List-Received-Date: Thu, 20 Mar 2014 02:47:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7179DDC1EAA0C4BBD4079CAF12AC507@intel.com>
Content-Transfer-Encoding: quoted-printable

I tripped over a couple of do_compile failures today with lib newt and
kexec-tools from master. After letting the -k image build complete and
performing a clean all on the two packages, the subsequent build command
succeeded. I suspect we have a missing DEPENDS in there that my modestly
parallel build system tripped over.

ERROR: Function failed: do_compile (log file is located at
/build/yocto/master/intel
-corei7-64_20140114211153/build/tmp/work/corei7-64-poky-linux/libnewt/0.52.
14-r2/tem
p/log.do_compile.11594)
ERROR: Logfile of failure stored in:
/build/yocto/master/intel-corei7-64_20140114211
153/build/tmp/work/corei7-64-poky-linux/libnewt/0.52.14-r2/temp/log.do_comp
ile.11594
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86
_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 12
| make: *** No rule to make target
`/build/yocto/master/intel-corei7-64_201401142111
53/build/tmp/sysroots/intel-corei7-64/usr/include/bits/predefs.h', needed
by `test.o
'.  Stop.
| ERROR: oe_runmake failed
| WARNING:=20
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-
64-poky-linux/libnewt/0.52.14-r2/temp/run.do_compile.11594:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-64
-poky-linux/libnewt/0.52.14-r2/temp/log.do_compile.11594)
ERROR: Task 2714=20
(/build/yocto/master/intel-corei7-64_20140114211153/poky/meta/recipes-exten
ded/newt/libnewt_0.52.14.bb, do_compile) failed with exit code '1'

ERROR: Function failed: do_compile (log file is located at
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-64
-poky-linux/kexec-tools/2.0.4-r0/temp/log.do_compile.11603)
ERROR: Logfile of failure stored in:
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-64
-poky-linux/kexec-tools/2.0.4-r0/temp/log.do_compile.11603
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 12
| make: *** No rule to make target
`/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/sysroots/inte
l-corei7-64/usr/include/bits/predefs.h', needed by `kexec/kexec.o'.  Stop.
| ERROR: oe_runmake failed
| WARNING:=20
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-64
-poky-linux/kexec-tools/2.0.4-r0/temp/run.do_compile.11603:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/build/yocto/master/intel-corei7-64_20140114211153/build/tmp/work/corei7-64
-poky-linux/kexec-tools/2.0.4-r0/temp/log.do_compile.11603)
ERROR: Task 1788=20
(/build/yocto/master/intel-corei7-64_20140114211153/poky/meta/recipes-kerne
l/kexec/kexec-tools_2.0.4.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5943 tasks of which 5941 didn't need to be
rerun and 2 failed.
No currently running tasks (4019 of 5970)



--=20
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center




