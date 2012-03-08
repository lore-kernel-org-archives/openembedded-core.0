Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S5isV-0005DZ-SC
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 20:19:56 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0K00EQ2VTN5X92@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 12:10:36 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 69C0B2009F; Thu,
	08 Mar 2012 13:10:35 -0500 (EST)
Date: Thu, 08 Mar 2012 13:10:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120308181035.GA10587@denix.org>
References: <1331208530-11938-1-git-send-email-obi@opendreambox.org>
MIME-version: 1.0
In-reply-to: <1331208530-11938-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] udev-164: don't hardcode path to pidof
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
X-List-Received-Date: Thu, 08 Mar 2012 19:19:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 08, 2012 at 01:08:50PM +0100, Andreas Oberritter wrote:
> * pidof lives in /bin, search it in $PATH.

Nice catch! It does indeed live in /bin

> * Assume pidof's presence.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  meta/recipes-core/udev/udev/init   |    6 ++----
>  meta/recipes-core/udev/udev_164.bb |    2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index 78b5b1c..f9e9014 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -28,10 +28,8 @@ readfile () {
>  }
>  
>  kill_udevd() {
> -	if [ -x /sbin/pidof ]; then
> -		pid=`/sbin/pidof -x udevd`
> -		[ -n "$pid" ] && kill $pid
> -	fi
> +	pid=`pidof -x udevd`
> +	[ -n "$pid" ] && kill $pid
>  }
>  
>  export ACTION=add
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> index b993a13..d661044 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
>  include udev.inc
>  
> -PR = "r11"
> +PR = "r12"
>  
>  SRC_URI += "file://udev-166-v4l1-1.patch"
>  
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


