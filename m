Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A223F75532
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:33:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O8Xgjr010360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2018 01:33:42 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 24 Jul 2018 01:33:41 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1531122592-221110-1-git-send-email-changqing.li@windriver.com>
	<d1627eab4bff8883c6238d32c7704d4c29741d70.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9e9af3a2-d086-f60f-027f-7527cf7fd93b@windriver.com>
Date: Tue, 24 Jul 2018 16:32:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d1627eab4bff8883c6238d32c7704d4c29741d70.camel@linuxfoundation.org>
Subject: Re: [PATCH] coreutils: fix compile error since use wrong libnss_nis.so
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
X-List-Received-Date: Tue, 24 Jul 2018 08:33:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 07/09/2018 04:46 PM, Richard Purdie wrote:
> On Mon, 2018-07-09 at 15:49 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
>> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
>> file libnsl.so.1 with link time reference
>>
>> Recent glibc change removed libnss-nis module from glibc and
>> a new recipe libnss-nis.bb was added. After this change,
>> we need to include native libnss_nis in coreutils. otherwise,
>> with "nis" in host /etc/nssswitch.conf, id will use host
>> libnss_nis.so, which will cause above error
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/coreutils/coreutils_8.29.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I think this would be fixed by a new version of uninative-tarball after
> the recent change to include libnss-nis in it. We should probably have
> a new release of uninative rather than starting to add these DEPENDS
> everywhere...

When do you plan to rebuild uninative-tarball, please ? I can help if needed.

// Robert

> 
> Cheers,
> 
> Richard
> 

