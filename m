Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8083061882
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 21:49:32 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id x1so1165585iop.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=IwCAzKyM72KCYTORewaSWsmJ5YwOKPCvaqcCgk1Frq8=;
	b=vZB6C9gFUITnPJSabBYQ9pZsx9wmlUgPOoZH6e8GgQ8ggV5zctCIyw+PosyyFvf2rD
	X0Ww5uLarRKm6RYugx+kdr5VjnAakYAt+r8zT14E6lq2KTeoqioMmCL+PXxtsPcI+KuF
	I2WtvLg2uvCjlYAbpsCgnxuc4kx1RJete5lMhhhHCpEvvY/ypMee2bKefYyAOfj/GMIA
	qoad5z+/GUCch1Im7ton2ICmDe/DHN0+dJSlIikOiGABIg4rTNj4ZPo2brO5j3RD6fKc
	7ZGFtXsAQwdWld92gbOB6nFaSXuOhabB5bFkmQ1TS6LXWd8ZS8exScbjW7GIREVy5Q+c
	So3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=IwCAzKyM72KCYTORewaSWsmJ5YwOKPCvaqcCgk1Frq8=;
	b=JuFyNO+0YWygmOmKuwyp3sXb5Yq3bQXQmUnEGHfBdDvsbBNaod2eFI6syyEtx6NqRU
	ULutzRgvDeaqFf12TZoeyZXUqc22qaFMkewhV8T/xNB4i/vDbju7thzZew6J69vASKAC
	eooPm6FIeXpZ5NTHLd2fI4zFbyqKYg/WXc3RLOG8VjTw56+oTEsT6jJG4YsMP7ZE++QL
	KMpajsbootfrXkAozBsU1VttvXIiq7HZJ8FlmaqZDVOtIGuA8UotrwPFDd27jf4+LxLe
	6SywcJtgo0Q+1EpH16sPYzJ5Dzr8UlXvcEIvbVocj2Dah+aAB+SNZzP5xAr0stY48eeF
	Ljxw==
X-Gm-Message-State: APjAAAUqiP6jB36wlHM7ntfPySKY85anH5Bhx6gWlJaFEj7skm5UDBd0
	Ms20YL4zzylCF4/RiaypOvA3yv1DirU=
X-Google-Smtp-Source: APXvYqwaPg98VxraBI5PGlMeosoGlqUccd6VAd4ZA7Dtjhc9pBPASxuDU70atHqoaLove/CZt/SRcQ==
X-Received: by 2002:a5d:840a:: with SMTP id i10mr1125632ion.225.1582840172799; 
	Thu, 27 Feb 2020 13:49:32 -0800 (PST)
Received: from [10.30.196.58] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b12sm2331912iln.62.2020.02.27.13.49.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 13:49:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
	<0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
	<cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com>
	<e2a17625-3a90-6482-5af3-61a82ac04dcc@gmail.com>
	<baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com>
Message-ID: <79e170f8-e6ae-f87b-70ea-f67fb870a28b@gmail.com>
Date: Thu, 27 Feb 2020 15:49:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com>
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
X-List-Received-Date: Thu, 27 Feb 2020 21:49:32 -0000
Content-Type: multipart/alternative;
	boundary="------------B6FE93FF09BB8C9127DB8072"
Content-Language: en-US

--------------B6FE93FF09BB8C9127DB8072
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/27/20 3:22 PM, Douglas Royds wrote:
>
> On 28/02/20 5:45 am, Joshua Watt wrote:
>
>> On 2/27/20 9:01 AM, Joshua Watt wrote:
>>> On 2/26/20 11:46 PM, Douglas Royds wrote:
>>>>
>>>> On 26/02/20 4:53 am, Jacob Kroon wrote:
>>>>
>>>>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>>>>> Hi Douglas,
>>>>>>
>>>>>> You updated a comment in reproducible_build.bbclass, commit 
>>>>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>>>>
>>>>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>> stored in the recipe's ${SDE_FILE}.
>>>>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is 
>>>>>>> stored in the recipe's SDE_FILE.
>>>>>>> +# If none of these mechanisms are suitable, replace the 
>>>>>>> do_deploy_source_date_epoch task
>>>>>>> +# with recipe-specific functionality to write the appropriate 
>>>>>>> SOURCE_DATE_EPOCH into the SDE_FILE.
>>>>>>> +#
>>>>>>
>>>>>> But I can't really get this to work. What did work for me was to 
>>>>>> replace "do_create_source_date_epoch_stamp()" in my recipe:
>>>>>>
>>>>>> do_create_source_date_epoch_stamp() {
>>>>>>      mkdir -p ${SDE_DIR}
>>>>>>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>>>>> }
>>>>>>
>>>>>> What is the intended way to achieve the thing I'm trying to do 
>>>>>> here ?
>>>>>>
>>>>>
>>>>> FYI, JPEW has a proposed patch here
>>>>>
>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce 
>>>>>
>>>>>
>>>>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>>>>
>>>>> But maybe that currently is at odds with SOURCE_DATE_EPOCH being 
>>>>> in BB_HASHBASE_WHITELIST ?
>>>>>
>>>>> /Jacob
>>>>
>>>>
>>>> On the surface of it, my comment appears to be just wrong: It does 
>>>> make sense to replace do_create_source_date_epoch_stamp() as you 
>>>> suggest.
>>>>
>>>> Joshua's proposed patch looks promising:
>>>>
>>>>   * Should the new function not be called first, so that it takes
>>>>     priority over the git, known files, and youngest file
>>>>     functions? If someone has explicitly set SOURCE_DATE_EPOCH,
>>>>     then they want it to take priority.
>>>>
>>> Having that be the first option makes sense. The only case in which 
>>> that might not work, is if a recipe does something like:
>>>
>>>  SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"
>>>
>>> e.g. uses a function to get the SDE instead of setting to a fixed 
>>> value, but that's probably going to be extremely rare.
>>>
>>>
>>>>  *
>>>>
>>>>
>>>>
>>>>   * As you observe, SOURCE_DATE_EPOCH would need to be removed from
>>>>     BB_HASHBASE_WHITELIST. I'm not sure why it was in the whitelist
>>>>     in the first place.
>>>>
>>> I'm not sure why exactly it is whitelisted; I didn't write the 
>>> original code that whitelisted it, but I've CC'd Juro in case he 
>>> happens to remember.
>>>
>> After a discussion with Richard, we figured out why SOURCE_DATE_EPOCH 
>> has to be whitelisted. The value of the variable *must* be calculable 
>> at parse time before any task is ran, but in practice it's value is 
>> only available once the __source_date_epoch.txt file is present, 
>> which is after parsing. This causes the taskhash to be calculated 
>> differently during parsing and task execution which causes taskhash 
>> mismatch errors.
>>
>
> True.
>
> What to do? Would it work to use a different non-whitelisted variable 
> in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?
>

