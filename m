Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id C6EC17C3A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 15:44:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v13so10771546wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 07:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=J24LPrqLVqgPoIPnluJK6hlJsKmEYZmGYq/EA46ifKM=;
	b=TYAq/bKYAhXfLhUqihlIWCzy/rWlhANtriJ/0X3QLI2ocuTCFYRYtaSFePWAvGxS0+
	DfXIWzl1P2zH00anZFNxEeIggiFkChrBaaVKVIgdKiBIRFDl3UbpmO3nQ8piaNyxaA8P
	TTf9l584yvmFC188v2Eyu0JtWTgWpcW3vnjW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J24LPrqLVqgPoIPnluJK6hlJsKmEYZmGYq/EA46ifKM=;
	b=i4rUhLxO2VmDbR7cjARManamUMi6tjilgc0ZUbYNxmy0qN+Sxy7ruU8fiyv6R0ZfvN
	LI//UcaNs+ukReBnLJV2Rkqb6U7Amwmz4l57KFWCLiENw3CQYuXMb2qETS+ZJsPNGPjT
	rDZEhfCHuiNLbRI2pl0yX+88wCdOhQjOVr9GSvi047gcyd7Eqo++xPzZ27w/XuTiislc
	G66cVmOSlgv8c+4qj6GBLLIy4cGRgzm9HRRwAj3pf8xOgEgx2lhSGAUbiMCnbsCfVRIx
	MQpPXSrWB2lALraso5qQ80bV/xupJM8Mq4XuPEEWsRYlnvoVqU3GWlmCVoicR2lrzq/w
	i/kA==
X-Gm-Message-State: AJcUukc/RAvunRc+LCM/rIH/pMivTt2dpFhDHYwhyRa1XL/wRm+o2Ty/
	XVOeJi1RzYCs74T0ZqszvtRxQQ==
X-Google-Smtp-Source: ALg8bN5hIKOot1o5P6ud3c0dRu3/s5+GmpyGubOte3GsQDZBFfQ3mM0uSnIPUFJcFaDjiSfBv+dPjQ==
X-Received: by 2002:adf:ca13:: with SMTP id o19mr11905232wrh.148.1548431055389;
	Fri, 25 Jan 2019 07:44:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k26sm35996985wmi.28.2019.01.25.07.44.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 07:44:14 -0800 (PST)
Message-ID: <700a4fa3049746740929c83f6a61bdd5180404c3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 15:44:12 +0000
In-Reply-To: <1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
	<1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Fri, 25 Jan 2019 15:44:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-22 at 17:42 +0800, Yeoh Ee Peng wrote:
> OEQA outputs test results into json files and these files were
> archived by Autobuilder during QA releases. Example: each oe-selftest
> run by Autobuilder for different host distro generate a
> testresults.json file.
> 
> These scripts were developed as a test result tools to manage
> these testresults.json file.
> 
> Using the "store" operation, user can store multiple testresults.json
> files as well as the pre-configured directories used to hold those
> files.
> 
> Using the "merge" operation, user can merge multiple testresults.json
> files to a target file.
> 
> Using the "report" operation, user can view the test result summary
> for all available testresults.json files inside a ordinary directory
> or a git repository.
> 
> Using the "regression" operation, user can perform regression
> analysis
> on testresults.json files specified.

Thanks Ee Peng, this version is much improved!

As an experiment I had a local test results file and I was able to run:

$ resultstool regression /tmp/repo/testresults.json /tmp/repo/testresults.json -b sdk_core-image-sato_x86_64_qemumips_20181219111311 -t sdk_core-image-sato_x86_64_qemumips_20181219200052
Successfully loaded base test results from: /tmp/repo/testresults.json
Successfully loaded target test results from: /tmp/repo/testresults.json
Getting base test result with result_id=sdk_core-image-sato_x86_64_qemumips_20181219111311
Getting target test result with result_id=sdk_core-image-sato_x86_64_qemumips_20181219200052
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
assimp.BuildAssimp.test_assimp : ERROR -> PASSED
==============================End Regression==============================

I was able to clearly see that my failing test case went from ERROR to
PASSED which is good. The interface and the way the information is
being presented and stored are now the things we need to work on.

What is odd about the current tool/behaviour is that it sometimes
expects files that are stored in a repository and sometimes expects
standalone files. It doesn't feel like the work flow and the way the
user would interact with this is quite correct.

You can see from my test case above that the results file I wanted to
compare were both in the same repo file which I'd already
merged/stored. The tool can do it by passing the file twice and
specifying the IDs but its awkward and not obvious.

I'm still a little unsure how we expect to use the tool and whether the
layout of the files in the git repository is how we're going to
ultimately want to do this.

For example, combining all results into a single json file means we
can't really show useful comparison information directly from "git
diff". Would we be better with a file per results ID for example with a
layout allowing "git diff" to be useful? A directory structure like:

selftest/<HOST_DISTRO>/
runtime/<DISTRO>/<MACHINE>
sdk/<MACHINE>/<SDKMACHINE>
esdk/<MACHINE>/<SDKMACHINE>
build-perf/<HOST_DISTRO>/

for example? I don't have the "right" answer here as I've not
experimented with this but its something we need to think about.

As another example, the regression command can't compare the file from
two different git commits easily, you have to copy one file out the git
repo and then checkout the other version to compare them. This isn't
easy for the user.

In summary, I think the base underlying tools here are heading the
right way but the layout of the git repo and the way people are
expected to use and interact with it needs a little bit more work...

Cheers,

Richard








