Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RAk0Q-0002dL-3Z
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:00:34 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RAjv4-0008C9-IG
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 16:55:02 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 15:55:01 +0100
In-Reply-To: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
References: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317653702.13337.4.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 15:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 14:58 +0400, Dmitry Eremin-Solenikov wrote:
> My proposal would be to include a special task or a
> do_install_append() part that
> will remove specified .la files. (like ${libdir}/xorg/modules/*/.la,
> ${libdir}/matchbox-panel/*.la, etc.). I see this usually done in
> do_install or in special do_install_append
> parts, but I think it would be better to handle this globally.

I guess the ideal solution would be to find a way to stop libtool from
installing these things in the first place.  It isn't totally obvious to
me that the .la files are a net benefit even for real shared libraries,
and for plugins I think they are probably a net loss in most/all cases.

When this issue last came up it seemed that Richard's preferred fix was
to just ship the .la files in FILES_${PN}-dev, and I guess that approach
does at least have the merit of simplicity.  See:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005533.html

p.




