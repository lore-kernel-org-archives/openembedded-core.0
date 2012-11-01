Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TTx4L-0001GB-5E
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 16:52:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2012 08:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,693,1344236400"; d="scan'208";a="163383997"
Received: from unknown (HELO [10.255.14.28]) ([10.255.14.28])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Nov 2012 08:38:51 -0700
Message-ID: <5092978A.5000607@linux.intel.com>
Date: Thu, 01 Nov 2012 08:38:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1351755131-22192-1-git-send-email-sgw@linux.intel.com>
	<509295B0.3000707@windriver.com>
In-Reply-To: <509295B0.3000707@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] builder: Add password for user
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
X-List-Received-Date: Thu, 01 Nov 2012 15:52:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2012 08:30 AM, Mark Hatle wrote:
> On 11/1/12 2:32 AM, Saul Wold wrote:
>> This is needed to allow openssh to work correctly for the Eclipse
>> plugin to have access to the build appliance to view/modify recipes
>> and lauch builds
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-graphics/builder/builder_0.1.bb |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb
>> b/meta/recipes-graphics/builder/builder_0.1.bb
>> index 5c12c14..d46e960 100644
>> --- a/meta/recipes-graphics/builder/builder_0.1.bb
>> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
>> @@ -18,7 +18,8 @@ inherit useradd
>>   USERADD_PACKAGES = "${PN}"
>>   USERADD_PARAM_${PN} = "--system --create-home \
>>                          --groups video,tty,audio \
>> -                       --user-group ${PN}"
>> +                       --user-group ${PN} \
>> +                       --password ${PN}"
>
> The above won't work.  The password passed to --password, must be in
> encrypted in crypt(3) format.
>
Ah, thanks, turns out I also missed the PR Bump!

v2 coming

Sau!

> --Mark
>
>>
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


