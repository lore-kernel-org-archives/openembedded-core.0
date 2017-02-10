Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3653A7749B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 17:54:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so3633538pge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=E4yowjy56VjfP5Nf/0lxaInkws3wYg0GUDSB67GVaoM=;
	b=BSDtRPxy7EJGjfuCdD/HicY+RZ3g2w1aBrAqySTWDAWp/+dCqB5e3rkqK/JAxJo5fI
	bhDKsZ83gTPDDwH5xSixZLfZGlD25WVZP0DUMYPtdALn8oqNKMwaGXFwc/4nfvadIgMJ
	Y8wGGw7PZaWnBqzyfSfprf00j9caeb7E7Is3n+WLL2LZ+olPwZCAJcysmZxiB5yqJbzW
	EvzJAJBzAfdvvVY6ph7M9IPEr5hU8GShDMcjFA189KDVdt2e4g/DyYrAevHPKgrPFyB4
	u5JjzutgSI6dZVWW5V87LrDKeUiifyQgVtoo4atAb1dq6oBEoFrFse76HEix5xJhgooX
	1vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=E4yowjy56VjfP5Nf/0lxaInkws3wYg0GUDSB67GVaoM=;
	b=lR1HX/q0HmUn2N03ZwsvHRHHlZZeZujeqExhK0B0zBKQtYWnQsK/pa0+urtjKf/7UG
	H0nfibwlAyy62SHn7SrYOUp1gQHwn4I/nrLTguN+pJYndc8wP1qorDz6mA9Uk9P5vijj
	dOz7JvQastJQK+5eBdr4btkaoed01LjHKw+THdxImt+Pr0n4I3gubZSfXurgUicOpFkT
	nhaR2brh791tgXKq60M11i4cyada02GNfnmEsho/IWiF6txdpzGzEqivV5G6xtrXPOgF
	Uw+wHlQ2dys8f0lJab2EeRGRcUV7645oSDExCk+4ygusj+7hN4BDBIj9rz0Y3GzECQkO
	3Ytw==
X-Gm-Message-State: AMke39kQBn9mEh3t8e36lGozzXBxT9Jl+6MQn3DXz7w9dBzkgynDEHbeKqW16bKvJ9UaIQ==
X-Received: by 10.84.216.24 with SMTP id m24mr13152515pli.22.1486749268175;
	Fri, 10 Feb 2017 09:54:28 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:9075:bc4c:9a92:4854])
	by smtp.gmail.com with ESMTPSA id
	b67sm6900062pfj.81.2017.02.10.09.54.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 09:54:27 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1486730549-17608-1-git-send-email-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <cbe43f85-b9c7-1e94-face-bde91529107f@gmail.com>
Date: Fri, 10 Feb 2017 09:55:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1486730549-17608-1-git-send-email-andrej.valek@siemens.com>
Subject: Re: [PATCH] lighttpd: Upgrade 1.4.43 -> 1.4.45
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
X-List-Received-Date: Fri, 10 Feb 2017 17:54:28 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/10/17 4:42 AM, Andrej Valek wrote:
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb | 84 -----------------------
>  meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb | 84 +++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 84 deletions(-)
>  delete mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
> 

its hard to look at what might have changed along with upgrade unless
you let git detect copies and moves a bit harder when generating patches


> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
> deleted file mode 100644
> index f70f9b7..0000000
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -SUMMARY = "Lightweight high-performance web server"
> -HOMEPAGE = "http://www.lighttpd.net/"
> -BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
> -
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
> -
> -SECTION = "net"
> -RDEPENDS_${PN} = "lighttpd-module-dirlisting \
> -                  lighttpd-module-indexfile \
> -                  lighttpd-module-staticfile"
> -RRECOMMENDS_${PN} = "lighttpd-module-access \
> -                     lighttpd-module-accesslog"
> -
> -SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
> -        file://index.html.lighttpd \
> -        file://lighttpd.conf \
> -        file://lighttpd \
> -        file://lighttpd.service \
> -        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
> -        "
> -
> -SRC_URI[md5sum] = "95eda531c27b161ef8fa2b9bf4948caf"
> -SRC_URI[sha256sum] = "fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a"
> -
> -PACKAGECONFIG ??= "openssl pcre zlib \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
> -"
> -PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
> -PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
> -PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
> -PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
> -PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
> -PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
> -PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
> -PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
> -PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> -PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
> -PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
> -PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> -PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> -PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
> -PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
> -PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
> -PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
> -PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
> -PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
> -
> -inherit autotools pkgconfig update-rc.d gettext systemd
> -
> -INITSCRIPT_NAME = "lighttpd"
> -INITSCRIPT_PARAMS = "defaults 70"
> -
> -SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> -
> -do_install_append() {
> -	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
> -	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> -	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
> -	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
> -
> -	install -d ${D}${systemd_unitdir}/system
> -	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
> -	sed -i -e 's,@SBINDIR@,${sbindir},g' \
> -		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -		-e 's,@BASE_BINDIR@,${base_bindir},g' \
> -		${D}${systemd_unitdir}/system/lighttpd.service
> -	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
> -	ln -sf ${localstatedir}/log ${D}/www/logs
> -	ln -sf ${localstatedir}/tmp ${D}/www/var
> -}
> -
> -FILES_${PN} += "${sysconfdir} /www"
> -
> -CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
> -
> -PACKAGES_DYNAMIC += "^lighttpd-module-.*"
> -
> -python populate_packages_prepend () {
> -    lighttpd_libdir = d.expand('${libdir}')
> -    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
> -}
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
> new file mode 100644
> index 0000000..c82d93b
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
> @@ -0,0 +1,84 @@
> +SUMMARY = "Lightweight high-performance web server"
> +HOMEPAGE = "http://www.lighttpd.net/"
> +BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
> +
> +SECTION = "net"
> +RDEPENDS_${PN} = "lighttpd-module-dirlisting \
> +                  lighttpd-module-indexfile \
> +                  lighttpd-module-staticfile"
> +RRECOMMENDS_${PN} = "lighttpd-module-access \
> +                     lighttpd-module-accesslog"
> +
> +SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
> +        file://index.html.lighttpd \
> +        file://lighttpd.conf \
> +        file://lighttpd \
> +        file://lighttpd.service \
> +        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
> +        "
> +
> +SRC_URI[md5sum] = "a128e1eda76899ce3fd115efae5fe631"
> +SRC_URI[sha256sum] = "1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760fc43a3f"
> +
> +PACKAGECONFIG ??= "openssl pcre zlib \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
> +"
> +PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
> +PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
> +PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
> +PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
> +PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
> +PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> +PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
> +PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> +PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> +PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
> +PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
> +PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
> +PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
> +PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
> +PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
> +
> +inherit autotools pkgconfig update-rc.d gettext systemd
> +
> +INITSCRIPT_NAME = "lighttpd"
> +INITSCRIPT_PARAMS = "defaults 70"
> +
> +SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
> +	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> +	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
> +	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' \
> +		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +		-e 's,@BASE_BINDIR@,${base_bindir},g' \
> +		${D}${systemd_unitdir}/system/lighttpd.service
> +	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
> +	ln -sf ${localstatedir}/log ${D}/www/logs
> +	ln -sf ${localstatedir}/tmp ${D}/www/var
> +}
> +
> +FILES_${PN} += "${sysconfdir} /www"
> +
> +CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
> +
> +PACKAGES_DYNAMIC += "^lighttpd-module-.*"
> +
> +python populate_packages_prepend () {
> +    lighttpd_libdir = d.expand('${libdir}')
> +    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
> +}
> 

