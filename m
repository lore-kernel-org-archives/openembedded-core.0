Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id D11B979C9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 21:56:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 206-v6so1732763wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9sFJ3iCywAQqluah+M9dn+4qXpQ5p7tCnTVXAPcWGpY=;
	b=akyUUyt62KuddjPGnyS/Z9O2o0TLts0dgZ4AkIGfUIWAQTDnFEVL1N3qcaK343Pu/0
	9yH+jOuPDTZlOqPBAiS/9GoJUxOrgPE46J3CkgyfGimR5mg3trVgxbMG8JASM5hEJCzu
	iyk+ygiOzyllmdDNRx5OqcHqGEdnQmy4xttzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9sFJ3iCywAQqluah+M9dn+4qXpQ5p7tCnTVXAPcWGpY=;
	b=sXYs8oboUf17nD8mYfyhIGyWwF2tJz4pEzlMiCMSjqpbpopXIO6J4t3GLgUJNtPA14
	iZpnFTd4Cq7Q8cJO0JoEgKDSLrCtGVSujLdfWfZibxN3GfXlp3kE1EaYGQlGUxJy8yDU
	XD+U4x4bBsmZkKE6zGnb8eF05T+Gl6bkVwAGcmo10x2KDdr1iO57Nbo73JIEZtl9suoX
	ho6yDtyUOpaaGmk1jqYS/IZvYOkSnJsJWgafFHyV9OWZXPYQyFkPiGRT7MxHfG0ZOd+4
	2N4zGC/AyvIC924I8hq952w+2x/4H1vmm1l76E3h79NhtlkEWl6GRrd/WVrm/v+pQjXS
	08Dw==
X-Gm-Message-State: ABuFfohDvhD3e6Ccr88g/8CeMQfRLuKRsG+t0puV8FssFBYtkz3sqEB1
	mWCPRhqktqVzVY7IFvD2/91BRw==
X-Google-Smtp-Source: ACcGV60fZoge4QuNE52Ys/19i5NJ70fIdHFV1gR+R5HPodOyCLtBeF02qYsJwhlCne3fKprkZvVMyg==
X-Received: by 2002:a1c:958d:: with SMTP id
	x135-v6mr2199438wmd.46.1539899799267; 
	Thu, 18 Oct 2018 14:56:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	126-v6sm804178wme.48.2018.10.18.14.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 14:56:38 -0700 (PDT)
Message-ID: <5b431318cc50402e32836dbf42398e59ae323bee.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 18 Oct 2018 22:56:29 +0100
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335ECCCF0@KMSMSX155.gar.corp.intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
	<1539588294-5532-2-git-send-email-ee.peng.yeoh@intel.com>
	<ad34c69dbab91a7250874cb70d0c03a62adc3e2c.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECCCF0@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Thu, 18 Oct 2018 21:56:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-18 at 09:47 +0000, Yeoh, Ee Peng wrote:
> Thank you very much for your great feedbacks and inputs!
> I had completed the refactor and resubmitted the patches as below. 
> Please let me know if any more feedbacks and inputs!

Thanks for the revised series, its looking very much improved! I've
queued 1/5 onto the autobuilder and its tested ok so that will likely
merge.

I still have a few concerns about the data format for 2/5.

@@ -249,3 +256,24 @@ class OETestRunner(_TestRunner):
>              self._list_tests_module(suite)
>  
>          return OEListTestsResult()
> +
> +class OETestResultJSONHelper(object):
> +
> +    def _create_json_testresult_string(self, test_results, test_environments):
> +        testcase_dict = {}
> +        for testcase in sorted(test_results):
> +            testcase_dict[testcase] = {"testresult": test_results[testcase][0], "log": test_results[testcase][1]}
> +        testresult_object = {'testenvironment': test_environments,
> +                             'testcase': testcase_dict}

I'd like to be able to store more than one set of results in a single
json file. In order to make that work, the above format will need
tweaking slightly. Something like:

testresult_object = {resultid : {'configuration': test_environments,
                                  'results': testcase_dict}}

where resultid would be something like "imagetest-qemux86-core-image-sato-YYMMDDHHMMSS" 
and passed in to the function by the call site. It'd be similar to the
other log file the tests generate. We could also perhaps use pid
instead of a timestamp in there. A timestamp would be good in the
configuration section.

Also, we need to record which revision of the configured layers this
test result was with. The get_layers_branch_rev() function in
base.bbclass should give an idea of how to get this information using
existing functions.

> +        return json.dumps(testresult_object, sort_keys=True, indent=4)
> +
> +    def _write_file(self, write_dir, file_name, file_content):
> +        file_path = os.path.join(write_dir, file_name)
> +        with open(file_path, 'w') as the_file:
> +            the_file.write(file_content)
> +
> +    def dump_testresult_file(self, test_results, test_environments, write_dir):
> +        if not os.path.exists(write_dir):

No need for this if test here since mkdirhier handles that.

> +            bb.utils.mkdirhier(write_dir)
> +        json_testresult = self._create_json_testresult_string(test_results, test_environments)
> +        self._write_file(write_dir, 'testresults.json', json_testresult)

As mentioned above, I'd really like if if we could put all the test
results into one json file as this would save the autobuilder having to
combine them all. That should be straight forward to do but we need to
be careful about races.

This means locking a lockfile alongside the results file which we can
do with bb.utils.lockfile() call, then writing the results, then
calling unlockfile().

With regard to the other patches, for selftest we do need to log which
MACHINE/DISTRO was used.

DISTRO and IMAGE_PKGTYPE also needs adding to testimage and SDKMACHINE
and IMAGE_PKGTYPE to testsdk.

Cheers,

Richard


