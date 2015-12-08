Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2493660110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 17:51:57 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1a6MQe-0001bn-H2; Tue, 08 Dec 2015 18:51:56 +0100
Message-ID: <1449597115.1472.179.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 08 Dec 2015 17:51:55 +0000
In-Reply-To: <56670658.3070109@gmail.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-2-git-send-email-akuster808@gmail.com>
	<56670658.3070109@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 1/2] ldconfig: add method to extend ldconfig search dirs
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
X-List-Received-Date: Tue, 08 Dec 2015 17:52:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-08 at 08:33 -0800, akuster808 wrote:
> ping
> 
> On 11/11/2015 09:41 AM, Armin Kuster wrote:
> > From: Armin Kuster <akuster@mvista.com>
> > 
> > this provides a method to extend the search path ldconfig-native
> > uses when creating ls.so.cache.
> > 
> > To enable in recipe:
> > 
> > add:
> > inherit ldconfig
> > 
> > LDSOCONF = "/opt/lib"
> > 
> > this will create a ld.so.conf file in work-shared/ldconfig/${PN}/
> > 
> > to create an image with these new search paths included, add to
> > local.conf:
> > 
> > INHERIT += "image-ldconfig"
> > 
> > this will take all the ${PN}/ld.so.conf files and create a single
> > ld.so.conf
> > that will be used by ldconfig-native when building an image.

The problem that you're solving here seems like fundamentally a distro
one.  I remain slightly sceptical that the whole concept of ldconfig
makes a lot of sense for the majority of oe-core users and, for those
for whom it does, I don't entirely understand why it doesn't suffice to
have the packages with unusual requirements install an appropriate file
in /etc/ld.so.conf.d/ and the distro arrange for /etc/ld.so.conf to
include all of those.

So, can you provide a bit more explanation as to why this patch is a
good thing?

p.


