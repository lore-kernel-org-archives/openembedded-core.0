Return-Path: <raj.khem@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2AAA60661
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 18:26:33 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t17so6917841ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oUZImIs0+CSaJ5d2zq4cj/B2Zsf6vOpihwV0fDZeEt0=;
	b=ONC0t/eEEueOj+/rMIQfCYqV9J5vrCtquW2CAYR9uONJwgXR4g8+CQXaQ9n6DLIB4U
	1nAVZKR0giMFzLrYXHOXQkN2xrrrpfIn7UkfES0YjlQd9LbJd6iuKxxMxCNEDSVPRDLj
	Qcj+gfxls5+GTEMUTpXyQj+ohojpFh0Y5fmwLgaeO23jM8tkXX7vvcXLu5IW8suptOJw
	jzuNXAv6p3+r9t/frllp0GE13pFeS2eurYK5x7VHf3Vpyr5gcMbwzp5SnId4FD181iip
	l9Jxe1/STXDL94jPds7f0CRJJoMXaax42a6hXJuaBBv4YxbN60P1W/TbzF5pE8z1YjF5
	qWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oUZImIs0+CSaJ5d2zq4cj/B2Zsf6vOpihwV0fDZeEt0=;
	b=ef5/7WTwmFRxADjPKaUU97xUhkAe195nqliadEiN6p4YkETVcCesV5p+2suDFzQ2tn
	LF2qsbH8uDG0f3kXSlx8Oce0LGF4Qeg+BGYhsnMMpifm+bYdRlKA+89M6zVK40oAYuGh
	M04rj54C3YpBJjLG4ynG1/zuCCSDsx/gr7vUO06JO2llLxsissGotfLqx4DSoNvv+vi0
	z3kVesQX4zpeDL89hCpI3K4NrdIH4JKIgHbeMfZ40ZqDWXHNAbjBTy0JRZPsiCQwd0J8
	puIzCvETOeM5Q1wDkMEaxScE8AqvoMIJgHW5uztNUeS1lV9Je+47rnl5JMhuh4fiduJn
	iq8w==
X-Gm-Message-State: APjAAAUk68e6yHZzE/aTQBwNON/9OBddeef0CuqAUFWEYfRUgBJcRr5N
	0X8/caYOW1cpiJztqMGRb3WYnx9acDQ=
X-Google-Smtp-Source: APXvYqzLt5gbZE1BKivJgoyjDyJPeJFdibB/mTiJ+W0FNOZ9r1umJB8K8m3BK4af4ErejMY3IZsQgw==
X-Received: by 2002:a92:981b:: with SMTP id l27mr10980993ili.118.1580495194494;
	Fri, 31 Jan 2020 10:26:34 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:808d:d66e:9108:2692?
	([2601:646:9200:4e0:808d:d66e:9108:2692])
	by smtp.gmail.com with ESMTPSA id h9sm3448638ili.41.2020.01.31.10.26.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 10:26:33 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20200129211346.8149-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fc94ae10-d5a3-668a-1782-17d87d3f69a9@gmail.com>
Date: Fri, 31 Jan 2020 10:26:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129211346.8149-1-ross.burton@intel.com>
Subject: Re: [PATCH] glibc: merge libc-common.bbclass into glibc.bb
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
X-List-Received-Date: Fri, 31 Jan 2020 18:26:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/29/20 1:13 PM, Ross Burton wrote:
> There's only one user of libc-common now that we don't ship both glibc and
> eglibc, so copy the contents directly into the recipe.
> 
> [ YOCTO #12135 ]
> 

seems a good cleanup too.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/libc-common.bbclass          | 37 ---------------------
>   meta/recipes-core/glibc/glibc-package.inc | 40 +++++++++++++++++++++--
>   2 files changed, 38 insertions(+), 39 deletions(-)
>   delete mode 100644 meta/classes/libc-common.bbclass
> 
> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
> deleted file mode 100644
> index 0e351b67464..00000000000
> --- a/meta/classes/libc-common.bbclass
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -do_install() {
> -	oe_runmake install_root=${D} install
> -	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
> -	install -d ${D}${localedir}
> -	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
> -	# get rid of some broken files...
> -	for i in ${GLIBC_BROKEN_LOCALES}; do
> -		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
> -	done
> -	rm -f ${D}${sysconfdir}/rpc
> -	rm -rf ${D}${datadir}/zoneinfo
> -	rm -rf ${D}${libexecdir}/getconf
> -}
> -
> -def get_libc_fpu_setting(bb, d):
> -    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
> -        return "--without-fp"
> -    return ""
> -
> -python populate_packages_prepend () {
> -    if d.getVar('DEBIAN_NAMES'):
> -        pkgs = d.getVar('PACKAGES').split()
> -        bpn = d.getVar('BPN')
> -        prefix = d.getVar('MLPREFIX') or ""
> -        # Set the base package...
> -        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
> -        libcprefix = prefix + bpn + '-'
> -        for p in pkgs:
> -            # And all the subpackages.
> -            if p.startswith(libcprefix):
> -                renamed = p.replace(bpn, 'libc6', 1)
> -                d.setVar('PKG_' + p, renamed)
> -        # For backward compatibility with old -dbg package
> -        d.appendVar('RPROVIDES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> -        d.appendVar('RCONFLICTS_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> -        d.appendVar('RREPLACES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> -}
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index ede9e9b9096..8d3d76bb416 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -65,9 +65,21 @@ DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, loc
>   DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
>   DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
>   
> -inherit libc-common multilib_header
> +inherit multilib_header
> +
> +do_install() {
> +	oe_runmake install_root=${D} install
> +	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
> +	install -d ${D}${localedir}
> +	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
> +	# get rid of some broken files...
> +	for i in ${GLIBC_BROKEN_LOCALES}; do
> +		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
> +	done
> +	rm -f ${D}${sysconfdir}/rpc
> +	rm -rf ${D}${datadir}/zoneinfo
> +	rm -rf ${D}${libexecdir}/getconf
>   
> -do_install_append () {
>   	rm -f ${D}${sysconfdir}/localtime
>   
>   	# remove empty glibc dir
> @@ -108,6 +120,11 @@ do_install_append () {
>   	fi
>   }
>   
> +def get_libc_fpu_setting(bb, d):
> +    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
> +        return "--without-fp"
> +    return ""
> +
>   do_install_append_class-target() {
>   	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>   		install -d ${D}${sysconfdir}/tmpfiles.d
> @@ -233,6 +250,25 @@ stash_locale_package_cleanup() {
>   	stash_locale_cleanup ${PKGD}
>   }
>   
> +python populate_packages_prepend () {
> +    if d.getVar('DEBIAN_NAMES'):
> +        pkgs = d.getVar('PACKAGES').split()
> +        bpn = d.getVar('BPN')
> +        prefix = d.getVar('MLPREFIX') or ""
> +        # Set the base package...
> +        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
> +        libcprefix = prefix + bpn + '-'
> +        for p in pkgs:
> +            # And all the subpackages.
> +            if p.startswith(libcprefix):
> +                renamed = p.replace(bpn, 'libc6', 1)
> +                d.setVar('PKG_' + p, renamed)
> +        # For backward compatibility with old -dbg package
> +        d.appendVar('RPROVIDES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> +        d.appendVar('RCONFLICTS_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> +        d.appendVar('RREPLACES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
> +}
> +
>   pkg_postinst_nscd () {
>   	if [ -z "$D" ]; then
>   		if command -v systemd-tmpfiles >/dev/null; then
> 


