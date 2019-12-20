Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6935F7FD00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 17:44:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id n59so4436321pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 09:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:reply-to:to:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=YDrA1UblUro3U9LLZMZXTD1EfxLFwhnqDzZdcK9H1Ks=;
	b=DGsOVQ92nWB/F9+cLr2ukcuPTo5fFvUadOM1iCSkWK1riza5zUHzregvGEMKygUf5j
	8P3NpmZVXC4+0KMv93aztDmyDr2j8yIXc5o7qGypHSpbpJel1O5z8f1FP/90A3Fe5cc/
	PjHTp74aBHYV5l2s+nuPDwLfKyYv/TOVO2sixmB/XdmX45RpMYkWysGWJhRHeVYlChUs
	HVQaiytKTBvKlcy1Uj7vsmp1ormrVmk526HXA1eQgfDxs1AadFRYgvb/06JV4Beo/euH
	bYhrfViJASoVQD4WVXSwLx5s9vrIoOUCB4ii9Z8EgnZJ6J2blx8fCBuz72gQlKQb/V1P
	haVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:reply-to:to:date
	:in-reply-to:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=YDrA1UblUro3U9LLZMZXTD1EfxLFwhnqDzZdcK9H1Ks=;
	b=XcAIC2UXXZlJTDufBgfSWGV37M/S+8YkLpnKxwN0h3Kt/DJ84pPCR4f6em+iJ3c5kc
	nGOA6HvnxPpSUEgkyPzSzFBKzfR4Cs8lEuduiFspZBM8Mb3kXTK1zZ5ur5v529ApwgIh
	h/Yt6xd0WrdsYsP9Gj8NZqLkwORq6/0ZjWbOqDfaVoVAzsFCsswBurpxcTXZCeenuNUg
	lQ15PK//NinHrPABmqLI8FRb/PXKXAdDFW3qv2F748P+RVfL12fQK/PeMlXaa0olfsSs
	1PJwZB83m1ETv1mprA37FzPSL6fm8Ar1EAXAecjuopniZiwpsR2+c/NHN9tAMf9RJIWU
	kPZA==
X-Gm-Message-State: APjAAAXGVFN8lrKGpPGMzRby9GC58H2wBwV9p0JBUlIp7WyOopj5FrzV
	KyM53p7oFC4aAdg2h40MDbk=
X-Google-Smtp-Source: APXvYqzOw2LIZ4aUaD6JYntIlugawo9lBHHPwL+7Tl75iWH0qXWYVrj3DYan6ScNCPVYp5eRpHFVhw==
X-Received: by 2002:a17:902:bb8c:: with SMTP id
	m12mr16734080pls.320.1576863851179; 
	Fri, 20 Dec 2019 09:44:11 -0800 (PST)
Received: from apollo ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	hg11sm11033295pjb.14.2019.12.20.09.44.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 09:44:10 -0800 (PST)
Message-ID: <bf8452d4e9f63bc463f676ff9b48ca1d573ef7d0.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Reply-To: raj.khem@gmail.com
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 09:44:10 -0800
In-Reply-To: <3cd13d50-b437-2438-582a-4c149711a966@intel.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-7-alex.kanavin@gmail.com>
	<3cd13d50-b437-2438-582a-4c149711a966@intel.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Fri, 20 Dec 2019 17:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-12-20 at 11:00 +0000, Ross Burton wrote:
> Breaks on Centos 7:
> 
> nsinstall.c: In function ‘main’:
> nsinstall.c:201:5: warning: implicit declaration of function
> ‘getopt’ 
> [-Wimplicit-function-declaration]
>       while ((opt = getopt(argc, argv, "C:DdlL:Rm:o:g:t")) != EOF) {
>       ^
> nsinstall.c:203:20: error: ‘optarg’ undeclared (first use in this
> function)
>      case 'C': cwd = optarg; break;
>                      ^
> nsinstall.c:203:20: note: each undeclared identifier is reported
> only 
> once for each function it appears in
> nsinstall.c:225:13: error: ‘optind’ undeclared (first use in this
> function)
>       argc -= optind;
>               ^
> 

another C99 issue I guess perhaps  #include <getopt.h> in nsinstall.c
will fix it.

> Ross


