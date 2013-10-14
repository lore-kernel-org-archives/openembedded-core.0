Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4CEC6BF59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:46:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9EDkePb015588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 06:46:40 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 14 Oct 2013 06:46:38 -0700
Message-ID: <525BF5C6.7000302@windriver.com>
Date: Mon, 14 Oct 2013 08:46:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1381745377-6129-1-git-send-email-koen@dominion.thruhere.net>
	<2930108.6fy5UNzbWP@helios>
	<F5284B34-0CDB-4F68-93B1-E748158FF690@dominion.thruhere.net>
In-Reply-To: <F5284B34-0CDB-4F68-93B1-E748158FF690@dominion.thruhere.net>
Subject: Re: [PATCHv2] openssh: allow login with empty password
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
X-List-Received-Date: Mon, 14 Oct 2013 13:46:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/13 6:09 AM, Koen Kooi wrote:
>
> Op 14 okt. 2013, om 12:37 heeft Paul Eggleton <paul.eggleton@linux.intel.com> het volgende geschreven:
>
>> On Monday 14 October 2013 12:09:37 Koen Kooi wrote:
>>> Currently both PAM and dropbear allow logins with empty passwords, but
>>> openssh doesn't. This commit changes the default in openssh to allow
>>> empty password logins.
>>>
>>> This should be changed to be a global config option in the long run.
>>>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config index
>>> 4f9b626..175e8f3 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
>>> @@ -59,7 +59,7 @@ Protocol 2
>>>
>>> # To disable tunneled clear text passwords, change to no here!
>>> #PasswordAuthentication yes
>>> -#PermitEmptyPasswords no
>>> +PermitEmptyPasswords yes
>>>
>>> # Change to no to disable s/key passwords
>>> #ChallengeResponseAuthentication yes
>>
>> We do already have logic in image.bbclass to set this based upon debug-tweaks
>> being in IMAGE_FEATURES; is that not working for you?
>
> I haven't tried that, but that still doesn't fix the inconsistency issues and presents problems during package upgrades.

If the behavior is inconsistent, then the fix should be to PAM, dropbear and the 
debug-tweaks.  (I'm really wondering if this behavior should be able to be run 
w/o the rest of the debug-tweaks.)

But the default, for security purposes, should be no root login.

--Mark

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


