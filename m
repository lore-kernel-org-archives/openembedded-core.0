Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 429097F4C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 17:22:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l10so14497359wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8HjB9r6EkLlCqnptBhjZ/z5N4XWnm2rTo8fsx31pshM=;
	b=fZopbRLIeaNxHFKSgoDldYTZD1dBtNVjRUFVxPw2g2gSpFcheY+rnPYNCr7oyk6XJl
	9scLg8s2P87IUrNsDo5I1njKE7JCD2gseoxZYQ0kEfhiuig9clXYs7xk3SXi/5PWbZy0
	XsOi7HXfsr1o0aAOKacy8mmS1p/2Mx4U96kg9gq0eLV5S286L1PPs/YDe7ZPoz4rH2eN
	L2cKYREiRlYZruOAJXF5yeKvXulShsXW5RizD7/FXSd7OA6tCEDg/No/GLgnvUdw1TJ8
	7YjkXc7Eza7+M8YcW8tU9bZ/xQCOR95BYy+0Z7237Mt+6ZkcoQ+mC9mslFXGXaqqeOwl
	+w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8HjB9r6EkLlCqnptBhjZ/z5N4XWnm2rTo8fsx31pshM=;
	b=FCIbwMI8iu7zhDDMUFHqydJh9Xiw1ldLqcXRwTgD1DQiK5gNoGBPnf96PM/4maZlTk
	WwhqdFdYEkMAb8EBMz1AQRcECABEsezz/YAsTXXQVr+37S4WLZY7sb/PZZPIqp4GNMau
	cV+lQg+GYjAbVg/g8XYG/jo07ChsNKHuUWa/+yR2z2EtK7eOtRTq5tKP/MDedWK4IQXq
	5xdCEvAazP5nWbw60CHV0iZucmtQjn9FRKyboHPq9pc02/uu3IsnMnwr55e84trkbU4I
	wCC6hb7j/fTKFUhaXXB0VMIvogMeHPrFTmkBDi9dZ3E7mMKGuH5vxv/iIvl4FBJVxlhL
	FNrw==
X-Gm-Message-State: APjAAAW4JJAy9WaIa8KNKBmRmBLc+UDkxjME43211S9t3Cq2keYg+7NX
	QmEYfT0f/EAAQJcYoKGM9eoDfSxM4qFnsrsT4S4=
X-Google-Smtp-Source: APXvYqxjhQ7kia3bDwt2YaQXdg90nE5HrqI/HYqT0yZRHR4EMaz+tx/BjTFzhk5yc6q6ryXWabdJxLb2jZl30gDKabI=
X-Received: by 2002:adf:db0d:: with SMTP id s13mr20359745wri.319.1571678574000;
	Mon, 21 Oct 2019 10:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
	<db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
	<3caed9f1-e9cf-662b-cf27-876bcab01f9e@intel.com>
In-Reply-To: <3caed9f1-e9cf-662b-cf27-876bcab01f9e@intel.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 21 Oct 2019 12:22:42 -0500
Message-ID: <CAJdd5GajChEpFfuW9LmRgxQo730UiWTiQyeod5QqZDk7HyMsxw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Help with intermittent autobuilder exposed bugs
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
X-List-Received-Date: Mon, 21 Oct 2019 17:22:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 21, 2019 at 11:50 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 20/10/2019 16:54, akuster808 wrote:
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/440
> >> oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
> >> [no open bug?, fedora specific perldoc reproducibility issue]
> > Think its the same as
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13602
>
> Filed as https://bugzilla.yoctoproject.org/show_bug.cgi?id=13606.

I'll look into that one

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

