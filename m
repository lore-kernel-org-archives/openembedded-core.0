Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id C9EEF7868C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:36:27 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id l138so6840180oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Qmfh+tjfomGP+mouj3j49uUfUkJSYUy25t5Ak16XNBI=;
	b=XhCWPlDujD5zPXGzs4z7HjbsCC2rM8rIwVliWSPUj61BgIiVneWI+h/WoPn7JEcXb+
	OelIUs9oa/sU6NNYPvC6U8dEftjElN5wX6ii265T7PDiTP7duiIdHmJdayoU8yNGWV3T
	g70KGq8IzbWPT+SCIIZlPduNd+nU/ve2wwKIxgAcK+h0T/bsRhKPbSrQME0nDp/MExYu
	REGgZHSbezJCWDoVg/LqWNiAqPKd9AoxGCs1PawS9aAl+OPBrRH6vGnXn87gUpbpSD7W
	+hsgoe1Q9aCPb9TANTvZow8T8i5rhNj7mqCsw1fHm5P58jYri9/X533CT1iLRs81aAdI
	fcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Qmfh+tjfomGP+mouj3j49uUfUkJSYUy25t5Ak16XNBI=;
	b=XmGlk5/nOEXqEPi8j/yfrfe4R7hBC2jyUkvKO2E9EDY3vvWLB2lfeIJRoLxxbW1AcY
	wmzEQuBKewUsSfYcWm6h3SsdOROsLVQMgePv4cwUIDvczOFfyL6JM4awq0XGti5dxviA
	kjpM+H3nvH5rCtt/ce+IrJCYbdeD+itATOw9kJ57ARzKdqRxmrQGENE+bS81/bff3UV0
	THabMUMhEycbBzvCQMJqvwQOCeo1v2tZPBBsSqoC722O242LQBtvuCXrXC83Zhf7ql1C
	F3R7Ax2/0MiFvtkOn7VMTsuwch2gncJ5/Z/7N/VrRQReEeNu/KKOrRs40UxXUmwAN/AE
	PQzA==
X-Gm-Message-State: AJaThX741gIcASFy/x3W17zBkER1ZiJ5+CYkwDnOejdjFMafWKhB1SRZ
	FKFM9pUWks2Ei7vIKkZfagzC/1w8
X-Google-Smtp-Source: AGs4zMYme4TPiCu2pudm+cj2COPdlLDp+fl7YWb2P0fmPSkGJgw+rH3B3C02OiewoF+jzJmCJIu5Zw==
X-Received: by 10.202.10.197 with SMTP id k66mr10122632oiy.248.1510778188565; 
	Wed, 15 Nov 2017 12:36:28 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176]) by smtp.gmail.com with ESMTPSA id
	x127sm4433808oix.8.2017.11.15.12.36.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 12:36:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id g104so8610380otg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:36:27 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr12009604oth.370.1510778186958;
	Wed, 15 Nov 2017 12:36:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 15 Nov 2017 12:36:26 -0800 (PST)
In-Reply-To: <20171114221009.29839-1-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171114221009.29839-1-california.l.sullivan@intel.com>
Date: Wed, 15 Nov 2017 18:36:26 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoRSgS24uD4d9T4e+S922gYoEwAbA631ad=Yypwg38ikA@mail.gmail.com>
Message-ID: <CAP9ODKoRSgS24uD4d9T4e+S922gYoEwAbA631ad=Yypwg38ikA@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Saul Wold <saul.wold@intel.com>, "Bruce, Henry" <henry.bruce@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHi 3/3 V3] initramfs-framework: add install module
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
X-List-Received-Date: Wed, 15 Nov 2017 20:36:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 8:10 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> The non-EFI counterpart for installation was previously missing for
> initramfs-framework. This simply puts the normal install script in the
> correct location for initramfs-framework to make use of it.
>
> Partial fix for [YOCTO #12346].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> V2 changes:
> * Add the module's dependencies to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, since
>   its dependencies changing don't matter in regards building the package.
> * PR = "r1" since its a new recipe.
>
> V3 changes:
> * Add back bug ID that I somehow dropped from commit message. Sorry for spam.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please also queue this for rocko backport. It seems a good fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

