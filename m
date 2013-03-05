Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UCtTK-0002Z2-2v for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 16:08:13 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UCtDO-0004qs-Oz; Tue, 05 Mar 2013 15:51:38 +0100
Message-ID: <1362495026.22501.129.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Tue, 05 Mar 2013 14:50:26 +0000
In-Reply-To: <1362494304-10179-2-git-send-email-laurentiu.palcu@intel.com>
References: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
	<1362494304-10179-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: rename mesa-dri recipe to just mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 15:08:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-05 at 16:38 +0200, Laurentiu Palcu wrote:
> -# for mesa-dri and mesa-xlib
> +# for mesa and mesa-xlib
>  FILESEXTRAPATHS_append := "${THISDIR}/mesa:"

Presumably you don't need that anymore.

> --- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> -# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
> +# this needs to be lower than -1 because all mesa have -1 and git version has highest PV, but shouldn't be default
>  DEFAULT_PREFERENCE = "-2" 

Is that comment still true?

Also, the commit message for this patch is exceptionally terse.  Please
explain why this renaming is a desirable thing.

thanks

p.




