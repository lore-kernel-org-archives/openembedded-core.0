Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QIMrR-0008M1-JR
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 17:22:33 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QIMoq-0006ej-9u from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 08:19:52 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 6 May 2011 08:18:29 -0700
Received: from [172.30.0.24] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1; Fri, 6 May 2011
	08:19:51 -0700
Message-ID: <4DC4118B.7030205@mentor.com>
Date: Fri, 6 May 2011 08:19:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1304693308-5625-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 May 2011 15:18:29.0157 (UTC)
	FILETIME=[DA758550:01CC0C00]
Subject: Re: [PATCH] package.bbclass: convert unpackaged file message from 'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Fri, 06 May 2011 15:22:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/06/2011 07:48 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/package.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index e6b3df7..082f233 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -676,9 +676,9 @@ python populate_packages () {
>  				unshipped.append(path)
>  
>  	if unshipped != []:
> -		bb.note("the following files were installed but not shipped in any package:")
> +		bb.warn("the following files were installed but not shipped in any package:")
>  		for f in unshipped:
> -			bb.note("  " + f)
> +			bb.warn("  " + f)
>  
>  	bb.build.exec_func("package_name_hook", d)
>  

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


