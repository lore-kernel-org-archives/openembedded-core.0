Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id B78666E766
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 12:25:05 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id r5so954745qcx.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eczbdmWHdAnfvceu1YoTo2YTqetj5pzPGc5Auz8h2AI=;
	b=DBOs/VDWu5NCLMxy4Tv+OvctKvv+gLma4FXiW777NSv7GOi3NPUYRknRhhiX2kD0Yw
	J3ncXBqGgst5DzWkviCKm9EL6knqwX9tot22mSrJgiDpgLkUBJ62SkS3HcPIua7s4IX2
	X9lKQ1hsgTIZbXsjvGGPRswb5iwCpwdhJ18St4OgD8ldHlYJNxulW0Sjw0BsdF9/1VGl
	JO4eln8YY9Nx22QL8MDWL6pb7mYHffl1zEkz6gpbrRkXWl/0TVoNe9hVpI1jIyTHXm//
	FxAGTScFT9/eb7oiK0nu+6B3+1u5ezK9x/tV4wN4Ln/AzKgbSApanGYEo087W1Pl3RRC
	a0vQ==
X-Gm-Message-State: ALoCoQnFzRZajmNMqk+7GSJunk+xoPSzNT0NJeDKDGnS+yETajfeV1qKkDOxNv3vUakwvKs7pm6s
X-Received: by 10.140.98.203 with SMTP id o69mr8650448qge.102.1392985506578;
	Fri, 21 Feb 2014 04:25:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 21 Feb 2014 04:24:46 -0800 (PST)
In-Reply-To: <1392862269-14520-2-git-send-email-kai.kang@windriver.com>
References: <1392862269-14520-1-git-send-email-kai.kang@windriver.com>
	<1392862269-14520-2-git-send-email-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Feb 2014 12:24:46 +0000
Message-ID: <CAJTo0La-1RUXKdmc6=OtFrvQ7CK6fs+9NSxzZJfQ_QxEJrFrWQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] update-rc.d.bbclass: fix inhibit check
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
X-List-Received-Date: Fri, 21 Feb 2014 12:25:09 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2014 02:11, Kai Kang <kai.kang@windriver.com> wrote:
> In update-rc.d.bbclass it checks variable INHIBIT_UPDATERCD_BBCLASS to
> inhibit from inheriting this class. But it is wrong logic that when
> 'sysvinit' is in 'DISTRO_FEATURES', INHIBIT_UPDATERCD_BBCLASS will not
> be checked.

Not sure what I was thinking there, well spotted.

Reviewed-by: Ross Burton <ross.burton@intel.com>

Ross

