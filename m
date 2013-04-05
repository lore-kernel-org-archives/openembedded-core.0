Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UO36E-0002Qi-My
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 11:38:25 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 99451D22E8; Fri,  5 Apr 2013 11:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B8C22D20D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 11:20:54 +0200 (CEST)
Message-ID: <515E976C.8060302@linaro.org>
Date: Fri, 05 Apr 2013 11:20:44 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.4.6
Subject: Does support for external toolchains working in current OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 09:38:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For last few months I am working on fixing Linaro binary cross
toolchains and their support in OpenEmbedded. Got to point when they 
work (both AArch64 and ARMv7a ones) for single packages but problem 
starts when I want to create image...

11:14 hrw@puchatek:build$ bitbake core-image-minimal -g
Parsing of 1302 .bb files complete (1294 cached, 8 parsed). 1670 targets, 45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/gettext (proxy-libintl, gettext)
NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/gettext
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide virtual/arm-linux-gnueabihf-libc-for-gcc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
 This usually means one provides something the other doesn't and should.
NOTE: PN build list saved to 'pn-buildlist'
NOTE: PN dependencies saved to 'pn-depends.dot'
NOTE: Package dependencies saved to 'package-depends.dot'
NOTE: Task dependencies saved to 'task-depends.dot'

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

All three virtual/ are provided by external-linaro-toolchain recipe... 

Is there any external toolchain which allows to create image with current
OpenEmbedded layers? 

TCMODE="external-sourcery" gives exactly same problem.


