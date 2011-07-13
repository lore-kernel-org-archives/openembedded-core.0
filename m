Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qgxuv-0004qS-Mw
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:47:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qgxr7-0004V8-NJ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:43:53 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 12:43:52 +0100
In-Reply-To: <880e54c243ee3547d1eb3c566bd9fba17e87013b.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
	<880e54c243ee3547d1eb3c566bd9fba17e87013b.1310541680.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310557433.2378.8.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH V2 21/25] gcc: Use bitbake default FILES for packaging
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
X-List-Received-Date: Wed, 13 Jul 2011 11:47:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 00:33 -0700, Saul Wold wrote:
> This will ensure correct -dev and -staticdev packging

[...]

> +FILES_libgfortran-dev = "${libdir}/libgfortran.so"
> +FILES_libgfortran-staticdev = " \
>    ${libdir}/libgfortran.a \
> -  ${libdir}/libgfortran.so \
>    ${libdir}/libgfortranbegin.a"

Are you sure that's right?  I would have expected libgfortranbegin.a to
go into -dev not -staticdev.

p.




