Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60DB87997C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 12:06:10 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l14so7592882ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vxEbAMH2vrYVoI7QnEJz7GgxxdwTwI65fczqCrn5sSE=;
	b=0JYQUWFbrEcxQ/9mqKdEZa69gIRkPC5pgfgmmuVyPE0yj81RkLcXAdWX6UONT4Pa0h
	peW7TBq0k8+ZGbFk3rxhZUuom8tyDUgHmAM/oUdUE3rm9CYU70vSfvASP/KOgG1KAPJX
	QSWzeJeG7ubMtLJJmbu61ZMjzO0uHjPdIEWFOsYaaZkHKmBgzPBiccjh8zmf8LEUP7L4
	+1/thMG8cj4IDVVGtsvpggqxfkKc1S9xDky/bQsAD/Vb+ZJ8p4kKnjdccNNzArc9CnVh
	4od704STt3wm4G2dvI/fEK+toPjiXgtKlJhdu3X6fJXjSi9tGsmcBA5in4RK17p3mXlT
	+ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vxEbAMH2vrYVoI7QnEJz7GgxxdwTwI65fczqCrn5sSE=;
	b=SvEIV6dm+zddbnA+ji0/BZpW3ea9JsRM7UbWLl1wE4ugwdwIMEO8PAa67xyJP3cPgU
	9NJpWM/CTcTCmQdU/iMQhj/Sp08EQDjnQQ7bAJyeYqaWGQDflVxVl1oFSvq8+0m6JSq+
	uQ2A/EBtXE/W6kRkVQpx2cCRvtJQxvj+OwqTod7jUsRidtH6Ii/m4l8xeL1jvINN/vuJ
	GUKwmHiTmKo5bCNW7gxwm16QUNcd4tbF4u2KF/CpKCzUEnAcpxtnacv1PwDB6+Vst1hB
	e4zKzt0vtu7R8frl6rAV+08szEldiWAxfMf/ZQygnunNe0zXSu0CIXa27ReSyRBjPpOc
	foeQ==
X-Gm-Message-State: AJcUukflb8iLPniuOQPMErXeOVBYaCudRZIashGgaSdZfJEsdjlFOGYb
	C5NNMEVuhMQ+irPmnA0gAgI9YtDs1Y5Cuu2W6u8Lvw==
X-Google-Smtp-Source: ALg8bN7oZZ897jfHBOmGuGbpjuXlMFvrXf4Kh2gXJZgMmlPxiz+6vM1ljcUwBoe7C/G9lHrtVU+yuAFf4Pa+S+akki4=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr7075101iom.201.1547726771333; 
	Thu, 17 Jan 2019 04:06:11 -0800 (PST)
MIME-Version: 1.0
References: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
	<1547718761-239575-1-git-send-email-changqing.li@windriver.com>
	<1547718761-239575-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1547718761-239575-2-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Jan 2019 12:06:00 +0000
Message-ID: <CAJTo0LZKFXDNUUvo==S+7BjM1s5OZxOffq-einXho6M9A8mvyg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] populate_sdk_base: provide options to set sdk type
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
X-List-Received-Date: Thu, 17 Jan 2019 12:06:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Jan 2019 at 09:53, <changqing.li@windriver.com> wrote:
> +OVERRIDES_append = ":${SDK_ARCHIVE_TYPE}"

Pretty sure RP will reject the patch based on this.  Adding overrides
is not to be taken lightly.  Should be simple enough to rewrite the
logic to not use overrides directly.

Ross

