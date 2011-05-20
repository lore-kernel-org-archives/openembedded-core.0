Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QNJnH-0007yT-NN for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:06:43 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QNJkT-0007sV-FA
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:03:49 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d95f77d22bbe7bf5718516f667b3e1433757c861.1305849572.git.raj.khem@gmail.com>
References: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
	<d95f77d22bbe7bf5718516f667b3e1433757c861.1305849572.git.raj.khem@gmail.com>
Date: Fri, 20 May 2011 08:03:43 +0100
Message-ID: <1305875023.18415.250.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCHv2 2/3] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 07:06:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 17:02 -0700, Khem Raj wrote:
> -DEPENDS = "avahi gtk+"
> +DEPENDS = "avahi"
> +DEPENDS_append-libc-glibc = " gtk+ "

If uclibc is alone in not having this function then it would be better
as:

gtkdepends = "gtk+"
gtkdepends_libc-uclibc = ""
DEPENDS = "avahi ${gtkdepends}"

or some such.

p.




