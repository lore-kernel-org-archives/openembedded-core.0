Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm0jB-0005GT-Ut
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:48:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm0f7-00022u-Vi
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:44:22 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 10:44:21 +0100
In-Reply-To: <4adc1ac758823bf95ef5259ecf90a7906b38afc9.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<4adc1ac758823bf95ef5259ecf90a7906b38afc9.1311752531.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311759861.30326.276.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [Consolidated & Tested 24/35] siteinfo: Move certain bash entries to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 09:48:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index 5d3e68a..39eb30b 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
>  
>  # bash
>  ac_cv_c_long_double=${ac_cv_c_long_double=yes}
> -bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
>  bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}

That sigsetjmp thing looks pretty bogus to me.  sigsetjmp() is POSIX.1;
it isn't (shouldn't be) architecture specific in any way, and both
eglibc and uclibc implement it nowadays.  I think you should probably
have sigsetjmp=present in linux-common.

p.




