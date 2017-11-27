Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 868357837A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:04:22 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 62so8939727plc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G3FPmcqNwq4jZz0dDDxmHe+ZEwNz8O89vOyYO99IaCs=;
	b=NBj//hJswEAvYGIdvl8vLXXUM2tTM6GwFs2sXVkyTRByT8bX4QHUc+Zy9HYFSGOhpK
	g0PjEvyw2s2AQ0Ja2oCLE/Aa4nTR0vL6CJ4J2m99m532tadDsllIeJWu2jzK0NpIdZ13
	ypmHE0SF2CTwwW2MNgR8Cd2hF2XnWfWnRYIHsodxEnWWykpXv6BkRPr5xUljbl3nrP7r
	akKsvQ9MaxDWdhz7i0cd3t5FmPAXDPTtv80CwsmHujyl6hjsRXUQsYiS30TTLZ4Cl4V3
	Bv4CniyMPRRpNTQwWGJ1f3UakEnWxLDcOXn+3NVWVb4efvLUCPBDNY43P638C5/sNHSE
	ECoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=G3FPmcqNwq4jZz0dDDxmHe+ZEwNz8O89vOyYO99IaCs=;
	b=r61NnFa+nDB85B262FFEYqv3fq9puZ5iOyy52mhayG7g9IM2wrbf66zY4oWK+hw0QJ
	OCUQfQ7ElixrNi/mbvjdJxAre8ifYWsZ8gs2Ap24VMNUTNVf3TwK3+w2UElicioEwLwR
	28vlkdcUAhdKXHrPD+PSE9hLVvw0X+INL198f8QvZgETf/EslzvcPTP/BTsEJ5wkiBSz
	Z0jWho7oSmY58+KCbOWnQJaulVFY0cTPx0TLkMqhnijwKWbBqouwN1JQUjfAejW5K+Gs
	zEYr98Tnc0myefKx0ZKYbMzjPj4pUEY42H0LCktG/fgTDVgXOZwqdaOMOYu/DbBhqj0g
	iZvA==
X-Gm-Message-State: AJaThX4eW/NAhWLCVdh66nhMpAjP90umJMx1N2bNYdN1oOVr5X/3xrS4
	ybeCVvIFB4bxzXWXqdB6vns9PtC3
X-Google-Smtp-Source: AGs4zMbpbH3IpvN09kKaKri04iUQx1pkrWd+wzLEc+6XO3LtiApQz3tCwZ8N3skulva6QfCdV+LchA==
X-Received: by 10.84.178.37 with SMTP id y34mr5406519plb.260.1511805863447;
	Mon, 27 Nov 2017 10:04:23 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	c11sm40997836pgv.42.2017.11.27.10.04.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:04:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20171127103517.6845-1-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8da72ea4-8a6f-848b-539c-63bfc7197cfb@gmail.com>
Date: Mon, 27 Nov 2017 10:04:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <20171127103517.6845-1-psaavedra@igalia.com>
Subject: Re: [PATCH] puppet: add recipe for puppet 4.10.9
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
X-List-Received-Date: Mon, 27 Nov 2017 18:04:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/27/17 2:35 AM, Pablo Saavedra wrote:
> Added Yocto recipe for Puppet 4.10.9
> 
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>   recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
> 
> diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
> new file mode 100644
> index 0000000..a335546
> --- /dev/null
> +++ b/recipes-support/puppet/puppet_4.10.9.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Open source Puppet is a configuration management system"
> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
> +
> +SRC_URI = " \
> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
> +    file://add_puppet_gemspec.patch \
> +    file://puppet.conf \
> +"
> +SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
> +SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
> +
> +inherit ruby

which layer is ruby.bbclass coming from ?

> +
> +DEPENDS += " \
> +        ruby \
> +        facter \
> +        hiera \
> +"
> +
> +RDEPENDS_${PN} += " \
> +        ruby \
> +        facter \
> +        hiera \
> +        ruby-shadow \
> +        bash \
> +"
> +
> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/puppet
> +    install -d ${D}${sysconfdir}/puppet/manifests
> +    install -d ${D}${sysconfdir}/puppet/modules
> +
> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
> +}
> 

