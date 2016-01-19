Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f196.google.com (mail-lb0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9024071E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:57:50 +0000 (UTC)
Received: by mail-lb0-f196.google.com with SMTP id bc4so26659951lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=33Jb4cRTuRk59oME84bQ1Z/sCvhB4xNSHjI6o2XAo2I=;
	b=sfxENis3uUj8KsHVSLOg7zZLUsDO/3MGLlqT5bIYkJ+23hLRKQ3lKWyWWpWy2BVeBf
	3JlasnhVHWQIjD2uzcF8ak0s4HPyYpQoX94Z2Tx9RlzvCMr/7M4CXDabSs0SRKdHxyTn
	azJ7gJtR8zq94k6+4+YWqbtPYj8wAwbpT5HdLFV3lBzXLR67k41fSqJ1rGeNj4wOzFBy
	K1rXuBeaST5nRKjCcv9bW+1SgnIkCQZp6ig+A5Ytykypz36fWL4+xPaAF0Q3C7jVOs4v
	QtrsWFGw+1xRTk4UTgm0VgutxN5K1Xy2yqFieEv66QJdnr4NUYIu3yxA4uq+5lgNTY7U
	o0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=33Jb4cRTuRk59oME84bQ1Z/sCvhB4xNSHjI6o2XAo2I=;
	b=CjFrF6ISj8szSvXz8xqqFbXygEVmjGGt3UOnXPVxqAWjJJCE1O/gLv8CYpqfrp4eTF
	JWcp0kbP7KlOQqAo//R6+0lh1LUe0Z/NbBuWVVhyXwH4dO+E3BnZ+fPPY5IH71334cF+
	IOczs636knM0XVP4pB2JVXDC/p/PWrfj6KNKY0XnmTbEd5BSj/PzZs+ORfbJM7eeLR9z
	+12B6Z8dRtEzl3yGRny0RDJiFhuTAE7F7vUm48FvBkqoNl5RKVlAJtO0TY8ZCnum0rie
	ZYtMqt+/nG67sV4c/BRSdMp8WZqsjjMguLScGkqEtP8dY9wAp5nRizQ6vuZMJqINtvg1
	lAKA==
X-Gm-Message-State: ALoCoQm07w7pkvlzfFofqXY1bKtJYkwyjiIqp4L6C44b3dSmi8KctsbhCv4F1/kLKw9LDrAlMLlZT87eE+RNz3nbYMonIN38uQ==
X-Received: by 10.112.166.33 with SMTP id zd1mr11319252lbb.71.1453240670198;
	Tue, 19 Jan 2016 13:57:50 -0800 (PST)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	l204sm4290172lfg.49.2016.01.19.13.57.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 13:57:49 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
	<569E90F9.6020806@windriver.com>
From: Ming Liu <liu.ming50@gmail.com>
Message-ID: <569EB15C.9040502@gmail.com>
Date: Tue, 19 Jan 2016 22:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <569E90F9.6020806@windriver.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Tue, 19 Jan 2016 21:57:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/19/2016 08:39 PM, Bruce Ashfield wrote:
> On 16-01-05 08:12 AM, Ming Liu wrote:
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> It makes no sense to install a initramfs bundled kernel image since
>> do_package does not depend on do_bundle_initramfs at all, otherwise, it
>> leads to a implicit kernel-image package depending on do_package run 
>> before
>> or after do_bundle_initramfs.
>
> Again. So why not just add the ordering in the task dependencies ?
If we add a intertask dependency like:
add bundle_initramfs before do_install after do_deploy do_package

Then it will somehow introduce a circular dependency as I described in 
another mail.
>
> I'm probably missing something, which just means we need to tweak
> the commit log a bit more.
Maybe I should add some description in commit log about why I think we 
could not introduce a intertask dependency as a fix.

>
> The code you are removing is conditional, and is run after an
> explicit kernel_do_compile is called, to rebuild the existing
> kernel configuration with an embedded initramfs (via alternate initrd).
> So outside of some ordering/parallel execution issues, I'm not seeing
> it as broken.
Yes, I agree, it will not break the kernel re-compiling, the problem I 
want to fix here is just that it does not provide a certain way that we 
could add initramfs bundled kernel image into a rootfs.

//Ming Liu
>
> Bruce
>
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>   meta/classes/kernel.bbclass | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4ce1611..d1ca614 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>>           kernel_do_compile
>>           mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>           mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>> -        # Update install area
>> -        echo "There is kernel image bundled with initramfs: 
>> ${B}/${KERNEL_OUTPUT}.initramfs"
>> -        install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs 
>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>> -        echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>       fi
>>   }
>>
>>
>


