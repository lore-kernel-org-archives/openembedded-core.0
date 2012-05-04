Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SQMXd-0004PJ-IN
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:43:41 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3I00BK7E41WQQ1@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 12:33:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 03D3320099; Fri,
	04 May 2012 13:33:37 -0400 (EDT)
Date: Fri, 04 May 2012 13:33:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120504173337.GA14692@denix.org>
References: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
MIME-version: 1.0
In-reply-to: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
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
X-List-Received-Date: Fri, 04 May 2012 17:43:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 04, 2012 at 11:15:33AM +0200, Elvis Dowson wrote:
> This patch fixes WARNING: /tool/yocto/meta-openembedded/meta-oe/

This is not the right mailing list for patches addressed to meta-oe. As I 
recall, I told you to submit to openembedded-devel, but not here. Sorry if it 
got you confused...


> recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb:
> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> 
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> index 474d98a..478d61e 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> @@ -54,7 +54,7 @@ do_install_append () {
> 	install -d ${D}/etc/NetworkManager/VPN
> }
> 
> -SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_PACKAGES = "${PN}-systemd"

That might be an overkill. I'm personally not yet very familiar with all the 
systemd specifics and not clear when to create ${PN}-systemd subpackage and 
when to just silence the warning...

-- 
Denys


> SYSTEMD_SERVICE = "NetworkManager.service"
> 
> PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" 
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


