Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMGl2-00079O-MK for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:40:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9bBHe005023
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:37:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31622-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:37:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9b4iq005005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:37:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E79027E3-2F0B-40DF-8798-6AF5D6C3E4E8@dominion.thruhere.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<1305587619.3424.134.camel@rex>
	<E79027E3-2F0B-40DF-8798-6AF5D6C3E4E8@dominion.thruhere.net>
Date: Tue, 17 May 2011 10:37:02 +0100
Message-ID: <1305625022.3424.210.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate breakage with multimachine
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
X-List-Received-Date: Tue, 17 May 2011 09:40:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 08:34 +0200, Koen Kooi wrote:
> Thanks for looking into this! For the time being I'll work around it with:
> 
> oen@dominion:/OE/tentacle/sources/meta-angstrom$ git diff conf/distro/
> diff --git a/conf/distro/include/angstrom-core-tweaks.inc b/conf/distro/include/angstrom-core-tweaks.inc
> index e4bd798..fe9225c 100644
> --- a/conf/distro/include/angstrom-core-tweaks.inc
> +++ b/conf/distro/include/angstrom-core-tweaks.inc
> @@ -18,6 +18,11 @@ STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}-${TCLIBC}"
> +# Work around multimachine breakage
> +# See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/002535.html
> +
> +LICENSE_DIRECTORY = "${DEPLOY_DIR}/licenses"
> 
> I think that's a better place to stash those licenses, since we drop images in DEPLOY/image, sources in DEPLOY/sources and sdks in DEPLOY/sdk so DEPLOY/licenses makes sense.
> 
> Do you want me to send a patch to license.bbclass for this?

Yes please.

Cheers,

Richard



