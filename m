Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QodJB-0008Nl-LG
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:24:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QodEz-0003ww-Co
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:20:13 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 16:20:12 +0100
In-Reply-To: <1312384532-11310-1-git-send-email-galak@kernel.crashing.org>
References: <1312384532-11310-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312384813.4325.92.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] libnss-mdns: dont use hard coded /lib path
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
X-List-Received-Date: Wed, 03 Aug 2011 15:24:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 10:15 -0500, Kumar Gala wrote:
> -EXTRA_OECONF = "--libdir=/lib --disable-lynx --enable-avahi"
> +EXTRA_OECONF = "--libdir=${libdir} --disable-lynx --enable-avahi"

Really?  ${libdir} is /usr/lib in most configurations.  If you wanted
this to be a no-op for most folks then ${base_libdir} is probably the
variable you need.

p.




