Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 58D926FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:03:47 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id p188so357641oia.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GwMLJT3XlQnay42cBj39W6sb98Xp5ELKQU2naQ5IGys=;
	b=if9+dDekA20kW0qbEdFSOEAyIBMDxRbAveW2qVeeSSS1/S7JaVCVnokNF2lPy4YDbD
	6mnFO2361n7ab5yU7JE3p1kR0ui9SrkHhdzwfJV71KDYHlNUsRr2+VvHszvIHaO1Q0SO
	Tm3chXrRJ6wHZrfkJXIkeTKJkYWBRZidXAj3Ca0pZ/wq3Bfr3ugc7gmhF1KYs3duRyOj
	uu7HbBAu4cJdpvREr8tDn8+KU28Nl2e3SD2BxPcwpSSnfJR22G+9tgWhqY51xDyFMADR
	iWjs2bc4bU2fARVaTZUjVU1X54gVWFoIym6xbeKLM0By0MDuT/ZO3GhaS2vRK77NFKl8
	x65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GwMLJT3XlQnay42cBj39W6sb98Xp5ELKQU2naQ5IGys=;
	b=fbsa7o+wyoX0zESKWzk23nRO3ryCxBWIA82G1dNtrXX2QeHquYMiIrXQWJsepsw6lD
	blfKL8misecihhjXPn7oHbBP6exp+zgU4/mn5boXZb+Y81xmf4KjuWtlgFPzWX2nFshD
	tECjQ/mMXRrWs08fXZtb4+vw1hoVEPkDvwxXWJiMDna8Dut8SNtc4z62Lk9Vh67A1ajR
	ut2Fb17VnqpYXwRSiahodish30sfzNgXHFWrHBDMorTmEc+mTGu3KiOXZsVT2HkXz/0o
	tzCBXALHglMWOEifBHJWsR65GPE6JaSc5XNZWLljGgJXjI3Urpd3o2GQ5fy0zHRrvfDr
	SnyQ==
X-Gm-Message-State: AIVw110Ytn5rboVWk5yfyoZxZK+D6IVxHTibv6sbKnr2+rBL2uxEkEHv
	ctsCGpYu7WAiQONy
X-Received: by 10.202.67.66 with SMTP id q63mr14487999oia.33.1500321828907;
	Mon, 17 Jul 2017 13:03:48 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FBAD.dip0.t-ipconnect.de. [93.232.251.173])
	by smtp.gmail.com with ESMTPSA id t130sm222353oig.3.2017.07.17.13.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 13:03:47 -0700 (PDT)
Message-ID: <1500321823.5689.17.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Mon, 17 Jul 2017 22:03:43 +0200
In-Reply-To: <5e179f7e-bf5a-0dd2-b569-7a118ec80c63@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<27730e7982a21e192eaba5ab975ca8afd4105e0f.1499803885.git.anibal.limon@linux.intel.com>
	<1500025974.21921.38.camel@intel.com>
	<4317db53-7822-9b8a-c614-b925ee05bfce@linux.intel.com>
	<1500318869.5689.7.camel@intel.com>
	<5e179f7e-bf5a-0dd2-b569-7a118ec80c63@linux.intel.com>
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
X-List-Received-Date: Mon, 17 Jul 2017 20:03:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-17 at 14:41 -0500, Aníbal Limón wrote:
> 
> On 07/17/2017 02:14 PM, Patrick Ohly wrote:
> > On Fri, 2017-07-14 at 10:27 -0500, Aníbal Limón wrote:
> >>
> >> On 07/14/2017 04:52 AM, Patrick Ohly wrote:
> >>> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> >>>> This was a mistake of me to define wrong what methods needs
> >>>> to be defined by certain python version.
> >>>>
> >>>> See rev d8380d098a290510b442a7abd2dd5a50cabf5844.
> >>>
> >>> This will fix this error that we see in Refkit with current OE-core
> >>> master, right?
> >>>
> >>> 00:07:10.313 Traceback (most recent call last):
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 70, in <module>
> >>> 00:07:10.313     ret = main()
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/scripts/oe-selftest", line 57, in main
> >>> 00:07:10.313     results = args.func(logger, args)
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 215, in run
> >>> 00:07:10.313     rc = self._internal_run(logger, args)
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/selftest/context.py", line 176, in _internal_run
> >>> 00:07:10.313     self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/context.py", line 51, in loadTests
> >>> 00:07:10.313     self.suites = self.loader.discover()
> >>> 00:07:10.313   File "/srv/jenkins/workspace/ci-2017-07-14_01-48-19-build-2315/openembedded-core/meta/lib/oeqa/core/loader.py", line 286, in discover
> >>> 00:07:10.313     pattern='*.py', top_level_dir=path)
> >>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 275, in discover
> >>> 00:07:10.313     tests = list(self._find_tests(start_dir, pattern))
> >>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 327, in _find_tests
> >>> 00:07:10.313     yield _make_failed_import_test(name, self.suiteClass)
> >>> 00:07:10.313   File "/usr/lib64/python3.4/unittest/loader.py", line 39, in _make_failed_import_test
> >>> 00:07:10.313     return _make_failed_test(name, ImportError(message), suiteClass)
> >>> 00:07:10.313 TypeError: _make_failed_test() missing 1 required positional argument: 'suiteClass'
> >>>
> >>> Can this particular patch please be merged into OE-core master
> >>> independently from the patch series? It's not really related to it
> >>> anyway.
> >>
> >> Yes this will fix that error, showing the error into the case.
> > 
> > The fix doesn't work for me:
> > 
> >   File "/usr/lib/python3.5/unittest/loader.py", line 41, in _make_failed_import_test
> >     return _make_failed_test(name, ImportError(message), suiteClass, message)
> > TypeError: _make_failed_test() takes 3 positional arguments but 4 were given
> > 
> > You need to mimic the exact same signature as in Python itself, and
> > Python 3.5 seems to be different again:
> > 
> > /usr/lib/python3.5/unittest/loader.py:def _make_failed_test(methodname, exception, suiteClass, message):
> 
> This is strange, i tested on a python 3.5.x and python 3.4.3 versions.
> I don't know why isn't working on your machine.

