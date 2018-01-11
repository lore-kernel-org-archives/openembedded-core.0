Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 98E8A6059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 18:52:02 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id i196so2795483pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 10:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y99PpNr+qQf3vCIzsJBFBjoJ0Qy0Rq6McAfWaHQfJVE=;
	b=mp4CSlfuyGKC0MzVjXY12ZIZuJbI0DRgJwaEcOgmgfvjiYjy/acbes7MzFuyIS7p7p
	APQ9c/QfimDnbTohwaCAej6WyS8f56XyjxJAEWWCGK9yVNBM6CDmP49TaeXmqmn6UyZZ
	a+Us1BBUPemfJe7XQkLi5vmL4xaVeNxccSWW5NqFCVMgTHEfjEvOEM6RCrgm/maoJx21
	x+mmyOfwx6PFCb3CH7EF5tlR+0NTSStO5SViUHz2JEa7aAqVfVwFk0XtXzPn3nujOkzT
	eaWX9C1M2bsutdCY3iF/r2rv87zmmxslzMlVlH+ksnmKJDi3+LQN2nhDa708STl0R5qp
	O2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y99PpNr+qQf3vCIzsJBFBjoJ0Qy0Rq6McAfWaHQfJVE=;
	b=cHcFoRAe64qBAyVDxkFxdCm6ZlPgueO4wNT10Uo2qYT+iM3CbTLSTnw+DuCpIy9mH3
	Vd2TJMjLMoCrmQrKyFGgtO3PNEaL3rAUeh7X+pqobmDYKkE7mszgEquDHOCWdYbovSLE
	zJgju/8jHNYIeY53FpIn9Ueya95LzZAa0I5HOXit4p5rwn3w9ig/1xAVMdA+6KskrxBP
	MubQgAumcUdyFS5T9yiWQyp9V/OFexr+z09fKnEgsByiRGb83LCoL2yHJgO1kMFLKaVc
	ABfHZI+721kBjv5sGz0LCaWO5uKmA5yG9ShMCfSoaErKM3bTMHTqgcHgLKKtXq6bDfe7
	sFyQ==
X-Gm-Message-State: AKwxytcveAO/JqMQhSQbANDlGl1XVW5pWuTBWII5XmNPjmpn8PzDYKpu
	x5CwYAoXK8E3jGHXflsBiqzz1PmBvaSDc59mD+E=
X-Google-Smtp-Source: ACJfBovOj+KZWzLQF/6cB2L2ysepf/AcV/D8a/t3d33uCLZx7npLxFfVH6KNRP8chGCv3vcWguudQ2mG9rTnEqtF81w=
X-Received: by 10.98.156.71 with SMTP id f68mr1556974pfe.29.1515696723724;
	Thu, 11 Jan 2018 10:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 11 Jan 2018 10:51:33 -0800 (PST)
In-Reply-To: <CAHUNapSrfg-6Tx5iL__ymHj6GdkLhSNnuG095Oi+Gsf4Ft9kfQ@mail.gmail.com>
References: <CAHUNapSrfg-6Tx5iL__ymHj6GdkLhSNnuG095Oi+Gsf4Ft9kfQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2018 10:51:33 -0800
Message-ID: <CAMKF1sp7B0FcqEuGpJFpvhMQEnjJN2VkqP17Ue9ZjxODwtFz4w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: uriparser
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
X-List-Received-Date: Thu, 11 Jan 2018 18:52:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 10, 2018 at 11:20 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Hi Martin,
>
> Any chance the uriparser recipe from meta-luneui
> (https://layers.openembedded.org/layerindex/recipe/32523/) could be added to
> openembedded-core (or meta-openembedded?). It's also now needed for the git
> version of tpm2-tss in meta-measured.
>

I think meta-oe might be ok. If nothing in OE-Core needs it yet then I
dont think it
should be on oe-core

> Best regards,
>      Trevor
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

