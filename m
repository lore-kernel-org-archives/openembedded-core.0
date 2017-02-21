Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id DD81871E16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:33:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u188so42139563qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2AGySf9AWHJ4eW6UMKd8mva+c58bi5tyzFQi5tw1GRo=;
	b=RHp8rdYz7cHC4JXvNJ5dfP9Bmv/+vXg0xkdmInYu4rB0/zjbHXfIzLaGu9sb4C00SP
	yBpi6c9+wc1YPvNsRJ6bvfhjtvXnJ13Lft5gOhe+HFFV0uc7NEYB/hJufpk/dZXY1GLa
	Gfkry0D9zOIhwQlCV6mrk/P+6WOI8nih0bD/x844dzvl4e+UlU/E3XN0vFtZHo/koHlU
	kbi1pCBvn26FdOQvTNkUs+5kdSdxPu3BNM/OUV5M8mihKcbDSv+kOboLZU6GlBHRm7vB
	c3K6IElWO5CXG1cxRsi4RENKNJud6YgyZNZYjQiI+Ka2oPgbHPRNnrX7rS9SJWD+2X5h
	XiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2AGySf9AWHJ4eW6UMKd8mva+c58bi5tyzFQi5tw1GRo=;
	b=CvArDS2uDwkNIN1i9D757DOGY/UBZZFPfnRCKmuzcV9tk4f1pd+5Bi+02uCqmJJ0rX
	oPpgcdAlRxlsD9+n5NNzGEmNju3UrnX1YDppwzCDo+vYXcv0x01CAXtphK9ZQI4NTw6d
	ECvWOxN284BqZxCF2yv3SluZqCv8ReiUC6kp75o7nphOgUqmnizP308UdJAEwOx62TAn
	MFBtTALNt4R7DpS2XV6e4p0TgnZezChyHBeV99LP1AD0PoK1lNPkohAWvllaQkGAkrTQ
	+yXnoqazQB02M0G70p7UWedbyBIa1hXQYksEQqWoU+MfsVX9q/3qxuYbEoQjV/ssRw/z
	yWkA==
X-Gm-Message-State: AMke39mLSR526WSy9KPeUIwuZGTOR18USEWmDEZLW6iTMQqsrx9J7QVNegEx1Zz+bzi+owmRVALfu438/afA0g==
X-Received: by 10.55.68.66 with SMTP id r63mr6301840qka.116.1487673240776;
	Tue, 21 Feb 2017 02:34:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.136.75 with HTTP; Tue, 21 Feb 2017 02:34:00 -0800 (PST)
In-Reply-To: <20170130074552.32419-0-nathan@nathanrossi.com>
References: <20170130074552.32419-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 21 Feb 2017 20:34:00 +1000
Message-ID: <CA+aJhH0nEHuOjJJQE7=JeYg6ppjM7FdF+u=yc3TGvExUrQaUTw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistai@xilinx.com>
Subject: Re: [PATCH 0/2] glib-2.0 changes for nativesdk and packaging
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
X-List-Received-Date: Tue, 21 Feb 2017 10:34:00 -0000
Content-Type: text/plain; charset=UTF-8

On 30 January 2017 at 17:45, Nathan Rossi <nathan@nathanrossi.com> wrote:
> This series contains two patches. The first fixes up the renaming of
> gio-querymodules so that it is only applied to class-target (so that
> 'nativesdk-gio-query-modules' is not generated). The second change makes
> the removal of 'charset.alias' occur for all targets including musl
> since it is not packaged by default and not desired in cases that it is
> generated.
>
> Nathan Rossi (2):
>   glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
>   glib-2.0/glib.inc: If 'charset.alias' exists drop it

Ping, any comments or feedback for this series?

Thanks,
Nathan

>
>  meta/recipes-core/glib-2.0/glib.inc | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> --
> 2.11.0

