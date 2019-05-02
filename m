Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E56BB60720
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 11:00:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t76so2179719wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cmo7lBHUde/7KdeC7PnjgLScjTgKr/o4QzCkPWw9IyA=;
	b=FaajJqHuSG1kb2eJfiBAWFMvxfy3w5yTDHQNg8UOBs3QZNbTmJAK4EPN/hQcYueXzV
	I1q0BsO9GZSL9YGzlH2Vw06L9/6UYWGKzDl91phk1T1Ys3+BZ9TTp67+8ughkV0gMOJq
	S9F8/SktdwjlqNzm17ik+g847oTuUs8RWiPyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cmo7lBHUde/7KdeC7PnjgLScjTgKr/o4QzCkPWw9IyA=;
	b=YH/6Dputw1JgAqwZlOH1DRaWyY8xyJQyBRLsIAFsn+i3NL9AmBZyuqgYA+GRVH+JIM
	caqohn8n4Nd60CSsz/EJ8H0wn72mE9RU7knTysnNJJzTZJukjF311DrId1AxU3ELgy/w
	pC8y+nWxmDdOVXVUlH6Yt+pz3CDjAoiDWkuCkcxo02UVPNmaRavjvNw+HIDJcq4LSYHi
	VxoUWPqjZGMLpJ7BtbqlFs25RReDr06DOi7k4HCdz14OcdkF5rEyVT1Lm3RO4oQPO2oh
	DPPVeDXsfT9MET/c0w/a0oyr6XLnIqycThhk2QV+xLF1imnKOG58CF5FHN7GIL7YJvCV
	9alg==
X-Gm-Message-State: APjAAAUHJp95crLKo542bBXLr+Tzy4hiV015OXfnFKDwK2NzM+N+2a+2
	8F15wKjdNQhH/h3aCQyU7vIUUQ==
X-Google-Smtp-Source: APXvYqx4qgndLXyRmQqlpeu5BaoCUyOn89Yi3q2rFmTP+3rP8hr/YJQtv0n2z+ZMMa3t095DDAQaZQ==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr1984920wmh.136.1556794815978; 
	Thu, 02 May 2019 04:00:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x14sm6503589wmj.3.2019.05.02.04.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 04:00:14 -0700 (PDT)
Message-ID: <8f30a1ed263ebb9414f68a40edacbdd0a8da4cfb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 May 2019 12:00:13 +0100
In-Reply-To: <1556635619-32075-1-git-send-email-akuster808@gmail.com>
References: <1556635619-32075-1-git-send-email-akuster808@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [v2][PATCH] manual tests migrate to selftest
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
X-List-Received-Date: Thu, 02 May 2019 11:00:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Armin,

This patch needs quite a bit more work unfortunately.

On Tue, 2019-04-30 at 07:46 -0700, Armin Kuster wrote:
> [v2]
> add check for python cairo module
> pybootchartgui.py needs it
> 
> don't use relative path to pybootchartgui.py, use absolute
> 
> fix endline check data to reflect current output
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/oescripts.py | 97 +++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
> index bcdc2d5..81dd786 100644
> --- a/meta/lib/oeqa/selftest/cases/oescripts.py
> +++ b/meta/lib/oeqa/selftest/cases/oescripts.py
> @@ -1,8 +1,11 @@
> +import os, sys

The convention is we put these on separate lines:

import os
import sys

>  from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.selftest.cases.buildhistory import BuildhistoryBase
>  from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
>  from oeqa.core.decorator.oeid import OETestID
>  
> +
>  class BuildhistoryDiffTests(BuildhistoryBase):
>  
>      @OETestID(295)
> @@ -26,3 +29,97 @@ class BuildhistoryDiffTests(BuildhistoryBase):
>                  self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
>          if expected_endlines:
>              self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
> +
> +class OEScriptTests(OESelftestTestCase):
> +    def setUp(self):
> +        try:
> +            import cairo
> +        except ImportError:
> +            self.skipTest('Python module cairo is not present')

This breaks things for me:

2019-05-02 10:37:00,488 - oe-selftest - INFO - ======================================================================
2019-05-02 10:37:00,488 - oe-selftest - INFO - ERROR: test_packageconfig_flags_default (oescripts.OEListPackageconfigTests)
2019-05-02 10:37:00,488 - oe-selftest - INFO - ----------------------------------------------------------------------
2019-05-02 10:37:00,489 - oe-selftest - INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/case.py", line 46, in _oeTearDown
    self.tearDownMethod()
  File "/media/build1/poky/meta/lib/oeqa/selftest/case.py", line 166, in tearDown
    logit("Finishing %s (%ss)" % (self.id(), "{0:.2f}".format(self.endtime - self.starttime)))
AttributeError: 'OEListPackageconfigTests' object has no attribute 'starttime'

It needs something like:

    @classmethod
    def setUpClass(cls):
        super(OEScriptTests, cls).setUpClass()

adding to ensure we call the parent class function rather than replace
it.

> +
> +    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
> +
> +    def check_endlines(self, results,  expected_endlines): 
> +        for line in results.output.splitlines():

I'd suggest adding:

            # turn all duplicate spaces to single spaces
            line = re.sub(' +', ' ', line)

> +            for el in expected_endlines:
> +                if line == el:
> +                    expected_endlines.remove(el)
> +                    break
> +
> +        if expected_endlines:
> +            self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
> +
> +
> +class OEPybootchartguyTests(OEScriptTests):
> +
> +    def test_pybootchartguy_help(self):
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
> +
> +    def test_pybootchartguy_to_generate_build_png_output(self):
> +        tmpdir = get_bb_var('TMPDIR')
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f png' % (self.scripts_dir, tmpdir, tmpdir))
> +
> +    def test_pybootchartguy_to_generate_build_svg_output(self):
> +        tmpdir = get_bb_var('TMPDIR')
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f svg' % (self.scripts_dir, tmpdir, tmpdir))
> +
> +    def test_pybootchartguy_to_generate_build_pdf_output(self):
> +        tmpdir = get_bb_var('TMPDIR')
> +        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f pdf' % (self.scripts_dir, tmpdir, tmpdir))
> +
> +
> +class OEListPackageconfigTests(OEScriptTests):
> +    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
> +    def test_packageconfig_flags_help(self):
> +        runCmd('%s/contrib/list-packageconfig-flags.py -h' % self.scripts_dir)
> +
> +    def test_packageconfig_flags_default(self):
> +        results = runCmd('%s/contrib/list-packageconfig-flags.py' % self.scripts_dir)
> +        expected_endlines = []
> +        expected_endlines.append("RECIPE NAME                                                        PACKAGECONFIG FLAGS")
> +        expected_endlines.append("xserver-xorg-1.20.4                                                dri dri2 dri3 gcrypt glamor glx nettle openssl systemd systemd-logind udev unwind xinerama xmlto xshmfence xwayland")
> +        expected_endlines.append("znc-1.7.1                                                          ipv6")

with the above addition you can remove the duplicate whitespaces here
and we're no longer reliant on the maximum recipe name+version string
length.

znc must come from meta-oe so adding that to an OE-Core test seems
unusual? Could we test something else in OE-Core?

I also don't like the idea of hardcoding the xserver-xorg version here
as we'd have to remember to change it for every xserver-xorg version
bump.

Perhaps we should make the above regexs to avoid this?

Whilst we're looking at the patch could you split it into two, one for
the packageconfig tests and one for the pybootchart ones so one can
merge without the other. The commit message also needs tweaking,
something like:

selftest: Convert manual packageconfig tests to automated selftest

and you could delete the manual test case it covers in the same patch.

Cheers,

Richard


