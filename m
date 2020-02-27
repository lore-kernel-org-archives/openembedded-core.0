Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id A1A1461893
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:34:51 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id h3so1294515ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=WqE2djqDvDlZRiEDKz1i48hOINOhG4LI5tiwQKzgWt4=;
	b=qSWyVAbJXeG4HMF9kJKO8Jv6URHirhnj3Ywek0fNrt1En7kBKWDPJrKHblQh+9TrGM
	RZNo3R0er4IS/u+GMY49YITlektcazkznWU//piTGPCYJBnmmvf40f20/TPSY3re7Gdp
	w76CbGzNziEaF6MdvJcUDkfEqqrvm2tVC+WObc5KnlfwacKLJ1dqXU20zysLRhrgCVFR
	wOc0HfM0nWR1BuYtUoySJGrsug39qovVj8cxQtf+mh7fezKvTO/fEDopXFYCwZH793Gz
	FLpUjLrywy7KRHBAXjp8q5dR2J/3dTUKuJ/Cn+H3yNzRvJ/UNlliCfcBEG1iGmkTUpJC
	20LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=WqE2djqDvDlZRiEDKz1i48hOINOhG4LI5tiwQKzgWt4=;
	b=ZRakagytKE7KAXXEz/XtIL9I66INy0GBab9fnN6U5BAVyb4qCU1go8oNXnoII3YPvj
	/80Le/AHpseBbUhUa3e50MEvj6BJWJI6Uaak2J5cXKNk6LMd74G2P6di41QU296r7n6v
	gVs6FA26M5wT63KBqzQFg3qoUBSAKut1eVccOKOsQ3K13cbfeBNbAbYsqn+F1yww1UK0
	EVjZkazkj2IU9lixftNb3WeZE1ohmUpya+DAd6xSVAnKoWoR8gnYgfq32rjjdfLck8iH
	7BrfdTQ/HqY7vbMVvfhY45Hqfjq51tAeQCRibEjj7sEc/ygaV6tWbIQ2u5ZmJ11YijFz
	8lNA==
X-Gm-Message-State: APjAAAW3EWJuh4crA1WQb6tPAmBzx28ZRu1hXBZBjRuCVhfG0+5hY90H
	kCwqr2CeeeZzNbeaBY/IclI2G2E5dYg=
X-Google-Smtp-Source: APXvYqwP+QUzlWly/wMYiJZUKtIl4lv3IOTW7NKAXXZtSSaWeLttBypTt6n3xAbwkRnBQoh/oGTcuQ==
X-Received: by 2002:a6b:8d95:: with SMTP id p143mr232402iod.160.1582842892228; 
	Thu, 27 Feb 2020 14:34:52 -0800 (PST)
Received: from [10.30.196.58] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	i16sm1385903ile.37.2020.02.27.14.34.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 14:34:51 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
	<0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
	<cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com>
	<e2a17625-3a90-6482-5af3-61a82ac04dcc@gmail.com>
	<baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com>
	<79e170f8-e6ae-f87b-70ea-f67fb870a28b@gmail.com>
	<47d8bb87-b3be-1789-c1cb-124b446462d8@taitradio.com>
Message-ID: <91a70cd8-3e44-1381-e2df-15b1fbe3c7f5@gmail.com>
Date: Thu, 27 Feb 2020 16:34:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <47d8bb87-b3be-1789-c1cb-124b446462d8@taitradio.com>
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
X-List-Received-Date: Thu, 27 Feb 2020 22:34:51 -0000
Content-Type: multipart/alternative;
	boundary="------------C44297D943B31F86253D950C"
Content-Language: en-US

