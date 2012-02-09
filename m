Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RvYwF-0005Ep-1g
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:41:47 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RvYoS-0005D2-CN
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:33:44 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 Feb 2012 18:33:43 +0000
In-Reply-To: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
References: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328812424.14363.74.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 20:30 +0200, Andrei Gherzan wrote:
> +	# Moving libcrypto to /usr
> +	mkdir -p ${D}/${base_libdir}/
> +	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/

That looks like it will fail if ${libdir} and ${base_libdir} are the
same.

> +	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc

Also, this seems like it might fail if ${prefix} was set to something
other than "/usr".  

Do you really want to put the development files in ${base_libdir}
anyway?  I would have thought that even the most enthusiastic proponents
of a standalone / would not expect to be able to use the compiler
without /usr mounted.

p.




