Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1Tb3kM-0001AZ-QR
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 07:25:31 +0100
Received: from [192.168.1.100] (blfd-5d821860.pool.mediaWays.net
	[93.130.24.96])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 4188D184135F;
	Wed, 21 Nov 2012 07:03:16 +0100 (CET)
Message-ID: <50AC6EA2.60708@herbrechtsmeier.net>
Date: Wed, 21 Nov 2012 07:03:14 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <1353452291-3503-1-git-send-email-philip@balister.org>
In-Reply-To: <1353452291-3503-1-git-send-email-philip@balister.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] distutils-common : Add -staticdev to PACKAGES.
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
X-List-Received-Date: Wed, 21 Nov 2012 06:25:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 20.11.2012 23:58, schrieb Philip Balister:
> Some python recipes may build static libraries that need packaging in
> {PN}-static-dev.
>
> This change fixes a QA error in python-numpy.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>   meta/classes/distutils-common-base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
> index f66a5cd..36c1e83 100644
> --- a/meta/classes/distutils-common-base.bbclass
> +++ b/meta/classes/distutils-common-base.bbclass
> @@ -5,7 +5,7 @@ EXTRA_OEMAKE = ""
>   export STAGING_INCDIR
>   export STAGING_LIBDIR
>   
> -PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
> +PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
>   
>   FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>   
Hi,

I post a similarly patch parallel with the python-numpy fix:
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/29575

Regards,
   Stefan



