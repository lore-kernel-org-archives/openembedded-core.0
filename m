Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwxUU-0003kn-J4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 17:39:10 +0200
Received: from localhost ([127.0.0.1]:40941 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1SwxJC-000853-7z; Thu, 02 Aug 2012 15:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=7wVvYTs6xk/Q/zNxK+XIjayp96c=; b=zyCHaK4s+SV2wEed+EJaPJF3cmnL
	+jAkyudbsh3cDlpc1u98HQ/Mm6xxaToCS+1GK2yI95MeKrqaj57bUJ3+Yb6pHzYW
	4FPNJysrw02BZc93pbUpMBySMdlomrMZx4tx73mYoo2vnhrCbaWv3I+F/wlFf1aj
	zI1HADYLGyipZd0=
Received: from [195.171.99.130] (port=23512 helo=[192.168.0.52])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1SwxJC-000850-5I; Thu, 02 Aug 2012 15:27:30 +0000
Message-ID: <501A9CA6.6020704@communistcode.co.uk>
Date: Thu, 02 Aug 2012 16:28:38 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <501A43F2.7020209@communistcode.co.uk>
	<1343914820.9756.74.camel@ted>
In-Reply-To: <1343914820.9756.74.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qemu refusing to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 15:39:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/12 14:40, Richard Purdie wrote:
> On Thu, 2012-08-02 at 10:10 +0100, Jack Mitchell wrote:
>> I am having an issue trying to build qemu for the qemuarm machine. It's
>> just a standard core-image-minimal with a vanilla copy of poky master.
>> The error log is as follows:
>>
>>      /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
>>      ---------------------------------------------------------------------------
>>      DEBUG: Executing python function sysroot_cleansstate
>>      DEBUG: Python function sysroot_cleansstate finished
>>      DEBUG: Executing shell function do_configure
>>      /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/run.do_configure.1062:
>>      line 86:
>>      /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1/configure:
>>      No such file or directory
>>      ERROR: Function failed: do_configure (see
>>      /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
>>      for further information)
>>
>>
>> That is all I get, and the build just fails. I'm not sure where to even
>> start debugging this...
>
> Does the file:
>
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1/configure
>
> exist?
Does not exist.
> Can you execute it?
No
> Does
> running /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/run.do_configure.1062 give the same error?
Exactly the same error.
> You can try and pin this down to a specific command failing, it could be something in the configure script itself that is erroring, its hard to tell from just the above.
How would I manually attempt to configure? There are no files what so 
ever in the 
/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1 
directory.
>
>
> Cheers,
>
> Richard
>
>
>

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



