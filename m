Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A96D665DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 10:25:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9BAPmx3016855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Oct 2014 03:25:48 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 11 Oct 2014 03:25:48 -0700
Message-ID: <543905A8.8070409@windriver.com>
Date: Sat, 11 Oct 2014 18:25:44 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <cover.1413018367.git.hongxu.jia@windriver.com>
	<bc8ec45d7dce55e301079b9949ab32d1d7fcd4d3.1413018367.git.hongxu.jia@windriver.com>
	<5438F663.8090303@windriver.com>
In-Reply-To: <5438F663.8090303@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] file: add wrapper to nativesdk-file
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
X-List-Received-Date: Sat, 11 Oct 2014 10:25:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2014 05:20 PM, Rongqing Li wrote:
>
>
> On 10/11/2014 05:07 PM, Hongxu Jia wrote:
>> "file" command in exported SDK doesn't work:
>> ...
>> $ file sysroots/
>> file: could not find any valid magic files!
>> ...
>>
>> In commit 7943338d1fea2b9e49b02f1c9f68b4a47188b883, it added wrapper
>> to file-native. Do the same thing for nativesdk-file.
>
> TA;
> but please add commit title after commit id.
> and make sure the commit id can be found in oe-core.
>

Use oe-core commit to instead, update git:

   git://git.pokylinux.org/poky-contrib hongxu/fix-nativesdk-file
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nativesdk-file


//Hongxu

> -Roy
>
>
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/file/file_5.18.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/file/file_5.18.bb 
>> b/meta/recipes-devtools/file/file_5.18.bb
>> index f2f8d03..9068b93 100644
>> --- a/meta/recipes-devtools/file/file_5.18.bb
>> +++ b/meta/recipes-devtools/file/file_5.18.bb
>> @@ -27,4 +27,9 @@ do_install_append_class-native() {
>>           --magic-file ${datadir}/misc/magic.mgc
>>   }
>>
>> +do_install_append_class-nativesdk() {
>> +    create_cmdline_wrapper ${D}/${bindir}/file \
>> +        --magic-file ${datadir}/misc/magic.mgc
>> +}
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>>
>


