Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0A4789E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:58:13 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id b66-v6so4666403qkj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vrtUShvb6Qovh9h486At2q0hhslqD051ORCRkvqRPpo=;
	b=jKIZfb6Aa0EYMNgv8HJX4ejgCc1RURO/Vns60BW4hDf7O0XHTsgvhOFk9x6iWue1t6
	qGsrvtVh+bjUz/CFaWylvxHRhJcD+G0ryRkyf8I1g+34yJrrCzK8UceMhIlKFo7GEgcU
	ccq9dM3guAPg/ZUYHCut3oZ/juui7OBq1Lx8Jfjoi+RHHDnn3HAzFvwRvCQlxBqopdn2
	orIcKsL2QP07XGAVMdYId4iEUrxln/eQOq5o61ARyR423mWxkGVcgtxLlJdyOLkRz5Hb
	hwNx6PCcRDxerMIhBmZbTTe1LOClh6SRYQZq2SCwuUSNLdoV0wE1p+YTa3s9N/EME/Hw
	PUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vrtUShvb6Qovh9h486At2q0hhslqD051ORCRkvqRPpo=;
	b=q//6stouWmoOMD0zM36hF31sFaMWO/ixn6eMursh2bpoKsycgqT1JpNX/pFYKGUI98
	2LTFjGC7KbiLn+adKRlJ702aZ3blo0O742T3GxVjtUiHuzcZP6n3wVJ32L1d1AEy7Z8S
	TCxvj3b0WVFL8K5b8gPNgg4HVKt69daRx6Ad8fgTdhc4Qc6N4LHEonM9pclViKQ3zpMC
	H4izz9fGhLuQ4KjLF+HihXS9zws7DeJChePx2G9eZWLMVVyk6VaVfXPj7cmI066/QgzZ
	D4nnhC2QwJM9/rZH35A4QjYCq8ue6S1J2a/PpaXLh5bjYDIJonoTN4IhBZJUZ+EbzTAD
	ADAA==
X-Gm-Message-State: AOUpUlGwzjN51xZyxL3dogO/ZPF2NQVkLxFzR++JtzGE9wp/S9H6/0aL
	cS6QsnlKkt4eMB2o9lrmH56M7W3vXLuxSVBjFac=
X-Google-Smtp-Source: AAOMgpdA140U8Y3Y/UZi2plYOzXvFJvRIM2I3jz4Rq+IrWgbpIDPbKkmkVk1KrRjw3A8oTD1HmMXuv6Udy1Xj5L/9bU=
X-Received: by 2002:a37:8f41:: with SMTP id
	r62-v6mr10119044qkd.412.1532019493918; 
	Thu, 19 Jul 2018 09:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
	<66fc8713-3bf4-add4-0026-dbd029c8fea2@gmail.com>
	<828545568.7654.1532017538070@mail.vodafone.de>
In-Reply-To: <828545568.7654.1532017538070@mail.vodafone.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jul 2018 09:57:45 -0700
Message-ID: <CAMKF1sq1jzJvH5sv=7tfYVzt4UPwxjfgRxvaBAA8HmZmQUtjfQ@mail.gmail.com>
To: Betacentauri <betacentauri@arcor.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnss-mdns: Fix search path for avahi socket file
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
X-List-Received-Date: Thu, 19 Jul 2018 16:58:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 9:25 AM <betacentauri@arcor.de> wrote:
>
> There are several ways to fix it.
>
> 1. Patching Makefiles (see patch in the ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12843)
>
> 2. Add localstatedir = "/"
>
> 3. Adding --localstatedir=${root_prefix} to EXTRA_OECONF
>
> 4. Don't fix it as /var/run should be a link to /run.
>
>
> So what is the preferred solution?
>
>

I think using root_prefix to point to localestatedir might be ok.


> Khem Raj <raj.khem@gmail.com> hat am 5. Juli 2018 um 19:48 geschrieben:
>
>
> On 7/5/18 10:26 AM, Betacentauri wrote:
>
> Since v0.7 avahi uses /run/avahi-daemon/socket.
> libnss searches in $(localstatedir)/run/avahi-daemon/.
> Set localstatedir to / to fix mdns resolving.
> ---
> meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index 5be5e4f..d0eb276 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d81
>
> S = "${WORKDIR}/nss-mdns-${PV}"
>
> +localstatedir = "/"
> +
>
>
> Adding --localstatedir=${root_prefix} to EXTRA_OECONF perhaps is better
> for description.
>
> inherit autotools
>
> EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"

