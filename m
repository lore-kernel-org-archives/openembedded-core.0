Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TG66v-0005Bq-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:41:57 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 83099D22E9; Mon, 24 Sep 2012 12:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B324CD22DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:28:44 +0200 (CEST)
Message-ID: <506035D6.3030705@linaro.org>
Date: Mon, 24 Sep 2012 12:28:38 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: perl-nativesdk interesting fail in do_install
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
X-List-Received-Date: Mon, 24 Sep 2012 10:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I want to build 'meta-toolchain' but on my Ubuntu 12.10 it fails on
'nativesdk-perl' recipe in do_install:

|
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/perl/5.14.2/pod/perlxstut.pod
|
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/perl/5.14.2/pod/a2p.pod
|
| Warning: perl appears in your path in the following locations beyond where
| we just installed it:
|
/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/perl-native/perl
|     /usr/bin/perl
|
| make[1]: Nothing to be done for `install.man'.
| make[1]: Leaving directory
`/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2'
|
/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin
| ln: failed to create symbolic link
`/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/perl':
No such file or directory
| ERROR: Function failed: do_install (see
/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/temp/log.do_install.24991
for further information)
ERROR: Task 2
(virtual:nativesdk:/home/hrw/HDD/devel/canonical/ci-linaro/oecore/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb,
do_install) failed with exit code '1'

Perl is installed as /home/hrw/HDD/devel/canonical/ci-linaro/ \
oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/ \
nativesdk-perl-5.14.2-r9/image/ \
usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/ \
usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/ \
usr/bin/perl

Note repeated "/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux" in
path.

Any idea how it happened? Did someone built 'meta-toolchain' recently?


