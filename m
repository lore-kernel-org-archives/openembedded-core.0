Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UO5PH-0006hA-2I
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 14:06:11 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 00D53D22E9; Fri,  5 Apr 2013 13:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 396E3D20D2;
	Fri,  5 Apr 2013 13:48:34 +0200 (CEST)
Message-ID: <515EBA08.9070607@linaro.org>
Date: Fri, 05 Apr 2013 13:48:24 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <515E976C.8060302@linaro.org> <1365155658.6526.136.camel@ted>
	<515E9FE9.1070906@linaro.org> <1365156714.6526.138.camel@ted>
In-Reply-To: <1365156714.6526.138.camel@ted>
X-Enigmail-Version: 1.4.6
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
X-List-Received-Date: Fri, 05 Apr 2013 12:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.04.2013 12:11, Richard Purdie pisze:
> On Fri, 2013-04-05 at 11:56 +0200, Marcin Juszkiewicz wrote:
>> http://tygrysek.juszkiewicz.com.pl/~hrw/tmp/rp-log.txt 3.4MB

> Some key bits of the log:
> 
> DEBUG: Added runtime dependency eglibc
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-dbg
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-dev
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-utils
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-thread-db
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-localedata-i18n
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-gconv-ibm850
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-gconv-cp1252
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-gconv-iso8859-1
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: Added runtime dependency eglibc-gconv-iso8859-15
> for /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> DEBUG: providers for eglibc-dev are: ['eglibc']
> DEBUG: adding
> '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb' to satisfy runtime 'eglibc-dev'
> DEBUG: providers for eglibc are: ['eglibc']
> DEBUG: adding
> '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb' to satisfy runtime 'eglibc'
> DEBUG: providers for eglibc-utils are: ['eglibc']
> 
> So where does this come from? packagegroup-core-standalone-sdk-target.bb
> leads us to LIBC_DEPENDENCIES which leads to:
> 
> $ cat conf/distro/include/tclibc-eglibc.inc
> 
> LIBC_DEPENDENCIES = "libsegfault \
> 		     eglibc \
> 		     eglibc-dbg \
> 		     eglibc-dev \
> 		     eglibc-utils \
> 		     eglibc-thread-db \
> 		     ${@get_libc_locales_dependencies(d)}"


> LIBC_LOCALE_DEPENDENCIES = "\
> 	eglibc-localedata-i18n \
> 	eglibc-gconv-ibm850 \
> 	eglibc-gconv-cp1252 \
> 	eglibc-gconv-iso8859-1 \
> 	eglibc-gconv-iso8859-15"


> so I suspect you either need to provide some of these things, 

> or reset those variables...

They can not be reset cause TCMODE is loaded before TCLIBC.

But LIBC_LOCALE_DEPENDENCIES can be ignored when TCMODE include does not
have "libc-locale" in DISTRO_FEATURES_LIBC (which is how it is done in
external-linaro toolchain).

LIBC_DEPENDENCIES left... External Linaro toolchain uses
eglibc-package.inc to get RPROVIDES for "glibc*" things so I added also
"eglibc*" ones:

RPROVIDES_${PN}            += " eglibc"
RPROVIDES_${PN}-dev        += " eglibc-dev"
RPROVIDES_${PN}-doc        += " eglibc-doc"
RPROVIDES_${PN}-dbg        += " eglibc-dbg"
RPROVIDES_${PN}-pic        += " eglibc-pic"
RPROVIDES_${PN}-utils      += " eglibc-utils"
RPROVIDES_${PN}-gconv      += " eglibc-gconv"
RPROVIDES_${PN}-pcprofile  += " eglibc-pcprofile"
RPROVIDES_eglibc-extra-nss += " eglibc-extra-nss"
RPROVIDES_eglibc-thread-db += " eglibc-thread-db"

Last two lines does not have any sense from BitBake point of view so are
ignored.

Resulting packages are still wrong... So let's hack tclibc-eglibc.inc to
use 'glibc*' in LIBC_DEPENDENCIES instead of 'eglibc*'. No luck again:

Provides: glibc-doc, eglibc-doc
Provides: glibc-pcprofile, eglibc-pcprofile
Provides: glibc-staticdev, libc-staticdev
Provides: eglibc-dbg, libc-dbg, glibc-dbg
Provides: virtual-libc-dev, libc6-dev, glibc-dev, libc-dev, eglibc-dev
Provides: rtld(GNU_HASH), glibc, eglibc
Provides: glibc-thread-db

But I do not think that LIBC_DEPENDENCIES are reason here. When reset
them in tclibc-eglibc.inc file then I get the same error about multiple
recipes ;(



