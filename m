Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 90C966C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:46:56 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id y204so3545916itf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/csJrT+vgTfnxcOA1FymWKsWzdd05cjkkIl/iaQ+S9Q=;
	b=B5IuPeKdVgCm8l9ga0PovxGVvfSxH9UfvjW39RKqDyE1NyJLS/mq4hfQ28PTed2yJq
	JeY7GXSNuvg1rLcbZTqJdh8o9RWf83CiraiKmzjNlDhojA/I88cgc9dPWK2pxLUQj5J1
	72DVKZW5XEfTTf/SctHUl+cH5s6fqD7FpHqamek3r+EGph5WyY1BGKHWS6somK4pQs4O
	tYe59w6VrWG9jkMlB6pMABzlBvhglahp24kTWQiFb1+tNXR1mTtke2E4R8P4iCuQS70V
	flLGWvgsT66xHjWqr23BBHCVfmeyafZMxWbcCmveW7cwUU183AxWSNTZekYhXctbv3FP
	7dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/csJrT+vgTfnxcOA1FymWKsWzdd05cjkkIl/iaQ+S9Q=;
	b=FO2XvAYJ1r607baW1KyTDTCcSwynJNfkAsKoDjs5U2vXAwZZv+V1yc1fOBxd7eSA1l
	osRE7vt9PB0ozyenzB+zmknhfT9ZQhDubReGx9VvHOoxsbnh1/WEhIXG/+VfqixWVY9b
	iZ8Uc4FJcbNBJWElQPNUOEQha4k1wvwzVvJWJ+XydJcov53niRfmwZbBGYidBwERzqi9
	VGN0Or5pbmBBatmn1mLA+GXW+YM71KvYCoxnKDzdXML7LHZySTydnEXIzIN+SBnZrdTS
	KVF/0Dnd3uCqSJdgsso+hAOlCXIuYanC/eWEialguBALxJP40R6fvuZ6tpFt60PJTtQS
	JDqw==
X-Gm-Message-State: APjAAAVkSO0FDsqDgED8ZDhNvSrQFnyG0ifwBiRhLdwcn/S0Hg4pA8cr
	/SLn5b0OvSePHM6w2S2bic8m/bsB8yGxwlIuoZZpothD
X-Google-Smtp-Source: APXvYqw2Tb65qUSZhTgbgfJ6gEl2l88EL0jseGEJ+qj+wI4mzcdhW670LIf3dLPOB3UZPhYiuQ+mEG5Jp71m3dJuv0Q=
X-Received: by 2002:a24:d643:: with SMTP id o64mr3095767itg.148.1554191217534; 
	Tue, 02 Apr 2019 00:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190402074427.26561-1-kai.kang@windriver.com>
In-Reply-To: <20190402074427.26561-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 08:46:45 +0100
Message-ID: <CAJTo0La4V_Wo74ZntnALqPfAYsrKsSGkibnx60mRwjqAG5Sn9A@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] avahi: fix CVE-2017-6519
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
X-List-Received-Date: Tue, 02 Apr 2019 07:46:56 -0000
Content-Type: text/plain; charset="UTF-8"

The patch itself says two CVE IDs, so can you put them both in the
path header with your SOB please?

Ross

On Tue, 2 Apr 2019 at 08:45, <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch to fix CVE-2017-6519.
>
> CVE: CVE-2017-6519
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc     |  4 +-
>  .../avahi/files/fix-CVE-2017-6519.patch       | 48 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 11846849f0..8339e451f5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
>                      file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
>
> -SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
> +SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
> +           file://fix-CVE-2017-6519.patch \
> +           "
>
>  UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
>  SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
> diff --git a/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch b/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
> new file mode 100644
> index 0000000000..7461fe193d
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
> @@ -0,0 +1,48 @@
> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/e111def]
> +
> +CVE: CVE-2017-6519
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From e111def44a7df4624a4aa3f85fe98054bffb6b4f Mon Sep 17 00:00:00 2001
> +From: Trent Lloyd <trent@lloyd.id.au>
> +Date: Sat, 22 Dec 2018 09:06:07 +0800
> +Subject: [PATCH] Drop legacy unicast queries from address not on local link
> +
> +When handling legacy unicast queries, ensure that the source IP is
> +inside a subnet on the local link, otherwise drop the packet.
> +
> +Fixes #145
> +Fixes #203
> +CVE-2017-6519
> +CVE-2018-1000845
> +---
> + avahi-core/server.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/avahi-core/server.c b/avahi-core/server.c
> +index a2cb19a8..a2580e38 100644
> +--- a/avahi-core/server.c
> ++++ b/avahi-core/server.c
> +@@ -930,6 +930,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
> +
> +     if (avahi_dns_packet_is_query(p)) {
> +         int legacy_unicast = 0;
> ++        char t[AVAHI_ADDRESS_STR_MAX];
> +
> +         /* For queries EDNS0 might allow ARCOUNT != 0. We ignore the
> +          * AR section completely here, so far. Until the day we add
> +@@ -947,6 +948,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
> +             legacy_unicast = 1;
> +         }
> +
> ++        if (!is_mdns_mcast_address(dst_address) &&
> ++            !avahi_interface_address_on_link(i, src_address)) {
> ++
> ++            avahi_log_debug("Received non-local unicast query from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
> ++            return;
> ++        }
> ++
> +         if (legacy_unicast)
> +             reflect_legacy_unicast_query_packet(s, p, i, src_address, port);
> +
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