Ya, that would work. You'd have to figure out how to get the variable to 
be included in each taskhash even though it's not directly referenced, 
but I'm sure that's possible.


Another option that's at lot more "magic" would be something like this: 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=2b524916cf35238ff3deea34017e8a4cd73926cd 


That's really weird, and I'm not sure I like it, but worth a thought.



--------------B6FE93FF09BB8C9127DB8072
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/27/20 3:22 PM, Douglas Royds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                  SOURCE_DATE_EPOCH is determined, it is stored in the
                  recipe's ${SDE_FILE}. <br>
                  +# Once the value of SOURCE_DATE_EPOCH is determined,
                  it is stored in the recipe's SDE_FILE. <br>
                  +# If none of these mechanisms are suitable, replace
                  the do_deploy_source_date_epoch task <br>
                  +# with recipe-specific functionality to write the
                  appropriate SOURCE_DATE_EPOCH into the SDE_FILE. <br>
                  +# <br>
                </blockquote>
                <br>
                But I can't really get this to work. What did work for
                me was to replace "do_create_source_date_epoch_stamp()"
                in my recipe: <br>
                <br>
                do_create_source_date_epoch_stamp() { <br>
                     mkdir -p ${SDE_DIR} <br>
                     date -d "1981-03-03" "+%s" &gt; ${SDE_FILE} <br>
                } <br>
                <br>
                What is the intended way to achieve the thing I'm trying
                to do here ? <br>
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
              But maybe that currently is at odds with SOURCE_DATE_EPOCH
              being in BB_HASHBASE_WHITELIST ? <br>
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
              <li>Should the new function not be called first, so that
                it takes priority over the git, known files, and
                youngest file functions? If someone has explicitly set
                SOURCE_DATE_EPOCH, then they want it to take priority.<br>
              </li>
            </ul>
          </blockquote>
          <p>Having that be the first option makes sense. The only case
            in which that might not work, is if a recipe does something
            like:</p>
          <p> SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"</p>
          <p>e.g. uses a function to get the SDE instead of setting to a
            fixed value, but that's probably going to be extremely rare.<br>
          </p>
          <p><br>
          </p>
          <blockquote type="cite"
            cite="mid:0319e121-7546-e456-50d6-4b224e87363f@taitradio.com">
            <ul>
              <li> <br>
              </li>
              <li>As you observe, SOURCE_DATE_EPOCH would need to be
                removed from BB_HASHBASE_WHITELIST. I'm not sure why it
                was in the whitelist in the first place.<br>
              </li>
            </ul>
          </blockquote>
          <p>I'm not sure why exactly it is whitelisted; I didn't write
            the original code that whitelisted it, but I've CC'd Juro in
            case he happens to remember.<br>
          </p>
        </blockquote>
        <p>After a discussion with Richard, we figured out why
          SOURCE_DATE_EPOCH has to be whitelisted. The value of the
          variable *must* be calculable at parse time before any task is
          ran, but in practice it's value is only available once the
          __source_date_epoch.txt file is present, which is after
          parsing. This causes the taskhash to be calculated differently
          during parsing and task execution which causes taskhash
          mismatch errors.</p>
      </blockquote>
      <p><br>
      </p>
      <p>True.</p>
      <p>What to do? Would it work to use a different non-whitelisted
        variable in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Ya, that would work. You'd have to figure out how to get the
      variable to be included in each taskhash even though it's not
      directly referenced, but I'm sure that's possible.</p>
    <p><br>
    </p>
    <p>Another option that's at lot more "magic" would be something like
      this:
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=2b524916cf35238ff3deea34017e8a4cd73926cd">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&amp;id=2b524916cf35238ff3deea34017e8a4cd73926cd</a>
      <br>
    </p>
    <p>That's really weird, and I'm not sure I like it, but worth a
      thought.<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------B6FE93FF09BB8C9127DB8072--
