Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rup9B-0003J0-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:48:05 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rup1R-0007la-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:40:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Feb 2012 17:40:04 +0000
In-Reply-To: <1328635982-18444-1-git-send-email-andrei@gherzan.ro>
References: <1328635982-18444-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328636405.14363.32.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 17:48:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-07 at 19:33 +0200, Andrei Gherzan wrote:
> +FILES_${PN} = "/usr/lib/*.so"
> +FILES_${PN}-dev = "/usr/bin/* /usr/include/* /usr/share/aclocal/* /usr/lib/pkgconfig/*"
> +FILES_${PN}-dbg = "/usr/bin/.debug/* /usr/lib/.debug/* /usr/src/debug/*"
> +FILE_${PN}-staticdev= "/usr/lib/*.a"

That all looks rather dubious.  The last line surely isn't accomplishing
anything and I suspect the other three are largely wrong/useless as
well.  What problem were you trying to solve by adding those?

p.