--------------C44297D943B31F86253D950C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/27/20 4:29 PM, Douglas Royds wrote:
>
> On 28/02/20 10:49 am, Joshua Watt wrote:
>
>>
>> On 2/27/20 3:22 PM, Douglas Royds wrote:
>>>
>>> On 28/02/20 5:45 am, Joshua Watt wrote:
>>>
>>>> On 2/27/20 9:01 AM, Joshua Watt wrote:
>>>>> On 2/26/20 11:46 PM, Douglas Royds wrote:
>>>>>>
>>>>>> On 26/02/20 4:53 am, Jacob Kroon wrote:
>>>>>>
>>>>>>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>>>>>>> Hi Douglas,
>>>>>>>>
>>>>>>>> You updated a comment in reproducible_build.bbclass, commit 
>>>>>>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>>>>>>
>>>>>>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>>>> stored in the recipe's ${SDE_FILE}.
>>>>>>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>>>> stored in the recipe's SDE_FILE.
>>>>>>>>> +# If none of these mechanisms are suitable, replace the 
>>>>>>>>> do_deploy_source_date_epoch task
>>>>>>>>> +# with recipe-specific functionality to write the appropriate 
>>>>>>>>> SOURCE_DATE_EPOCH into the SDE_FILE.
>>>>>>>>> +#
>>>>>>>>
>>>>>>>> But I can't really get this to work. What did work for me was 
>>>>>>>> to replace "do_create_source_date_epoch_stamp()" in my recipe:
>>>>>>>>
>>>>>>>> do_create_source_date_epoch_stamp() {
>>>>>>>>      mkdir -p ${SDE_DIR}
>>>>>>>>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>>>>>>> }
>>>>>>>>
>>>>>>>> What is the intended way to achieve the thing I'm trying to do 
>>>>>>>> here ?
>>>>>>>>
>>>>>>>
>>>>>>> FYI, JPEW has a proposed patch here
>>>>>>>
>>>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce 
>>>>>>>
>>>>>>>
>>>>>>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>>>>>>
>>>>>>> But maybe that currently is at odds with SOURCE_DATE_EPOCH being 
>>>>>>> in BB_HASHBASE_WHITELIST ?
>>>>>>>
>>>>>>> /Jacob
>>>>>>
>>>>>>
>>>>>> On the surface of it, my comment appears to be just wrong: It 
>>>>>> does make sense to replace do_create_source_date_epoch_stamp() as 
>>>>>> you suggest.
>>>>>>
>>>>>> Joshua's proposed patch looks promising:
>>>>>>
>>>>>>   * Should the new function not be called first, so that it takes
>>>>>>     priority over the git, known files, and youngest file
>>>>>>     functions? If someone has explicitly set SOURCE_DATE_EPOCH,
>>>>>>     then they want it to take priority.
>>>>>>
>>>>> Having that be the first option makes sense. The only case in 
>>>>> which that might not work, is if a recipe does something like:
>>>>>
>>>>>  SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"
>>>>>
>>>>> e.g. uses a function to get the SDE instead of setting to a fixed 
>>>>> value, but that's probably going to be extremely rare.
>>>>>
>>>>>
>>>>>>  *
>>>>>>
>>>>>>
>>>>>>
>>>>>>   * As you observe, SOURCE_DATE_EPOCH would need to be removed
>>>>>>     from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
>>>>>>     whitelist in the first place.
>>>>>>
>>>>> I'm not sure why exactly it is whitelisted; I didn't write the 
>>>>> original code that whitelisted it, but I've CC'd Juro in case he 
>>>>> happens to remember.
>>>>>
>>>> After a discussion with Richard, we figured out why 
>>>> SOURCE_DATE_EPOCH has to be whitelisted. The value of the variable 
>>>> *must* be calculable at parse time before any task is ran, but in 
>>>> practice it's value is only available once the 
>>>> __source_date_epoch.txt file is present, which is after parsing. 
>>>> This causes the taskhash to be calculated differently during 
>>>> parsing and task execution which causes taskhash mismatch errors.
>>>>
>>>
>>> True.
>>>
>>> What to do? Would it work to use a different non-whitelisted 
>>> variable in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?
>>>
>>
>> Ya, that would work. You'd have to figure out how to get the variable 
>> to be included in each taskhash even though it's not directly 
>> referenced, but I'm sure that's possible.
>>
>>
>> Another option that's at lot more "magic" would be something like 
>> this: 
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=2b524916cf35238ff3deea34017e8a4cd73926cd 
>>
>>
>> That's really weird, and I'm not sure I like it, but worth a thought.
>>
> If it works, it's good. I like the fact that the user can just set 
> SOURCE_DATE_EPOCH directly in their recipe.
>
> How about ...
>
>     BB_HASHBASE_WHITELIST += "${@'SOURCE_DATE_EPOCH' if not
>     source_date_epoch_var(d) else ''}"
>
Ya, that works. The only reason I chose "is None" was in case a user 
really wanted to do

   SOURCE_DATE_EPOCH = "0"




