Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RAl1q-0003tI-5H
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 18:06:06 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RAkwV-0008Gh-Vk
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 18:00:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 17:00:35 +0100
In-Reply-To: <7a380e5d1538c175e164b2d249d182c723fcda15.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<7a380e5d1538c175e164b2d249d182c723fcda15.1317648040.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317657635.13337.10.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCHv2 04/30] xf86-video-omapfb: bump SRCREV and add patch from meta-oe
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
X-List-Received-Date: Mon, 03 Oct 2011 16:06:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 15:28 +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---

This is a bit of a lame checkin message.  "Add patch from meta-oe"
doesn't really say anything useful about what you're changing, and there
is no long comment at all.  Also ...

>@@ -1,25 +1,25 @@
>-require xorg-driver-driver.inc
>+require xorg-driver-video.inc
> 
> SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
>
> DESCRIPTION = "omapfb driver supports the basic Texas Instruments OMAP \
> framebuffer."
>
>-LICENSE = "MIT-X"
>-LIC_FILES_CHKSUM = "file://src/omapfb-driver.c;beginline=1;endline=30;md5=a44c2a37e04d1c2c5f0313afb493f833"
>+LICENSE = "MIT-X & GPLv2+"
>+LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
> DEPENDS += "virtual/libx11"

... these changes don't seem to be covered by the description above.

And, finally, if this is an OMAP-specific driver, why is it in oe-core
in the first place?  I would have thought it would be better placed in
meta-ti or some such layer.

p.



