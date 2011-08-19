Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuLfv-0004Hm-Lf
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 11:47:39 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QuLbR-0001v7-Ay
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 11:43:01 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 10:43:00 +0100
In-Reply-To: <e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313746981.6733.268.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
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
X-List-Received-Date: Fri, 19 Aug 2011 09:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 01:20 -0400, Bruce Ashfield wrote:
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> index 44f1ebe..5d9871f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -11,7 +11,7 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
>  KBRANCH = ${KMACHINE}
>  KMETA = meta
>  
> -LINUX_VERSION ?= "3.0.1"
> +LINUX_VERSION ?= "3.0"
>  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
>  
>  SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"

That's going to cause PV to go backwards, right?  If you're going to do
that then you probably ought to consider bumping PE to retain
monotonicity.

p.




