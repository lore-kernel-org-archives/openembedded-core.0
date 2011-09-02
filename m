Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1QzUOL-0008N3-53
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 16:06:45 +0200
Received: from mail194.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id C72B1100CE4A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 15:45:37 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Sep 2011 15:45:18 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.100?)
	(denis%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Sep 2011 15:45:17 +0200
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <1314970720-20644-1-git-send-email-denis@eukrea.com>
References: <1314970267-20365-1-git-send-email-denis@eukrea.com>
	<1314970720-20644-1-git-send-email-denis@eukrea.com>
Organization: eukrea
Date: Fri, 02 Sep 2011 15:45:12 +0200
Message-ID: <1314971112.27758.1.camel@PCDEV1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Ovh-Tracer-Id: 15991437852315622850
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrudegucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucculddquddttddm
Subject: Re: [PATCH v2] mtd-utils: update to version to 1.4.6
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
X-List-Received-Date: Fri, 02 Sep 2011 14:06:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 15:38 +0200, Denis Carikli wrote:
> mtd-utils 1.4.6 is the lastest release of mtd-utils
>   at this time.
> 
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
>  .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
>  .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} |    3 ---
>  2 files changed, 0 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/mtd/{ => mtd-utils-1.4.6}/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
>  rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} (86%)
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> similarity index 100%
> rename from meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> rename to meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
> similarity index 86%
> rename from meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
> index c05149d..e1bc5f5 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
> @@ -26,6 +26,3 @@ do_install () {
>  PARALLEL_MAKE = ""
>  
>  BBCLASSEXTEND = "native"
> -
> -SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
> -SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
sorry forget that patch,
I'll revisit it and send a new one.

Denis.




