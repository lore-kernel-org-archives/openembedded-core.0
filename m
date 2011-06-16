Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QX92K-0006ee-QF for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:38:52 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QX8z1-0006QN-Kz
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:35:27 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 16 Jun 2011 10:35:25 +0100
Message-ID: <1308216925.25285.4101.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Thu, 16 Jun 2011 09:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-16 at 17:20 +0800, Dongxiao Xu wrote:
> Enable ofono plugin into sato image.

[...]

> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
>  
>  DEPENDS  = "libgdbus dbus glib-2.0 hal iptables"
> -RDEPENDS_${PN} = "wpa-supplicant resolvconf"
> +RDEPENDS_${PN} = "wpa-supplicant resolvconf ofono"

> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
> @@ -16,14 +16,14 @@ EXTRA_OECONF += "\
>    --disable-udev \
>    --disable-polkit \
>    --enable-client \
> +  --enable-ofono \
>    --prefix=/usr --sysconfdir=/etc --localstatedir=/var"

These changes look like they will have a rather wider impact than just
the sato image.  I'm not sufficiently au fait with connman to say
whether this is a good thing or not (although my immediate reaction to
adding extra RDEPENDS tends to be that it is not), but if they're going
to be added globally then the checkin comment ought to reflect that and
explain why it's being done.  Alternatively, you could do this in your
distro layer and/or image recipes.

p.




