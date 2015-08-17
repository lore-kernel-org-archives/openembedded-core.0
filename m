Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7E1759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:27:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H2RjHD000631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:27:45 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 16 Aug 2015 19:27:45 -0700
Message-ID: <55D1469F.4020708@windriver.com>
Date: Mon, 17 Aug 2015 10:27:43 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1439449078.git.liezhi.yang@windriver.com>
	<67e4fb4b7a8dc0c7e955e5ea5e4fc2048961f61b.1439449078.git.liezhi.yang@windriver.com>
	<55CE9496.6040401@windriver.com>
In-Reply-To: <55CE9496.6040401@windriver.com>
Subject: Re: [PATCH 1/3] toolchain-shar-extract.sh: add a space in the end
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
X-List-Received-Date: Mon, 17 Aug 2015 02:27:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/15/2015 09:23 AM, Randy MacLeod wrote:
> Nit pick on logs...
>
> In the short log:
> s/add a space in the end/
>   /Add a space after asking a question/
>
> On 2015-08-13 03:37 AM, Robert Yang wrote:
>> For a clear look when input.
> This is a sentence fragment. It will read better if you repeat yourself:
>
> Add a space at the end of a line when asking a question.
> This makes it easier to read.

Thanks, I will update it.

// Robert

>
> ../Randy
>>
>> [YOCTO #8089]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/files/toolchain-shar-extract.sh |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/files/toolchain-shar-extract.sh
>> b/meta/files/toolchain-shar-extract.sh
>> index 0a33ee8..3a50991 100644
>> --- a/meta/files/toolchain-shar-extract.sh
>> +++ b/meta/files/toolchain-shar-extract.sh
>> @@ -92,11 +92,11 @@ fi
>>
>>   if [ -e "$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@" ]; then
>>       echo "The directory \"$target_sdk_dir\" already contains a SDK for this
>> architecture."
>> -    printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
>> +    printf "If you continue, existing files will be overwritten! Proceed[y/N]? "
>>
>>       default_answer="n"
>>   else
>> -    printf "You are about to install the SDK to \"$target_sdk_dir\".
>> Proceed[Y/n]?"
>> +    printf "You are about to install the SDK to \"$target_sdk_dir\".
>> Proceed[Y/n]? "
>>
>>       default_answer="y"
>>   fi
>>
>
>

