Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm0mT-0005Jl-7h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:51:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm0iP-000231-9R
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:47:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 10:47:44 +0100
In-Reply-To: <7f9b1ed3edb4bd9e8e23e6d191248a0c28d924e6.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<7f9b1ed3edb4bd9e8e23e6d191248a0c28d924e6.1311752531.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311760065.30326.278.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [Consolidated & Tested 27/35] siteinfo: Move the rp-pppoe entry to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 09:51:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
> --- a/meta/site/common-linux
> +++ b/meta/site/common-linux
> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
>  # mysql
>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> +
> +# rp-pppoe
> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}

Per previous discussion, I am pretty sure this is wrong.

p.




