Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 276E060144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 19:56:22 +0000 (UTC)
Received: by padbj1 with SMTP id bj1so2540309pad.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 11:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=altcdalXOai1vbjT3Mwj+840czShH/4nqkcg9TGRHjQ=;
	b=h8+wqZMttDz7fDGr/P7zSjWn5O0j5MB1kQJdt1etL4FCWq28tEUdNL9ijr/twyK5Xa
	YcwPeZwlG/mNfDC7W7MZ7js0vwKLLfoLunV6ZT4X9wrChTKpGRxzmWAoCOiATf1wEHBt
	Vh4/2lKIWOmhb3BFKZsjQsRumqrV62zGUoAH8B6tPgCkRig+z++rv90nZOKvgYAApTsS
	Iqa+MnIZdTZY6JoUuw8gzOQzWSVPP5mWL65BURH1f64puvmlLYORQFK/EAksljrUZTJx
	FfH5HOn/XmeTT+uVwqM3W0cuYqmLl0ppvKVkUjvytjqx4RPC4A2Yl0Slinc5gyf6jz5I
	q5vA==
X-Received: by 10.70.53.65 with SMTP id z1mr9937099pdo.38.1425498983672;
	Wed, 04 Mar 2015 11:56:23 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id vl1sm4766501pbc.62.2015.03.04.11.56.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 11:56:22 -0800 (PST)
Message-ID: <54F7635F.6060403@gmail.com>
Date: Thu, 05 Mar 2015 06:56:15 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1425389491-31479-1-git-send-email-net147@gmail.com>
	<1425487748.26813.105.camel@linuxfoundation.org>
In-Reply-To: <1425487748.26813.105.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-devsrc: avoid splitting debug info
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
X-List-Received-Date: Wed, 04 Mar 2015 19:56:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

On 5/03/2015 3:49 AM, Richard Purdie wrote:
> On Wed, 2015-03-04 at 00:31 +1100, Jonathan Liu wrote:
>> This fixes "QA Issue: non debug package contains .debug directory"
>> for some kernels.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index e36de1b..c3cad05 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -72,3 +72,4 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>   PACKAGES = "kernel-devsrc"
>>   FILES_${PN} = "${KERNEL_SRC_PATH}"
>>   RDEPENDS_${PN} = "bc"
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> Why would your kernel source directory contain built binaries? I guess
> I'd like to understand more about what "some kernels" are doing
> differently.
>
> Cheers,
>
> Richard
>
The sources don't contain built binaries. It looks like there is an 
issue somewhere in the kernel sources that needs fixing.
Please disregard this patch for now.

Regards,
Jonathan

