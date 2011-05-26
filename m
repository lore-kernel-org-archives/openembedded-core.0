Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPXeP-0004nK-2q for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 12:18:45 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPXbT-0005UI-Oe
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 12:15:43 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinUDhgtYgShemq_3vNuTHkOuCWdug@mail.gmail.com>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306364520.27470.81.camel@rex>
	<BANLkTinUDhgtYgShemq_3vNuTHkOuCWdug@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 11:15:42 +0100
Message-ID: <1306404942.2525.299.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: RDEPENDS_${PN} and virtclass-native
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
X-List-Received-Date: Thu, 26 May 2011 10:18:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 16:08 -0700, Khem Raj wrote:
> while we are talking about fixing native.bbclass on a different
> tangent. I think overrides is another thing we need to fix
> specially libc overrides. When a recipe inherits
> native,cross, or nativesdk then we have to change
> the libc override to be always libc-glibc (unless one
> is building on a box which is running uclibc)

Just forcing "libc-glibc" on for native packages doesn't seem like the
right answer.  As well as the (perhaps unlikely) situation where the
build host is running uclibc, it might be a Darwin or Cygwin host which
doesn't use glibc at all.

I guess this is another reason why libc-* overrides should be used
sparingly :-}

p.




