Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RAk7J-0002kC-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:07:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RAk1z-0008Ck-0C
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:02:11 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 16:02:10 +0100
In-Reply-To: <3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317654131.13337.6.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Mon, 03 Oct 2011 15:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Can you add some commentary explaining why this is necessary -- i.e.
what exactly is lacking in uClibc to mean it doesn't have "prober TLS
support"?

p.

On Mon, 2011-10-03 at 15:28 +0200, Martin Jansa wrote:
> * it's in .bbclass instead of .inc because it's used by mesa and
>   xserver-xf86 recipes
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/glx-use-tls.bbclass |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/glx-use-tls.bbclass
> 
> diff --git a/meta/classes/glx-use-tls.bbclass b/meta/classes/glx-use-tls.bbclass
> new file mode 100644
> index 0000000..7530872
> --- /dev/null
> +++ b/meta/classes/glx-use-tls.bbclass
> @@ -0,0 +1,7 @@
> +def get_tls_setting(bb, d):
> +    # until we have no prober TLS support in uclibc disable it
> +    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
> +        return ""
> +    return "--enable-glx-tls"
> +
> +EXTRA_OECONF += "${@get_tls_setting(bb, d)}"




