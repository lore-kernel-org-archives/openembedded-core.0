Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlNbG-0006NF-Qv
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:01:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlNX9-0000uD-Pq
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:57:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 16:57:30 +0100
In-Reply-To: <c0c3e475a5fe98d61d0b92dca026486b955c2812.1311354521.git.tom_rini@mentor.com>
References: <cover.1311354521.git.tom_rini@mentor.com>
	<c0c3e475a5fe98d61d0b92dca026486b955c2812.1311354521.git.tom_rini@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311609451.30326.244.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/8] siteinfo: Move the rp-pppoe entry to common-linux
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
X-List-Received-Date: Mon, 25 Jul 2011 16:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 10:10 -0700, Tom Rini wrote:
> --- a/meta/site/common-linux
> +++ b/meta/site/common-linux
> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
>  # mysql
>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> +
> +# rp-pppoe
> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}

Is that really correct?  Bitfield packing isn't an OS issue, it's
primarily a question of compiler choice.  For GCC I think it correlates
with endianness; looking at what that test is doing, I'd expect you to
get "reversed" on little-endian and "normal" on big-endian.

p.




