Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1991F78812
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 23:45:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1JNjHXN003614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 19 Feb 2018 23:45:19 GMT
Message-ID: <1519083917.24236.261.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 19 Feb 2018 23:45:17 +0000
In-Reply-To: <1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
References: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
	<1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Mon, 19 Feb 2018 23:45:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-02-19 at 10:37 -0500, Bruce Ashfield wrote:
> From: Joe Slater <jslater@windriver.com>
> 
> Remove do_make_scripts() from module-base.bbclass and put
> functionality in a recipe.  This will build the scripts only
> once instead of each time an external module is built.
> 
> [YOCTO #12228]
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> 
> v2: added the LIC_FILES_CHECKSUM
> 

Sadly this doesn't pass all our tests:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/827/steps/Running%20oe-selftest/logs/stdio

oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs

should reproduce.

I suspect that the recipe may need:

PACKAGE_ARCH = "${MACHINE_ARCH}"

Cheers,

Richard

