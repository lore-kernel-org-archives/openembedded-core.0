Return-Path: <preid@electromag.com.au>
Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
	by mail.openembedded.org (Postfix) with ESMTP id 381BB615B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:41:17 +0000 (UTC)
Received: (qmail 16194 invoked by uid 5089); 18 Feb 2020 06:41:17 -0000
Received: by simscan 1.2.0 ppid: 16115, pid: 16116, t: 0.0734s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.22?)
	(preid@electromag.com.au@203.59.235.95)
	by anchovy3.45ru.net.au with ESMTPA; 18 Feb 2020 06:41:17 -0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andrey Zhizhikin <andrey.z@gmail.com>,
	"Armin Kuster \(akuster808@gmail.com\)" <akuster808@gmail.com>
References: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
	<CAHtQpK6MfQ2oheoPYv=PDJER8ThUd8Y_AuOtTQrbH_M8z+4Tdg@mail.gmail.com>
	<981f9211365c2dfc6da70b737f43f3e89d87f7d4.camel@linuxfoundation.org>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <c753582b-0ba2-dbbe-df25-a9ea9cb184b6@electromag.com.au>
Date: Tue, 18 Feb 2020 14:41:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <981f9211365c2dfc6da70b737f43f3e89d87f7d4.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Tue, 18 Feb 2020 06:41:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17/02/2020 17:55, Richard Purdie wrote:
> On Mon, 2020-02-17 at 07:44 +0100, Andrey Zhizhikin wrote:
>> On Mon, Feb 17, 2020 at 4:26 AM Phil Reid <preid@electromag.com.au>
>> wrote:
>>> Hi All,
>>>
>>> I recently started get the following failure with bash after
>>> "b348e31c93f0 bash: Fix CVE-2019-18276"
>>> was applied to zeus.
>>>
>>> Any thoughts?
>>>
>>>
>>> NOTE: Applying patch 'bash50-001' (downloads/bash50-001)
>>> NOTE: Applying patch 'bash50-002' (downloads/bash50-002)
>>> NOTE: Applying patch 'bash50-003' (downloads/bash50-003)
>>> NOTE: Applying patch 'bash50-004' (downloads/bash50-004)
>>> NOTE: Applying patch 'bash50-005' (downloads/bash50-005)
>>> NOTE: Applying patch 'bash50-006' (downloads/bash50-006)
>>> NOTE: Applying patch 'bash50-007' (downloads/bash50-007)
>>> NOTE: Applying patch 'execute_cmd.patch' (layers/openembedded-
>>> core/meta/recipes-extended/bash/bash/execute_cmd.patch)
>>> NOTE: Applying patch 'mkbuiltins_have_stringize.patch'
>>> (layers/openembedded-core/meta/recipes-
>>> extended/bash/bash/mkbuiltins_have_stringize.patch)
>>> NOTE: Applying patch 'build-tests.patch' (layers/openembedded-
>>> core/meta/recipes-extended/bash/bash/build-tests.patch)
>>> NOTE: Applying patch 'test-output.patch' (layers/openembedded-
>>> core/meta/recipes-extended/bash/bash/test-output.patch)
>>> NOTE: Applying patch 'fix-run-builtins.patch' (layers/openembedded-
>>> core/meta/recipes-extended/bash/bash/fix-run-builtins.patch)
>>> NOTE: Applying patch 'bash-CVE-2019-18276.patch'
>>> (layers/openembedded-core/meta/recipes-extended/bash/bash/bash-CVE-
>>> 2019-18276.patch)
>>> ERROR: Command Error: 'quilt --quiltrc
>>> /home/preid/dev/linux/v2019.11/tmp-glibc/work/cortexa9t2hf-neon-
>>> emit-linux-gnueabi/bash/5.0-r0/recipe-sysroot-native/etc/quiltrc
>>> push' exited with 0  Output:
>>> Applying patch bash-CVE-2019-18276.patch
>>> patching file MANIFEST
>>> patching file bashline.c
>>> patching file builtins/help.def
>>> patching file config.h.in
>>> patching file configure
>>> Hunk #1 FAILED at 10281.
>>> 1 out of 1 hunk FAILED -- rejects in file configure
>>> patching file configure.ac
>>> patching file doc/bash.1
>>> patching file doc/bashref.texi
>>> patching file lib/glob/glob.c
>>> patching file pathexp.c
>>> patching file shell.c
>>> patching file tests/glob.tests
>>> patching file tests/glob6.sub
>>> patching file tests/glob7.sub
>>> Patch bash-CVE-2019-18276.patch does not apply (enforce with -f)
>>> DEBUG: Python function patch_do_patch finished
>>> DEBUG: Python function do_patch finished
>>
>> Had the same issue the day before, re-building bash clean solved it.
>> At first I wanted to report it as well, but then after I tried "-c
>> cleanall" - the issue was gone.
>>
>> Try to do a clean build of bash and see if it is still reproducible.
> 
> I think I understand what happens here. When you do a rebuild, bitbake
> tries to pop off all the old patches, then apply the new ones.
> 
> In this case its patching configure which we rebuild. It therefore
> can't apply the new patch to configure since its changed by the
> do_configure task.
> 
> The fix is to remove the configure change from the patch since we just
> need the configure.ac piece.
> 
I've run "bitbake -c cleanall bash" and the build has then succeeded.
I guess we wait and see if it pops up again when bash needs to be rebuilt.

I did try quickly hacking the patch and removing the configure patch section, but
the resulting configure looked different. So I went with the easy option above.

Thanks
Phil

