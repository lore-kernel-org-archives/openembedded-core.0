Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuhOf-0003l2-VX
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 10:59:18 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QuhKA-0003U0-JH
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 10:54:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <512d2bd7cc7ad38f24b57fd8e0a73c8906cb4273.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<512d2bd7cc7ad38f24b57fd8e0a73c8906cb4273.1313816148.git.otavio@ossystems.com.br>
Date: Sat, 20 Aug 2011 09:54:30 +0100
Message-ID: <1313830470.24904.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 7/8] scripts/runqemu: remove redundant checking
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
X-List-Received-Date: Sat, 20 Aug 2011 08:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-20 at 04:58 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  scripts/runqemu |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 91c3c9e..d617f79 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -163,7 +163,7 @@ while [ $i -le $# ]; do
>              # A directory name is an nfs rootfs
>              if [ -d "$arg" ]; then
>                  echo "Assuming $arg is an nfs rootfs"
> -                if [[ -z "$FSTYPE" || "$FSTYPE" == "nfs" ]]; then
> +                if [[ -z "$FSTYPE" ]]; then
>                      FSTYPE=nfs
>                  else
>                      echo "Error: conflicting FSTYPE types [$arg] and nfs"

Can you explain why this test is redundant?  From inspection of the
patch it seems this would lead to "Error: conflicting FSTYPE types [nfs]
and nfs" if FSTYPE="nfs" to begin with.  I guess there is some other
provision in the logic to make sure that this can't happen, but it would
be useful to have it explained in the checkin message.

p.




