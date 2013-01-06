Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TrxnU-0003Og-J9
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 22:30:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r06LFFnl008428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 13:15:15 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.119.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 13:15:15 -0800
Message-ID: <50E9E962.4060807@windriver.com>
Date: Sun, 6 Jan 2013 15:15:14 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1357505990-3365-1-git-send-email-cazfi74@gmail.com>
	<1357505990-3365-2-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357505990-3365-2-git-send-email-cazfi74@gmail.com>
Subject: Re: [PATCH] prelink: update to git head
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
X-List-Received-Date: Sun, 06 Jan 2013 21:30:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/13 2:59 PM, Marko Lindqvist wrote:
> Compatible with automake-1.13.
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index 610302e..ae9931f 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
>   runtime and thus programs come up faster."
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> -SRCREV = "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
> +SRCREV = "4e313edb125db215d4c456ce62c74ee16841a365"
>   PV = "1.0+git${SRCPV}"
> -PR = "r10"
> +PR = "r0"
>
>   #
>   # The cron script attempts to re-prelink the system daily -- on
>



