Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.glindkamp@taskit.de>) id 1THBZc-00088O-PD
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 12:44:04 +0200
Received: from mail.taskit.de. (mail.taskit.de [83.236.215.226])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MTtPJ-1Sr5PG1DTl-00QYTf; Thu, 27 Sep 2012 12:07:07 +0200
Received: from localhost (christian.localdomain [10.1.108.246])
	by mail.taskit.de (Postfix) with ESMTP id 5705225C6A;
	Thu, 27 Sep 2012 12:04:14 +0200 (CEST)
Date: Thu, 27 Sep 2012 11:58:26 +0200
From: Christian Glindkamp <christian.glindkamp@taskit.de>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20120927095826.GA9149@taskit.de>
References: <506035D6.3030705@linaro.org>
MIME-Version: 1.0
In-Reply-To: <506035D6.3030705@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Provags-ID: V02:K0:VhPRPtucWSr8uHBciA1x7km3md6DfymLT75XumNgFCb
	9fSUh0SBtvAvDCi2ib0Vn0lcrsQhOTP8RQ09ChjqVSUhIsyRdd
	UXk3aREIihE0n6xUOtDbLR4mYiYmkU+/88cWLh6gLvUxT6IgC9
	8dwuE232ONw6bOtZ67ryuhmsl0R4IVNwkAGTSfd2Y4DPzL2YV/
	9W86NikdD0xC6we8S0R0HBGhPLgs81RdlPViYxJNpVIa10Xw6e
	uu7gcTzlmOZYIeGBCkQf7F94geEhZZCt/jiLwnPGlP0e/GsCMb
	TUPaaPmUq8Ab60YBwT3EO+0OPuwIOsM4FVLETlAbc8b+s0VkqQ
	keHD+UWZuZAE0yB9PeCw=
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: perl-nativesdk interesting fail in do_install
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
X-List-Received-Date: Thu, 27 Sep 2012 10:44:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2012-09-24 12:28, Marcin Juszkiewicz wrote:
> I want to build 'meta-toolchain' but on my Ubuntu 12.10 it fails on
> 'nativesdk-perl' recipe in do_install:
> 
> |
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/perl/5.14.2/pod/perlxstut.pod
> |
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/perl/5.14.2/pod/a2p.pod
> |
> | Warning: perl appears in your path in the following locations beyond where
> | we just installed it:
> |
> /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/perl-native/perl
> |     /usr/bin/perl
> |
> | make[1]: Nothing to be done for `install.man'.
> | make[1]: Leaving directory
> `/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2'
> |
> /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin
> | ln: failed to create symbolic link
> `/home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/perl':
> No such file or directory
> | ERROR: Function failed: do_install (see
> /home/hrw/HDD/devel/canonical/ci-linaro/oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/temp/log.do_install.24991
> for further information)
> ERROR: Task 2
> (virtual:nativesdk:/home/hrw/HDD/devel/canonical/ci-linaro/oecore/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb,
> do_install) failed with exit code '1'
> 
> Perl is installed as /home/hrw/HDD/devel/canonical/ci-linaro/ \
> oecore/build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/ \
> nativesdk-perl-5.14.2-r9/image/ \
> usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/ \
> usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/ \
> usr/bin/perl
> 
> Note repeated "/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux" in
> path.
> 
> Any idea how it happened? Did someone built 'meta-toolchain' recently?

I'm having the same error at the moment. I suppose commit
38234f2e276356b1d77a87ceabc486107e336d19 was meant to fix the issue, but
it doesn't.


