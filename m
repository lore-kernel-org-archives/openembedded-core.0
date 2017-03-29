Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97F7E77BFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:27:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2TLREtw010229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Mar 2017 14:27:15 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 14:27:14 -0700
To: Andreas Oberritter <obi@opendreambox.org>, Andrea Adami
	<andrea.adami@gmail.com>
References: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
	<20170329230933.3b71d516@t510.zcs.saftware.de>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c6110ee5-fc40-a08a-0049-571308226dff@windriver.com>
Date: Wed, 29 Mar 2017 16:27:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170329230933.3b71d516@t510.zcs.saftware.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add whoami to HOSTTOOLS
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
X-List-Received-Date: Wed, 29 Mar 2017 21:27:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/29/17 4:09 PM, Andreas Oberritter wrote:
> On Wed, 29 Mar 2017 22:45:17 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
> 
>> Spotted in log do_compile of linux:
>>
>>  /tmp/build/tmp-glibc/work-shared/c7x0/kernel-source/scripts/mkcompile_h:
>>  line 46: whoami: command not found
> 
> As an alternative, we could set KBUILD_BUILD_USER (and possibly
> KBUILD_BUILD_HOST) to a fixed or machine-based value in kernel.bbclass'
> EXTRA_OEMAKE variable, which could also improve the reproducibility of
> builds.

Yes, this is a good alternative.

--Mark

> Regards,
> Andreas
> 
> 
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 96a9ed9..4f67413 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -462,7 +462,7 @@ HOSTTOOLS += " \
>>      mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
>>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
>>      sort split stat strings strip tail tar tee test touch tr true uname uniq \
>> -    wc wget which xargs \
>> +    wc wget which whoami xargs \
>>  "
>>  
>>  # Tools needed to run testimage runtime image testing
> 


