Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 500C3719F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:34:58 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id l8so24368814iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=RCTCSTwE7803Rvg6+r66jznVb6zAk2lzWaBk6W446Ys=;
	b=fEdzQh2Ylw/B1pdHAQJMiPF+mz+J9IbM5jofkhRySS2s1v/NBUFJnfTW+rV2vV4PTz
	6CiF3VGw+IL8/wBSSEQCMxl6UWAjldGVXJR64oX4EvOAjnHIuGjvslAYlgNiQA5WBs8B
	i4nOLRcTKNk3+a4DwkU8Ptmm3vfcdDZMRs/YCEA79BYzE9GsUsxtTbgynpI2q/dXK2OW
	hCLij5Ge0YoszKa55QfIjbM2r/Uw5GP5hzCIBVoAKsq6h8HnRRAPQ7IFpzQes8NV6S2T
	CVyvMlCiqgwDYWoZuFagTogwcyLJFHnUll9DhunLUJLMNyuPM7spzo3UpAuJZzRM8Ydn
	JFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RCTCSTwE7803Rvg6+r66jznVb6zAk2lzWaBk6W446Ys=;
	b=BtwIX93d8g7v0cxCcvG91zFw079LAuANmR/aTwKYF7SXAfB/9rYWKiIAkdvvwT+CHt
	zP4jeAlKd2Y6oB5JMfslRfGQECa9gz8wyM4mcfJLQpnSJigQtsBY5Qf6SPRPtM2gHDVX
	KZU5eBy5oM4HDFukqESU1fxJy7N6QbiqIgKRIA597Grw1RPVG9g+FJeGIPe0xIe+fmZ8
	I9CZ3ZCmabmF4n5YT/c7t6wVZlXqGTFevGj6Z7oVDEA1rL3W1/aIFyITTUcPWs+5Est6
	nABVPUat/xKObYGa1/zfBIe+qbk3RZRn24BrZP5U3zcRRRpSFhXfuKTQiK6Zovequ1Tf
	uJwQ==
X-Gm-Message-State: ABUngvf0FqVpmxTT0iwdE25b/1r6oK49EliZVUlNji3ANu9+shnA9RDmrXuDL7C+v59qIbKY
X-Received: by 10.36.20.4 with SMTP id 4mr8277977itg.93.1479472500322;
	Fri, 18 Nov 2016 04:35:00 -0800 (PST)
Received: from pohly-mobl1 (p5DE8EE38.dip0.t-ipconnect.de. [93.232.238.56])
	by smtp.gmail.com with ESMTPSA id l3sm2936735ioa.7.2016.11.18.04.34.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 04:34:59 -0800 (PST)
Message-ID: <1479472496.27625.22.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 18 Nov 2016 13:34:56 +0100
In-Reply-To: <CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
	<CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
	<CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Fri, 18 Nov 2016 12:34:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-17 at 09:24 -0700, Christopher Larson wrote:
> 
> On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>         No, I created a patch, git format-patch and then edit
>         generated files with Upstream-Status tag and added to recipe.
>         Is this wrong?
> 
> As I indicated in my first reply, it’s best to put the tag outside the
> generated patch (above it, or below the —-), as it isn’t part of the
> commit, only part of the patch file.

Now I'm confused. My understanding was that
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations explicitly asks for Upstream-Status in the patch header.

Taking an existing example, is
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch doing it wrong?

>  It’s minor, and you don’t need to re-submit, but in general the tag
> is not part of the commit message. For example, if your patch was
> applied to a git repository with git-am, it’d be in the commit
> message, which should not be the case.

Yes, that's indeed the effect. That has pros (the Upstream-Status tag is
preserved when working with devtool) and cons (patch as attached to a
recipe is not the same as the patch upstream).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




