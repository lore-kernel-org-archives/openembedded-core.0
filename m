Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id A0CFF605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:01:13 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id x7so2648488ilq.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=7KT4tKgL20pFCJ2TMSzdAuMsf16La+tm6RVev4G5S1o=;
	b=b2mSqZD3Xp0cXiBDhu7FaQ+KfrJnGPoyP9xIYMGRs8k4a5fzS7uT6/wEqQBbC9asxv
	qp6VRlOhop8zZVjxdbLe5vyX2NNP5gX1Hp3tgjgTIxAs2tFPj40vrUDkfobpdeFgV3d5
	Rs/yiQOQzg4E+Sxie6j93rXyI4uZtibStxFUpVy71BP7OYgsgFc2WF3GpSIzi5LB7sSv
	b2A0bKrzXcCIzdG0ZNBvP5SvHHfBggFFuCxv+wryXTRPhyrIEKPIvhFD6U9Hrkdd9dxo
	zEGVQYtc4Anxt88sGJy9eq30JmS+ufI0/FFJOOhgBo+tLI0RW53w4tPlfcoqlwL1B+wF
	cudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=7KT4tKgL20pFCJ2TMSzdAuMsf16La+tm6RVev4G5S1o=;
	b=lcEClqlLweJp3yVEM1f8iuhuK0WvFfWSLnbYK9aPmVWiGeIULlGxI706jyrw1GJEkc
	m8u3tcrnj3jyweMgIemVPT3vZ4LaZpfHhMV2QKeCB/aTwVVgQ7U7mRpE20PQjlLUHjfc
	Fyz5kXPLp+19ib5/DdM5VfYhV/6+SbrAnaXsCF6IoAWrB98mOED/4x7CaBOrrtuY3l2N
	L4jgKTZMU+kQAw8xFtAek4iN9WCSoi7REc2Jb/6QnSoiBEqPzXhrDlCdaukbDqIl2WTX
	GFBc1XpzOKDDTU5rvbMVKFcKmTJNH48pErhhygumgFkeg7G0baYV4dKeNQS2wxTqL11K
	93zw==
X-Gm-Message-State: APjAAAVuZ+J7S9r7XrEy6aMtwx0iNpo9Qjdr5SprPfWwWujvoB7pEnuF
	UpCzRdXuRQrbvTjWXvGGoqhRUmgjzL0=
X-Google-Smtp-Source: APXvYqzsy9WvOUUYqR5bQDnUpHbla0HBtlrP2KRe5w/xGpYiwPRJ9gkhPWQp2p7EfIAvwHha6qdIGw==
X-Received: by 2002:a92:1b55:: with SMTP id b82mr6526177ilb.104.1582815674304; 
	Thu, 27 Feb 2020 07:01:14 -0800 (PST)
Received: from [10.30.196.58] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j26sm1432310ioj.69.2020.02.27.07.01.13
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 07:01:13 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>,
	Jacob Kroon <jacob.kroon@gmail.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
	<0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
Message-ID: <cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com>
Date: Thu, 27 Feb 2020 09:01:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
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
X-List-Received-Date: Thu, 27 Feb 2020 15:01:13 -0000
Content-Type: multipart/alternative;
	boundary="------------461BF172506E6865DB27FAF8"
Content-Language: en-US

--------------461BF172506E6865DB27FAF8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/26/20 11:46 PM, Douglas Royds wrote:
>
> On 26/02/20 4:53 am, Jacob Kroon wrote:
>
>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>> Hi Douglas,
>>>
>>> You updated a comment in reproducible_build.bbclass, commit 
>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>
>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is stored 
>>>> in the recipe's ${SDE_FILE}.
>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is stored 
>>>> in the recipe's SDE_FILE.
>>>> +# If none of these mechanisms are suitable, replace the 
>>>> do_deploy_source_date_epoch task
>>>> +# with recipe-specific functionality to write the appropriate 
>>>> SOURCE_DATE_EPOCH into the SDE_FILE.
>>>> +#
>>>
>>> But I can't really get this to work. What did work for me was to 
>>> replace "do_create_source_date_epoch_stamp()" in my recipe:
>>>
>>> do_create_source_date_epoch_stamp() {
>>>      mkdir -p ${SDE_DIR}
>>>      date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>> }
>>>
>>> What is the intended way to achieve the thing I'm trying to do here ?
>>>
>>
>> FYI, JPEW has a proposed patch here
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/reproducible&id=d091d2aa53ea417f70c10f5ce89151820c3db9ce 
>>
>>
>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>
>> But maybe that currently is at odds with SOURCE_DATE_EPOCH being in 
>> BB_HASHBASE_WHITELIST ?
>>
>> /Jacob
>
>
> On the surface of it, my comment appears to be just wrong: It does 
> make sense to replace do_create_source_date_epoch_stamp() as you suggest.
>
> Joshua's proposed patch looks promising:
>
>   * Should the new function not be called first, so that it takes
>     priority over the git, known files, and youngest file functions?
>     If someone has explicitly set SOURCE_DATE_EPOCH, then they want it
>     to take priority.
>
Having that be the first option makes sense. The only case in which that 
might not work, is if a recipe does something like:

  SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"

