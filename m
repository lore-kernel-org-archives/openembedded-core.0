Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E06C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 18:22:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.16055.1642702940181805126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 10:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oQSV+gZ9;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id h23so5957806pgk.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=tdo+tJLvFvhLB/moion9xn6G/8jOgCFF5iJhDtZvQLM=;
        b=oQSV+gZ9sw7jTC+QXjdVdcy8Rmco3RmDblOHq+3iJvUEfma6MUemsfIQZ6cxN7Ayqr
         uii/hGHwNg/R5cjxmmMnSQYv3/LIBpt1bZgOKIHUuHAMpSsk0LTYfKNY3ghoMlld9Q1R
         RgBC/S7UGuY/KF2pNyzvcGWAS03uLLOVzWOx08NgSQtmJn5u7M8elbZSsboC22H3a8S/
         YMG5pI5X7Y7u7BpO8KMLPuIf/G22XHckqNb5Wo1dKiW1chZezlg7+UlrY5qFtk1ZDUeT
         0YcCFIWfB/G9s+1vtm6pgneXrwcPQYdzZuFFXSziqVk1eJdoFgq4oBKLNRIhhomyNUXi
         196A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=tdo+tJLvFvhLB/moion9xn6G/8jOgCFF5iJhDtZvQLM=;
        b=29XRnoFsQgtvZe9ehxJqp/V7y7d7bGXYucMbzyyOkU22nKGlUf4Q0vZ8Tb5wDrXzaa
         6zH4xeb+hEH9JI77GpbjViG9n+1RwWBdhcJSYT4tWuOfrmrjcvXtc/oVPkQ3E6f0MtPT
         ef11O6NnRH9Ujwd3oz9VVhpX9bFx67QAlqWDpusGDfLlnplLZEOkl0SceC5oB1RlW8co
         SC9l0U54ECyWlqgSrSbUwevNl+Mqh1jW8TDdYgnrSN6eJA1CzumC5OjUM8lmpy/IXgnN
         6t3su27in8eTYwWfBuuLIFd+1G1zkDRo55+b42KkKvnsLXvb4QGhP7G8FSEZV1wgxZPP
         FAAw==
X-Gm-Message-State: AOAM533VPAOCWdzlyl9NOOCgeJ/2SqCjsHIy32iX/nK18T8Dojj8Aalq
	M6tWgw7H0BfLKMRxuCNwAvs=
X-Google-Smtp-Source: 
 ABdhPJymBQuT1nqqGdhlzD58DPlctn4DF/8M/ztQdDTG/kJjJ9vAgLapn3r4pJal03Xz6r1Hf0dtSA==
X-Received: by 2002:a05:6a00:70d:b0:4c0:1cbf:2394 with SMTP id
 13-20020a056a00070d00b004c01cbf2394mr37358405pfl.69.1642702939477;
        Thu, 20 Jan 2022 10:22:19 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:24de:b600:2f9e:a008?
 ([2601:646:9200:a0f0:24de:b600:2f9e:a008])
        by smtp.gmail.com with ESMTPSA id
 q17sm4903737pfk.50.2022.01.20.10.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 10:22:17 -0800 (PST)
Message-ID: <21df5cb5-2ac6-53aa-d731-04238fa7ad6e@gmail.com>
Date: Thu, 20 Jan 2022 10:22:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [OE-core] [meta-gnome][PATCH 1/2] geary: initial add recipe
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
References: <20220120151824.61601-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220120151824.61601-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 18:22:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160775

thanks for the patches, they should be sent to oe-devel mailing list.

On 1/20/22 7:18 AM, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../recipes-connectivity/geary/geary_40.0.bb  | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> 
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> new file mode 100644
> index 000000000..e4d07ad29
> --- /dev/null
> +++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "Geary is an email application built around conversations, for the GNOME 3 desktop."
> +SECTION = "network"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2a2244d5a13871ad950c55877546a6a2"
> +
> +DEPENDS = " \
> +	appstream-glib \
> +	cairo \
> +	enchant2 \
> +	evolution-data-server \
> +	folks \
> +	gcr \
> +	gmime \
> +	gnome-online-accounts \
> +	gsound \
> +	gspell \
> +	gtk+3 \
> +	icu \
> +	iso-codes \
> +	json-glib \
> +	libhandy \
> +	libical \
> +	libpeas \
> +	libsecret \
> +	libstemmer \
> +	libxml2 \
> +	sqlite3 \
> +	webkitgtk \
> +"
> +
> +RDEPENDS:${PN} = "gnome-keyring"
> +
> +inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala
> +
> +SRC_URI = " \
> +	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "gnome-${PV}"
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +
> +GIR_MESON_OPTION = ""
> +EXTRA_OEMESON = "-Dprofile=release"
> +
> +PACKAGECONFIG[libunwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
> +PACKAGECONFIG[tnef] = "-Dtnef=enabled,-Dtnef=disabled,libytnef"
> +PACKAGECONFIG[valadoc] = "-Dvaladoc=enabled,-Dvaladoc=disabled"
> +
> +PACKAGECONFIG ??= ""
> +
> +FILES:${PN} += "${datadir}"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160767): https://lists.openembedded.org/g/openembedded-core/message/160767
> Mute This Topic: https://lists.openembedded.org/mt/88560747/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

