Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TOqUJ-0001jt-9e
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 15:50:15 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B9985D221B; Thu, 18 Oct 2012 15:37:03 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id EE591D2219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 15:36:33 +0200 (CEST)
Message-ID: <508005D9.2060507@linaro.org>
Date: Thu, 18 Oct 2012 15:36:25 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Can we trust to sstate-cache?
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
X-List-Received-Date: Thu, 18 Oct 2012 13:50:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Today I bumped gcc-linaro from 4.7-r5 to 4.7-r6. First version was plain
2012.10 release while second one was tarball from bzr repository with
huge set of ICE related fixes for AArch64 architecture.

To do fast clean build I removed TMPDIR and started new build of
core-image-minimal target.

But then I noticed ugly thing:

0: eglibc-2.16-r18+svnr20393 do_populate_sysroot_setscene (pid 30106)
1: eglibc-2.16-r18+svnr20393 do_package_setscene (pid 30107)
3: eglibc-initial-2.16-r18+svnr20393 do_package_setscene (pid 28921)

Why eglibc was taken from sstate-cache instead of being rebuilt (like it
was with 'db')? This makes me sad as it shows that I cannot trust
sstate-cache so each new build will take hours instead of minutes.

Or maybe I am wrong?


