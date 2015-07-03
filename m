Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18D2965CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:02:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6391xTv019124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Jul 2015 02:02:00 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 3 Jul 2015 02:01:59 -0700
Message-ID: <55964F85.1070204@windriver.com>
Date: Fri, 3 Jul 2015 17:01:57 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1435800300-6257-1-git-send-email-wenzong.fan@windriver.com>
	<1435824337.7287.273.camel@linuxfoundation.org>
In-Reply-To: <1435824337.7287.273.camel@linuxfoundation.org>
Cc: Yue.Tao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] man: replace ',' with '#'
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
X-List-Received-Date: Fri, 03 Jul 2015 09:02:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2015 04:05 PM, Richard Purdie wrote:
> On Thu, 2015-07-02 at 09:25 +0800, wenzong.fan@windriver.com wrote:
>> From: Yue Tao <Yue.Tao@windriver.com>
>>
>> Sometimes, the parameters of CC contains the ',', which
>> cause the sed command failed, so replace the ',' with '#'
>
> What about BUILD_CC? Not sure if there are any linker parameters in
> there?

I didn't find an example, but in theory it's possible.

I have updated the patch and send V2 for reviewing.

Thanks
Wenzong

>
> Cheers,
>
> Richard
>
>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> ---
>>   meta/recipes-extended/man/man/configure_sed.patch | 22 ++++++++++++++++++++++
>>   meta/recipes-extended/man/man_1.6g.bb             |  1 +
>>   2 files changed, 23 insertions(+)
>>   create mode 100644 meta/recipes-extended/man/man/configure_sed.patch
>>
>> diff --git a/meta/recipes-extended/man/man/configure_sed.patch b/meta/recipes-extended/man/man/configure_sed.patch
>> new file mode 100644
>> index 0000000..6c047ac
>> --- /dev/null
>> +++ b/meta/recipes-extended/man/man/configure_sed.patch
>> @@ -0,0 +1,22 @@
>> +man: replace ',' with '#'
>> +
>> +Sometimes, the parameters of CC contains the ',', which
>> +cause the sed command failed, so replace the ',' with '#'
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> +---
>> +diff --git a/configure.old b/configure
>> +index 9f62cf9..b439055 100755
>> +--- a/configure.old
>> ++++ b/configure
>> +@@ -1321,7 +1321,7 @@ do
>> +   echo "Creating $infile from $infile.in"
>> +   sed -e '
>> + s,@version@,$version,
>> +-s,@CC@,$CC,
>> ++s#@CC@#$CC#
>> + s,@EXEEXT@,$EXEEXT,
>> + s,@BUILD_CC@,$BUILD_CC,
>> + s,@INSTALL@,$INSTALL,
>> diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
>> index d4a4b26..6a4c734 100644
>> --- a/meta/recipes-extended/man/man_1.6g.bb
>> +++ b/meta/recipes-extended/man/man_1.6g.bb
>> @@ -52,6 +52,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
>>              file://man.conf \
>>              file://manpath.5.gz;unpack=false \
>>              file://man-1.6g-whatis3.patch \
>> +           file://configure_sed.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
>> --
>> 1.9.1
>>
>
>
>
>

