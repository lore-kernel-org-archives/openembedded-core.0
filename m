Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0576974F46
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 22:42:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53MgRoQ000976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 23:42:28 +0100
Message-ID: <08b7132659ca0fa714a0db2683e0cfce3be5576c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 23:42:27 +0100
In-Reply-To: <2135721ef52b1d348383d5f3007f3a946e1be4a5.1527829100.git.Qi.Chen@windriver.com>
References: <cover.1527829099.git.Qi.Chen@windriver.com>
	<2135721ef52b1d348383d5f3007f3a946e1be4a5.1527829100.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Sun, 03 Jun 2018 22:42:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 13:03 +0800, Chen Qi wrote:
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

This seems to cause the second failure in 

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1096/steps/Running%20oe-selftest/logs/stdio 

Cheers,

Richard

