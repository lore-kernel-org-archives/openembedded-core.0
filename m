Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6761072027
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 01:00:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1910hwM022617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Feb 2015 17:00:43 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 8 Feb 2015 17:00:42 -0800
Message-ID: <54D806BE.3020101@windriver.com>
Date: Mon, 9 Feb 2015 09:00:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1423032042-8373-1-git-send-email-kai.kang@windriver.com>
	<1423381949.20217.22.camel@linuxfoundation.org>
In-Reply-To: <1423381949.20217.22.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: upgrade to version 9.10.1
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
X-List-Received-Date: Mon, 09 Feb 2015 01:00:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年02月08日 15:52, Richard Purdie wrote:
> On Wed, 2015-02-04 at 14:40 +0800, Kai Kang wrote:
>> Upgrade bind to version 9.10.1.
>>
>> * remove bind9_9_5-CVE-2014-8500.patch which is merged and documented in file CHANGES
>> * remove cross-build-fix.patch which is fixed by upstream
>> * update dont-test-on-host.patch
>> * add backported bind-fix-autoheader-2.69.patch to fix configure error
>> * remove unrecognised configure options --with-export-includedir
>>    --enable-exportlib and --with-export-libdir
>> * add runtime dependency procps which is required by init script
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../bind/bind/bind-fix-autoheader-2.69.patch       |  48 +
>>   .../bind/bind/bind9_9_5-CVE-2014-8500.patch        | 990 ---------------------
>>   .../bind/bind/cross-build-fix.patch                |  21 -
>>   .../bind/bind/dont-test-on-host.patch              |  11 +-
>>   .../bind/{bind_9.9.5.bb => bind_9.10.1.bb}         |  17 +-
>>   5 files changed, 64 insertions(+), 1023 deletions(-)
>>   create mode 100644 meta/recipes-connectivity/bind/bind/bind-fix-autoheader-2.69.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2014-8500.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/cross-build-fix.patch
>>   rename meta/recipes-connectivity/bind/{bind_9.9.5.bb => bind_9.10.1.bb} (86%)
> This causes a build failure in dhcp:
>
> http://errors.yoctoproject.org/Errors/Search/Args/?items=10&query=31984ee6f39d6ef74c1b5257f204cdea4d031fe4
> and
> http://errors.yoctoproject.org/Errors/Search/Args/?items=10&query=36b3cb431a0dd06b898b5f1d50bc22a60ffd14f7

I'll check it. Thanks.

--Kai

>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Neil | Kai Kang


