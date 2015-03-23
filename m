Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2074F6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9A37D3151A71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 19:54:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id g-xU6oHMPyu6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 19:54:56 +0100 (CET)
Received: from [172.22.22.61] (55d41d03.access.ecotel.net [85.212.29.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B682C3151A6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 19:54:56 +0100 (CET)
Message-ID: <5510617F.6060307@opendreambox.org>
Date: Mon, 23 Mar 2015 19:54:55 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1427124640-26058-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1427124640-26058-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] package.bbclass: Add SYSTEMD_SERVICE to list of package specific variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Mar 2015 18:55:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23.03.2015 16:30, Andreas Oberritter wrote:
> Changes to SYSTEMD_SERVICE should change the sstate checksum. To make that
> happen, it needs to be listed in the list of package specific variables,
> therefore add it.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index fb0666d..03eefc2 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1909,7 +1909,7 @@ python package_depchains() {
>  
>  # Since bitbake can't determine which variables are accessed during package
>  # iteration, we need to list them here:
> -PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS RBREAKS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES"
> +PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS RBREAKS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE"
>  
>  def gen_packagevar(d):
>      ret = []
> 

This patch depends on another one I didn't send. Sorry, please ignore.

Regards,
Andreas


