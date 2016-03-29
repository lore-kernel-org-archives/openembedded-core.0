Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 074A96057B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 12:25:34 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id n34so1885501qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=7DQfJMKIWSkMQjiGKCtaCHc1qS1kOjDuWydlrFJF5No=;
	b=kOj0IA41lA1uVPVPJ9IbTu7RuDHfFUAKHfTzhyE3KO6CLmpJblCB/noqNHVdqSc/dA
	aIX4+HWhxAHIIM1UEV28Twg4CdF+NdxzhSsxYyZDo5a9CaEcUooKt3ej3ZnmaBoO4aKd
	sFcphCALdL46VzrKa0KkEL5nGlayM0iOBcyGOdlsbI/Pxej5Pw1T6v1ifVyjNAx2PrU8
	9cDJIQniluhAOpig7vk5hFVXHdbawK4zFTWAWXG5p+9InR+FXofI+CmuMjITQydBeQcG
	N2CUfAxEiVizNQ0Tx9ShrFpVK1MwuQB0P3RCwq1eBIm+xADsyEVZURlbnsBg9Q7BPQ3j
	Zpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7DQfJMKIWSkMQjiGKCtaCHc1qS1kOjDuWydlrFJF5No=;
	b=C9blK1ci5Wk2UNfVg8vGP3kdiCz09wB9mjScxlbVxKpWCvP+Qfn4Kni5Av+9cRWtv1
	8k9CdYfdFEFUR0Ir89Xi8SpkafryMSPQBvldzToAHWbvrKiPFktnhtSDe9rav5AnXqTd
	eyr8LWwdTv7++kgOcEeRhORm8WJN0fzay0Lc9eG4rIMfjv67ABXRvVVhIvEixh1hWyeg
	EcPjCzlZlyUmPdPUE89VgCVPN5iY128CuPLMOyLmh8VesZF5Uhbq5eawZfy/EuEZRBHx
	NKGJUzRvG/RhEY+E3iMf5e404UJ6D2aLLaSULqgWkREM0kGazFaZmn3ubgAW4JCPpZR0
	947A==
X-Gm-Message-State: AD7BkJLhdyRZ5IZ9MyHa05ZOpCI/aYsirCLZ3IphpVjUYTDHWXUrklqRct5PHt3WBFneTw==
X-Received: by 10.140.44.8 with SMTP id f8mr2251763qga.42.1459254335009;
	Tue, 29 Mar 2016 05:25:35 -0700 (PDT)
Received: from [192.168.1.139] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	c190sm13841951qkb.27.2016.03.29.05.25.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2016 05:25:33 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <56F59D2B.2010108@gmail.com>
	<1458978069.3073.62.camel@linuxfoundation.org>
	<56F98CDF.7080205@gmail.com>
	<1459204121.21672.12.camel@linuxfoundation.org>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <56FA743B.5030200@gmail.com>
Date: Tue, 29 Mar 2016 08:25:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459204121.21672.12.camel@linuxfoundation.org>
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Tue, 29 Mar 2016 12:25:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/28/2016 06:28 PM, Richard Purdie wrote:
>> We typically set up our projects to use git submodules, such that the
>> top level
>> calls out a set of submodules which are the actively developed
>> applications and
>> other bits in the system.  These submodules are externalsrc trees for
>> bitbake,
>> and include a bitbake recipe (bitbake recipe is embedded directly in
>> source
>> code).  Sometimes these submodules/externalsrc trees track branches
>> (typically
>> release-xyz, or develop-xyz), but almost never master.  Sometimes
>> they may be at
>> a tagged version that is not at the HEAD of a branch.  In the end, I
>> want to be
>> able to build exactly what is in the externalsrc directory, and
>> accurately
>> include the git version in the PV.  Branches/tags may change at any
>> time and I
>> don't want to have to edit the recipe every time this happens.
>>
>> Repo might be used in a similar fashion to manage a tree of
>> components that get
>> built.  What we are trying to avoid is having to edit the git version
>> in the
>> recipes to lock down versions for a set of components for a build --
>> git
>> submodules or repo work much better for doing this.
>>
>> I tried nobranch=1;rev=HEAD, but then that conflicts with ${AUTOREV}.
> Did you just try nobranch=1 and leave rev to get set from SRCREV?

That will parse, but it puts the wrong git rev in the PV:

The following package gets built:

blkqcl-app-tune_1.4+gitr1+a97fcb58e6-r1.0_cortexa9hf-vfp-neon.ipk

But, the actual version of the source that gets built is
0edb656fc9a1a77d75eaa49a17586deb4c986bb1.

a97... is the version of the branch (default is master) in the workspace.

So this would work if we did not care what gitv got put in the PV.  There is
also the issue of bitbake not rebuilding the source if you change the git
version of the workspace, but the branch happens to not change.

Does no one else use externalsrc with Git?

Thanks,
Cliff


