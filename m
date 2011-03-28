Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Q4GlI-000742-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 20:01:56 +0200
Received: (qmail invoked by alias); 28 Mar 2011 17:52:57 -0000
Received: from p5B0A3B51.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.59.81]
	by mail.gmx.net (mp059) with SMTP; 28 Mar 2011 19:52:57 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18Hr0ch7IUHb89fSLBGYtkBpqWXGr58nH1qqRzUj/
	tWbO7TU73nGuDu
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2011 19:44:03 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <cover.1301322225.git.josh@linux.intel.com>
In-Reply-To: <cover.1301322225.git.josh@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201103281944.03722.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 0/4] Recipes for Clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 18:01:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 28 March 2011 16:28:23 Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> The attached series of patches adds recipes for Clutter 1.6 and versions of
> clutter-box2d and clutter-gst which build against it.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: josh/clutter
>   Browse:
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh
> /clutter
> 
> Thanks,
>     Joshua Lock <josh@linux.intel.com>
> ---
> 
> 
> Joshua Lock (4):
>   clutter: add 1.6.8
>   clutter-gst: add 1.3.6 for use with clutter 1.6
>   clutter-box2d: add version 0.10.0 for use with clutter 1.6
>   clutter-gtk: remove duplicate gtk+ DEPENDS entry
> 
>  meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |   25
> +++++++++++++++++ .../clutter/clutter-box2d-1.6_0.10.0.bb            |  
> 20 ++++++++++++++ meta/recipes-graphics/clutter/clutter-box2d.inc    |   
> 4 +-
>  .../clutter-box2d/fix-disable-introspection.patch  |   28
> ++++++++++++++++++++ meta/recipes-graphics/clutter/clutter-box2d_git.bb | 
>   2 +-
>  .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 +++++++++++
>  meta/recipes-graphics/clutter/clutter-gst.inc      |    3 +-
>  .../clutter/clutter-gtk-1.4_git.bb                 |    2 +-
>  8 files changed, 95 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
>  create mode 100644
> meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb create mode
> 100644
> meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patc
> h create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
Is version in recipe name really required (it clutters all the dependent 
recipes)?

Andreas


