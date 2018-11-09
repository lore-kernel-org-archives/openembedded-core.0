Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 032F36C204
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:29:49 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e11so3158484itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yIg2yE8BQc+8Nfvum+jPWuARL2td8YsAODkMbmvm1sk=;
	b=J/UKBG4TyDmJ8/TMZyZ1u20BJFdNX3IszbKQnqxLuLmqbOeunVH0lVibydbuPl4f4g
	OUz2yiKv/Y9q0nExPuV6AerUgeauHP7dWtf5JUuNgSg/cSNbAZ+8yivT1CIc1fZn3FGP
	4TaNuNljPVBB9EIytoZh1rmmp8RGfHnWBIOchoZRfhdzEq6XWSkd/uw4BrEKc5N3+g14
	wWz3qlFhBvbWCk7rYZlEDJIlCWSWbg0SI5Asz9u7JhySiPWNVNDGrwThDvU/aaeSgdIZ
	BB632luZ7YERWr4tXROprwzvOzPc+ueoFALd3Oo2L3lrdlGYtIj+ZQcD90+8zJYXIv5J
	1tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yIg2yE8BQc+8Nfvum+jPWuARL2td8YsAODkMbmvm1sk=;
	b=fY06xmAwM0WvyLbC2rAFDh5yLDJStlFgF1OmFK7KT6VbDMMNtcd1iTQ2OQ5JWqCvJY
	TjL0kDVFrCe12/d3OCdxKkHgmNsPcrwTNjMYtTJ2CLAHFugG46VgelyTyZCcYLarwkxA
	MT79P9djulhAhX/5bsY5N9e3SMYx0nfubdbWsYFb8J8ElTtnPP5F4NIIzgqen4nFA2jz
	jrejBze1amzdsOZhoVYGnJS9V+6GpZu1JhodM7k8V/PcZB+BreXagedUC81atzEE4W0I
	w1qpEHPFL3qbf6EsN3+UFK64P297WXLuNcDsa/OEgRGxz7NqhrjFF56nl2FVY0QVQhr/
	mnMg==
X-Gm-Message-State: AGRZ1gI17PN/Wz/1xpHpoBMydUa/wUQpU+cLizkZ4ZmnJEjQSxZoJ4bE
	XLLJNg6T/gk+DoERyF69Ba5hQzWCfkKRc7dNbWQCcw==
X-Google-Smtp-Source: AJdET5dRdXvxtQJffXtbWyxUM1+N8nrJYJo/Ish8Kso904kjIsxlQUbdwWkHca5gjRFin/0o0ikHNX/oFByDtlUbeYE=
X-Received: by 2002:a24:1d8e:: with SMTP id
	136-v6mr1987536itj.62.1541770191050; 
	Fri, 09 Nov 2018 05:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20181108093631.28934-1-sstrogin@cisco.com>
In-Reply-To: <20181108093631.28934-1-sstrogin@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Nov 2018 13:29:40 +0000
Message-ID: <CAJTo0LZZHgHV3itvJpD+_WZuH56gLjSGBhtY+3PQv3V7rKdYBA@mail.gmail.com>
To: Stefan Strogin <sstrogin@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: add ptest
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
X-List-Received-Date: Fri, 09 Nov 2018 13:29:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 09:44, Stefan Strogin via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/test/.libs
> +    for t in dns-spin-test dns-test hashmap-test
> +    do
> +        install -m 0755 ${B}/avahi-core/$t ${D}${PTEST_PATH}/test/
> +        sed -e 's/^relink_command=\"\(.*\)\"/relink_command=\"\"/' -i ${D}${PTEST_PATH}/test/$t
> +        install -m 0755 ${B}/avahi-core/.libs/$t ${D}${PTEST_PATH}/test/.libs/lt-$t
> +    done
> +}

Whilst I really do want to see more test suites, is this really a
useful test suite?  hashmap-test is a validation that the hash
implementation works, dns-test is low-level parsing, and dns-spin-test
is basically a way to verify an Avahi bug doesn't regress.  This isn't
exactly a full-featured test suite that creates services, ensures
they're browsable, enumerate stuff, etc.

Ross

