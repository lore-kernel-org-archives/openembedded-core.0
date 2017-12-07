Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60E9571A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 16:57:12 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u62so16336834ita.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 08:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:in-reply-to:references:date:mime-version
	:content-transfer-encoding;
	bh=7bLsoCslMqricdriOUeKW0VG18u53iaHS9AcwImUHLY=;
	b=A1M7we8yJ1V+8eEBSc4QEqUQvpbjUFkRIMGY1o3RO52yYZuAU/tBaBh9tGLe20tkNV
	tSJ1rcmLjS/KmuDGgbJ34RkzXqJ95nAUByXjvIQzZTqpPOpLmtnJ8RsTHmEW0ruF74C8
	YAwZoNiQEV5lN2MHoj5p6LIv7ouGAszjqkF0fnr+37UtlbC4QmXF2WJ/NFGiF+RxRWj7
	U0KdaEd10V+ezun1Cd6+agb6arsS9XG7VAGFi/3C5ZavnOBuc2pijJcZPxkd9EkbZ++e
	zUYd39cH2O5OQ8tlNNAfD3XjV9IGGSFRO7Kpc4UaMhY2c0ex0qjpqCP5/58zyME2O5Ne
	6n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:in-reply-to
	:references:date:mime-version:content-transfer-encoding;
	bh=7bLsoCslMqricdriOUeKW0VG18u53iaHS9AcwImUHLY=;
	b=ZfjCM6nREIWR8xxz82r1LccrflDysiKfrNUp8Qv/h4oW68VkJNXaAhcC9Vnz2gAmJ0
	M1iSy9h0I//anDMBvATQpeLzhtvxQtFHe8RusycFWnOkav1Ai5U/7+uD52McP3YIVD0d
	1k5uukgdStqosyNRc1u2dvrlDVcM4LtnwF4xENUfynRGyOqzpbl/duifiCX0G1v0brKa
	V5Bp0F8aHpbgxLR9vY8x4tRdejKYv8aYz73GbJgf8xbocGYJ6otj30UVYVL0iXarORfi
	Z06/86LgzI5YixlKbLxf77tXFwu2sn7yIKBbHZ2PKktogG3nThLJQMmNzEo+6E9ZnXpy
	lfrA==
X-Gm-Message-State: AKGB3mKJ8jAkBonZp62e5FUdL2oAvzRWjDt3LpVFNvLNBXkYwYX12XLi
	3oTBsBGWma+KlzV3Dk70FFJHPBHH
X-Google-Smtp-Source: AGs4zMaG8of++LmNTZj+NJr+dH9/tSluF6xlExxFtXFEd1RZ2sLnI7v6LI8510AvDNEGsLuDYVRxrg==
X-Received: by 10.36.157.16 with SMTP id f16mr2009471itd.19.1512665833174;
	Thu, 07 Dec 2017 08:57:13 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	e142sm2942144ite.28.2017.12.07.08.57.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Dec 2017 08:57:12 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1512665746.19311.4.camel@gmail.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20171207165114.2007-1-JPEWhacker@gmail.com>
References: <20171207165114.2007-1-JPEWhacker@gmail.com>
Date: Thu, 07 Dec 2017 10:55:46 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Subject: Re: [PATCH] waf.bbclass: Add compile progress
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
X-List-Received-Date: Thu, 07 Dec 2017 16:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-12-07 at 10:51 -0600, Joshua Watt wrote:
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/waf.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c4698e910a4..f7d95fa050b 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -25,6 +25,7 @@ def get_waf_parallel_make(d):
>  
>      return ""
>  
> +do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  waf_do_configure() {
Argh... should be above waf_do_compile... need to proof read better.
>  	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
>  }

