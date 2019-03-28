Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6797F60272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:42:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t124so2715916wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EBiij6hg3pkwWMpTuBoSU3PIFlfvrJBuL7bfob7H0qA=;
	b=dLOYhmJjBiKNtaOjPQG2tMuzWfT+mVkzhr7yQ+fxjrX6UsiwbjepFJuTOBm4iOrF5t
	7mHxP8xViIJhguqEYf2CelXmpbpiVMH2USoRokmwfMltXYOn5QOwxsEzrmEhzh+vp6Cz
	QspfFr7U/8q3pKHlKmEBLxWYydHlUlmwOTGoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EBiij6hg3pkwWMpTuBoSU3PIFlfvrJBuL7bfob7H0qA=;
	b=bNGZtRulFQotRKIWgAygYyzP4Axg9isjq4CAcXboqRNwNrjfjyM/ap9yxxpNFGyQdN
	XqlCpt6EuCoCpV9I0VjBgFEf4Z7YmMHmQ+UqWQ1t6kQEaIA4heVDKwD/7Uu9gvkHz7cB
	k+Bx+6Sr7vSel78skPBkJo85Sob7XutE77cX6ej1upiqO6l6DHPTTna7kBWq8/h48jbK
	1d1fEkqNseBWyIWRAhfXSJU4aYuUDwxeHJrS/Uo8did8g9ZLxhb3B6b82OBm+x2wmjwy
	Mjoqw99Hp3De4LjwA9aBpmePfRLSVgX8BzJrI4hysSPL7uoscPvl4cahBw2ank90rvTD
	OqCQ==
X-Gm-Message-State: APjAAAV4J2fmIWf01wf2l86/CoZO4u30M8L/ZeaHXUj4LEYKJ/CI1ujC
	1SpLVaJZWjRHs9dRzrmTmHhbHw==
X-Google-Smtp-Source: APXvYqx0F4yjTuIf9/aRLRtx2pYSRy6xvyOjxKKBx58F7v4ruiZOA7HEt4mbrD6foMUkgHlwLwpFUw==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr20057975wmc.63.1553758974958; 
	Thu, 28 Mar 2019 00:42:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v184sm3865219wma.6.2019.03.28.00.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 00:42:54 -0700 (PDT)
Message-ID: <a1157af237b851841bd93b55465bedc08e9103c3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 07:42:52 +0000
In-Reply-To: <1553748873-50143-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1553748873-50143-1-git-send-email-ee.peng.yeoh@intel.com>
	<1553748873-50143-2-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] resulttool/merge: Merge files from folders and control add testseries
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
X-List-Received-Date: Thu, 28 Mar 2019 07:42:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

This patch isn't really in a form where it can be easily reviewed or
accepted. A given patch needs to do one specific thing, so for example
if you're renaming/refactoring a function that would belong in its own
patch. If you're changing functionality, that would also be best in its
own patch.

In the patch below you make various refactoring changes as well as
making functionality changes meaning its very hard to separate the real
functionality change from the rest of the "noise" of the renaming and
refactoring. This makes review extremely difficult.

I'm not even sure I agree with some of the renaming/refactoring, e.g.
make_directory_and_write_json_file is a horrible name for a function
and it only appears to be called once? There are probably other issues
but its really hard to tell.

Could you split up this series, ideally showing the functionality
change in its own patch please. I'm not promising it would all be
accepted but it would at least allow review and allow the changes to be
understood.

Cheers,

Richard

On Thu, 2019-03-28 at 12:54 +0800, Yeoh Ee Peng wrote:
> QA team execute extra testing that create multiple test result files,
> where these test result files need to be merged under various use
> cases.
> Furthermore, during results merging, user need control over the
> testseries configuration creation as this configuration has important
> implication to report and regression.
> 
> Current merge do not support merge results where both base and target
> are directory.
> 
> Traceback (most recent call last):
>   File "/home/poky/scripts/resulttool", line 93, in <module>
>     sys.exit(main())
>   File "/home/poky/scripts/resulttool", line 87, in main
>     ret = args.func(args, logger)
>   File "/home/poky/scripts/lib/resulttool/merge.py", line 22, in
> merge
>     resultutils.append_resultsdata(results, args.base_results,
> configmap=resultutils.store_map)
>   File "/home/poky/scripts/lib/resulttool/resultutils.py", line 47,
> in append_resultsdata
>     with open(f, "r") as filedata:
> IsADirectoryError: [Errno 21] Is a directory:
> '<path_to_base_results>'
> 
> This patches enable merge for both base and target as directory.
> Also, enable control the creation of testseries configuration.
> 
> Previously the append_resultsdata function only allow append
> the results data to the map_results data (where map_results data
> wrapped the results data with configuration map as the key).
> Initially, we tried to implement an extra function where it will
> enable append one map_results to another map_results data. But
> we abandoned this alternative as this new append function will be
> pretty much a duplicated function to the original append_resultsdata,
> and these will create two append functions which they might be both
> hard to maintain and confusing. Thus, we tried to refactor the
> append function to enable a single append function to be used
> in all the situation. Futhermore, since the map_results were
> only needed by report and regression, we pulled the instructions
> used to turn results data to map_results data to another function.
> Finally, we renamed the functions and arguments to clearly
> seperated the functions using results data from the one using
> map_results data.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> 