--------------C44297D943B31F86253D950C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/27/20 4:29 PM, Douglas Royds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:47d8bb87-b3be-1789-c1cb-124b446462d8@taitradio.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>On 28/02/20 10:49 am, Joshua Watt wrote: </p>
      <blockquote type="cite">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 2/27/20 3:22 PM, Douglas Royds
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com">
          <meta http-equiv="Content-Type" content="text/html;
            charset=UTF-8">
          <p>On 28/02/20 5:45 am, Joshua Watt wrote: </p>
          <blockquote type="cite">
            <meta http-equiv="Content-Type" content="text/html;
              charset=UTF-8">
            <div class="moz-cite-prefix">On 2/27/20 9:01 AM, Joshua Watt
              wrote:<br>
            </div>
            <blockquote type="cite"
              cite="mid:cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com">
              <meta http-equiv="Content-Type" content="text/html;
                charset=UTF-8">
              <div class="moz-cite-prefix">On 2/26/20 11:46 PM, Douglas
                Royds wrote:<br>
              </div>
              <blockquote type="cite"
                cite="mid:0319e121-7546-e456-50d6-4b224e87363f@taitradio.com">
                <meta http-equiv="Content-Type" content="text/html;
                  charset=UTF-8">
                <p>On 26/02/20 4:53 am, Jacob Kroon wrote: </p>
                <blockquote type="cite">On 2/24/20 8:25 AM, Jacob Kroon
                  wrote: <br>
                  <blockquote type="cite">Hi Douglas, <br>
                    <br>
                    You updated a comment in reproducible_build.bbclass,
                    commit e7b891b76954c784f5a93bd0a1c91315673ce40d: <br>
                    <br>
                    <blockquote type="cite">-# Once the value of
                      SOURCE_DATE_EPOCH is determined, it is stored in
                      the recipe's ${SDE_FILE}. <br>
                      +# Once the value of SOURCE_DATE_EPOCH is
                      determined, it is stored in the recipe's SDE_FILE.
                      <br>
                      +# If none of these mechanisms are suitable,
                      replace the do_deploy_source_date_epoch task <br>
                      +# with recipe-specific functionality to write the
                      appropriate SOURCE_DATE_EPOCH into the SDE_FILE. <br>
                      +# <br>
                    </blockquote>
                    <br>
                    But I can't really get this to work. What did work
                    for me was to replace
                    "do_create_source_date_epoch_stamp()" in my recipe:
                    <br>
                    <br>
                    do_create_source_date_epoch_stamp() { <br>
                         mkdir -p ${SDE_DIR} <br>
                         date -d "1981-03-03" "+%s" &gt; ${SDE_FILE} <br>
                    } <br>
                    <br>
                    What is the intended way to achieve the thing I'm
                    trying to do here ? <br>
                    <br>
                  </blockquote>
                  <br>
                  FYI, JPEW has a proposed patch here <br>
                  <br>
                  <a class="moz-txt-link-freetext"
