Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QyK5q-0004HI-TG
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 10:54:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QyK1A-0004Xy-77
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 10:50:00 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 09:49:59 +0100
In-Reply-To: <CAP9ODKoi8==q2w__QkHm_PhkC-iWYnS5MCA5F+W_SdsTTXuBjQ@mail.gmail.com>
References: <CAP9ODKoi8==q2w__QkHm_PhkC-iWYnS5MCA5F+W_SdsTTXuBjQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314694200.19905.105.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Fail to build of clutter
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
X-List-Received-Date: Tue, 30 Aug 2011 08:54:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-30 at 00:42 -0300, Otavio Salvador wrote:
> Hello,
> 
> With today's tip of OpenEmbedded-Core, Clutter fails to build as can
> be seen bellow:
> 
> 
> | checking for CLUTTER_DEPS... no
> | configure: error: Package requirements (cairo-gobject >= 1.10 atk >=
> 1.17 pangocairo >= 1.20 json-glib-1.0 >= 0.12.0 gdk-pixbuf-2.0 >= 2.0
> gl libdrm x11 xext xfixes >= 3 xdamage xcomposite >= 0.4 xi) were not
> met:
> |
> | Requested 'json-glib-1.0 >= 0.12.0' but version of JSON-GLib is 0.10.4

It sounds as though you have picked up an erroneous version of json-glib
from somewhere, maybe meta-oe.  The version in oe-core does appear to be
0.12.4 and I'm not seeing that failure in my builds.

Did this just stop working for you recently, or is this the first time
you tried to build it?

p.




