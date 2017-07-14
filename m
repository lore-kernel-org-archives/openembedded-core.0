Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 04B9E781D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 09:52:58 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id x187so67276940oig.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=yKGIvvEpT3O6ac/aYsURxAsjyLrMlixaT7icb1uSkbs=;
	b=cbxqdFYMyJScvl5YX6sZJDM6/UCus6vOBpss7cDH9ayDyvuoF1yPpDCZ5CDX39+T1o
	qJ+hGjvk59ZqUo3/mlfrUKtRv4g2BK7FM9Fae56wNN6BOcgbFdj5VNoM561TOVNfoo2d
	uUgGuXCyUlF+v7amy5k5EPqJk1aanoyg1NCCPesUtRL9oZ3Ucv739tkkghie+wQ4g0yd
	pH3VTcjVZkaYAb+XWrXsf7V5/IltWaGfVWDKc0sfavjQ9EVcUI2Ugz4GRTvDPs92iClh
	uMJpmDidWPREeJ8nwc3zyyiD+oWOlaODJLQitLbjjUtiPrL0GpA7c3KmM6vqp8ZprY3Z
	PIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=yKGIvvEpT3O6ac/aYsURxAsjyLrMlixaT7icb1uSkbs=;
	b=Q+LjM93bR6Cr1qdowymGxNh5zPPkTmDtoX4WonlN0i0cKFsCU2aVhHYTHwWlrGHVA8
	pK+dQsR1BIekoRBeih790Q5pCfLkgd5Ofo8rJQT/UQLdftXJyGEjuebj4o+qBmoBAb+s
	7P5pWlXvGPZyqI3TJKWEiqFdiTd7P5YyBm5XuA6eQbUD71voCEhllgvb0hc4SaXHgzGb
	YecQ3m0dDzfawN6VmYZiDDGJf7L53Nw8sp4SyrsF+M3Hughgg8RXv3zXRcNJWewF1ab9
	uzLtezOfNBj4W94CjEpY3FdciJf5FQXBWqLgBg57WwkgXWoX3nsJsjcr4LH9POrOmIwS
	drmg==
X-Gm-Message-State: AIVw1104KOcWIZ/y8/mCw6sT/3XN7M6VgcuhiJ5iVVDunT2Vwg9PZxgi
	bX9PZUvzXxdpotBG
X-Received: by 10.202.186.3 with SMTP id k3mr5634104oif.59.1500025979934;
	Fri, 14 Jul 2017 02:52:59 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F454.dip0.t-ipconnect.de. [93.232.244.84])
	by smtp.gmail.com with ESMTPSA id
	t130sm11796651oig.3.2017.07.14.02.52.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 02:52:58 -0700 (PDT)
Message-ID: <1500025974.21921.38.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 14 Jul 2017 11:52:54 +0200
In-Reply-To: <27730e7982a21e192eaba5ab975ca8afd4105e0f.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<27730e7982a21e192eaba5ab975ca8afd4105e0f.1499803885.git.anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/30] oeqa/core/loader: Switch method definition for _make_failed_test
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
X-List-Received-Date: Fri, 14 Jul 2017 09:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> This was a mistake of me to define wrong what methods needs
> to be defined by certain python version.
> 
> See rev d8380d098a290510b442a7abd2dd5a50cabf5844.

This will fix this error that we see in Refkit with current OE-core
master, right?

00:07:10.313 Traceback (most recent call last):
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 70, in <module>
00:07:10.313     ret = main()
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 57, in main
00:07:10.313     results = args.func(logger, args)
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 215, in run
00:07:10.313     rc = self._internal_run(logger, args)
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 176, in _internal_run
00:07:10.313     self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/context.py", line 51, in loadTests
00:07:10.313     self.suites = self.loader.discover()
00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/loader.py", line 286, in discover
00:07:10.313     pattern='*.py', top_level_dir=path)
00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 275, in discover
00:07:10.313     tests = list(self._find_tests(start_dir, pattern))
00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 327, in _find_tests
00:07:10.313     yield _make_failed_import_test(name, self.suiteClass)
00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 39, in _make_failed_import_test
00:07:10.313     return _make_failed_test(name, ImportError(message), suiteClass)
00:07:10.313 TypeError: _make_failed_test() missing 1 required positional argument: 'suiteClass'

Can this particular patch please be merged into OE-core master
independently from the patch series? It's not really related to it
anyway.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




