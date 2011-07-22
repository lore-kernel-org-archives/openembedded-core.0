Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QkGb7-0001aO-9q
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:21:01 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QkGX8-0002fr-6R from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 07:16:54 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 22 Jul 2011 07:16:54 -0700
Received: from [172.30.80.68] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 22 Jul 2011 07:16:53 -0700
Message-ID: <4E29864F.5070300@mentor.com>
Date: Fri, 22 Jul 2011 07:16:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-2-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-3-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-4-git-send-email-galak@kernel.crashing.org>	<1311326696-11745-5-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-6-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311326696-11745-6-git-send-email-galak@kernel.crashing.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jul 2011 14:16:54.0005 (UTC)
	FILETIME=[01C8D250:01CC487A]
Subject: Re: [PATCH 5/5] openssl: Add handling for building on	linux-powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 14:21:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/22/2011 02:24 AM, Kumar Gala wrote:
> If try to build for an ppc64 target openssl will fail to build since
> the configure script didn't know how to handle a 'linux-powerpc64' target.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  meta/recipes-connectivity/openssl/openssl.inc |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 79620b3..b134ad0 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -83,6 +83,9 @@ do_configure () {
>  	linux-gnuspe-powerpc)
>  		target=linux-ppc
>  		;;
> +	linux-powerpc64)
> +		target=linux-ppc64
> +		;;
>  	linux-supersparc)
>  		target=linux-sparcv8
>  		;;


-- 
Tom Rini
Mentor Graphics Corporation


