Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRnwm-0002GP-CU for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:07:04 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRntk-0001iE-18
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 18:03:56 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306944074.2529.107.camel@phil-desktop>
References: <1306944074.2529.107.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 17:03:55 +0100
Message-ID: <1306944235.2529.109.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: dbus-native --with-x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 16:07:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 17:01 +0100, Phil Blundell wrote:
> Is there any compelling reason why dbus-native needs to be built
> --with-x?  This seems to be causing quite a large stack of native X11
> packages to get built with, as far as I can tell, no useful result.

Oh, on the subject of out-of-control dependency chains, my other pet
bugbear at the moment is rpm-native:

"rpm-native" -> "bzip2-native"
"rpm-native" -> "db-native"
"rpm-native" -> "perl-native"
"rpm-native" -> "openssl-native"
"rpm-native" -> "expat-native"
"rpm-native" -> "autoconf-native"
"rpm-native" -> "automake-native"
"rpm-native" -> "libtool-native"
"rpm-native" -> "gnu-config-native"
"rpm-native" -> "gettext-native"
"rpm-native" -> "python-native"
"rpm-native" -> "acl-native"
"rpm-native" -> "elfutils-native"
"rpm-native" -> "libpcre-native"
"rpm-native" -> "zlib-native"
"rpm-native" -> "popt-native"
"rpm-native" -> "attr-native"

As far as I can tell, the native rpm is never being used in any way
which requires it to have openssl, and I suspect the same is probably
true for some of the other libs above.  Does anybody happen to know what
features rpm-native actually requires for correct operation?

p.




