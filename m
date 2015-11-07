Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13B28770EE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 07:07:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA777AFT031590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 6 Nov 2015 23:07:10 -0800
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 Nov 2015 23:07:09 -0800
Message-ID: <563DA31B.5080404@windriver.com>
Date: Sat, 7 Nov 2015 15:07:07 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1446703751-58313-1-git-send-email-wenzong.fan@windriver.com>
	<11B9075E-35C1-4101-8072-D44DCDF9A210@gmail.com>
In-Reply-To: <11B9075E-35C1-4101-8072-D44DCDF9A210@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: fix mips64 configure support
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
X-List-Received-Date: Sat, 07 Nov 2015 07:07:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2015 12:18 AM, Khem Raj wrote:
>
>> On Nov 4, 2015, at 10:09 PM, wenzong.fan@windriver.com wrote:
>>
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Match target name linux-mips64 as well, all mips64 targets will have
>> mips(32) userspace.
>
> this comment seems to be not relevant to the change
>

What about:

If target name is linux-mips64, set it as linux-mips to get it build 
with mips(32) userspace.

Thanks
Wenzong

>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>> meta/recipes-connectivity/openssl/openssl.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
>> index 8af423f..b69cb4c 100644
>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>> @@ -115,7 +115,7 @@ do_configure () {
>> 	linux-mipsel)
>> 		target=debian-mipsel
>> 		;;
>> -        linux-*-mips64)
>> +        linux-*-mips64 | linux-mips64)
>>                 target=linux-mips
>>                  ;;
>> 	linux-microblaze*|linux-nios2*)
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

