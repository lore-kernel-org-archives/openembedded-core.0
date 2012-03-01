Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S31bA-0003xY-Do for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 09:42:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q218YN4o012706
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 08:34:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12557-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 08:34:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q218YC7e012700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 08:34:14 GMT
Message-ID: <1330590856.30807.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 08:34:16 +0000
In-Reply-To: <EC0E09A0-582C-4880-8F8F-3799B75024B1@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<b9d93f6158d8768c107501f4c2e481caa02fcd9c.1330587785.git.sgw@linux.intel.com>
	<EC0E09A0-582C-4880-8F8F-3799B75024B1@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/4] self-hosted-image: Create a VMDK image with correct SYSLINUX_* settings
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
X-List-Received-Date: Thu, 01 Mar 2012 08:42:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 09:15 +0100, Koen Kooi wrote:
> Op 1 mrt. 2012, om 08:46 heeft Saul Wold het volgende geschreven:
> 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-core/images/self-hosted-image.bb |   16 ++++++++++++++--
> > 1 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
> > index a0a7592..d56c2cb 100644
> > --- a/meta/recipes-core/images/self-hosted-image.bb
> > +++ b/meta/recipes-core/images/self-hosted-image.bb
> > @@ -1,11 +1,23 @@
> > IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
> > 
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> > +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> > +
> > +PR = "r5"
> 
> AFAICT PR in images does nothing

PR doesn't do anything

> , since they are nostamp.

although with BasicHash, we could change that :)

Cheers,

Richard



