Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 876FE61170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:07:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t24so4107524oij.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=13bBZGHQizsYaBGTqAEersHt7UawNfGcJqBvVskIjuM=;
	b=MiaFEZvEWyWyvHZYwLEJ/50LC7eMRHl3LXronNr/V0UWF54qDxl2z9NmIgvu5i6Qca
	rEP+rX1ejVrjxfM5PF8Cug4ycSoJVx0zwmKrPcBxjYK7Xvdyq282buyJM1tMM7ifHAdR
	eeuQ7vxJ/0srDRpRPpbXp2bIlgsK/GSIA7Wo2OGbHMOJaa/113yrRLfwFbfMrfkNF8ir
	qZFjqL9sN4jw9Tq50flBBQ+SqFqXrrPICtV0ruU4sOp/CMi44lUYXrmqYa7X65s2pd9h
	TvkZf/2WTTFGiOCb5IFvRhccHhT6/qszYM6AXpVq9kyY7tOhV4BeYUiOnwDVgh5azzbq
	CHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=13bBZGHQizsYaBGTqAEersHt7UawNfGcJqBvVskIjuM=;
	b=Ckm2XqBNaI7FFJmjc9JueZ2WPsygHs9t80ob8GTSs0HI0rgJlp33oPVir1WSoU4KZf
	w8dQH+GuL2T05tucFZ2lvbjnbFF/bXMvX1phntHwbpzhsMc2pH5fn5Ttfuq/INNtjwoy
	T6lkH0HO0c5xa/VyfK08Txyr3X6omjzwgzwrBHo4GkaaJrgpkJbVDn3vc/hSLu4V0rk4
	DoZo7oRBh9q7BA2asOiOJxbMCK8xhbR3iSwMvQuP8yrkOqkjNtjKlxJjh4QxzDhHKCYm
	iSyaVRpDH+Zz5s85GgjXqcnu52nXZejBXC4aQJc63luN16UecgWOkpvwMFlORqih0djL
	HaFg==
X-Gm-Message-State: ANhLgQ0gEQ31k2CVNLuPiZd4zJeriyKmHCodWSx63PxdMKWJAvLg5hvn
	ZZh8Un1RFeYqMJWG/hP8PAyUDBZNbNI=
X-Google-Smtp-Source: ADFU+vsEPkf9f9iwOiXuI+uxFPCr0bmhgLcWjzeUsrAlzyfU56CyMqZLMYAUqlU8l2RLghPzsoD9Uw==
X-Received: by 2002:a05:6808:251:: with SMTP id
	m17mr3557884oie.15.1583366846155; 
	Wed, 04 Mar 2020 16:07:26 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:d40a:79d1:acb0:3414?
	([2600:1700:4c90:60a0:d40a:79d1:acb0:3414])
	by smtp.gmail.com with ESMTPSA id
	d131sm9560663oia.36.2020.03.04.16.07.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 16:07:25 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200304222447.1787-1-jpuhlman@mvista.com>
	<CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
	<CAJ86T=WvfFrSFakLWEXE=TTi1aw9zcVWdAxrAS7N7ZiDA1mvww@mail.gmail.com>
	<e097eb31-2f0e-cdda-cb5e-2484aeceadf3@mvista.com>
	<CAJ86T=U6NSoR-844usWLeUFtS8KyHeX8qaKiNdDH2pOZmP-zbQ@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <be8986e1-1d49-2a28-7db5-db47bf98d4d9@mvista.com>
Date: Wed, 4 Mar 2020 16:07:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U6NSoR-844usWLeUFtS8KyHeX8qaKiNdDH2pOZmP-zbQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Thu, 05 Mar 2020 00:07:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/4/2020 4:03 PM, Andre McCurdy wrote:
> On Wed, Mar 4, 2020 at 3:48 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>> On 3/4/2020 3:43 PM, Andre McCurdy wrote:
>>> On Wed, Mar 4, 2020 at 3:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Wed, Mar 4, 2020 at 2:25 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>>>>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>>
>>>>> Whether readline is installed on the build host or not
>>>>> influences the way gdbm builds. Depend on readline for
>>>>> a consistent build.
>>> It sounds like configuring with --without-readline would be a better solution?
>> Its an either/or. I suggested both in the bug(13714) basically either works.
> If both approaches work then an explicit configure option is preferred.

Alternate patch sent.


>
>>>>> This fails to build on a system with readline, and using
>>>>> the buildtools-extended installer.
>>>>>
>>>>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>>>>> ---
>>>>>    meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>>>> index 7e2efe3c9b..5326184181 100644
>>>>> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>>>> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>>>> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
>>>>>
>>>>>    inherit autotools gettext texinfo lib_package ptest
>>>>>
>>>>> +DEPENDS_class-native += "readline"
>>> Don't use += with an over-ride. It doesn't do what you might expect.
>> Okay.
>>
>> --
>> Jeremy A. Puhlman
>> jpuhlman@mvista.com
>>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


