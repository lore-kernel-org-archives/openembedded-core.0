Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC150713AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 15:03:32 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so1389265pdb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ZktcaOjGnD0IrcvFuSdWhq5i/a85YIRfF0Tr3xqmZ5Q=;
	b=kT7EPSmAYvcvf6ij0MiEh8ikvgLKfqK4J3WeW8cdjeyAQK115Fo2a3sqIP2YlMWdiY
	rOp9aphp2BfXcQvumYZOJ5GYKLGb1edp3HsLj/v66f4bqjhg2UdRpQ+alTX+TA8J4nNo
	gi7sIGyqfX0lKZst4fIJdBJjtLfVpKf1BNdcKP0P9itBP8XRtAcfQjRbzxCKCqe5KhkR
	Ckn9pT95GR6vnvj9L2cTBSr4FH5pOnDiz1KYTinhinASIw7iOms4jPtt13B39DNbN6+W
	2olKPoswO/oxDdZ2NYNvcH+SaaCSsKpUCW4UYwzlUtyOqhyUGbmlmj+19+KkBi0V2Bi6
	/J/g==
X-Received: by 10.70.126.41 with SMTP id mv9mr1573060pdb.129.1410275014277;
	Tue, 09 Sep 2014 08:03:34 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:11b5:15fc:e340:fe82?
	([2601:c:9380:601:11b5:15fc:e340:fe82])
	by mx.google.com with ESMTPSA id n4sm12040580pdk.57.2014.09.09.08.03.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 08:03:33 -0700 (PDT)
Message-ID: <540F16BB.8090600@gmail.com>
Date: Tue, 09 Sep 2014 08:03:23 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>	<1410227590-14190-2-git-send-email-akuster808@gmail.com>
	<1410249927.19272.42.camel@ted>
In-Reply-To: <1410249927.19272.42.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH] qemuppc64: add machine
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
X-List-Received-Date: Tue, 09 Sep 2014 15:03:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/09/2014 01:05 AM, Richard Purdie wrote:
> On Mon, 2014-09-08 at 18:53 -0700, Armin Kuster wrote:
>> override USER_CLASSES as prelink does not currently
>> work on ppc64
>> ---
>>   meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/conf/machine/qemuppc64.conf
>>
>> diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
>> new file mode 100644
>> index 0000000..86916e5
>> --- /dev/null
>> +++ b/meta/conf/machine/qemuppc64.conf
>> @@ -0,0 +1,16 @@
>> +#@TYPE: Machine
>> +#@NAME: qemu PPC 64 Emulator setup
>> +#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
>> +
>> +require conf/machine/include/qemu.inc
>> +DEFAULTTUNE ?= "ppc64p6"
>> +require conf/machine/include/tune-power6.inc
>> +
>> +#prelink broken
>> +USER_CLASSES = "buildstats image-mklibs "
>
> This is horrible. Can we somehow blacklist qemuppc64 in the prelink
> class itself?
>
> USER_CLASSES_remove = "prelink"

will change.
>
> would be better than overriding the users choice like above...

Thanks,
Armin
>
> Cheers,
>
> Richard
>
>> +KERNEL_IMAGETYPE = "vmlinux"
>> +
>> +IMAGE_FSTYPES = "ext2 ext3"
>> +
>> +SERIAL_CONSOLE ?= "ttyS0"
>> --
>> 1.9.1
>>
>
>

