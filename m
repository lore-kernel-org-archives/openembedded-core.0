Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id CFFE372425
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 15:39:14 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id l13so5028325iga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 07:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7nJa2HmfKI/I6OH+RpmrYYRbrTQlfjd7TFxs6Ejym6w=;
	b=cp4oCBfpqg/sauW6KBkspmr3c1Nqhp5t5I9jktEpVgTwkKb7LR7mDLhce6meTBkV1N
	WkvqNSrpQ9FbRWC/AIIr69an/KgMEZ4CwhlNWTMWZjniQE9WqZAm1s7AJvNh8L72tnd6
	Hycb0xzuBEBHvy3y4SSgdiMShxy8RLVQbKZYI7JcBKDGxAcz4aB3rWXLbGZ7a4xP6R7E
	qLI4qMkiKusHQT+63bNk/DoCEixRVHA9USywpidOkfKVf1wCS+0Zvf5VwT3iACC4u5P9
	u/Rvuo+chvm1j9tTMTCdWlkmIupmHKlgMGael32iW2WcoLL9r8+c+Vx6t4g73Ig/nNsW
	RddA==
X-Gm-Message-State: ALoCoQnWOuOfqCJovcwDZTUDbuG4LumrTXnooBe5wHCrH4441HzmvSZKqGt9sbjjiqSLcqBieNZC
X-Received: by 10.51.17.2 with SMTP id ga2mr2921143igd.39.1418139554634;
	Tue, 09 Dec 2014 07:39:14 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id z71sm694452iod.23.2014.12.09.07.39.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 07:39:13 -0800 (PST)
Message-ID: <54871799.9000707@linaro.org>
Date: Tue, 09 Dec 2014 10:39:05 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<7839390.odV1UMkpj8@peggleto-mobl5.ger.corp.intel.com>
	<54870EA3.20802@linaro.org>
	<6421374.i7zskq6Uby@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <6421374.i7zskq6Uby@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 Dec 2014 15:39:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/09/14 10:10, Paul Eggleton wrote:
> On Tuesday 09 December 2014 10:00:51 Trevor Woerner wrote:
>> Would it be possible to make the output of devtool be nice and colourful
>> like the output of bitbake?
>>> Good idea, this is now done on the branch as well. "devtool build" doesn't
>>> support colour in the bitbake output, but that's because colour support in
>>> bitbake is switched by whether the output is going to a TTY and stdout is
>>> being redirected in this case. (I guess we could add a command line option
>>> for that as I have with devtool/recipetool.)
>> If it's not too much trouble I would like to ask that colour/curses be
>> possible/enabled by default. Trying to find the error in all that output
>> is a "needle in a haystack"-like operation :-)
> I don't think this is straightforward unfortunately. I'll have to look into 
> it.

Okay. Maybe it'd be best to just revert to bitbake? IOW, does the
devtool tool need its own "build,deploy,..."?


>
>> I wonder if all the
>>
>>     NOTE: Running setscene task 31 of 33
>>    
>> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gc
>> c-runtime_4.9.bb, do_populate_sysroot_setscene)
>>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>>     do_populate_sysroot_setscene: Started
>>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>>     do_populate_sysroot_setscene: Succeeded
>>     NOTE: Running setscene task 33 of 33
>>    
>> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/gc
>> c-cross_4.9.bb, do_populate_sysroot_setscene)
>>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>>     do_populate_sysroot_setscene: Started
>>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>>     do_populate_sysroot_setscene: Succeeded
>>
>>
>> Could be (should be) done as part of the "devtool
>> create-workspace"/"devtool add" operation?
> If running devtool along side someone's existing build environment, wouldn't 
> that be expected to be set up already? (All it does effectively is "bitbake 
> recipename")
>

Here are my steps:
$ source meta-poky/oe-init-build-env build
$ bitbake core-image-x11
$ devtool add <myx11app>
$ devtool build <myx11app>

at this point it does a bunch of these gcc-runtime tasks. So my first
thought is: "why is my build going off into left field and doing all
these other things when all I asked it to do is to build <myx11app>?".
I'm guessing these gcc-runtime tasks are required for something related
to devtool, and they only need to be run once. So maybe it would be best
if they were run as part of creating the workspace (either explicitly
with "devtool create-workspace" or implicitly with "devtool add")?

