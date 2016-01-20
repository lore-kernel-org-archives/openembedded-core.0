Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBB86FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:19:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K8JrNA021917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 00:19:53 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 20 Jan 2016 00:19:52 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1453270225-19279-1-git-send-email-jian.liu@windriver.com>
	<1453276179.27999.139.camel@linuxfoundation.org>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <569F435F.7030208@windriver.com>
Date: Wed, 20 Jan 2016 16:20:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1453276179.27999.139.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.169]
Subject: Re: [PATCH] linux-libc-headers: not to create empty rpm
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
X-List-Received-Date: Wed, 20 Jan 2016 08:19:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2016年01月20日 15:49, Richard Purdie wrote:
> On Wed, 2016-01-20 at 14:10 +0800, Jian Liu wrote:
>> linux-libc-headers-dbg is empty and unset ALLOW_EMPTY
>> for this sub-package.
>>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
>> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
>> -headers.inc
>> index 2ba6ed5..75f6899 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
>> ${EXTENDPKGV})"
>>   
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   DEPENDS += "unifdef-native"
>> +
>> +ALLOW_EMPTY_${PN}-dbg = "0"
> It may be empty but our packaging criteria say we always generate a dbg
> package since they can be part of dependency chains and we're
> interested in the dependencies.
>
> I appreciate in this case, the libc-headers are a corner case at the
> end of the chains so you could argue this one can be skipped for
> packaging but the system does assume all -dbg packages exist so I'd
> prefer to leave this alone, unless its part of a bigger picture rethink
> about -dbg packages.
I see

Thanks very much for reminding me this.

>
> Cheers,
>
> Richard
>
>
>


