Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8DB6077F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 11:48:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5IBm5GB010074
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 04:48:05 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 18 Jun 2013 04:48:04 -0700
Message-ID: <51C048D9.6070702@windriver.com>
Date: Tue, 18 Jun 2013 19:47:37 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1371392062.git.kai.kang@windriver.com>
	<30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
	<1371481874.20823.108.camel@ted>
In-Reply-To: <1371481874.20823.108.camel@ted>
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] strace: update depends
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
X-List-Received-Date: Tue, 18 Jun 2013 11:48:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月17日 23:11, Richard Purdie wrote:
> On Sun, 2013-06-16 at 22:16 +0800, Kai Kang wrote:
>> Build strace with libaio and acl to support more features. Because no
>> native libaio package, just add dependencies for target.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/strace/strace_4.7.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
> Shouldn't this be implemented like the other packages as PACKAGECONFIG
> options? That is how acl is handled elsewhere at least...

Yes, PACKAGECONFIG is the right way. I'll send V2.

Thanks,
Kai

>
> Cheers,
>
> Richard
>
>> diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
>> index e360e63..bcc7bd9 100644
>> --- a/meta/recipes-devtools/strace/strace_4.7.bb
>> +++ b/meta/recipes-devtools/strace/strace_4.7.bb
>> @@ -5,6 +5,8 @@ LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
>>   PR = "r4"
>>   
>> +DEPENDS_class-target += "libaio acl"
>> +
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>>              file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
>>              file://0014-x32-update-syscall-table.patch \
>
>


-- 
Regards,
Neil | Kai Kang


