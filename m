Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2107F7C57D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 16:11:40 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id i145so9864099ita.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 08:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k2L4E/vX5LmOQOJaCD+rVBaRGcgZZIZs4Js21mfrrO8=;
	b=nmb77hvOf62L0mLgGumwcwuov3cfOW1wQ2w3xhtwI0TpJvx9m0jfUCzr73Ogsyj2Xp
	R5pK3XX63MZXPXh5zUw1iSWd0e1/ap4gdOMlmnDAwndJQr7CwpMKI1Y7H6dVmRM4kY7E
	K/Rjig66H5Ih1CWymTv2qUPqSXUMTi/P2xpAidavD3ULg/a9QG6iofZUl6gg2P9oGPFg
	OomkRDLdh9iYQDT9Eaw9oIO6XJrBanLj78Hp3Q5ptY6oj8vpYk6xycsvg2Godcr++V1m
	y447T/3m8Qf1jfYYwVUMvNjpskZOuc2dwTTXeQPDVK5PaXD52miIU5fXdhl2pW2LHYyV
	Y22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k2L4E/vX5LmOQOJaCD+rVBaRGcgZZIZs4Js21mfrrO8=;
	b=ijMiz6OaOw8GlB4hyv0fZfWMOOuyGUSKXyGUqmrUzeQ5Z+InqMJ81azTo+35LMX580
	KLpChFUymdY6Qp+vM7G2s0iGIQ+z1aNrqWjjQtgD9qCfTg3XIt3NW2u5RPUefuhiS9Xs
	0eN7lntGJbzfdpVfP5gC7jiXewNal0xhDKt0nKv4cD9Ajf2/09p4U4d6UMTS+f2Nnbq7
	JIUB7XZFIml5CrKkZORhuyruh2zb72KmCZswZQYbndOLvkukTXMxnWwFTHnMTiyq0GLG
	czf2SxDEcONGNLXbZFvm5eZ+HLjKnGzKV+4Z4MMCwMZ4yqhYuwtT3d2diL3xTB+Zl74O
	5WwA==
X-Gm-Message-State: AHQUAuYIeum74wGOYYmDbYN4P/me/AzFREFK/1Lh3eubQmkhzMaITYX6
	43mD1OBpFiJWV+SMorKd8NlA85EQdOH2LJ4MlU3OZQ==
X-Google-Smtp-Source: AHgI3IbsEam8m2pEq1B5Uskj9jGPeiQU7YiYJEjRWPj2fPWKm5db2GiB9SJGi25LhBTsF24ldHFywUIrOCYisN9xFp0=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr1700744itj.62.1549037501772;
	Fri, 01 Feb 2019 08:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20190201152050.115214-1-alex.kanavin@gmail.com>
In-Reply-To: <20190201152050.115214-1-alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2019 16:11:30 +0000
Message-ID: <CAJTo0LbikuA32nJ3j7Tk41o7pjb2QBfS2hibB-EFk8PG3fO7hw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] perl: update perl-cross to 1.2.2
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
X-List-Received-Date: Fri, 01 Feb 2019 16:11:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Feb 2019 at 15:21, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>  SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> -           https://github.com/arsv/perl-cross/releases/download/1.2.1/perl-cross-1.2.1.tar.gz;name=perl-cross \
> +           https://github.com/arsv/perl-cross/releases/download/1.2.2/perl-cross-1.2.2.tar.gz;name=perl-cross \

> +PR = "r1"

SRC_URI changed so there's no need to add PR.

Ross

