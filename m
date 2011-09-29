Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R9ATV-0002nU-IR for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 08:52:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R9AOG-0001l3-00 for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 08:46:40 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 08:46:39 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 08:46:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 29 Sep 2011 10:45:26 +0400
Message-ID: <j61480$4e1$1@dough.gmane.org>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-3-git-send-email-msm@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <1317270070-14250-3-git-send-email-msm@freescale.com>
Subject: Re: [PATCH 03/16] Update gitignore to ignore all meta-* directories
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
X-List-Received-Date: Thu, 29 Sep 2011 06:52:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 09/29/2011 08:20 AM, Matthew McClintock wrote:
> meta-XYZ directories have been manually added in the past, instead
> always ignore them unless they are explicitly added

For cleanness you should probably explicitly escape meta-skeleton and 
meta-demoapps from .gitignore (see man).

>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   .gitignore |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index d44e729..679cb11 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -9,11 +9,7 @@ build*/pyshtables.py
>   pstage/
>   scripts/oe-git-proxy-socks
>   sources/
> -meta-darwin
> -meta-maemo
> -meta-extras
> -meta-m2
> -meta-prvt*
> +meta-*
>   *.swp
>   *.orig
>   *.rej

-- 
With best wishes
Dmitry



