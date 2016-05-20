Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 92E9765CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 11:13:46 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id x19so173625144oix.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wk8b9MJDH4h196x37r4b1obo0CpCBaxSnj0KnAgEQ7E=;
	b=2Pgeq51AWd3IMoKY8KAnJPJ8F35VMeQTIRB7wTU2/fA7RvBZiWFoN3floNPU+TQ4FL
	lVKQ/UBqPT2ugdCoL0oGtPB8EEuUDFW3a1Hy0gxAfQ0jwVDTgCwCkihG319icFAOSdMj
	Wvhe6HMYCEsCH7KvGBFIx5JI6xM1fQ0sX8Eo6w9u5IVMNYSedHtw8jTlaz3pKvP8K3/n
	9K4W0cRA8PSK2pwqHSG4eIgfwc2OTgLt5qaMvjzE5I4lwStk46ZVMAtlBqFpf3d5dt6e
	+tRV2SMj/Mgvo73FKsh2M3iX7xdZkxmHy1fakO1ZjUjbsu3DRN7Inad9zIsoZgHt7CXo
	jCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wk8b9MJDH4h196x37r4b1obo0CpCBaxSnj0KnAgEQ7E=;
	b=Ktzv8oz6YxQZFSE3kUsCV2jD9OifnhlkFA+z6iw8yQ3ssuQqXk4M1ahGEcKNvputUw
	HJnEc7LGdf0sOH1CwFxXsJ3gSIcSFhdvs7xWZROss5vMIrndQYm/uIWNA8bWf6P6L7DM
	4kILy4b/TcoZFAgB65boGbHratI/8AkDJhAKLfvs+QNfrInsNYnCISU7ZXwNfhLHhBtk
	mSRCwJnMqE8cW6IZ/fP3ybCzaM84bZXYu0KmlCt/J1nPOO3wy3eKpSGOtFUbe2KQ/sg8
	8Y6clxGnMdQwH22xY0c5rFZUmOCZMwYFkctLb0pkLZGXbecEF1LM1VL0ICIoKbKoMzen
	gSZw==
X-Gm-Message-State: AOPr4FWL/9BjAoIXxP0l+UoDLVBXNC2HXft9UTKdyfrkw77Pp8ZWmPFVa9X5Y54UGO6BK1TAsK/l01ektxMtTdU/
X-Received: by 10.202.187.10 with SMTP id l10mr1519059oif.125.1463742826648;
	Fri, 20 May 2016 04:13:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 20 May 2016 04:13:17 -0700 (PDT)
In-Reply-To: <1462353116-7481-1-git-send-email-awais_belal@mentor.com>
References: <1462353116-7481-1-git-send-email-awais_belal@mentor.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 20 May 2016 14:13:17 +0300
Message-ID: <CAHiDW_FoogPN+yji_4wC6qz=AvfBTgjjR1aKB2Dziy_ou-XF8w@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH v2 1/2] mesa-demos: remove demos using obsolete screen surface
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
X-List-Received-Date: Fri, 20 May 2016 11:13:48 -0000
Content-Type: text/plain; charset=UTF-8

On 4 May 2016 at 12:11, Awais Belal <awais_belal@mentor.com> wrote:
> The mesa surface EGL_MESA_screen_surface was obsoleted
> and then dropped from mesa some time ago. Drop demos
> depending on this.

This is included in the mesa-demos release from end of last year? The
upgrade looks non-trivial with the amount of patching we do but it's
still the right thing to do instead of  backporting patches on top of
earlier patches.

I'm looking at the upgrade right now -- it shouldn't hurt if this goes
to master but it does look like I will end up removing it with the
upgrade.

Jussi

