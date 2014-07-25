Return-Path: <stefansat@telenet.be>
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
	[195.130.132.51])
	by mail.openembedded.org (Postfix) with ESMTP id 07ABF6AC82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:55:14 +0000 (UTC)
Received: from [192.168.65.2] ([84.198.230.176])
	by baptiste.telenet-ops.be with bizsmtp
	id WmvE1o0053p0LaU01mvEPo; Sat, 26 Jul 2014 00:55:14 +0200
Message-ID: <53D2E051.2000503@telenet.be>
Date: Sat, 26 Jul 2014 00:55:13 +0200
From: Stefan sat <stefansat@telenet.be>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53D2A234.60303@telenet.be> <53D2BE03.5060805@linux.intel.com>
In-Reply-To: <53D2BE03.5060805@linux.intel.com>
Subject: Re: Subversion does not support http protocol anymore
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
X-List-Received-Date: Fri, 25 Jul 2014 22:55:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Op 25-07-14 om 22:28 schreef Saul Wold:
> On 07/25/2014 11:30 AM, Stefan sat wrote:
>> Hello since a certain time native subversion build of
>> openembedded-oe-core does not support http protocol anymore.
>>
>> I found out that it is just the missing neon-config script file.
>>
>> Whitout this the subversion_1.7.10.bb builds whitout neon support.
>>
>> It was just ok by removing binconfig-disabled by
>> meta/recipes-support/neon/neon_0.30.0.bb
>>
>> Then rebuild neon and subversion.
>>
>> Included git patch file
>>
>
> Richard recently updated subversion to 1.8.9, which uses serf instead 
> of neon.  If this patch is for Daisy, please update it as mentioned here.
>
> Can you please add a Signed-off-by: and use git format-patch, also 
> look at this wiki:
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Please format the commit message correctly and then re-submit with a 
> [daisy] tag if appropriate.
>
> Thanks
>     Sau!
>
>> Thank's
>>
>>
>
I just saw that the used openembedded-core in openpli-4.0 is not up to 
date with the current master, and so still has the head rev where 
subversion_1.7.10 was used . But by neon the binconfig-disabled was 
inherited. No with 1.8.9 neon is not needed any more

sorry, disregard the patch

Thanks anyway.