e.g. uses a function to get the SDE instead of setting to a fixed value, 
but that's probably going to be extremely rare.


>  *
>
>
>
>   * As you observe, SOURCE_DATE_EPOCH would need to be removed from
>     BB_HASHBASE_WHITELIST. I'm not sure why it was in the whitelist in
>     the first place.
>
I'm not sure why exactly it is whitelisted; I didn't write the original 
code that whitelisted it, but I've CC'd Juro in case he happens to remember.



--------------461BF172506E6865DB27FAF8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/26/20 11:46 PM, Douglas Royds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0319e121-7546-e456-50d6-4b224e87363f@taitradio.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>On 26/02/20 4:53 am, Jacob Kroon wrote: </p>
      <blockquote type="cite">On 2/24/20 8:25 AM, Jacob Kroon wrote: <br>
        <blockquote type="cite">Hi Douglas, <br>
          <br>
          You updated a comment in reproducible_build.bbclass, commit
          e7b891b76954c784f5a93bd0a1c91315673ce40d: <br>
          <br>
          <blockquote type="cite">-# Once the value of SOURCE_DATE_EPOCH
            is determined, it is stored in the recipe's ${SDE_FILE}. <br>
            +# Once the value of SOURCE_DATE_EPOCH is determined, it is
            stored in the recipe's SDE_FILE. <br>
            +# If none of these mechanisms are suitable, replace the
            do_deploy_source_date_epoch task <br>
            +# with recipe-specific functionality to write the
            appropriate SOURCE_DATE_EPOCH into the SDE_FILE. <br>
            +# <br>
          </blockquote>
          <br>
          But I can't really get this to work. What did work for me was
          to replace "do_create_source_date_epoch_stamp()" in my recipe:
          <br>
          <br>
          do_create_source_date_epoch_stamp() { <br>
               mkdir -p ${SDE_DIR} <br>
               date -d "1981-03-03" "+%s" &gt; ${SDE_FILE} <br>
          } <br>
          <br>
          What is the intended way to achieve the thing I'm trying to do
          here ? <br>
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
        for allowing a recipe to just set SOURCE_DATE_EPOCH directly. <br>
        <br>
        But maybe that currently is at odds with SOURCE_DATE_EPOCH being
        in BB_HASHBASE_WHITELIST ? <br>
        <br>
        /Jacob <br>
      </blockquote>
      <p><br>
      </p>
      <p>On the surface of it, my comment appears to be just wrong: It
        does make sense to replace do_create_source_date_epoch_stamp()
        as you suggest.</p>
      <p>Joshua's proposed patch looks promising:</p>
      <ul>
        <li>Should the new function not be called first, so that it
          takes priority over the git, known files, and youngest file
          functions? If someone has explicitly set SOURCE_DATE_EPOCH,
          then they want it to take priority.<br>
        </li>
      </ul>
    </blockquote>
    <p>Having that be the first option makes sense. The only case in
      which that might not work, is if a recipe does something like:</p>
    <p> SOURCE_DATE_EPOCH = "${@my_awesome_sde_calculation(d)}"</p>
    <p>e.g. uses a function to get the SDE instead of setting to a fixed
      value, but that's probably going to be extremely rare.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0319e121-7546-e456-50d6-4b224e87363f@taitradio.com">
      <ul>
        <li> <br>
        </li>
        <li>As you observe, SOURCE_DATE_EPOCH would need to be removed
          from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
          whitelist in the first place.<br>
        </li>
      </ul>
    </blockquote>
    <p>I'm not sure why exactly it is whitelisted; I didn't write the
      original code that whitelisted it, but I've CC'd Juro in case he
      happens to remember.<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------461BF172506E6865DB27FAF8--
