Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30C2E71044;
	Thu,  4 Sep 2014 15:41:47 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id r10so13745647pdi.8
	for <multiple recipients>; Thu, 04 Sep 2014 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=P4NEeI0vq/ibP9vxt2X+snNlI5MKg6LSCUl+pHuuJRg=;
	b=1CXqSHuH2mLIBSUyBDiYjvlBQYl9URpW5Y6QQDpYys5QRAsvNhU8tmD5OJfWZbDzd0
	DOOyxKWyJ73+sqOA0vVp1oGnabPgHhV47WDnq7wCzq2e69735oySKrEIMCPJb8lCkVG+
	6KBIdGfQioofO7Vm6glD+cVbt6fDXA83RBiKi9evd8pgTAOyvAa3rpbbyNk0cINMEcnp
	ajPXTgbYvlwpHWCN2J44hc1T11G+wXCvg1AVpdJ+FQBccbR0OEq95wTCCjYZ8sau+0u8
	YjN16nWN2rlk42pd0yUpZoOJVmM4vgW0P6bIsdN+OIoUDCu2gaASBr4ZTpI8OA32T8xm
	+wcg==
X-Received: by 10.66.155.2 with SMTP id vs2mr9857276pab.60.1409845305154;
	Thu, 04 Sep 2014 08:41:45 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:9d66:e68f:e0f4:6f0b?
	([2601:c:9380:601:9d66:e68f:e0f4:6f0b])
	by mx.google.com with ESMTPSA id qy1sm2000313pbc.27.2014.09.04.08.41.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 08:41:43 -0700 (PDT)
Message-ID: <5408882C.6020506@gmail.com>
Date: Thu, 04 Sep 2014 08:41:32 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-devel@lists.openembedded.org, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<54087F3F.2040103@windriver.com>
In-Reply-To: <54087F3F.2040103@windriver.com>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 15:41:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2014 08:03 AM, Robert Yang wrote:
>
> On 09/04/2014 10:12 PM, Burton, Ross wrote:
>> Hi,
>>
>> Quick question of style for the community to bikeshed on:  in the
>> general case should recipes be split into foo_1.2.bb and foo.inc, or
>> should they only split to bb/inc if there are multiple versions and
>> generally there should just be foo_1.2.bb.
>
> I think that put the constants in .inc is helpful for upgrading, for
> example, the SUMMARY, DESCRIPTION, HOMEPAGE, SECTION, inherit and so on,
> they are unlikely to change when upgrade.

This is the same reason why I have split a bb into two parts when I 
submit upgrades. I feel it makes reviewing easier the next time a 
package gets upgraded. Trying to find the actual changes between a file 
being deleted and the new one being added might lead to missing something.

If there are unintentional consequence by doing this, that is a problem.

- Armin

> // Robert
>
>>
>> Specifically I'm looking at the libunwind patch for oe-core (moving
>> from meta-oe) which adds libunwind_1.1.bb and libunwind.inc.
>> Personally I feel that splitting them up complicates packaging and
>> should only be done if there's actually multiple versions being used.
>>
>> Ross
>>

