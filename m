Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 129F56DEFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:36:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBAFaTTD007370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 07:36:29 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 07:36:29 -0800
Message-ID: <52A734FC.4020306@windriver.com>
Date: Tue, 10 Dec 2013 09:36:28 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386669285.git.Qi.Chen@windriver.com>	<51a89b7ff6efb35278daf3373040434a9673dba8.1386669285.git.Qi.Chen@windriver.com>
	<3004077.UQdCbJxAtD@helios>
In-Reply-To: <3004077.UQdCbJxAtD@helios>
Subject: Re: [PATCH 2/3] image.bbclass: remove zap_root_password
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
X-List-Received-Date: Tue, 10 Dec 2013 15:36:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/13, 6:15 AM, Paul Eggleton wrote:
> Hi Qi,
>
> On Tuesday 10 December 2013 17:58:51 Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This function replaces the root password with '*' if 'debug-tweaks'
>> is not in IMAGE_FEATURES. As a result, if we don't have 'debug-tweaks',
>> we would be locked out of the system. That means, if the user uses a
>> bbappend file for base-passwd to set the root password, he would not be
>> able to login as root; if the user uses 'EXTRA_USERS_PARAMS' to set
>> the root password, he would still not be able to login as root.
>>
>> In a word, this function should be removed to make things work correctly.
>
> Er, unless I'm missing something about what you're adding in the other patch,
> you *cannot* simply remove this. The intentional design of the existing code
> is that having "debug-tweaks" in IMAGE_FEATURES means that you can log in as
> root with no password; but most importantly if "debug-tweaks" is not present
> you cannot log in at all as root (in the absence of anything that sets the
> root password, of course). Any changes must preserve this behaviour.

I agree.  The default behavior on most systems should be absolutely no way to 
directly login as root.  Instead logins should occur based on a non-privileged 
user.  (The other patches in that set look good to me.)

--Mark

> Cheers,
> Paul
>


