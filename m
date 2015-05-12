Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 46FBD7404C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 22:35:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2015 15:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,418,1427785200"; d="scan'208";a="724936670"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2015 15:35:40 -0700
Message-ID: <55528041.8020901@linux.intel.com>
Date: Tue, 12 May 2015 17:35:45 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>
	<62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>
	<20150512223017.GG2714@jama>
In-Reply-To: <20150512223017.GG2714@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.4.2 to 3.4.3
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
X-List-Received-Date: Tue, 12 May 2015 22:35:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/15 17:30, Martin Jansa wrote:
> On Tue, May 12, 2015 at 03:09:50PM +0000, Alejandro Hernandez wrote:
>> Modifies:
>> python3-native_3.4.2.bb -> python3-native_3.4.3.bb: Updates checksums, LICENSE did not change,
>> dates were updated.
>> python3_3.4.2.bb -> python3_3.4.3.bb: Updates checksums, LICENSE did not change,
>> dates were updated.
>> generate-manifest-3.4.py: fixes asyncio and net-tools.
>> python-3.4-manifest.inc: fixes asyncio and net-tools.
>> This upgrade contains a fix for CVE-2014-9365.
> There is still that textrel issue I've reported earlier:
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-codecs/usr/lib/python3.4/lib-dynload/_codecs_cn.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-core/usr/lib/python3.4/lib-dynload/binascii.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-crypt/usr/lib/python3.4/lib-dynload/_sha256.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-ctypes/usr/lib/python3.4/lib-dynload/_ctypes.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-curses/usr/lib/python3.4/lib-dynload/_curses.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-elementtree/usr/lib/python3.4/lib-dynload/_elementtree.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-fcntl/usr/lib/python3.4/lib-dynload/fcntl.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-gdbm/usr/lib/python3.4/lib-dynload/_gdbm.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-io/usr/lib/python3.4/lib-dynload/_socket.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-json/usr/lib/python3.4/lib-dynload/_json.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-lang/usr/lib/python3.4/lib-dynload/_bisect.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-math/usr/lib/python3.4/lib-dynload/cmath.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-mmap/usr/lib/python3.4/lib-dynload/mmap.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.4/lib-dynload/_multiprocessing.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-profile/usr/lib/python3.4/lib-dynload/_lsprof.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-readline/usr/lib/python3.4/lib-dynload/readline.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-resource/usr/lib/python3.4/lib-dynload/resource.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-syslog/usr/lib/python3.4/lib-dynload/syslog.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-textutils/usr/lib/python3.4/lib-dynload/_csv.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-unixadmin/usr/lib/python3.4/lib-dynload/grp.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-xml/usr/lib/python3.4/lib-dynload/pyexpat.cpython-34m.so' has relocations in .text [textrel]
> python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-misc/usr/lib/python3.4/lib-dynload/_bz2.cpython-34m.so' has relocations in .text [textrel]
>
> IIRC you've already sent some patch to fix it, do you know what's the status of it, if it was applied or not (why?)?
>
> Thanks
>
>

Oh nice, I had not seen your patch, I was aware the issue still existed 
but I upgraded first,  mainly to include the CVE fix and I was just 
gonna start to work on that issue, no I don't know what the status of it 
is, RP was probably waiting for the Autobuilder issues to be fixed, but 
now they are, so it'll probably be applied soon.

