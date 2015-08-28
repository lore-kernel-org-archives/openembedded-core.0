Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CA6A771633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:24:57 +0000 (UTC)
Received: by qgj62 with SMTP id 62so30035329qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C+8wxftxO/thdAG8tEdClfDhTmRmBKIqJ0RB0L93AAI=;
	b=L+Z3hCrNhv1PvDR9l7crhm8fvv/VpynDDmohAVE56LnbyUcKj/u1tS5+0CLWmwQ01C
	F3NfjBTOVVsnrPel7Bih9RNVDsI1ECi/BuLphcn5Sdc1z4vwkrsrtrCXI2R2g+bYZSdp
	GhHs2pziw6HU0gxQbnXUutgQV8tc/UdBuPkLoML5nB/jxFDsHWOITGld6RVVWqPO43dm
	mxfNOJND6FJEgBlCip4yTOEyJljAZKYLEiGnJAukcJF5xSIHy3yQzBCVxX1QwfmaYjai
	jX10KDPjlLJ6E7f26qVqv47Iz5sgxGFHiaEltduJNB4A/oq+rqWhbAZxFV6V2IZ+1zKO
	7E3w==
X-Received: by 10.140.236.214 with SMTP id h205mr16280517qhc.7.1440771897713; 
	Fri, 28 Aug 2015 07:24:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.167.70 with HTTP; Fri, 28 Aug 2015 07:24:28 -0700 (PDT)
In-Reply-To: <55E05A8F.6060909@collabora.co.uk>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAMKF1so6_ftdkbU5afVrGdnZA9LRDLhktNTgcdnZw2iqrYwSnQ@mail.gmail.com>
	<55E05A8F.6060909@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2015 07:24:28 -0700
Message-ID: <CAMKF1sryjG7ucXjFZA3AuuNHLUgOOJpuFoBuHPRVu+SsT3bcCQ@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Fri, 28 Aug 2015 14:24:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 5:56 AM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
> Hello again,
>
> By the way, Khem, what's new about your systemd update patches?

they are on test branch hopefully landing in master soon

I have
> more patches for dbus recipe, but they depend on a newer systemd, so I
> don't send them in yet.

