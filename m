Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QozaI-0004Kl-3O
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:11:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p74F7Hwx005046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 08:07:18 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 4 Aug 2011 08:07:17 -0700
Message-ID: <4E3AB5A4.9080300@windriver.com>
Date: Thu, 4 Aug 2011 10:07:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312437938-29860-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312437938-29860-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] prelink: Add lib64 dirs to prelink.conf
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
X-List-Received-Date: Thu, 04 Aug 2011 15:11:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/4/11 1:05 AM, Kumar Gala wrote:
> Handle multlib or cases that baselib is lib64.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Acked-by: Mark Hatle <mark.hatle@windriver.com>

(BTW I think as we move more into the multilib stuff, we'll likely want to
generate this list from the final multilib configuration.. but for now this
should be good.)

> ---
>  meta/recipes-devtools/prelink/prelink/prelink.conf |    8 ++++----
>  meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
> index c5a4f4a..ed30c28 100644
> --- a/meta/recipes-devtools/prelink/prelink/prelink.conf
> +++ b/meta/recipes-devtools/prelink/prelink/prelink.conf
> @@ -12,7 +12,7 @@
>  -l /usr/bin
>  -l /usr/X11R6/bin
>  -l /usr/games
> --l /usr/local/lib
> --l /lib
> --l /usr/lib
> --l /usr/X11R6/lib
> +-l /usr/local/lib{,64}
> +-l /lib{,64}
> +-l /usr/lib{,64}
> +-l /usr/X11R6/lib{,64}
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index c653d4d..bb95da7 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -10,7 +10,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>  SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
>  PV = "1.0+git${SRCPV}"
> -PR = "r4"
> +PR = "r5"
>  
>  #
>  # The cron script attempts to re-prelink the system daily -- on



