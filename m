Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 50D65731D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:36:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 01 Aug 2016 09:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,456,1464678000"; d="scan'208";a="1033043650"
Received: from amrendax-mobl4.amr.corp.intel.com (HELO [10.255.77.92])
	([10.255.77.92])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2016 09:35:20 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
	<4da54d831c7002a28d51e3edf23fbee28d98d948.1469656341.git.alejandro.hernandez@linux.intel.com>
	<1469774951.9142.40.camel@linuxfoundation.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <1367a7a6-b6f7-d0e8-d193-39a72b23489a@linux.intel.com>
Date: Mon, 1 Aug 2016 11:35:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469774951.9142.40.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/5] cronie: upgrade to 1.5.1
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
X-List-Received-Date: Mon, 01 Aug 2016 16:36:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/29/2016 01:49 AM, Richard Purdie wrote:
> On Wed, 2016-07-27 at 21:52 +0000, Alejandro Hernandez wrote:
>> Signed-off-by: Alejandro Hernandez <
>> alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} |
>> 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-extended/cronie/{cronie_1.5.0.bb =>
>> cronie_1.5.1.bb} (95%)
>>
>> diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb
>> b/meta/recipes-extended/cronie/cronie_1.5.1.bb
>> similarity index 95%
>> rename from meta/recipes-extended/cronie/cronie_1.5.0.bb
>> rename to meta/recipes-extended/cronie/cronie_1.5.1.bb
>> index 697501a..99b2bb5 100644
>> --- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
>> +++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
>> @@ -23,8 +23,8 @@ SRC_URI = "
>> https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
>>   PAM_SRC_URI = "file://crond_pam_config.patch"
>>   PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin
>> -loginuid"
>>   
>> -SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
>> -SRC_URI[sha256sum] =
>> "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
>> +SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
>> +SRC_URI[sha256sum] =
>> "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
>>   
>>   inherit autotools update-rc.d useradd systemd
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
> ds/841/steps/BuildImages/logs/stdio
>
> and it killed multiple other builds:
>
> http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=7cb0ca
> b0765669856e359f21a19c47383dcfe84c&type=commit
>
> Cheers,
>
> Richard
Interesting, it didnt break on my build, I'll dig up whats going on

