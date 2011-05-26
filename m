Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPa0v-0001gg-QJ for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:50:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPZxz-0005Xi-LF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:47:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F232DBFB10B@shsmsx502.ccr.corp.intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
	<a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
	<1306411147.2525.326.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F232DBFB10B@shsmsx502.ccr.corp.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 13:47:06 +0100
Message-ID: <1306414026.2525.337.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 12:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 20:43 +0800, Lu, Lianhao wrote:
> The problem is that in OE-core the default -deb/-dbg packages are all
> using EXTENDPV, as well as some other recipes. Do you mean we should
> make them all using EXTENDPKGV instead of EXTENDPV?

As far as I can tell, yes, that would be the right thing to do.  That's
what I was thinking of when I mentioned the "couple of uses" before.
The only reason I hesitate is that, although the current behaviour looks
like it should be wrong, nobody has actually complained about it and
that makes me wonder if I have misunderstood something.

I guess someone needs to do a few tests to figure out what exactly is
going on there.  But I am fairly sure that creating a hybrid PV+PKGR is
not a good thing to do; it should be either one thing or the other, and
as far as I know everything on the output side should be using PKGxx.

p.




