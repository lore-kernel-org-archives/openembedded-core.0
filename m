Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id C7BE577CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 07:15:17 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id m68so7349022ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5wGtIdp2EkdcdBs4xftvEZZ6JTybMN3K5cvN5VVb7mw=;
	b=pCBpyCiYXB0uG2i2bJBUwCkUzCig5/uLG4/hryWWSNwiDsFnAr4bNEVzVjdDIwMfoN
	OCgzX9VJZX1Qx3usG9/e40Q5bvffFmDkfv1hDItGYU2knxT7xIKuVaW5cX+ylHbGc9Uc
	l/fWCGjTYo++XwbX77GPADV6DM9ii/Fr8Dhyaq8JkbvvBLTfWfwx3dMBUy8a6QV8B7p+
	72HHbbv5Hu9yq8wk6kQgpNGJsMEOzXZM9wcVaQ0s89vVGE9y6Dn+Ej3wP5dZtpUEMrNO
	eA0NaTRRfcGIWt4ONRfkFYwTUa98KoVYyWFRuDgCytVp+oXMZbrBsmWq4EkpexcSz77N
	kWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5wGtIdp2EkdcdBs4xftvEZZ6JTybMN3K5cvN5VVb7mw=;
	b=iryQxEzKrt0tvjUd5fjk99N7H2f9BK007I/is22atPC7Ba3DSYATFdi95QUaWvqFWU
	SxvUHLjnQE8hW7PRliE3qjuo8mXOCp4gw8EC0mZ+uzmYQAe2q+guF4+Q1nybkLZjVqec
	eG6p+gLrXIH1PwlrzRcZ/1WBTx7jpun7Y6s1JKj8cGrD5g+gYZx5jKR4ypOvZOV0JZ8R
	kbENIlIETHVuT4/g1i1Ky6877cZmW8KIW6AVHTTq2dY/YugcijNdPlMy//r1kDx5smr8
	JCCDd+fDaKhvx+c0NnOBvkape6RbjlV28nRJkJTuxF6m5lfuLBON5n7OUO9U2pQ5jRbb
	370w==
X-Gm-Message-State: AIVw110JQXiyRPQaOEW/DemcuywvbDT7h0WhfucMfKByn3cBEsqk7vqp
	glzVPHddCWp/Qj7w
X-Received: by 10.36.88.135 with SMTP id f129mr20030870itb.22.1499843718669;
	Wed, 12 Jul 2017 00:15:18 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F424.dip0.t-ipconnect.de. [93.232.244.36])
	by smtp.gmail.com with ESMTPSA id
	j12sm1157882iod.12.2017.07.12.00.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 00:15:17 -0700 (PDT)
Message-ID: <1499843714.20211.117.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 12 Jul 2017 09:15:14 +0200
In-Reply-To: <0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/30] oeqa/selftest/cases: runqemu enable thraded runs
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
X-List-Received-Date: Wed, 12 Jul 2017 07:15:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

s/thraded/threaded/ in the subject. There are more spelling mistakes
elsewhere ("wrapper methos"). I don't know how important that is.

On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> - Update to use wrappers {bitbake,get_bb_var} from OESelfTestCase class.

s/OESelfTestCase/OESelftestTestCase/

Sorry to be pedantic, but I wanted to look up what these wrappers do and
couldn't even find the class ;-}

I've found them in the "oeqa/selftest/case: Add wrappers to
utils.commands modules" patch. I'm a bit worried that this entire patch
series is introducing concepts and methods without any documentation or
explanations why things are done this way. I suspect it will make it
very hard to write selftests correctly.

For example, this patch and others like it seem fairly arbitrary. It
doesn't explain why self.bitbake() is better than bitbake(). If in some
future patch or test someone were to use bitbake() when they should have
used self.bitbake() it's not going to be obvious either whether that is
correct.

Perhaps all OE tests should have these wrappers and only
OESelftestTestCase does something special with them? Then we can
gradually replace the direct calls to oeqa.utils.commands completely.

Add also a wrapper for runqemu and we can get rid of "from
oeqa.utils.commands import" completely.

> - Run into the main thread because it needs tinfoil to run.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/runqemu.py | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
> index 4050a4123ba..e30cb24046f 100644
> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
> @@ -6,12 +6,11 @@ import re
>  import logging
>  
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> +from oeqa.utils.commands import runqemu
>  from oeqa.core.decorator.oeid import OETestID
>  
>  class RunqemuTests(OESelftestTestCase):
>      """Runqemu test class"""
> -
>      image_is_ready = False
>      deploy_dir_image = ''
>  
> @@ -37,8 +36,8 @@ SYSLINUX_TIMEOUT = "10"
>          )
>  
>          if not RunqemuTests.image_is_ready:
> -            RunqemuTests.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> -            bitbake(self.recipe)
> +            RunqemuTests.deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
> +            self.bitbake(self.recipe)
>              RunqemuTests.image_is_ready = True
>  
>      @OETestID(2001)

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




