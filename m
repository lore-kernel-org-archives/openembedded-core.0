Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D677AC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:22:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.1699.1642710170785387024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 0EC41A509
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 21:22:48 +0100 (CET)
Received: from [192.168.178.83] ([84.163.38.111]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAdxH-2avBVR0; Thu, 20 Jan 2022 21:22:47 +0100
Subject: Re: [OE-core] [meta-gnome][PATCH 2/2] folks: initial add recipe
To: openembedded-core@lists.openembedded.org
References: <20220120151824.61601-1-f_l_k@t-online.de>
 <20220120151824.61601-2-f_l_k@t-online.de>
 <CAMKF1soam8JqD=T8tD+2gMX4rkdzb790dsOOkPMachEHTsFbnw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <e01a9599-42a7-187d-c72a-2b057652b51b@t-online.de>
Date: Thu, 20 Jan 2022 21:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1soam8JqD=T8tD+2gMX4rkdzb790dsOOkPMachEHTsFbnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642710167-00013579-F99F69B1/0/0 CLEAN NORMAL
X-TOI-MSGID: dc76130c-e5ac-4ac2-bac1-18f7413e6cfd
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160781

mmmh. Whats the error message ?

I can build folks like this for aarch64 and x86-64

Am 20.01.22 um 21:11 schrieb Khem Raj:
> +SUMMARY = "Folks is a contact aggregation library."
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM ="file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    libgee \
> +    dbus-glib \
> +    telepathy-glib \
> +"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +GIR_MESON_OPTION = ""
> +
> +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false -Dofono_backend=false -Dtelepathy_backend=false"
> +
> +inherit gnomebase gettext gobject-introspection vala features_check
> +
> +SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
> +

