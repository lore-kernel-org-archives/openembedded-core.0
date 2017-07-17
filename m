Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 190CE77D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 19:14:35 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id q4so41474508oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 12:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Tlr2F1xTigqHYonYi/SOFYFAJXn8mJUYM8LtEd3DdZw=;
	b=rwJePt7OIXdk+IPTYWIulD/eNlUFci7EvKSBYs8PmLEBEMI20ahvQJWoxMUa02tzmb
	xd8JnzhEXR5AAboKy/maWtvpzfV8FKd+0wX6sqwvTS20zxjMMrg8wJMeGSLvmbiRUqsA
	aP6+qtLm+kvnAN2GwbQrhwe3ZZvJLh6mwQFE9RIqdMa+18KVBmV8UijBzj752sZTYvr1
	eaaL/FnBm2q2SCNyWMDg3x784fxDn4Ma5Bvpn4rhQGXnRc+iEYTPqQSPItCw6jKCw3Qn
	ukFPszFD/G47s2jdt2qX+OdfdU3gsptf/45HHYi/ot2MrR7u7Kq1CMljpaqPuWoes+og
	5Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Tlr2F1xTigqHYonYi/SOFYFAJXn8mJUYM8LtEd3DdZw=;
	b=STWOBOXTfvvWe3DBlgetonbSykLpWZCVo76dy4cS3aegJoQZfU1M4yxP48VITFEhjv
	ZPC4i51dMcE35K+eyhjDnUTSE3KN00514OVzWlsL3z3Kwlhv/Xq78bCnbzFfrvfFA1Nq
	xpwoZNhYZDTBkkJNuaWIVvzU/xLyIy68t6bbqlmITGh2soJCi6u74J1fEsfeLRYLZka2
	WunLczZ4oES0fX6Iq9iJ4Uj63ouOflz03ZjuJL3llQSsLXU6/8xNknrinhGcsYGQqUON
	PuTh9/xHuSteLBQrjnw3rZ++fcF9NauJbPvXuYfAS/QLW9Sp46Hn2ghL5b92AQFIwfWi
	PGTg==
X-Gm-Message-State: AIVw113O2d/FECwSJEOZrAwsrdPiskG871E/HxxlCYRBYwAjWnQynr8M
	Mxc7c7WMmjz8Tavl
X-Received: by 10.202.214.145 with SMTP id n139mr4859850oig.48.1500318874869; 
	Mon, 17 Jul 2017 12:14:34 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FBAD.dip0.t-ipconnect.de. [93.232.251.173])
	by smtp.gmail.com with ESMTPSA id s75sm20380oie.16.2017.07.17.12.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 12:14:33 -0700 (PDT)
Message-ID: <1500318869.5689.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, Ross
	Burton <ross.burton@intel.com>
Date: Mon, 17 Jul 2017 21:14:29 +0200
In-Reply-To: <4317db53-7822-9b8a-c614-b925ee05bfce@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<27730e7982a21e192eaba5ab975ca8afd4105e0f.1499803885.git.anibal.limon@linux.intel.com>
	<1500025974.21921.38.camel@intel.com>
	<4317db53-7822-9b8a-c614-b925ee05bfce@linux.intel.com>
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
X-List-Received-Date: Mon, 17 Jul 2017 19:14:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-07-14 at 10:27 -0500, Aníbal Limón wrote:
> 
> On 07/14/2017 04:52 AM, Patrick Ohly wrote:
> > On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> >> This was a mistake of me to define wrong what methods needs
> >> to be defined by certain python version.
> >>
> >> See rev d8380d098a290510b442a7abd2dd5a50cabf5844.
> > 
> > This will fix this error that we see in Refkit with current OE-core
> > master, right?
> > 
> > 00:07:10.313 Traceback (most recent call last):
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 70, in <module>
> > 00:07:10.313     ret = main()
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 57, in main
> > 00:07:10.313     results = args.func(logger, args)
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 215, in run
> > 00:07:10.313     rc = self._internal_run(logger, args)
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 176, in _internal_run
> > 00:07:10.313     self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/context.py", line 51, in loadTests
> > 00:07:10.313     self.suites = self.loader.discover()
> > 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/loader.py", line 286, in discover
> > 00:07:10.313     pattern='*.py', top_level_dir=path)
> > 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 275, in discover
> > 00:07:10.313     tests = list(self._find_tests(start_dir, pattern))
> > 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 327, in _find_tests
> > 00:07:10.313     yield _make_failed_import_test(name, self.suiteClass)
> > 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 39, in _make_failed_import_test
> > 00:07:10.313     return _make_failed_test(name, ImportError(message), suiteClass)
> > 00:07:10.313 TypeError: _make_failed_test() missing 1 required positional argument: 'suiteClass'
> > 
> > Can this particular patch please be merged into OE-core master
> > independently from the patch series? It's not really related to it
> > anyway.
> 
> Yes this will fix that error, showing the error into the case.

The fix doesn't work for me:

  File "/usr/lib/python3.5/unittest/loader.py", line 41, in _make_failed_import_test
    return _make_failed_test(name, ImportError(message), suiteClass, message)
TypeError: _make_failed_test() takes 3 positional arguments but 4 were given

You need to mimic the exact same signature as in Python itself, and
Python 3.5 seems to be different again:

/usr/lib/python3.5/unittest/loader.py:def _make_failed_test(methodname, exception, suiteClass, message):

You can probably get away with

if sys.version_info >= (3,4,4):
    def _make_failed_test(classname, exception, suiteClass, message=None):

The actual problem in refkit is that we are hitting this
_make_failed_test() at all. After fixing meta/lib/oeqa/core/loader.py, I
am getting a more useful exception and know what to do about the actual
problem.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




