Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6306371A00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:00:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 05:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="42151640"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 21 Dec 2016 05:00:58 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2248E6A4080;
	Wed, 21 Dec 2016 05:00:07 -0800 (PST)
Date: Wed, 21 Dec 2016 15:00:43 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161221130043.GA9628@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
	<20161220140412.GA16406@linux.intel.com>
	<CAD4b0_JGK0zGsNEOSN1T_w-jKMFRnnbzTxVdYkxE=+1cQu5nRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_JGK0zGsNEOSN1T_w-jKMFRnnbzTxVdYkxE=+1cQu5nRw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 0/5] wic: bugfixes & --fixed-size support, tests, oeqa: enhancements
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
X-List-Received-Date: Wed, 21 Dec 2016 13:00:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 20, 2016 at 07:27:04PM +0100, Maciej Borzęcki wrote:
> On Tue, Dec 20, 2016 at 3:04 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Mon, Dec 19, 2016 at 12:20:56PM +0100, Maciej Borzecki wrote:
> >> v6 of a patch series previously posted here [1].
> >>
> >> Changes since v5:
> >>
> >> * `oe-selftest: enforce en_US.UTF-8 locale` was merged to master, hence it's no
> >>   longer part of this series
> >>
> >> * rebased on top of master (d0d260b0b85790ceb136dd6b0445e8e33d038f5e)
> >>
> >
> > The patchset looks good to me. Thank you.
> >
> > Couple of questions:
> > - did you test if Lars' change
> >   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=db08ffee0ad1451f3bf710f4d1b623938ba9aefb
> >   works with your patchset?
> 
> Yes. The series was rebased on top of
> d0d260b0b85790ceb136dd6b0445e8e33d038f5e, which includes Lars' patch.

The series causes conflicts on the latest master. Can you check if it's
really the case or it's just something wrong with my setup?

git-pw apply 3904
Applying series: wic: bugfixes & --fixed-size support, tests,
oe-selftest: minor fixes (rev 3)
Applying: oe-selftest: enforce en_US.UTF-8 locale
Using index info to reconstruct a base tree...
M	scripts/oe-selftest
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: oeqa/utils/commands.py: allow use of binaries from native
sysroot
Applying: wic: add --fixed-size wks option
Applying: wic: selftest: avoid COMPATIBLE_HOST issues
Using index info to reconstruct a base tree...
M	meta/lib/oeqa/selftest/wic.py
Falling back to patching base and 3-way merge...
Auto-merging meta/lib/oeqa/selftest/wic.py
CONFLICT (content): Merge conflict in meta/lib/oeqa/selftest/wic.py
Failed to merge in the changes.
Patch failed at 0004 wic: selftest: avoid COMPATIBLE_HOST issues
The copy of the patch that failed is found in:
   /home/ed/git/yocto/patchtest/openembedded-core/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


> The tests passed on all MACHINES I've used (though I'm not sure if
> scenario addressed in that patch is covered by relevant test cases).
>

I've asked Lars to add test case for that functionality.

> I believe I have also hit a weird bug in BitbakeVars._parse_line() while
> testing with this patch and meta-mender. I Hope you can confirm it.
>

Yes, I confirm this. Thanks for poining out to it. I'll fix it today.

> From a quick investigation I have determined that _parse_line() may
> interpret arbitrary lines that are of 'key=value' format as legitimate
> bitbake variables. In my case, IMAGE_CMD_sdimg defined in
> mender-sdimg.bbclass includes the following piece:
> 
>     IMAGE_CMD_sdimg() {
>         ...
>         REMAINING_SIZE=$(expr ${MENDER_STORAGE_TOTAL_SIZE_MB} - \
>         ${MENDER_BOOT_PART_SIZE_MB} - \
>         ${MENDER_DATA_PART_SIZE_MB} - \
>         ${MENDER_PARTITIONING_OVERHEAD_MB} - \
>         $boot_env_size_mb)
>         ROOTFS_SIZE=$(expr $REMAINING_SIZE / 2)
>         ...
>     }
> 
> This will obviously be seen in `bitbake -e output`. Looking at code
> here:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/utils/oe/misc.py?id=db08ffee0ad1451f3bf710f4d1b623938ba9aefb#n151
> the line will be split at '=', then whitespace will be stripped from
> both key and value. So a line (taken from bitbake -e):
> 
>     ROOTFS_SIZE=\$(expr \$REMAINING_SIZE / 2)
> 
> Will define a variable ROOTFS_SIZE with value '\\$(expr \\$REMAINING_SIZE / 2)'.
> 
> It's a pure coincidence that Lars' patch queries ROOTFS_SIZE which also
> appears in bitbake -e output under exactly the same name.
> 
> IMO, when parsing env output, we should expect variable name to start
> right at the beginning of a line, IOW skip the line if key[0].isspace() == True
> 
> >
> > - Regarding oe-selftest fixes, wich machine did you run oe-selftest on?
> >   It looks to me that a lot of test cases can be run on your machine
> >   if we use another wks.
> 
> I've run it on beaglebone, vexpress-qemu, qemux86 and qemuarm. Agree
> with your observation though. I think that at least these TCs could be
> made machine agnostic:
> 
> - test_build_artifacts
> - test_build_image_name
> - test_compress_*
> - test_gpt_image
> - test_wic_image_type
> - test_wrong_compressor
> - test_rootfs_*
> 
> 

Yes, that's exactly my point. We should make generic tests work on any
machine.

Would you be willing to do this in a separate patchset together with
your oe-selftest core fixes?

I'd suggest to only include new testcase that works on qemu-x86* into
this patchset. It will make it faster to get merged.

> 
> >
> >> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129187.html
> >>
> >> Maciej Borzecki (5):
> >>   oeqa/utils/commands.py: allow use of binaries from native sysroot
> >>   wic: add --fixed-size wks option
> >>   wic: selftest: avoid COMPATIBLE_HOST issues
> >>   wic: selftest: do not assume bzImage kernel image
> >>   wic: selftest: add tests for --fixed-size partition flags
> >>
> >>  meta/lib/oeqa/selftest/wic.py          | 117 +++++++++++++++++++++++++++++++--
> >>  meta/lib/oeqa/utils/commands.py        |   9 ++-
> >>  scripts/lib/wic/help.py                |  14 +++-
> >>  scripts/lib/wic/imager/direct.py       |   2 +-
> >>  scripts/lib/wic/ksparser.py            |  41 ++++++++++--
> >>  scripts/lib/wic/partition.py           |  88 +++++++++++++++----------
> >>  scripts/lib/wic/utils/partitionedfs.py |   2 +-
> >>  7 files changed, 224 insertions(+), 49 deletions(-)

--
Regards,
Ed

