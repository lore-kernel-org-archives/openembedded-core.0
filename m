Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtT81-0004dh-3u
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 01:05:17 +0100
Received: by eaal10 with SMTP id l10so916414eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QOuRjK3EAEHaR14HeqpbD9py2JaASRNng4KRDJXg5Rk=;
	b=QPiSnOhCeJcRITEZ67F8Po9l7uPE0j2hdO1WoP+/p8J4zR05dLTfbAB5ffXyau/QtK
	AgXx99Z8vIBkm4i7D6hNQKZeo9KLHQjwAO43ftzgaKJDNpigHlMEVVcxyDnuBjQui6+C
	vf06iWFxo4d9hjRpM1rwyZnH1CtxpGbtUH6HE=
Received: by 10.213.29.70 with SMTP id p6mr1515482ebc.78.1328313438982;
	Fri, 03 Feb 2012 15:57:18 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	a58sm27722389eeb.8.2012.02.03.15.57.16 (version=SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:57:17 -0800 (PST)
Message-ID: <4F2C73E3.2070708@gmail.com>
Date: Sat, 04 Feb 2012 00:55:15 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
	<1328291196.4220.3.camel@mattotaupa>
In-Reply-To: <1328291196.4220.3.camel@mattotaupa>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Add flock utility to default configuration.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 04 Feb 2012 00:05:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2012 06:46 PM, Paul Menzel wrote:
> Am Donnerstag, den 02.02.2012, 21:21 +0100 schrieb Peter Tworek:
>> Flock is required by by pm-utils package to function properly
> One »by« too much.
Fixed in v2, thanks.
>
>> (/usr/lib/pm-utils/functions). It's shipped in both busybox and
>> util-linux. Both versions work fine with pm-utils. Enabling it
>> in busybox seems like simpliest solution for the problem.
> simplest
Thanks, fixed in v2.
>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>> index b474ad4..fa9c078 100644
>> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
>> @@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
>>   # CONFIG_FEATURE_GPT_LABEL is not set
>>   # CONFIG_FEATURE_FDISK_ADVANCED is not set
>>   # CONFIG_FINDFS is not set
>> -# CONFIG_FLOCK is not set
>> +CONFIG_FLOCK=y
>>   # CONFIG_FREERAMDISK is not set
>>   CONFIG_FSCK_MINIX=y
>>   # CONFIG_MKFS_EXT2 is not set
> People are always interested in the size changes of the package when
> such programs are added to the default configuration. Do you have such
> numbers?
Added some data to v2. On armv5t it makes busybox binary larger by ~2.8k

>
> Reviewed-by: Paul Menzel<paulepanter@users.sourceforge.net>
>
>
> Thanks,
>
> Paul



