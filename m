Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RVjlH-0005Tt-ME
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 13:59:43 +0100
Received: from p4fc77270.dip.t-dialin.net ([79.199.114.112]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RVjem-0006l0-4p by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Wed, 30 Nov 2011 13:53:05 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RVjfJ-000265-QO; Wed, 30 Nov 2011 13:53:33 +0100
Date: Wed, 30 Nov 2011 13:53:33 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20111130125333.GB27310@novatech.datenfreihafen.org>
References: <4ED61F56.8050409@mlbassoc.com>
	<20111130123743.GA27310@novatech.datenfreihafen.org>
	<4ED624C6.5070505@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4ED624C6.5070505@mlbassoc.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Alter order of file systems tried by mount
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
X-List-Received-Date: Wed, 30 Nov 2011 12:59:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-11-30 at 05:42, Gary Thomas wrote:
> On 2011-11-30 05:37, Stefan Schmidt wrote:
> >On Wed, 2011-11-30 at 05:19, Gary Thomas wrote:
> >>  The file /etc/filesystems is used by busybox 'mount' when
> >>  attempting to mount a file system when the type is not
> >>  specified.  This change alters the order so that more
> >>  capable systems are tried first.  Without this change, an
> >>  EXT3 system will mount as EXT2 which disables many of the
> >>  EXT3 features.  With the change, EXT3 systems are mounted
> >>  properly.
> >>
> >>Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> >>---
> >>  .../recipes-core/base-files/base-files/filesystems |    8 ++++----
> >>  meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
> >>  2 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >>diff --git a/meta/recipes-core/base-files/base-files/filesystems b/meta/recipes-core/base-files/base-files/filesystems
> >>index 2af6a7e..14f5abb 100644
> >>--- a/meta/recipes-core/base-files/base-files/filesystems
> >>+++ b/meta/recipes-core/base-files/base-files/filesystems
> >>@@ -1,7 +1,7 @@
> >>-minix
> >>-fat
> >>-vfat
> >>-ext2
> >>  ext3
> >>+ext2
> >>+vfat
> >>+fat
> >>  btrfs
> >>+minix
> >
> >In the commit message you explain the problem with ext2/3. And I agree
> >that it makes sense to start with ext3. Actually, adding ext4 would
> >make sense, too.
> 
> Agreed.

In the mood to add it and send an updated version of this patch? :)

> >What is the deal with the re-ordering of fat/vfat/minix though? Looks
> >unrelated to me.
> 
> Same argument as above - try more capable file systems first.
> I also moved minix to the end as it is rarely, if ever, used.

Ah, now I see that you also moved vfat before fat. Missed that before.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


