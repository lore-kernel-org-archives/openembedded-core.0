Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 07F2C78552
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 16:31:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7HGVbkL032250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 17:31:39 +0100
Message-ID: <1502987497.13978.239.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 17:31:37 +0100
In-Reply-To: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 17:31:39 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Thu, 17 Aug 2017 16:31:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-17 at 16:44 +0200, Andrej Valek wrote:
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/ca-certificates/ca-
> certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-
> certificates_20161130.bb
> index 9a80f43..771714d 100644
> --- a/meta/recipes-support/ca-certificates/ca-
> certificates_20161130.bb
> +++ b/meta/recipes-support/ca-certificates/ca-
> certificates_20161130.bb
> @@ -72,7 +72,7 @@ CONFFILES_${PN} += "${sysconfdir}/ca-
> certificates.conf"
>  # Postinsts don't seem to be run for nativesdk packages when
> populating SDKs.
>  CONFFILES_${PN}_append_class-nativesdk = "
> ${sysconfdir}/ssl/certs/ca-certificates.crt"
>  do_install_append_class-nativesdk () {
> -    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
> +    SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-
> certificates
>  }
>  
>  do_install_append_class-native () {

Since the HOSTTOOLS changes, this should no longer be needed?

Cheers,

Richard


