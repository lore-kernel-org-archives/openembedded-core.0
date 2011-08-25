Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwP45-0002pC-0T for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 03:49:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1iFQU025843
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 02:44:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25638-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 02:44:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1i3n6025837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 02:44:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E5472B2.5050402@linux.intel.com>
References: <1313597872-9029-1-git-send-email-raj.khem@gmail.com>
	<4E5472B2.5050402@linux.intel.com>
Date: Wed, 24 Aug 2011 18:44:01 -0700
Message-ID: <1314236641.5939.171.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] recipes: Delete patch=1, its default and replace pnum with striplevel
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
X-List-Received-Date: Thu, 25 Aug 2011 01:49:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-23 at 20:40 -0700, Saul Wold wrote:
> On 08/17/2011 09:17 AM, Khem Raj wrote:
> > Some place pnum=1 is used which is removed as well since
> > striplevel=1 is default
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > ---
> >   .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    4 +-
[...]
> > -           file://configuretweak.patch;patch=1 \
> > -           file://nolibtool.patch;patch=1"
> > +           file://configuretweak.patch \
> > +           file://nolibtool.patch"
> >
> >   SRC_URI[md5sum] = "ddf02f4e1d2dc30f76734df806e613eb"
> >   SRC_URI[sha256sum] = "a9ba089cc2c6d26d266bad492de31cadaeb878dea858e22ae3196091718f284b"
> 
> Thanks for the heavy lift on these!
> 
> Merged into OE-Core

When replying with a couple of lines to a significantly sized patch like
this could you trim it a bit in future please? :)

Cheers,

Richard



