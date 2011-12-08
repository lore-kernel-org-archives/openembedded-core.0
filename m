Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYcAa-0004bK-0e
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 12:29:44 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYc40-0001Di-Lq
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 12:22:56 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 11:22:55 +0000
In-Reply-To: <c551cb2bfe4a077e3fae0946038871527c348503.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<c551cb2bfe4a077e3fae0946038871527c348503.1323327959.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323343376.26081.343.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 09/10] task-core-gtk-directfb.bb: Add task list to run gtk over directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 11:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 17:34 +0800, Xiaofeng Yan wrote:
> +RDEPENDS_${PN}-base = " \
> +		directfb \
> +		directfb-examples \
> +		pango \
> +		pango-modules \
> +		fontconfig \
> +		gtk+ \
> +		gtk-demo \
> +		dropbear \
> +		${TOUCH} \
> +"

That looks like it's going to fail in the presence of library renaming.
And do you really want dropbear in there?

p.



