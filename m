Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Te2Nw-0006Au-DM
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 12:34:28 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id C09B4D22C0; Thu, 29 Nov 2012 12:20:24 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 841C6D2218
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 12:19:53 +0100 (CET)
Message-ID: <50B744CC.4050906@linaro.org>
Date: Thu, 29 Nov 2012 12:19:40 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Patching eglibc for AArch64
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
X-List-Received-Date: Thu, 29 Nov 2012 11:34:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I would like to merge AArch64 eglibc support into OE-Core. As patch is
nearly 0.5MB I provide it in hrw/aarch64-support branch:

http://git.openembedded.org/openembedded-core-contrib/commit/?h=hrw/aarch64-support&id=aaa36e3ae6ff39682555ac6f21384b44d6f631e3

Commit adds two patches which add AArch64 support for 2.16 version of
eglibc. Both were merged upstream but with some alterations to fit into
trunk properly. As such trunk patches depend on other patches which can
alter state of other architectures which I prefer to avoid.

At Linaro we do daily builds of minimal, lamp, sdk images with this patch.

commit aaa36e3ae6ff39682555ac6f21384b44d6f631e3
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Wed Nov 21 17:08:13 2012 +0100

eglibc: add AArch64 support

Both patches are from libc-alpha mailing list and got merged into
eglibc/trunk. I can not use direct trunk commits because they already
depend on other changes.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

 meta/recipes-core/eglibc/eglibc-2.16/aarch64-glibc-fsf-v1-eaf6f205.patch | 15455 +
 meta/recipes-core/eglibc/eglibc-2.16/aarch64-glibc-v3-elf.patch
  |    47 +
 meta/recipes-core/eglibc/eglibc_2.16.bb
  |     6 +-
 3 files changed, 15506 insertions(+), 2 deletions(-)



