Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4DA60C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:06:51 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so8274057qaq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1aVU5hz0PFMdlpoiA97Gg7YzzBEJ3mWLYXMGzVYKglE=;
	b=UfXf/ACS9eNuUZ/VzF1mfDguvg1Wa2mV0clP5W2x+BzCeq9XesjkpoGd1bani0eDQb
	+3IYpT09b2fMJCc5Op9YorF036AkNsftWxQGnnE6VcisroDCJWAEzMWmiy3Fv/KRqdVe
	DKm3VxqfCXK4dqhzyk1uOSP1+neucZ7AVO1IXacLPV0AOmtgVDg+2dxjQFQMtQw1+Lz2
	RhE7bTL9ISrSG4ogehfjPLtMZvrQtL4o8R0a7SgjcJO7D7sf2dYu7AQs7q4UPev3XqRr
	nkseNgYd39WTCvoAn2ilkfa1j4WHrb7FCecJbsrcbk6axHiPCj/nsXMuEzrNRy1ZLxEI
	EEhg==
X-Gm-Message-State: ALoCoQntbzhO4lDZjdvRtUkmvz7sdzaSdsSxGI/EK5clA/Yj0E9lbgQkd4DCVgi+7dfKyIMZpPNg
X-Received: by 10.140.81.112 with SMTP id e103mr2822466qgd.99.1396278411702;
	Mon, 31 Mar 2014 08:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 31 Mar 2014 08:06:31 -0700 (PDT)
In-Reply-To: <1396280395-24687-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1396280395-24687-1-git-send-email-Matthieu.Crapet@ingenico.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Mar 2014 16:06:31 +0100
Message-ID: <CAJTo0LYT6Wh-QAY1BXUvy-m+8D5WuW8KWL+0ihT6Qwm9QV6-CA@mail.gmail.com>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libomxil-0.9.3: fix configure unrecognised option
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
X-List-Received-Date: Mon, 31 Mar 2014 15:06:54 -0000
Content-Type: text/plain; charset=UTF-8

On 31 March 2014 16:39, Matthieu Crapet <Matthieu.Crapet@ingenico.com> wrote:
> -EXTRA_OECONF += "--disable-ffmpegcomponents --disable-Werror"
> +EXTRA_OECONF += "--disable-doc --disable-Werror"

--disable-doc is new but wasn't mentioned in the commit message,
please explain why it was added.

Ross

