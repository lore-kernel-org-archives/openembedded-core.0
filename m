Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5812E6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 15:40:09 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id q2so3745936pap.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BbAAW3H8xSDK3bZdBJOvKfysm0XK28ghELLgqm6Mlkw=;
	b=Ld+gvB/46FHIJ94k6TJz3EXq7feMgE1+ZaHckK41lcGyVdzIInNv36pBwkG37LbWqS
	vDwz8ECrX/ITB4mCnyyt3LNeOsQ9y51Oh8sLXvKurERkIwo1NKqgysbn+WWHzt1qgaO+
	5veKaBUXf12AUWuwvNts46wAFMkeUFAP+j5B7R67ARhSREDgYlfhE/AEUFkAWeIonhzr
	JDgKHwOgk3XgoEvyWfrtTy5VQSHBMwScWAWvLYoY2JeR+WiufLhv9jYPonU/zRDPpu3Y
	jf0dCzTsUaojvnlvIPSbWrqDcPcJ9Nqj2ffXj/BxYpoOjdTPp2PbK4PC0GiRGFw38J9k
	6i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BbAAW3H8xSDK3bZdBJOvKfysm0XK28ghELLgqm6Mlkw=;
	b=LjLinFzO5y5DKmGG+tSweeAaLDJiv/om+Zu8p4vFeYLSEP1HqBGgU9PryGdp4+SOlx
	QFdXweYhevVzV38mpi9fGYcPs43Kxw9vyRJVPsnoW5XRj6WCfCDKHcub/fhtJVRUddgh
	NegFJog/+peF/itJ/ZUVKjDHUeKWQug2Fv/4gxLG+m3m4DKRqCLbWeh8tEGqzEBuSHww
	6Abui9WqW2uO1WZ97HwtjxYv6zphFTB5WiCgxscOry4hMhUb5jQ2WAwo4UElIJVj/7xd
	pi05NNMi2ZWy5B54pHIayzgsvI9LWRakB+crOypx2Zl8vrfyCytPSlG/NbKwJkC3lWle
	QERw==
X-Gm-Message-State: AEkoous+gmg7TvE+S+uALE5KYqjKy9j/4cDa9grmzP1kjC38uDKMHBmJZBD7/Dblc6+WqQ==
X-Received: by 10.66.171.197 with SMTP id aw5mr60035077pac.36.1469720410574;
	Thu, 28 Jul 2016 08:40:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:fd9d:2e79:6157:365c?
	([2601:202:4001:9ea0:fd9d:2e79:6157:365c])
	by smtp.googlemail.com with ESMTPSA id
	i62sm18097074pfg.62.2016.07.28.08.40.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jul 2016 08:40:09 -0700 (PDT)
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
	<1469714682-31488-12-git-send-email-maxin.john@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <579A2758.9000301@gmail.com>
Date: Thu, 28 Jul 2016 08:40:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1469714682-31488-12-git-send-email-maxin.john@intel.com>
Subject: Re: [krogoth][PATCH 11/12] at: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 15:40:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Maxim,


On 07/28/2016 07:04 AM, Maxin B. John wrote:
> From: Tim Orling <timothy.t.orling@linux.intel.com>
> 
> Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will only
> contain releases that are currently in Debian, so currently doesn't contain
> 3.1.18 as unstable has moved on to 3.1.20.
> 
> So, move all of SRC_URI to the .bb so it can use snapshot.debian.org instead,
> and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking
> continues to work.
> 
> [YOCTO #10005]
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>

I pulled this version in from another request.

-armin
> ---
>  meta/recipes-extended/at/at_3.1.18.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/at/at_3.1.18.bb b/meta/recipes-extended/at/at_3.1.18.bb
> index 93044f5..f533f3c 100644
> --- a/meta/recipes-extended/at/at_3.1.18.bb
> +++ b/meta/recipes-extended/at/at_3.1.18.bb
> @@ -15,7 +15,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
>  RCONFLICTS_${PN} = "atd"
>  RREPLACES_${PN} = "atd"
>  
> -SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
> +SRC_URI += "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/a/${BPN}/${BPN}_${PV}.orig.tar.gz;subdir=${BP} \
>      file://fix_parallel_build_error.patch \
>      file://posixtm.c \
>      file://posixtm.h \
> @@ -28,6 +28,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
>      file://configure-fix-with-without-selinux.patch \
>      "
>  
> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/at/"
> +
>  PAM_SRC_URI = "file://pam.conf.patch \
>                 file://configure-add-enable-pam.patch"
>  
> 

