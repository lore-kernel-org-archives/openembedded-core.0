Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYg1K-0007Jv-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:36:26 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYfui-0001Ow-5k
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:29:36 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 15:29:35 +0000
In-Reply-To: <cover.1323246565.git.xiaofeng.yan@windriver.com>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323358176.26081.357.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 00/10]gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 15:36:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 16:58 +0800, Xiaofeng Yan wrote:
> X11 and directfb are exclusive since only one backend is enabled at a
> time. at 3.0 version of gtk they could co-exist by setting
> --enable-x11-backend and --enable-directfb-backend (Thank Phil ). So
> the configuration is either --with-gdktarget=x11 or
> --with-gdktarget=directfb at current version. I will modify
> configuration when gtk is updated to 3.0.  

I guess the other thing to bear in mind about this is that, as of GTK
3.0 or thereabouts, the directfb backend has actually been removed.  So
there probably isn't too much point in planning for the future in that
respect.

p.




