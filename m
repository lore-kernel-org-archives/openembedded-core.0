Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCB27F7B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:06:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b19so9568272pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=m547+2Iv+HT1TAhLh8i8bIGnX4nn+17Ul6x5XnFiH5U=;
	b=ZEHQeK76sw8widdyYfLSMAgjN0E+tXPiNSRZt4UCzeGLWNKxXIbZ+TTXFG6tlSnYIz
	Hnqr+tkR50qrySkH5Hc7shK6/6FbjeFtITO49q6X0RRvLEfTc1t+fVZo2u8zREskvo+O
	UQZqgMiv7Vn9mWyJFSgdtSfIygLi/E3Ta57L2FJuDFVL6iufEjmUCwgJf/3pz9ngCvpM
	48oGA/WXly8FUeW3IaBYhcmy1nVoOR//PptcPlQvOKY5nfjIfQMkr2pxFOylrpmHC6si
	vJUHdT3OfGFOSMJUQVugjRXLXcBmnSTtUASCHZBtnbeVIhea0wmrAOyWRg9HFgMB6aa5
	HECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=m547+2Iv+HT1TAhLh8i8bIGnX4nn+17Ul6x5XnFiH5U=;
	b=Rq9AI0xNR9MO68ovFi9UiMQt4P3fl7W3nxd1YAupXKSqmzcNms4ZP9KIEHwyxjj1Cf
	nNxFLR0pzj6vEOuCEfEnz4HS/FDTmTvueoxP1E5N3LqoC75XP5be7Enbj/j2iRCilb2/
	VKfzJtKr38OKXoJ/JUcBNAaPoh6+h9Esymf9E4Suy5Dvws3vsdN+SJrGWBMygHtqOLP/
	lak+nl+L5PPsVUxdI+H+AmzU0OA6oow+ZRLV7BHChO2BQebEgTQ+u/6vkhYCYkrB+mAK
	2UWYxYaTUW3lv+JMuQPu/CyZ2IdompM1KQmWgPJejoqD9vffKdrMS8r0/Zp9Vg6ukRvh
	nAtg==
X-Gm-Message-State: APjAAAUK21VDxXSFOrxQA0KVjUMpH2m4p3z/95G2jLqukqlmTUvOEujJ
	xk8AiK4oGuwntHSMrtL5dmWH+uf6Fmw=
X-Google-Smtp-Source: APXvYqyorXGpML2imJZEuF8oAp+S0You2AnaAPYXdawiHkvfSo2M9Z60hycfmOEsmyV94TYlYHAFSQ==
X-Received: by 2002:a63:ea09:: with SMTP id c9mr40641475pgi.232.1574791571624; 
	Tue, 26 Nov 2019 10:06:11 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	s13sm13661810pfc.110.2019.11.26.10.06.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:06:11 -0800 (PST)
Message-ID: <463f7c99f0ca6e249716679aa28b15b152474a80.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Cengiz Can <cengiz@kernel.wtf>, openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 10:06:06 -0800
In-Reply-To: <20191126133943.124402-1-cengiz@kernel.wtf>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Tue, 26 Nov 2019 18:06:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-11-26 at 16:39 +0300, Cengiz Can wrote:
> Currently OE-Core's systemd-timesyncd defaults to Google's time
> servers.
> 
> However those servers are not always reachable.
> 
> ```
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.12:123
> (time4.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.0:123
> (time1.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.4:123
> (time2.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.8:123
> (time3.google.com).
> systemd-timesyncd[242]:
>   Timed out waiting for reply from 216.239.35.12:123
> (time4.google.com).
> ```
> 
> Even if they are, it is much more sensible to use pool servers from
> ntp.org.
> 
> This patch adds a default timesyncd.conf with Google's time servers
> moved to Fallback and pool.ntp.org as primary time servers.
> 

if we want to make this change then we should also let users know about
any restrictions on its use will be imposed by moving to new servers,
my suggestion would be to stay with defaults as it is, and have
bbappends in own layers to point to time servers suitable for your
projects. 

> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  .../systemd/systemd-conf/timesyncd.conf         | 17
> +++++++++++++++++
>  meta/recipes-core/systemd/systemd-conf_243.bb   |  3 +++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-
> conf/timesyncd.conf
> 
> diff --git a/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> new file mode 100644
> index 0000000000..84fdc354b8
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
> @@ -0,0 +1,17 @@
> +#  This file is part of systemd.
> +#
> +#  systemd is free software; you can redistribute it and/or modify
> it
> +#  under the terms of the GNU Lesser General Public License as
> published by
> +#  the Free Software Foundation; either version 2.1 of the License,
> or
> +#  (at your option) any later version.
> +#
> +# Entries in this file show the compile time defaults.
> +# You can change settings by editing this file.
> +# Defaults can be restored by simply deleting this file.
> +#
> +# See timesyncd.conf(5) for details.
> +
> +[Time]
> +NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
> +FallbackNTP=time1.google.com time2.google.com time3.google.com
> time4.google.com
> +
> diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb
> b/meta/recipes-core/systemd/systemd-conf_243.bb
> index d9ec023bfd..238bca9373 100644
> --- a/meta/recipes-core/systemd/systemd-conf_243.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_243.bb
> @@ -11,6 +11,7 @@ SRC_URI = "\
>      file://system.conf \
>      file://system.conf-qemuall \
>      file://wired.network \
> +    file://timesyncd.conf \
>  "
>  
>  do_install() {
> @@ -18,6 +19,7 @@ do_install() {
>  	install -D -m0644 ${WORKDIR}/logind.conf
> ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
>  	install -D -m0644 ${WORKDIR}/system.conf
> ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
>  	install -D -m0644 ${WORKDIR}/wired.network
> ${D}${systemd_unitdir}/network/80-wired.network
> +	install -D -m0644 ${WORKDIR}/timesyncd.conf
> ${D}${sysconfdir}/systemd/timesyncd.conf
>  }
>  
>  # Based on change from YP bug 8141, OE commit
> 5196d7bacaef1076c361adaa2867be31759c1b52
> @@ -35,4 +37,5 @@ FILES_${PN} = "\
>      ${systemd_unitdir}/logind.conf.d/ \
>      ${systemd_unitdir}/system.conf.d/ \
>      ${systemd_unitdir}/network/ \
> +    ${sysconfdir}/systemd/timesyncd.conf \
>  "
> -- 
> 2.24.0
> 


