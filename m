Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjSnM-0005Pe-5x
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:10:20 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjSjQ-00036Q-B6
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:06:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 10:06:15 +0100
In-Reply-To: <040fa1a6589b8fd2c189cc1434b675649791bc05.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<040fa1a6589b8fd2c189cc1434b675649791bc05.1311150183.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311152776.30326.47.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 42/50] pimlico/dates: Fix build on uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 09:10:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 01:28 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> uclibc does not have NL_TIME_FIRST_WEEKDAY
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-sato/pimlico/dates.inc                |    2 +-
>  .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 ++++++++++++++++++++
>  meta/recipes-sato/pimlico/dates_git.bb             |    6 ++-
>  3 files changed, 42 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
> 
> diff --git a/meta/recipes-sato/pimlico/dates.inc b/meta/recipes-sato/pimlico/dates.inc
> index 01ab409..b3be6b6 100644
> --- a/meta/recipes-sato/pimlico/dates.inc
> +++ b/meta/recipes-sato/pimlico/dates.inc
> @@ -8,7 +8,7 @@ SECTION = "x11"
>  DEPENDS = "glib-2.0 gtk+ libglade eds-dbus"
>  RDEPENDS_${PN} = "libedata-cal"
>  
> -inherit autotools pkgconfig gtk-icon-cache
> +inherit autotools gettext pkgconfig gtk-icon-cache

This change isn't mentioned in the commit message.  Is it necessary?

p.




