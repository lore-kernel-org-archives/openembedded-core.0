Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8Aap-0004jh-H6 for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:47:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QCmQQB021013 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:48:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QF2e5WXYytGo
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:48:26 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QCmKCW021005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:48:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 13:41:57 +0100
In-Reply-To: <j5pq7d$epu$1@dough.gmane.org>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<j5pq7d$epu$1@dough.gmane.org>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317040924.26109.33.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 01/10] default-provider: also define a default provider for gconf-native
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
X-List-Received-Date: Mon, 26 Sep 2011 12:47:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 16:11 +0400, Dmitry Eremin-Solenikov wrote:
> Please delay this patch for a while.

Too late :(.

>  Now I get the following warning in 
> my build logs (If someone can tell me where the problem lies, that would 
> help).
> 
> ERROR: Trying to resolve runtime dependency gconf resulted in 
> conflicting PREFERRED_PROVIDER entries being found.
> The providers found were: 
> ['/home/users/mitya/OE/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf-dbus_705.bb', 
> 'virtual:native:/home/users/mitya/OE/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf-dbus_705.bb']
> The PREFERRED_PROVIDER entries resulting in this conflict were: 
> ['PREFERRED_PROVIDER_gconf = gconf-dbus', 
> 'PREFERRED_PROVIDER_gconf-native = gconf-dbus-native']
> NOTE: multiple providers are available for runtime gconf 
> (gconf-dbus-native, gconf-dbus, gconf)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match gconf

This asks the question why is gconf-dbus-native providing "gconf" and
not "gconf-native"?

Cheers,

Richard



