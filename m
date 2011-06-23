Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZeFw-0001hb-Sp
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 09:23:16 +0200
Received: by wyb34 with SMTP id 34so1240580wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 00:19:41 -0700 (PDT)
Received: by 10.227.2.144 with SMTP id 16mr1680389wbj.9.1308813581295;
	Thu, 23 Jun 2011 00:19:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm1001100wbh.46.2011.06.23.00.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 00:19:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308786521-27001-1-git-send-email-tom_rini@mentor.com>
Date: Thu, 23 Jun 2011 09:19:38 +0200
Message-Id: <CED25731-5E66-4F53-BFF2-0CAE1277B63F@dominion.thruhere.net>
References: <1308786521-27001-1-git-send-email-tom_rini@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] kernel.bbclass: Stage System.map with KERNEL_VERSION suffix
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
X-List-Received-Date: Thu, 23 Jun 2011 07:23:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 23 jun 2011, om 01:48 heeft Tom Rini het volgende geschreven:

> Without this, images will fail now that kernel-abiversion is back.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/classes/kernel.bbclass |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1bb69f5..f2e0aff 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -137,6 +137,7 @@ kernel_do_install() {
> 		cp -fR ${S}/* $kerneldir
> 	fi
> 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> +	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
> 
> 	#
> 	# Clean and remove files not needed for building modules.
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



