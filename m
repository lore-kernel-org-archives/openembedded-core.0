Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75AF060225
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:41:26 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c23so2128555lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iA6wa99aHup6cAdXoYcGl0CIuxZb2I1/7pOqo+rLFIQ=;
	b=KGmLGMORVX0H9x2o9l1BXXpxDM3fANK4ZBKzGDcJEaKl78DkpehJSTKqi9X/emET84
	0nqwGSr6tkm3SRjAiuQMG5Uea/Di2ebvpBi5xRQL056eZSV+mHHIucZrwEzozxNixA0F
	gWnynREACpgNDptYsIC5Vzhgmni3WxpTEH37/ImYNAq6lS/cu2MgQsoFpuiL963EzAw/
	Metugim5+X5SQmRUAKQtWaAcQ8T5qgGt1HQp/CRSInNazXOu2efySg0wplHhjI3JF49m
	IpqOSBd5T/NveaIZONOuekBMUqn01JKSmCFNmvwBRRzeAEWw7qTESc3+LWSqK+R8useX
	4L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iA6wa99aHup6cAdXoYcGl0CIuxZb2I1/7pOqo+rLFIQ=;
	b=rHd6BNu26IQK3Nx5qOCChWUeLGR/BWWKi6CXDqolcNosTvZACHAMhugTr1enOESZ5n
	8NBZ8XFgQLrVuQ9vQQBdkjTtqGrSHbW3g4F45V2XKGebII5oQSSgY3dZCo5Xy9wtnC6s
	r+IpsxUKX2qURAmNxzR/F/TeoZuMLqZh1/3zpMoOzVhBP353nPU5xwWL2WLGKhYtgloC
	7MIlMH9YT/e5A+sC0yTdQpCcE2cd+Goej5refl4pqqdE+86piq1jCTDVmTbMKfGpyc4E
	Bx7AFchmC5incrs2AqrVFcxJf1QXcKQnurZ4nMPRLNt7uhhJzdRDat99w5YfwDi2Oh1N
	t7dg==
X-Gm-Message-State: ANhLgQ2+FDCfNNpHoavVzyub23XbDDtPKkXC0ildV5rFIlFPo6fb3czV
	P/RHyvsfdDk1ehQFekni4UZNwz0v
X-Google-Smtp-Source: ADFU+vsBJs8d3/XK5FUKCCXZA02jDzDhVdrThu4xHjekjInMxuPEYiQMe9k3GuUZ4hvkl4XI787Xig==
X-Received: by 2002:a19:8982:: with SMTP id l124mr2725455lfd.151.1582897286513;
	Fri, 28 Feb 2020 05:41:26 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id w6sm4982606lfq.95.2020.02.28.05.41.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Feb 2020 05:41:25 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>,
	Joshua Watt <jpewhacker@gmail.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
	<0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
	<cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com>
	<e2a17625-3a90-6482-5af3-61a82ac04dcc@gmail.com>
	<baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com>
	<79e170f8-e6ae-f87b-70ea-f67fb870a28b@gmail.com>
	<47d8bb87-b3be-1789-c1cb-124b446462d8@taitradio.com>
	<91a70cd8-3e44-1381-e2df-15b1fbe3c7f5@gmail.com>
	<e84b37c8-d697-8227-ab1b-859f650b6844@taitradio.com>
	<93699aff-562e-f637-0436-b7b3b53e0fdf@gmail.com>
