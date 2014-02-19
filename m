Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1A76E89C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 22:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A38343149963
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:01:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 864i0HhvqGuJ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:01:47 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.233.85])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id F3F1E3149958
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:01:46 +0100 (CET)
Message-ID: <530529CA.6000204@opendreambox.org>
Date: Wed, 19 Feb 2014 23:01:46 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH] openssh: enable PAM at runtime based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Feb 2014 22:01:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen,

On 19.02.2014 09:45, Koen Kooi wrote:
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> index 9c0bb48..5b9ec10 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> @@ -82,6 +82,8 @@ do_install_append () {
>  	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
>  		install -d ${D}${sysconfdir}/pam.d
>  		install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
> +		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config
> +		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config

is the first of the two new lines really necessary?

Regards,
Andreas

