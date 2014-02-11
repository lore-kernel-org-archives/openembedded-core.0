Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 813326E928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:56:38 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id w7so5796641lbi.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 00:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Un1sqLpYyStn5w5qXOAunLwcU7elo21S+9vuBWc4iXM=;
	b=nW+unE29AfyRykd0sfywTwUsFb1IWdoJLQ9HjgKyBZXYy0mbmZ1HCknF2sgS/dVO0T
	Q0N971CJdihHAqSUH3AaUeVWhIAo0XziiIOocTDwx8RuEycsq/mqMqUkHe0vscXHO3OV
	Mkl6OrhLkETcqRDLTmJZca15LLtopuS6usAZz5BDWA3KfF7yfvd9MhRKXlEZ/YJ966Cf
	q0JDX0G2L57+n0I4ziPyoO4HTRz0KPaIWse5SQX7Y1cfj31fTxmaf43OShi+enV3gf3S
	J2/h3OcE15TXi/HUdbs+RU1scudYeUU5PxQ3E1zj5YQlZt7p+bp1MnD6EUfHpukurmtV
	yjUw==
X-Received: by 10.112.132.131 with SMTP id ou3mr24237696lbb.29.1392108998358; 
	Tue, 11 Feb 2014 00:56:38 -0800 (PST)
Received: from [172.16.141.133] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id y2sm26517017lal.10.2014.02.11.00.56.36
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 00:56:37 -0800 (PST)
Message-ID: <52F9E5C1.3050906@gmail.com>
Date: Tue, 11 Feb 2014 09:56:33 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, =?ISO-8859-1?Q?David_N?=
	=?ISO-8859-1?Q?ystr=F6m?= <david.nystrom@enea.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<cover.1392034327.git.laurentiu.palcu@intel.com>	<52F9E289.2080002@enea.com>
	<20140211085037.GE10078@lpalcu-linux>
In-Reply-To: <20140211085037.GE10078@lpalcu-linux>
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
X-List-Received-Date: Tue, 11 Feb 2014 08:56:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-02-11 09:50, Laurentiu Palcu wrote:
> Hi David,
>
> On Tue, Feb 11, 2014 at 09:42:49AM +0100, David Nyström wrote:
>> File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 158,
>> function: _write_script
>>       0154:        self.d.setVarFlag('img_creation_func', 'func', 1)
>>       0155:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
>>       0156:
>>       0157:        with open(script_name, "w+") as script:
>>   *** 0158:            script.write("%s" % bb.build.shell_trap_code())
>>       0159:            script.write("export ROOTFS_SIZE=%d\n" %
>> self._get_rootfs_size())
>>       0160:            bb.data.emit_func('img_creation_func', script,
>> self.d)
>>       0161:            script.write("img_creation_func\n")
>>       0162:
>> Exception: AttributeError: 'module' object has no attribute
>> 'shell_trap_code'
> I guess you're missing this commit:
>
> bitbake: build.py: create separate function for shell trap creation code
>
> which is already in master.

Thanks,

David

> laurentiu
>
>
>>
>> ERROR: Function failed: do_rootfs
>> ERROR: Logfile of failure stored in: /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.9994
>> ERROR: Task 6 (/media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb,
>> do_rootfs) failed with exit code '1'
>>
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


