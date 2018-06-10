Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2200E78E92
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:25:19 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id q17-v6so20362848otg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6yms00ttCdt0JqaQi0FdsoAFcOf06aKPqfOwC+H4jOM=;
	b=F51FOSsIWjziYR9EvvFVTUcpBYZbzFmyumXC0C0EfltZG6fyYIGls+ZJyQhc2o5Wvj
	gJCbK6GuqoJEifaK7sAK78vRLc4Fsj02cT/2f8nML7ps6lG5bQQ8czgfYyBOqRTCmBzH
	Dg59DoBrvR25CsirKCxFNNbKDSUxcZ98zQ+WGoG/8eWSMe3tIfeRwv80hWqlYezIR01F
	57gpP1CciPTPGoZnp774zgzRsOyLMEF3slx+DO2IOzr0buWFsGY1k8aucSyzs61fMY1F
	n2uZGHe8fsYx/0krJB9MNGhBpl8InDFURL0Wuo6WXE8O1h9UNTEs51vP9JPGH5Ft04af
	hu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6yms00ttCdt0JqaQi0FdsoAFcOf06aKPqfOwC+H4jOM=;
	b=sm8q+9D1lf29Hh5gtjCjAvhat7jKhG4cxAalDvYus1/i+CkGJYGKvc6pRjMKsEh+Up
	RtAYpLJAuHdqOb6A2+zoUaLvB4THKeopIjezK2EjTxxez5AeOczP7uwLhUGHGrBJJq/T
	vUyH6SsgkELxTBM4LV38Fo4n1SQnD/l4YhCUHmuK2XUnpOzdFROFmZeByTWi+gretxAL
	wENntOrADPfzfIWeiLXbKEQIsQ04sfOS2bp8WxmnhifdAZAGvzebPmD76TzqClPpMy+x
	U0pMObZo+bsMAXSvdeRvH7nn/UlEQcLiY54d/cibj9CnvEgya4pWSRklj6Br255VxNcO
	9fNA==
X-Gm-Message-State: APt69E3zzgEjXlTjAu3bYeHE+Meh+9MTeOzD4F8f0NSNlcY2+3YWglTh
	93I0B5F3EIJV5vFb04OhJlUkIkz2oGWgNgCLKDY=
X-Google-Smtp-Source: ADUXVKKw5WZ+Wx71bR6e7FNC19OZSc93zCbbyTQV8AOy7qnoBSaRGFEeNpLiFsPup/5LeXCRw9SkhRcWkEd7n7XQ9T8=
X-Received: by 2002:a9d:3010:: with SMTP id
	d16-v6mr6705567otc.23.1528615520273; 
	Sun, 10 Jun 2018 00:25:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Sun, 10 Jun 2018 00:25:19
	-0700 (PDT)
In-Reply-To: <1528574447-21755-2-git-send-email-akuster808@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
	<1528574447-21755-2-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Jun 2018 10:25:19 +0300
Message-ID: <CANNYZj8UfLsDXQ=3tOAo+ih2B7T5orT_C9hE02pH_O1rHXtx+w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] selftest: add cmake test
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
X-List-Received-Date: Sun, 10 Jun 2018 07:25:19 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-09 23:00 GMT+03:00 Armin Kuster <akuster808@gmail.com>:
> +DEPENDS = "boost"



> +find_package(Boost 1.60 REQUIRED
> +    COMPONENTS
> +        unit_test_framework
> +)


Is it possible to use something else than boost here, if we want to
test cmake's ability to find compoments? So that the build time is as
quick as possible - boost isn't particularly fast.

Alex

