Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id DA6776E8E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:36:54 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 11 Feb 2014 10:36:54 +0100
Message-ID: <52F9EF34.6050300@enea.com>
Date: Tue, 11 Feb 2014 10:36:52 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, =?ISO-8859-1?Q?David_N?=
	=?ISO-8859-1?Q?ystr=F6m?= <david.nystrom@enea.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<cover.1392034327.git.laurentiu.palcu@intel.com>	<52F9E289.2080002@enea.com>
	<20140211085037.GE10078@lpalcu-linux> <52F9E5C1.3050906@gmail.com>
In-Reply-To: <52F9E5C1.3050906@gmail.com>
X-Originating-IP: [172.16.141.133]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 00/53] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 11 Feb 2014 09:36:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-11 09:56, David Nystr=F6m wrote:
> On 2014-02-11 09:50, Laurentiu Palcu wrote:
>> Hi David,
>>
>> On Tue, Feb 11, 2014 at 09:42:49AM +0100, David Nystr=F6m wrote:
>>> File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 158,
>>> function: _write_script
>>>       0154:        self.d.setVarFlag('img_creation_func', 'func', 1)
>>>       0155:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1=
)
>>>       0156:
>>>       0157:        with open(script_name, "w+") as script:
>>>   *** 0158:            script.write("%s" % bb.build.shell_trap_code())
>>>       0159:            script.write("export ROOTFS_SIZE=3D%d\n" %
>>> self._get_rootfs_size())
>>>       0160:            bb.data.emit_func('img_creation_func', script,
>>> self.d)
>>>       0161:            script.write("img_creation_func\n")
>>>       0162:
>>> Exception: AttributeError: 'module' object has no attribute
>>> 'shell_trap_code'
>> I guess you're missing this commit:
>>
>> bitbake: build.py: create separate function for shell trap creation code
>>
>> which is already in master.
>
> Thanks,
>
> David


Tested-by: david.nystrom@enea.com

With the manifest stub patch I sent and v5, FEEDS functionality for IPK=20
is verified working again.

Only below is generated when building from FEEDS:

$ cat tmp/deploy/images/qemuppc/core-image-minimal-qemuppc.manifest
busybox-syslog ppc7400 1.21.1-r0
libc6 ppc7400 2.18-r0
busybox ppc7400 1.21.1-r0
busybox-udhcpc ppc7400 1.21.1-r0
modutils-initscripts ppc7400 1.0-r6
libuuid1 ppc7400 2.23.2-r0
base-files qemuppc 3.0.14-r73
sysvinit-inittab qemuppc 2.88dsf-r9
initscripts ppc7400 1.0-r141
update-alternatives-cworth ppc7400 1:0.1.8+svnr653-r13.0
libblkid1 ppc7400 2.23.2-r0
udev-utils ppc7400 182-r7
libkmod2 ppc7400 14+git0+3b38c7fcb5-r0
base-passwd ppc7400 3.5.26-r2
busybox-hwclock ppc7400 1.21.1-r0
packagegroup-core-boot qemuppc 1.0-r11
udev ppc7400 182-r7
sysvinit-pidof ppc7400 2.88dsf-r11
update-rc.d all 0.7-r5
netbase ppc7400 1:5.1-r0
udev-cache ppc7400 182-r7
run-postinsts ppc7400 1.0-r9
init-ifupdown qemuppc 1.0-r3
sysvinit ppc7400 2.88dsf-r11

Br,
David

>> laurentiu
>>
>>
>>>
>>> ERROR: Function failed: do_rootfs
>>> ERROR: Logfile of failure stored in:
>>> /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/t=
emp/log.do_rootfs.9994
>>>
>>> ERROR: Task 6
>>> (/media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.b=
b,
>>>
>>> do_rootfs) failed with exit code '1'
>>>
>>>
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


