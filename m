Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnvRl-0007Xc-1L
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:34:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QnvNb-0001z5-2u
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:30:11 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 17:30:10 +0100
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
	<e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312216211.30326.537.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/8] multilib: Add support for compiling recipes against multiple ABIs
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
X-List-Received-Date: Mon, 01 Aug 2011 16:34:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 22:53 +0100, Richard Purdie wrote:
> +MULTILIBS ??= "multilib:lib32"
> +BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-eglibc = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-libgcc = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-libtool-cross = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-binutils-cross = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-busybox = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gettext = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-ncurses = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-expat = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"

What's the significance of this set of package names?  I couldn't
immediately spot an obvious reason why these particular recipes were
getting special treatment.
 
It seems particularly weird to have update-rc.d in there since that is
an allarch recipe and (one hopes) isn't going to change much under
multilib.

p.




