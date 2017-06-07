Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5FE4780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:43:04 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id b184so8685212ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bDa/tjwAP+MgAxZnBeoxhBMgiKP5yqJug7ZULj4CNmw=;
	b=YNuVeU3w2uwQgHYMZ3uJPjrmOb4sWn1F+EaiyMA+ksNYs5Eww3cKwzX8sHfzIP1I5M
	/2UcLLXP32a6LEFwxEg82xBraRh10bZrX1GqP1KlUDysCYLOrly2iBPmmJW9c5LJrg4Z
	L1eUKDgfMDWKoKUa1R2b0YZjuKslnJYQQuRQlN/WDpp4+RvOszsWcZx2wL7eS3ugIKi2
	sDUlS0TBucB+4dKj0bhAuPKm+nhu46iOZtMjl3+V3flffLJ4Awq/xAKQFFrsR1esu7Wx
	4mqmQCn82KOvZlGiZFrf8KYVomoLso49y3ZAWqGSWXdO8u65Zfu7iIImNevmtIqOsAww
	QGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bDa/tjwAP+MgAxZnBeoxhBMgiKP5yqJug7ZULj4CNmw=;
	b=fCoMjVwv0numwj/9KttZOYGM89OAPe/uWoGeQbHtiHXOGFsvn8ciqbnMarPUDfdoV6
	Fxd3kdyiJ+1YeXEc7z0J0Dcfxz1upRx8Ptpi2C/Rvfr6bu96mMmh0jpSE8fgiDCwHW2U
	wrZFoB4771xd/31MtAUXytJ4kFNAUq2oS3QqTy6JYIg2pPlhk2FjR132p5m0ZiDVzzNW
	YK/hFOifj7SDk8UjAgnjf1w5T1SnyLGnEIlreWRv8KSl7eg12ULQ4TX7NVrfNRz0rW1j
	dx1E2DqDOfUEIRWcU18aRNRvwG9XvS0PPcb6fWJM5tDcboRwhbLdDsSFjJr1HODkGafL
	m4dg==
X-Gm-Message-State: AODbwcAY6mpmfm3v78DjM3pD5B5qJRiwtnKWv4ZDm/JmauigjlABQpUn
	5lv1MEc2EGEx1Q==
X-Received: by 10.107.167.197 with SMTP id q188mr30850284ioe.110.1496850185813;
	Wed, 07 Jun 2017 08:43:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y40sm10808870ita.2.2017.06.07.08.43.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Jun 2017 08:43:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1496850184.21235.1.camel@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 07 Jun 2017 10:43:04 -0500
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Wed, 07 Jun 2017 15:43:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> As discussed in the "[Openembedded-architecture] Yocto Compatible 2.0
> + signature changes" mail thread, changes in a .bbappend cannot be
> done unconditionally. Making _append and _remove depend on overrides
> which get set based on DISTRO_FEATURES is one way of achieving this.
> 
> The oe.utils.optional_includes() helper function has not been
> discussed before. It's an attempt to address concerns by developers
> that having to write code for (potentially complex) condition
> checking
> is error prone and hard to read.

I promise I'm not trying to start a flame war here, and perhaps there
is history behind this that I'm not aware of but...

Why doesn't bitbake support some sort of "if" statement? It seems like
most of what we are trying to do could be accomplished with much less
fuss if one could simply do this in the bb file:

 if bb.utils.contains('DISTRO_FEATURES', 'my-feature', d):
    include foo.inc

One could even eliminate the separate inc file and simply put its
contents under the conditional (as much fun as it seems to have to open
a new file just to see what a recipe is doing with a distro feature...)

It would also appear that this could make a lot of other things simpler
as well (and may even negate the need to backfill DISTRO_FEATURES into
overrides?)


> 
> It depends on the bitbake enhancement that allows including multiple
> files at once.
> 
> Patrick Ohly (2):
>   bitbake.conf: DISTRO_FEATURES as overrides
>   utils.py: helper function for optional include files
> 
>  meta/conf/bitbake.conf | 17 ++++++++++++++++-
>  meta/lib/oe/utils.py   | 29 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> base-commit: 49c255494c1d0704a1c8c428281c81541b05dc3e
> -- 
> git-series 0.9.1


