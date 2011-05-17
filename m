Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKgq-0001Io-6f for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:52:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDlYVo016933;
	Tue, 17 May 2011 14:47:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16467-09; Tue, 17 May 2011 14:47:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDlSHE016927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 14:47:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305635287.2429.195.camel@phil-desktop>
References: <1305635287.2429.195.camel@phil-desktop>
Date: Tue, 17 May 2011 14:47:27 +0100
Message-ID: <1305640047.3424.233.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@www.linuxtogo.org
Subject: Re: [patch] update-rc.d: point SRC_URI to new devel repo
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
X-List-Received-Date: Tue, 17 May 2011 13:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:28 +0100, Phil Blundell wrote:
> handhelds.org cvs is down and doesn't seem to be coming back.
> update-rc.d now has a new upstream home, point SRC_URI to that.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> index accb385..8ba6644 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> @@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb
> 
>  PR = "r3"
> 
> -SRC_URI = "${HANDHELDS_CVS};module=apps/update-rc.d;tag=r0_7 \
> +SRC_URI = "git://github.com/philb/update-rc.d.git;tag=update-rc.d_${PV};protocol=git \
>             file://add-verbose.patch;apply=yes"
> 
> 

Applied, thanks (when I can push to the repo).

I had to apply this manually as something was wrong with this patch...

Cheers,

Richard



