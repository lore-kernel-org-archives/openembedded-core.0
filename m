Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbaZK-0002Xz-I2 for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:23:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGGVhh019640
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:16:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19538-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:16:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGGIHC019597
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:16:19 GMT
Message-ID: <1324052179.4568.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 16:16:19 +0000
In-Reply-To: <1323793193-31090-3-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/9] bitbake.conf, core-image-minimal-initramfs: add INITRAMFS_FSTYPES
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
X-List-Received-Date: Fri, 16 Dec 2011 16:23:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> Initramfs images don't benefit from usual IMAGE_FSTYPES overrides. The
> only sane values for them are "cpio.XXX". If IMAGE_FSTYPES is set to
> include 'live', building core-image-minimal-initramfs can result in
> build error, if the image is built before the kernel. To stop initramfs
> images from responding on IMAGE_FSTYPES settings, but still allow
> users/developers to override defaults (e.g. to generate "cpio.lzma"
> initramfs), introduce INITRAMFS_FSTYPES variable, by default set to
> "cpio.gz".
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/conf/bitbake.conf                             |    1 +
>  .../images/core-image-minimal-initramfs.bb         |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



