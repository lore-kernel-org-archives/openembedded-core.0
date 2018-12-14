Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 417FC6D23A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 14:54:37 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id p197so9681091itp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 06:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4ZgoEKbSO0iZ75s/w+DZs3tY2jUBr7htd/Py9nAUqbc=;
	b=lb9G3caxgSwwL8SCT8Wxv6qOfkrfxtEOJuW+vfz8NAgG6JRN8XwUUcSEL1l+ZgN0cc
	mCB0obDqHkdwJ3WHKBbuFerIGWaBPPaRdXn60V2F+vGuSbwlVYuxVmUZ3ignXPBzeOrM
	mNkgqOMvXzI9Ms62vIYDcycHUrpXTAExDmedejmaj8UMLq4zlFOBW6VzfrcUq1B5ihoA
	icyqpSvqdwS1nizu1PQFcgB0pKuQ8dCkidMfAExvfVO1skS4IidFoFbfnhK036v4s0Wy
	1YF4SRjP5Gf/VCvx/S4r0MIk3KMHAboQQ5sk5lEeOCeDG7CQWXrWOenbbYIYAW2Vp8J/
	wKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4ZgoEKbSO0iZ75s/w+DZs3tY2jUBr7htd/Py9nAUqbc=;
	b=gZv+CLSHo31VWgRTYQ71JVEBeSaajPLKKF+YFm6axVHT49EfFosAtksrVHJu57G3Vj
	jUqm55Rk8bBnSNODES28pAj//U/pKd+rUgV0PICA0my72HW7XoCU1S7xGmmgNVphrkR4
	5nD5EoOWwFfUNt2ow7G+iTm8HYBdcbh+OV4xf/n1wfc9I+bhqBUYovnm1+8cn6QDA1bG
	+B94vv7fmRX9G2Ob0YH6mnZ8Nwun0p+7QZXKj9soQwKK9kyiXGm0iOY5EbWAF4F7vppg
	YmTjRPYEaE5eeEBGs/l3DVF6PoRqXSK4zRx/sXqikbeZ2spXjlMTXRhq84qqNOqJR5/9
	lnww==
X-Gm-Message-State: AA+aEWZrEaOoJDfcIECcr9VeGpFOHTHZlxEEii434EeBqt8vLQ6d4cZS
	DL8hefspVRpzc76nUAc9pcpCOiNsFbPsMeLveSseyw==
X-Google-Smtp-Source: AFSGD/VDb2MJYpgt9Afy1PZgfjay8CLs32fYLvZx5zNIZu3fC7vx4w0y68hlplcuXa7vuRMDMtUv2i9mighqkB+0cAg=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr3228003ite.26.1544799278285; 
	Fri, 14 Dec 2018 06:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20181214011937.16881-1-douglas.royds@taitradio.com>
In-Reply-To: <20181214011937.16881-1-douglas.royds@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2018 14:54:26 +0000
Message-ID: <CAJTo0La3xLFbdsODnV9pp8_kc_GWSsCamesBmcELTvSqTh3z3w@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] acl: trivial: whitespace only
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
X-List-Received-Date: Fri, 14 Dec 2018 14:54:37 -0000
Content-Type: text/plain; charset="UTF-8"

Enrico just submitted some upgrades to acl and attr which touch the
recipes quite dramatically, could you rebase all these patches on top
of that?  Several will just disappear, for example ptest support was
removed.

Ross
On Fri, 14 Dec 2018 at 01:20, Douglas Royds <douglas.royds@taitradio.com> wrote:
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-support/attr/acl_2.2.52.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
> index 6bc77d868d..7f5883a5d7 100644
> --- a/meta/recipes-support/attr/acl_2.2.52.bb
> +++ b/meta/recipes-support/attr/acl_2.2.52.bb
> @@ -47,6 +47,7 @@ do_install_ptest() {
>         install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
>  }
>
> -RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
> +RDEPENDS_${PN}-ptest = "acl bash coreutils \
> +                        perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

