Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qbw1a-0007QB-1b for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:45:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbvxt-0001Dz-TK
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:42:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C71E@shsmsx502.ccr.corp.intel.com>
References: <cover.1309311935.git.mark.hatle@windriver.com>
	<d0bbe06e703f6f9b7d0f38ffc372f3bb1425483a.1309311935.git.mark.hatle@windriver.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C71E@shsmsx502.ccr.corp.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 15:42:03 +0100
Message-ID: <1309358523.2551.45.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] prelink_git.bb: Only block the postinst script when no image-prelink (v2)
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
X-List-Received-Date: Wed, 29 Jun 2011 14:45:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 22:39 +0800, Cui, Dexuan wrote:
> Even if without the patch, we still skip this on the host side -- previously we skipped with "exit 1", and with the patch now we skip with "exit 1" or "exit 0".
> So IMHO looks the patch doesn't actually help? :-)

If the script exits with 0 in offline mode then it won't get rerun at
first boot on the target.  If it exits with 1 then it will.

p.




