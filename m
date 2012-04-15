Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJNEu-0000Og-6L
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 13:03:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3FAs2lv010357
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 03:54:03 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 15 Apr 2012 03:54:02 -0700
Message-ID: <4F8AA8C8.2080507@windriver.com>
Date: Sun, 15 Apr 2012 18:54:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: meta-toolchain-sdk: unfs-server buid error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Apr 2012 11:03:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Does anyone meet the same error? I've met this from yesterday.

The host is Fedora 16 64bit,
MACHINE = "qemuarm"

$ bitbake meta-toolchain-sdk

| NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint 
-I/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
/buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I 
/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
/buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
-I /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I 
/buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
--force --warnings=cross
| aclocal: unknown warning category `cross'
| autoreconf: configure.in: tracing
| autoreconf: configure.in: not using Libtool
| autoreconf: running: 
/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/bin/autoconf 
--include=/buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 
--include=/buildarea/lyang1/sdk/tmp/work/x86_64-nativesdk-pokysdk-linux/unfs-server-nativesdk-2.1+2.2beta47-r1/nfs-server-2.2beta47//aclocal-copy/ 
--force --warnings=cross
| configure.in:43: error: possibly undefined macro: AC_PROG_RPCGEN
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| configure.in:44: error: possibly undefined macro: AC_RPCGEN_C
| configure.in:45: error: possibly undefined macro: AC_RPCGEN_I
| configure.in:53: error: possibly undefined macro: AC_GNULIBC
| configure.in:65: error: possibly undefined macro: AC_XDRPROC_T
| configure.in:85: error: possibly undefined macro: AC_AUTHDES_GETUCRED
| configure.in:86: error: possibly undefined macro: AC_BROKEN_SETFSUID
| configure.in:87: error: possibly undefined macro: AC_MOUNTLIST
| configure.in:88: error: possibly undefined macro: AC_FSUSAGE
| configure.in:91: error: possibly undefined macro: AC_BSD_SIGNALS
| autoreconf: /buildarea/lyang1/sdk/tmp/sysroots/x86_64-linux/usr/bin/autoconf 
failed with exit status: 1
| ERRO
NOTE: package unfs-server-nativesdk-2.1+2.2beta47-r1: task do_configure: Failed
ERROR: Task 1036 
(virtual:nativesdk:/buildarea/lyang1/poky/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb, 
do_configure) failed with exit code '1'

-- 
Thanks

Robert


