Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBgoM-0002Wi-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 08:52:35 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBgcH-0000rw-3Z; Wed, 12 Sep 2012 08:40:05 +0200
Message-ID: <1347431877.29443.95.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 07:37:57 +0100
In-Reply-To: <1347429555-32159-3-git-send-email-raj.khem@gmail.com>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347429555-32159-3-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc
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
X-List-Received-Date: Wed, 12 Sep 2012 06:52:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 22:59 -0700, Khem Raj wrote:
> This patch is causing systemd based systemd to not boot
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>  ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 ++++++++++++++++++++
>  2 files changed, 324 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
> 
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index eec4ded..4da9c58 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -1,9 +1,9 @@
> -SRCREV="555ae2e88cd16a83f854634b6c3f35715b11d3d4"
> +SRCREV="cb43f2afba0633400387fa7c55dda3396517f58a"

Why are you changing SRCREV as well?

p.




