Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A53E7D01A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:05:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so8178714iom.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e6lO9HcqtUtX6CQ95MBzW2Ix06mlkXj0P25Fh1pjA98=;
	b=tmr2gi/VCFgfBcTIcnNh3nrlzM/6zXshY+IgpaVe0ZNAEps6fFXX4SdssQi1IH23PD
	Nj/+Up1JVt0AAbuChVQbfWxhu5IC0vJNPmDFRH89oleDwbdimVqrKeEgLQpeYnM3IDFK
	tYIs+RffmGNWRvJ59Uwx+UyNl0z38+IsyTmx+prfPnYzLL7FhyqPsSqu7ySP+E4e+w7d
	zbYRH9iD5Xe3r+G1WcZF3Y9e1cDt+xxmIVg1DrW0LgFyen4yFt8h/0nUfOH4WZLZvTN0
	uhwR3WX6MgHUJTIklIuFiURLF2fAMD3ORa6BLwc+5LP5vCKkyShWudCqMzof7lxHp4zE
	TuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e6lO9HcqtUtX6CQ95MBzW2Ix06mlkXj0P25Fh1pjA98=;
	b=LFM4S5MyeGHLe/R0+/AaC4uOC1SJSJwYYaXYXdTo2rk93Pj3pKaAIpMTBdWoJV8VjF
	WJWrYC2px6cr/ReNui/yyrhpGUL5dFObjh7ceCqiEKTdna8jlS76boOzcvbqvr8vGpjo
	AcRAnoPDjvt0jH4hfV3lUHGHSv+gTtnB4VZ9enhaTzF6ue24FowLiWavsxcPd1xvV9BX
	qODxk20EKgCeLqMhmcjh0FZR1dXitBBtJLkv2JmfKtXvhpPVLtvN12O7FcicbQbNNGu0
	zu094h+PvpVRWPiBJHJBD00Tcbh5dBA7/a8gxLDuo6NMSFM0cOCWZI8/V/YOf2Y5iDkG
	I5UQ==
X-Gm-Message-State: APjAAAUVe4B0fCU4bqZt1DjsioQNWXQwCEUiFOCTb4Rl2M9kdzTTJYIq
	lyqzUSjysjZpItBfH7dtdKM40+3OfQ2KNnZ+5DVcXg==
X-Google-Smtp-Source: APXvYqyp7YbkRBbHFhJ1UO235RPrdFfHBwBOV51z+MbD7ckyoDiJxynChOCGyYCirCZ8b3zPqIjOqKADaynU4hyiQHo=
X-Received: by 2002:a5d:9b15:: with SMTP id y21mr28981149ion.167.1554134701977;
	Mon, 01 Apr 2019 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
	<25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
	<09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
	<CANNYZj9rmK_hmgT9gS_tbZpOdMepq_F58=ux_N5F1oY7zwy_KA@mail.gmail.com>
In-Reply-To: <CANNYZj9rmK_hmgT9gS_tbZpOdMepq_F58=ux_N5F1oY7zwy_KA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 17:04:48 +0100
Message-ID: <CAJTo0LY-zE3PaRRs0gguBJJtacOBAM716GDWLchgVD-dFpNrQg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 16:05:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 16:58, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> It does not look like a hard dependency.
>
> configure.ac has:
> AC_ARG_ENABLE([external_ell], AC_HELP_STRING([--enable-external-ell],
>
> So you can make it a PACKAGECONFIG option, disabled by default. It's
> fine to have oe-core packages conditionally depend on things in
> meta-oe, if the condition defaults to disable.

That's not right: that's the toggle between "a system-provided ell" or
"you have checked out ell into the source tree".

https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8452a7f34907472c5e21c334673afd10df409eef

We'll need to bring ell.bb into oe-core too.

Ross

