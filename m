Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 640CF766E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:52:57 +0000 (UTC)
Received: by iodb91 with SMTP id b91so40018693iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 19:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jmDSOyBQFxF+spKite7lxvLeeUtvTCSvQlxhdCu+Emk=;
	b=Cd8vcwFeKr8goUF1zFnvOxkqffFPgC3tOBLjlNanaz62G+ypJ899AqlikhUKM2H+ry
	lvawCZF+QkXKo4ZhA6Bbwbx0PqWbpx72CI/UCb9oPI+HhmWZi2hwp+uEFo5muZygKVFw
	8WfGdMmpt7D+p8Pvm8dtMHsO795gXA0bLPS3NlLimoI7CoShQCjf9540DulwtmUFZs1Q
	5zNMy0PqF1i02ZyzLM18msyymxoGfVdAg+QyRSbQeHONFVGve8/XOtIRibDZa6b92Qkk
	Uwy+dqpqe4W8ljlPLnInzBLkDvzn11xxJQ50gmKuVneWrYSelWbZiMyJzJt43I9gunZi
	Myrw==
X-Received: by 10.107.168.145 with SMTP id e17mr5635661ioj.112.1438915977902; 
	Thu, 06 Aug 2015 19:52:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 19:52:28 -0700 (PDT)
In-Reply-To: <13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<55C32503.3050800@linux.intel.com>
	<13325469.N9zhAzKaIU@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 19:52:28 -0700
Message-ID: <CAMKF1sqKKzPt2z8s8f_3RwH4Zp32HjyXePy0UYTbrqTCuiwdNg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Fri, 07 Aug 2015 02:52:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
>> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
>> > Added new patch that fixes the memory leak that was introduced in
>> > mkdosfs-dir.patch.
>>
>> You should update the original patch then, not pile additional patches
>> on top. The least painful way is:
>>
>> 1) unpack the sources (manually from tarball, or using bitbake -c unpack)
>> 2) 'git init; git add *; git commit' to create an git repository from
>> the sources
>> 3) apply the patch that needs fixing, then do the fix
>> 4) make a git commit, then produce a patch using git format-patch, then
>> move the new patch back to the recipe directory and update the recipe
>> 5) build the recipe to make sure it still builds
>> 6) make a git commit with the recipe update, and submit it here :)
>
> On the contrary - the much less painful way (as of fido) is to use devtool:
>
> 1) Extract source and set the build system up to use it:
>    devtool modify dosfstools -x ~/projects/dosfstools
>
> 2) Make whatever changes you want to in the git tree that has been set up in
> the specified path
>
> 3) Build the recipe (as you would normally) to make sure it still builds
>
> 4) Write the modified/added commits as patches back to the recipe:
>     devtool update-recipe dosfstools
>
> 5) Make a git commit with the recipe update, and submit it here :)
>
> I'd really like people to start using devtool for this kind of thing. If it's
> not working for some reason please do let me know.
>

This assumes either we use OE-Core or poky, I dont get it to work with
angstrom out of box
what am I missing

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

