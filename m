Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qliia-0005m8-TB for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:34:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEUWuF022251
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:30:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22177-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:30:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEUPj5022245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:30:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2EC9D5.9070209@mentor.com>
References: <cover.1311653945.git.josh@linux.intel.com>
	<ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
	<4E2EC9D5.9070209@mentor.com>
Date: Tue, 26 Jul 2011 15:30:17 +0100
Message-ID: <1311690617.2344.251.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 14:34:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 07:06 -0700, Tom Rini wrote:
> On 07/25/2011 09:21 PM, Joshua Lock wrote:
> > Some of these entries are required by the GUI to enable the expected workflow
> > of the ADT, namely a compressed rootfs image.
> > 
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
> > ---
> >  meta/classes/image_types.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index 1108802..f1aef86 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -103,4 +103,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
> >  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
> >  
> >  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> > -IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"
> > +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
> 
> So, is there some way we can do this dynamically?  Either oe-core is
> missing ext4, or we'll have to add that and all it's permutations.  And
> then there's u-boot signed copies of all of the ext* compressed versions.

The configs for the image types could do something like:

IMAGE_TYPE += "jffs2"
IMAGE_CMD_jffs2 = "xxx"

or we could switch to the syntax:

IMAGE_CMD[jffs2] = "xxx"

?

Cheers,

Richard





