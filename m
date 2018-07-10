Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1B475463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6A9RPF4006950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 02:27:25 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 10 Jul 2018 02:27:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1531122592-221110-1-git-send-email-changqing.li@windriver.com>
	<d1627eab4bff8883c6238d32c7704d4c29741d70.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <e9649579-6b3e-190e-94f8-9d7162063f7e@windriver.com>
Date: Tue, 10 Jul 2018 17:27:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <d1627eab4bff8883c6238d32c7704d4c29741d70.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
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
X-List-Received-Date: Tue, 10 Jul 2018 09:27:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



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
> I think this would be fixed by a new version of uninative-tarball after
> the recent change to include libnss-nis in it. We should probably have
> a new release of uninative rather than starting to add these DEPENDS
> everywhere...
>
> Cheers,
>
> Richard

You're right, checked recently merged buildtools-tarball.bb which fix 
same error,
it cannot cover this uninative-tarball, so we still need to add 
libnss-nis in
uninative-tarball.  Will you handle fix of uninative-tarball, add 
libnss-nis to
http://downloads.yoctoproject.org/releases/uninative?  I should not be 
able to do
this.

  //changqing
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


