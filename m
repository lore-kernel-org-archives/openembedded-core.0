Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCC797F968
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 23:32:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id a33so2108914pgm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 15:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=p9vj/ssgMh1+5dTE8v9sfx+nhTabyuw7aUHPspHD1Jk=;
	b=Ddm0jAwi64ig2lrHMdn8TqZwmaNwPyDd9iSe5Sj5IXn87Ltp/v9tp55VWE9gLS5vva
	xJMQBbiLM6VbM52lcfhYSErGm+g4RsoaNlGNcgZrzr/GFS/tEy1l13aXbyxcg8qxUqfM
	j8zxW3pYMkzjXdsFq/G1jVsnuUa+p4KQT89Pay6ihLFOkPbXi8+TgqZ/wgHghvFQR6L4
	K8Tmuu4sAsc2uxI7P2ETWXjDIK3dlVjRgd630kmYjFD845CMO8ysG3QVd0hm/RDBUGuC
	oanb8IXmSTixlS2tLbd/iCahZtc+/RAsmGp7KEDen7dIJr8S4IWU+FzUj8R3meWezx3o
	/oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=p9vj/ssgMh1+5dTE8v9sfx+nhTabyuw7aUHPspHD1Jk=;
	b=p9EjuQUbvVFIf//U4HlnD+Y78yNxeIqB4PcJwCpWjeWDeJ5HaMcOnVdDtAYLQxcQ/s
	hJMEUDy7p8fonKwuNqUQzYZjCeelEnfi6MdJvUT+0NQ5pbn+smGEtZYEEWRiHB5RwFFs
	xklP02iC9ZJdmX6fYMtTCh2Y8wKJ5mffeFQdJs8F+6+m3jP60ACSSEHLQY45jLbqVM7l
	mYU+o7C4qKWQ9EZPx9OGNhYEh4s5D5xV6JXt3hBtSRon0IeUNuvB2xPs1RzBcRJsw7Pw
	J0NaR831rlcaR7py3bJu8gZQbNahzULhXTN3i7B7PVM5A3zWnt2jk2i6b/4qsnPDPKeX
	8iDg==
X-Gm-Message-State: APjAAAUr8i6wcjnCRCrgmIZEbC6/q4TQg9fOj6UCZsE3VCe8VUu3Em7S
	45BtBZH5IbqWITuM9zunCEw=
X-Google-Smtp-Source: APXvYqzDDgcoWSyHY/ScaUJ59OJ9TKttIRlrJpRSpFiSVdRVbNaWTcUkEfae7++L/8m0OMvJeO6lWA==
X-Received: by 2002:a62:e914:: with SMTP id j20mr11788355pfh.245.1575588751960;
	Thu, 05 Dec 2019 15:32:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:49d0:4aef:f5f:565e?
	([2601:202:4180:a5c0:49d0:4aef:f5f:565e])
	by smtp.gmail.com with ESMTPSA id
	c18sm12670234pgj.24.2019.12.05.15.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2019 15:32:31 -0800 (PST)
To: Niko Mauno <niko.mauno@iki.fi>, openembedded-core@lists.openembedded.org
References: <20191205200518.82007-1-niko.mauno@iki.fi>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5c0c9f90-d4d5-fef5-838a-d8f596e20ebb@gmail.com>
Date: Thu, 5 Dec 2019 15:32:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205200518.82007-1-niko.mauno@iki.fi>
Subject: Re: [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 23:32:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/5/19 12:05 PM, Niko Mauno wrote:
> Introduce cosmetic changes to recipe content, most notably
>  - Change indentation style to four spaces in task statements
>  - Reorder several entries according to oe-stylize.py suggestions
>
> (From OE-Core rev: c1d162b6165f11b7b5ae5c6066e7683d5e1379fc)
>
> Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

These changes do not pass the 'stable' bar for backporting. Unless a
more compelling reason is give, this series is being "NACKed" at this time.

- armin
> ---
>  .../iptables/iptables_1.8.3.bb                | 60 +++++++++----------
>  1 file changed, 29 insertions(+), 31 deletions(-)
>
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
> index ff9fcb1b53..563c8ae354 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
> @@ -4,8 +4,9 @@ filtering code in Linux."
>  HOMEPAGE = "http://www.netfilter.org/"
>  BUGTRACKER = "http://bugzilla.netfilter.org/"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> -                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
> +"
>  
>  SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>             file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
> @@ -13,16 +14,16 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>             file://iptables.service \
>             file://iptables.rules \
>  "
> -
>  SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
>  SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
>  
> +SYSTEMD_SERVICE_${PN} = "iptables.service"
> +
>  inherit autotools pkgconfig systemd
>  
>  EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
>  
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> -
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  
>  # libnfnetlink recipe is in meta-networking layer
> @@ -32,9 +33,19 @@ PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libn
>  PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
>  
>  do_configure_prepend() {
> -	# Remove some libtool m4 files
> -	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
> -	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
> +    # Remove some libtool m4 files
> +    # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
> +    rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
> +}
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/iptables
> +    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
> +
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
> +
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
>  }
>  
>  PACKAGES += "${PN}-modules"
> @@ -47,30 +58,6 @@ python populate_packages_prepend() {
>          d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
>  }
>  
> -FILES_${PN} += "${datadir}/xtables"
> -
> -# Include the symlinks as well in respective packages
> -FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
> -FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
> -
> -INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
> -INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
> -
> -ALLOW_EMPTY_${PN}-modules = "1"
> -
> -do_install_append() {
> -
> -        install -d ${D}${sysconfdir}/iptables
> -        install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
> -
> -        install -d ${D}${systemd_system_unitdir}
> -        install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
> -
> -	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
> -}
> -
> -SYSTEMD_SERVICE_${PN} = "iptables.service"
> -
>  RDEPENDS_${PN} = "${PN}-module-xt-standard"
>  RRECOMMENDS_${PN} = " \
>      ${PN}-modules \
> @@ -84,3 +71,14 @@ RRECOMMENDS_${PN} = " \
>      kernel-module-nf-nat \
>      kernel-module-ipt-masquerade \
>  "
> +
> +FILES_${PN} += "${datadir}/xtables"
> +
> +# Include the symlinks as well in respective packages
> +FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
> +FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
> +
> +ALLOW_EMPTY_${PN}-modules = "1"
> +
> +INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
> +INSANE_SKIP_${PN}-module-xt-ct = "dev-so"


