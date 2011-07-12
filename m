Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qgddo-0000C8-VC for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:08:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE4qJR020915
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:04:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:04:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE4mTA020908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:04:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310421821.git.andrea.adami@gmail.com>
References: <cover.1310421821.git.andrea.adami@gmail.com>
Date: Tue, 12 Jul 2011 15:04:46 +0100
Message-ID: <1310479486.20015.1056.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/2] Embedding initramfs images during kernel build.
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
X-List-Received-Date: Tue, 12 Jul 2011 14:08:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 00:33 +0200, Andrea Adami wrote:
> * Sync with org.openembedded.dev and allow the inclusion of
> * lzma and xz compressed initramfs images.
> *
> * Provide a convenient way to include an initramfs by setting
> * INITRAMFS_IMAGE = "your_initramfs_image.bb"
> * and specifying the chosen output format in the initramfs image recipe, e.g.
> * IMAGE_FSTYPES = "cpio.gz cpio.lzma"
> 
> Andrea Adami (2):
>   kernel.bbclass: handle embedding of initramfs images
>   image_types.bbclass: support xz compressed initramfs.cpio and
>     tarballs

Merged to master, thanks.

Richard



