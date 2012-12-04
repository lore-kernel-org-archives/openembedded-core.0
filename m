Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TfqLj-0002y1-3Q
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 12:07:39 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Tfq7q-0007HF-PV; Tue, 04 Dec 2012 11:53:18 +0100
From: Phil Blundell <philb@gnu.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 04 Dec 2012 10:53:17 +0000
In-Reply-To: <50BDC8E4.1010303@linaro.org>
References: <50B744CC.4050906@linaro.org> <50BDC8E4.1010303@linaro.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1354618398.23886.217.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patching eglibc for AArch64
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
X-List-Received-Date: Tue, 04 Dec 2012 11:07:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 10:56 +0100, Marcin Juszkiewicz wrote:
> W dniu 29.11.2012 12:19, Marcin Juszkiewicz pisze:
> > I would like to merge AArch64 eglibc support into OE-Core. As patch is
> > nearly 0.5MB I provide it in hrw/aarch64-support branch:
> > 
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=hrw/aarch64-support&id=aaa36e3ae6ff39682555ac6f21384b44d6f631e3
> > 
> > Commit adds two patches which add AArch64 support for 2.16 version of
> > eglibc. Both were merged upstream but with some alterations to fit into
> > trunk properly. As such trunk patches depend on other patches which can
> > alter state of other architectures which I prefer to avoid.
> > 
> > At Linaro we do daily builds of minimal, lamp, sdk images with this patch.
> 
> ping?

Rather than importing a huge patch, can we not just provide a recipe for
eglibc trunk?  Or wait for a 2.17 release and roll it in then.

p.




