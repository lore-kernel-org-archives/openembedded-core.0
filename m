Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3E1977182
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:57:26 +0000 (UTC)
Received: by lffy185 with SMTP id y185so110717408lff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 05:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=pWVE4VkP805QitpbFVvMRUtiqLwcF7XdJYmW1bnw8SI=;
	b=EBijWIn2r+vbO5wyMuTE8d89GT5KZ7CLkywTAkNcgU4fGuFuhEJeHt3kpKNdTThIOz
	cuBuK5/VVQ9vCdYHHtZF6QAoJVuQ2DfMpKsgDeKiQozFTWPOewBUVuQssx82KSSOvONb
	GlMRL/Inzg4+rFg94HtMs/MNPkuXeFYCkPZV/fVaAf4+YTyvHSpHE5D9ptY70izdMgVQ
	b+knlSN+/nJspPmDpq3dWiywsXLqzEmOOQZEDCRS02PYpMWUB95+aLHzhLWkW2N6kD7Y
	FmPo+NC/mhRipjh4nvDYtuYdV9UU8jMVzp/xifyhmUqFrgPQjZBkxAmLWq/bnSdUum/e
	/UsA==
X-Gm-Message-State: ALoCoQlmIsWzvKPeHlnwkCAgAO9cIVgcK9wOTPUoc8u49l4GfIrHSvI1okJi/8ZQjc0CFpFWxv03
X-Received: by 10.25.157.131 with SMTP id g125mr9545563lfe.75.1445259445473;
	Mon, 19 Oct 2015 05:57:25 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	k186sm1553459lfg.8.2015.10.19.05.57.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 05:57:24 -0700 (PDT)
Date: Mon, 19 Oct 2015 14:57:22 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151019125722.GC16160@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
	<013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/6] systemd: build with compatibility libraries
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Joshua Lock <joshua.lock@collabora.co.uk> [151016 17:52]:

> There are recipes in the Core metadata that have optional systemd
> support but expect the old, separate, libsystemd-foo pkg-config files
> (not the newer unified libsystemd).

Any size impact? Just wondering as you're changing the default.
(Assuming that it was off by default previously?)

Cheers,
Anders


> -PACKAGECONFIG ??= "xz ldconfig \
> +PACKAGECONFIG ??= "xz ldconfig compat \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> @@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>  PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
>  PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
> +PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"

>  CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
>  CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
Anders Darander
ChargeStorm AB / eStorm AB

