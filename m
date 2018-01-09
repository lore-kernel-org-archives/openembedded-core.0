Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1F878936
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 01:37:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w091blP8028361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jan 2018 17:37:47 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 8 Jan 2018 17:37:46 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1515051241.git.Qi.Chen@windriver.com>
	<519437989588d44d130890dce1285d796e3382ad.1515051241.git.Qi.Chen@windriver.com>
	<1515107332.30291.21.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <3678a983-8ef6-b312-4eb3-da86c7e948dc@windriver.com>
Date: Tue, 9 Jan 2018 09:40:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1515107332.30291.21.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Tue, 09 Jan 2018 01:37:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2018 07:08 AM, Richard Purdie wrote:
> On Thu, 2018-01-04 at 15:35 +0800, Chen Qi wrote:
>> * ls.c license checksum is changed, but the license remains the same.
>>
>> * The new version provides native manual page support, there's no
>>    need to download extra manual page from gentoo site.
>>
>> * man-decouple-manpages-from-build.patch is removed, as new version
>>    has manual page support in environment lacking of perl.
>>
>> * hostname is explicitly enabled to keep the same with previous
>> recipe's
>>    behaviour.
>>
>> * ALTERNATIVE_XXX settings for lbracket.1 are removed as there's no
>> such
>>    file.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../man-decouple-manpages-from-build.patch         | 27 ------------
>> ----------
>>   .../{coreutils_8.28.bb => coreutils_8.29.bb}       | 24 +++++-------
>> -------
>>   2 files changed, 6 insertions(+), 45 deletions(-)
>>   delete mode 100644 meta/recipes-core/coreutils/coreutils/man-
>> decouple-manpages-from-build.patch
>>   rename meta/recipes-core/coreutils/{coreutils_8.28.bb =>
>> coreutils_8.29.bb} (80%)
> Sorry, doesn't build:
>
> https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/678/steps/BuildImages/logs/stdio
>
> Cheers,
>
> Richard
>

Sorry for my carelessness.

I've reproduced the problem on opensuse and fixed it.

V2 has been sent, which has been tested on Fedora, Ubuntu and opensuse 
for all qemu archs and for both glibc and musl.

Best Regards,
Chen Qi

