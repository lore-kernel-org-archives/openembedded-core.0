Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 036CF6004D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 23:39:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so5134497wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 15:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ybS6EcSFGRcy9UXDXOzOZSJE/46JkQUHtJQJOG5KaQg=;
	b=bSoLtXrT1FB8YelQcPI3px9Zyp5VGChH/qWcla0XV4FEFe6IoLsab8EXsvQ/qm5d3x
	v/Y7/TiwkX57zkp88O//delyTWnMdUT6VWFGavpgeIFq6EVqlR9RQVf8orh3063Yc9Il
	Po5Cd8ddY7HosGxvTjcGrh+cuKLF9uzUXlnOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ybS6EcSFGRcy9UXDXOzOZSJE/46JkQUHtJQJOG5KaQg=;
	b=o2OtGH43RM0pK7jjqvS4M9oDzSMiwFJbfFTUxpc3YWm+zlMvzXvgkX0WR2yJBJWO58
	pIM2U/AKkbHla+FtvwKYONKbPgUiAFS6fNj8CXTp76kSgknojNSDZfWRvYnwHtS8lO88
	l3OtjwIxAvHrjgM0trrzSn31A326Z6npTeQdUDh4pWDAh5hbyBaRhowaqGGH1w9jD5Zb
	lIJAdSOww1U5LZIFIDU4Tr/Hl9tmpy6nA3IbDpcfQiIdHUIrB+QOCs4XU3kaopGQoOyl
	1GJy9ehPH1JQwPK/Y3DxYOoksbmJr1FyIOEYivEy9fsvzDevLiSnU3wCEqlaLQk+qrsv
	+gug==
X-Gm-Message-State: AJcUukcX9coP3ffh9krHFv7xt563bVXxcIHzvDKJED/cTqaOeUsvuRBi
	O/+Spl1VvGus1rayyc3k9VGOrg==
X-Google-Smtp-Source: ALg8bN44gSCR5fNG4ClP8OhVPaHGVLXvMtxWtDTZU+IdRDkJgn/NMywSJOgKBgZga6D1mzHeXoPyxw==
X-Received: by 2002:adf:ef50:: with SMTP id c16mr36135100wrp.198.1548977994399;
	Thu, 31 Jan 2019 15:39:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f130sm475984wme.41.2019.01.31.15.39.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 31 Jan 2019 15:39:53 -0800 (PST)
Message-ID: <19906ffeb347386b4b1ffbb66105dd98c97f0732.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jan 2019 23:39:52 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04348172764@PGSMSX109.gar.corp.intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
	<1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
	<700a4fa3049746740929c83f6a61bdd5180404c3.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04348170F12@PGSMSX109.gar.corp.intel.com>
	<2e5c9d2f2ab6da1386bb73e7099371779422dec4.camel@linuxfoundation.org>
	<E0805CCB83E6104E80E61FD34E5788AE55DD30DC@PGSMSX110.gar.corp.intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04348172764@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 1/2 v5] resultstool: enable merge, store, report and regression analysis
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
X-List-Received-Date: Thu, 31 Jan 2019 23:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-31 at 05:23 +0000, Yeoh, Ee Peng wrote:
> Hi RP,
> 
> I looked into ptest and regression. The existing "resultstool
> regression" can be used to perform regression on ptest, since the
> testresults.json capture ptest status. I had executed regression
> script for the below 2 ptest testresults.json. Attached was the
> regression report for ptest. 
> 
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M2.rc1/testresults/qemux86-64-ptest/testresults.json
> https://autobuilder.yocto.io/pub/releases/yocto-2.7_M1.rc1/testresults/qemux86-64-ptest/testresults.json
> 
> The only challenges now was since ptest result set was relatively
> large, it was taking some time for computing the regression. Also
> there was this "ptestresult.rawlogs" testcase that does not contain
> status but the large rawlog. 
> 
> I did an experiment where I run the regression on testresults.json
> with and without the ptest rawlog. It shows the time taken for
> regression was significantly larger when it contain the rawlog. I
> will try to improve the regression time by throw away the rawlog at
> runtime when perform computing. 
> testresults.json with rawlog
> Regression start time: 20190131122805
> Regression end time:   20190131124425
> Time taken: 16 mins 20 sec
> 
> testresults.json without rawlog
> Regression start time: 20190131124512
> Regression end time:   20190131124529
> Time taken: 17 sec

Analysing the rawlog makes no sense so the tool needs to simply ignore
that. 16 minutes is far too long! 

I've just merged some changes which mean there are probably some other
sections it will need to ignore now too since the logs are now being
split out per ptest (section). I've left rawlogs in as its useful for
debugging but once the section splits are working we could remove it.

This adds in timing data so we know how long each ptest took to run (in
seconds), it also adds in exit code and timeout data. These all
complicate the regression analysis but the fact that lttng has been
timing out (for example) has been overlooked until now and shows we
need to analyse these things.

I'm considering whether we should have a command in resulttool which
takes json data and writes it out in a "filesystem" form.

The code in logparser.py already has a rudimentary version of this for
ptest data. It could be extended to write out a X.log for each ptest
based on the split out data and maybe duration and timeout information
in some form too.

The idea behind flat filesystem representations of the data is that a
user can more easily explore or compare them, they also show up well in
git.

Its also worth thinking about how we'll end up using this. testresult
will get called at the end of builds (particularly) release builds and
we'll want it to generate a QA report for the automated test data. The
autobuilder will likely put an http link in the "release build ready"
email to an html like report stored alongside the testresults json
files.

I'm still trying to figure out how to make this all fit together and
allow automated comparisons but the build performance data would also
fit into this (and already has html reports).

Cheers,

Richard


