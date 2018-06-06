Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 067FC748A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 10:30:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w56AUoYu021417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 6 Jun 2018 11:30:52 +0100
Message-ID: <8adaef8e7d70c9fda65d7835d4efc2a62950f3e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 06 Jun 2018 11:30:50 +0100
In-Reply-To: <87cf5a4e6e04ba739ab6e50fe2ec41b843487e1c.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
	<87cf5a4e6e04ba739ab6e50fe2ec41b843487e1c.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 06/14] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Wed, 06 Jun 2018 10:30:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-04 at 11:10 +0800, Chen Qi wrote:
> This test modules is designed to be invoked only by selftest. It's
> not meant to be tested by normal runtime test. So it should be
> renamed
> with '_' prefix, so that it will not be automatically loaded by
> normal
> runtime tests when 'auto' is in TEST_SUITES.
> 
> The failure message is as below.
> 
>   RESULTS - selftest.Selftest.test_install_package - Testcase -1:
> FAILED
> 
> Also, change selftest/cases/runtime_test.py to use '_selftest'
> accordingly.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> 
> fix _selftest
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} |
> 2 +-
>  meta/lib/oeqa/selftest/cases/runtime_test.py                       |
> 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py =>
> _selftest.py} (94%)
> 


Sorry but this is still failing:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1098/steps/Running%20oe-selftest/logs/stdio

Cheers,

Richard

