Return-Path: <preid@electromag.com.au>
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
	by mail.openembedded.org (Postfix) with ESMTP id C5C0F610EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 03:26:14 +0000 (UTC)
Received: (qmail 17380 invoked by uid 5089); 17 Feb 2020 03:26:15 -0000
Received: by simscan 1.2.0 ppid: 17347, pid: 17351, t: 0.0384s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.22?)
	(preid@electromag.com.au@203.59.235.95)
	by anchovy1.45ru.net.au with ESMTPA; 17 Feb 2020 03:26:14 -0000
From: Phil Reid <preid@electromag.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
Date: Mon, 17 Feb 2020 11:26:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
Subject: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Mon, 17 Feb 2020 03:26:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi All,

I recently started get the following failure with bash after "b348e31c93f0 bash: Fix CVE-2019-18276"
was applied to zeus.

Any thoughts?


NOTE: Applying patch 'bash50-001' (downloads/bash50-001)
NOTE: Applying patch 'bash50-002' (downloads/bash50-002)
NOTE: Applying patch 'bash50-003' (downloads/bash50-003)
NOTE: Applying patch 'bash50-004' (downloads/bash50-004)
NOTE: Applying patch 'bash50-005' (downloads/bash50-005)
NOTE: Applying patch 'bash50-006' (downloads/bash50-006)
NOTE: Applying patch 'bash50-007' (downloads/bash50-007)
NOTE: Applying patch 'execute_cmd.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/execute_cmd.patch)
NOTE: Applying patch 'mkbuiltins_have_stringize.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch)
NOTE: Applying patch 'build-tests.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/build-tests.patch)
NOTE: Applying patch 'test-output.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/test-output.patch)
NOTE: Applying patch 'fix-run-builtins.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/fix-run-builtins.patch)
NOTE: Applying patch 'bash-CVE-2019-18276.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch)
ERROR: Command Error: 'quilt --quiltrc 
/home/preid/dev/linux/v2019.11/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/bash/5.0-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch bash-CVE-2019-18276.patch
patching file MANIFEST
patching file bashline.c
patching file builtins/help.def
patching file config.h.in
patching file configure
Hunk #1 FAILED at 10281.
1 out of 1 hunk FAILED -- rejects in file configure
patching file configure.ac
patching file doc/bash.1
patching file doc/bashref.texi
patching file lib/glob/glob.c
patching file pathexp.c
patching file shell.c
patching file tests/glob.tests
patching file tests/glob6.sub
patching file tests/glob7.sub
Patch bash-CVE-2019-18276.patch does not apply (enforce with -f)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished

-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au

