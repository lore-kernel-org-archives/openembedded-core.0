Return-Path: <harisokn@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id E0C3A7317E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:51:48 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id tr5so42354050obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:reply-to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=KOS0oCVMQ7Z7dmVle3NNlWKLGfOcNUqq2yP0o24s11w=;
	b=IO+/hCNniQwWt9DAoHuwTyc+Kkk4ZBBdePSS6Wc3BgHWE5qSLGUy5U71zMChJEjPSn
	eIXiz0h+bgpIxB9M84mCr4tyDgKJgRSIqB3r6K/X7wP/SDH3qAgS59M+484B3qQgqhFm
	ueA/2/Rx/0ig26UGokxntf/6ihviF0pCyDaweulEY5l3jktFm59b/Wopf2TV4OahBQn/
	LDU4ZPKcsyCcFx5LyWHQEfbWbdIezvP+s/coPSkVWmSIcZ1L8+KDOh9u/n9d98YJ6Bh5
	FKvSE3jq668yxYgtZ0YEZ5hV5QCwAVSz1S6hXrHFFF/6FRRwDHktJX+TgZqr8cxuFN2T
	mZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:reply-to:from
	:message-id:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=KOS0oCVMQ7Z7dmVle3NNlWKLGfOcNUqq2yP0o24s11w=;
	b=HXP466sXY+9yQVfzVMbYQFePws5jsURAoFWVx1y0LdvC0PlOPIzZOC0+HibCcuSUJT
	qEAgJihL3IzJA7L1ZO10X6PK95eCxqku5x0lUMLkgXOkDLHAzfXCcTPi1kYdRozRDnAw
	21LtjybTbw3hR8IhTTi7QtrERhrjg77KWMqzXQvaFxdAgp9iAPFAdwvmtDBZ2ZV7rjMc
	EQYNMVUzDlfLmAo+ech/X/QxdGAvttf5CVevostwniCFErHl/bLRed5uMkPDycngkVf1
	+lZ5t2sX5p01F81T2KOwL6TE8amk4BGVXvfP2iT0d3jxXEakNrVeaSBx/R+yjYZCptK7
	PAhg==
X-Gm-Message-State: ALoCoQnRkxjPirNurvNsHxBFZaiC2nVE/LKJSsQAhz/RCwDtru/2BdkVRLF54P0qCbyUM0TiMfzdU5d3fxxSwiRGCE1ev28JXQ==
X-Received: by 10.182.65.138 with SMTP id x10mr25014443obs.39.1453240309118;
	Tue, 19 Jan 2016 13:51:49 -0800 (PST)
Received: from [192.168.1.100] (cpe-72-182-40-142.austin.res.rr.com.
	[72.182.40.142]) by smtp.gmail.com with ESMTPSA id
	q188sm16443480oih.11.2016.01.19.13.51.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 13:51:48 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
	<1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
	<1450139152-19802-2-git-send-email-haris.okanovic@ni.com>
Reply-To: Haris Okanovic <haris.okanovic@ni.com>
From: Haris Okanovic <harisokn@gmail.com>
Message-ID: <569EAFF2.3010500@gmail.com>
Date: Tue, 19 Jan 2016 15:51:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1450139152-19802-2-git-send-email-haris.okanovic@ni.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH 2/2] bitbake.conf: Define source package, disabled by default
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
X-List-Received-Date: Tue, 19 Jan 2016 21:51:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Are there any other issues with this change?

Andre raised a few several weeks ago, when this was still an RFC*. Those 
were all addressed in the initial patch.

* http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660

-- Haris


On 12/14/2015 06:25 PM, Haris Okanovic wrote:
> Add ${PN}-src to PACKAGES with a default set of FILES_{PV}-src
> per FHS:
> https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html#usrsrcSourceCode
>
> Define a staging directory SRC_D under ${D}.
>
> Define ENABLE_SRC_INSTALL to enable source staging via package.bbclass's
> do_install_source() task. It's disabled by default, but may be
> overridden by distro configs or individual recipes as needed.
>
> This is change is part of a series which add source packages to OE.
> See the following thread for more information:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>   meta/conf/bitbake.conf | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 06971da..4674288 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -36,6 +36,7 @@ export systemd_unitdir = "${nonarch_base_libdir}/systemd"
>   export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
>   export nonarch_libdir = "${exec_prefix}/lib"
>   export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
> +srcdir = "${prefix}/src"
>
>   # Architecture dependent paths
>   export bindir = "${exec_prefix}/bin"
> @@ -267,7 +268,7 @@ SOLIBSDEV = ".so"
>   SOLIBSDEV_darwin = ".dylibbroken"
>
>   PACKAGE_BEFORE_PN ?= ""
> -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> +PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>   PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>   FILES = ""
>
> @@ -313,6 +314,12 @@ ALLOW_EMPTY_${PN}-dbg = "1"
>
>   FILES_${PN}-locale = "${datadir}/locale"
>
> +FILES_${PN}-src = "${srcdir}/${PN}"
> +SRC_D = "${D}${srcdir}/${PN}"
> +
> +ENABLE_SRC_INSTALL = "0"
> +ENABLE_SRC_INSTALL_${PN} = "${ENABLE_SRC_INSTALL}"
> +
>   # File manifest
>
>   FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
>

