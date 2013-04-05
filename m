Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UO3tZ-0000Jl-C6 for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 12:29:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35AMokc032294; Fri, 5 Apr 2013 11:22:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w7jzCaFmN4OD; Fri,  5 Apr 2013 11:22:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r35AMiq6032277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 5 Apr 2013 11:22:47 +0100
Message-ID: <1365156714.6526.138.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 05 Apr 2013 11:11:54 +0100
In-Reply-To: <515E9FE9.1070906@linaro.org>
References: <515E976C.8060302@linaro.org> <1365155658.6526.136.camel@ted>
	<515E9FE9.1070906@linaro.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 10:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-05 at 11:56 +0200, Marcin Juszkiewicz wrote:
> W dniu 05.04.2013 11:54, Richard Purdie pisze:
> > This means that virtual/libc is providing something which the external
> > toolchain recipes are not. Can you share the "bitbake -DDDv" output for
> > the above command somewhere (I know there will be a lot of it). Buried
> > somewhere in there will be the answer as it does tell you what is going
> > on if you search for the right things.
> 
> http://tygrysek.juszkiewicz.com.pl/~hrw/tmp/rp-log.txt 3.4MB

Some key bits of the log:

DEBUG: Added runtime dependency eglibc
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-dbg
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-dev
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-utils
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-thread-db
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-localedata-i18n
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-gconv-ibm850
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-gconv-cp1252
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-gconv-iso8859-1
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: Added runtime dependency eglibc-gconv-iso8859-15
for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
DEBUG: providers for eglibc-dev are: ['eglibc']
DEBUG: adding
'/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb' to satisfy runtime 'eglibc-dev'
DEBUG: providers for eglibc are: ['eglibc']
DEBUG: adding
'/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb' to satisfy runtime 'eglibc'
DEBUG: providers for eglibc-utils are: ['eglibc']

So where does this come from? packagegroup-core-standalone-sdk-target.bb
leads us to LIBC_DEPENDENCIES which leads to:

$ cat conf/distro/include/tclibc-eglibc.inc

LIBC_DEPENDENCIES = "libsegfault \
		     eglibc \
		     eglibc-dbg \
		     eglibc-dev \
		     eglibc-utils \
		     eglibc-thread-db \
		     ${@get_libc_locales_dependencies(d)}"

LIBC_LOCALE_DEPENDENCIES = "\
	eglibc-localedata-i18n \
	eglibc-gconv-ibm850 \
	eglibc-gconv-cp1252 \
	eglibc-gconv-iso8859-1 \
	eglibc-gconv-iso8859-15"

so I suspect you either need to provide some of these things, or reset
those variables...

Cheers,

Richard



