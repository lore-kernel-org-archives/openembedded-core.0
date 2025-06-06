Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFD0C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 18:54:15 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.2855.1749236054557045339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 11:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pP8644Ed;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-408d7e2ad03so1631658b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749236054; x=1749840854; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/tmkZFODEQcAfKGlnGNax7Yed/T512Vo9JzlHaRA5L0=;
        b=pP8644Ed54LpjG6sPKuiB2yQRbejNTWCGxHHo5of4xeUVYl2LEDkx7lEl+TkinOWgE
         JmCPdzQepFZXs8skQem1dt1llVZaz6cIiyzwO1N6u2KlP2C3vgnE4xAHbJGYLVTQWW/0
         zn/zTGkFH9hgqm4YmE423HrcdRkxmwOHBMp0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749236054; x=1749840854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/tmkZFODEQcAfKGlnGNax7Yed/T512Vo9JzlHaRA5L0=;
        b=glxNxLoibXA8rB0QHGOYQtYfCts1HGAQY44wSnWPgBg0nN8sFOJF3IgDe18OyspFfC
         CygrROiWiWE1GAvHyZQmMtMb+l9rIaf11MJh3TwiEfFCPPQZfNIWRwfLcFt7pvXYkVJP
         MYxnFdRFtVV8+YHEHb9MWm4gOw97QX9px0flI/GA4jtxaqDylGVdxN1CBwhKKbM54c9q
         GjGVjY0yjNGBesYjYinyLePtNEldKjBLgcrRApMTVFzsFQhEpFA2UhMI9uup5iO1drTl
         Y+F4ypUGEYA6Bkb5U8SGXMmLt+qbQZbQYW4zTAFS/uqg4piJQLJX68qsagQKOuIXpSaV
         WHDA==
X-Forwarded-Encrypted: i=1; AJvYcCVbUM0VIlyig4w3izaCvba0XMq+0DQXLyeLGgLoMCphtom0Vc1DKnsLJXay5Np9AcRDdNwZYPwilgAcX5VR71C27A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSoOpv+d82eeWFVrvxFePNBJMquxTURo6qO5ecXFeSGwTylWFR
	wUMW8KdUAgN2dufrA1wlgqzmWGdsGPllQFDoJ/N1jmYnWMeeWGi1/8O1l/tsR/cNAhc=
X-Gm-Gg: ASbGnctPVQ1ZI1GnkeX4t8Xi6Xsbn1Av8k69+1bmH0m/HdhwAV75dYcANlGT5w2UQWV
	rZvNWcbxaYPFV7KmclwSXtl6Dj0VLT7DMP1QLp+FLB86qzR+hwgGREMmS4Nuifgs3bfTIGdnXQt
	LyRR4uGCg/CEOcN05I9uTjGaYDSvep8JtgH6o4QB0WP5QZjVEQa2MS/Sh0HZynqLPhgTZzGK1by
	aErr6zRu3WlwMSEuwKcgNwKuBJO9i0ys7o7omHlFe3ZjJbFTkZ9IX9hLKpF+bgTvDCzhYLnxKKd
	ph+8j0sGQCk6gtzGFXzZIDzbSFghqvI7foKP1PhYz+f5Yp/4jji5z/oanmbTX87okazVLLk5RCN
	lXanVyjAv5MlHf30qeSPKi2g=
X-Google-Smtp-Source: AGHT+IFI/XAtojLEqNVL3zgMYMBBL0h142wgyXFS3BprT5FQs/ZWWJLjGtokWie6QraPgUI2dqQoOw==
X-Received: by 2002:a05:6808:83:b0:409:f8e:7282 with SMTP id 5614622812f47-4090f8e76e5mr782058b6e.5.1749236053783;
        Fri, 06 Jun 2025 11:54:13 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73889f5a7a9sm408718a34.27.2025.06.06.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:54:13 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:54:11 -0600
From: Tom Rini <trini@konsulko.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: move arm64 disabling fragments to
 versioned recipe
Message-ID: <20250606185411.GX1382132@bill-the-cat>
References: <20250605160624.1029863-1-ross.burton@arm.com>
 <3f05d487-57d1-4afb-a080-06f77b5bc3ad@cherry.de>
 <A46D5071-80B2-4343-9D94-F0972F3D8777@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A46D5071-80B2-4343-9D94-F0972F3D8777@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 18:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218179

On Fri, Jun 06, 2025 at 10:37:22AM +0000, Ross Burton wrote:
> On 6 Jun 2025, at 09:35, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> > 
> > The u-boot-tools recipe also includes the u-boot-common.inc so we would be losing the patches in that recipe. I would assume CONFIG_BLOBLIST and CONFIG_USB in the defconfig fragment wouldn't matter for tools, but maybe...? What about adding it to u-boot-tools_2025.04.bb so we don't have to worry about that :) ?
> 
> My understanding is that they’re unrelated to the tools, which is why I only changed the actual firmware.

These are both something very specific to qemu_arm64 and not more
general issues.

-- 
Tom