Have you tested with a test case that fails?

python3.5 = 3.5.3 definitely has four parameters, as quoted above.

I don't know which version has "def _make_failed_test(classname,
exception, suiteClass)".

The actual error in refkit is:

ImportError: Failed to import test module: refkit_ostree
Traceback (most recent call last):
  File "/usr/lib/python3.5/unittest/loader.py", line 428, in _find_test_path
    module = self._get_module_from_name(name)
  File "/usr/lib/python3.5/unittest/loader.py", line 369, in _get_module_from_name
    __import__(name)
  File "/fast/work/intel-iot-refkit-pr/meta-refkit-core/lib/oeqa/selftest/cases/refkit_ostree.py", line 12, in <module>
    class RefkitOSTreeUpdateBase(SystemUpdateBase):
  File "/fast/work/intel-iot-refkit-pr/meta-refkit-core/lib/oeqa/selftest/cases/refkit_ostree.py", line 35, in RefkitOSTreeUpdateBase
    'socat-native')
  File "/fast/work/intel-iot-refkit-pr/openembedded-core/meta/lib/oeqa/utils/commands.py", line 227, in get_bb_vars
    bbenv = get_bb_env(target, postconfig=postconfig)
  File "/fast/work/intel-iot-refkit-pr/openembedded-core/meta/lib/oeqa/utils/commands.py", line 221, in get_bb_env
    return bitbake("-e %s" % target, postconfig=postconfig).output
  File "/fast/work/intel-iot-refkit-pr/openembedded-core/meta/lib/oeqa/utils/commands.py", line 213, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
  File "/fast/work/intel-iot-refkit-pr/openembedded-core/meta/lib/oeqa/utils/commands.py", line 191, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -e socat-native' returned non-zero exit status 1:
Loading cache...done.
Loaded 3495 entries from dependency cache.
Parsing recipes...done.
ERROR: No recipes available for:
  /fast/work/intel-iot-refkit-pr/openembedded-core/../meta-refkit-core/bbappends/meta-security/recipes-tpm/swtpm/swtpm-wrappers-native.bbappend
  /fast/work/intel-iot-refkit-pr/openembedded-core/../meta-refkit-core/bbappends/meta-security/recipes-tpm/trousers/trousers_%.bbappend
Parsing of 2606 .bb files complete (2602 cached, 4 parsed). 3499 targets, 415 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

RefkitOSTreeUpdateBase calls get_bb_vars() as part of the class
definition. That's the part that is failing.

The failure is caused by meta-security re-structuring the layers. Will
be easy enough to fix in meta-refkit-core, now that I know what it is.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




