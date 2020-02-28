Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id B0AF96195E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:32:05 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a12so2479101ljj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5h+eo6wsqXNC5DQeBFyvlF9aAzN4drj3xjzweH2RQLE=;
	b=C9SoTvo/3TsYxBbGo4jM4h9Qr/idw+6SjJmY+gB8MZrHH0YUgbsWyK1NJkVM+PMxVO
	72hAd4MkVQxECysnCTmk9LVZFnGLLRY3vbNjq6PumGYVUNZjHqSoeVTOjhyEux1O+nUH
	qqdq6+W9//sPiaprc8/YSJ5SopIMvYtHVhkO4VhagGlJ3vPf3Y0htgfi0K9e+LNHRUV8
	BaYMHnPJcW8aoaUAuYU082nxfxKv3yaKJpP7WJzPo2r9RzI6XaItHbT/DZ5pBwAxS70a
	Vvt6otj5Bse5wKOUyDMYbueS3b0mkR+ExD4bMlJSrkOTRs4JpOKBUOYvdxAakdsxZu5V
	bapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5h+eo6wsqXNC5DQeBFyvlF9aAzN4drj3xjzweH2RQLE=;
	b=MMS7ED3R5kBIlwC83zm3hCy/SkMeHTEjtH81wROFjRzzjqkb5GCYIeWk/9xUm44zcU
	2VrLn0WXWQUQIZyQg6Xi9Aq4QUgk27ZQ7G/aRnOPS+/NXwrMtipAMY2/FLzcc/vwl9q2
	U8/kOPOvKom1aP9DWwMO2vH2ufvmzJn67eUTYTT8cyIZ1HKzBF5E1P68RQAU1QLlSsbE
	5RxxEwFwDqphxG1Znx/Lwoq27x0YRc/W1RVLtohNiE4CIj9k6d7DD7N0GIuucI8EjViO
	gO4+K8h8kNbTD6G8hklsFkg3SKNcWnm+tmRg525KYKRTKkUI7s9UPIlD1SJXjjleWt/F
	Al9A==
X-Gm-Message-State: ANhLgQ2Vq3dz6PSe27ffMdCa3fbeuCUXBukKpXByDR/5BHFPd36J4K/A
	skCFSxD7Na6/gGZFY3UgjH7+ZgNX
X-Google-Smtp-Source: ADFU+vu5DCVrwAacjErTB8b6sYVPjfW9I1xo++PURt0RINOWoZGHVaubnpLAqTP/hqFnycoAdNw5vQ==
X-Received: by 2002:a2e:2c0f:: with SMTP id s15mr3009783ljs.81.1582900325502; 
	Fri, 28 Feb 2020 06:32:05 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id g15sm5975088ljk.8.2020.02.28.06.32.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Feb 2020 06:32:04 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>,
	Douglas Royds <douglas.royds@taitradio.com>
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
	<0bc2d250-0644-5d68-623c-8718604f7ee5@gmail.com>
	<a1cd291b-495b-1240-6dd0-0e23fbcf1030@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <22ffcfb1-dc88-0b1d-4d32-0f05a3956221@gmail.com>
