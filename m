Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 037E1606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 10:56:07 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id w7-v6so12569392itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Af3isX5pQlT4SB1xyNBrk8WeGjtj9X7flXlclENAhkI=;
	b=AzwFcnaIbE2ZUxKy/dtuAYRdWU3KcXM/B8WSjcpEMelAUXSxIP8aIfnYVTXjP7mLLt
	khLs9l4ZkoqUNa7IYgZD3oMycQnWxIO+0ASXwR7znKXFDScUrendtTod0FsyM4uUGN/O
	emTB5UaWz8mdhIXBnmw0nAf+AThDTjOLWq5vtfPGMhgg+74Z5LFfPgS23VXvPlX95rt0
	jxlz4BBMoxdkIeWwU1cozwnA27S9r3D0VhbHRQGP0AX5uTGHtPbYWYaj4+hxcbj1ikXF
	+Qn/tbIseD056FUHBT38GQzQVkI/kLEcljU0luvBultWoo5lhMFOs/DypV2GxtTA4zDs
	MeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Af3isX5pQlT4SB1xyNBrk8WeGjtj9X7flXlclENAhkI=;
	b=bRmVqlXx+OmK75JuwUSqByF94ENUyqZyZdBo2Fn274mZezNCVLCyOeyHLjvM8LHFo+
	4WoSO2gAuPuQ7Efu7lF5mTC3XT4KMOCcmOVshi/7ySs0/UsjqGAXiWkfUteaDuReLStO
	hKnfT4qng9GbE7M11lf48XOusyZ/ATh+Tu8xeNPRlqPyjd3DZt9RdWsukf9wKDmdfJHb
	AIepbjhaYwTRfbytxmsTGAoJTLfzGsSFCaDylndG/1tBNjOkB+OB3OlCogTiIJkXK3qH
	AmDPKyUG6l6NK7H0tGuObRzPt9ZTsoR42hV2TVWqQAheBpT+gBNUwBDdTbcWtM0zy7sq
	560Q==
X-Gm-Message-State: AGRZ1gKQ77ZFmzs03rKSU+u3sOi9c14MINtgzKP50o9EDC/gcjjXKUBf
	idglDjSmcLpFdw/yUPJUUz2B+hhitrmFM17eHuB+/g==
X-Google-Smtp-Source: AJdET5ey9QX3FBrHhKYePx28uyR3hruqKDRj+2D3uo/hgPQnrJOoNnmDRowgOUSDkieasot7mIAcej+16YC/PKbMdG4=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr12099549ite.130.1542020169075; 
	Mon, 12 Nov 2018 02:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20181111153414.26447-1-niko.mauno@iki.fi>
In-Reply-To: <20181111153414.26447-1-niko.mauno@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2018 10:55:58 +0000
Message-ID: <CAJTo0LY05Mv=zODUjoA8C_tGvRe9eK2zfi1XuF-O7dH4SwD_jQ@mail.gmail.com>
To: Niko Mauno <niko.mauno@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: Fix update-alternatives link relocation
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
X-List-Received-Date: Mon, 12 Nov 2018 10:56:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Nov 2018 at 15:44, Niko Mauno <niko.mauno@iki.fi> wrote:
> +Upstream-Status: Pending

I saw you post this to yocto@, so this is definitely Submitted.

Apart from that thanks for fixing the actual problem.

Ross

Ross

