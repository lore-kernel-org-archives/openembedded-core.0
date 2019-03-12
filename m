Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF1A57C5DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 04:09:59 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z17so1133678qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 21:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e6LakRYRFDsFTnqFHNBVrzfNMKM8NpCv7nV7tBn7HmA=;
	b=GuFmOX78xcEn1tUL96JuDwCUResCW5lC3ufwqUPJOa8DD5BbQenIlyMmQXEqSz5Yb+
	i1cf5ARqaKBuqO0vjokAkrGd8s1CrJyi10bE5YtrArMmrzjId29g4qUwqesVxvcexgWS
	a/uzRLLoGw7i9lTlcOSxy1FvaJmaBDYKcv1gA97hWSlGaroCWAEVh8uhlBgq/1bsm0pj
	ONTpRuHWppUvWPhhFc42eTs8GKJnyI0rxNy13VLWQv294PN7nNM1HOwzi0zSmBSFoaop
	obIh0C3lzAnbeAN6yxNwtbuTgjORXoviDkzK9Yguwq4DN+HNGesibaP3tXvPcnJyjn35
	DCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e6LakRYRFDsFTnqFHNBVrzfNMKM8NpCv7nV7tBn7HmA=;
	b=jC0LqAHpx/dCI5YdNwQNX7R63coGe8j43jMw94JA0fbrhK+L505kcX5Y3HG6qoo6Xm
	oYuMh8GQ836OofI2Hf005OSgAZK0WuOi2cS5IO4z5iBD50KT7BtF9i/P1UqsM3YeO2/F
	QS77ovMRIpmoQuzKwR3T67tqG+w45IiIxSAKLJtULohtc/Ujw8uzj3uvk/yvD7aozZg5
	PF63W7cNLHg8LYsgEpD4m+f6dtWGHJ9qzWLBMUBsqcpz6BrTS3Ptd4Z8szs2nukFYC+f
	v97YVD9/4c8//l94WPoiTmMHCOUHwciOtEvAU1VXX0PMafzjy5N6kepFxBNnUdGguiIK
	F9nA==
X-Gm-Message-State: APjAAAUTV9wR7Anv+t9bF/FYpHJ0oIVZnPq9WefeVYixpzcxjj9du6Y5
	VunDLsC0S/P5yQ5azQsOsP/2/4vAhy5QQNOcfwA=
X-Google-Smtp-Source: APXvYqw8zwzFuHpnkavcFHB4CfpmAGmbCDBHgPxlyZrXP0MJMlXBz4uIvjmJyXAzWwSdzvJ6K8LRreCYRXi4JYLR6jo=
X-Received: by 2002:a0c:ba1d:: with SMTP id w29mr28817462qvf.228.1552363800561;
	Mon, 11 Mar 2019 21:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190311055151.31185-1-douglas.royds@taitradio.com>
	<CAMKF1sr0Gce=7VFVU76TDSz0Nc6mDWNO2-ZCzVzZkGS4cQuuTQ@mail.gmail.com>
	<54c2ba97-8701-169f-37b0-924da1e89c09@taitradio.com>
In-Reply-To: <54c2ba97-8701-169f-37b0-924da1e89c09@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Mar 2019 21:09:34 -0700
Message-ID: <CAMKF1sp=gkVJ5H0sa41K=dVWsGg5tE4LOMvGn8Qzz3kzEik_Xg@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Reduce verbosity for make invocation
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
X-List-Received-Date: Tue, 12 Mar 2019 04:10:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 11, 2019 at 5:47 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> On 12/03/19 6:18 AM, Khem Raj wrote:
>
> On Sun, Mar 10, 2019 at 10:53 PM Douglas Royds
> <douglas.royds@taitradio.com> wrote:
>
> Since the dawn of time, we have set CMAKE_VERBOSE_MAKEFILE=1 in cmake.bbclass.
> Back in 2016, we also explicitly set VERBOSE=1 in cmake_do_compile(),
> to ensure that make (and ninja) output were verbose in log.do_compile.
>
> Turning off CMAKE_VERBOSE_MAKEFILE=1 means that make (or ninja)
> invocations from the command-line are non-verbose,
> giving CMake's default human-readable output on the terminal instead.
> The user can still invoke VERBOSE=1 make if they do want verbose output.
> This has no effect on the verbose output that goes into the logs.
>
> I think it would be better to have knob to turn is on and off both on
> console and log files.
>
>
> If you want it on for some reason, you can turn it on in your local.conf:
>
> EXTRA_OECMAKE_append=" -DCMAKE_VERBOSE_MAKEFILE=1"
>
> Alternatively, you can turn verbosity on for a single invocation (this is what I do when I need it):
>
> make VERBOSE=1
>
> You can also set an environment variable to make it always verbose, if you want that for some reason:
>
> VERBOSE=1 make
>
> Do we really need a new variable for this?

its fine if we can ensure consistent behaviour, I dont like the fact that
cmdline output would be different than whats stored in log files.

