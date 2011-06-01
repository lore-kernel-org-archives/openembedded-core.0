Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRliM-0007sI-R4 for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:44:02 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRlfK-0001fr-II
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:40:54 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <806387a97c6c01bb724c29f51de511ed43688bb0.1306931848.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<806387a97c6c01bb724c29f51de511ed43688bb0.1306931848.git.dexuan.cui@intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 01 Jun 2011 14:40:53 +0100
Message-ID: <1306935653.2529.88.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC v1 PATCH 01/16] native.bbclass: allow a native package to be populated into its own dir
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
X-List-Received-Date: Wed, 01 Jun 2011 13:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 21:18 +0800, Dexuan Cui wrote:
> +PACKAGE_OWN_DIR = ""
> +bindir .= "${PACKAGE_OWN_DIR}"
> +libdir .= "${PACKAGE_OWN_DIR}"
> +libexecdir .= "${PACKAGE_OWN_DIR}"

I think the general idea of this patch is a good one but I'm not
terribly fond of the name of that variable.  If this is meant to be a
path suffix that you can optionally set for native packages then how
about calling it something like NATIVE_PACKAGE_PATH_SUFFIX?

p.




