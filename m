Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 43FCC7252F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 18:58:14 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id x19so1157087ier.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 10:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+TPuLaftKo6Js+2YCUs0zPwtICMEPh2M7V5dEjpmw+0=;
	b=a73PiY0PLmjVuxQE1DL+7UM80jCi4jBO+ckxvFw/3izybNuOot0gRcnnKSUYZRKUgV
	imLVBaT5F3XaDgKkh9SiSp/aFToqDETkyubfHRInwG3Kzb6dOXDiDD7deZR/YjFevpOA
	jp7hVl6j2ZYqt0ZM578AddGqopd0NwWyqDrm4yaVR3q2CpLYJR8R1JAFPDw2Sw0n7Q4h
	CDAlr9G/GXsnpwg9YRb6YTV3F+20xn8SMElrGkEe4Tcj0aUhyd4215Vwcl5/BCukEtpA
	957hEb7Y58UkW8oOjOax+QRhno4A/jxduIcC1hN3z5CrTMx2N3euwFbJdgAzPpBhOidC
	Hvgg==
X-Gm-Message-State: ALoCoQnOyjkH8y1rzG8NHslOSar0cHMOaZOQkNpq5bIdnulapMMcww0Ovi4TGw1bSFz6sgrD+wQl
X-Received: by 10.50.131.225 with SMTP id op1mr21968688igb.4.1418151495601;
	Tue, 09 Dec 2014 10:58:15 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id la3sm1286837igb.0.2014.12.09.10.58.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 10:58:15 -0800 (PST)
Message-ID: <5487463A.3030103@linaro.org>
Date: Tue, 09 Dec 2014 13:58:02 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<6421374.i7zskq6Uby@peggleto-mobl5.ger.corp.intel.com>
	<54871799.9000707@linaro.org>
	<3650068.9i3ehsGpzV@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3650068.9i3ehsGpzV@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 09 Dec 2014 18:58:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/09/14 11:08, Paul Eggleton wrote:
> On Tuesday 09 December 2014 10:39:05 Trevor Woerner wrote:
>>
>> Okay. Maybe it'd be best to just revert to bitbake? IOW, does the
>> devtool tool need its own "build,deploy,..."?
> We did talk about this in a previous email, but just to clarify:
>
> "devtool build" isn't strictly required in this phase, I added it primarily to 
> support future usage in the SDK where the intention is to do everything 
> through the devtool command, although that is a usage model that isn't enabled 
> yet. However, it is a convenient shortcut for "bitbake -c install 
> <recipename>" (which is all you need to do for "devtool deploy" to be able to 
> work.)

True, we did talk about this before. All I'm saying is that the colour
feature of bitbake is really nice, useful, and helpful (to visually
parse output) and if we've lost colour because we've wrapped bitbake
with "devtool build" then we're taking a step backwards.

But I'll concede the point if the future usage in the SDK turns out to
be really helpful. All I'm saying at this point is I have no idea what
this future usage might be or what your ideas are for this step, and for
the time-being (i.e. without knowing or working with this SDK usage)
"devtool build" is a step backwards from "bitbake".

> "devtool deploy" is not related to do_deploy - it places files for the recipe 
> on a nominated target machine without having to worry about packaging; we have 
> no other equivalent for this at the moment. Perhaps it could have a different 
> name in case the naming overlap is confusing.

Ah yes, sorry I forgot... maybe something more explicit like
"deploy_to_target"? ;-)
push_to_target?
upload_to_target?

>
>>>> I wonder if all the
>>>>
>>>>     NOTE: Running setscene task 31 of 33
>>>>
>>>> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/
>>>> gc
>>>> c-runtime_4.9.bb, do_populate_sysroot_setscene)
>>>>
>>>>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>>>>     do_populate_sysroot_setscene: Started
>>>>     NOTE: recipe gcc-runtime-4.9.1-r0: task
>>>>     do_populate_sysroot_setscene: Succeeded
>>>>     NOTE: Running setscene task 33 of 33
>>>>
>>>> (/home/trevor/devel/yocto/build/poky/meta-poky/meta/recipes-devtools/gcc/
>>>> gc
>>>> c-cross_4.9.bb, do_populate_sysroot_setscene)
>>>>
>>>>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>>>>     do_populate_sysroot_setscene: Started
>>>>     NOTE: recipe gcc-cross-i586-4.9.1-r0: task
>>>>     do_populate_sysroot_setscene: Succeeded
>>>>
>>>> Could be (should be) done as part of the "devtool
>>>> create-workspace"/"devtool add" operation?
>>> If running devtool along side someone's existing build environment,
>>> wouldn't that be expected to be set up already? (All it does effectively
>>> is "bitbake recipename")
>> Here are my steps:
>> $ source meta-poky/oe-init-build-env build
>> $ bitbake core-image-x11
>> $ devtool add <myx11app>
>> $ devtool build <myx11app>
>>
>> at this point it does a bunch of these gcc-runtime tasks. So my first
>> thought is: "why is my build going off into left field and doing all
>> these other things when all I asked it to do is to build <myx11app>?".
>> I'm guessing these gcc-runtime tasks are required for something related
>> to devtool, and they only need to be run once. So maybe it would be best
>> if they were run as part of creating the workspace (either explicitly
>> with "devtool create-workspace" or implicitly with "devtool add")?
> Trying to make "devtool add" or "devtool modify" do this just doesn't feel 
> right to me. These operations are supposed to be quick, and if they end up 
> running actual build tasks, they won't be.
>
> My guess (with no other context) is that the reason you are seeing this is 
> that you're building from sstate, and when it builds core-image-x11 it doesn't 
> need some of the tasks that it then does need when it goes to build the 
> individual recipe. I'm not sure, but I would expect that most people would be 
> doing this from an existing build directory rather than starting with a new 
> one. Is there a reason you're creating a new build directory as part of the 
> steps above?

The reason I included the "oe-init-build-env build" step in my
instructions above is to emphasize the fact I'm starting from a
completely fresh build environment :-)


LICENSE
If the tool that creates the recipe can't find any explicit licensing
information, it leaves LICENCE blank. Would it be better, if there's no
explicit license, to set it to "CLOSED"? Otherwise the first build will
fail and the user will have to figure out what to do in order to get the
recipe to build.


code updates
Maybe my inexperience with externalsrc is showing through here (I've
never used it before), but as I play with this new feature, I'm testing
it by trying to include a very old project I wrote years ago. As luck
would have it, that project needs updates (it doesn't quite work as-is
in qemux86/core-image-x11). So here I am going through the cycle of
working on its source, and building new images. What I've noticed is
when I create the image I keep getting the same old sources used over
and over from when I first added this project "devtool add" (and it
doesn't matter whether I use bitbake or devtool to build it, it even
keeps using the old sources even when I perform commits in the sources
and even when I perform a "bitbake -c cleansstate <recipe>"!). The only
way I can move forward is to "devtool reset" and then "devtool add".

In my scenario I have a base image I have already built
(core-image-x11). Now I want to add one package to that image from
sources found on my local machine. I also want to go through the cycle
of editing those sources, building a new image, and runqemu'ing the new
image to test my changes. I can't seem to do that without knowing
devtool and/or bitbake magic. I either have to "devtool reset" or I have
to "bitbake -c clean core-image-x11" because just modifying the sources
doesn't cause the image to be regenerated.

I think at this point I should create a detailed doc explaining my
workflow (or maybe a screencast?) so you can see exactly what I'm doing
if the above doesn't make sense.

