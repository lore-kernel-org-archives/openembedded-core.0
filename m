Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbTUE-0006fd-IN
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:17:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 01:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="19145705"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2011 01:13:52 -0700
Message-ID: <4E098D41.4060808@intel.com>
Date: Tue, 28 Jun 2011 16:13:53 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
	<E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>
In-Reply-To: <E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] webkit-gtk: recommends glib-networking to	access https web page
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
X-List-Received-Date: Tue, 28 Jun 2011 08:17:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
>
> Op 28 jun 2011, om 09:42 heeft edwin.zhai@intel.com het volgende 
> geschreven:
>
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > [YOCTO #1037] got fixed
> >
> > Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> > ---
> > meta/recipes-sato/webkit/webkit-gtk_svn.bb |    3 +++
> > 1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb 
> b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> > index 6d134ad..c9ded4e 100644
> > --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> > +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> > @@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = 
> "file://WebCore/rendering/RenderApplet.h;endline=22;md5=fb969
> > DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo 
> libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base 
> flex-native gperf-native perl-native-runtime sqlite3"
>
> > DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ 
> gstreamer flex-native gperf-native perl-native-runtime sqlite3"
>
> >
> > +# To access ssl web pages
> > +RRECOMMENDS_${PN} += "glib-networking"
>
> Since webkit uses soup and curl, wouldn't it be better to add the 
> RRECOMMENDS to soup instead? Webkit knows nothing about GIO.
>

I have considered it. But the drawback is that many other recipes depend 
on libsoup, so glib-networking will be built unnecessarily(webkit-gtk is 
not in core-image-sato). glib-netwoking just provides some plug-in style 
modules, so I think RRECOMMENDS from webkit-gtk should be okay( not 
RDEPENDS).

In future, other recipes besides webkit-gtk may ask for glib-networking, 
maybe we can change it that time?
What's your opinion?


> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


