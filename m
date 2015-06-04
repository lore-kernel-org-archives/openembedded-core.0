Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1B125757EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 17:51:19 +0000 (UTC)
Received: by qcmi9 with SMTP id i9so20786360qcm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IE/P1vMwRh4vd9ziBcj+dP8ZwJ6bvt/bxoPxKRfm744=;
	b=ahM9LJd+CzsRtaoGh+HkSTjnB39B7iUbZcVDhYVTwuInMX3Q2Uq+JKHOdhkvUeXCv0
	PzMR1QRW09mC9MPVM8Oyp/thmBPZ2BJmVnAkx5x3TDilQSStkCKDS50vZzZbn//9mAvh
	24Tow+QzEXrkQDHrjdpZl7HlHhsIFgerJQ0bPy5uua6GWEu2jmgqkAlR5Jw8VZtBmake
	YAzdikFPUjYsaqLYlavND4RB/4/e2vLVBmPhM/PGwjWv1qJvgED0IO7iB/gGCuoI0DZ2
	wxxnUufreHhGlaQt91j8pUeBdncBTOAR3p9jdY7jDfY4cvfI8zyH6VOXW569xcAROsss
	4hSg==
X-Received: by 10.55.16.165 with SMTP id 37mr72513610qkq.76.1433440281281;
	Thu, 04 Jun 2015 10:51:21 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:64ea:8623:c8c5:b8b9?
	([2601:c:a700:3ba7:64ea:8623:c8c5:b8b9])
	by mx.google.com with ESMTPSA id 6sm2746154qks.37.2015.06.04.10.51.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 10:51:20 -0700 (PDT)
Message-ID: <55709013.1070201@gmail.com>
Date: Thu, 04 Jun 2015 10:51:15 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1431752355-17659-1-git-send-email-Martin.Jansa@gmail.com>
	<20150604083648.GB2376@jama>
In-Reply-To: <20150604083648.GB2376@jama>
Subject: Re: [dizzy][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Thu, 04 Jun 2015 17:51:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

done

On 06/04/2015 01:36 AM, Martin Jansa wrote:
> On Sat, May 16, 2015 at 06:59:15AM +0200, Martin Jansa wrote:
>> From: Martin Jansa <martin.jansa@gmail.com>
>
> ping
>
>>
>> * install populate-extfs.sh from contrib, be aware that in order
>>    to use it you need to set DEBUGFS shell variable, otherwise it will
>>    try to use debugfs from relative path which is almost always
>>    incorrect:
>>      CONTRIB_DIR=$(dirname $(readlink -f $0))
>>      DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> index 70ccdfd..95c612c 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> @@ -54,6 +54,8 @@ do_install () {
>>   	oe_multilib_header ext2fs/ext2_types.h
>>   	install -d ${D}${base_bindir}
>>   	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
>> +
>> +	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
>>   }
>>
>>   do_install_append_class-target() {
>> --
>> 2.4.0
>>
>

