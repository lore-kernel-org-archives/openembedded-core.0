Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SocA4-0006Tp-RC
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:15:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id A0747138210;
	Tue, 10 Jul 2012 09:04:24 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id q5LkTJ0rjpKF; Tue, 10 Jul 2012 09:04:22 -0600 (MDT)
Received: from [172.20.102.0] (vpn00.camp.se-eng.com [172.20.102.0])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id A5A8513820F;
	Tue, 10 Jul 2012 09:04:21 -0600 (MDT)
Message-ID: <4FFC4472.2020403@se-eng.com>
Date: Tue, 10 Jul 2012 09:04:18 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
	<1341930923-26277-1-git-send-email-ray.danks@se-eng.com>
	<4FFC43D5.7060708@linux.intel.com>
In-Reply-To: <4FFC43D5.7060708@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mkelfimage: Upgrade to e1e6a91
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:15:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 09:01 AM, Saul Wold wrote:
> On 07/10/2012 07:35 AM, Raymond Danks wrote:
>> Address QA issue: Files/directories were installed but not shipped.
>> New revision contains patch to mkelfimage removing
>> /usr/share/mkelfImage/elf32-i386 directory from Makefile install target.
>>
>> http://review.coreboot.org/#/c/1195/
>>
>> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
>> ---
>> v2:
>>    Reword commit log
>>
> I hate to do this, but I am looking at the summary and it really does 
> not tell me anything, a better summary would be something like:
>
> mkelfimage: corrected packaging issue in upstream
Saul,

That's basically what the comment said before it was nacked.  I'm not 
attached to the summary or the commit log.  Feel free to do with it what 
you want.

The change to the .bb file fixes the issue.

Thanks,
Ray
>
> ...
>
> Thanks
>     Sau!
>
>>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb 
>> b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> index 1224a63..4b45c67 100644
>> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> @@ -4,7 +4,7 @@ SECTION = "devel"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
>>
>> -SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
>> +SRCREV = "e1e6a91ce0738400fa1615179de88ebc0df29f66"
>>   PV = "1.0.0+gitr${SRCPV}"
>>   PR = "r1"
>>
>>
>



