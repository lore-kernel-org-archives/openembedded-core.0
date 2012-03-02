Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3T40-0004P0-D3 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:02:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22Drwif000905
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:53:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31378-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 13:53:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22DrpFJ000897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:53:52 GMT
Message-ID: <1330696435.309.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 13:53:55 +0000
In-Reply-To: <4F50CDAD.6060209@mlbassoc.com>
References: <1330675739.1086.154.camel@localhost.localdomain>
	<1330691655.15224.14.camel@ted> <4F50CDAD.6060209@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [image_types_uboot] getdepends for ext2.gz.u-boot
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
X-List-Received-Date: Fri, 02 Mar 2012 14:02:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-02 at 06:39 -0700, Gary Thomas wrote:
> On 2012-03-02 05:34, Richard Purdie wrote:
> > On Fri, 2012-03-02 at 16:08 +0800, Ni Qingliang wrote:
> >> Hello,
> >>
> >> when using ext2.gz.u-boot as IMAGE_FSTYPES, I got error when doing
> >> rootfs with error info:
> >> genext2fs: command not found
> >>
> >> after checked fuction imagetypes_getdepends, I guess the ext2's
> >> dependency is not considered. maybe we should assign 'ext2' to
> >> 'basetype', but not 'type' directly.
> >>
> >> Any idea?
> >
> > Does
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=78ae63423f123f89a5c72c85539e6ed71bd2653d fix the problem for you?
> 
> This looks like what I'm doing with my own generator.  I tried
> it, with & without this patch, and I don't get a ext2.gz.u-boot
> image, only a broken link.

That sounds like what happens if you don't inherit image_types_uboot

Cheers,

Richard