href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=d091d2aa53ea417f70c10f5ce89151820c3db9ce"
                    moz-do-not-send="true">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=d091d2aa53ea417f70c10f5ce89151820c3db9ce</a>
                  <br>
                  <br>
                  for allowing a recipe to just set SOURCE_DATE_EPOCH
                  directly. <br>
                  <br>
                  But maybe that currently is at odds with
                  SOURCE_DATE_EPOCH being in BB_HASHBASE_WHITELIST ? <br>
                  <br>
                  /Jacob <br>
                </blockquote>
                <p><br>
                </p>
                <p>On the surface of it, my comment appears to be just
                  wrong: It does make sense to replace
                  do_create_source_date_epoch_stamp() as you suggest.</p>
                <p>Joshua's proposed patch looks promising:</p>
                <ul>
                  <li>Should the new function not be called first, so
                    that it takes priority over the git, known files,
                    and youngest file functions? If someone has
                    explicitly set SOURCE_DATE_EPOCH, then they want it
                    to take priority.<br>
                  </li>
                </ul>
              </blockquote>
              <p>Having that be the first option makes sense. The only
                case in which that might not work, is if a recipe does
                something like:</p>
              <p> SOURCE_DATE_EPOCH =
                "${@my_awesome_sde_calculation(d)}"</p>
              <p>e.g. uses a function to get the SDE instead of setting
                to a fixed value, but that's probably going to be
                extremely rare.<br>
              </p>
              <p><br>
              </p>
              <blockquote type="cite"
                cite="mid:0319e121-7546-e456-50d6-4b224e87363f@taitradio.com">
                <ul>
                  <li> <br>
                  </li>
                  <li>As you observe, SOURCE_DATE_EPOCH would need to be
                    removed from BB_HASHBASE_WHITELIST. I'm not sure why
                    it was in the whitelist in the first place.<br>
                  </li>
                </ul>
              </blockquote>
              <p>I'm not sure why exactly it is whitelisted; I didn't
                write the original code that whitelisted it, but I've
                CC'd Juro in case he happens to remember.<br>
              </p>
            </blockquote>
            <p>After a discussion with Richard, we figured out why
              SOURCE_DATE_EPOCH has to be whitelisted. The value of the
              variable *must* be calculable at parse time before any
              task is ran, but in practice it's value is only available
              once the __source_date_epoch.txt file is present, which is
              after parsing. This causes the taskhash to be calculated
              differently during parsing and task execution which causes
              taskhash mismatch errors.</p>
          </blockquote>
          <p><br>
          </p>
          <p>True.</p>
          <p>What to do? Would it work to use a different
            non-whitelisted variable in the recipe, eg.
            SOURCE_DATE_EPOCH_FIXED?<br>
          </p>
        </blockquote>
        <p><br>
        </p>
        <p>Ya, that would work. You'd have to figure out how to get the
          variable to be included in each taskhash even though it's not
          directly referenced, but I'm sure that's possible.</p>
        <p><br>
        </p>
        <p>Another option that's at lot more "magic" would be something
          like this: <a class="moz-txt-link-freetext"
href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=2b524916cf35238ff3deea34017e8a4cd73926cd"
            moz-do-not-send="true">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=2b524916cf35238ff3deea34017e8a4cd73926cd</a>
          <br>
        </p>
        <p>That's really weird, and I'm not sure I like it, but worth a
          thought.<br>
        </p>
      </blockquote>
      <p>If it works, it's good. I like the fact that the user can just
        set SOURCE_DATE_EPOCH directly in their recipe.<br>
      </p>
      <p>How about ...</p>
      <blockquote>
        <p>BB_HASHBASE_WHITELIST += "${@'SOURCE_DATE_EPOCH' if not
          source_date_epoch_var(d) else ''}"</p>
      </blockquote>
    </blockquote>
    <p>Ya, that works. The only reason I chose "is None" was in case a
      user really wanted to do <br>
    </p>
    <p>  SOURCE_DATE_EPOCH = "0"<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------C44297D943B31F86253D950C--
