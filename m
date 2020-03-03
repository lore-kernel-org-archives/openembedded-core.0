Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB4B61A6F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 22:14:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id i10so3342593wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Gr+dpJQT054UN3Hpifu7CDIvvKb7cvoAtr4+ULNxTXY=;
	b=dbYRjto3tugtqsc8YH46265qJVwVjNkA4kboeTjzmgXuaWEo+stNj6bOwYBR0Q/i9H
	+brlbmrvGH4ZpLEQU1ExY65V/SwrKSWLc/TEpWG40Pf9RTH2I+vOfQOaO3AheOiITSGM
	bxfBrq3vZXaMqDlHtQPWv/xufb5UH0Hm2FA8lZ32fS1RZiUQDLXEU/JywzAfbjSH32Dm
	ExNPJ3kWnuD5ZGF/duSg8rELrA6i1DcOnzaXGcF33dISPEU0C/bdpjMv8cqPkKGYWuWq
	q+4I8UA3D/Ie39VUqjwtUIz+xPjGONlZbxHu08UX28YvqcA8XRELpOY+61i+O7aOtiMT
	m3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Gr+dpJQT054UN3Hpifu7CDIvvKb7cvoAtr4+ULNxTXY=;
	b=JeylEqJMLHwkphkycremd0L+QbYj5beAGNrkbc3R928nQSp4QtPMQjcZHVvZT0dsvB
	dE59ObjEv5+X1uyykAqVd0Q/DUk4/F+tEdneBfHcpqRd8urDylGNCF49oBj8HH6R47i+
	8t6wdouL2gLa+Qxs9ELARMgpfeZF9VPD3c7lbdIUXcMc0M9qxXs7yr38EMf103LnU8FQ
	Ke2K8tkCeQQLfxSTHBh62UjCmcHwY0R0GjSPrZ97UdYPHMWhX+bsWFpG/VLxczoZEcCu
	Hth/yZYZ/FJQeyQnV8Ufgh+NoadR/A9mXOWX8I0luRKGzcSflv7ElhPjDWaSW0SXTnnn
	Flrw==
X-Gm-Message-State: ANhLgQ1dAWLFcpYXzTVi8Hkditqx7+LLw2xEMsAFnqNH9ctMYO1Q+xGi
	gmpsxUs7gOk/hkmCxx63HX9JC4Hiv+s=
X-Google-Smtp-Source: ADFU+vsVfDSfNPOQ9YQI2igKbuutUPvIXX58/A9AP9SYBlc8d/ukMjn+GPos/cYJEXfMDg20oClbaA==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr583287wmg.15.1583273650961;
	Tue, 03 Mar 2020 14:14:10 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	i1sm14489862wrs.18.2020.03.03.14.14.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 14:14:10 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200229234742.3780-1-matt.ranostay@konsulko.com>
	<6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
	<CAMjhiJjY-9N=J03XNV=TuAUW+RAxWKfzrmM64rqPv0z_tx70yg@mail.gmail.com>
	<5251314825f750f21564e99b8e20b0de2625fd50.camel@linuxfoundation.org>
	<20200303221050.ldjizftg4vnq4m6r@jama>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <dbf4a3d1-1170-d485-96e0-55fd0066df33@gmail.com>
Date: Tue, 3 Mar 2020 23:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303221050.ldjizftg4vnq4m6r@jama>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 22:14:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/3/20 11:10 PM, Martin Jansa wrote:
> On Tue, Mar 03, 2020 at 09:45:25PM +0000, Richard Purdie wrote:
>> On Tue, 2020-03-03 at 22:23 +0100, Leon Woestenberg wrote:
>>> Hello all,
>>>
>>> On Tue, Mar 3, 2020 at 6:42 PM Jacob Kroon <jacob.kroon@gmail.com>
>>> wrote:
>>>> On 3/1/20 12:47 AM, Matt Ranostay wrote:
>>>>> Add pixmap to PACKAGECONFIG defaults to allow consumers to
>>>>> render color emojis without distro changes.
>>>>>
>>>>> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
>>>>> ---
>>>>> -PACKAGECONFIG ??= "zlib"
>>>>> +PACKAGECONFIG ??= "zlib pixmap"
>>>>>
>>>> Wouldn't it make sense to keep it off by default and let whoever
>>>> needs it enable it ?
>>>> /Jacob
>>>>
>>> I would agree, and would also vote for opt-in rather than opt-out for
>>> this use-case.
>>>
>>> Do we have a more generic stance on how we select the PACKAGECONFIG
>>> defaults?
>>
>> It feels like I've seen this come in a few times, I've said no, it
>> keeps coming back, I gave in.
>>
>> Basically the policy is trying to keep things as sensible defaults for
>> the majority of users. Many of our users are concerned about build
>> time, space usage and minimisation of dependencies.
>>
>> These things do change over time as our userbase changes and as the
>> demands and expectations from software changes.
>>
>> In this case its fairly hard to figure out that tweaking this option
>> breaks emojis and libpng isn't such an uncommon or problematic library.
>>
>> Its hard for me as the maintainer of all this to get a decent feeling
>> for how people feel about some changes so its also based a lot on feel,
>> there is only limited patch review a lot of the time.
>>
>> If there is strong demand not to have this, we can revert it. I'd like
>> to see how many people do/don't want it and see a few more opinions on
>> that though.
> 
> We (as LGE) have pixmap enabled at least since 2015, because people
> really want their color emojis on TVs, so having this enabled by default
> will allow me to eventually drop 1 bbappend from our layers eventually
> when we upgrade to 3.1.
> 
> So I would vote to keep this change.
> 
> But on the other hand it will still leave 828 other bbappends, so it
> doesn't make much difference to me :).
> 

Fair enough, sounds like there are good reasons to have it enabled by 
default.

/Jacob

