Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QX98c-0006kT-15 for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:45:22 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QX95I-0006Qm-TS
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:41:57 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTikCyjfiANSyxgtwyt5vH6f2LjN7iQ@mail.gmail.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<24c31ebbed038d3dda2e9a0a97bcd9fe4fe89a8d.1308215406.git.dongxiao.xu@intel.com>
	<BANLkTikCyjfiANSyxgtwyt5vH6f2LjN7iQ@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 16 Jun 2011 10:41:55 +0100
Message-ID: <1308217315.25285.4116.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 6/6] initscript: Change some order of init scripts
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
X-List-Received-Date: Thu, 16 Jun 2011 09:45:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-16 at 11:38 +0200, Andrea Adami wrote:
> There was a drawback doing that: kernel modules loaded in unpredictable order:
> 
> http://patches.openembedded.org/patch/1917/
> 
> Is that still an issue?

I tend to think that anything which relies on the order of module
loading is probably broken.  Was it just this rtc thing that was
affected or were there other problems?

p.




