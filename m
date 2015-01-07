Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A88EC728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 13:08:15 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id hv19so3313371lab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 05:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=33lscJeQdwfkUAQe36vFSxINXMzIwqMkzw6WWtCojoo=;
	b=CtpRq/Z6Cfl7l5uOWyxAi6U6LloxkzvH9C89HT4ml7nHteYFQU0Wj+K0E0SfcJ2Dai
	4lnTeT8/Fde9rclMnzHpoprgqIRAgBIyJkXK4DTS6lhJ2KowU4BIxd3bKl2p/4r4aMqu
	i08WYwkBVSuyzKLdPly5KJjqTkdtlsrYcerDpj5xujJJ2zOvPAmKYgnyoIdg8eoqi8iQ
	czGjgg0o4FB59xAKTSQAIfu0f6AoxL9DZKNCCxCeKpke370CGvXxsAWgpO92Q/kcu6pw
	lTqwQOx/zMFIdV68jMsuSKZgJ3jAYXxmk/vlUvaR/NObIViMPZUQ2MZ4Uby4SEpKr/pF
	iXJw==
MIME-Version: 1.0
X-Received: by 10.112.154.70 with SMTP id vm6mr4401144lbb.18.1420636094772;
	Wed, 07 Jan 2015 05:08:14 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 7 Jan 2015 05:08:14 -0800 (PST)
In-Reply-To: <20150107100735.GF29986@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<CAJTo0LaW2JLjqHCDEMggAb2QLM+Ns14qQWGq=BG5jLFu4HVRow@mail.gmail.com>
	<20150107100735.GF29986@jama>
Date: Wed, 7 Jan 2015 08:08:14 -0500
Message-ID: <CADkTA4NvHwqdrU=xPA82fQuXoqT+j2rQZ0W=aJ4AOu_Yc_4mcw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Wed, 07 Jan 2015 13:08:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 7, 2015 at 5:07 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jan 06, 2015 at 11:08:53AM +0000, Burton, Ross wrote:
>> On 6 January 2015 at 08:57, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> > 2) do_configure failing:
>> >
>> > ERROR: Function failed: do_configure (log file is located at
>> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
>> > ERROR: Logfile of failure stored in:
>> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498
>> > Log data follows:
>> > | DEBUG: Executing python function sysroot_cleansstate
>> > | DEBUG: Python function sysroot_cleansstate finished
>> > | DEBUG: Executing shell function do_configure
>> > | NOTE: make oldconfig
>> > | make: *** No rule to make target `oldconfig'.  Stop.
>> > | ERROR: oe_runmake failed
>> > | WARNING: exit code 1 from a shell command.
>> > | ERROR: Function failed: do_configure (log file is located at
>> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
>> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
>> > do_configure: Failed
>> > ERROR: Task 491
>> > (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/meta-lg/recipes-kernel/linux/
>> > linux-lg-mako_git.bb, do_configure) failed with exit code '1'
>> >
>>
>> I'll Me Too here, often hitting this on rebuilds:
>>
>> DEBUG: Executing shell function do_configure
>> NOTE: make -C /data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel
>> O=/data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.24+gitAUTOINC+a227f20eff_902f34d361-r0/linux-qemuarm64-standard-build
>> oldnoconfig
>> make: Entering directory
>> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel'
>> make: *** No rule to make target `oldnoconfig'.  Stop.
>> make: Leaving directory
>> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel' ERROR: Task 77
>> (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
>> do_configure) failed with exit code '1'
>
> last world build revealed new kind of error:
>
> both qemux86 and qemux86-64 failed like this
>
> ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974
> Log data follows:
> | DEBUG: Executing shell function do_kernel_configme
> | NOTE: kernel configme
> | [INFO] Configuring target/machine combo: "standard/qemux86-64"
> | [INFO] collecting configs in .meta/meta-series
> | ERROR: could not sanitize configuration fragments
> |    errors are logged in /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/src/kernel/.meta/cfg/standard/common-pc-64/config.log
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974)
> NOTE: recipe linux-yocto-3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0: task do_kernel_configme: Failed

I have a fix for this one. I'll open a tracking case when I'm into the office.

Bruce

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

