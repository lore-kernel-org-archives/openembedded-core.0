Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOsSA-0000P1-IO for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:19:22 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QOsPB-0002PV-HG; Tue, 24 May 2011 16:16:17 +0200
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1306246336.3424.929.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
	<1305805268.18415.185.camel@lenovo.internal.reciva.com>
	<1305807396.3424.510.camel@rex>
	<1305817446.18415.193.camel@lenovo.internal.reciva.com>
	<1305817704.3424.531.camel@rex>
	<1306245557.2525.192.camel@phil-desktop>
	<1306246336.3424.929.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 15:16:16 +0100
Message-ID: <1306246576.2525.194.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Tue, 24 May 2011 14:19:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 15:12 +0100, Richard Purdie wrote:
> I think allowing selection of this at image generation time is the more
> powerful way to handle this. It could be we go through a step of
> forcibly removing packages we don't want from the rootfs such as
> update-rc.d, or we can tell the package manager to ignore the dependency
> which is probably neater.
> 
> I have to admit the update-rc.d change was concerning and this does feel
> like a better way to handle it.

Yeah.  The downside to this is that it will require extra
package-manager-specific hackery in each of the rootfs backends, since
there isn't any portable way to either forcibly remove a package or to
get a dependency disregarded.  But I guess I can make it work for ipkg
easily enough and we can worry about the others later.

p.




