Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 072436FD5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 22:50:05 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so3047912qga.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 15:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cPpEloP5B51nBFmahbXnhsdCuH4h3V6+guGaHtc1lc4=;
	b=LBj5/7APuERJZZtVdzu2zpuzn6UJh2DVQtVO87m/YxUu5qDrDFdnzqBjngYWNsPORa
	cu5OIIPJ/WuFHLGp93ttSriLTaEn3XK3dAIdgQKqI19Is6N+YTQfr9MUj6kmaP2ZyCtB
	azM1FJer3dLP7EQyohFWKEEudJPq5pZpk9e9PIQj4jCFkdLfDerpgmffKgsABzaGu883
	K0qK/DeXPsF80Pyh5G0KBIT2UBrkUpqSuHU9LXnKakUdVUFJ8Vlozp8rSyAGDKxv/OPi
	m6Wteoq7CKz1JQ61k5CpGIe96vyXKY5aMWqLcSn1sy5zco/YLnRYoRaIxqhwUHDe+DKU
	CdEg==
X-Gm-Message-State: ALoCoQlcENrMGig2xCvfbZ/vsZ8ZqyxyrRiYKQsvY7L9kAutso+8aVzI6VkhOyzdRy9idJe/PXht
X-Received: by 10.140.48.161 with SMTP id o30mr14596568qga.68.1401403806426;
	Thu, 29 May 2014 15:50:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 29 May 2014 15:49:46 -0700 (PDT)
In-Reply-To: <1401373808-24609-2-git-send-email-ticotimo@gmail.com>
References: <1401373808-24609-1-git-send-email-ticotimo@gmail.com>
	<1401373808-24609-2-git-send-email-ticotimo@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 May 2014 23:49:46 +0100
Message-ID: <CAJTo0LZ=jrroBnDG272i7TaZ3zkoZsoQJRHVi0QN7ixF77EE+Q@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] weston: fix make-lcms-configurable.patch
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
X-List-Received-Date: Thu, 29 May 2014 22:50:09 -0000
Content-Type: text/plain; charset=UTF-8

On 29 May 2014 15:30, Tim Orling <ticotimo@gmail.com> wrote:
> In AS_IF([test "x$enable_lcms" != "no"],
> "no" should have been "xno"

This patch doesn't quite satisfy the general goal we have of being
fully deterministic: if --enable-lcms is specified but the lcms
dependency isn't satisfied (i.e. it gained a version requirement and
we didn't have it) then configure would happily and silently disable
lcms.

A small tweak so that it's a fatal error if lcms is specified but the
deps are not present would be good.  Also have you approached upstream
about this patch?

Ross

