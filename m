Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 48ABC6B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:13:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2013 07:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="270105391"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2013 07:13:45 -0700
Message-ID: <51E7F819.5040109@linux.intel.com>
Date: Thu, 18 Jul 2013 07:13:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<3464105.VeimZdSK2P@helios>
In-Reply-To: <3464105.VeimZdSK2P@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 14:13:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2013 02:43 AM, Paul Eggleton wrote:
> On Wednesday 17 July 2013 23:34:31 Saul Wold wrote:
>> Ross, Paul:
>>
>> Please review this set and ACK as appropriate, I will rebase based
>> on your input.  This this is on the AB down, we have known issues with
>> systemd. This addresses many of the M2 related issues and fixes the
>> testimage infrasturcture on teh AutoBuilder
>>
>> Please look at Qi's "EXTRA_USER" changes
>>
>> There are a couple of patches that are on Poky, that need to be merged
>> one is to tiny and the other is to include the securiy flags for the LSB
>> images. That way they get tested with 1/2 the images built
>>
>> Sau!
>>
>> The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:
>>
>>    lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
>> stage
>>
>> Bruce Ashfield (3):
>>    linux-yocto/3.8: update META srcrev
>>    linux-yocto/3.4: mips: fix gcc 4.8 compilation
>>    linux-yocto/3.8: restore qemumips64 SRCREV
>>
>> Chen Qi (5):
>>    tar: remove an erroneous patch
>>    useradd_base.bbclass: add a new bbclass
>>    useradd.bbclass: code refactor
>>    extrausers.bbclass: add a new bbclass
>
> I agree with Otavio, the first two patches should be squashed together.
> Otherwise the changes look OK.
>
Ok, will drop this set for now.

>>    local.conf.sample.extended: add example for EXTRA_USERS_PARAMS
>>
>> Cristian Iorga (2):
>>    bluez4: conflicts with bluez5
>>    bluez5: new package for v5.7
>
> Didn't you find these caused world build failures?
>
No it was just a note and the issue could be handled later with a 
separate patch


>> Felipe F. Tonello (3):
>>    pulseaudio: Added cli-protocol-unix to pulseaudio-misc
>>    valgrind: added perl dependency
>>    pulseaudio: Removed avahi forced dependency
>>
>> Hongxu Jia (2):
>>    udev-extraconf: allow users in disk group to write vfat filesystem
>>    xuser-account: add xuser to disk group
>>
>> Joe Slater (1):
>>    curl: add upstream status to patch
>>
>> Jonathan Liu (1):
>>    gdb: add PACKAGECONFIG for Python support
>>
>> Kai Kang (1):
>>    tcl: fix typo of upstream status in patch file
>>
>> Khem Raj (4):
>>    gcc-4.8: Fix on-device SDK C++ runtime issue
>>    uclibc: Build ldd/ldcondif/iconv for main uclibc recipe
>>    eglibc-2.18: Remove unused patches
>>    eglibc-2.18: Update to latest snapshot
>>
>> Mark Hatle (4):
>>    sanity.bbclass: Update gcc sanity check
>>    terminal.bbclass: Fix BB_RUNFMT processing
>>    busybox: fix ip reference in simple.script
>>    dbus-ptest: Disable python module check
>>
>> Paul Eggleton (4):
>>    qt-mobility: tighten up config generation and use PACKAGECONFIG
>>    classes/insane: fix regression in libdir QA regex
>>    classes/insane: allow libdir QA check to be skipped using INSANE_SKIP
>>    scripts/contrib/*: fix arithmetic bashism
>>
>> Roy.Li (1):
>>    dpkg: backport a patch to support mipsn32el and mips64el
>
> Not sure if case is a big issue for Upstream-Status values but this one has
> "Upstream-Status: BackPort".
>
I will tweak the patch
>>
>> Saul Wold (2):
>>    Upstream-Status: Correct capitalization
>>    buildtools: testimage needs the mmap python
>
> If we're changing other things I'd like to see the commit message corrected
> for the above (buildtools -> buildtools-tarball and python -> python module;
> also the commit message should go into a little bit more detail e.g. "Add
> python-mmap which is needed by the new testimage class on machines that need
> buildtools-tarball installed".
>
Sure, will update this.

>> Simon Busch (1):
>>    wpa-supplicant: backport patch to fix dbus interface for autoscan
>>      functionality
>>
>> Stefan Stanacar (1):
>>    populate_sdk_base.bbclass: use new perm option for find
>>
>> Tudor Florea (1):
>>    python: Install Python test suite and run it as ptest.
>
> The run-ptest script here has hardcoded /usr/lib/ for ${libdir}, we should
> ideally avoid this (e.g. through use of sed at do_install). Also I'd like to
> know if the ptest package could simply depend on ${PN}-modules rather than
> having a hardcoded list. I'll follow up with the submitter.
>
Dropped and thanks.

>> Yi Zhao (3):
>>    iproute2: Fix alternative link for ip command
>>    run-postinsts: Fix typo
>>    rpm-postinsts.bb: Fix typo
>>
>> Zhenhua Luo (1):
>>    oprofile: add Upstream-Status for several patches
>
> Cheers,
> Paul
>

