Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B859E6E671
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:32:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2S1WXt5029348
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 27 Mar 2017 18:32:34 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 18:32:33 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1490610854.git.liezhi.yang@windriver.com>
	<2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
	<1490621182.13980.260.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <631d32b8-99ae-9b06-02fd-0dc9fa1ad89a@windriver.com>
Date: Tue, 28 Mar 2017 09:32:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1490621182.13980.260.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add sudo to HOSTTOOLS
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
X-List-Received-Date: Tue, 28 Mar 2017 01:32:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/27/2017 09:26 PM, Richard Purdie wrote:
> On Mon, 2017-03-27 at 03:34 -0700, Robert Yang wrote:
>> Fixed:
>> $ bitbake meta-ide-support
>> $ . ./tmp/environment-setup-i586-poky-linux
>> $ runqemu tmp/deploy/images/qemux86/core-image-sato-
>> qemux86.qemuboot.conf
>>
>> [snip]
>> /bin/sh: sudo: command not found
>> runqemu - ERROR - Failed to setup tap device. Run runqemu-gen-tapdevs
>> to manually create.
>> [snip]
>>
>> The qemu can start, but the IP was wrong, this patch fixes the
>> problem.
>>
>> [YOCTO #11232]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/conf/bitbake.conf | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index fa5445b65b..0b1d8d82e0 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -468,6 +468,9 @@ HOSTTOOLS += " \
>>  # Tools needed to run testimage runtime image testing
>>  HOSTTOOLS += "ps stty ip ssh scp ping"
>>
>> +# Tools needed by runqemu in meta-ide-support environment
>> +HOSTTOOLS += "sudo"
>> +
>>  # Link to these if present
>>  HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc
>> socat sudo"
>
> sudo is already in HOSTTOOLS_NONFATAL?

Sorry, it isn't there when I added it last week, please drop my patch.

// Robert

>
> Cheers,
>
> Richard
>

