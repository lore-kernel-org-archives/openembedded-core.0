Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9CD6057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:19:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8SGJvY9010669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:19:58 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 09:19:57 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
	<CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
	<57EBDC0E.9030108@linux.intel.com>
	<CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
	<596619b6-5742-3284-0966-9ae0c9a7c5a3@windriver.com>
	<cb1b590b-1ed5-f8bd-5083-a87bcfca003f@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ae4d8893-e70f-8898-95ff-d0bc5b5505a1@windriver.com>
Date: Wed, 28 Sep 2016 11:19:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <cb1b590b-1ed5-f8bd-5083-a87bcfca003f@linux.intel.com>
Subject: Re: [PATCH] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 16:19:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/28/16 10:44 AM, Alexander Kanavin wrote:
> On 09/28/2016 06:44 PM, Mark Hatle wrote:
>> On 9/28/16 10:26 AM, Khem Raj wrote:
>>> We need to understand that disclaimer may be its requiring every one who is
>>> distributing it to accept it.
>>
>> It is purely Oracle wanting to stop people from automatically downloading from
>> them, also so they can harvest sales contacts.  (nothing wrong with that, but it
>> means that we should likely pick a different 'upstream'...)
>>
>> As Anibal indicated, the license itself has not changed -- so that is not an issue.
> 
> Mark, what is the current situation with 6.1/6.2 series of db? Are those 
> fit for updating to?

There are issues with the way BerkleyDB handles certain files.  Once that we've
not have any time or resources to investigate.  So we're stuck w/ 6.0.35 right
now.  (The issues have to do with journal file generation in a cross environment
with RPM 5.  All I know is that it wasn't working before, most likely due to a
configuration issue, but I've simply had no time to investigate.)

Symptoms:  Either during rootfs generation we get failures or code appears to
work fine the first time through, but as soon as you run it on the target
everything breaks.

> Alex
> 


