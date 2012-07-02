Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SlnOD-0004CQ-Fj
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:38:33 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SlnDa-0000iR-Kv
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:27:34 +0200
Message-ID: <1341260763.2886.34.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 21:26:03 +0100
In-Reply-To: <3112d19714501de42e197c3e05247065bbfea57a.1341015667.git.mark.hatle@windriver.com>
References: <cover.1341015667.git.mark.hatle@windriver.com>
	<3112d19714501de42e197c3e05247065bbfea57a.1341015667.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libc-common: Allow debug package to append, not set depends
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
X-List-Received-Date: Mon, 02 Jul 2012 20:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-29 at 19:22 -0500, Mark Hatle wrote:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

This patch has no checkin message (other than the subject line) which is
contrary to our fine guidelines.  What bug is this fixing?

Also, the subject line talks about "depends" but the patch actually
modifies the way that RPROVIDES/RCONFLICTS/RREPLACES are set and I'm not
sure that most people would class those as "depends".

p.
 
> ---
>  meta/classes/libc-common.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
> index 9b91f0a..8145d64 100644
> --- a/meta/classes/libc-common.bbclass
> +++ b/meta/classes/libc-common.bbclass
> @@ -29,7 +29,7 @@ python populate_packages_prepend () {
>  		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
>  		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
>  		# For backward compatibility with old -dbg package
> -		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
> -		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
> -		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
> +		d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
> +		d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
> +		d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
>  }




