Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC1BD71A31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 16:18:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e4so1424013pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=syRTkHlqM5Smle/QZIdwJhm41qqwq4SY6ninYFfc9sw=;
	b=NI26Wq/YengPIOOigiHKOfAT6nKpqBT6jVNBqfOlS5OAWmuD1S0jkuwF9Xx3Kj1YRH
	jTt8y/7e+bBgLCqceLskSAxtXZs0ZGxxm2e+oDSVnMjNcKmGz3/m/kgO5xjXxvhNh9yW
	PYG0LZMvjK0APGay5k3xY3//qLITfQUBtubS3yNcc+/n0JdM/1sP6JmF/tA7BRlCJDg/
	kLAn1QJ4YDX9UBJpCYJoiUvX+lWjXnmKEjDrHZMKQ/L/+tkgpmSvzY0uzfjBD+M8uAUW
	/nO9MRM/p9AG6/OdHu5WAdqihItjR9jAeidglAAb+g5JT6W+r4IrS9Sjnpw8DS5ul59e
	wNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=syRTkHlqM5Smle/QZIdwJhm41qqwq4SY6ninYFfc9sw=;
	b=htkZX7IuysWM8kLXqOHV0mtZ2huCak+GvkiGHhEoyZCqe6BCZDWiGufwJjaaxFC1LL
	/pKCPucAHm4cui++4ASi7Hyi+geGc281idLCnMMKfo7nApAGTmK+JxzyGCdEmM6CfL55
	A/DutxZb3sd5ulxPl6Pfg54dMjd58pMa493h+pA2YQIenY0QHCo6rOLafPVn/GZWUOp5
	4uuMgwCY55FBL/wapTxc9efm/TAYmDNAIAOSDtAMf6QfG+85HFhcukburLzzc8KFx/2w
	2RpwAdnNOGoZipW9YFbXalQ/quvfKW2Bg7noVOUWS8rsASpSnR6rzwB+PzYVD9UXm02G
	SMjw==
X-Gm-Message-State: AIkVDXKhj6ko5AP3HZgBWuwcXPju3BP++lSpI5rkDGqJBKZ7YZ89Tma6tsPi5mNoQ1TDDw==
X-Received: by 10.84.143.203 with SMTP id 69mr2829576plz.68.1484756324201;
	Wed, 18 Jan 2017 08:18:44 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	p64sm1763671pfi.88.2017.01.18.08.18.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 08:18:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1484089899-29284-1-git-send-email-denis@denix.org>
	<20170117172624.GM15833@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bad0fdc1-6a8f-20f5-04e9-5dd52c124d06@gmail.com>
Date: Wed, 18 Jan 2017 08:18:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170117172624.GM15833@denix.org>
Subject: Re: [morty][PATCH] linux-dtb: strip DTB extension properly in postinst/postrm
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
X-List-Received-Date: Wed, 18 Jan 2017 16:18:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/17/2017 09:26 AM, Denys Dmytriyenko wrote:
> Ping
in staging
- armin
>
> On Tue, Jan 10, 2017 at 06:11:39PM -0500, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> The use of awk -F "." in do_install/do_deploy to strip filename extension
>> was deprecated long time ago in 72980d5bb465f0640ed451d1ebb9c5d2a210ad0c.
>>
>> Make a similar change in postinst/postrm to properly use basename command.
>>
>> Otherwise DTB files that contain dots in the name result in broken symlinks
>> that point to non-existent truncated files.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> (From OE-Core rev: 40c2addf0f0ee16b1c1334cf00f1490ffeaac475)
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
>> index 8528d64..2f378a1 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -68,7 +68,7 @@ pkg_postinst_kernel-devicetree () {
>>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>>   			DTB_EXT=${DTB##*.}
>> -			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
>> +			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>   			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>>   		done
>> @@ -81,7 +81,7 @@ pkg_postrm_kernel-devicetree () {
>>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>>   			DTB_EXT=${DTB##*.}
>> -			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
>> +			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>>   			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>>   		done
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


