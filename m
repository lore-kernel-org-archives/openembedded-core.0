Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUuus-0004TK-Vi; Wed, 24 Apr 2013 10:19:12 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3O82NNr013724; Wed, 24 Apr 2013 09:02:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p_MOVgZPL9_z; Wed, 24 Apr 2013 09:02:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3O82GYq013716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 24 Apr 2013 09:02:18 +0100
Message-ID: <1366790466.23738.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Apr 2013 09:01:06 +0100
In-Reply-To: <20130424064319.GD3217@jama>
References: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
	<20130424064319.GD3217@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Wed, 24 Apr 2013 08:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-24 at 08:43 +0200, Martin Jansa wrote:
> On Tue, Apr 23, 2013 at 02:47:56PM -0700, Jeff Osier-Mixon wrote:
> > OpenEmbedded Technical Steering Committee
> > 8 April 2013
> > 
> > b. document whitespace changes to the shell
> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > http://www.openembedded.org/wiki/Styleguide
> > https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
> > => still need to de-dup these, need a volunteer
> > ask for volunteers after 1.4 (jefro)
> 
> Someone probably noticed, but all meta-openembedded layers are now using
> consistent indentation:
> http://git.openembedded.org/meta-openembedded/commit/?id=a45830a39bb47a9eab27980d52966226c9504ea4
> 
> Can we reevaluate decision to keep styleguide promoting different
> indentation for python and shell tasks? Otherwise we should mention
> different rules for oe-core and other layers.

The TSC talked about it and agreed a particular direction. Its clear
that some people don't like the direction so they just ignored it and do
their own thing anyway.

This is the wrong way to go about making decisions and I'm extremely
disappointed people are doing this.

There were specific technical reasons I suggested we not do this. One of
the asks of the Yocto members is some kind of stability, whatever that
is. Whitespace changes like this are *extremely* disruptive to patch
flow. I think its clear there are people out there using older versions
of the codebase yet they pick patches off master and backport them for a
variety of reasons. As soon as you get changes like this involved, it
breaks their ability to do that. With the python change, there was a
good technical reason we did it. Despite that I was personally literally
backed into a corner and shouted at by some rather upset people last
time this happened with the python change. I can see their point too.
For changing shell, we don't have any good technical reason other than
cosmetics. I've made this argument before.

You know what, thanks for the support guys :(

At this point I assume I'm free to ignore the TSC since we now have
precedent for it?

Richard




