Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SoJeq-00013s-Qw
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 21:30:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 49E041380BD;
	Mon,  9 Jul 2012 13:18:57 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Cr0xcwXV6HkL; Mon,  9 Jul 2012 13:18:53 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id ABEDC1380BC;
	Mon,  9 Jul 2012 13:18:52 -0600 (MDT)
Message-ID: <4FFB2EEB.5050805@se-eng.com>
Date: Mon, 09 Jul 2012 13:20:11 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
	<1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
	<4FF9FCCA.8080408@linux.intel.com>
In-Reply-To: <4FF9FCCA.8080408@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mkelfimage: Add stable git build (initial recipe)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 09 Jul 2012 19:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2012 03:34 PM, Saul Wold wrote:
> On 06/22/2012 01:22 PM, Raymond Danks wrote:
>> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
>> ---
>> This was originally submitted to the openembedded project:
>> http://patches.openembedded.org/patch/7687/
>>
>> Resubmitting to oe-core for review prior to commit in openembedded-core.
>>
>>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   18 
>> ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>>
>> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb 
>> b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> new file mode 100644
>> index 0000000..b341213
>> --- /dev/null
>> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION = "A utility to create ELF boot images from Linux kernel 
>> images"
>> +HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
>> +SECTION = "devel"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
>> +
>> +SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
>> +PV = "1.0.0+gitr${SRCPV}"
>> +PR = "r1"
>> +
>> +SRC_URI = 
>> "git://review.coreboot.org/p/coreboot;protocol=http;branch=master"
>> +
>> +S = "${WORKDIR}/git/util/mkelfImage"
>> +
>> +inherit autotools
>> +
>> +NATIVE_INSTALL_WORKS = "1"
>> +BBCLASSEXTEND = "native"
>>
>
> I found this packaging issue:
>> ERROR: QA Issue: mkelfimage: Files/directories were installed but not 
>> shipped
>>   /usr/share/mkelfImage
>>   /usr/share/mkelfImage/elf32-i386
>
> When I did a world build for x86
>
> Can you please address it.
Yes.  I'll send a patch and the corresponding patch to coreboot.

Thanks,
Ray
>
> Thanks
>
> Sau!
>