Message-ID: <0bc2d250-0644-5d68-623c-8718604f7ee5@gmail.com>
Date: Fri, 28 Feb 2020 14:41:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93699aff-562e-f637-0436-b7b3b53e0fdf@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Overriding SDE_FILE
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
X-List-Received-Date: Fri, 28 Feb 2020 13:41:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/28/20 2:39 PM, Jacob Kroon wrote:
> On 2/27/20 11:35 PM, Douglas Royds via Openembedded-core wrote:
>> On 28/02/20 11:34 am, Joshua Watt wrote:
>>
>>>
>>> On 2/27/20 4:29 PM, Douglas Royds wrote:
>>>>
>>>> On 28/02/20 10:49 am, Joshua Watt wrote:
>>>>
>>>>>
>>>>> On 2/27/20 3:22 PM, Douglas Royds wrote:
>>>>>>
>>>>>> On 28/02/20 5:45 am, Joshua Watt wrote:
>>>>>>
>>>>>>> On 2/27/20 9:01 AM, Joshua Watt wrote:
>>>>>>>> On 2/26/20 11:46 PM, Douglas Royds wrote:
>>>>>>>>>
>>>>>>>>> On 26/02/20 4:53 am, Jacob Kroon wrote:
>>>>>>>>>
>>>>>>>>>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>>>>>>>>>> Hi Douglas,
>>>>>>>>>>>
>>>>>>>>>>> You updated a comment in reproducible_build.bbclass, commit 
>>>>>>>>>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>>>>>>>>>
>>>>>>>>>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>>>>>>> stored in the recipe's ${SDE_FILE}.
>>>>>>>>>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>>>>>>> stored in the recipe's SDE_FILE.
>>>>>>>>>>>> +# If none of these mechanisms are suitable, replace the 
>>>>>>>>>>>> do_deploy_source_date_epoch task
>>>>>>>>>>>> +# with recipe-specific functionality to write the 
>>>>>>>>>>>> appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
>>>>>>>>>>>> +#
>>>>>>>>>>>
>>>>>>>>>>> But I can't really get this to work. What did work for me was 
>>>>>>>>>>> to replace "do_create_source_date_epoch_stamp()" in my recipe:
>>>>>>>>>>>
>>>>>>>>>>> do_create_source_date_epoch_stamp() {
>>>>>>>>>>>      mkdir -p ${SDE_DIR}
>>>>>>>>>>>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>>>>>>>>>> }
>>>>>>>>>>>
>>>>>>>>>>> What is the intended way to achieve the thing I'm trying to 
>>>>>>>>>>> do here ?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> FYI, JPEW has a proposed patch here
>>>>>>>>>>
>>>>>>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce 
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>>>>>>>>>
>>>>>>>>>> But maybe that currently is at odds with SOURCE_DATE_EPOCH 
>>>>>>>>>> being in BB_HASHBASE_WHITELIST ?
>>>>>>>>>>
>>>>>>>>>> /Jacob
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On the surface of it, my comment appears to be just wrong: It 
>>>>>>>>> does make sense to replace do_create_source_date_epoch_stamp() 
>>>>>>>>> as you suggest.
>>>>>>>>>
>>>>>>>>> Joshua's proposed patch looks promising:
>>>>>>>>>
>>>>>>>>>   * Should the new function not be called first, so that it
>>>>>>>>>     takes priority over the git, known files, and youngest file
>>>>>>>>>     functions? If someone has explicitly set SOURCE_DATE_EPOCH,
>>>>>>>>>     then they want it to take priority.
>>>>>>>>>
>>>>>>>> Having that be the first option makes sense. The only case in 
>>>>>>>> which that might not work, is if a recipe does something like:
>>>>>>>>
>>>>>>>>  SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"
>>>>>>>>
>>>>>>>> e.g. uses a function to get the SDE instead of setting to a 
>>>>>>>> fixed value, but that's probably going to be extremely rare.
>>>>>>>>
>>>>>>>>
>>>>>>>>>  *
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>   * As you observe, SOURCE_DATE_EPOCH would need to be removed
>>>>>>>>>     from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
>>>>>>>>>     whitelist in the first place.
>>>>>>>>>
>>>>>>>> I'm not sure why exactly it is whitelisted; I didn't write the 
>>>>>>>> original code that whitelisted it, but I've CC'd Juro in case he 
>>>>>>>> happens to remember.
>>>>>>>>
>>>>>>> After a discussion with Richard, we figured out why 
>>>>>>> SOURCE_DATE_EPOCH has to be whitelisted. The value of the 
>>>>>>> variable *must* be calculable at parse time before any task is 
>>>>>>> ran, but in practice it's value is only available once the 
>>>>>>> __source_date_epoch.txt file is present, which is after parsing. 
>>>>>>> This causes the taskhash to be calculated differently during 
>>>>>>> parsing and task execution which causes taskhash mismatch errors.
>>>>>>>
>>>>>>
>>>>>> True.
>>>>>>
>>>>>> What to do? Would it work to use a different non-whitelisted 
>>>>>> variable in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?
>>>>>>
>>>>>
>>>>> Ya, that would work. You'd have to figure out how to get the 
>>>>> variable to be included in each taskhash even though it's not 
>>>>> directly referenced, but I'm sure that's possible.
>>>>>
>>>>>
>>>>> Another option that's at lot more "magic" would be something like 
>>>>> this: 
>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=2b524916cf35238ff3deea34017e8a4cd73926cd 
>>>>>
>>>>>
>>>>> That's really weird, and I'm not sure I like it, but worth a thought.
>>>>>
>>>> If it works, it's good. I like the fact that the user can just set 
>>>> SOURCE_DATE_EPOCH directly in their recipe.
>>>>
>>>> How about ...
>>>>
>>>>     BB_HASHBASE_WHITELIST += "${@'SOURCE_DATE_EPOCH' if not
>>>>     source_date_epoch_var(d) else ''}"
>>>>
>>> Ya, that works. The only reason I chose "is None" was in case a user 
>>> really wanted to do
>>>
>>>   SOURCE_DATE_EPOCH = "0"
>>>
>> True, best to allow for that.
>>
> 
> Joshua, I just tried the two top patches in your reproducible branch; I 
> can see that SOURCE_DATE_EPOCH is not in BB_HASHBASE_WHITELIST, however, 
> changing its value in my recipe doesn't trigger rebuilding for some 
> reason..

In case it makes a difference, I only reference ${SOURCE_DATE_EPOCH} in 
my do_install() task.

