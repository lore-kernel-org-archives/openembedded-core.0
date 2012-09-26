Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGt37-0003QT-La
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:57:17 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGsqj-0006Ua-BD; Wed, 26 Sep 2012 16:44:29 +0200
From: Phil Blundell <philb@gnu.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 15:44:28 +0100
In-Reply-To: <CAJTo0LZonQKrz+cR_qAE8p8qhaL17o9fmqOyw5+1fzuFnO_e0A@mail.gmail.com>
References: <1348663741.31293.114.camel@phil-desktop>
	<CAJTo0La28g_t84Ku+LbLKLVfwyRL-KuCpq3GuYWxLbnu4-NYkg@mail.gmail.com>
	<1348669724.31293.117.camel@phil-desktop>
	<CAJTo0LZonQKrz+cR_qAE8p8qhaL17o9fmqOyw5+1fzuFnO_e0A@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348670669.31293.119.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 15:39 +0100, Burton, Ross wrote:
> On 26 September 2012 15:28, Phil Blundell <philb@gnu.org> wrote:
> > Which patches were you thinking of specifically?  I don't think there
> > are many that we apply which are actually related to cross-compiling.
> 
> no-libelf and no-dbus.
> 
> Looking at the patches we are carrying, it's quite comic.  Two patches
> which are carried with no understanding of why...

no-dbus isn't anything to do with cross-compiling as such, it's to avoid
an extra build dependency on dbus.  I've no idea what exactly no-libelf
is trying to accomplish though it does also look like it's intended to
prevent an extra library dependency.

p.




