Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2AE782CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:06:49 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f136so598730lff.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=5rCalcpWUzd622SBz5PMLov2ySYZxhaCO9DFqIaVcT8=;
	b=ZrihI6CNdts2KX35VN8OIhzm92H44iZMuFbhyAszaY6cisVCi3cvygMtdpDhKf1wK1
	vlPYUaSomCiFjLVGKtmgdLsW9zuxgn8XZkGCwihbV1x3B55rMgx2sTgW+5VFyCKzamsq
	nyBT0LKYczR24KAz47iiWgFPO+VlZ23HXnjYtWNkUO66T/fV+WEo3zG1z7qJmV2XbGnG
	khsJ99rO9XYanOz2EJUSasWgo2dpgjO30Sbc38uLv/ftEasjaoWMG9LnMRzVZgbJx2qp
	5LF/nvfJTlvmbc/ngyEaK0GWTeyknrlltGSFRN/g3cDQq5gr5monJW7BYXlaCg/SCmy5
	Ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5rCalcpWUzd622SBz5PMLov2ySYZxhaCO9DFqIaVcT8=;
	b=fVLGnKr13NsfH7UsH8cGRC3KfQAzkvHrvVDndqDAxCQtoy3nNgZ+6vUFf0p+Muwd9W
	Cp2Kqor7yvSVALjSCGcKmR5O7uLbWFyUQA7QM/DJmrtzHXtXr1OV3V4krMIiQAoJHz6l
	1fSkEl0P87sGKcBVw8rP5rQ3o0qvrjiMBnqyXgljmCb3ocYkTejRj0fTg9Zq5fdxT1rF
	4Zt8RDdgVyIwu2vYnBF2Ew8KHSpAmBCvo7xRvCn7DU2+nr1mJJX+DGklkGQwnIxXqcS6
	8BVN3C6v9yCAEFAx3ZSHCCJElXCmK7BU4nzw97i/K+kkF6OocouiWJ/m7y5OOKdrlzDf
	9bYg==
X-Gm-Message-State: AKwxytfYHl73enGKuCJZzpVp/AYJIavZJV6gwDx6pprAHYjoyBsajNn4
	qn7g9cP5N6B0FpqYaqUQSTY18FhQFrg=
X-Google-Smtp-Source: AH8x2256vNAn+BOP23nLPdUIYSiszv0l5SCkkFAbTh8i2tr0vTjUiqgZphdtJinjp4UpsUa1BeScWg==
X-Received: by 10.25.77.212 with SMTP id a203mr5320447lfb.14.1516972010709;
	Fri, 26 Jan 2018 05:06:50 -0800 (PST)
Received: from [10.20.33.251] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	u10sm929445lju.32.2018.01.26.05.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 05:06:50 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
References: <1516971979-31262-1-git-send-email-kristian.amlie@northern.tech>
Message-ID: <bd459ced-1d6d-b75f-1418-41375847765e@northern.tech>
Date: Fri, 26 Jan 2018 14:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1516971979-31262-1-git-send-email-kristian.amlie@northern.tech>
Subject: Re: [PATCH] systemd: Make sure that resolv.conf points to writable area in R/O rootfs.
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
X-List-Received-Date: Fri, 26 Jan 2018 13:06:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'll be the first one to admit that I don't fully understand everything
about the systemd resolver. So there may be a cleaner way to do this,
but the submitted patch at least solved the problem for us. I'm open to
suggestions if there's a better way.

-- 
Kristian

On 26/01/18 14:06, Kristian Amlie wrote:
> Normally we want systemd to populate it at runtime, but when we have a
> read-only root filesystem we can't, so do it during the build.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> Signed-off-by: Marcin Pasinski <marcin.pasinski@mender.io>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
> index 4132cdf..7d61a53 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -273,6 +273,9 @@ do_install() {
>  	else
>  		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>  		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
> +		if ${@bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', 'true', 'false', d)}; then
> +			ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv.conf
> +		fi
>  	fi
>  	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
>  
> @@ -471,6 +474,12 @@ CONFFILES_${PN} = "${sysconfdir}/machine-id \
>                  ${sysconfdir}/systemd/system.conf \
>                  ${sysconfdir}/systemd/user.conf"
>  
> +FILES_MAYBE_RESOLV_CONF = "${@bb.utils.contains('PACKAGECONFIG', 'resolved', \
> +                               bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', \
> +                                   '${sysconfdir}/resolv.conf', \
> +                                   '', d), \
> +                               '', d)}"
> +
>  FILES_${PN} = " ${base_bindir}/* \
>                  ${datadir}/dbus-1/services \
>                  ${datadir}/dbus-1/system-services \
> @@ -487,6 +496,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                  ${sysconfdir}/xdg/ \
>                  ${sysconfdir}/init.d/README \
>                  ${sysconfdir}/resolv-conf.systemd \
> +                ${FILES_MAYBE_RESOLV_CONF} \
>                  ${rootlibexecdir}/systemd/* \
>                  ${systemd_unitdir}/* \
>                  ${base_libdir}/security/*.so \
> 


