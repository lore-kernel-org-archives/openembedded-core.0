Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A2EB373D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:41:15 +0000 (UTC)
Received: by ioii196 with SMTP id i196so64111054ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=c02COVP0oToV305P0nXb6hvu+uxQm5x70sRdQJG6P/4=;
	b=AI7svVPaq+fAqy2JtyDizfp6VpSEryrQR8deKAzF/AwV26a4Km19WHfftS7nfpS/nF
	jcb6/TAUAiMGRM+otDMcz6xaMGPA7MtgTxZl/0bKOz+BIs5njciJ0swbfbEduZwqbeMA
	dN7tBSeDfRhswJjChidbxWoSqgSVQcUxU6moPJXzfuwULSdMeKjGI8D/ECuijNkLl5/A
	jpRXsE5PExAzLkB/48QoKPW11q4Sbug2PCcTRICNSKe5zgewLf1A0rNeu7zTuMV9z7E/
	T9AyZXVUjblSAhR5zgUpMb9FAdhPFcGQb8o000hHP39f/1gDh6AG8GbKY6ApbW/WWUaE
	tKPA==
X-Gm-Message-State: ALoCoQmRnJW0JM8KQI0DhcbOwq681uiSF3SY6dPNbiZ9sIX2Os/5LnqGkJqg+8ivzLWK8eEAdFnH
X-Received: by 10.107.19.70 with SMTP id b67mr14729023ioj.144.1442598074978;
	Fri, 18 Sep 2015 10:41:14 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	kb10sm6977961igb.4.2015.09.18.10.41.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:41:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so22350210igx.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:41:13 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.80.83 with SMTP id p19mr275312igx.5.1442598073394; Fri,
	18 Sep 2015 10:41:13 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 10:41:13 -0700 (PDT)
In-Reply-To: <23c032400177dc29dceb7d374806abc1edf284f6.1442576806.git.patrick.ohly@intel.com>
References: <cover.1442576806.git.patrick.ohly@intel.com>
	<3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
	<23c032400177dc29dceb7d374806abc1edf284f6.1442576806.git.patrick.ohly@intel.com>
Date: Fri, 18 Sep 2015 14:41:13 -0300
Message-ID: <CAP9ODKo7Rwg5Qz1iAFpoB5yAGNAFJkVJS1=3T-65u9Ci8hbDyg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] initramfs-framework: better error reporting for invalid root boot parameter
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
X-List-Received-Date: Fri, 18 Sep 2015 17:41:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 8:49 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> When the "boot" parameter refers to a non-existent device, the only
> visible output at normal log levels was a rather confusing:
>    ERROR: There's no '/dev' on rootfs.
>
> That's because the actual error, not being able to find the root
> device, was only a debug message, which gets ignored in the default
> mode.
>
> Promoting the "root '$bootparam_root' doesn't exist." message from
> "debug" to "msg" gives sufficient context to understand the error. A
> more intrusive change would be to change also the control flow.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

