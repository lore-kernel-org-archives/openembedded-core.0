Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RaVJa-0001XI-DU
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:34:50 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RaVCu-0001Zw-V9
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:27:57 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 16:27:56 +0000
In-Reply-To: <1323793193-31090-5-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323793676.24417.165.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 5/9] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Tue, 13 Dec 2011 16:34:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> +def packages_qa_unshipped_files(d):
> +    skip = (d.getVar('INSANE_SKIP_${PN}', True) or "").split()
> +    if "unshipped" in skip:
> +        return False

	[...]

> +    if not packages_qa_unshipped_files(d):
> +        shipped_sane = False
>  
> -    if not walk_sane or not rdepends_sane:
> +    if not walk_sane or not rdepends_sane or not shipped_sane:
>          bb.fatal("QA run found fatal errors. Please consider fixing them.")

Is that really what you want?

p.




