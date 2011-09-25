Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7sG8-0004Ts-Om for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 19:12:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHDpjR019292 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:13:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BnOeumy-NBqi
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:13:51 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PHDjwM019287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 18:13:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 18:07:22 +0100
In-Reply-To: <1316960982.8185.17.camel@ted>
References: <cover.1316890497.git.sgw@linux.intel.com>
	<1316960982.8185.17.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316970449.8185.27.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] v2 of attr/acl with qemuimage-testlib fix
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
X-List-Received-Date: Sun, 25 Sep 2011 17:12:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-25 at 15:29 +0100, Richard Purdie wrote:
> On Sat, 2011-09-24 at 11:56 -0700, Saul Wold wrote:
> > Richard, 
> > 
> > These 2 patches would be for edison
> > 
> > Sau!
> > 
> > The following changes since commit 368b150416688654e35229a63b87177b52e83d02:
> > 
> >   populate_sdk_rpm: add pkgconfig(pkg-config) to the list (2011-09-23 19:55:43 +0100)
> > 
> > are available in the git repository at:
> >   git://git.yoctoproject.org/poky-contrib sgw/oe-fix
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix
> > 
> > Saul Wold (2):
> >   attr/acl: add SSTATEPOSTINSTFUNC
> >   qemuimage-testlib: set a default geometry for xterm
> 
> I've merged the first of these, thanks. I'm holding off the second until
> we see the problem on the autobuilder is fixed, this doesn't have seemed
> to have done so :(

Just to follow up, we're going to fix this with Xdefaults files on the
autobuilder so I'll not take this patch.

Saul: Can we document this somewhere (autobuilder repo's README maybe)?

Cheers,

Richard





