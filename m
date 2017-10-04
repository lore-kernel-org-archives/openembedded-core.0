Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id AF5BA606CA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 02:25:15 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3y6KW01nC8z1qxLY;
	Wed,  4 Oct 2017 04:25:16 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3y6KW01GCYz1qr42;
	Wed,  4 Oct 2017 04:25:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id GakwAoVLuaHf; Wed,  4 Oct 2017 04:25:15 +0200 (CEST)
X-Auth-Info: vk9sWnMlwx5/fVwktNp05OVYd+KduaPKP9TFTGKEqeA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  4 Oct 2017 04:25:15 +0200 (CEST)
To: Andre McCurdy <armccurdy@gmail.com>,
	Juro Bystricky <juro.bystricky@intel.com>
References: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <427c98e1-fbe4-592b-6554-a3a93d747c61@denx.de>
Date: Wed, 4 Oct 2017 04:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>, yau.wai.gan@intel.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Wed, 04 Oct 2017 02:25:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/04/2017 04:01 AM, Andre McCurdy wrote:
> On Tue, Oct 3, 2017 at 2:54 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
>> With the commit f4e8e9242c5df095b52688b083df3c9d36e7144b
> 
> That revision doesn't exist in oe-core...

Also, isn't there some sort of standardized format for listing git
commit IDs in commit messages ? I recall Linux kernel agreed on
something like that.

>> some nios2 builds
>> (uboot, core-image-minimal, etc) were broken due to db trying to use ARM instructions
>> in mutexes. The reason was db "configure" used the cached entry from nios2-linux
>> (which was incorrect). So the remedy was to remove the incorrect cached entry
>> and let db "configure" figure out which is the proper mutex to use.
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>  meta/site/nios2-linux | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
>> index 2f4e570..5bae748 100644
>> --- a/meta/site/nios2-linux
>> +++ b/meta/site/nios2-linux
>> @@ -33,7 +33,6 @@ db_cv_path_sh=${db_cv_path_sh=/bin/sh}
>>  db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
>>  db_cv_align_t=${db_cv_align_t='unsigned long long'}
>>  db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
>> -db_cv_mutex=${db_cv_mutex=ARM/gcc-assembly}
>>  db_cv_posixmutexes=${db_cv_posixmutexes=no}
>>  db_cv_uimutexes=${db_cv_uimutexes=no}
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Best regards,
Marek Vasut

