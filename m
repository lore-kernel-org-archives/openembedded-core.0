Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUuRl-0000Qg-0K
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 07:39:53 +0200
Received: by pvc30 with SMTP id 30so1139170pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Oj8w4Gl6elguYYvOaMlHIOLC/E5lxjvdkfQGoOUUfJk=;
	b=mPHkSK2cbRb12nFjRWcQccDYpY+sh1gz+eHwM+dBlqThFfaBLHTmJCyPuo1k/h5uzK
	Uoqu5agYGvGt5epaHrYMdWL/AzW77MomETwxv9JzDa92SDqN37Tnpzu3Q6pqcBP7bAiM
	PPCUydBjRgYtjZC9Q4xPJcDZbA+j38BTEo13k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=cwfEJWufGkO/HbRbG1Y50Nu2sTYpmMQObgpINi6iwYRBRSXgpCYWl1cOi5HadfXOUa
	m9gbthv1VtXexsP/6Ry8sVLCQKuLw6e99qi/TSevaoLaFHnTkWolH4bB5jaupzkD/MiW
	P/EzXvgXw3so6kZLR8jLjmq6G4Gg/Am99TmZ8=
Received: by 10.142.216.17 with SMTP id o17mr281203wfg.181.1307684191674;
	Thu, 09 Jun 2011 22:36:31 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z2sm2495891wfz.0.2011.06.09.22.36.29
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 22:36:30 -0700 (PDT)
Message-ID: <4DF1AD5C.1030605@gmail.com>
Date: Thu, 09 Jun 2011 22:36:28 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1307667467-467-1-git-send-email-raj.khem@gmail.com>
	<4DF170D5.70805@linux.intel.com> <4DF1850A.1030608@gmail.com>
	<4DF19FD9.2040701@linux.intel.com>
In-Reply-To: <4DF19FD9.2040701@linux.intel.com>
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
X-List-Received-Date: Fri, 10 Jun 2011 05:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 09:38 PM, Saul Wold wrote:
> On 06/09/2011 07:44 PM, Khem Raj wrote:
>> On 06/09/2011 06:18 PM, Saul Wold wrote:
>>> On 06/09/2011 05:57 PM, Khem Raj wrote:
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> meta/recipes-connectivity/openssh/openssh_5.8p2.bb | 4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>> b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>> index 04d99d9..d5c9e49 100644
>>>> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
>>>> @@ -26,8 +26,8 @@ SRC_URI =
>>>> "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>>>> file://ssh_config \
>>>> file://init \
>>>> "
>>>> -SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
>>>> -SRC_URI[sha256sum] =
>>>> "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
>>>> +SRC_URI[md5sum] = "88a4a83b0e0e60cd545430d4e4bd7e0c"
>>>> +SRC_URI[sha256sum] =
>>>> "e5a1c821dd8dc33a94c445290956d52e03b3c450f9cd448b96d92317fd4cce42"
>>>>
>>>> inherit autotools
>>>>
>>> This is strange, since we are building in other places with this, please
>>> confirm you have a good tarball, vs what's in the upstream and on the
>>> autobuilder.yoctoproject.org downloads area.
>>>
>>
>> have you tried
>>
>> bitbake -ccleanall openssh;bitbake openssh ?
>>
> Yes, twice with out MIRROR and PREMIRROR set, same result no checksum
> errors.
>

OK I think I know whats going on. In my case its getting it from slugos 
source mirror which is not same size as the one from ftp.openbsd.org
probably the mirror needs update

So drop it.
> Sau!
>
>>> Thanks
>>> Sau!
>>
>>



