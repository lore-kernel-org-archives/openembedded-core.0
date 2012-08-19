Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T34tu-0003cK-3U for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 14:46:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7JCYd4C024949;
	Sun, 19 Aug 2012 13:34:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23973-02; Sun, 19 Aug 2012 13:34:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7JCYUTG024943
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 19 Aug 2012 13:34:31 +0100
Message-ID: <1345379671.27428.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Aug 2012 13:34:31 +0100
In-Reply-To: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
References: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpam: Update recipes from 1.1.5 -> 1.1.6
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
X-List-Received-Date: Sun, 19 Aug 2012 12:46:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 21:56 -0700, Khem Raj wrote:
> Drop include-sys-resource.patch already fixed upstream
> LIC_FILE_CHKSUM change is due to deletion of space in
> COPYING file see
> http://git.fedorahosted.org/cgit/linux-pam.git/commit/COPYING?id=1814aec611a5f9e03eceee81237ad3a3f51c954a
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pam/libpam/include-sys-resource.patch          |   12 ------------
>  .../pam/{libpam_1.1.5.bb => libpam_1.1.6.bb}       |   12 ++++--------
>  2 files changed, 4 insertions(+), 20 deletions(-)
>  delete mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
>  rename meta/recipes-extended/pam/{libpam_1.1.5.bb => libpam_1.1.6.bb} (90%)

I merged this, it broke the build, I hopefully fixed it:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=91ece5d5668ee1adb5c5e3d757426a0d5187bd84

Cheers,

Richard



