Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TB4Cp-0005kp-Ax
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 15:39:15 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TB3u5-0008FT-Ud; Mon, 10 Sep 2012 15:19:54 +0200
From: Phil Blundell <philb@gnu.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Mon, 10 Sep 2012 14:19:53 +0100
In-Reply-To: <1346924974-13859-1-git-send-email-constantinx.musca@intel.com>
References: <1346924974-13859-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347283193.2673.240.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] automake 1.12.3: fix warnings
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
X-List-Received-Date: Mon, 10 Sep 2012 13:39:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-06 at 12:49 +0300, Constantin Musca wrote:
> +++ b/meta/recipes-devtools/automake/automake/no-configure.in-warn.patch
> @@ -0,0 +1,19 @@
> +Don't show a warning if configure.in exists
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +--- a/lib/Automake/Configure_ac.pm
> ++++ b/lib/Automake/Configure_ac.pm
> +@@ -77,8 +77,8 @@ sub find_configure_ac (;@)
> + 
> +   if (-f $configure_in)
> +     {
> +-      msg ('obsolete', "autoconf input should be named 'configure.ac'," .
> +-                       " not 'configure.in'");
> ++#      msg ('obsolete', "autoconf input should be named 'configure.ac'," .
> ++#                       " not 'configure.in'");

Why is this change "embedded specific"?

p.




