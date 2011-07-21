Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qjvjv-0008Eg-Ce
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:04:43 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qjvfq-0004LN-JD
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:00:34 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 17:00:29 +0100
In-Reply-To: <3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
	<3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311264030.30326.140.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Thu, 21 Jul 2011 16:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 02:29 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Could you add some text to the commit message explaining what the
compilation issue was and under what circumstances it occurred?  It
might also be good to know why bumping PR isn't necessary.

Also:

> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> index a2e609f..7d095c1 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> @@ -19,4 +19,3 @@ SRC_URI[md5sum] = "789e7520f71c6a4bf08bc683ec764d24"
>  SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
>  
>  BBCLASSEXTEND = "native"
> -

... I guess this part of the patch can be omitted.

p.




