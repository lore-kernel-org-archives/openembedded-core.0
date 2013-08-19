Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DF86169686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 08:25:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Aug 2013 01:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,912,1367996400"; d="scan'208";a="283738991"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Aug 2013 01:24:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cristiana Voicu <cristiana.voicu@intel.com>
Date: Mon, 19 Aug 2013 09:24:54 +0100
Message-ID: <2871332.fhu1i0uVde@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
References: <cover.1376641437.git.cristiana.voicu@intel.com>
	<f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] cronie: upgrade to 1.4.11
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
X-List-Received-Date: Mon, 19 Aug 2013 08:25:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Cristiana,

On Friday 16 August 2013 11:30:49 Cristiana Voicu wrote:
> LIC_FILES_CHKSUM changed because cron.h doesn't exist anymore.
> Replaced it with cron.c.
>...

A couple of people have reported this doesn't build, and I've confirmed it this morning:

| mips-poky-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32 --sysroot=/media/large/tmp/sysroots/qemumips -DHAVE_CONFIG_H -I. -I/media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/cronie-1.4.11/src -I..     -O2 -pipe -g -feliminate-unused-debug-types -c /media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/cronie-1.4.11/src/database.c
| /media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/cronie-1.4.11/src/security.c:32:27: fatal error: cronie_common.h: No such file or directory
|  #include "cronie_common.h"
|                            ^
| compilation terminated.
| /media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/cronie-1.4.11/src/crontab.c:59:27: fatal error: cronie_common.h: No such file or directory
|  #include "cronie_common.h"
|                            ^
| compilation terminated.
| make[3]: *** [security.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [crontab.o] Error 1
| /media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/cronie-1.4.11/src/cron.c:52:27: fatal error: cronie_common.h: No such file or directory
|  #include "cronie_common.h"
|                            ^
| compilation terminated.
| make[3]: *** [cron.o] Error 1
| make[3]: Leaving directory `/media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/build/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/build/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /media/large/tmp/work/mips32-poky-linux/cronie/1.4.11-r0/temp/log.do_compile.22142)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

