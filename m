Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7847250B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 15:01:02 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so640845ieb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 07:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=T5te9KNuorMNWfvVxYQM2HD29JJK+evgiQceYAh2EYo=;
	b=exWgPnFIStYN17kgJOFheAPIWJU3Yw3yXwIxuHv2xZEk3XntNx/j6dF9EgWNiQkq/q
	Suoo/oKE9bZlTSsIm0nQqHkImMCXgARUoo2OwtGs1q+Eo9KkxbOFQoNmFkjQUOk6l+Pd
	HtIqmuZ4cM7ffL0McOuE7+wMiREsxrI5KeP0JgNDSpMfiAYj10cGxUPLUgkZ96yRFkTL
	FiBMu4JBjLfGsPoQsOKPiNkn3Z7Gp5ur5RIAvTBRUPc/7lZU3uCWywa1ckTtpY5RDC7J
	ab48dbtEzBzWTUFIZnjY5tTTuIwtIB3USBpoQTxvLWSZUnDV3PrRaCoDh99ZhliptCaX
	udIA==
X-Gm-Message-State: ALoCoQnFz39S/9nfEiv72liwkb0PhzKYy9h+PjNEb8EijbKBr9NzdkuWCXeNegwhj69VMevqlbD0
X-Received: by 10.107.47.100 with SMTP id j97mr16261454ioo.32.1418137261127;
	Tue, 09 Dec 2014 07:01:01 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id cy6sm953845igc.21.2014.12.09.07.00.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 07:01:00 -0800 (PST)
Message-ID: <54870EA3.20802@linaro.org>
Date: Tue, 09 Dec 2014 10:00:51 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<54866CD7.1050102@linaro.org>
	<7839390.odV1UMkpj8@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <7839390.odV1UMkpj8@peggleto-mobl5.ger.corp.intel.com>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 09 Dec 2014 15:01:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

(oops! sorry for going off-list)


On 12/09/14 05:50, Paul Eggleton wrote:
> On Monday 08 December 2014 22:30:31 Trevor Woerner wrote:
>> This is really awesome stuff. I'm still playing around with it.
>>
>> My current HEAD is:
>>
>>     commit 6ea5f5368a88317ace198f44a47cf043bc9fb6e6
>>     Author: Paul Eggleton <paul.eggleton@linux.intel.com>
>>     Date:   Fri Dec 5 11:30:25 2014 +0000
>>
>>         devtool: use event filtering to disable events if available
>>
>> on your contrib/paule/devtool branch.
>>
>> If I do a "devtool add" without a "devtool create-workspace" it succeeds
>> but I get:
>>
>>     $ devtool add xannounce ~/devel/code/xannounce
>>     INFO: Creating workspace layer in
>>     INFO: Recipe recipes/xannounce/xannounce.bb has been automatically
>>     created; further editing may be required to make it fully functional
>>
>> and find the changes have been made in the current directory. If I do
>> the "devtool create-workspace" first, I get a "workspace" directory and
>> all the stuff put in there, which is nicer.
>>
>> If it doesn't fail due to a user running "devtool add" before "devtool
>> create-workspace" then I think it would be nice if the two results were
>> the same.
> Ah, oops - I've found the cause and fixed it on the branch. Thanks!

Awesome... *very* nice. It works great now.


>
>> Would it be possible to make the output of devtool be nice and colourful
>> like the output of bitbake?
> Good idea, this is now done on the branch as well. "devtool build" doesn't 
> support colour in the bitbake output, but that's because colour support in 
> bitbake is switched by whether the output is going to a TTY and stdout is 
> being redirected in this case. (I guess we could add a command line option for 
> that as I have with devtool/recipetool.)
>

If it's not too much trouble I would like to ask that colour/curses be
possible/enabled by default. Trying to find the error in all that output
is a "needle in a haystack"-like operation :-)

I wonder if all the

    NOTE: Running setscene task 31 of 33
    (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gcc-runtime_4.9.bb,
    do_populate_sysroot_setscene)
    NOTE: recipe gcc-runtime-4.9.1-r0: task
    do_populate_sysroot_setscene: Started
    NOTE: recipe gcc-runtime-4.9.1-r0: task
    do_populate_sysroot_setscene: Succeeded
    NOTE: Running setscene task 33 of 33
    (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gcc-cross_4.9.bb,
    do_populate_sysroot_setscene)
    NOTE: recipe gcc-cross-i586-4.9.1-r0: task
    do_populate_sysroot_setscene: Started
    NOTE: recipe gcc-cross-i586-4.9.1-r0: task
    do_populate_sysroot_setscene: Succeeded


Could be (should be) done as part of the "devtool
create-workspace"/"devtool add" operation?

