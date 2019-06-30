Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B981A7E6F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:58:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c27so3919139wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 14:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DSy/VnWZSsM53fCmOseKVMpL1BGEh1IuYHUhROzjWjs=;
	b=DlkJgEnUG49+lqB/FTc1ZrA9e+BLLaEHITnovZ+9T8QS0sFkaDvcOBGgd3w+RLpJ72
	I7ddJKTub17qXTqzNWhUZTBWsbZ8vs6kK60c0c6Xex+79BCP8fHbQzwHK0qpEUmwNcXY
	jliTlpgiSSpNA20bOG1lpl5CRiJKWOiqyd/4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DSy/VnWZSsM53fCmOseKVMpL1BGEh1IuYHUhROzjWjs=;
	b=p5N8onzU0OsenUFF1SMDMIMikBRQvOPsoA1vA9tjCpJxcjxe6+IVDjiANdWjJqNoCb
	SwBuKqB/cRSoXTYkDBActKdkOWMgcZQU3sAhS7cUjltjnXtWRmXK1b/BU+uCHAAbr5GY
	i3i1L+BykbLjZOWPUK3NrBV/K65US45kFme8jX5CY89sgZAamdx0pL1a5B2C2jYJJBm3
	uPy31mFwBzxRmm4YJEVQ1HKtL7COx4a1BIK7yibyHfgCz7I/i8HQgBjrQ7gt/3/XEV5S
	4+3od4SkLlHUav2bRpVJObbWXVmxAv6QxCcENmC+1IzpVJs0f5+tR56h0vRj4iTzuH36
	Er/Q==
X-Gm-Message-State: APjAAAUQn9GWGBWvD5s/FFkcYQvtMvEpQcjGM4ESrNwgjwaR9y4COrpw
	hL8pgWfEAK4EqpOSZqXLzfw+Wg==
X-Google-Smtp-Source: APXvYqwbx0tOlieZ2sR7wuIKaHR4oPgM7sKe7HHElyio3Z82xPx/Pwbsa6FnXw4Norl7K910Gtk79A==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr14828756wrp.101.1561931937333; 
	Sun, 30 Jun 2019 14:58:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d24sm7956019wra.43.2019.06.30.14.58.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 14:58:56 -0700 (PDT)
Message-ID: <0221a7bd0f40bddd3fdfd624f75cabce3eb9fda1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, 
	openembedded-core@lists.openembedded.org, joseph.reynolds1@ibm.com
Date: Sun, 30 Jun 2019 22:58:48 +0100
In-Reply-To: <5add2d28-a846-e555-b2a3-bae8835125b0@linux.ibm.com>
References: <5add2d28-a846-e555-b2a3-bae8835125b0@linux.ibm.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Sun, 30 Jun 2019 21:58:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 18:03 -0500, Joseph Reynolds wrote:
>  From 587a9e5c637ad3e70b8e35a3ca66013693ce7ac7 Mon Sep 17 00:00:00
> 2001
> From: Joseph Reynolds <joseph.reynolds1@ibm.com>
> Date: Wed, 19 Jun 2019 20:16:40 -0500
> Subject: [PATCH v2] dropbear: new feature: disable-weak-ciphers
> 
> Enhances dropbear with a new feature "disable-weak-ciphers", on by
> default.
> This feature disables all CBC, SHA1, and diffie-hellman group1
> ciphers in
> the dropbear ssh server and client.
> 
> Disable this feature if you need to connect to the ssh server from
> older
> clients.  Additional customization can be done with local_options.h
> as 
> usual.
> 
> Tested: On github.com/openbmc/openbmc using dropbear_2019.78.
> 
> Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
> ---
>   meta/recipes-core/dropbear/dropbear.inc            |  6 ++-
>   .../0007-dropbear-disable-weak-ciphers.patch       | 57 
> ++++++++++++++++++++++
>   2 files changed, 61 insertions(+), 2 deletions(-)
>   create mode 100644 
> meta/recipes-core/dropbear/dropbear/0007-dropbear-disable-weak-
> ciphers.patch

I merged v1 of this patch previously. What was different in this
version?

Also, the patch was still line wrapped so very hard to apply (had to be
manually fixed).

Cheers,

Richard


