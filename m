Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYfgh-000377-FW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 17:19:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 08:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,251,1352102400"; d="scan'208";a="219568638"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2012 08:05:33 -0800
Message-ID: <50A3C14B.7080707@linux.intel.com>
Date: Wed, 14 Nov 2012 08:05:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1352871028.git.sgw@linux.intel.com>
	<ced593109000abdca328d606f02ced75f30a9ca5.1352871028.git.sgw@linux.intel.com>
	<50A3A633.2040801@windriver.com>
In-Reply-To: <50A3A633.2040801@windriver.com>
Subject: Re: [PATCH 2/9] builder: Add password for user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 16:19:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2012 06:09 AM, Mark Hatle wrote:
> On 11/13/12 11:32 PM, Saul Wold wrote:
>> This is needed to allow openssh to work correctly for the Eclipse
>> plugin to have access to the build appliance to view/modify recipes
>> and lauch builds
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-graphics/builder/builder_0.1.bb |    5 +++--
>>   1 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb
>> b/meta/recipes-graphics/builder/builder_0.1.bb
>> index 5c12c14..7ac531c 100644
>> --- a/meta/recipes-graphics/builder/builder_0.1.bb
>> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
>> @@ -1,7 +1,7 @@
>>   SUMMARY = "New user to do specific job"
>>   DESCRIPTION = "This recipe create a new user named ${PN}, who is
>> used for specific jobs like building. The task can be auto started via
>> mini X"
>>   SECTION = "x11"
>> -PR = "r4"
>> +PR = "r5"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
>>
>>
>> @@ -18,7 +18,8 @@ inherit useradd
>>   USERADD_PACKAGES = "${PN}"
>>   USERADD_PARAM_${PN} = "--system --create-home \
>>                          --groups video,tty,audio \
>> -                       --user-group ${PN}"
>> +                       --user-group ${PN} \
>> +                       --password .gLibiNXn0P12"
>
> This should work, but can you add a comment that indicates the
> plain-text for the password?
>
Ahh, that would take all the fun out!

v2 coming with Otavio's suggestion also!

Sau!

> --Mark
>
>>   do_install () {
>>       install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


