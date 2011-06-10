Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUugq-0000bB-46
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 07:55:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jun 2011 22:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="10587907"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2011 22:52:06 -0700
Message-ID: <4DF1B106.7060101@linux.intel.com>
Date: Thu, 09 Jun 2011 22:52:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
	<4DF170D5.70805@linux.intel.com> <4DF1850A.1030608@gmail.com>
	<4DF19FD9.2040701@linux.intel.com> <4DF1AD5C.1030605@gmail.com>
In-Reply-To: <4DF1AD5C.1030605@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssh_5.8p2.bb: Update SRC_URI checksums
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
X-List-Received-Date: Fri, 10 Jun 2011 05:55:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 10:36 PM, Khem Raj wrote:
> On 06/09/2011 09:38 PM, Saul Wold wrote:
>> On 06/09/2011 07:44 PM, Khem Raj wrote:
>>> On 06/09/2011 06:18 PM, Saul Wold wrote:
>>>> On 06/09/2011 05:57 PM, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>> ---
>>>>> meta/recipes-connectivity/openssh/openssh_5.8p2.bb | 4 ++--
>>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>>> b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>>> index 04d99d9..d5c9e49 100644
>>>>> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>>> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>>> @@ -26,8 +26,8 @@ SRC_URI =
>>>>> "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>>>>> file://ssh_config \
>>>>> file://init \
>>>>> "
>>>>> -SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
>>>>> -SRC_URI[sha256sum] =
>>>>> "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
>>>>> +SRC_URI[md5sum] = "88a4a83b0e0e60cd545430d4e4bd7e0c"
>>>>> +SRC_URI[sha256sum] =
>>>>> "e5a1c821dd8dc33a94c445290956d52e03b3c450f9cd448b96d92317fd4cce42"
>>>>>
>>>>> inherit autotools
>>>>>
>>>> This is strange, since we are building in other places with this,
>>>> please
>>>> confirm you have a good tarball, vs what's in the upstream and on the
>>>> autobuilder.yoctoproject.org downloads area.
>>>>
>>>
>>> have you tried
>>>
>>> bitbake -ccleanall openssh;bitbake openssh ?
>>>
>> Yes, twice with out MIRROR and PREMIRROR set, same result no checksum
>> errors.
>>
>
> OK I think I know whats going on. In my case its getting it from slugos
> source mirror which is not same size as the one from ftp.openbsd.org
> probably the mirror needs update
>
> So drop it.
Consider it dropped!

Sau!
>> Sau!
>>
>>>> Thanks
>>>> Sau!
>>>
>>>
>
>


