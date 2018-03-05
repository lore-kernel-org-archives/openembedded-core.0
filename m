Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C6EF778A1B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:24:22 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j20so7485896pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=d75FeHYn+qc71S/G9omBDBotb/jqLSLmWNRBOxAbYtw=;
	b=cMKWPJgQCj35yxSpCTdjHN8GX/m47+viwmzas4Rdi3ms+OuO20hm8B9IdCUwNG0rZW
	+Tg4wJ4Hw0ikMVS5S123sIYWy+yopGDgUqXou2dTfXgxvPBKaND8wlQJwb1ejPetT79X
	C5OZO2lpdz7xsSPoOk9IxF7H+Xh3BpUxq5+O4tdvj/enqGFuDsjiqxFVEgnd36QEnHnv
	vIncYue9aNqE6U/QjDFaIqkiNSxFcH50wIbCaTHpQxVO6tbkWsE0TPGNgRME9PhbWUvy
	krmbPHSwdBlHi/dI4p87E2Qz6j3NiRV4tRvDrPmHkuaxkCJwTPBGr/Gpbf6K/4n5znYx
	oTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d75FeHYn+qc71S/G9omBDBotb/jqLSLmWNRBOxAbYtw=;
	b=MYqnQQYVFDgtoBhVTY/7QCd8/TbqcEMBJi+ZzQozdgxo4gBdIs4ARKsSIdiaCYNEnI
	fzGYRLiWnFUXBz3KtY4B+s3VltqKW8KfDdmNUkIIYOug1IvooEa9ynJiiSDgvra+8k4e
	e6W64lvurAAEFVhukmIDF0CNA2MVFVA54jsVr9keT/7SobaQI7IcHsJN9aySHN1+rLst
	DmA5J7PGPPDHQL2Sox27zT9OFm4HRDBlB5PJzyxISORNoXNqSRYIykQRTJEELcIp6/Il
	K5M/RQeTotKyFQ+h8IUY7GaAyw2IUyjcD5CF0KoQaINIY8q26OWtVjZ5D/Ce9Y2Z8tPT
	p8bg==
X-Gm-Message-State: APf1xPBW/2KH/YpeLNehL4vao9bA+czP7hv+XOOTwaxQGUCXaNYc3lBg
	+ETaHtWPgsySPh/TswOII2gW6w==
X-Google-Smtp-Source: AG47ELsurJn5HSz978/Q87O6caVyrQAcYjDqC5n+WIlbe8sxo3+M6075GI+j45XJCI3keX4MN1LDjg==
X-Received: by 10.98.68.154 with SMTP id m26mr15662761pfi.171.1520270663764;
	Mon, 05 Mar 2018 09:24:23 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:95c8:2b55:de97:f11f?
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	125sm24506286pff.114.2018.03.05.09.24.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:24:23 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-2-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
Date: Mon, 5 Mar 2018 09:24:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180305172046.21729-2-ross.burton@intel.com>
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:24:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/05/2018 09:20 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Why do this patches need to be refreshed?

- armin
> ---
>  meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> index fbb49678282..32e76117188 100644
> --- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> +++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
> @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
>  Signed-off-by: Kevin Tian <kevin.tian@intel.com>
>  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>  
> ---- dbus-glib-0.70/dbus/Makefile.am.orig	2006-07-23 16:04:43.000000000 +0200
> -+++ dbus-glib-0.70/dbus/Makefile.am	2006-07-23 16:04:52.000000000 +0200
> +Index: dbus-glib-0.108/dbus/Makefile.am
> +===================================================================
> +--- dbus-glib-0.108.orig/dbus/Makefile.am
> ++++ dbus-glib-0.108/dbus/Makefile.am
>  @@ -1,4 +1,4 @@
>  -SUBDIRS = . examples
>  +SUBDIRS = .
>   
> - INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@DATADIRNAME@/locale\" 
> - 
> + AM_CPPFLAGS = \
> + 	-I$(top_srcdir)						\


