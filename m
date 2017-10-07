Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 148A278253
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 02:34:28 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id u144so8082019pgb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K1SKwFFOZqKPFhOe0uRPzSskArmuq+pW4RpBR6sWCWE=;
	b=BZ/m3Dvx/okbvDOe8+Rj1B8Myee94tOLU1ZMWfjUtA/uvOfDKRgs5c2AxSm10zJ9TU
	D99bqzCjQ7kU18544qjB3PzNULfRuQg5EEOEOhPZoEjRQ860oApgsSqsVmkZUT/3gCeh
	ziFtfH+OTxdInQF/NFBmfNDduuN80tx+kBBmSHF2h2kWZtq5l0/G1BVKsD5eKBNoyAH3
	C9wx9o8ZCgxTWi8yTBkO+uU4Erc1zqTFRfpfZKhHHG48iu91Kf0RTwCkVEj0HWHiZnKa
	rpxgTqwg18n7nbEGWqbJ0B2Is/GR5JYU3/DUbnQCtxNC6xziyCJGattLDdcnNsDrPovL
	rwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K1SKwFFOZqKPFhOe0uRPzSskArmuq+pW4RpBR6sWCWE=;
	b=Xsyouq9oglJmvnH9dwJ9Svwphkuj/waDJ9LNRGgDTj8Bf4UnWoxnq2X3dcVxEg54jg
	QmL/85crd1k5POlWSf8drQaiPSuAOceZYItZ/HskoTrhqwnKVbAL7y5X2YLqNjFOLUUc
	SA13VtXLXYYjMcitSrHyRc6xL6e3YtCkiWXmjzOUwACHHLIhyPMgqMuD/jz9g4XWi+B0
	HtdQeQ+axpGGg5n6s05g1CN/MkuDh/EyIiJixjPpXxJwyYl+awjeRNsQ5I5F/T+GRp6e
	Uhnovb+NMFCUM/ImKbNvRk0CheBbvO8qezqVWb6CjUMO7NnSGQ0pJfIUza1D3P0T4SyE
	/n4g==
X-Gm-Message-State: AMCzsaV8pgbD/q+7cvS0YDnilNqKX/shCBf+PRru36KV/bU1mlH6gdOz
	ht15kWldpwYhKc+6uSdql97PRNb/5jkB3h+6Je8=
X-Google-Smtp-Source: AOwi7QC4MBW7D5Ew4lLxWTkfQefFUhqxEZhdIpstjGkqUDYEfkHQhFkLYCei/bzoQlBrXJshyfPMCOSeQGa8u4/+OLw=
X-Received: by 10.98.19.24 with SMTP id b24mr3974162pfj.168.1507343670272;
	Fri, 06 Oct 2017 19:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 19:33:59 -0700 (PDT)
In-Reply-To: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 19:33:59 -0700
Message-ID: <CAMKF1sqO8C2zNJpBx2TvUdiQF7O0EbOCCWwYM2aXUoXX-9rVNQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Sat, 07 Oct 2017 02:34:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 7:49 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I'm confused.
>
> Layer "meta-xilinx" defines:
>
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
>
> This recipe is too old for my liking, so I made a newer one in "meta-topic"
>
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
>
>
> Much to my surprise, when I build, OE picks the 2017.1 version and not the
> 2017.3 version.
>
> bitbake-layers show-layers reveils:
> ..
> meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
> meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
> ..
>
> so that means that my meta-topic should win even if my PV were lower, right?
>

what does your BBPATH look like

