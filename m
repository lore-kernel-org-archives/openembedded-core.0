Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sujgm-0004RT-5h for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:30:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCJ87m005970
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:19:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04762-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:19:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCIvBp005964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:18:59 +0100
Message-ID: <1343391537.9574.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:18:57 +0100
In-Reply-To: <20120727114631.GJ3621@jama.jama.net>
References: <1343389394.9574.127.camel@ted>
	<20120727114631.GJ3621@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gobject-introspection: Drop the recipe, it has never worked and if it does cross compile, we can add it back
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
X-List-Received-Date: Fri, 27 Jul 2012 12:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 13:46 +0200, Martin Jansa wrote:
> On Fri, Jul 27, 2012 at 12:43:14PM +0100, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
> > deleted file mode 100644
> > index 8f5ca56..0000000
> > --- a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
> > +++ b/dev/null
> > @@ -1,28 +0,0 @@
> > -# NOTE: WIP! This recipe does not cross-compile atm., only -native
> > -DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
> > -DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
> > -BBCLASSEXTEND = "native"
> 
> 
> what will provide gobject-introspection-native for meta-oe and meta-gnome now?
> 
> Or should we add this recipe back in meta-oe?

Is introspection being used there of do they just want the .m4 file and
disable it?

If the latter, add "gobject-introspection-stub" to DEPENDS and this
should resolve it. See the patches I just sent doing this for OE-Core.

Cheers,

Richard




