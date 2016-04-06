Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 777186FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 23:17:43 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id e6so9506830vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=hACLZpu/Fn/tPzElNFWYdhJn0BwZ1IPYx60pn44qoXc=;
	b=l04jNUwY2JDnx77u49vaRgrPSNIhQeR4YkMT9IGF7pkOQ3ZIdQeuDOYwq2cMYgD+SE
	LjlotJLCYAylnbbjtsK/nw35M8Tuik5xEMqYy3pY4ZQuwwhLgbsBw+8t1ouDr4m0Y1Y7
	nDQr8B8UMpps+cWmwPab9j47U9oLslzAMWG7HL8NlmsTgWZiW8k5g+aat2W1p7wpPcIi
	+YG4Nw6zYy+FDVl93skMnrfNL469/xUFWqB1Ae8iAclP879bQDHeuUpPK2OMm08xWziY
	+cWjLUlC6QxX4Dv1yYUm45+8WlMQ3da9bP42D+thcM/i32zPTJCauVFqtoz9klH/0mDf
	CfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=hACLZpu/Fn/tPzElNFWYdhJn0BwZ1IPYx60pn44qoXc=;
	b=cwc6ig/pM2VUH2O7xLiHjKxtIcWNEWgpIvix4bEgxJFwc13kA3WZ5JZjKrLmBHpP2+
	pmPzJx4P9YToPYn0CzptAzqWTDHgRsGQnbIaYR9VXiek61mgz82KHmhLqrqQ25X5rFhg
	zN8BgFmlCH5gONIgXAmB5tBOso0io4v1ngdRMqxv2Ro6yktcbhrSA2PpIMhAnxNj0vHW
	xUnepCWwYCC/myLS9EcVtVh6TW1s/uGMUy9kErEH57IoNhzDpsIeM3juEd7MqD9UGane
	ckne25VJK6ukfCTReaOecgf01PtzZNgM16HMy6xcX32eX9vJsupsUfyJWV3/88Qa8K64
	1bfw==
X-Gm-Message-State: AD7BkJK0D25n6gyEKplR52xMouuFmVIryW5krmmjmseoILZTWzmnDZSWG5JBVK6hM5/bKd45hka86uFFH8KV5A==
MIME-Version: 1.0
X-Received: by 10.176.1.13 with SMTP id 13mr334093uak.49.1459984663651; Wed,
	06 Apr 2016 16:17:43 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Wed, 6 Apr 2016 16:17:43 -0700 (PDT)
In-Reply-To: <CAEDY82hDvy0Fe3HWE-1WPDQEst7TbOrvoU_KjrGaLXbXZ3Gofw@mail.gmail.com>
References: <CAEDY82g1SD-4C1BVH6X2OJFkG9-KiqKSkRZzTKMUwu38dphvuw@mail.gmail.com>
	<57049FBF.1010504@windriver.com>
	<CAEDY82hDvy0Fe3HWE-1WPDQEst7TbOrvoU_KjrGaLXbXZ3Gofw@mail.gmail.com>
Date: Wed, 6 Apr 2016 17:17:43 -0600
Message-ID: <CACS+7ZS7TMWdR-M7aH8DRupH7P7UN-8Q6kR1EK6v4r+C_v1wbg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Charles Chan <charles.wh.chan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Security question: base-files_3.0.14.bb and ${ROOT_HOME} directory permission
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
X-List-Received-Date: Wed, 06 Apr 2016 23:17:43 -0000
Content-Type: text/plain; charset=UTF-8

On 6 April 2016 at 13:39, Charles Chan <charles.wh.chan@gmail.com> wrote:
> Hi Robert,
>
> Thanks for the patch. I tested it and it worked ... partially.
>
> Taking an existing image and then using `opkg install base-files.ipk` will
> correctly set the permission to 0700.
>
> However, when I rebuild the full image rootfs, /home/root still ends up with
> the wrong permission. I suspect another recipe is modifying the permission.
> Is there a way (ie. bitbake command) to find out which recipe is causing the
> change?
>
> Thanks again,
> Charles
>

I don't know what recipe is creating /home/root, but ${ROOT_HOME}
should probably be added to files/fs-perms.txt with the correct
permissions set.


>
> On Tue, Apr 5, 2016 at 10:33 PM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>>
>>
>> I think that it should be a bug, would you please try this patch?
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index d391707..2082ed4 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -95,6 +95,7 @@ do_install () {
>>         for d in ${dirs755}; do
>>                 install -m 0755 -d ${D}$d
>>         done
>> +       chmod 0700 ${D}${ROOT_HOME}
>>         for d in ${dirs1777}; do
>>                 install -m 1777 -d ${D}$d
>>         done
>>
>> // Robert
>>
>> On 04/06/2016 01:03 PM, Charles Chan wrote:
>>>
>>> (This is my first post to OE list, hopefully I am posting to the right
>>> mailing
>>> list.)
>>>
>>> Background: During the process of trying to configure SSH keys for root
>>> user
>>> login via dropbear, we realized the permission for /home/root directory
>>> is set
>>> too loose for group and other members [1]. As a result, dropbears fails
>>> when we
>>> try to put the key under /home/root/.ssh
>>>
>>> ---------
>>>
>>> In the image, /home/root directory is set to 0755:
>>>
>>>     $ stat /home/root
>>>        File: /home/root
>>>        Size: 4096            Blocks: 8          IO Block: 4096
>>> directory
>>>     Device: b302h/45826d    Inode: 13268       Links: 4
>>>     Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/
>>> root)
>>>     Access: 2016-04-05 22:21:13.000000000
>>>     Modify: 2016-04-05 22:08:57.000000000
>>>     Change: 2016-04-05 22:08:57.000000000
>>>
>>>
>>> After some debugging, we believe the permission (0755) is initialized in
>>> base-files_3.0.14.bb <http://base-files_3.0.14.bb> (in line 35) [2].
>>>
>>> A few questions:
>>> 1. I tried looking at the git log for the history, but wasn't able to
>>> find any
>>> background on why the permission was set this way. eg. on a desktop Linux
>>> (Ubuntu), /root is set to 0700:
>>>
>>>     $ sudo stat /root
>>>        File: `/root'
>>>        Size: 4096 Blocks: 8          IO Block: 4096   directory
>>>     Device: 801h/2049dInode: 1441793     Links: 3
>>>     Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/
>>> root)
>>>     Access: 2016-04-05 21:29:17.389725228 -0700
>>>     Modify: 2016-03-22 17:11:54.912479000 -0700
>>>     Change: 2016-03-22 17:11:54.912479000 -0700
>>>       Birth: -
>>>
>>>
>>> 2. If we would like to override the directory permission for /home/root
>>> in our
>>> image, what is the best way to do it? I am not an expert with bitbake,
>>> should I
>>> be patching the base-files_3.0.14.bb <http://base-files_3.0.14.bb>? using
>>> *_append? or I should be looking at some other recipe altogether?
>>>
>>> Sorry for the long email. Thanks in advance.
>>> Charles
>>>
>>> [1]
>>> https://wiki.openwrt.org/doc/howto/dropbear.public-key.auth#troubleshooting
>>>
>>> [2]
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=master#n35
>>>
>>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

