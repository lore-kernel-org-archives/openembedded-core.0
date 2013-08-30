Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 503A26BD87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 15:00:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7UFCXxW005764; Fri, 30 Aug 2013 16:12:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lrAWpd3qJxBI; Fri, 30 Aug 2013 16:12:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7UFCRsX005754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 30 Aug 2013 16:12:29 +0100
Message-ID: <1377874783.1059.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 30 Aug 2013 15:59:43 +0100
In-Reply-To: <521F898F.1060209@linux.intel.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
	<521F898F.1060209@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCH 17/20] librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2013 15:00:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-29 at 10:49 -0700, Saul Wold wrote:
> On 08/29/2013 09:03 AM, Martin Jansa wrote:
> > * without gtk+ or gdk-pixbuf available it gets disabled even with --enable-pixbuf-loader
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > index 4818422..30846bf 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > @@ -29,7 +29,7 @@ PACKAGECONFIG ??= "croco gdkpixbuf"
> >   # Support embedded CSS stylesheets (recommended upstream)
> >   PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
> >   # gdk-pixbuf loader
> > -PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
> > +PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gtk+ gdk-pixbuf"
> 
> I think this needs to be a target only PACKAGECONFIG, as it will try to 
> depend on gtk+-native when building the librsvg-native.

Also do we really need gtk for the pixbuf loader? gtk2 theme engine
pulls in gtk+ elsewhere?

Cheers,

Richard