Date: Fri, 28 Feb 2020 15:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a1cd291b-495b-1240-6dd0-0e23fbcf1030@gmail.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 14:32:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/28/20 3:18 PM, Joshua Watt wrote:
> 
> On 2/28/20 7:41 AM, Jacob Kroon wrote:
>> On 2/28/20 2:39 PM, Jacob Kroon wrote:
>>> On 2/27/20 11:35 PM, Douglas Royds via Openembedded-core wrote:
>>>> On 28/02/20 11:34 am, Joshua Watt wrote:
>>>>
>>>>>
>>>>> On 2/27/20 4:29 PM, Douglas Royds wrote:
>>>>>>
>>>>>> On 28/02/20 10:49 am, Joshua Watt wrote:
>>>>>>
>>>>>>>
>>>>>>> On 2/27/20 3:22 PM, Douglas Royds wrote:
>>>>>>>>
>>>>>>>> On 28/02/20 5:45 am, Joshua Watt wrote:
>>>>>>>>
>>>>>>>>> On 2/27/20 9:01 AM, Joshua Watt wrote:
>>>>>>>>>> On 2/26/20 11:46 PM, Douglas Royds wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 26/02/20 4:53 am, Jacob Kroon wrote:
>>>>>>>>>>>
>>>>>>>>>>>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>>>>>>>>>>>> Hi Douglas,
>>>>>>>>>>>>>
>>>>>>>>>>>>> You updated a comment in reproducible_build.bbclass, commit 
>>>>>>>>>>>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it 
>>>>>>>>>>>>>> is stored in the recipe's ${SDE_FILE}.
>>>>>>>>>>>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it 
>>>>>>>>>>>>>> is stored in the recipe's SDE_FILE.
>>>>>>>>>>>>>> +# If none of these mechanisms are suitable, replace the 
>>>>>>>>>>>>>> do_deploy_source_date_epoch task
>>>>>>>>>>>>>> +# with recipe-specific functionality to write the 
>>>>>>>>>>>>>> appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
>>>>>>>>>>>>>> +#
>>>>>>>>>>>>>
>>>>>>>>>>>>> But I can't really get this to work. What did work for me 
>>>>>>>>>>>>> was to replace "do_create_source_date_epoch_stamp()" in my 
>>>>>>>>>>>>> recipe:
>>>>>>>>>>>>>
>>>>>>>>>>>>> do_create_source_date_epoch_stamp() {
>>>>>>>>>>>>>      mkdir -p ${SDE_DIR}
>>>>>>>>>>>>>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>>>>>>>>>>>> }
>>>>>>>>>>>>>
>>>>>>>>>>>>> What is the intended way to achieve the thing I'm trying to 
>>>>>>>>>>>>> do here ?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> FYI, JPEW has a proposed patch here
>>>>>>>>>>>>
>>>>>>>>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce 
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>>>>>>>>>>>
>>>>>>>>>>>> But maybe that currently is at odds with SOURCE_DATE_EPOCH 
>>>>>>>>>>>> being in BB_HASHBASE_WHITELIST ?
>>>>>>>>>>>>
>>>>>>>>>>>> /Jacob
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On the surface of it, my comment appears to be just wrong: It 
>>>>>>>>>>> does make sense to replace 
>>>>>>>>>>> do_create_source_date_epoch_stamp() as you suggest.
>>>>>>>>>>>
>>>>>>>>>>> Joshua's proposed patch looks promising:
>>>>>>>>>>>
>>>>>>>>>>>   * Should the new function not be called first, so that it
>>>>>>>>>>>     takes priority over the git, known files, and youngest file
>>>>>>>>>>>     functions? If someone has explicitly set SOURCE_DATE_EPOCH,
>>>>>>>>>>>     then they want it to take priority.
>>>>>>>>>>>
>>>>>>>>>> Having that be the first option makes sense. The only case in 
>>>>>>>>>> which that might not work, is if a recipe does something like:
>>>>>>>>>>
>>>>>>>>>>  SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"
>>>>>>>>>>
>>>>>>>>>> e.g. uses a function to get the SDE instead of setting to a 
>>>>>>>>>> fixed value, but that's probably going to be extremely rare.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>  *
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>   * As you observe, SOURCE_DATE_EPOCH would need to be removed
>>>>>>>>>>>     from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
>>>>>>>>>>>     whitelist in the first place.
>>>>>>>>>>>
>>>>>>>>>> I'm not sure why exactly it is whitelisted; I didn't write the 
>>>>>>>>>> original code that whitelisted it, but I've CC'd Juro in case 
>>>>>>>>>> he happens to remember.
>>>>>>>>>>
>>>>>>>>> After a discussion with Richard, we figured out why 
>>>>>>>>> SOURCE_DATE_EPOCH has to be whitelisted. The value of the 
>>>>>>>>> variable *must* be calculable at parse time before any task is 
>>>>>>>>> ran, but in practice it's value is only available once the 
>>>>>>>>> __source_date_epoch.txt file is present, which is after 
>>>>>>>>> parsing. This causes the taskhash to be calculated differently 
>>>>>>>>> during parsing and task execution which causes taskhash 
>>>>>>>>> mismatch errors.
>>>>>>>>>
>>>>>>>>
>>>>>>>> True.
>>>>>>>>
>>>>>>>> What to do? Would it work to use a different non-whitelisted 
>>>>>>>> variable in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?
>>>>>>>>
>>>>>>>
>>>>>>> Ya, that would work. You'd have to figure out how to get the 
>>>>>>> variable to be included in each taskhash even though it's not 
>>>>>>> directly referenced, but I'm sure that's possible.
>>>>>>>
>>>>>>>
>>>>>>> Another option that's at lot more "magic" would be something like 
>>>>>>> this: 
>>>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=2b524916cf35238ff3deea34017e8a4cd73926cd 
>>>>>>>
>>>>>>>
>>>>>>> That's really weird, and I'm not sure I like it, but worth a 
>>>>>>> thought.
>>>>>>>
>>>>>> If it works, it's good. I like the fact that the user can just set 
>>>>>> SOURCE_DATE_EPOCH directly in their recipe.
>>>>>>
>>>>>> How about ...
>>>>>>
>>>>>>     BB_HASHBASE_WHITELIST += "${@'SOURCE_DATE_EPOCH' if not
>>>>>>     source_date_epoch_var(d) else ''}"
>>>>>>
>>>>> Ya, that works. The only reason I chose "is None" was in case a 
>>>>> user really wanted to do
>>>>>
>>>>>   SOURCE_DATE_EPOCH = "0"
>>>>>
>>>> True, best to allow for that.
>>>>
>>>
>>> Joshua, I just tried the two top patches in your reproducible branch; 
>>> I can see that SOURCE_DATE_EPOCH is not in BB_HASHBASE_WHITELIST, 
>>> however, changing its value in my recipe doesn't trigger rebuilding 
>>> for some reason..
>>
>> In case it makes a difference, I only reference ${SOURCE_DATE_EPOCH} 
>> in my do_install() task.
> 
> 
> I don't think it matters. My understanding is that an export variable 
> (like SOURCE_DATE_EPOCH) is included in the taskhash of all tasks unless 
> it is specifically whitelisted. It's possible there is some bug I 
> haven't throughly tested it yet.... or it just can't work that way at 
> all for some reason. You might be able to dump the task signature for 
> your do_install task to see if SOURCE_DATE_EPOCH is being included.
> 

Using bitbake-dumpsig I can see that SOURCE_DATE_EPOCH is still in 
"basewhitelist:"

