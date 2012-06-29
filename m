Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SkhZ1-0004Qv-Fy
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:13:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 7DED61391B3;
	Fri, 29 Jun 2012 14:02:14 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yEUUDAzHqd6R; Fri, 29 Jun 2012 14:02:13 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id B67571391B2;
	Fri, 29 Jun 2012 14:02:12 -0600 (MDT)
Message-ID: <4FEE0A1D.9070309@se-eng.com>
Date: Fri, 29 Jun 2012 14:03:41 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
	<1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
	<4FEDEA1E.6080503@linux.intel.com>
In-Reply-To: <4FEDEA1E.6080503@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Fri, 29 Jun 2012 20:13:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 11:47 AM, Darren Hart wrote:
>
> On 06/29/2012 08:41 AM, Raymond Danks wrote:
>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>
>> ---
>> This was originally submitted to the openembedded project:
>> http://patches.openembedded.org/patch/7687/
>>
>> v2:
>>   Remove depreciated NATIVE_INSTALL_WORKS
>>
>>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   17 +++++++++++++++++
>>   1 files changed, 17 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>>
>> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> new file mode 100644
>> index 0000000..1224a63
>> --- /dev/null
>> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
>> +HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
>> +SECTION = "devel"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
>> +
>> +SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
>> +PV = "1.0.0+gitr${SRCPV}"
>> +PR = "r1"
> Minor, but I believe this should be "r0" for the initial creation of a
> recipe.
>
>
Yeah.  That's debatable.  I did send this to openembedded at one point.  
Yes, this is the first time this is included in openembedded-core, but 
it is different in that the patches that were applied in the previous 
version are already upstreamed to coreboot in this version.


