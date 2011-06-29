Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbipb-0006B2-QZ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:40:40 +0200
Received: by pwi1 with SMTP id 1so555423pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=n3PfgzB8tlx8H3eb49/HGvD0Fg37oO3GG6Y3H6mQVBI=;
	b=vyX23YI2UjDVpNPf0qvmxIfMJgNzrvavEYHNEPPQ+17rMrrtyPJawoTBzf3hWOET9O
	cl8eTtf3J5VN3zNqkxjftNWBZxZ7QzX84ZRQyy7wITBwJV+2tPZS3z9uFlzMRslzCCd3
	YlDWPFt6fTCCHVH8GFMnI+vHuF3rT1UE9w/n0=
Received: by 10.142.173.5 with SMTP id v5mr108071wfe.66.1309307468421;
	Tue, 28 Jun 2011 17:31:08 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t12sm437882wff.22.2011.06.28.17.31.07
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 17:31:07 -0700 (PDT)
Message-ID: <4E0A724A.2080808@gmail.com>
Date: Tue, 28 Jun 2011 17:31:06 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308230863.25285.4590.camel@phil-desktop>
In-Reply-To: <1308230863.25285.4590.camel@phil-desktop>
Subject: Re: [PATCH] dhcp: don't try to move files from ${sbindir} to ${base_sbindir} if they are the same
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
X-List-Received-Date: Wed, 29 Jun 2011 00:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 06:27 AM, Phil Blundell wrote:
>
> Signed-off-by: Phil Blundell<philb@gnu.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   meta/recipes-connectivity/dhcp/dhcp4.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp4.inc
> index 159ae89..885cc19 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp4.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp4.inc
> @@ -47,7 +47,9 @@ do_install_append () {
>   	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
>
>   	install -d ${D}${base_sbindir}/
> -	mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	if [ "${sbindir}" != "${base_sbindir}" ]; then
> +		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	fi
>   	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
>   }
>



