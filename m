Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECDF6E616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 14:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9JENOgC003319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Oct 2018 07:23:34 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 19 Oct 2018 07:23:13 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Dan McGregor
	<danismostlikely@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20181018152215.23525-1-danismostlikely@gmail.com>
	<fa65fef901b5056d730703ce1c01a1594b2dc37c.camel@linuxfoundation.org>
	<64558ddd-8865-a96b-cc19-5c0e6d270754@windriver.com>
Message-ID: <ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
Date: Fri, 19 Oct 2018 10:23:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <64558ddd-8865-a96b-cc19-5c0e6d270754@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Fri, 19 Oct 2018 14:24:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/19/18 10:18 AM, Randy MacLeod wrote:
> On 10/19/18 9:47 AM, Richard Purdie wrote:
>> On Thu, 2018-10-18 at 09:22 -0600, Dan McGregor wrote:
>>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>>
>>> These are also provided by toybox in its default configuration,
>>> and can be turned on in busybox.
>>>
>>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>>> ---
>>>   meta/recipes-core/util-linux/util-linux.inc | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>>> b/meta/recipes-core/util-linux/util-linux.inc
>>> index 3d8b3ff592c..2f99e8409f5 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -93,7 +93,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
>>>   FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
>>>   FILES_util-linux-runuser = "${sbindir}/runuser"
>>>   FILES_util-linux-prlimit = "${bindir}/prlimit"
>>> -FILES_util-linux-ionice = "${bindir}/ionice"
>>> +FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
>>>   FILES_util-linux-su = "${bindir}/su.util-linux
>>> ${sysconfdir}/pam.d/su-l"
>>>   CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
>>> @@ -209,7 +209,7 @@ ALTERNATIVE_${PN}  = " \
>>>       dmesg kill more mkswap blockdev pivot_root \
>>>       hexdump last lastb logger mesg renice wall \
>>>       setsid chrt flock utmpdump eject nologin taskset fallocate \
>>> -    fsfreeze nsenter \
>>> +    fsfreeze nsenter cal rev \
>>>   "
>>>   ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>>> @@ -218,8 +218,10 @@ ALTERNATIVE_LINK_NAME[more] =
>>> "${base_bindir}/more"
>>>   ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
>>>   ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>>>   ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>>> +ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
>>>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>>>   ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
>>> +ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
>>>   ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
>>>   ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>>> @@ -293,8 +295,8 @@ ALTERNATIVE_LINK_NAME[mountpoint] =
>>> "${base_bindir}/mountpoint"
>>>   ALTERNATIVE_util-linux-unshare = "unshare"
>>>   ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>>> -ALTERNATIVE_util-linux-switch-root = "switch_root"
>>> -ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>>> +ALTERNATIVE_util-linux-ionice = "ionice"
>>> +ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
>>
>>
>> The rebase went wrong here. I'll try and fix this up in -next and
>> retest so we can figure out if switch_root really is broken (cc
>> Randy)...
> 
> Ah, so it seems. Deleting switch-root alternatives, eh... WTF Dan! :)
> 
Oh, the oe-core commit log for master-next shows that Dan's
commit is fine so it's *Richard's" rebase. I rescind my humorous WTF.

../Randy

> Thanks Richard.
> 
> ../Randy
> 
>>
>> Cheers,
>>
>> Richard
>>
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

