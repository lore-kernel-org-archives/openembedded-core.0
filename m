Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 2412 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jun 2015 10:03:50 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F39106AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:03:50 +0000 (UTC)
Message-ID: <55701920.2050101@communistcode.co.uk>
Date: Thu, 04 Jun 2015 10:23:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433397478-3927-1-git-send-email-kai.kang@windriver.com>
In-Reply-To: <1433397478-3927-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [PATCH] alsa-tools: add dependency glib-2.0
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
X-List-Received-Date: Thu, 04 Jun 2015 10:03:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/15 06:57, Kai Kang wrote:
> Add dependency glib-2.0 for alsa-tools. It is required by new added
> sub-component hdajacksensetest.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
> index 9133012..b5b9cc4 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
>   BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
>   SECTION = "console/utils"
>   LICENSE = "GPLv2 & LGPLv2+"
> -DEPENDS = "alsa-lib ncurses"
> +DEPENDS = "alsa-lib ncurses glib-2.0"
>   
>   LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"

It would be nice to put this behind a hdajacksensetest packageconfig if 
possible.

