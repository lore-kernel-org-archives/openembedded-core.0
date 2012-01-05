Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RilOV-0008Fq-Sb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 12:22:03 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RilHP-00038x-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 12:14:43 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 11:14:36 +0000
In-Reply-To: <8c450c324f85d4b061c6a5704f418b8512de078c.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<8c450c324f85d4b061c6a5704f418b8512de078c.1325744640.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325762083.28005.99.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 26/28] matchbox-wm: Remove x-session-manager handling
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
X-List-Received-Date: Thu, 05 Jan 2012 11:22:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 22:30 -0800, Saul Wold wrote:
> diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> index 3818d16..9818650 100644
> --- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> +++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> @@ -16,7 +16,7 @@ inherit update-alternatives
>  ALTERNATIVE_NAME = "x-session-manager"
>  ALTERNATIVE_LINK = "${bindir}/x-session-manager"
>  ALTERNATIVE_PATH = "${bindir}/mini-x-session"
> -ALTERNATIVE_PRIORITY = "10"
> +ALTERNATIVE_PRIORITY = "50"
>  
>  do_install() {
>  	install -d ${D}/${bindir}

This change is not mentioned in the commit summary line.  It isn't at
all obvious to me that this particular change is actually a desirable
one but, if it is, it belongs in a separate patch rather than being
jammed in with the matchbox-wm stuff.

p.




