Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAmMM-0005uo-1F for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 19:03:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHsaS8017784;
	Thu, 22 Mar 2012 17:54:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17727-01; Thu, 22 Mar 2012 17:54:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHsP60017775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 17:54:29 GMT
Message-ID: <1332438867.9740.291.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm@freescale.com>
Date: Thu, 22 Mar 2012 17:54:27 +0000
In-Reply-To: <1332435223-15320-1-git-send-email-msm@freescale.com>
References: <1332434311.9740.250.camel@ted>
	<1332435223-15320-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Thu, 22 Mar 2012 18:03:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 11:53 -0500, Matthew McClintock wrote:
> We can use the default value for TUNE_PKGARCH, and now we just
> append "-nf" if TARGET_FPU is fpu-soft
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



