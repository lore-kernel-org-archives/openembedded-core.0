Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7367C605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:38:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f19so2127079wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6y6igjH7TcqSzHqDnb8kKLSCRtS4756utwtQv2JekFc=;
	b=cL4R09chzuZ8JIN4UCE6PRJ7VLatkH+Q+iPreXVkgMSeSiFrT9W2OcWW8bMeqktXrl
	S7f/7ksB88bYGIdZVJoVB1KkrfVJV7PkJspkcXRm/zvF9rIxffglePLWHL1qOZtyBNCv
	za1rYxSUMLFmumToo8JulAwDcHETLoWiXShuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6y6igjH7TcqSzHqDnb8kKLSCRtS4756utwtQv2JekFc=;
	b=LXR40flkuNlKPloWPbP81OcKeztWBALqcmUVj37Nu6YLWMSXAH1zJ2dDV1fxE+01SZ
	Rf/ihL2sDFS98tD0m6ZIfQiv8qGYo6T1jOH7w4aLG8WFXwCraxdetU9syJ35RsQEdkUb
	YNHtS5d7H0a8E4VHvX2gxK08yOYqZ4t0JI3FtlS9YWQOmuAe7wCdamUnYMGpbbmy3znb
	ZENMx9NXMF1u59D8bBiZq0lxKPJWmiektuKZuLX8kchrBfjo/a+8Av6u16a7xt2JMWHE
	EcuoiOq+INhRWq4hNM6URbGpuYV72/X2Y5bx7f+3OLf0DdJr58TTv6KaTGn61rYWFzT1
	BuxQ==
X-Gm-Message-State: APjAAAU55SjEr7PeNKn6f3A0PjXf13Yu2+Vnc3b4ttfnPKUTwT2gHeUO
	s4mDYDpy6ALTN8SpKsrNHNBrQQ==
X-Google-Smtp-Source: APXvYqyQViDAmutJ1AAvFUCU8S5refnqE8xKWkU0ORSNlJGAYtFuXQj8D6CDKP9e8mjueinIEC6BKQ==
X-Received: by 2002:a1c:990b:: with SMTP id b11mr3391314wme.15.1582875521733; 
	Thu, 27 Feb 2020 23:38:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w1sm973987wmc.11.2020.02.27.23.38.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 23:38:41 -0800 (PST)
Message-ID: <e6b5f12b449f25b1a2a2d0a8fdb4820f94d341b6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <timothy.t.orling@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 07:38:39 +0000
In-Reply-To: <20200225234603.36012-1-timothy.t.orling@linux.intel.com>
References: <20200225234603.36012-1-timothy.t.orling@linux.intel.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v2] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Fri, 28 Feb 2020 07:38:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-25 at 15:46 -0800, Tim Orling wrote:
> Upstream release notes:
> "
> 0.4231 - Wed Jan 29 08:47:56 CET 2020
> 
>   - Released 0.42_30 without code changes
> 
> 0.42_30 - Wed Jul 31 13:15:39 CEST 2019
> 
>   - Add dependency on ExtUtils::PL2Bat
> "
> 
> Add ptest RDEPENDS:
>   - ExtUtils::Command::MM for t/compat.t
>   - gcc, make didn't seem like enough for ptest, replace with
>     packagegroup-core-buildessential which definitely works
>   - perl-dev for EXTERN.h in t/xs.t
> 
> Add INSANE_SKIP dev-deps for the -ptest package because of perl-dev
> 
> Five tests from t/help.t are skipped because they are TODO
> 
> t/par.t is skipped because PAR::Dist (0.17+) is not present
> 
> t/ppm.t is skipped because "HTML support not installed"
> 
> All other tests pass.
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  ...rl_0.4229.bb => libmodule-build-perl_0.4231.bb} | 14 +++++++++---
> --
>  1 file changed, 9 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4229.bb =>
> libmodule-build-perl_0.4231.bb} (90%)

unfortunately this has reproducibility issues:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200228-93xlitnd/packages/diff-html/

(see after the gettext issue)

Cheers,

Richard


