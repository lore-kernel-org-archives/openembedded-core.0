Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDBB46B68B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 15:29:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2013 08:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,885,1367996400"; d="scan'208";a="386818157"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2013 08:28:48 -0700
Message-ID: <520CF3AF.8000506@linux.intel.com>
Date: Thu, 15 Aug 2013 08:28:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1376546582.git.sgw@linux.intel.com>
	<2167038.LjgKZdWHPy@helios>
In-Reply-To: <2167038.LjgKZdWHPy@helios>
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/33] Review & ACK
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
X-List-Received-Date: Thu, 15 Aug 2013 15:29:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2013 07:43 AM, Paul Eggleton wrote:
> On Wednesday 14 August 2013 23:10:54 Saul Wold wrote:
>> Paul, Ross:
>>
>> Please review this set, it include the Read-Only rootfs, which I have
>> tested locally. I also included the makedev change, and I verified it's
>> correctly using the rootfs to find the passwd and group files.
>>
>> Thanks
>> 	Sau!
>>
>>
>> The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:
>>
>>    meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44
>> +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
>> stage
>>
>> Chen Qi (14):
>>    opkg.inc: remove the obsolete POSTLOG variable
>>    makedevs: support using user/group names in device table files
>>    image.bbclass: create device table after package installation
>>    device_table-minimal.txt: use user/group names instead of uid/gid
>>    init-live.sh: make $ROOT_MOUNT/media writable when necessary
>>    use a uniform way to determine whether rootfs is read-only
>
> Patch is missing signed-off-by and upstream-status.
>
I will pull this and have Qi and separate patch with the header, I would 
like to finally get this in.

>>    udev: remove implicit dependency on initscripts
>>    populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
>
> Saul, didn't you have feedback on this?
>
I talked further with about this with him and I am Ok with the
way it is.

Sau!


>>    populate-volatile.sh: don't spawn background process at rootfs time
>>    runqemu-internal: fix to start X correctly in live images
>>    initscripts: use a uniform way to handle directories in read-only
>>      rootfs
>>    populate-volatile.sh: use 'cp -a' to avoid potential problem
>>    irda-utils: fix for read-only rootfs
>>    openssh: fix for read-only rootfs
>>
>> Cristiana Voicu (1):
>>    systemtap: upgrade to 2.3
>>
>> Martin Jansa (5):
>>    at-spi2-core: add intltool-native dependency
>>    gst-plugins-gl: add dependency on glew
>>    xeyes: add dependency on libxrender
>>    xrestop: add dependency on ncurses
>>    qemu, default-providers: Add mesa as default virtual/egl
>>
>> Muhammad Shakeel (3):
>>    lighttpd: Replace spaces with tabs in shell function
>>    rpcbind: Replace spaces with tabs in shell function
>>    nfs-utils: Replace spaces with tabs in shell function
>>
>> Otavio Salvador (1):
>>    linux-dtb: Use kernel build system to generate the dtb files
>>
>> Ross Burton (4):
>>    cogl: GL/GLX feature cleanup
>>    libmatchbox: upgrade to 1.11
>>    matchbox-wm: fix icon handling on 64-bit hosts
>>    wipe-sysroots: don't assume TMPDIR is under BUILDDIR
>>
>> Saul Wold (2):
>>    meta-skeleton: layer.conf Should also have .bbappend in example
>>    texinfo: add perl RDEPENDS and fix up packaging
>>
>> Stefan Herbrechtsmeier (1):
>>    cmake.bbclass: Don't use packages from the native build machine
>>
>> Wenzong Fan (1):
>>    oe/path.py: call /bin/cp directly
>>
>> Yevhen Kyriukha (1):
>>    connman: fix systemd support for connman-* packages.
>
> Everything else looks OK.
>
> Cheers,
> Paul
>

