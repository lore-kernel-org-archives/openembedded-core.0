Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	by mail.openembedded.org (Postfix) with ESMTP id 78A91746A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5726; q=dns/txt; s=iport;
	t=1522687268; x=1523896868;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=ijuIhKnvo7WQ+8ioZ7Pc8IeE5d1BXsofQcMbJZWDL+8=;
	b=QvGns/21Kwh/uruEOPIVwZwicPnjhWX+aDq7UPx4WpbtB/LKlhs2bB8W
	2z3XUJ4F6/3Pjm653F6VXXfU6nAoR+Jl2y4kPsUlbdm0n7MWjIlzwJLDX
	h1673g/PMXAZDTkfKzoBuCBM2GiobQ3K2phEMbfR7b2pRWEMHY7F1+KGV Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DvAAB6XMJa/5FdJa1eGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYMTL2FvKItcXowkgVMhdRqLEYdCgXoLGAuEFUwChDIhNBg?=
	=?us-ascii?q?BAgEBAQEBAQJrKIUkAQEBAQIBAQE2AjQLBQsLGC4nAS8GARKFBQgPsAuIP4I?=
	=?us-ascii?q?lh2GCE4EMLoIiNIFLgUYBBIctAocbB4UwPIosCIVRhQOFRIpNiRWGQQIECwI?=
	=?us-ascii?q?TAYElHDiBUk0jFTqCQwmCFxeONh8wjgkBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,396,1517875200"; d="scan'208";a="378586823"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
	by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 16:41:06 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id w32Gf36t006864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Apr 2018 16:41:04 GMT
Date: Mon, 2 Apr 2018 09:41:03 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LY=rKUZ-D+0iFdx=n9+YeVLFXuCE_sBvxfL7_GxbxFUfA@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1804020906400.33409@sjc-ads-6991.cisco.com>
References: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
	<1521741206-5138-2-git-send-email-kamensky@cisco.com>
	<CAJTo0LY=rKUZ-D+0iFdx=n9+YeVLFXuCE_sBvxfL7_GxbxFUfA@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime/stap.py: add runtime test for systemtap
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
X-List-Received-Date: Mon, 02 Apr 2018 16:41:06 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII



On Mon, 26 Mar 2018, Burton, Ross wrote:

> On the autobuilder:
>
> | NOTE: FAIL [15.139s]: test_stap (stap.StapTest)
> | NOTE: ----------------------------------------------------------------------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/stap.py",
> line 33, in test_stap
> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> | AssertionError: 1 != 0 : stap --disable-cache /tmp/hello.stp
> | ERROR: module version mismatch (#1 SMP PREEMPT Mon Mar 26 14:41:21
> UTC 2018 vs #1 SMP PREEMPT Mon Mar 26 14:03:27 GMT 2018), release
> 4.14.24-yocto-standard
> | WARNING: /usr/bin/staprun exited with status: 1
> | Pass 5: run failed.  [man error::pass5]
>
> Is this systemtap-uprobes not being rebuilt when it should?

systemtap-uprobes should not be used nowdays.

Does anyone have pointer to what autobuilder is executing?

Above message indicates that version of kernel that is running
'uname -v' does not match version string recorded in
/usr/src/kernel/include/generated/compile.h (which is part of
kernel-devsrc package). Usually such version check is performed
by kernel CONFIG_MODVERSIONS, which is not enabled in OE build.
SystemTap specifically adds its own kernel version check (the
one firing above) and it could be disabled through command
line parameter.

It is easy to reproduce above error by building core-image-lsb-sdk,
then running 'bitbake -c cleansstate linux-yocto' and rebuilding
core-image-lsb-sdk image again. In resulting image 'uname -v'
will not match UTS_VERSION from
/usr/src/kernel/include/generated/compile.h.

I.e now even kernel-devsrc is pulling information from virtual/kernel,
kernel-devsrc is not rebuilt even if virtual/kernel is
rebuilt. IMHO it should be rebuilt. But is it by design or something
does not work, I cannot tell. In kernel-devsrc there are statements like
'do_install[depends] += "virtual/kernel:do_install"', but whether
those just build ordering statement or whether they should
trigger rebuild if "virtual/kernel:do_install" is newer is not clear.

For now I'll modify stap test patch and call stap with kernel version
check disabled assuming that running kernel and kernel-devsrc always
would be close enough to run without problems. But it would be great if
folks could clarify rebuild dependency rule between virtual/kernel
and kernel-devsrc.

Thanks,
Victor

> Ross
>
> On 22 March 2018 at 17:53, Victor Kamensky <kamensky@cisco.com> wrote:
>> Add runtime test for stap to test basic SystemTap
>> operations: can compile very basic module and run on
>> target device.
>>
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>>  meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
>>  meta/lib/oeqa/runtime/files/hello.stp |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
>>  create mode 100644 meta/lib/oeqa/runtime/files/hello.stp
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
>> new file mode 100644
>> index 0000000..005da71
>> --- /dev/null
>> +++ b/meta/lib/oeqa/runtime/cases/stap.py
>> @@ -0,0 +1,33 @@
>> +import os
>> +
>> +from oeqa.runtime.case import OERuntimeTestCase
>> +from oeqa.core.decorator.depends import OETestDepends
>> +from oeqa.core.decorator.oeid import OETestID
>> +from oeqa.core.decorator.data import skipIfNotFeature
>> +
>> +class StapTest(OERuntimeTestCase):
>> +
>> +    @classmethod
>> +    def setUpClass(cls):
>> +        src = os.path.join(cls.tc.runtime_files_dir, 'hello.stp')
>> +        dst = '/tmp/hello.stp'
>> +        cls.tc.target.copyTo(src, dst)
>> +
>> +    @classmethod
>> +    def tearDownClass(cls):
>> +        files = '/tmp/hello.stp'
>> +        cls.tc.target.run('rm %s' % files)
>> +
>> +    @OETestID(1652)
>> +    @skipIfNotFeature('tools-profile',
>> +                      'Test requires tools-profile to be in IMAGE_FEATURES')
>> +    @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
>> +    def test_stap(self):
>> +        cmds = [
>> +            'cd /usr/src/kernel && make scripts',
>> +            'cd /lib/modules/* && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)',
>> +            'stap --disable-cache /tmp/hello.stp'
>> +            ]
>> +        for cmd in cmds:
>> +            status, output = self.target.run(cmd, 900)
>> +            self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>> diff --git a/meta/lib/oeqa/runtime/files/hello.stp b/meta/lib/oeqa/runtime/files/hello.stp
>> new file mode 100644
>> index 0000000..3677147
>> --- /dev/null
>> +++ b/meta/lib/oeqa/runtime/files/hello.stp
>> @@ -0,0 +1 @@
>> +probe oneshot { println("hello world") }
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

