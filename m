Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0223C60197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 10:44:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so7407219wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 03:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HUgX3pYRzIqau/UfoE2RAFikOI/LLHqLoc5CyTTHq0s=;
	b=RnkWjKWtHHyY8RwKfftb41v5JAKne1MubtKhy8MfSm5azP5QP0Mpw5MlDBHKUHti1S
	RwyhTJOutmc+3cvce+ulVHL8x7xPh9MWpkL65+QTAHbj76s2C2XLSy018mtSNRsnhQJY
	iAghymM69m+ZPNz54o/uGM/SbjfuBO4Q39R9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HUgX3pYRzIqau/UfoE2RAFikOI/LLHqLoc5CyTTHq0s=;
	b=EP6tke/Y5KYmgJP/ReqVQkvSKipW1JR5tyQVjFsOAjjPIzJL4EtewU2LYExfOUI8Ss
	LqNR2pFKw4LedjdaLsQXTumQYs1LNVhrbfX05Cpgmq5SOjpBzrg0qRrlAAM3GOmbyrPk
	KahSHuDbBRGCdHs9lxxAFkGG9XvDBk+kSzeAQjI3Gp8QtHVa59qkSZ8EuqRTPsOM/jXs
	uC7zOoaihU67Ofxz2oICi4+IKHfODo5pPtMu/mGBBDCTRY2F4NpbyFT4b1BW//wNwLMt
	JfIK++fV/e+7i3SQixpzn8YalASEfw1DZEwCzOo0cqcOL6Rgt6L1srZNPyZY9+ScZQoC
	5DMw==
X-Gm-Message-State: AGRZ1gJ3R/guxg7+uByRTzuA+Yt3DGGBhqSncyaFL63y7tXCVutIGxEF
	R/w38ohSmPXYgxIr4lAaxkyrMA==
X-Google-Smtp-Source: AJdET5fQlzoPE+x4lB8xudovzACVHj9DaahQFiwzetsLD0AvQYJfwnI4jHB+XIwR3FDY9Djg+lzr8A==
X-Received: by 2002:a1c:c90f:: with SMTP id
	f15-v6mr13270183wmb.48.1540809890427; 
	Mon, 29 Oct 2018 03:44:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j13sm11176594wrx.5.2018.10.29.03.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 03:44:49 -0700 (PDT)
Message-ID: <dc70690050312e882a3aef592bb93507a09715ad.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2018 10:44:48 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D043480FE86E@PGSMSX110.gar.corp.intel.com>
References: <1540204485-22641-1-git-send-email-ee.peng.yeoh@intel.com>
	<e222c50a97c8b1b555cac324659e723b49b28413.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D043480FE86E@PGSMSX110.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 29 Oct 2018 10:44:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-23 at 06:39 +0000, Yeoh, Ee Peng wrote:
> I submitted the revised patches below. Sorry for the missing "version
> #" in the patch title. After this, I will add the "version #" into
> the patch title. 
> 
> Please let me know if any question or inputs. Thank you very much for
> your attention & sharing! 

Thanks for the changes. I was at a conference last week and then became
unwell. I wanted to have a further look and test the patches before
merging and I wanted a clearer head to do that.

Unfortunately I found another problem. On my build machine, it shows:

Traceback (most recent call last):
  File "/media/build1/poky/scripts/oe-selftest", line 70, in <module>
    ret = main()
  File "/media/build1/poky/scripts/oe-selftest", line 57, in main
    results = args.func(logger, args)
  File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line 289, in run
    rc = self._internal_run(logger, args)
  File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line 248, in _internal_run
    configuration = self._get_configuration(args)
  File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line 217, in _get_configuration
    metadata = metadata_from_bb()
  File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 42, in metadata_from_bb
    info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
  File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 81, in get_layers
    layer_dict[layer_name] = git_rev_info(layer)
  File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 61, in git_rev_info
    from git import Repo, InvalidGitRepositoryError, NoSuchPathError
ModuleNotFoundError: No module named 'git'

That is obviously easily fixed by installing the git module but it does
raise some questions, in particular, why we have two code paths which
do the same thing (one in metadata_scm.bbclass and one in
lib/oeqa/utils/metadata.py).

It also means we've just added new module dependencies to oe-selftest
and the other test utilities which we don't test for anywhere or have
documented. Doing this last thing in M4 is bad.

So this is going to need a little more thought...

Cheers,

Richard




