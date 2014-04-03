Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B486760DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 14:17:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s33EHWMK006065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Apr 2014 07:17:32 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Apr 2014 07:17:31 -0700
Message-ID: <533D6D79.5010703@windriver.com>
Date: Thu, 3 Apr 2014 22:17:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, Denys Dmytriyenko <denis@denix.org>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
	<CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
	<CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
In-Reply-To: <CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Thu, 03 Apr 2014 14:17:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2014 09:04 PM, Paul Barker wrote:
> On 1 April 2014 13:29, Paul Barker <paul@paulbarker.me.uk> wrote:
>> On 1 April 2014 01:58, Denys Dmytriyenko <denis@denix.org> wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> The latest commit in opkg-utils allows packages created by opkg-build to be read
>>> by dpkg-deb again.
>>>
>>> (Based on OE-Core master rev: 219944af2700ce9dbc425fac384cd32b0a802123,
>>> but all of the update-alternative fixes from master are skipped)
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> Cc: Paul Barker <paul@paulbarker.me.uk>
>>> ---
>>>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> index 279cb74..fef0d13 100644
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>>                       file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>>>   RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
>>>   RDEPENDS_${PN}_class-native = ""
>>> -SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
>>> +SRCREV = "c33b217016ee911718b10c9d57f9912935baf5a9"
>>>   PV = "0.1.8+git${SRCPV}"
>>>
>>>   SRC_URI = "git://git.yoctoproject.org/opkg-utils \
>>> --
>>> 1.9.1
>>>
>>
>> Personally I would prefer rebasing the existing patch and fixing the
>> merge conflict, maintaining the patch author and existing sign offs
>> and adding your sign off to the end. I don't know if there's a policy
>> on this for Yocto Project.
>>

I think that keep the patch in the git repo is preferred if it has been
merged by the upstream.

But usually, we don't update the recipe (package) for the stable branch,
so I'm sorry to say that I'm afraid we can't take this patch unless there
are strong reasons.

Thanks for taking care of this.

// Robert

>> I've Cc'd Robert Yang as he's the stable branch maintainer for Dora as
>> per https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
>>
>
> Infact, NACK on this. opkg-utils/Makefile @
> c33b217016ee911718b10c9d57f9912935baf5a9 lists update-alternatives to
> be installed on 'make install'.
>
> If you want just this fix, you need to keep SRCREV as is and add the
> change from c33b217016ee911718b10c9d57f9912935baf5a9 as a new patch
> within oe-core.
>
> Thanks,
>

