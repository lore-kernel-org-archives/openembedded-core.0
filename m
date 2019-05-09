Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 54AE27DFE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 23:16:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d3so1847615plj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 16:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pOGwWOOpgevCmCVN6IhdeGcObtGsQCHcQcu1F/WFKVs=;
	b=M3fNjQrpda+Yhr6Srgdzp4RwOQk1FgiX9Ixsjo0UvHzIVw4yjU4RYLqOsWXW5OIySt
	papo9B/BwEUe7u0R8fgjfqVCAFOYE8yp6b737HOsJ0y6OryGSdUxY5geVNsXuKrulxj2
	lJQN6WvmGfg4DxYx449obihAZ/7/A1z6gobzN81cbb/78pXnFp9ks5lpo/szH9F/Tz5W
	WbA6MiBWo/+gLKUg7P8ixyXWnGCGjVuWK5L78XXwWMvdREs1AhhhPI+AmKxhOGQ+Weok
	cJk1B/buv8ZsAe3/KhqIpbYe6JCdYCKScgP9o6MqTrhl/1EsmmtlCvVVmgMW7tfCQekr
	V88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=pOGwWOOpgevCmCVN6IhdeGcObtGsQCHcQcu1F/WFKVs=;
	b=mvdqqxMuxBZed5IbmntMnOHZ0ymujXPE8SWEtKi5hS17AgwtMSWNBQ5/9+Ik944tG1
	b0fkRDLMkvHvbhIvlbKiUerPz8QlSq4NGRRfoiOlwDCdGzJYOZgIOh3G52+A+c5slsAJ
	HLO17kTIpeYO5UwSK3iIsUOc0P4bjAYtnmH8HJdJ88Fnng0gAcjUKa3kpKRZdQv2Gx0d
	RVxp7zx92kv7JfQaz0SNGBG7567znW0iJDUER1zsv+02eYNMU6l4GCymJNhkaQxtY9Qv
	2R63LG5rd7C9qV9keYIqriRuFqRUjzEq67qFrNlN6w4lu/UU4tuecoIE9mRE1UOrTk/s
	ZFHg==
X-Gm-Message-State: APjAAAWl7bFZEw4nZmi5j+88rWITiLrEc12xilh6/PmytLAq4kOG3c1k
	DsL+jq5I3An1x6C8f6XgBgMbA7mp
X-Google-Smtp-Source: APXvYqx1AZORKE0n4B/IeeIVKTOcElhlyBPcaElQLsYZ9FnhH2zRJ1orX3QdSqnMLuH3JYIrlSW3EQ==
X-Received: by 2002:a17:902:9a9:: with SMTP id 38mr8896739pln.10.1557443804664;
	Thu, 09 May 2019 16:16:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:40fa:e37a:f8bb:92a3?
	([2601:202:4180:c33:40fa:e37a:f8bb:92a3])
	by smtp.gmail.com with ESMTPSA id
	o20sm2716273pgj.70.2019.05.09.16.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 16:16:44 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190509165836.14877-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1da4a8aa-8bd8-4cee-5128-07fe47ba064a@gmail.com>
Date: Thu, 9 May 2019 16:16:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165836.14877-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] oeqa/selftest: Automate manual pybootchart tests
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
X-List-Received-Date: Thu, 09 May 2019 23:16:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/9/19 9:58 AM, Richard Purdie wrote:
> Automate the current manual pybootchart tests. This includes a check
> for the cairo dependency, skipping the test if appropriate.
>
> Based on original patch from Armin Kuster <akuster808@gmail.com>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks.

- armin
> ---
>  meta/lib/oeqa/manual/oe-core.json         | 26 -----------------
>  meta/lib/oeqa/selftest/cases/oescripts.py | 34 +++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
> index d893d849fb3..3ee0aa95f93 100644
> --- a/meta/lib/oeqa/manual/oe-core.json
> +++ b/meta/lib/oeqa/manual/oe-core.json
> @@ -1,30 +1,4 @@
>  [
> -  {
> -    "test": {
> -      "@alias": "oe-core.scripts.Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles",
> -      "author": [
> -        {
> -          "email": "alexandru.c.georgescu@intel.com",
> -          "name": "alexandru.c.georgescu@intel.com"
> -        }
> -      ],
> -      "execution": {
> -        "1": {
> -          "action": "Run a build for a recipe (e.g. core-image-minimal)",
> -          "expected_results": ""
> -        },
> -        "2": {
> -          "action": "Run the profiling script, ../scripts/pybootchartgui/pybootchartgui.py  tmp/buildstats/    \n\n",
> -          "expected_results": ""
> -        },
> -        "3": {
> -          "action": "Verify the results ",
> -          "expected_results": "The scripts generates svg files with the profiling results . "
> -        }
> -      },
> -      "summary": "Use_scripts/pybootchartgui/pybootchartgui.py_to_generate_build_profiles"
> -    }
> -  },
>    {
>      "test": {
>        "@alias": "oe-core.scripts.Crosstap_script_check",
> diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
> index 56b35b59eb8..217afe3775b 100644
> --- a/meta/lib/oeqa/selftest/cases/oescripts.py
> +++ b/meta/lib/oeqa/selftest/cases/oescripts.py
> @@ -2,6 +2,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>  
> +import os
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.selftest.cases.buildhistory import BuildhistoryBase
>  from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
> @@ -28,3 +29,36 @@ class BuildhistoryDiffTests(BuildhistoryBase):
>                  self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
>          if expected_endlines:
>              self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
> +
> +class OEScriptTests(OESelftestTestCase):
> +
> +    @classmethod
> +    def setUpClass(cls):
> +        super(OEScriptTests, cls).setUpClass()
> +        try:
> +            import cairo
> +        except ImportError:
> +            cls.skipTest('Python module cairo is not present')
> +        bitbake("core-image-minimal -c rootfs -f")
> +        cls.tmpdir = get_bb_var('TMPDIR')
> +        cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
> +
> +    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
> +
> +class OEPybootchartguyTests(OEScriptTests):
> +
> +    def test_pybootchartguy_help(self):
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
> +
> +    def test_pybootchartguy_to_generate_build_png_output(self):
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f png' % (self.scripts_dir, self.buildstats, self.tmpdir))
> +        self.assertTrue(os.path.exists(self.tmpdir + "/charts.png"))
> +
> +    def test_pybootchartguy_to_generate_build_svg_output(self):
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f svg' % (self.scripts_dir, self.buildstats, self.tmpdir))
> +        self.assertTrue(os.path.exists(self.tmpdir + "/charts.svg"))
> +
> +    def test_pybootchartguy_to_generate_build_pdf_output(self):
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f pdf' % (self.scripts_dir, self.buildstats, self.tmpdir))
> +        self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
> +


