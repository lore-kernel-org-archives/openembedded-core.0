Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RO5bd-0005jG-Aa for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:42:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9AZsVg014362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 10:35:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13639-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 10:35:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9AZjHR014356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 10:35:46 GMT
Message-ID: <1320834947.10843.161.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 10:35:47 +0000
In-Reply-To: <0A7ED8DD-40A2-4E01-90A1-B2BB9849E500@dominion.thruhere.net>
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
	<8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
	<1320831447.10843.131.camel@ted>
	<0A7ED8DD-40A2-4E01-90A1-B2BB9849E500@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Wed, 09 Nov 2011 10:42:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 11:27 +0100, Koen Kooi wrote:
> Op 9 nov. 2011, om 10:37 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-11-09 at 10:27 +0100, Koen Kooi wrote:
> >> Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:
> >> 
> >>> This patch pulls in the gnome related classes from oe-core which
> >>> adds extra packaging rules and functionality whilst modularising things
> >>> so that one can get a subset of gnome functionality without adding a lot
> >>> of extra dependencies.
> >>> 
> >>> These aren't an exact copy of the classes from meta-openembedded, notable
> >>> differences are:
> >>> * gnome.bbclass - I dropped the BBCLASSEXTEND
> >> 
> >> It looks that will break a number of things in meta-oe, why was it dropped?
> > 
> > Unconditionally BBCLASSEXTENDing everything gnome is a great way to hack
> > around build issues and create a convoluted dependency mess that isn't
> > really required. I'd much rather we try and minimise the amount of
> > -native dependencies to those actually needed.
> > 
> > Comparing our builds against other systems its becoming clear our
> > convoluted dependency trees are one of the areas we don't do as well and
> > it hurts performance :(.
> 
> The list of -native needed in meta-gnome:
> 
> bison-native
> cairo-native
> docbook-utils-native
> flex-native
> gconf-native
> gdk-pixbuf-native
> glib-2.0-native
> gnome-doc-utils-native
> gobject-introspection-native
> gtk-doc-native
> icon-naming-utils-native
> intltool-native
> libffi-native
> libidl-native
> libxml-parser-perl-native
> orbit2-native
> pango-native
> perl-native
> popt-native
> python-native

Many of which are not gnome bbclass derived recipes. I therefore think
it makes sense to put the BBCLASSEXTEND in the recipes where its needed
and not the core class...

Cheers,

Richard



