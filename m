Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7DF27E033
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 23:38:18 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p2so6822606iol.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fKaj+xmJ9vHFsCglmxzInubqdO68a9x2WZ88wH4EB38=;
	b=VZON4G0Ixz+58nLGUc9Lfh+4dPjIlAvpC9xmCZ3GiiQiyMpzaQVluQ7LpgVgfRq9DS
	todKMMOTk9EkdWi/OBI64L4X1olKO7o9eBMB/nm3L/3P8myTQAlHvpDLt6FOJ2R2Wds0
	CQmGsyMTplVHlofBMs7Sq/j6/VSqU5mzKW6EgqyoA/7UmVV/OIIDhFbMNXuQ5sv8/AR5
	uENooGIvpSPILVpIjre5wUdaVp9CjIQeMrG6g7I0atDdDbu+dICWKNQBEtblQT8DaMPv
	EdrXiB494pB5c+i17lk/TaQ9wNPCfHFfYWcl82TWV0jw25y13AaWJ3xVsVlJpIHSlaHc
	OabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fKaj+xmJ9vHFsCglmxzInubqdO68a9x2WZ88wH4EB38=;
	b=Au58TOwIIf+hOrm7u42zA9NBrZU+XE6qdrxi0ArUGZ0MSaoR1UqJrmyTxud9ElBQzo
	MCZgcFCnjqI/0bqaOHF6wfLVHZbBZqXcTbrW2KwB9RdyJL/PbXNbHqB9EwMka8YFJM37
	8phASmyOqA3YXBLPy368Xd4HTKEsO1K+V08RzESY+PBC8Zs45RiOH9bsvOCVRDi61qHa
	WnRMqXa2aZVURQtmI7gIBA1DnKzLu+dX8/PbmqVaMX2OBupuNLPy9As273whRZ46Mchp
	UEMz1srVg+CRP94zt3GfS0dJfKqBbZZoXFj/Y1ECNsEeTyPU6YZpXXRqAzCRGH+f0dRZ
	XuXg==
X-Gm-Message-State: APjAAAUe8Rhk7ZaVMm7oQv1VIylj0+eoxoe1GjSP28b9Qz0Liq+o0PKs
	DUtLjKvfky7QGm3xW7soQLjTURZGIKe1qtNXCp6A/unu
X-Google-Smtp-Source: APXvYqxOOK84ijumYi1yHgtjgcA0wKOurt5/dicvT6TjbGITHFHcCLAIJtLzXvm0ADRC0gfiOgphrWyB8qgm8nFbL20=
X-Received: by 2002:a6b:d91a:: with SMTP id r26mr1535769ioc.25.1558136299905; 
	Fri, 17 May 2019 16:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190517224859.8270-1-ross.burton@intel.com>
	<c400aa2a-4685-edd7-88ce-dcf5f13d4349@mikrodidakt.se>
In-Reply-To: <c400aa2a-4685-edd7-88ce-dcf5f13d4349@mikrodidakt.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 May 2019 16:38:08 -0700
Message-ID: <CAJTo0LbOa8U7m--g453CQTR8hrXw0T+jtKpT6j_aNPf=qndmKQ@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Fri, 17 May 2019 23:38:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 16:24, Jacob Kroon <jacob.kroon@mikrodidakt.se> wrote:
> On 5/18/19 12:48 AM, Ross Burton wrote:
> > The SRC_URI almost definitely shouldn't be using ${BPN}, and GitHub */archive/*
> "... shouldn't be using ${PN} ..." ?

Whoops!  Fixed.

Ross

